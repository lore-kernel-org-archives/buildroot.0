From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 20 Mar 2021 15:28:35 -0700
Subject: [Buildroot] [PATCH 4/4] package/mender: install dbus authentication
 file if dbus is selected
In-Reply-To: <20210320222835.3951325-1-aduskett@gmail.com>
References: <20210320222835.3951325-1-aduskett@gmail.com>
Message-ID: <20210320222835.3951325-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@rivian.com>

While not a requirement to run mender itself, the mender-connect package
requires this file to be installed to talk to mender.

Signed-off-by: Adam Duskett <Aduskett@rivian.com>
---
 package/mender/mender.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index a5b5654ff9..fc077c6fa2 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -78,6 +78,15 @@ endef
 
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
 
+ifeq ($(BR2_PACKAGE_DBUS),y)
+MENDER_DEPENDENCIES += dbus
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
-- 
2.25.1
