From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 20:51:12 +0200
Subject: [Buildroot] [git commit] dcron: new package
Message-ID: <20140715185128.540B49D246@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b1ed35089724135b9b9c194d433b3bed03abdc7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: wrap help text, add BR2_USE_MMU dependency, minor fixes in
.mk file.]

Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       |    3 +++
 package/dcron/Config.in |   22 ++++++++++++++++++++++
 package/dcron/dcron.mk  |   32 ++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c626968..b363a7c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1124,6 +1124,9 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/coreutils/Config.in"
 endif
 	source "package/cpuload/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	source "package/dcron/Config.in"
+endif
 	source "package/dsp-tools/Config.in"
 	source "package/ftop/Config.in"
 	source "package/htop/Config.in"
diff --git a/package/dcron/Config.in b/package/dcron/Config.in
new file mode 100644
index 0000000..42f246a
--- /dev/null
+++ b/package/dcron/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_DCRON
+	bool "dcron"
+	depends on BR2_USE_MMU # fork()
+	help
+	  dcron is a time-based job scheduler with anacron-like
+	  features.  It works as a background daemon that parses
+	  individual crontab files and executes commands on behalf of
+	  the users in question.
+
+	  Upon installation, this package will enable a system level
+	  cron daemon with hourly, daily, weekly and monthly crontabs.
+
+	  However, it doesn't allow non root users to create their own
+	  crontab file. This is because /var/spool/cron/crontabs is
+	  non user writable.
+
+	  Typically, a crontab group is created on the system and
+	  users allowed to create crontab entries are added into this
+	  group, while crontab executable is owned by root:crontab
+	  with sgid bit enabled.
+
+	  http://www.jimpryor.net/linux/dcron.html
diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
new file mode 100644
index 0000000..5174e38
--- /dev/null
+++ b/package/dcron/dcron.mk
@@ -0,0 +1,32 @@
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
+# Overwrite cron-related Busybox commands if available
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+DCRON_DEPENDENCIES = busybox
+endif
+
+define DCRON_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define DCRON_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m0700 $(@D)/crond $(TARGET_DIR)/usr/sbin/crond
+	$(INSTALL) -D -m4755 $(@D)/crontab $(TARGET_DIR)/usr/bin/crontab
+	$(INSTALL) -D -m0644 $(@D)/extra/root.crontab $(TARGET_DIR)/etc/cron.d/system
+	# Busybox provides run-parts, so there is no need to use nor install provided run-cron
+	$(SED) 's#/usr/sbin/run-cron#/bin/run-parts#g' $(TARGET_DIR)/etc/cron.d/system
+	$(INSTALL) -d -m0755 $(TARGET_DIR)/var/spool/cron/crontabs \
+	        $(TARGET_DIR)/etc/cron.daily $(TARGET_DIR)/etc/cron.hourly \
+	        $(TARGET_DIR)/etc/cron.monthly $(TARGET_DIR)/etc/cron.weekly
+endef
+
+$(eval $(generic-package))
