From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 11:38:25 +0200
Subject: [Buildroot] [git commit] gcc: add a BR2_GCC_ENABLE_GRAPHITE option
Message-ID: <20140609094817.0CEA99BA7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90aca35a4cbf5914256c391c239b7d8037785d6d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gcc graphite optimisations such as loop-interchange, blocking
and loop-flattening, also known as graphite are an optional feature of
gcc that is very well supported since about gcc version 4.5.

This patch adds support for graphite for the toolchain as an optional
flag for versions 4.8 onwards as an optional flag, that is disabled by
default.

Signed-off-by: Steve Thomas <scjthm@live.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host |   13 +++++++++++++
 package/gcc/gcc.mk         |    7 +++++++
 2 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 60835e9..b6d4b5e 100644
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
@@ -60,6 +63,7 @@ choice
 	config BR2_GCC_VERSION_4_8_X
 		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_powerpc64le
 		select BR2_GCC_NEEDS_MPC
+		select BR2_GCC_SUPPORTS_GRAPHITE
 		bool "gcc 4.8.x"
 
 	config BR2_GCC_VERSION_4_8_ARC
@@ -70,6 +74,7 @@ choice
 	config BR2_GCC_VERSION_4_9_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
+		select BR2_GCC_SUPPORTS_GRAPHITE
 		bool "gcc 4.9.x"
 
 	config BR2_GCC_VERSION_SNAP
@@ -77,6 +82,7 @@ choice
 		select BR2_GCC_NEEDS_MPC
 		# musl patches only for gcc 4.7+
 		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
+		select BR2_GCC_SUPPORTS_GRAPHITE
 		bool "gcc snapshot"
 endchoice
 
@@ -180,3 +186,10 @@ config BR2_GCC_ENABLE_LIBMUDFLAP
 	  the help of the gcc -fmudflap option for more details.
 
 	  If you're unsure, leave this option disabled.
+
+config BR2_GCC_ENABLE_GRAPHITE
+	bool "Enable graphite support"
+	depends on BR2_GCC_SUPPORTS_GRAPHITE
+	help
+	  This option enables the graphite optimizations in the
+	  compiler.
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 741bb84..5b60bc3 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -154,6 +154,13 @@ HOST_GCC_COMMON_DEPENDENCIES += host-mpc
 HOST_GCC_COMMON_CONF_OPT += --with-mpc=$(HOST_DIR)/usr
 endif
 
+ifeq ($(BR2_GCC_ENABLE_GRAPHITE),y)
+HOST_GCC_COMMON_DEPENDENCIES += host-isl host-cloog
+HOST_GCC_COMMON_CONF_OPT += --with-isl=$(HOST_DIR)/usr --with-cloog=$(HOST_DIR)/usr
+else
+HOST_GCC_COMMON_CONF_OPT += --without-isl --without-cloog
+endif
+
 ifneq ($(BR2_arc)$(BR2_GCC_VERSION_SNAP),)
 HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
 endif
