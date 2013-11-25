From: =?UTF-8?q?Arnaud=20R=C3=A9billout?= <rebillout@syscom.ch>
Date: Mon, 25 Nov 2013 13:55:36 +0100
Subject: [Buildroot] [PATCH] lftp: new package.
In-Reply-To: <1385384136-22652-1-git-send-email-rebillout@syscom.ch>
References: <1385384136-22652-1-git-send-email-rebillout@syscom.ch>
Message-ID: <1385384136-22652-2-git-send-email-rebillout@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LFTP is a sophisticated ftp/http client, and a file transfer program
supporting a number of network protocols. Like BASH, it has job
control and uses the readline library for input. It has bookmarks,
a built-in mirror command, and can transfer several files in parallel.
It was designed with reliability in mind.

Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>
---
 package/Config.in                                  |  1 +
 ...osix_fallocate-m4-check-for-cross-compile.patch | 32 +++++++++++
 ...02-Check-whether-posix_fallocate-compiles.patch | 55 ++++++++++++++++++
 package/lftp/Config.in                             | 65 ++++++++++++++++++++++
 package/lftp/lftp.mk                               | 54 ++++++++++++++++++
 5 files changed, 207 insertions(+)
 create mode 100644 package/lftp/0001-Fix-posix_fallocate-m4-check-for-cross-compile.patch
 create mode 100644 package/lftp/0002-Check-whether-posix_fallocate-compiles.patch
 create mode 100644 package/lftp/Config.in
 create mode 100644 package/lftp/lftp.mk

diff --git a/package/Config.in b/package/Config.in
index 311cc6c..bcaa8f3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -814,6 +814,7 @@ source "package/iputils/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
 source "package/knock/Config.in"
+source "package/lftp/Config.in"
 source "package/lighttpd/Config.in"
 source "package/linknx/Config.in"
 source "package/links/Config.in"
