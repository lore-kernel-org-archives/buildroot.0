From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 18:59:01 +0200
Subject: [Buildroot] [git commit] boinc: replace systemd script
Message-ID: <20180428170128.CBD4489035@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b14aea4eb11b8fdd653518e08e3211903ee07c26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove buildroot systemd script to use the script embedded by boinc
since version 7.9.1.
Set BOINC_USERS to be able to use this script

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boinc/boinc-client.service | 10 ----------
 package/boinc/boinc.mk             |  6 ++++--
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/package/boinc/boinc-client.service b/package/boinc/boinc-client.service
deleted file mode 100644
index 9de940e938..0000000000
--- a/package/boinc/boinc-client.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=BOINC client
-After=network.target
-
-[Service]
-ExecStart=/usr/bin/boinc_client
-Restart=always
-
-[Install]
-WantedBy=multi-user.target
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 257987291c..04aacc2c3d 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -44,14 +44,16 @@ endef
 
 BOINC_POST_INSTALL_TARGET_HOOKS += BOINC_REMOVE_UNNEEDED_FILE
 
+define BOINC_USERS
+	boinc -1 boinc -1 * /var/lib/boinc - BOINC user
+endef
+
 define BOINC_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/boinc/S99boinc-client \
 		$(TARGET_DIR)/etc/init.d/S99boinc-client
 endef
 
 define BOINC_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/boinc/boinc-client.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/boinc-client.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -sf ../../../../usr/lib/systemd/system/boinc-client.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/boinc-client.service
