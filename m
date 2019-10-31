From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 31 Oct 2019 14:37:14 -0600
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: enable systemd services
Message-ID: <20191031203714.112880-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are normally enabled by systemctl preset-all.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/e2fsprogs/e2fsprogs.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 28fd78047f..9a40055a4f 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -74,5 +74,14 @@ define HOST_E2FSPROGS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) install install-libs
 endef
 
+define E2FSPROGS_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/default.target.wants
+	ln -sf ../../../../lib/systemd/system/e2scrub_reap.service \
+		$(TARGET_DIR)/etc/systemd/system/default.target.wants/e2scrub_reap.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/timers.target.wants
+	ln -sf ../../../../lib/systemd/system/e2scrub_all.timer \
+		$(TARGET_DIR)/etc/systemd/system/timers.target.wants/e2scrub_all.timer
+endef
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.20.1
