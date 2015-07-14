From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 00:19:58 +0200
Subject: [Buildroot] [git commit] ti-gfx: systemd support
Message-ID: <20150714222025.8E12E81973@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4857df721ae0f01892323b9b744ab3950ce2e4d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The startup script too complex to embed it completely into the
.service file, so it is left as a standalone script.

[Thomas:
 - use relative path for the symbolic link
 - slightly tweak the service Description string]

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ti-gfx/ti-gfx.mk      |   10 ++++++++++
 package/ti-gfx/ti-gfx.service |   11 +++++++++++
 2 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
index 061e9fe..5339387 100644
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
+	ln -sf ../../../../usr/lib/systemd/system/ti-gfx.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ti-gfx.service
+endef
+
 define TI_GFX_INSTALL_TARGET_CMDS
 	$(TI_GFX_INSTALL_KM_CMDS)
 	$(TI_GFX_INSTALL_BINS_CMDS)
diff --git a/package/ti-gfx/ti-gfx.service b/package/ti-gfx/ti-gfx.service
new file mode 100644
index 0000000..432dba2
--- /dev/null
+++ b/package/ti-gfx/ti-gfx.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=TI graphics driver
+
+[Service]
+Type=oneshot
+ExecStart=/usr/lib/systemd/scripts/ti-gfx start
+ExecStop=/usr/lib/systemd/scripts/ti-gfx stop
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
