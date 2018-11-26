From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 17:54:02 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] package/systemd: needs
 glibc
Message-ID: <20181126165219.91FE2887C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=921a9cfaea1b50bfc1cbb7fdc117a076c283c541
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Since version v239, systemd-nspawn unconditioanlly uses prlimit(2),
which is not implemented in uClibc-ng. systemd-nspawn can not be
disabled.

This makes systemd glibc-only again.

After a bit of discussion with upstream (om IRC), it looks very
improbable that they accept a patch making systemd-nspawn optional.
They would probably consider a patch that provides that syscall wrapper
if it is missing, though, but that's less trivial...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0d61846b5f267839911a76ed2aeed505575de0bd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/Config.in  |  3 ---
 package/systemd/systemd.mk | 11 +----------
 system/Config.in           | 11 +++--------
 3 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 1cc0021b87..4c35418476 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -192,7 +192,6 @@ config BR2_PACKAGE_SYSTEMD_MACHINED
 config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 	bool "enable myhostname NSS plugin"
 	default y
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # needs nss.h
 	help
 	  nss-myhostname is a plug-in module for the GNU Name Service
 	  Switch (NSS) functionality of the GNU C Library (glibc),
@@ -252,7 +251,6 @@ config BR2_PACKAGE_SYSTEMD_RANDOMSEED
 config BR2_PACKAGE_SYSTEMD_RESOLVED
 	bool "enable resolve daemon"
 	default y
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # needs nss.h
 	help
 	  systemd-resolved is a system service that provides network
 	  name resolution to local applications. It implements a
@@ -285,7 +283,6 @@ config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 
 config BR2_PACKAGE_SYSTEMD_SYSUSERS
 	bool "enable sysusers support"
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # needs gshadow.h
 	help
 	  systemd-sysusers creates system users and groups, based on
 	  the file format and location specified in sysusers.d(5).
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index ecbf7e97ff..e53f0b699a 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -40,18 +40,9 @@ SYSTEMD_CONF_OPTS += \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dmount-path=/usr/bin/mount \
 	-Dumount-path=/usr/bin/umount \
-	-Dnobody-group=nogroup
-
-# disable unsupported features for non-glibc toolchains
-ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
-SYSTEMD_CONF_OPTS += \
+	-Dnobody-group=nogroup \
 	-Didn=true \
 	-Dnss-systemd=true
-else
-SYSTEMD_CONF_OPTS += \
-	-Didn=false \
-	-Dnss-systemd=false
-endif
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 SYSTEMD_DEPENDENCIES += acl
diff --git a/system/Config.in b/system/Config.in
index f63f27b126..9e34f11b6c 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -127,9 +127,7 @@ config BR2_INIT_SYSV
 config BR2_INIT_SYSTEMD
 	bool "systemd"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
@@ -137,14 +135,11 @@ config BR2_INIT_SYSTEMD
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
 
-comment "systemd needs a glibc or uClibc toolchain w/ wchar, threads, SSP, dynamic library, headers >= 3.10"
+comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.10"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC) || \
-		!BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_HAS_SSP || \
-		BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 
 config BR2_INIT_NONE
