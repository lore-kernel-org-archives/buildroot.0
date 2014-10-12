From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 09:32:15 +0200
Subject: [Buildroot] [git commit] vsftpd: Add build option to disable utmpx
	update code
Message-ID: <20141012073514.704D0B1F97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9840261050c763824fc0691c2a15a7dae19f13f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was modeled after a similar option for Dropbear.

The utmpx code is automatically disabled when compiling with musl,
to avoid a build error due to WTMPX_FILE being undefined. Note that
musl has an empty utmpx implementation, so no functionality is lost
by not calling it.

[Peter: use positive logic]
Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vsftpd/Config.in                        |   12 ++++++
 package/vsftpd/vsftpd-0001-utmpx-builddef.patch |   49 +++++++++++++++++++++++
 package/vsftpd/vsftpd.mk                        |    8 ++++
 3 files changed, 69 insertions(+), 0 deletions(-)

diff --git a/package/vsftpd/Config.in b/package/vsftpd/Config.in
index 0cc8880..464d6f2 100644
--- a/package/vsftpd/Config.in
+++ b/package/vsftpd/Config.in
@@ -4,3 +4,15 @@ config BR2_PACKAGE_VSFTPD
 	help
 	  vsftpd is an ftp daemon written with security in mind.
 	  http://vsftpd.beasts.org/
+
+if BR2_PACKAGE_VSFTPD
+
+config BR2_PACKAGE_VSFTPD_UTMPX
+	bool "log vsftpd access to utmpx"
+	# musl 1.1.4 has an empty utmpx implementation and no WTMPX_FILE
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	help
+	  Enable logging of vsftpd access to utmpx.
+	  Note that Buildroot does not generate utmpx by default.
+
+endif
diff --git a/package/vsftpd/vsftpd-0001-utmpx-builddef.patch b/package/vsftpd/vsftpd-0001-utmpx-builddef.patch
new file mode 100644
index 0000000..07bf13c
--- /dev/null
+++ b/package/vsftpd/vsftpd-0001-utmpx-builddef.patch
@@ -0,0 +1,49 @@
+Add build option to disable utmpx update code
+
+On some embedded systems the libc may have utmpx support, but the
+feature would be redundant. So add a build switch to disable utmpx
+updating, similar to compiling on systems without utmpx support.
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+
+diff -ru vsftpd-3.0.2.orig/builddefs.h vsftpd-3.0.2/builddefs.h
+--- vsftpd-3.0.2.orig/builddefs.h	2012-04-05 05:24:56.000000000 +0200
++++ vsftpd-3.0.2/builddefs.h	2014-09-16 14:23:36.128003245 +0200
+@@ -4,6 +4,7 @@
+ #undef VSF_BUILD_TCPWRAPPERS
+ #define VSF_BUILD_PAM
+ #undef VSF_BUILD_SSL
++#define VSF_BUILD_UTMPX
+ 
+ #endif /* VSF_BUILDDEFS_H */
+ 
+diff -ru vsftpd-3.0.2.orig/sysdeputil.c vsftpd-3.0.2/sysdeputil.c
+--- vsftpd-3.0.2.orig/sysdeputil.c	2012-09-16 06:18:04.000000000 +0200
++++ vsftpd-3.0.2/sysdeputil.c	2014-09-16 14:26:42.686887724 +0200
+@@ -1158,7 +1158,7 @@
+ 
+ #endif /* !VSF_SYSDEP_NEED_OLD_FD_PASSING */
+ 
+-#ifndef VSF_SYSDEP_HAVE_UTMPX
++#if !defined(VSF_BUILD_UTMPX) || !defined(VSF_SYSDEP_HAVE_UTMPX)
+ 
+ void
+ vsf_insert_uwtmp(const struct mystr* p_user_str,
+@@ -1173,7 +1173,7 @@
+ {
+ }
+ 
+-#else /* !VSF_SYSDEP_HAVE_UTMPX */
++#else /* !VSF_BUILD_UTMPX || !VSF_SYSDEP_HAVE_UTMPX */
+ 
+ /* IMHO, the pam_unix module REALLY should be doing this in its SM component */
+ /* Statics */
+@@ -1238,7 +1238,7 @@
+   updwtmpx(WTMPX_FILE, &s_utent);
+ }
+ 
+-#endif /* !VSF_SYSDEP_HAVE_UTMPX */
++#endif /* !VSF_BUILD_UTMPX || !VSF_SYSDEP_HAVE_UTMPX */
+ 
+ void
+ vsf_set_die_if_parent_dies()
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 5801656..cab5afb 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -10,10 +10,18 @@ VSFTPD_LIBS = -lcrypt
 VSFTPD_LICENSE = GPLv2
 VSFTPD_LICENSE_FILES = COPYING
 
+define VSFTPD_DISABLE_UTMPX
+	$(SED) 's/.*VSF_BUILD_UTMPX/#undef VSF_BUILD_UTMPX/' $(@D)/builddefs.h
+endef
+
 define VSFTPD_ENABLE_SSL
 	$(SED) 's/.*VSF_BUILD_SSL/#define VSF_BUILD_SSL/' $(@D)/builddefs.h
 endef
 
+ifeq ($(BR2_PACKAGE_VSFTPD_UTMPX),)
+VSFTPD_POST_CONFIGURE_HOOKS += VSFTPD_DISABLE_UTMPX
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 VSFTPD_DEPENDENCIES += openssl
 VSFTPD_LIBS += -lssl -lcrypto
