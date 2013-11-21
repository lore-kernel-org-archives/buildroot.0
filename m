From: =?UTF-8?q?Arnaud=20R=C3=A9billout?= <rebillout@syscom.ch>
Date: Thu, 21 Nov 2013 16:16:11 +0100
Subject: [Buildroot] [PATCH] lftp: new package.
In-Reply-To: <1385046971-7707-1-git-send-email-rebillout@syscom.ch>
References: <1385046971-7707-1-git-send-email-rebillout@syscom.ch>
Message-ID: <1385046971-7707-2-git-send-email-rebillout@syscom.ch>
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
 package/Config.in                               |  1 +
 package/lftp/Config.in                          | 65 ++++++++++++++++++
 package/lftp/lftp-disable-posix_fallocate.patch | 21 ++++++
 package/lftp/lftp.mk                            | 87 +++++++++++++++++++++++++
 4 files changed, 174 insertions(+)
 create mode 100644 package/lftp/Config.in
 create mode 100644 package/lftp/lftp-disable-posix_fallocate.patch
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
diff --git a/package/lftp/Config.in b/package/lftp/Config.in
new file mode 100644
index 0000000..93de861
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
+	  Enable torren command
+
+comment "Protocols"
+
+config BR2_PACKAGE_LFTP_PROTO_FISH
+	bool "FISH protocol"
+	default y
+	help
+	  Enable FILE protocol
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
diff --git a/package/lftp/lftp-disable-posix_fallocate.patch b/package/lftp/lftp-disable-posix_fallocate.patch
new file mode 100644
index 0000000..29bb780
--- /dev/null
+++ b/package/lftp/lftp-disable-posix_fallocate.patch
@@ -0,0 +1,21 @@
+diff -pruN lftp-4.4.10.orig/configure lftp-4.4.10/configure
+--- lftp-4.4.10.orig/configure	2013-10-31 15:40:04.716111900 +0100
++++ lftp-4.4.10/configure	2013-10-31 15:41:37.431445424 +0100
+@@ -48870,10 +48870,13 @@ if ${i_cv_posix_fallocate_works+:} false
+ else
+ 
+      if test "$cross_compiling" = yes; then :
+-  { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-as_fn_error $? "cannot run test program while cross compiling
+-See \`config.log' for more details" "$LINENO" 5; }
++#  { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
++#$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
++#as_fn_error $? "cannot run test program while cross compiling
++#See \`config.log' for more details" "$LINENO" 5; }
++
++# Can't test, assume it doesn't work
++i_cv_posix_fallocate_works=no
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
new file mode 100644
index 0000000..1ee8e89
--- /dev/null
+++ b/package/lftp/lftp.mk
@@ -0,0 +1,87 @@
+################################################################################
+#
+# lftp
+#
+################################################################################
+
+LFTP_VERSION = 4.4.10
+LFTP_SOURCE  = lftp-$(LFTP_VERSION).tar.gz
+LFTP_SITE    = http://lftp.yar.ru/ftp
+LFTP_LICENSE = GPLv3+
+LFTP_LICENSE_FILES = COPYING
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
+LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_DATA
+
+# Optional commands
+ifneq ($(BR2_PACKAGE_LFTP_CMD_MIRROR),y)
+define LFTP_REMOVE_CMD_MIRROR
+	$(RM) -f $(TARGET_DIR)/usr/lib/lftp/$(LFTP_VERSION)/cmd-mirror.so
+endef
+LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_CMD_MIRROR
+endif
+
+ifneq ($(BR2_PACKAGE_LFTP_CMD_SLEEP),y)
+define LFTP_REMOVE_CMD_SLEEP
+	$(RM) -f $(TARGET_DIR)/usr/lib/lftp/$(LFTP_VERSION)/cmd-sleep.so
+endef
+LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_CMD_SLEEP
+endif
+
+ifneq ($(BR2_PACKAGE_LFTP_CMD_TORRENT),y)
+define LFTP_REMOVE_CMD_TORRENT
+	$(RM) -f $(TARGET_DIR)/usr/lib/lftp/$(LFTP_VERSION)/cmd-torrent.so
+endef
+LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_CMD_TORRENT
+endif
+
+# Optional protocols
+ifneq ($(BR2_PACKAGE_LFTP_PROTO_FISH),y)
+define LFTP_REMOVE_PROTO_FISH
+	$(RM) -f $(TARGET_DIR)/usr/lib/lftp/$(LFTP_VERSION)/proto-fish.so
+endef
+LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_PROTO_FISH
+endif
+
+ifneq ($(BR2_PACKAGE_LFTP_PROTO_FTP),y)
+define LFTP_REMOVE_PROTO_FTP
+	$(RM) -f $(TARGET_DIR)/usr/lib/lftp/$(LFTP_VERSION)/proto-ftp.so
+endef
+LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_PROTO_FTP
+endif
+
+ifneq ($(BR2_PACKAGE_LFTP_PROTO_HTTP),y)
+define LFTP_REMOVE_PROTO_HTTP
+	$(RM) -f $(TARGET_DIR)/usr/lib/lftp/$(LFTP_VERSION)/proto-http.so
+endef
+LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_PROTO_HTTP
+endif
+
+ifneq ($(BR2_PACKAGE_LFTP_PROTO_SFTP),y)
+define LFTP_REMOVE_PROTO_SFTP
+	$(RM) -f $(TARGET_DIR)/usr/lib/lftp/$(LFTP_VERSION)/proto-sftp.so
+endef
+LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_PROTO_SFTP
+endif
+
+$(eval $(autotools-package))
-- 
1.8.4.3
