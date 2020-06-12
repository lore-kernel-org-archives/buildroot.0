From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Jun 2020 01:24:32 +0200
Subject: [Buildroot] [PATCH v1 2/3] package/iwd: add basic configuration file
In-Reply-To: <20200612232433.18442-1-ps.report@gmx.net>
References: <20200612232433.18442-1-ps.report@gmx.net>
Message-ID: <20200612232433.18442-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add basic /etc/iwd/main.conf configuration file to enable
network configuration (use built-in dhcp client).

For the non systemd case select the openresolv package to
fulfill the iwd resolvconf requirement.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/iwd/Config.in |  1 +
 package/iwd/iwd.mk    | 19 +++++++++++++++++++
 package/iwd/main.conf |  3 +++
 3 files changed, 23 insertions(+)
 create mode 100644 package/iwd/main.conf

diff --git a/package/iwd/Config.in b/package/iwd/Config.in
index 4501017630..6d42cac35c 100644
--- a/package/iwd/Config.in
+++ b/package/iwd/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_IWD
 	depends on BR2_USE_WCHAR # ell
 	select BR2_PACKAGE_DBUS # runtime
 	select BR2_PACKAGE_ELL
+	select BR2_PACKAGE_OPENRESOLV if !BR2_INIT_SYSTEMD
 	help
 	  iNet Wireless daemon (iwd)
 
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 32ff175933..d105d3b128 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -46,4 +46,23 @@ else
 IWD_CONF_OPTS += --disable-systemd-service
 endif
 
+define IWD_INSTALL_CONFIG_FILE
+	mkdir -p $(TARGET_DIR)/etc/iwd
+	$(INSTALL) -m 644 package/iwd/main.conf $(TARGET_DIR)/etc/iwd/main.conf
+endef
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+define IWD_CONFIG_FILE_NAME_RESOLV_SERVICE
+	echo -e "[Network]\nNameResolvingService=systemd" >> $(TARGET_DIR)/etc/iwd/main.conf
+endef
+else
+define IWD_CONFIG_FILE_NAME_RESOLV_SERVICE
+	echo -e "[Network]\nNameResolvingService=resolvconf" >> $(TARGET_DIR)/etc/iwd/main.conf
+endef
+endif
+
+IWD_POST_INSTALL_TARGET_HOOKS += \
+	IWD_INSTALL_CONFIG_FILE \
+	IWD_CONFIG_FILE_NAME_RESOLV_SERVICE
+
 $(eval $(autotools-package))
diff --git a/package/iwd/main.conf b/package/iwd/main.conf
new file mode 100644
index 0000000000..c26a50d302
--- /dev/null
+++ b/package/iwd/main.conf
@@ -0,0 +1,3 @@
+# use built-in dhcp client
+[General]
+EnableNetworkConfiguration=true
-- 
2.26.2
