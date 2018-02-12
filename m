From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 12 Feb 2018 22:06:33 +0100
Subject: [Buildroot] [PATCH next v6] systemd: allow to build with uClibc
 toolchains
Message-ID: <20180212210633.GA20420@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need to disable any systemd parts using either IDN, NSS or gshadow.
IDN is only disabled in C library function call to getnameinfo(),
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
v3 -> v4:
  - add comment about missing nss suggested by Arnout
  - add extra parenthesis suggested by Arnout
v4 -> v5:
  - update after switch to meson
  - fix typo for resolve option
v5 -> v6:
  - split of typo fix from uClibc enable patch
---
 package/systemd/Config.in  |  3 +++
 package/systemd/systemd.mk | 11 +++++++++++
 system/Config.in           |  6 +++---
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 661f40d..81eee96 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -190,6 +190,7 @@ config BR2_PACKAGE_SYSTEMD_MACHINED
 
 config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 	bool "enable myhostname NSS plugin"
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # needs nss.h
 	default y
 	help
 	  nss-myhostname is a plug-in module for the GNU Name Service
@@ -245,6 +246,7 @@ config BR2_PACKAGE_SYSTEMD_RANDOMSEED
 
 config BR2_PACKAGE_SYSTEMD_RESOLVED
 	bool "enable resolve daemon"
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # needs nss.h
 	default y
 	help
 	  systemd-resolved is a system service that provides network
@@ -278,6 +280,7 @@ config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 
 config BR2_PACKAGE_SYSTEMD_SYSUSERS
 	bool "enable sysusers support"
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # needs gshadow.h
 	help
 	  systemd-sysusers creates system users and groups, based on
 	  the file format and location specified in sysusers.d(5).
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1c31ebb..a6c4b33 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -48,6 +48,17 @@ SYSTEMD_CONF_OPTS += \
 	-Dmount-path=/usr/bin/mount \
 	-Dumount-path=/usr/bin/umount
 
+# disable unsupported features for non-glibc toolchains
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+SYSTEMD_CONF_OPTS += \
+	-Didn=true \
+	-Dnss-systemd=true
+else
+SYSTEMD_CONF_OPTS += \
+	-Didn=false \
+	-Dnss-systemd=false
+endif
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 SYSTEMD_DEPENDENCIES += acl
 SYSTEMD_CONF_OPTS += -Dacl=true
diff --git a/system/Config.in b/system/Config.in
index d48cf8d..7b36516 100644
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
@@ -137,8 +137,8 @@ config BR2_INIT_SYSTEMD
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
 
-comment "systemd needs a glibc toolchain, headers >= 3.10"
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
+comment "systemd needs a glibc or uClibc toolchain, headers >= 3.10"
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC \
 		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10)
 
 config BR2_INIT_NONE
-- 
2.1.4
