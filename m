From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Tue, 13 Nov 2018 21:17:28 +0100
Subject: [Buildroot] [PATCH v2] acpid: Add systemd service
Message-ID: <20181113201728.19936-1-alexander.sverdlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This one is based on Archlinux's service file.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 package/acpid/acpid.mk      | 8 ++++++++
 package/acpid/acpid.service | 9 +++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 package/acpid/acpid.service

diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 48fe005e5e..514fd31fe6 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -10,6 +10,14 @@ ACPID_SITE = http://downloads.sourceforge.net/project/acpid2
 ACPID_LICENSE = GPL-2.0+
 ACPID_LICENSE_FILES = COPYING
 
+define ACPID_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0755 package/acpid/acpid.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/acpid.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/acpid.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/acpid.service
+endef
+
 define ACPID_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/acpid/S02acpid \
 		$(TARGET_DIR)/etc/init.d/S02acpid
diff --git a/package/acpid/acpid.service b/package/acpid/acpid.service
new file mode 100644
index 0000000000..5252b52f5f
--- /dev/null
+++ b/package/acpid/acpid.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=ACPI event daemon
+Documentation=man:acpid(8)
+
+[Service]
+ExecStart=/usr/sbin/acpid --foreground --netlink
+
+[Install]
+WantedBy=multi-user.target
-- 
2.19.1
