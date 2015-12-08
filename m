From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  9 Dec 2015 00:11:12 +0100
Subject: [Buildroot] [PATCH v2 2/4] package/lttng-tools: fix static build
In-Reply-To: <1449616274-10251-1-git-send-email-s.martin49@gmail.com>
References: <1449616274-10251-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1449616274-10251-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch fixing configure.ac for library detection on static build.

Fixes:
  http://autobuild.buildroot.net/results/0f1/0f1e015a0c5a5ac2beeb5011d31a1e0058a32a0d/

Upstream status: Merged

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v1->v2:
- update ART tags
- add patch link
---
 .../0001-configure.ac-fix-static-build.patch       | 55 ++++++++++++++++++++++
 package/lttng-tools/lttng-tools.mk                 |  2 +
 2 files changed, 57 insertions(+)
 create mode 100644 package/lttng-tools/0001-configure.ac-fix-static-build.patch

diff --git a/package/lttng-tools/0001-configure.ac-fix-static-build.patch b/package/lttng-tools/0001-configure.ac-fix-static-build.patch
new file mode 100644
index 0000000..ebff592
--- /dev/null
+++ b/package/lttng-tools/0001-configure.ac-fix-static-build.patch
@@ -0,0 +1,55 @@
+Upstream status: Merged
+Fetched from: https://git.lttng.org/?p=lttng-tools.git;a=commit;h=e9cee23a2e92694ba1347fd1242026d4c19413a8
+From e9cee23a2e92694ba1347fd1242026d4c19413a8 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 22 Nov 2015 23:38:00 +0100
+Subject: [PATCH] configure.ac: fix static build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+For static build, some extra LDFLAGS may be needed.
+
+Using PKG_CHECK_MODULES instead of AC_CHECK_LIB for librairy detection
+allows to get all these flags. Then, the LIBS variable can be extended
+with everything that is needed.
+
+So, use PKG_CHECK_MODULES for popt and uuid detection; which both depend
+on libintl.
+
+This changes fixes build failures triggered with Buildroot, e.g.:
+  http://autobuild.buildroot.net/results/0f1/0f1e015a0c5a5ac2beeb5011d31a1e0058a32a0d/build-end.log
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+Signed-off-by: J?r?mie Galarneau <jeremie.galarneau@efficios.com>
+---
+ configure.ac | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2c451e9..978e3bc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -218,15 +218,17 @@ AC_CHECK_LIB([pthread], [pthread_create], [],
+ )
+ 
+ # Check libpopt
+-AC_CHECK_LIB([popt], [poptGetContext], [],
++PKG_CHECK_MODULES([POPT], [popt],
++	[LIBS="$LIBS $POPT_LIBS"],
+ 	[AC_MSG_ERROR([Cannot find libpopt. Use [LDFLAGS]=-Ldir to specify its location.])]
+ )
+ 
+ AM_PATH_XML2(2.7.6, true, AC_MSG_ERROR(No supported version of libxml2 found.))
+ 
+ # Check for libuuid
+-AC_CHECK_LIB([uuid], [uuid_generate],
++PKG_CHECK_MODULES([UUID], [uuid],
+ [
++	LIBS="$LIBS $UUID_LIBS"
+ 	AC_DEFINE_UNQUOTED([LTTNG_HAVE_LIBUUID], 1, [Has libuuid support.])
+ 	have_libuuid=yes
+ ],
+-- 
+2.6.3
+
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index efca6d7..b14b7e7 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -10,6 +10,8 @@ LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2+; LGPLv2.1+ for include/lttng/* and src/lib/lttng-ctl/*
 LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
 LTTNG_TOOLS_CONF_OPTS += --with-xml-prefix=$(STAGING_DIR)/usr
+# Need autoreconf because of a patch touching configure.ac
+LTTNG_TOOLS_AUTORECONF = YES
 
 # The host-lttng-babeltrace technically isn't a required build
 # dependency. However, having the babeltrace utilities built for the
-- 
2.6.3
