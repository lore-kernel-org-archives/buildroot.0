From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 21:56:41 +0200
Subject: [Buildroot] [git commit] package/iwd: add basic configuration file
Message-ID: <20200617195614.46633842B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=119a0028c134f9c82fc2803c86fe35258228d905
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add basic /etc/iwd/main.conf configuration file to enable
network configuration (use built-in dhcp client).

For the non systemd-resolved case select the openresolv package
to fulfill the iwd resolvconf requirement (and adjust the
configuration file accordingly).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iwd/Config.in |  1 +
 package/iwd/iwd.mk    | 13 +++++++++++++
 package/iwd/main.conf |  5 +++++
 3 files changed, 19 insertions(+)

diff --git a/package/iwd/Config.in b/package/iwd/Config.in
index ec53d13047..4e85fb4fd7 100644
--- a/package/iwd/Config.in
+++ b/package/iwd/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_IWD
 	depends on BR2_USE_WCHAR # ell
 	select BR2_PACKAGE_DBUS # runtime
 	select BR2_PACKAGE_ELL
+	select BR2_PACKAGE_OPENRESOLV if !BR2_PACKAGE_SYSTEMD_RESOLVED
 	help
 	  iNet Wireless daemon (iwd)
 
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 32ff175933..d074964267 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -46,4 +46,17 @@ else
 IWD_CONF_OPTS += --disable-systemd-service
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
+IWD_RESOLV_SERVICE = systemd
+else
+IWD_RESOLV_SERVICE = resolvconf
+endif
+
+define IWD_INSTALL_CONFIG_FILE
+	$(INSTALL) -D -m 644 package/iwd/main.conf $(TARGET_DIR)/etc/iwd/main.conf
+	$(SED) 's,__RESOLV_SERVICE__,$(IWD_RESOLV_SERVICE),' $(TARGET_DIR)/etc/iwd/main.conf
+endef
+
+IWD_POST_INSTALL_TARGET_HOOKS += IWD_INSTALL_CONFIG_FILE
+
 $(eval $(autotools-package))
diff --git a/package/iwd/main.conf b/package/iwd/main.conf
new file mode 100644
index 0000000000..22c1cd7339
--- /dev/null
+++ b/package/iwd/main.conf
@@ -0,0 +1,5 @@
+# use built-in dhcp client
+[General]
+EnableNetworkConfiguration=true
+[Network]
+NameResolvingService=__RESOLV_SERVICE__
