From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Apr 2021 20:05:05 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] Revert "package/mender:
 install dbus authentication file if dbus is selected"
Message-ID: <20210407174301.C06BA8165E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28283f68d6fa258624c1c9cf8c8ad713a1a8259f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes:
http://autobuild.buildroot.net/results/841d49ffa0ce275fde088b46845d7c74bd30b82a

This reverts commit 22ca8558a8912c361595c8ba2dddcab2ba5541cd.

io.mender.AuthenticationManager.conf was only added in mender 2.5.0:
https://github.com/mendersoftware/mender/commit/2e233164d5f67228c6f6472b4d434f14de6e81be

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mender/mender.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index b79f196a6d..0224e84a47 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -76,14 +76,6 @@ endef
 
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
 
-ifeq ($(BR2_PACKAGE_DBUS),y)
-define MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
-	$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.mender.AuthenticationManager.conf \
-		      $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.AuthenticationManager.conf
-endef
-MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
-endif
-
 define MENDER_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender-client.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/mender-client.service
