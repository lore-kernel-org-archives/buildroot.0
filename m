From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 8 Aug 2017 18:37:02 +0200
Subject: [Buildroot] [PATCH v3] systemd: allow to build with uClibc
	toolchains
Message-ID: <20170808163702.GA29748@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need to disable any systemd parts using either IDN or NSS.
IDN is only disabled in C library function call to getnaminfo(),
it does not effect libidn/libidn2 usage in systemd.

Tested with qemu-system-arm.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
  - added Upstream commit URL suggested by Thomas Petazzoni
  - rework enable/disable options suggested by Thomas Petazzoni
  - extend commit message a little bit
v2 -> v3:
  - sync to latest master changes
  - remove patches included upstream
  - disable features not usable with uClibc-ng lacking nss.h
---
 package/systemd/Config.in  |  4 ++++
 package/systemd/systemd.mk | 11 +++++++++++
 system/Config.in           |  4 ++--
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 7dfd7ca..afe5045 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -180,6 +180,7 @@ config BR2_PACKAGE_SYSTEMD_LOGIND
 
 config BR2_PACKAGE_SYSTEMD_MACHINED
 	bool "enable machine daemon"
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  systemd-machined is a system service that keeps track of
 	  virtual machines and containers, and processes belonging to
@@ -189,6 +190,7 @@ config BR2_PACKAGE_SYSTEMD_MACHINED
 
 config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 	bool "enable myhostname NSS plugin"
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	default y
 	help
 	  nss-myhostname is a plug-in module for the GNU Name Service
@@ -244,6 +246,7 @@ config BR2_PACKAGE_SYSTEMD_RANDOMSEED
 
 config BR2_PACKAGE_SYSTEMD_RESOLVED
 	bool "enable resolve daemon"
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	default y
 	help
 	  systemd-resolved is a system service that provides network
@@ -277,6 +280,7 @@ config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 
 config BR2_PACKAGE_SYSTEMD_SYSUSERS
 	bool "enable sysusers support"
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  systemd-sysusers creates system users and groups, based on
 	  the file format and location specified in sysusers.d(5).
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 9f286fd..55b8f23 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -40,6 +40,17 @@ SYSTEMD_CONF_OPTS += \
 	--with-default-dnssec=no \
 	--without-python
 
+# disable unsupported features for non-glibc toolchains
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+SYSTEMD_CONF_OPTS += \
+	--enable-idn \
+	--enable-nss-systemd
+else
+SYSTEMD_CONF_OPTS += \
+	--disable-idn \
+	--disable-nss-systemd
+endif
+
 SYSTEMD_CFLAGS = $(TARGET_CFLAGS) -fno-lto
 
 # Override paths to a few utilities needed at runtime, to
diff --git a/system/Config.in b/system/Config.in
index 59d8eab..93d561f 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -127,7 +127,7 @@ config BR2_INIT_SYSV
 config BR2_INIT_SYSTEMD
 	bool "systemd"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HAS_SSP
@@ -138,7 +138,7 @@ config BR2_INIT_SYSTEMD
 	select BR2_PACKAGE_SYSTEMD
 
 comment "systemd needs a glibc toolchain, headers >= 3.10"
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC \
 		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10)
 
 config BR2_INIT_NONE
-- 
2.1.4
