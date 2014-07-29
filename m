From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Jul 2014 15:15:24 -0300
Subject: [Buildroot] [PATCH] samba4: bump to version 4.1.10
Message-ID: <1406657724-21261-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lots of bugfixes, enhancements to provisioning and printing support via cups.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/Config.in |  3 +++
 package/samba4/samba4.mk | 12 ++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 7008ba2..184185a 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -19,6 +19,9 @@ config BR2_PACKAGE_SAMBA4
 
 	  http://www.samba.org/
 
+comment "Some samba4 CLI tools require the python package to keep .py files"
+	depends on BR2_PACKAGE_SAMBA4 && BR2_PACKAGE_PYTHON_PYC_ONLY
+
 comment "samba4 needs a toolchain w/ IPv6, wchar, largfile, threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || \
 		!BR2_USE_WCHAR || !BR2_INET_IPV6
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index e2336e7..7d8500f 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.1.9
+SAMBA4_VERSION = 4.1.10
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_LICENSE = GPLv3+
@@ -20,6 +20,14 @@ else
 	SAMBA4_CONF_OPT += --without-acl-support
 endif
 
+ifeq ($(BR2_PACKAGE_CUPS),y)
+	SAMBA4_CONF_ENV += CUPS_CONFIG="$(STAGING_DIR)/usr/bin/cups-config"
+	SAMBA4_CONF_OPT += --enable-cups
+	SAMBA4_DEPENDENCIES += cups
+else
+	SAMBA4_CONF_OPT += --disable-cups
+endif
+
 ifeq ($(BR2_PACKAGE_LIBAIO),y)
 	SAMBA4_CONF_OPT += --with-aio-support
 	SAMBA4_DEPENDENCIES += libaio
@@ -69,6 +77,7 @@ define SAMBA4_CONFIGURE_CMDS
 		python_LDFLAGS="" \
 		python_LIBDIR="" \
 		$(TARGET_CONFIGURE_OPTS) \
+		$(SAMBA4_CONF_ENV) \
 		./buildtools/bin/waf configure \
 			--prefix=/usr \
 			--sysconfdir=/etc \
@@ -80,7 +89,6 @@ define SAMBA4_CONFIGURE_CMDS
 			--hostcc=gcc \
 			--disable-rpath \
 			--disable-rpath-install \
-			--disable-cups \
 			--disable-iprint \
 			--without-pam \
 			--without-dmapi \
-- 
1.8.5.5