diff --git a/package/lftp/0001-Fix-posix_fallocate-m4-check-for-cross-compile.patch b/package/lftp/0001-Fix-posix_fallocate-m4-check-for-cross-compile.patch
new file mode 100644
index 0000000..3c7209f
--- /dev/null
+++ b/package/lftp/0001-Fix-posix_fallocate-m4-check-for-cross-compile.patch
@@ -0,0 +1,32 @@
+From 8a49b00a4f746f0bdc1b2490a260f98e872d0e9c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Arnaud=20R=C3=A9billout?= <rebillout@syscom.ch>
+Date: Mon, 25 Nov 2013 11:03:59 +0100
+Subject: [PATCH 1/2] Fix posix_fallocate m4 check for cross-compile.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If we're cross-compiling, it's very unlikely that we use old glibc or
+AIX. So we assume that posix_fallocate works.
+
+Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>
+---
+ m4/lftp.m4 | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/m4/lftp.m4 b/m4/lftp.m4
+index 6d7ad9c..c8efb28 100644
+--- a/m4/lftp.m4
++++ b/m4/lftp.m4
+@@ -271,6 +271,8 @@ AC_DEFUN([LFTP_POSIX_FALLOCATE_CHECK],[
+        i_cv_posix_fallocate_works=yes
+      ], [
+        i_cv_posix_fallocate_works=no
++     ], [
++       i_cv_posix_fallocate_works=yes
+      ])
+    ])
+    if test x$i_cv_posix_fallocate_works = xyes; then
+-- 
+1.8.4.4
+
diff --git a/package/lftp/0002-Check-whether-posix_fallocate-compiles.patch b/package/lftp/0002-Check-whether-posix_fallocate-compiles.patch
new file mode 100644
index 0000000..b137a52
--- /dev/null
+++ b/package/lftp/0002-Check-whether-posix_fallocate-compiles.patch
@@ -0,0 +1,55 @@
+From 99674dbf332427b6e2778643af026133cc2edac6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Arnaud=20R=C3=A9billout?= <rebillout@syscom.ch>
+Date: Mon, 25 Nov 2013 13:22:24 +0100
+Subject: [PATCH 2/2] Check whether posix_fallocate compiles.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+uClibc doesn't provide posix_fallocate as of 0.9.33.2, but some patches
+exist to add this function.
+
+Therefore, the only way to know if posix_fallocate is present is to do a
+compile test.
+
+Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>
+---
+ m4/lftp.m4 | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/m4/lftp.m4 b/m4/lftp.m4
+index c8efb28..d489bec 100644
+--- a/m4/lftp.m4
++++ b/m4/lftp.m4
+@@ -244,6 +244,20 @@ AC_DEFUN([LFTP_ENVIRON_CHECK],[
+ 
+ dnl Taken from dovecot
+ AC_DEFUN([LFTP_POSIX_FALLOCATE_CHECK],[
++   dnl * Ensure posix_fallocate is provided by the C library.
++   AC_CACHE_CHECK([whether posix_fallocate() compiles],[i_cv_posix_fallocate_compiles],[
++     AC_LINK_IFELSE([
++       #include <fcntl.h>
++       int main() {
++         posix_fallocate(0, 0, 0);
++       }
++     ], [
++       i_cv_posix_fallocate_compiles=yes
++     ], [
++       i_cv_posix_fallocate_compiles=no
++     ])
++   ])
++   if test x$i_cv_posix_fallocate_compiles = xyes; then
+    dnl * Old glibcs have broken posix_fallocate(). Make sure not to use it.
+    dnl * It may also be broken in AIX.
+    AC_CACHE_CHECK([whether posix_fallocate() works],[i_cv_posix_fallocate_works],[
+@@ -278,6 +292,7 @@ AC_DEFUN([LFTP_POSIX_FALLOCATE_CHECK],[
+    if test x$i_cv_posix_fallocate_works = xyes; then
+      AC_DEFINE(HAVE_POSIX_FALLOCATE, 1, [Define if you have a working posix_fallocate()])
+    fi
++   fi
+ ])
+ 
+ AC_DEFUN([LFTP_POSIX_FADVISE_CHECK],[
+-- 
+1.8.4.4
+
diff --git a/package/lftp/Config.in b/package/lftp/Config.in
new file mode 100644
index 0000000..df4062a
--- /dev/null
+++ b/package/lftp/Config.in
@@ -0,0 +1,65 @@
+config BR2_PACKAGE_LFTP
+	bool "lftp"
+	depends on BR2_USE_WCHAR
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_GNUTLS if !BR2_PACKAGE_OPENSSL
+	help
+	  LFTP is a sophisticated ftp/http client, and a file transfer program
+	  supporting a number of network protocols. Like BASH, it has job
+	  control and uses the readline library for input. It has bookmarks,
+	  a built-in mirror command, and can transfer several files in parallel.
+	  It was designed with reliability in mind.
+
+	  http://lftp.yar.ru/
+
+if BR2_PACKAGE_LFTP
+
+comment "Commands"
+
+config BR2_PACKAGE_LFTP_CMD_MIRROR
+	bool "Mirror command"
+	help
+	  Enable mirror command
+
+config BR2_PACKAGE_LFTP_CMD_SLEEP
+	bool "Sleep command"
+	help
+	  Enable sleep command
+
+config BR2_PACKAGE_LFTP_CMD_TORRENT
+	bool "Torrent command"
+	help
+	  Enable torrent command
+
+comment "Protocols"
+
+config BR2_PACKAGE_LFTP_PROTO_FISH
+	bool "FISH protocol"
+	default y
+	help
+	  Enable FISH protocol
+
+config BR2_PACKAGE_LFTP_PROTO_FTP
+	bool "FTP protocol"
+	default y
+	help
+	  Enable FTP protocol
+
+config BR2_PACKAGE_LFTP_PROTO_HTTP
+	bool "HTTP protocol"
+	default y
+	help
+	  Enable HTTP protocol
+
+config BR2_PACKAGE_LFTP_PROTO_SFTP
+	bool "SFTP protocol"
+	default y
+	help
+	  Enable SFTP protocol
+
+endif  # BR2_PACKAGE_LFTP
+
+comment "lftp requires a toolchain w/ C++, wchar"
+	depends on !(BR2_USE_WCHAR && BR2_INSTALL_LIBSTDCPP)
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
new file mode 100644
index 0000000..faf9f37
--- /dev/null
+++ b/package/lftp/lftp.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# lftp
+#
+################################################################################
+
+LFTP_VERSION = 4.4.10
+LFTP_SITE    = http://lftp.yar.ru/ftp
+LFTP_LICENSE = GPLv3+
+LFTP_LICENSE_FILES = COPYING
+LFTP_AUTORECONF = YES
+LFTP_DEPENDENCIES  = readline zlib
+
+LFTP_CONF_OPT += --with-modules
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LFTP_DEPENDENCIES += gnutls
+LFTP_CONF_OPT += --with-gnutls
+else
+LFTP_CONF_OPT += --without-gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LFTP_DEPENDENCIES += openssl
+LFTP_CONF_OPT += --with-openssl
+else
+LFTP_CONF_OPT += --without-openssl
+endif
+
+# Remove /usr/share/lftp
+define LFTP_REMOVE_DATA
+        $(RM) -fr $(TARGET_DIR)/usr/share/lftp
+endef
+
+LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_DATA
+
+# Optional commands and protocols
+LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_CMD_MIRROR) += cmd-mirror.so
+LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_CMD_SLEEP) += cmd-sleep.so
+LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_CMD_TORRENT) += cmd-torrent.so
+LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_PROTO_FISH) += proto-fish.so
+LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_PROTO_FTP) += proto-ftp.so
+LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_PROTO_HTTP) += proto-http.so
+LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_PROTO_SFTP) += proto-sftp.so
+
+define LFTP_REMOVE_MODULES
+	for f in $(LFTP_MODULES_TO_REMOVE-) ; do \
+		$(RM) -f $(TARGET_DIR)/usr/lib/lftp/$(LFTP_VERSION)/$$f ; \
+	done
+endef
+
+LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_MODULES
+
+$(eval $(autotools-package))
-- 
1.8.4.4
