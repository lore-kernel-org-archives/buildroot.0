From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 30 Jan 2021 10:30:35 +0100
Subject: [Buildroot] [PATCH-2020.02.x 1/2] package/belle-sip: new package
Message-ID: <20210130093036.1245404-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Belle-sip is a modern library implementing SIP (RFC 3261) transport,
transaction and dialog layers.

http://www.linphone.org/technical-corner/belle-sip

[Thomas: select mbedtls as support for crypto is needed in bctoolbox]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/belle-sip/Config.in      | 22 ++++++++++++++++++++
 package/belle-sip/belle-sip.hash |  3 +++
 package/belle-sip/belle-sip.mk   | 35 ++++++++++++++++++++++++++++++++
 5 files changed, 62 insertions(+)
 create mode 100644 package/belle-sip/Config.in
 create mode 100644 package/belle-sip/belle-sip.hash
 create mode 100644 package/belle-sip/belle-sip.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e642a0d1db..96055b3912 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -799,6 +799,7 @@ F:	package/libmaxminddb/
 F:	package/openzwave/
 
 N:	Fabrice Fontaine <fontaine.fabrice@gmail.com>
+F:	package/belle-sip/
 F:	package/boinc/
 F:	package/cairo/
 F:	package/duktape/
diff --git a/package/Config.in b/package/Config.in
index 0a3cda65f2..78da6a8142 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1612,6 +1612,7 @@ menu "Networking"
 	source "package/azmq/Config.in"
 	source "package/azure-iot-sdk-c/Config.in"
 	source "package/batman-adv/Config.in"
+	source "package/belle-sip/Config.in"
 	source "package/bluez5_utils-headers/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/canfestival/Config.in"
diff --git a/package/belle-sip/Config.in b/package/belle-sip/Config.in
new file mode 100644
index 0000000000..8e4de366e4
--- /dev/null
+++ b/package/belle-sip/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_BELLE_SIP
+	bool "belle-sip"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # bctoolbox
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_BCTOOLBOX
+	# needs crypto support in bctoolbox
+	select BR2_PACKAGE_MBEDTLS
+	help
+	  Belle-sip is a modern library implementing SIP (RFC 3261)
+	  transport, transaction and dialog layers.
+
+	  http://www.linphone.org/technical-corner/belle-sip
+
+comment "belle-sip needs a toolchain w/ threads, C++, dynamic library, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+
+comment "belle-sip needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/belle-sip/belle-sip.hash b/package/belle-sip/belle-sip.hash
new file mode 100644
index 0000000000..889ad2be70
--- /dev/null
+++ b/package/belle-sip/belle-sip.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  3ac7051ea6ac758cccbf1483a5dd6cda4293b5cde1370a3f0d298e3a6f0ee032  belle-sip-4.3.1.tar.gz
+sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/belle-sip/belle-sip.mk b/package/belle-sip/belle-sip.mk
new file mode 100644
index 0000000000..1daef1d2df
--- /dev/null
+++ b/package/belle-sip/belle-sip.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# belle-sip
+#
+################################################################################
+
+BELLE_SIP_VERSION = 4.3.1
+BELLE_SIP_SITE = \
+	https://gitlab.linphone.org/BC/public/belle-sip/-/archive/$(BELLE_SIP_VERSION)
+BELLE_SIP_LICENSE = GPL-3.0+
+BELLE_SIP_LICENSE_FILES = LICENSE.txt
+BELLE_SIP_INSTALL_STAGING = YES
+BELLE_SIP_DEPENDENCIES = \
+	bctoolbox \
+	$(if $(BR2_PACKAGE_ZLIB),zlib)
+BELLE_SIP_CONF_OPTS = \
+	-DENABLE_STRICT=OFF \
+	-DENABLE_TESTS=OFF
+
+ifeq ($(BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY),y)
+BELLE_SIP_CONF_OPTS += -DENABLE_MDNS=ON
+BELLE_SIP_DEPENDENCIES += avahi
+else
+BELLE_SIP_CONF_OPTS += -DENABLE_MDNS=OFF
+endif
+
+ifeq ($(BR2_STATIC_LIBS),y)
+BELLE_SIP_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+BELLE_SIP_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+BELLE_SIP_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.29.2
