From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 20 Apr 2012 16:04:20 +0200
Subject: [Buildroot] [PATCH] Fix installation for the lighttpd package
Message-ID: <1334930660-30934-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../lighttpd-1.4.30-Fix-default-config-file.patch  |   92 ++++++++++++++++++++
 package/lighttpd/lighttpd.mk                       |   32 +++++++
 2 files changed, 124 insertions(+), 0 deletions(-)
 create mode 100644 package/lighttpd/lighttpd-1.4.30-Fix-default-config-file.patch

diff --git a/package/lighttpd/lighttpd-1.4.30-Fix-default-config-file.patch b/package/lighttpd/lighttpd-1.4.30-Fix-default-config-file.patch
new file mode 100644
index 0000000..59ce907
--- /dev/null
+++ b/package/lighttpd/lighttpd-1.4.30-Fix-default-config-file.patch
@@ -0,0 +1,92 @@
+Modify the default lighttpd configuration file to have one a starting conf
+
+  * Changed the log path to /var/log and logs filenames
+  * Disable IPv6
+  * Do not setuid to a user that doesn't exist on the system
+  * Disable pdf ranges fix for Adobe Reader since it uses regex and we
+    don't always have pcre support
+  * Change the network backend to writev since linux-sendfile fails on buildroot
+
+Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+---
+ doc/config/conf.d/access_log.conf |    2 +-
+ doc/config/lighttpd.conf          |   18 +++++++++---------
+ 2 files changed, 10 insertions(+), 10 deletions(-)
+
+Index: lighttpd-1.4.30/doc/config/lighttpd.conf
+===================================================================
+--- lighttpd-1.4.30.orig/doc/config/lighttpd.conf
++++ lighttpd-1.4.30/doc/config/lighttpd.conf
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
+Index: lighttpd-1.4.30/doc/config/conf.d/access_log.conf
+===================================================================
+--- lighttpd-1.4.30.orig/doc/config/conf.d/access_log.conf
++++ lighttpd-1.4.30/doc/config/conf.d/access_log.conf
+@@ -9,7 +9,7 @@
+ ##
+ ## Default access log.
+ ##
+-accesslog.filename          = log_root + "/access.log"
++accesslog.filename          = log_root + "/lighttpd-access.log"
+ 
+ ##
+ ## The default format produces CLF compatible output.
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
