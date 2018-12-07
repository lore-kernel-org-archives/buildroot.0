From: Trent Piepho <tpiepho@impinj.com>
Date: Fri, 7 Dec 2018 18:13:30 +0000
Subject: [Buildroot] [PATCH v2] libp11: Add new package for OpenSSL PKCS#11
 engine
Message-ID: <20181207181314.24051-1-tpiepho@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Library for using PKCS#11, which includes an engine for OpenSSL that
lets it use PKCS#11 modules.  Which is really what this package is
about, not that libp11 library itself, which has no users outside the of
OpenSSL engine.

If p11-kit is enabled, configure the engine to use that as the default
PKCS#11 module.  That module is a sort of multiplexer that allows
multiple modules to be used at once, so it makes sense to use it even if
there are other modules present, e.g. softhsm2, nssckbi, pkcs11-proxy,
ykcs11, etc.

A host package is created too, with a host configuration option.  Since
this a dynamically loaded module, there is no build time reason to
select it from a host package.  It could be used by host openssl, to
allow host rauc to sign a software update bundle using a key from a HSM
with a PKCS#11 interface.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
---
 package/Config.in             |  1 +
 package/Config.in.host        |  1 +
 package/libp11/Config.in      |  7 +++++++
 package/libp11/Config.in.host |  6 ++++++
 package/libp11/libp11.hash    |  3 +++
 package/libp11/libp11.mk      | 21 +++++++++++++++++++++
 6 files changed, 39 insertions(+)
 create mode 100644 package/libp11/Config.in
 create mode 100644 package/libp11/Config.in.host
 create mode 100644 package/libp11/libp11.hash
 create mode 100644 package/libp11/libp11.mk

diff --git a/package/Config.in b/package/Config.in
index f6252f2abb..940e7d2d2c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1177,6 +1177,7 @@ menu "Crypto"
 	source "package/libmcrypt/Config.in"
 	source "package/libmhash/Config.in"
 	source "package/libnss/Config.in"
+	source "package/libp11/Config.in"
 	source "package/libscrypt/Config.in"
 	source "package/libsecret/Config.in"
 	source "package/libsha1/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 06fb2e1996..89b39b0007 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -31,6 +31,7 @@ menu "Host utilities"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jq/Config.in.host"
 	source "package/jsmin/Config.in.host"
+	source "package/libp11/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
 	source "package/mfgtools/Config.in.host"
diff --git a/package/libp11/Config.in b/package/libp11/Config.in
new file mode 100644
index 0000000000..0b9a739db3
--- /dev/null
+++ b/package/libp11/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBP11
+	bool "libp11"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  OpenSSL engine for PKCS#11 modules.  Part of the OpenSC project.
+
+	  https://github.com/OpenSC/OpenSC/wiki
diff --git a/package/libp11/Config.in.host b/package/libp11/Config.in.host
new file mode 100644
index 0000000000..ccc171025a
--- /dev/null
+++ b/package/libp11/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_LIBP11
+	bool "host libp11"
+	help
+	  OpenSSL engine for PKCS#11 modules.  Part of the OpenSC project.
+
+	  https://github.com/OpenSC/OpenSC/wiki
diff --git a/package/libp11/libp11.hash b/package/libp11/libp11.hash
new file mode 100644
index 0000000000..01cea6466b
--- /dev/null
+++ b/package/libp11/libp11.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 9d1c76d74c21ca224f96204982097ebc6b956f645b2b0b5f9c502a20e9ffcfd8  libp11-0.4.9.tar.gz
+sha256 d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING
diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
new file mode 100644
index 0000000000..9dc098870e
--- /dev/null
+++ b/package/libp11/libp11.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# libp11
+#
+################################################################################
+
+LIBP11_VERSION = 0.4.9
+LIBP11_SITE = https://github.com/OpenSC/libp11/releases/download/libp11-$(LIBP11_VERSION)
+LIBP11_DEPENDENCIES = openssl
+LIBP11_INSTALL_STAGING = YES
+LIBP11_LICENSE = LGPLv2.1
+LIBP11_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_P11_KIT),y)
+LIBP11_CONF_OPTS += --with-pkcs11-module=/usr/lib/p11-kit-proxy.so
+endif
+
+HOST_LIBP11_DEPENDENCIES = host-openssl
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.14.4
