From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2015 14:35:34 +0200
Subject: [Buildroot] [git commit] keyutils: uses dl*,
	disable for static build
Message-ID: <20150531132531.1214580105@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=15ab99a7f189ccd532b5f2a518c4efffc49b1cb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And drop the unused static handling from the .mk file.

Fixes:
http://autobuild.buildroot.net/results/8a2/8a2ff0af4faeda4d2d224dcaf543a574d7eba30c/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ecryptfs-utils/Config.in |    2 +-
 package/keyutils/Config.in       |    6 ++++++
 package/keyutils/keyutils.mk     |    4 ----
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index d243da6..cb70e00 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnss -> libnspr
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnss -> libnspr
 	depends on !BR2_MIPS_NABI32 # libnss
-	depends on !BR2_STATIC_LIBS # libnss
+	depends on !BR2_STATIC_LIBS # libnss, keyutils
 	help
 	  eCryptfs is a POSIX-compliant enterprise cryptographic
 	  filesystem for Linux. It is stacked on top of any other
diff --git a/package/keyutils/Config.in b/package/keyutils/Config.in
index fcb075f..6f0758f 100644
--- a/package/keyutils/Config.in
+++ b/package/keyutils/Config.in
@@ -2,8 +2,14 @@ config BR2_PACKAGE_KEYUTILS
 	bool "keyutils"
 	depends on !BR2_microblaze
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # dlopen
 	help
 	  These tools are used to control the key management system
 	  built into the Linux kernel.
 
 	  http://people.redhat.com/~dhowells/keyutils/
+
+comment "keyutils needs a toolchain w/ dynamic library"
+	depends on !BR2_microblaze
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index 36588e6..3d6697e 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -19,10 +19,6 @@ KEYUTILS_MAKE_PARAMS =                    \
 	CPPFLAGS="$(TARGET_CPPFLAGS) -I." \
 	LNS="$(HOSTLN) -sf"
 
-ifeq ($(BR2_STATIC_LIBS),y)
-KEYUTILS_MAKE_PARAMS += NO_SOLIB=1
-endif
-
 ifeq ($(BR2_SHARED_LIBS),y)
 KEYUTILS_MAKE_PARAMS += NO_ARLIB=1
 endif
