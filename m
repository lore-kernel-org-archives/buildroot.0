From: Alvaro G. M <alvaro.gamez@hazent.com>
Date: Fri, 28 Mar 2014 11:28:15 +0100
Subject: [Buildroot] [PATCH 1/1] dcron: new package
Message-ID: <1396002495-29279-1-git-send-email-alvaro.gamez@hazent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
---
 package/Config.in       |  1 +
 package/dcron/Config.in |  8 ++++++++
 package/dcron/dcron.mk  | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 package/dcron/Config.in
 create mode 100644 package/dcron/dcron.mk

diff --git a/package/Config.in b/package/Config.in
index ad75d9b..e301d9a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1067,6 +1067,7 @@ source "package/bootutils/Config.in"
 source "package/coreutils/Config.in"
 endif
 source "package/cpuload/Config.in"
+source "package/dcron/Config.in"
 source "package/dsp-tools/Config.in"
 source "package/htop/Config.in"
 source "package/keyutils/Config.in"
diff --git a/package/dcron/Config.in b/package/dcron/Config.in
new file mode 100644
index 0000000..70dadcd
--- /dev/null
+++ b/package/dcron/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_DCRON
+	bool "dcron"
+	help
+	  dcron is a time-based job scheduler with anacron-like features.
+	  It works as a background daemon that parses individual crontab
+	  files and executes commands on behalf of the users in question.
+
+	  http://www.jimpryor.net/linux/dcron.html
diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
new file mode 100644
index 0000000..cfff875
--- /dev/null
+++ b/package/dcron/dcron.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# dcron
+#
+################################################################################
+
+DCRON_VERSION = 4.5
+DCRON_SITE = http://www.jimpryor.net/linux/releases/
+DCRON_LICENSE = GPLv2
+
+DCRON_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" AR="$(TARGET_AR)"
+
+define DCRON_PERMISSIONS
+/usr/sbin/crond			 f 4755	0 0 - - - - -
+/usr/bin/crontab		 f 755  0 0 - - - - -
+/etc/cron.d/system		 f 755  0 0 - - - - -
+endef
+
+define DCRON_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) $(DCRON_MAKE_OPT)
+endef
+
+define DCRON_INSTALL_TARGET_CMDS
+	$(INSTALL) -m0700 $(@D)/crond $(TARGET_DIR)/usr/sbin/crond
+	$(INSTALL) -m4755 $(@D)/crontab $(TARGET_DIR)/usr/bin/crontab
+	$(INSTALL) -D -m0644 $(@D)/extra/root.crontab $(TARGET_DIR)/etc/cron.d/system
+	$(INSTALL) -d -m0755 $(TARGET_DIR)/var/spool/cron/crontabs \
+	        $(TARGET_DIR)/etc/cron.daily $(TARGET_DIR)/etc/cron.hourly \
+	        $(TARGET_DIR)/etc/cron.monthly $(TARGET_DIR)/etc/cron.weekly
+endef
+
+define DCRON_CLEAN_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
