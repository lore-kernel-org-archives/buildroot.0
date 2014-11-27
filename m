From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:56:37 +0100
Subject: [Buildroot] [PATCHv2 19/74] gpsd: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417125452-18705-20-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also makes the installation init script unconditional.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpsd/gpsd.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 7dc27e8..5092b38 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -206,10 +206,11 @@ define GPSD_INSTALL_TARGET_CMDS
 		$(SCONS) \
 		$(GPSD_SCONS_OPTS) \
 		install)
-	if [ ! -f $(TARGET_DIR)/etc/init.d/S50gpsd ]; then \
-		$(INSTALL) -m 0755 -D package/gpsd/S50gpsd $(TARGET_DIR)/etc/init.d/S50gpsd; \
-		$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd; \
-	fi
+endef
+
+define GPSD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/gpsd/S50gpsd $(TARGET_DIR)/etc/init.d/S50gpsd
+	$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd
 endef
 
 define GPSD_INSTALL_STAGING_CMDS
-- 
2.1.0
