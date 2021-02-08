From: Kamel Bouhara <kamel.bouhara@bootlin.com>
Date: Mon,  8 Feb 2021 16:11:06 +0100
Subject: [Buildroot] [PATCH 2/2] package/usbguard: new package
In-Reply-To: <20210208151106.196836-1-kamel.bouhara@bootlin.com>
References: <20210208151106.196836-1-kamel.bouhara@bootlin.com>
Message-ID: <20210208151106.196836-3-kamel.bouhara@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 package/Config.in              |  1 +
 package/usbguard/Config.in     | 19 +++++++++++++++++++
 package/usbguard/usbguard.hash |  3 +++
 package/usbguard/usbguard.mk   | 40 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 63 insertions(+)
 create mode 100644 package/usbguard/Config.in
 create mode 100644 package/usbguard/usbguard.hash
 create mode 100644 package/usbguard/usbguard.mk

diff --git a/package/Config.in b/package/Config.in
index fd06b9eeaa..6a8cb1e58b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -561,6 +561,7 @@ endmenu
 	source "package/upower/Config.in"
 	source "package/usb_modeswitch/Config.in"
 	source "package/usb_modeswitch_data/Config.in"
+	source "package/usbguard/Config.in"
 	source "package/usbmount/Config.in"
 	source "package/usbutils/Config.in"
 	source "package/w_scan/Config.in"
diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
new file mode 100644
index 0000000000..921ff99aca
--- /dev/null
+++ b/package/usbguard/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_USBGUARD
+	bool "usbguard"
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_SYSTEMD
+	depends on BR2_PACKAGE_PROTOBUF
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	select BR2_PACKAGE_LIBQB
+	help
+	  The USBGuard software framework.
+
+	  https://usbguard.github.io/
+
+comment "usbguard needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || \
+	!BR2_TOOLCHAIN_HAS_THREADS || \
+	!BR2_INSTALL_LIBSDTCPP || \
+	!BR2_PACKAGE_SYSTEMD
diff --git a/package/usbguard/usbguard.hash b/package/usbguard/usbguard.hash
new file mode 100644
index 0000000000..fd77acc75a
--- /dev/null
+++ b/package/usbguard/usbguard.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  5617986cd5dd1a2d311041648a1977d836cf4e33a4121d7f82599f21496abc42  usbguard-1.0.0.tar.gz
+sha256  a45d0bb572ed792ed34627a72621834b3ba92aab6e2cc4e04301dee7a728d753  LICENSE
diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
new file mode 100644
index 0000000000..1fa255d7a7
--- /dev/null
+++ b/package/usbguard/usbguard.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+## usbguard
+#
+################################################################################
+
+USBGUARD_VERSION = 1.0.0
+USBGUARD_SITE = https://github.com/USBGuard/usbguard/releases/download/usbguard-$(USBGUARD_VERSION)
+USBGUARD_LICENSE = GPL-2.0+
+USBGUARD_LICENSE_FILES = LICENSE
+USBGUARD_CONF_OPTS = --with-bundled-catch --with-bundled-pegtl \
+		    --disable-debug-build --without-dbus --without-polkit \
+		    --disable-seccomp --disable-umockdev --enable-systemd
+
+USBGUARD_DEPENDENCIES = systemd libqb protobuf
+
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+USBGUARD_CONF_OPTS += --with-crypto-library=openssl
+USBGUARD_DEPENDENCIES += libopenssl
+endif
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+USBGUARD_CONF_OPTS += --with-crypto-library=gcrypt
+USBGUARD_DEPENDENCIES += libgcrypt
+endif
+ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
+USBGUARD_CONF_OPTS += --with-crypto-library=sodium
+USBGUARD_DEPENDENCIES += libsodium
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+USBGUARD_CONF_OPTS += --enable-seccomp
+USBGUARD_DEPENDENCIES += libseccomp
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
+USBGUARD_CONF_OPTS += --enable-libcapng
+USBGUARD_DEPENDENCIES += libcap-ng
+endif
+
+$(eval $(autotools-package))
-- 
2.11.0
