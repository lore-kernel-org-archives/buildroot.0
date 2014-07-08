From: Alvaro G. M <alvaro.gamez@hazent.com>
Date: Tue,  8 Jul 2014 12:21:32 +0200
Subject: [Buildroot] [PATCH v3 1/1] dcron: new package
Message-ID: <1404814892-28531-1-git-send-email-alvaro.gamez@hazent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
---
This patch addresses latests comments from Thomas P.

The package now includes previous considerations about typical use as help
text of the Config.in option.

It also solves the fact that it wasn't really installing anything at all,
sets busybox as dependency so it can overwrite busybox' cron and crontab files,
and modifies /etc/cron.d/system file after installing it so it uses run-parts
instead of 'run-cron', a file provided by upstream with the same purpose.
 

 package/Config.in       |  1 +
 package/dcron/Config.in | 19 +++++++++++++++++++
 package/dcron/dcron.mk  | 31 +++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 package/dcron/Config.in
 create mode 100644 package/dcron/dcron.mk

diff --git a/package/Config.in b/package/Config.in
index 95c0c8b..3f4384f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1124,6 +1124,7 @@ menu "System tools"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/bootutils/Config.in"
 	source "package/coreutils/Config.in"
+	source "package/dcron/Config.in"
 endif
 	source "package/cpuload/Config.in"
 	source "package/dsp-tools/Config.in"
diff --git a/package/dcron/Config.in b/package/dcron/Config.in
new file mode 100644
index 0000000..37182de
--- /dev/null
+++ b/package/dcron/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_DCRON
+	bool "dcron"
+	help
+	  dcron is a time-based job scheduler with anacron-like features.
+	  It works as a background daemon that parses individual crontab
+	  files and executes commands on behalf of the users in question.
+
+	  Upon installation, this package will enable a system level cron
+	  daemon with hourly, daily, weekly and monthly crontabs.
+
+	  However, it doesn't allow non root users to create their own
+	  crontab file. This is because /var/spool/cron/crontabs is non
+	  user writable.
+
+	  Typically, a crontab group is created on the system and users
+	  allowed to create crontab entries are added into this group, while
+	  crontab executable is owned by root:crontab with sgid bit enabled.
+
+	  http://www.jimpryor.net/linux/dcron.html
diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
new file mode 100644
index 0000000..20dcf23
--- /dev/null
+++ b/package/dcron/dcron.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# dcron
+#
+################################################################################
+
+DCRON_VERSION = 4.5
+DCRON_SITE = http://www.jimpryor.net/linux/releases/
+# The source code does not specify the version of the GPL that is used.
+DCRON_LICENSE = GPL
+
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+DCRON_DEPENDENCIES = busybox
+endif
+
+define DCRON_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define DCRON_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m0700 $(@D)/crond $(TARGET_DIR)/usr/sbin
+	$(INSTALL) -D -m4755 $(@D)/crontab $(TARGET_DIR)/usr/bin
+	$(INSTALL) -D -m0644 $(@D)/extra/root.crontab $(TARGET_DIR)/etc/cron.d/system
+	# Busybox provides run-parts, so there is no need to use nor install provided run-cron
+	$(SED) 's#/usr/sbin/run-cron#/bin/run-parts#g' $(TARGET_DIR)/etc/cron.d/system
+	$(INSTALL) -d -m0755 $(TARGET_DIR)/var/spool/cron/crontabs \
+	        $(TARGET_DIR)/etc/cron.daily $(TARGET_DIR)/etc/cron.hourly \
+	        $(TARGET_DIR)/etc/cron.monthly $(TARGET_DIR)/etc/cron.weekly
+endef
+
+$(eval $(generic-package))
-- 
2.0.0
