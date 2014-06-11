From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 11 Jun 2014 22:55:02 +0200
Subject: [Buildroot] [PATCH 1/1] psplash: install systemd services
Message-ID: <1402520102-24548-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides service files for using psplash on embedded devices
running systemd:

- psplash-start.service: start psplash.
- psplash-quit.service: kill psplash when reaching multi-user.target

The following kernel command line options should also be set:

  systemd.show_status=0 quiet splash

The option "systemd.show_status=0" is required, because, unlike Plymouth,
psplash does not have real systemd integration, i.e. it will not perform:

  kill(1, SIGRTMIN + 21);

Note that no progress messages will be printed on the splash screen.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/psplash/psplash-quit.service  | 11 +++++++++++
 package/psplash/psplash-start.service | 11 +++++++++++
 package/psplash/psplash.mk            | 14 ++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 package/psplash/psplash-quit.service
 create mode 100644 package/psplash/psplash-start.service

diff --git a/package/psplash/psplash-quit.service b/package/psplash/psplash-quit.service
new file mode 100644
index 0000000..14bd499
--- /dev/null
+++ b/package/psplash/psplash-quit.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Terminate Psplash Boot Screen
+After=psplash-start.service
+
+[Service]
+Type=oneshot
+ExecStart=/usr/bin/psplash-write QUIT
+TimeoutSec=20
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/psplash/psplash-start.service b/package/psplash/psplash-start.service
new file mode 100644
index 0000000..2de3cfc
--- /dev/null
+++ b/package/psplash/psplash-start.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Starts Psplash Boot screen
+Wants=systemd-vconsole-setup.service
+After=systemd-vconsole-setup.service systemd-udev-trigger.service systemd-udevd.service
+DefaultDependencies=no
+
+[Service]
+ExecStart=/usr/bin/psplash -n
+
+[Install]
+WantedBy=sysinit.target
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index 83b6f79..b756266 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -9,4 +9,18 @@ PSPLASH_SITE = git://git.yoctoproject.org/psplash
 PSPLASH_LICENSE = GPLv2+
 PSPLASH_AUTORECONF = YES
 
+define PSPLASH_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/psplash/psplash-start.service \
+		$(TARGET_DIR)/etc/systemd/system/psplash-start.service
+	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
+	ln -sf  ../psplash-start.service \
+		 $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/
+
+	$(INSTALL) -D -m 644 package/psplash/psplash-quit.service \
+		$(TARGET_DIR)/etc/systemd/system/psplash-quit.service
+	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf  ../psplash-quit.service \
+		 $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
+endef
+
 $(eval $(autotools-package))
-- 
1.9.3
