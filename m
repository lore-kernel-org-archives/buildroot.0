From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 12:19:49 +0200
Subject: [Buildroot] [git commit] gcc: remove BR2_GCC_NEEDS_MPC
Message-ID: <20161016103710.0D3ED8211E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3374941965e348f932bc2a3bc7beb9a6fa7b881b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The blind option BR2_GCC_NEEDS_MPC was used to distinguish gcc versions
that rely on the mpc library and the ones that don't. But since a while
already, all the versions we support do need the mpc library. So this
symbol isn't needed anymore.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host | 8 --------
 package/gcc/gcc.mk         | 7 ++-----
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index efe6028..22d221c 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -1,8 +1,5 @@
 comment "GCC Options"
 
-config BR2_GCC_NEEDS_MPC
-	bool
-
 config BR2_GCC_SUPPORTS_GRAPHITE
 	bool
 
@@ -34,7 +31,6 @@ choice
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
 		# musl mips64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
-		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
@@ -42,7 +38,6 @@ choice
 		bool "gcc arc (6.x)"
 		# Only supported architecture
 		depends on BR2_arc
-		select BR2_GCC_NEEDS_MPC
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 
@@ -63,7 +58,6 @@ choice
 		# musl mips64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
 		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
-		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
@@ -78,7 +72,6 @@ choice
 			!BR2_mips_m5101 && !BR2_mips_i6400 && !BR2_mips_p6600
 		# musl mips64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
-		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
@@ -88,7 +81,6 @@ choice
 		depends on !BR2_arc
 		# Unsupported MIPS cores
 		depends on !BR2_mips_p6600
-		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 82050b4..c971151 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -82,6 +82,7 @@ endef
 HOST_GCC_COMMON_DEPENDENCIES = \
 	host-binutils \
 	host-gmp \
+	host-mpc \
 	host-mpfr \
 	$(if $(BR2_BINFMT_FLAT),host-elf2flt)
 
@@ -93,6 +94,7 @@ HOST_GCC_COMMON_CONF_OPTS = \
 	--disable-libssp \
 	--disable-multilib \
 	--with-gmp=$(HOST_DIR)/usr \
+	--with-mpc=$(HOST_DIR)/usr \
 	--with-mpfr=$(HOST_DIR)/usr \
 	--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
 	--with-bugurl="http://bugs.buildroot.net/"
@@ -161,11 +163,6 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --enable-threads
 endif
 
-ifeq ($(BR2_GCC_NEEDS_MPC),y)
-HOST_GCC_COMMON_DEPENDENCIES += host-mpc
-HOST_GCC_COMMON_CONF_OPTS += --with-mpc=$(HOST_DIR)/usr
-endif
-
 ifeq ($(BR2_GCC_ENABLE_GRAPHITE),y)
 HOST_GCC_COMMON_DEPENDENCIES += host-isl
 HOST_GCC_COMMON_CONF_OPTS += --with-isl=$(HOST_DIR)/usr
