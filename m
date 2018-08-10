From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 07:46:34 -0700
Subject: [Buildroot] [PATCH 1/3] fake-hwclock: new package
Message-ID: <20180810144635.16182-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Save/restore system clock on machines without working RTC hardware

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 DEVELOPERS                             |  3 +++
 package/Config.in                      |  1 +
 package/fake-hwclock/Config.in         | 12 ++++++++++
 package/fake-hwclock/fake-hwclock.hash |  2 ++
 package/fake-hwclock/fake-hwclock.mk   | 40 ++++++++++++++++++++++++++++++++++
 5 files changed, 58 insertions(+)
 create mode 100644 package/fake-hwclock/Config.in
 create mode 100644 package/fake-hwclock/fake-hwclock.hash
 create mode 100644 package/fake-hwclock/fake-hwclock.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 215506c71c..9ea934fa57 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -479,6 +479,9 @@ F:	package/python-rtslib-fb/
 F:	package/python-urwid/
 F:	package/targetcli-fb/
 
+N:	Christopher McCrory <chrismcc@gmail.com>
+F:	package/fake-hwclock/
+
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
 F:	package/checkpolicy/
diff --git a/package/Config.in b/package/Config.in
index f5a17492c7..42c61c242e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1982,6 +1982,7 @@ comment "Utilities"
 	source "package/dialog/Config.in"
 	source "package/dtach/Config.in"
 	source "package/easy-rsa/Config.in"
+	source "package/fake-hwclock/Config.in"
 	source "package/file/Config.in"
 	source "package/gnupg/Config.in"
 	source "package/gnupg2/Config.in"
diff --git a/package/fake-hwclock/Config.in b/package/fake-hwclock/Config.in
new file mode 100644
index 0000000000..f7e01dfb46
--- /dev/null
+++ b/package/fake-hwclock/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_FAKE_HWCLOCK
+	bool "fake-hwclock"
+	help
+	 Save/restore system clock on machines without working RTC hardware
+
+if BR2_PACKAGE_FAKE_HWCLOCK
+config BR2_PACKAGE_FAKE_HWCLOCK_CRONJOB
+        bool "install fake-hwclock cronjob"
+        help
+          Hourly cronjob to save current timestamp
+
+endif
diff --git a/package/fake-hwclock/fake-hwclock.hash b/package/fake-hwclock/fake-hwclock.hash
new file mode 100644
index 0000000000..7bf147d7a6
--- /dev/null
+++ b/package/fake-hwclock/fake-hwclock.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 b658d6d130f66eeaa79bae6943ebae45a85bc6a932260befff75c630a8cfe428 fake-hwclock-v0.11.tar.gz
diff --git a/package/fake-hwclock/fake-hwclock.mk b/package/fake-hwclock/fake-hwclock.mk
new file mode 100644
index 0000000000..caae8605b9
--- /dev/null
+++ b/package/fake-hwclock/fake-hwclock.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# fake-hwclock
+#
+################################################################################
+
+FAKE_HWCLOCK_VERSION = v0.11
+FAKE_HWCLOCK_SITE = https://git.einval.com/git/fake-hwclock.git
+FAKE_HWCLOCK_SITE_METHOD = git
+FAKE_HWCLOCK_LICENSE_FILES = COPYING
+FAKE_LICENSE = GPL-2.0
+
+define FAKE_HWCLOCK_NO_LSB
+	$(SED) 's at . /lib/lsb/init-functions@#. /lib/lsb/init-functions@' \
+		$(@D)/debian/fake-hwclock.init
+endef
+
+FAKE_HWCLOCK_POST_PATCH_HOOKS += FAKE_HWCLOCK_NO_LSB
+
+ifeq ($(BR2_PACKAGE_FAKE_HWCLOCK_CRONJOB),y)
+define FAKE_HWCLOCK_INSTALL_CRONJOB
+	$(INSTALL) -D -m 755 $(@D)/debian/fake-hwclock.cron.hourly $(TARGET_DIR)/etc/cron.hourly/fake-hwclock
+endef
+endif
+
+define FAKE_HWCLOCK_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/fake-hwclock $(TARGET_DIR)/sbin/fake-hwclock
+	# Use buildroot buildtime as a seed.
+	# Not ideal, but better than 1970-01-01 UTC
+	date -u '+%Y-%m-%d %H:%M:%S' > $(TARGET_DIR)/etc/fake-hwclock.data
+	$(FAKE_HWCLOCK_INSTALL_CRONJOB)
+endef
+
+# This should run before everything else, so use S00
+define FAKE_HWCLOCK_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 $(@D)/debian/fake-hwclock.init $(TARGET_DIR)/etc/init.d/S00fake-hwclock
+	$(INSTALL) -D -m 755 $(@D)/etc/default/fake-hwclock $(TARGET_DIR)/etc/default/fake-hwclock
+endef
+
+$(eval $(generic-package))
-- 
2.14.4
