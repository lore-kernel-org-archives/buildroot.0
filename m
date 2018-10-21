From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 16:07:10 +0200
Subject: [Buildroot] [git commit] package/mender: use MENDER_PKGDIR to
 access local files
Message-ID: <20181021140651.9B77B88290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bef30a9f4b58194e02ff5b2b6b78a3095c72c72c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Utilize the predefined variable MENDER_PKGDIR which points to the
directory containing mender.mk and Config.in, along with the local
files.

One benefit is also that it works when BR2_EXTERNAL is used, which
makes it easier to "backport" this to an older external tree.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender/mender.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 9275426a7b..37a99c1f18 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -38,10 +38,9 @@ define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/scripts
 	echo -n "2" > $(TARGET_DIR)/etc/mender/scripts/version
 
-	$(INSTALL) -D -m 0644 package/mender/mender.conf \
+	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender.conf \
 		$(TARGET_DIR)/etc/mender/mender.conf
-
-	$(INSTALL) -D -m 0644 package/mender/server.crt \
+	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/server.crt \
 		$(TARGET_DIR)/etc/mender/server.crt
 
 	$(INSTALL) -D -m 0755 $(@D)/support/mender-device-identity \
@@ -55,7 +54,7 @@ endef
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
 
 define MENDER_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 package/mender/mender.service \
+	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/mender.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -fs ../../../../usr/lib/systemd/system/mender.service \
