From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 15 Jun 2020 09:20:52 +0200
Subject: [Buildroot] [PATCH v2 12/14] package/systemd: pre-create directory
 for timesync user
In-Reply-To: <20200615072055.2083-1-nolange79@gmail.com>
References: <20200615072055.2083-1-nolange79@gmail.com>
Message-ID: <20200615072055.2083-13-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On an read-only filesystem the timesync service will not start
as the state directory cant be created.
If the directory exists, then the service can start,
obviously wont safe its state, but will otherwise work.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index cb0278f3b7..a4f0f2ef33 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -475,6 +475,7 @@ SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_SOURCE_CATALOGS_HOOK
 endif
 
 define SYSTEMD_INSTALL_INIT_HOOK
+	$(if $(SYSTEMD_TIMESYNCD_USER),mkdir -p $(TARGET_DIR)/var/lib/systemd/timesync)
 	ln -fs multi-user.target \
 		$(TARGET_DIR)/usr/lib/systemd/system/default.target
 endef
@@ -522,6 +523,10 @@ define SYSTEMD_USERS
 	$(SYSTEMD_TIMESYNCD_USER)
 endef
 
+define SYSTEMD_PERMISSIONS
+	$(if $(SYSTEMD_TIMESYNCD_USER),/var/lib/systemd/timesync d 755 systemd-timesync systemd-timesync - - - - -)
+endef
+
 ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 # systemd provides multiple units to autospawn getty as neede
 # * getty at .service to start a getty on normal TTY
-- 
2.27.0
