From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Apr 2019 21:31:58 +0200
Subject: [Buildroot] [git commit] package/libp11: new package
Message-ID: <20190404192838.EADC88CA88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4fc706f556c80046bf5cba93b1964c376c71208
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Library for using PKCS#11, which includes an engine for OpenSSL that
lets it use PKCS#11 modules.  Which is really what this package is
about, not that libp11 library itself, which has no users outside the
of OpenSSL engine.

If p11-kit is enabled, configure the engine to use that as the default
PKCS#11 module.  That module is a sort of multiplexer that allows
multiple modules to be used at once, so it makes sense to use it even
if there are other modules present, e.g. softhsm2, nssckbi,
pkcs11-proxy, ykcs11, etc.

A host package is created too, with a host configuration option.
Since this a dynamically loaded module, there is no build time reason
to select it from a host package.  It could be used by host openssl,
to allow host rauc to sign a software update bundle using a key from a
HSM with a PKCS#11 interface.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
Tested-by: Frank Hunleth <fhunleth@troodon-software.com>
[Thomas:
 - add entry in DEVELOPERS file
 - add missing !BR2_STATIC_LIBS dependency
 - fix license information, as noticed by Frank Hunleth
 - add missing dependency on host-pkgconf, needed by the configure
   script to detect openssl
 - explicitly pass --with-enginesdir as the value returned by
   pkg-config is incorrectly prefixed by the sysroot]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                    |  3 +++
 package/Config.in             |  1 +
 package/Config.in.host        |  1 +
 package/libp11/Config.in      | 12 ++++++++++++
 package/libp11/Config.in.host |  6 ++++++
 package/libp11/libp11.hash    |  3 +++
 package/libp11/libp11.mk      | 26 ++++++++++++++++++++++++++
 7 files changed, 52 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8c6d5f9959..cce56c5ef2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2202,6 +2202,9 @@ F:	toolchain/
 N:	Timo Ketola <timo.ketola@exertus.fi>
 F:	package/fbgrab/
 
+N:	Trent Piepho <tpiepho@impinj.com>
+F:	package/libp11/
+
 N:	Tzu-Jung Lee <roylee17@gmail.com>
 F:	package/dropwatch/
 F:	package/tstools/
diff --git a/package/Config.in b/package/Config.in
index 5c42fb141d..dda4a6e98f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1198,6 +1198,7 @@ menu "Crypto"
 	source "package/libmcrypt/Config.in"
 	source "package/libmhash/Config.in"
 	source "package/libnss/Config.in"
+	source "package/libp11/Config.in"
 	source "package/libscrypt/Config.in"
 	source "package/libsecret/Config.in"
 	source "package/libsha1/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index fcbeb5b7f4..bc7e71882b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -31,6 +31,7 @@ menu "Host utilities"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jq/Config.in.host"
 	source "package/jsmin/Config.in.host"
+	source "package/libp11/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
 	source "package/mender-artifact/Config.in.host"
diff --git a/package/libp11/Config.in b/package/libp11/Config.in
new file mode 100644
index 0000000000..4d7ff56895
--- /dev/null
+++ b/package/libp11/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBP11
+	bool "libp11"
+	depends on !BR2_STATIC_LIBS # dlopen
+	select BR2_PACKAGE_OPENSSL
+	help
+	  OpenSSL engine for PKCS#11 modules. Part of the OpenSC
+	  project.
+
+	  https://github.com/OpenSC/OpenSC/wiki
+
+comment "libp11 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
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
index 0000000000..08c32dcd15
--- /dev/null
+++ b/package/libp11/libp11.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# libp11
+#
+################################################################################
+
+LIBP11_VERSION = 0.4.9
+LIBP11_SITE = https://github.com/OpenSC/libp11/releases/download/libp11-$(LIBP11_VERSION)
+LIBP11_DEPENDENCIES = openssl host-pkgconf
+LIBP11_INSTALL_STAGING = YES
+LIBP11_LICENSE = LGPL-2.1+
+LIBP11_LICENSE_FILES = COPYING
+
+# pkg-config returns a libcrypto enginesdir prefixed with the sysroot,
+# so let's rip it out.
+LIBP11_CONF_OPTS = \
+	--with-enginesdir=`$(PKG_CONFIG_HOST_BINARY) --variable enginesdir libcrypto | xargs readlink -f | sed 's%^$(STAGING_DIR)%%'`
+
+ifeq ($(BR2_PACKAGE_P11_KIT),y)
+LIBP11_CONF_OPTS += --with-pkcs11-module=/usr/lib/p11-kit-proxy.so
+endif
+
+HOST_LIBP11_DEPENDENCIES = host-openssl
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
