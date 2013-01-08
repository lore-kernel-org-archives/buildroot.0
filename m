From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 8 Jan 2013 17:15:16 +0100
Subject: [Buildroot] [git commit] package: add green end sftp server
Message-ID: <20130108161815.07E5F9A6D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b0e63e5b9a736e70a24e156033663088b4a7f199
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For sftp support in Dropbear or as an alternative for the built in
sftp support in openssh (or to use standalone).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                    |    1 +
 package/gesftpserver/Config.in       |   16 ++++++++++++++++
 package/gesftpserver/gesftpserver.mk |   27 +++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 49db380..bd1db6b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -628,6 +628,7 @@ source "package/ipsec-tools/Config.in"
 source "package/ipset/Config.in"
 source "package/iptables/Config.in"
 source "package/iw/Config.in"
+source "package/gesftpserver/Config.in"
 source "package/kismet/Config.in"
 source "package/lighttpd/Config.in"
 source "package/links/Config.in"
diff --git a/package/gesftpserver/Config.in b/package/gesftpserver/Config.in
new file mode 100644
index 0000000..bc38c51
--- /dev/null
+++ b/package/gesftpserver/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_GESFTPSERVER
+	bool "gesftpserver"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Green End SFTP Server
+
+	  This is an SFTP server supporting up to protocol version 6.
+	  It is possible to use it as a drop-in replacement for the
+	  OpenSSH server, or to provide sftp support for Dropbear.
+
+	  http://www.greenend.org.uk/rjk/sftpserver/
+
+comment "gesftpserver requires a toolchain with WCHAR and threads support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
new file mode 100644
index 0000000..22035a8
--- /dev/null
+++ b/package/gesftpserver/gesftpserver.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# gesftpserver
+#
+#############################################################
+
+GESFTPSERVER_VERSION = 0.1
+GESFTPSERVER_SOURCE = sftpserver-$(GESFTPSERVER_VERSION).tar.gz
+GESFTPSERVER_SITE = http://www.greenend.org.uk/rjk/sftpserver/
+GESFTPSERVER_LICENSE = GPLv2+
+GESFTPSERVER_LICENSE_FILES = COPYING
+# forgets to link against pthread when cross compiling
+GESFTPSERVER_CONF_ENV = LIBS=-lpthread
+
+# overwrite openssh version if enabled
+GESFTPSERVER_DEPENDENCIES += \
+	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
+	$(if $(BR2_PACKAGE_OPENSSH),openssh)
+
+# openssh/dropbear looks here
+define GESFTPSERVER_ADD_SYMLINK
+	ln -sf gesftpserver $(TARGET_DIR)/usr/libexec/sftp-server
+endef
+
+GESFTPSERVER_POST_INSTALL_TARGET_HOOKS += GESFTPSERVER_ADD_SYMLINK
+
+$(eval $(autotools-package))
