From: Laurent Hartanerot <laurent.hartanerot@gmail.com>
Date: Fri, 27 Jul 2018 23:35:14 +0200
Subject: [Buildroot] [PATCH 1/1] lighttpd: Adding /var/log/lighttpd folder
 with the owner www-data The lighttpd need to write in his root log folder
Message-ID: <20180727213514.19361-1-laurent.hartanerot@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Laurent Hartanerot <laurent.hartanerot@atos.net>

Lighttpd don't start with the default buildroot configuration

/usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf
2018-06-22 11:21:34: (server.c.733) opening errorlog '/var/log/lighttpd-error.log' failed: Permission denied
2018-06-22 11:21:34: (server.c.1420) Opening errorlog failed. Going down.


Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
---
 package/lighttpd/0001-Fix-default-config-file.patch | 6 ++----
 package/lighttpd/lighttpd.mk                        | 5 +++++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/lighttpd/0001-Fix-default-config-file.patch b/package/lighttpd/0001-Fix-default-config-file.patch
index ada1589760..4fa5902718 100644
--- a/package/lighttpd/0001-Fix-default-config-file.patch
+++ b/package/lighttpd/0001-Fix-default-config-file.patch
@@ -1,6 +1,5 @@
 Modify the default lighttpd configuration file to have one a starting conf

-  * Changed the log path to /var/log and logs filenames
   * Disable IPv6
   * Do not setuid to a user that doesn't exist on the system
   * Disable pdf ranges fix for Adobe Reader since it uses regex and we
@@ -27,13 +26,12 @@ diff -Nura lighttpd-1.4.37.orig/doc/config/conf.d/access_log.conf lighttpd-1.4.3
 diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/config/lighttpd.conf
 --- lighttpd-1.4.37.orig/doc/config/lighttpd.conf	2015-09-01 14:38:48.684673663 -0300
 +++ lighttpd-1.4.37/doc/config/lighttpd.conf	2015-09-01 14:39:40.256442492 -0300
-@@ -13,8 +13,8 @@
+@@ -14,8 +14,8 @@
  ## if you add a variable here. Add the corresponding variable in the
  ## chroot example aswell.
  ##
--var.log_root    = "/var/log/lighttpd"
+ var.log_root    = "/var/log/lighttpd"
 -var.server_root = "/srv/www"
-+var.log_root    = "/var/log"
 +var.server_root = "/var/www"
  var.state_dir   = "/var/run"
  var.home_dir    = "/var/lib/lighttpd"
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index c565fed4ff..4fa1614c38 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -67,6 +67,7 @@ endif
 define LIGHTTPD_INSTALL_CONFIG
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/lighttpd/conf.d
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/www
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/log/lighttpd
 	$(INSTALL) -D -m 0644 $(@D)/doc/config/lighttpd.conf \
 		$(TARGET_DIR)/etc/lighttpd/lighttpd.conf
 	$(INSTALL) -D -m 0644 $(@D)/doc/config/modules.conf \
@@ -98,4 +99,8 @@ define LIGHTTPD_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/lighttpd.service
 endef

+define LIGHTTPD_PERMISSIONS
+	/var/log/lighttpd d 755 33 33 - - - - -
+endef
+
 $(eval $(autotools-package))
--
2.11.0
