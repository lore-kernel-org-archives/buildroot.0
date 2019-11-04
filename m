From: unixmania at gmail.com <unixmania@gmail.com>
Date: Mon,  4 Nov 2019 09:48:44 -0300
Subject: [Buildroot] [PATCH] package/modem-manager: use libqmi and libmbim
 if they are selected
Message-ID: <20191104124844.8112-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

If we have a cnfiguration like this

    BR2_PACKAGE_MODEM_MANAGER=y
    # BR2_PACKAGE_MODEM_MANAGER_LIBMBIM is not set
    BR2_PACKAGE_MODEM_MANAGER_LIBQMI=y
    [...]
    BR2_PACKAGE_LIBMBIM=y

then libqmi is configured with --enable-mbim-qmux and requires libmbim
so ModemManager must be configured --with-mbim otherwise it fails to
link due to missing libmbim symbols required by libqmi:

    qmi-endpoint-mbim.c:(.text+0x158): undefined reference to `mbim_device_close_finish'

Prevent this kind of error by using a simpler approach:

- Always enable MBIM support if libmbim is selected
- Drop BR2_PACKAGE_MODEM_MANAGER_LIBMBIM and add a legacy option that
  selects BR2_PACKAGE_LIBMBIM
- Always enable QMI support if libqmi is selected
- Drop BR2_PACKAGE_MODEM_MANAGER_LIBQMI and add a legacy option that
  selects BR2_PACKAGE_LIBQMI
- Update the help text explaining how to enable MBIM and QMI

Fixes:
  http://autobuild.buildroot.net/results/9c6b8ec2b9cc31f1ab460532c378731ab455210c/

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 Config.in.legacy                       | 16 ++++++++++++++++
 package/modem-manager/Config.in        | 17 +++--------------
 package/modem-manager/modem-manager.mk |  4 ++--
 package/network-manager/Config.in      |  7 ++++---
 4 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index fcb10b1291..3336ef85d1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,22 @@ endif
 
 comment "Legacy options removed in 2019.11"
 
+config BR2_PACKAGE_MODEM_MANAGER_LIBMBIM
+	bool "BR2_PACKAGE_MODEM_MANAGER_LIBMBIM has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LIBMBIM
+	help
+	  Select BR2_PACKAGE_LIBMBIM to enable support for MBIM protocol
+	  in ModemManager
+
+config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
+	bool "BR2_PACKAGE_MODEM_MANAGER_LIBQMI has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LIBQMI
+	help
+	  Select BR2_PACKAGE_LIBQMI to enable support for QMI protocol
+	  in ModemManager
+
 config BR2_PACKAGE_ALLJOYN
 	bool "alljoyn was removed"
 	select BR2_LEGACY
diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index c4c723776d..e7987ad1e6 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -10,22 +10,11 @@ config BR2_PACKAGE_MODEM_MANAGER
 	  ModemManager is a DBus-activated daemon which controls mobile
 	  broadband (2G/3G/4G) devices and connections.
 
-	  http://www.freedesktop.org/wiki/Software/ModemManager/
-
-if BR2_PACKAGE_MODEM_MANAGER
+	  Select BR2_PACKAGE_LIBMBIM to enable support for MBIM protocol
 
-config BR2_PACKAGE_MODEM_MANAGER_LIBMBIM
-	bool "MBIM support"
-	select BR2_PACKAGE_LIBMBIM
-	help
-	  This option enables support for MBIM protocol
+	  Select BR2_PACKAGE_LIBQMI to enable support for QMI protocol
 
-config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
-	bool "QMI support"
-	select BR2_PACKAGE_LIBQMI
-	help
-	  This option enables support for QMI protocol
-endif
+	  http://www.freedesktop.org/wiki/Software/ModemManager/
 
 comment "modemmanager needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index dde841b80a..554d1a235e 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -13,7 +13,7 @@ MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
 MODEM_MANAGER_INSTALL_STAGING = YES
 MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
 
-ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
+ifeq ($(BR2_PACKAGE_LIBQMI),y)
 MODEM_MANAGER_DEPENDENCIES += libqmi
 MODEM_MANAGER_CONF_OPTS += --with-qmi
 else
@@ -27,7 +27,7 @@ else
 MODEM_MANAGER_CONF_OPTS += --without-udev
 endif
 
-ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBMBIM),y)
+ifeq ($(BR2_PACKAGE_LIBMBIM),y)
 MODEM_MANAGER_DEPENDENCIES += libmbim
 MODEM_MANAGER_CONF_OPTS += --with-mbim
 else
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 1257e08e6f..79ad161f31 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -37,10 +37,11 @@ config BR2_PACKAGE_NETWORK_MANAGER_TUI
 config BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER
 	bool "modem-manager support"
 	select BR2_PACKAGE_MODEM_MANAGER
-	select BR2_PACKAGE_MODEM_MANAGER_LIBMBIM
-	select BR2_PACKAGE_MODEM_MANAGER_LIBQMI
+	select BR2_PACKAGE_LIBMBIM
+	select BR2_PACKAGE_LIBQMI
 	help
-	  This option enables support for ModemManager
+	  This option enables support for ModemManager with support for
+	  MBIM and QMI protocols
 
 config BR2_PACKAGE_NETWORK_MANAGER_PPPD
 	bool "pppd support"
-- 
2.18.1
