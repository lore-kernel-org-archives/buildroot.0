From: Will Newton <will.newton@gmail.com>
Date: Mon, 14 Mar 2011 17:24:56 +0000
Subject: [Buildroot] [PATCH] libnss: Add new package.
Message-ID: <AANLkTinFsyQbjv2PvuzV3TDmzMDZkCfAR95_sycwBo1x@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NSS is the Network Security Services library developed as part of
the Mozilla project. It provides similar functions to OpenSSL but
allows MPL, GPL and LGPL licensing.

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/Config.in                  |    1 +
 package/libnss/Config.in           |   13 +++++++
 package/libnss/libnss-cross.patch  |   19 +++++++++++
 package/libnss/libnss-uclibc.patch |   11 ++++++
 package/libnss/libnss.mk           |   62 ++++++++++++++++++++++++++++++++++++
 5 files changed, 106 insertions(+), 0 deletions(-)
 create mode 100644 package/libnss/Config.in
 create mode 100644 package/libnss/libnss-cross.patch
 create mode 100644 package/libnss/libnss-uclibc.patch
 create mode 100644 package/libnss/libnss.mk

diff --git a/package/Config.in b/package/Config.in
index 19c38fa..6bb3a42 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -245,6 +245,7 @@ menu "Crypto"
 source "package/beecrypt/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
+source "package/libnss/Config.in"
 source "package/openssl/Config.in"
 endmenu

diff --git a/package/libnss/Config.in b/package/libnss/Config.in
new file mode 100644
index 0000000..e58aa50
--- /dev/null
+++ b/package/libnss/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBNSS
+	bool "libnss"
+	depends on BR2_PACKAGE_LIBNSPR
+	depends on BR2_PACKAGE_SQLITE
+	depends on BR2_PACKAGE_ZLIB
+	help
+	  Network Security Services (NSS) is a set of libraries designed
+	  to support development of security-enabled client and server
+	  applications. Applications built with NSS can support SSL v2
+	  and v3, TLS, PKCS #5, PKCS #7, PKCS #11, PKCS #12, S/MIME,
+	  and X.509 v3 certificates.
+
+	  http://www.mozilla.org/projects/security/pki/nss/
diff --git a/package/libnss/libnss-cross.patch
b/package/libnss/libnss-cross.patch
new file mode 100644
index 0000000..7670511
--- /dev/null
+++ b/package/libnss/libnss-cross.patch
@@ -0,0 +1,19 @@
+--- libnss-3.12.9.old/mozilla/security/coreconf/Linux.mk	2011-03-01
10:31:21.517847183 +0000
++++ libnss-3.12.9/mozilla/security/coreconf/Linux.mk	2011-03-01
10:33:42.688648237 +0000
+@@ -46,9 +46,13 @@
+ 	IMPL_STRATEGY = _PTH
+ endif
+
+-CC			= gcc
+-CCC			= g++
+-RANLIB			= ranlib
++TARGETCC		= gcc
++TARGETCCC		= g++
++TARGETRANLIB		= ranlib
++
++CC			= $(TARGETCC)
++CCC			= $(TARGETCCC)
++RANLIB			= $(TARGETRANLIB)
+
+ DEFAULT_COMPILER = gcc
+
diff --git a/package/libnss/libnss-uclibc.patch
b/package/libnss/libnss-uclibc.patch
new file mode 100644
index 0000000..e437067
--- /dev/null
+++ b/package/libnss/libnss-uclibc.patch
@@ -0,0 +1,11 @@
+--- libnss-3.12.9.old/mozilla/security/nss/lib/freebl/stubs.c	2011-03-01
10:41:35.226450100 +0000
++++ libnss-3.12.9/mozilla/security/nss/lib/freebl/stubs.c	2011-03-01
10:42:14.628507934 +0000
+@@ -539,7 +539,7 @@
+  * fetch the library if it's loaded. For NSS it should already be loaded
+  */
+ #define freebl_getLibrary(libName)  \
+-    dlopen (libName, RTLD_LAZY|RTLD_NOLOAD)
++    dlopen (libName, RTLD_LAZY)
+
+ #define freebl_releaseLibrary(lib) \
+     if (lib) dlclose(lib)
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
new file mode 100644
index 0000000..b530cc3
--- /dev/null
+++ b/package/libnss/libnss.mk
@@ -0,0 +1,62 @@
+#############################################################
+#
+# libnss
+#
+#############################################################
+LIBNSS_VERSION = 3.12.9
+LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
+LIBNSS_SITE_VERSION = $(subst .,_,$(LIBNSS_VERSION))
+LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(LIBNSS_SITE_VERSION)_RTM/src/
+LIBNSS_SUBDIR = mozilla/security
+LIBNSS_DISTDIR = mozilla/dist
+LIBNSS_INSTALL_STAGING = YES
+LIBNSS_DEPENDENCIES = libnspr sqlite zlib
+
+LIBNSS_BUILD_VARS = MOZILLA_CLIENT=1 \
+		NSPR_INCLUDE_DIR=$(STAGING_DIR)/usr/include/nspr \
+		NSPR_LIB_DIR=$(STAGING_DIR)/usr/lib \
+		BUILD_OPT=1 \
+		NS_USE_GCC=1 \
+		OPTIMIZER="$(TARGET_CFLAGS)" \
+		NSS_USE_SYSTEM_SQLITE=1 \
+		NSS_ENABLE_ECC=1 \
+		NATIVE_CC="$(HOSTCC)" \
+		TARGETCC="$(TARGET_CC)" \
+		TARGETCCC="$(TARGET_CXX)" \
+		TARGETRANLIB="$(TARGET_RANLIB)" \
+		OS_ARCH="Linux" \
+		OS_RELEASE="2.6" \
+		OS_TEST="$(ARCH)"
+
+
+define LIBNSS_BUILD_CMDS
+	$(MAKE1) -C $(@D)/$(LIBNSS_SUBDIR)/nss build_coreconf build_dbm all \
+			SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
+			DIST=$(@D)/$(LIBNSS_DISTDIR) \
+			CHECKLOC= \
+			$(LIBNSS_BUILD_VARS)
+endef
+
+define LIBNSS_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 755 -t $(STAGING_DIR)/usr/lib/ \
+		$(@D)/$(LIBNSS_DISTDIR)/lib/*.so
+	$(INSTALL) -m 755 -d $(STAGING_DIR)/usr/include/nss
+	$(INSTALL) -m 644 -t $(STAGING_DIR)/usr/include/nss \
+		$(@D)/$(LIBNSS_DISTDIR)/public/nss/*
+	$(INSTALL) -m 755 -t $(STAGING_DIR)/usr/lib/ \
+		$(@D)/$(LIBNSS_DISTDIR)/lib/*.a
+endef
+
+define LIBNSS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 -t $(TARGET_DIR)/usr/lib/ \
+		$(@D)/$(LIBNSS_DISTDIR)/lib/*.so
+endef
+
+define LIBNSS_CLEAN_CMDS
+	-$(MAKE1) -C $(@D)/$(LIBNSS_SUBDIR) clobber \
+					clobber_dbm \
+					clobber_coreconf \
+					BUILD_OPT=1
+endef
+
+$(eval $(call GENTARGETS,package,libnss))
-- 
1.7.3.4
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-libnss-Add-new-package.patch
Type: text/x-patch
Size: 5374 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110314/58df823a/attachment.bin>
