From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 22:56:11 +0100
Subject: [Buildroot] [git commit] gpsd: use <pkg>_INSTALL_INIT_SYSV mechanism
Message-ID: <20141201221140.DB78F8002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cbacf1cf2af80960484aead4ae6b012301be6a6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also makes the installation of the init script unconditional.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/gpsd.mk |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

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
