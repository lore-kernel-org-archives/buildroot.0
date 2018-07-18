From: Christopher McCrory <chrismcc@gmail.com>
Date: Wed, 18 Jul 2018 09:18:42 -0700
Subject: [Buildroot] [PATCH v1] RFC newpackage: fake-hwclock
Message-ID: <20180718161842.27559-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Save/restore system clock on machines without working RTC hardware

https://git.einval.com/cgi-bin/gitweb.cgi?p=fake-hwclock.git

This is a RFC, am I missing anything?

The version is 0.11, but I am not sure where this should be noted.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/Config.in                         |  1 +
 package/fake-hwclock/001-start-stop.patch | 20 ++++++++++++++++++++
 package/fake-hwclock/Config.in            |  9 +++++++++
 package/fake-hwclock/fake-hwclock.cronjob |  1 +
 package/fake-hwclock/fake-hwclock.mk      | 31 +++++++++++++++++++++++++++++++
 5 files changed, 62 insertions(+)
 create mode 100644 package/fake-hwclock/001-start-stop.patch
 create mode 100644 package/fake-hwclock/Config.in
 create mode 100644 package/fake-hwclock/fake-hwclock.cronjob
 create mode 100644 package/fake-hwclock/fake-hwclock.mk

diff --git a/package/Config.in b/package/Config.in
index 08a3eac48a..826e4c8717 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1981,6 +1981,7 @@ comment "Utilities"
 	source "package/dialog/Config.in"
 	source "package/dtach/Config.in"
 	source "package/easy-rsa/Config.in"
+	source "package/fake-hwclock/Config.in"
 	source "package/file/Config.in"
 	source "package/gnupg/Config.in"
 	source "package/gnupg2/Config.in"
diff --git a/package/fake-hwclock/001-start-stop.patch b/package/fake-hwclock/001-start-stop.patch
new file mode 100644
index 0000000000..3ceb0ace4a
--- /dev/null
+++ b/package/fake-hwclock/001-start-stop.patch
@@ -0,0 +1,20 @@
+--- a/fake-hwclock.orig	2018-07-18 07:14:29.943169961 -0700
++++ a/fake-hwclock	2018-07-18 07:14:50.894364970 -0700
+@@ -30,7 +30,7 @@
+ fi
+ 
+ case $COMMAND in
+-    save)
++    save|stop)
+         if [ -e $FILE ] ; then
+             NOW_SEC=$(date -u '+%s')
+             if $FORCE || [ $NOW_SEC -ge $HWCLOCK_EPOCH_SEC ] ; then
+@@ -45,7 +45,7 @@
+             date -u '+%Y-%m-%d %H:%M:%S' > $FILE
+         fi
+         ;;
+-    load)
++    start|load)
+         if [ -e $FILE ] ; then
+             SAVED="$(cat $FILE)"
+             SAVED_SEC=$(date -u -d "$SAVED" '+%s')
diff --git a/package/fake-hwclock/Config.in b/package/fake-hwclock/Config.in
new file mode 100644
index 0000000000..4c59f07844
--- /dev/null
+++ b/package/fake-hwclock/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_FAKE_HWCLOCK
+	bool "fake-hwclock"
+	depends on BR2_INIT_SYSV
+	help
+	 a script to load and save creenet time for systems without a 
+	 hardware RTC
+
+comment "fake-hwclock needs SysV init"
+	depends on !BR2_INIT_SYSV
diff --git a/package/fake-hwclock/fake-hwclock.cronjob b/package/fake-hwclock/fake-hwclock.cronjob
new file mode 100644
index 0000000000..cefb488719
--- /dev/null
+++ b/package/fake-hwclock/fake-hwclock.cronjob
@@ -0,0 +1 @@
+date -u '+%Y-%m-%d %H:%M:%S' > /etc/fake-hwclock.data
diff --git a/package/fake-hwclock/fake-hwclock.mk b/package/fake-hwclock/fake-hwclock.mk
new file mode 100644
index 0000000000..b47d6b14f5
--- /dev/null
+++ b/package/fake-hwclock/fake-hwclock.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# fake-hwclock
+#
+################################################################################
+
+FAKE_HWCLOCK_VERSION = f889fd09f2d8d55819dd53785e8bd895866e6628
+FAKE_HWCLOCK_SITE = https://git.einval.com/git/fake-hwclock.git
+FAKE_HWCLOCK_SITE_METHOD=git
+FAKE_HWCLOCK_LICENSE_FILES = COPYING
+
+# add a daily cron job to save current time
+ifeq ($(BR2_PACKAGE_DCRON),y)
+FAKE_HWCLOCK_DEPENDENCIES += dcron
+define FAKE_HWCLOCK_CROBJOB
+	$(INSTALL) -D -m 755 $(FAKE_HWCLOCK_PKGDIR)/fake-hwclock.cronjob $(TARGET_DIR)/etc/cron.daily/fake-hwclock
+endef
+FAKE_HWCLOCK_POST_INSTALL_TARGET_HOOKS += FAKE_HWCLOCK_CROBJOB
+endif
+
+# This should run before everything else
+define FAKE_HWCLOCK_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 $(@D)/fake-hwclock $(TARGET_DIR)/etc/init.d/S00fake-hwclock
+endef
+
+# Use buildroot buildtime as a seed.  Not ideal, but better than 1970-01-01 UTC
+define FAKE_HWCLOCK_INSTALL_TARGET_CMDS
+	date -u '+%Y-%m-%d %H:%M:%S' > $(TARGET_DIR)/etc/fake-hwclock.data
+endef
+
+$(eval $(generic-package))
-- 
2.14.4
