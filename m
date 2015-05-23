From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:07:32 +0300
Subject: [Buildroot] [PATCH 27/38] ti-gfx: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <3afa99779c3b299f255ea8e1330c124f31b02fd6.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The startup script too complex to embed it completely into
the .service file, so it is left as a standalone script.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/ti-gfx/ti-gfx.mk      | 10 ++++++++++
 package/ti-gfx/ti-gfx.service | 11 +++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 package/ti-gfx/ti-gfx.service

diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
index 061e9fe..daee973 100644
--- a/package/ti-gfx/ti-gfx.mk
+++ b/package/ti-gfx/ti-gfx.mk
@@ -190,6 +190,16 @@ define TI_GFX_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S80ti-gfx
 endef
 
+define TI_GFX_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 755 package/ti-gfx/S80ti-gfx \
+		$(TARGET_DIR)/usr/lib/systemd/scripts/ti-gfx
+	$(INSTALL) -D -m 644 package/ti-gfx/ti-gfx.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/ti-gfx.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/ti-gfx.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ti-gfx.service
+endef
+
 define TI_GFX_INSTALL_TARGET_CMDS
 	$(TI_GFX_INSTALL_KM_CMDS)
 	$(TI_GFX_INSTALL_BINS_CMDS)
diff --git a/package/ti-gfx/ti-gfx.service b/package/ti-gfx/ti-gfx.service
new file mode 100644
index 0000000..432fadb
--- /dev/null
+++ b/package/ti-gfx/ti-gfx.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=PVR graphics driver
+
+[Service]
+Type=oneshot
+ExecStart=/usr/lib/systemd/scripts/ti-gfx start
+ExecStop=/usr/lib/systemd/scripts/ti-gfx stop
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
