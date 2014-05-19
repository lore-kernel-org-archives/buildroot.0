From: Steve Thomas <scjthm@live.com>
Date: Mon, 19 May 2014 12:20:54 +0000
Subject: [Buildroot] [PATCH v4 3/3] Add an BR2_GCC_ENABLE_GRAPHITE flag for
	the buildroot toolchain
In-Reply-To: <1400502054-9389-1-git-send-email-scjthm@live.com>
References: <1400502054-9389-1-git-send-email-scjthm@live.com>
Message-ID: <BLU436-SMTP98CA6E3D3B3B921DF6B9BFA8320@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gcc graphite optimisations such as loop-interchange, blocking
and loop-flattening, also known as graphite are an optional feature of
gcc that is very well supported since about gcc version 4.5.

This patch adds support for graphite for the toolchain as an optional
flag for versions 4.6 onwards as an optional flag, that is disabled by
default.

Signed-off-by: Steve Thomas <scjthm@ive.com>
---
Changes v3 -> v4:
    - removing the parts not needed

Changes v2 -> v3:
    - removed packages from Config.in
    - disabled target builds
    - added empty line to commit messages
    - removed isl patch as different version used

Changes v1 -> v2:
    - added more lucid and verbose description in commit messages
    - fixed the url and removed the sources files
    - add complete graphite as three commits yet a single patch
---
 package/gcc/Config.in.host | 16 ++++++++++++++++
 package/gcc/gcc.mk         |  9 +++++++++
 2 files changed, 25 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index ca991da..6ecfef5 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -3,6 +3,9 @@ comment "GCC Options"
 config BR2_GCC_NEEDS_MPC
 	bool
 
+config BR2_GCC_SUPPORTS_GRAPHITE
+	bool
+
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
@@ -42,36 +45,43 @@ choice
 	config BR2_GCC_VERSION_4_6_X
 		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
+		select BR2_GCC_SUPPORTS_GRAPHITE
 		bool "gcc 4.6.x"
 
 	config BR2_GCC_VERSION_4_7_X
 		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
+		select BR2_GCC_SUPPORTS_GRAPHITE
 		bool "gcc 4.7.x"
 
 	config BR2_GCC_VERSION_4_8_X
 		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
+		select BR2_GCC_SUPPORTS_GRAPHITE
 		bool "gcc 4.8.x"
 
 	config BR2_GCC_VERSION_4_8_ARC
 		depends on BR2_arc
 		select BR2_GCC_NEEDS_MPC
+		select BR2_GCC_SUPPORTS_GRAPHITE
 		bool "gcc 4.8-arc"
 
 	config BR2_GCC_VERSION_4_9_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
+		select BR2_GCC_SUPPORTS_GRAPHITE
 		bool "gcc 4.9.x"
 
 	config BR2_GCC_VERSION_4_9_MICROBLAZE
 		depends on BR2_microblaze
 		select BR2_GCC_NEEDS_MPC
+		select BR2_GCC_SUPPORTS_GRAPHITE
 		bool "gcc 4.9-microblaze"
 
 	config BR2_GCC_VERSION_SNAP
 		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
+		select BR2_GCC_SUPPORTS_GRAPHITE
 		bool "gcc snapshot"
 endchoice
 
@@ -147,6 +157,12 @@ config BR2_INSTALL_FORTRAN
 	  cross-compiler, and install the Fortran runtime to the
 	  target.
 
+config BR2_GCC_ENABLE_GRAPHITE
+	bool "Enable compiler graphite optimisations"
+	depends on BR2_GCC_SUPPORTS_GRAPHITE 
+	help
+	  Enable the compiler to support graphite optimisations
+
 config BR2_GCC_ENABLE_TLS
 	bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	default y
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 32219cc..c05a824 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -156,6 +156,15 @@ HOST_GCC_COMMON_DEPENDENCIES += host-mpc
 HOST_GCC_COMMON_CONF_OPT += --with-mpc=$(HOST_DIR)/usr
 endif
 
+ifeq ($(BR2_GCC_ENABLE_GRAPHITE),y)
+HOST_GCC_COMMON_DEPENDENCIES += \
+	host-isl \
+	host-cloog
+HOST_GCC_COMMON_CONF_OPT += \
+	--disable-isl-version-check \
+	--disable-cloog-version-check
+endif
+
 ifneq ($(BR2_arc)$(BR2_GCC_VERSION_SNAP),)
 HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
 endif
-- 
1.9.3
