From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 18:20:23 +0200
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xserver_xorg-server: add systemd init
Message-ID: <20200808161437.E35AC815E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97867fc593624b86024b7d9c2c373f93b6e463c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

run with same options as in S40xorg

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xserver_xorg-server/xorg.service           | 11 +++++++++++
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/xorg.service b/package/x11r7/xserver_xorg-server/xorg.service
new file mode 100644
index 0000000000..2745711cf3
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xorg.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Xorg server
+After=network.target
+
+[Service]
+Type=simple
+ExecStart=/usr/bin/Xorg :0.0 vt01 -s 0 -noreset -allowMouseOpenFail
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 8ccc04224d..854123981d 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -224,6 +224,11 @@ XSERVER_XORG_SERVER_CONF_OPTS += --with-sha1=libsha1
 XSERVER_XORG_SERVER_DEPENDENCIES += libsha1
 endif
 
+define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/x11r7/xserver_xorg-server/xorg.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/xorg.service
+endef
+
 define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/x11r7/xserver_xorg-server/S40xorg \
 		$(TARGET_DIR)/etc/init.d/S40xorg
