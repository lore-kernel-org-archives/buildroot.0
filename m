From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Thu, 22 Mar 2012 10:27:19 +0100
Subject: [Buildroot] [PATCH 4/5] Fix installation for the lighttpd package
In-Reply-To: <cover.1332408273.git.maxime.ripard@free-electrons.com>
References: <cover.1332408273.git.maxime.ripard@free-electrons.com>
Message-ID: <572e22d29e9c195b39b38256f7ca024eb7e54110.1332408273.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 .../lighttpd-1.4.30-Fix-default-config-file.patch  |   64 ++++++++++++++++++++
 package/lighttpd/lighttpd.mk                       |   32 ++++++++++
 2 files changed, 96 insertions(+), 0 deletions(-)
 create mode 100644 package/lighttpd/lighttpd-1.4.30-Fix-default-config-file.patch

diff --git a/package/lighttpd/lighttpd-1.4.30-Fix-default-config-file.patch b/package/lighttpd/lighttpd-1.4.30-Fix-default-config-file.patch
new file mode 100644
index 0000000..76afbf8
--- /dev/null
+++ b/package/lighttpd/lighttpd-1.4.30-Fix-default-config-file.patch
@@ -0,0 +1,64 @@
+Index: lighttpd-1.4.30/doc/config/lighttpd.conf
+===================================================================
+--- lighttpd-1.4.30.orig/doc/config/lighttpd.conf	2011-12-18 13:57:25.000000000 +0100
++++ lighttpd-1.4.30/doc/config/lighttpd.conf	2012-03-22 09:55:31.402424839 +0100
+@@ -13,7 +13,7 @@
+ ## if you add a variable here. Add the corresponding variable in the
+ ## chroot example aswell.
+ ##
+-var.log_root    = "/var/log/lighttpd"
++var.log_root    = "/var/log"
+ var.server_root = "/srv/www"
+ var.state_dir   = "/var/run"
+ var.home_dir    = "/var/lib/lighttpd"
+@@ -90,7 +90,7 @@
+ ##
+ ## Use IPv6?
+ ##
+-server.use-ipv6 = "enable"
++# server.use-ipv6 = "enable"
+ 
+ ##
+ ## bind to a specific IP
+@@ -101,8 +101,8 @@
+ ## Run as a different username/groupname.
+ ## This requires root permissions during startup. 
+ ##
+-server.username  = "lighttpd"
+-server.groupname = "lighttpd"
++# server.username  = "lighttpd"
++# server.groupname = "lighttpd"
+ 
+ ## 
+ ## enable core files.
+@@ -138,7 +138,7 @@
+ ##
+ ## Path to the error log file
+ ##
+-server.errorlog             = log_root + "/error.log"
++server.errorlog             = log_root + "/lighttpd-error.log"
+ 
+ ##
+ ## If you want to log to syslog you have to unset the 
+@@ -188,7 +188,7 @@
+ ## linux-sendfile - is recommended for small files.
+ ## writev         - is recommended for sending many large files
+ ##
+-server.network-backend = "linux-sendfile"
++server.network-backend = "writev"
+ 
+ ##
+ ## As lighttpd is a single-threaded server, its main resource limit is
+@@ -311,9 +311,9 @@
+ ## disable range requests for pdf files
+ ## workaround for a bug in the Acrobat Reader plugin.
+ ##
+-$HTTP["url"] =~ "\.pdf$" {
+-  server.range-requests = "disable"
+-}
++# $HTTP["url"] =~ "\.pdf$" {
++#  server.range-requests = "disable"
++# }
+ 
+ ##
+ ## url handling modules (rewrite, redirect)
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index b8aa310..8d1f212 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -56,6 +56,38 @@ else
 LIGHTTPD_CONF_OPT += --without-lua
 endif
 
+define LIGHTTPD_INSTALL_CONFIG
+	mkdir -p $(TARGET_DIR)/etc/lighttpd
+	mkdir -p $(TARGET_DIR)/etc/lighttpd/conf.d
+	mkdir -p $(TARGET_DIR)/srv/www/htdocs
+
+	[ -f $(TARGET_DIR)/etc/lighttpd/lighttpd.conf ] || \
+		$(INSTALL) -D -m 755 $(@D)/doc/config/lighttpd.conf \
+			$(TARGET_DIR)/etc/lighttpd/lighttpd.conf
+
+	[ -f $(TARGET_DIR)/etc/lighttpd/modules.conf ] || \
+		$(INSTALL) -D -m 755 $(@D)/doc/config/modules.conf \
+			$(TARGET_DIR)/etc/lighttpd/modules.conf
+
+	[ -f $(TARGET_DIR)/etc/lighttpd/conf.d/access_log.conf ] || \
+		$(INSTALL) -D -m 755 $(@D)/doc/config/conf.d/access_log.conf \
+			$(TARGET_DIR)/etc/lighttpd/conf.d/access_log.conf
+
+	[ -f $(TARGET_DIR)/etc/lighttpd/conf.d/debug.conf ] || \
+		$(INSTALL) -D -m 755 $(@D)/doc/config/conf.d/debug.conf \
+			$(TARGET_DIR)/etc/lighttpd/conf.d/debug.conf
+
+	[ -f $(TARGET_DIR)/etc/lighttpd/conf.d/dirlisting.conf ] || \
+		$(INSTALL) -D -m 755 $(@D)/doc/config/conf.d/dirlisting.conf \
+			$(TARGET_DIR)/etc/lighttpd/conf.d/dirlisting.conf
+
+	[ -f $(TARGET_DIR)/etc/lighttpd/conf.d/mime.conf ] || \
+		$(INSTALL) -D -m 755 $(@D)/doc/config/conf.d/mime.conf \
+			$(TARGET_DIR)/etc/lighttpd/conf.d/mime.conf
+endef
+
+LIGHTTPD_POST_INSTALL_TARGET_HOOKS += LIGHTTPD_INSTALL_CONFIG
+
 define LIGHTTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/lighttpd
 	rm -f $(TARGET_DIR)/usr/sbin/lighttpd-angel
-- 
1.7.5.4
