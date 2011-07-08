From: Will Newton <will.newton@gmail.com>
Date: Fri, 8 Jul 2011 14:27:30 +0100
Subject: [Buildroot] [PATCH v2] libnss: Add new package.
Message-ID: <CAFbHwiTz-KPomDTeSsn_s2Ax+YrT=Mo3r_udBs1Aig=Hv1EYrg@mail.gmail.com>
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
 package/libnss/Config.in           |   17 +++++++++
 package/libnss/libnss-cross.patch  |   27 ++++++++++++++
 package/libnss/libnss-uclibc.patch |   19 ++++++++++
 package/libnss/libnss.mk           |   67 ++++++++++++++++++++++++++++++++++++
 5 files changed, 131 insertions(+), 0 deletions(-)
 create mode 100644 package/libnss/Config.in
 create mode 100644 package/libnss/libnss-cross.patch
 create mode 100644 package/libnss/libnss-uclibc.patch
 create mode 100644 package/libnss/libnss.mk

v2 - Address issues raised by Peter on the list.

diff --git a/package/Config.in b/package/Config.in
index 09aa76a..c0e4f35 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -249,6 +249,7 @@ menu "Crypto"
 source "package/beecrypt/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
+source "package/libnss/Config.in"
 source "package/openssl/Config.in"
 endmenu

diff --git a/package/libnss/Config.in b/package/libnss/Config.in
new file mode 100644
index 0000000..55928a4
--- /dev/null
+++ b/package/libnss/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBNSS
+	bool "libnss"
+	select BR2_PACKAGE_LIBNSPR
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_ZLIB
+	depends on BR2_LARGEFILE
+	help
+	  Network Security Services (NSS) is a set of libraries designed
+	  to support development of security-enabled client and server
+	  applications. Applications built with NSS can support SSL v2
+	  and v3, TLS, PKCS #5, PKCS #7, PKCS #11, PKCS #12, S/MIME,
+	  and X.509 v3 certificates.
+
+	  http://www.mozilla.org/projects/security/pki/nss/
+
+comment "libnss requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/libnss/libnss-cross.patch
b/package/libnss/libnss-cross.patch
new file mode 100644
index 0000000..8a5cd10
--- /dev/null
+++ b/package/libnss/libnss-cross.patch
@@ -0,0 +1,27 @@
+
+This patch allows us to set a value for the cross compiler via TARGETCC without
+setting CC on the command line. CC is used for host tools as well as cross
+compiled code so we cannot define it on the command line without breaking
+the host tools build.
+
+Signed-off-by: Will Newton <will.newton@imgtec.com>
+
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
index 0000000..17e8080
--- /dev/null
+++ b/package/libnss/libnss-uclibc.patch
@@ -0,0 +1,19 @@
+
+uCLibc does not define RTLD_NOLOAD.
+
+Signed-off-by: Will Newton <will.newton@imgtec.com>
+
+--- nss-3.12.9.old/mozilla/security/nss/lib/freebl/stubs.c	2011-07-08
13:32:54.964338355 +0100
++++ nss-3.12.9/mozilla/security/nss/lib/freebl/stubs.c	2011-07-08
13:33:57.255337490 +0100
+@@ -535,6 +535,11 @@
+     return SECSuccess;
+ }
+
++/* uClibc does not define RTLD_NOLOAD. */
++#ifndef RTLD_NOLOAD
++#define RTLD_NOLOAD 0
++#endif
++
+ /*
+  * fetch the library if it's loaded. For NSS it should already be loaded
+  */
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
new file mode 100644
index 0000000..0517c24
--- /dev/null
+++ b/package/libnss/libnss.mk
@@ -0,0 +1,67 @@
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
+	$(INSTALL) -m 755 -d $(STAGING_DIR)/usr/include/nss
+	$(INSTALL) -m 644 -t $(STAGING_DIR)/usr/include/nss \
+		$(@D)/$(LIBNSS_DISTDIR)/public/nss/*
+	$(INSTALL) -m 755 -t $(STAGING_DIR)/usr/lib/ \
+		$(@D)/$(LIBNSS_DISTDIR)/lib/*.a
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
Size: 6132 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110708/87ea7b8f/attachment-0001.bin>
