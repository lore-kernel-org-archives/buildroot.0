From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 11:05:52 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/mender: install
 dbus authentication file if dbus is selected
Message-ID: <20210404085354.1778687423@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22ca8558a8912c361595c8ba2dddcab2ba5541cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

While not a requirement to run mender itself, the mender-connect package
requires this file to be installed to talk to mender.

Signed-off-by: Adam Duskett <Aduskett@rivian.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 948e2c3467da778b7bf9b002f98fe2309a88d65a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mender/mender.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 0224e84a47..b79f196a6d 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -76,6 +76,14 @@ endef
 
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
 
+ifeq ($(BR2_PACKAGE_DBUS),y)
+define MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
+	$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.mender.AuthenticationManager.conf \
+		      $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.AuthenticationManager.conf
+endef
+MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
+endif
+
 define MENDER_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender-client.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/mender-client.service
