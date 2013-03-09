From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  9 Mar 2013 19:21:27 +0100
Subject: [Buildroot] [PATCH 2/5] alsa-lib: fix noMMU build
In-Reply-To: <1362853290-15592-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362853290-15592-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362853290-15592-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to use vfork() instead of fork().

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/alsa-lib/alsa-lib-no-mmu.patch |   44 ++++++++++++++++++++++++++++++++
 package/alsa-lib/alsa-lib.mk           |    1 +
 2 files changed, 45 insertions(+)
 create mode 100644 package/alsa-lib/alsa-lib-no-mmu.patch

diff --git a/package/alsa-lib/alsa-lib-no-mmu.patch b/package/alsa-lib/alsa-lib-no-mmu.patch
new file mode 100644
index 0000000..317676a
--- /dev/null
+++ b/package/alsa-lib/alsa-lib-no-mmu.patch
@@ -0,0 +1,44 @@
+Don't use fork() on noMMU platforms
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: alsa-lib-1.0.26/configure.in
+===================================================================
+--- alsa-lib-1.0.26.orig/configure.in	2012-09-06 10:55:14.000000000 +0200
++++ alsa-lib-1.0.26/configure.in	2013-03-09 16:22:08.000000000 +0100
+@@ -66,6 +66,8 @@
+ AM_CONDITIONAL(ALSA_HSEARCH_R, [test "x$HAVE_HSEARCH_R" != xyes])
+ AC_CHECK_FUNCS([uselocale])
+ 
++AC_CHECK_FUNC([fork])
++
+ SAVE_LIBRARY_VERSION
+ AC_SUBST(LIBTOOL_VERSION_INFO)
+ 
+Index: alsa-lib-1.0.26/src/pcm/pcm_direct.c
+===================================================================
+--- alsa-lib-1.0.26.orig/src/pcm/pcm_direct.c	2012-09-06 10:55:14.000000000 +0200
++++ alsa-lib-1.0.26/src/pcm/pcm_direct.c	2013-03-09 16:22:51.000000000 +0100
+@@ -424,13 +424,21 @@
+ 		close(dmix->server_fd);
+ 		return ret;
+ 	}
+-	
++
++#ifdef HAVE_FORK
+ 	ret = fork();
++#else
++	ret = vfork();
++#endif
+ 	if (ret < 0) {
+ 		close(dmix->server_fd);
+ 		return ret;
+ 	} else if (ret == 0) {
++#ifdef HAVE_FORK
+ 		ret = fork();
++#else
++		ret = vfork();
++#endif
+ 		if (ret == 0)
+ 			server_job(dmix);
+ 		_exit(EXIT_SUCCESS);
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index ba222db..2856407 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -11,6 +11,7 @@ ALSA_LIB_LICENSE = LGPLv2.1+
 ALSA_LIB_LICENSE_FILES = COPYING
 ALSA_LIB_INSTALL_STAGING = YES
 ALSA_LIB_CFLAGS=$(TARGET_CFLAGS)
+ALSA_LIB_AUTORECONF = YES
 ALSA_LIB_CONF_OPT = --with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEVDIR)) \
 		    --with-pcm-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS))" \
 		    --with-ctl-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS))" \
-- 
1.7.9.5
