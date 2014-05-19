From: Steve Thomas <scjthm@live.com>
Date: Mon, 19 May 2014 19:48:13 +0000
Subject: [Buildroot] [PATCH v6 3/3] Add an BR2_GCC_ENABLE_GRAPHITE flag for
	the buildroot toolchain
In-Reply-To: <1400528893-4483-1-git-send-email-scjthm@live.com>
References: <1400528893-4483-1-git-send-email-scjthm@live.com>
Message-ID: <BLU436-SMTP1389119D64FEA33BF25D8E5A8320@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gcc graphite optimisations such as loop-interchange, blocking
and loop-flattening, also known as graphite are an optional feature of
gcc that is very well supported since about gcc version 4.5.

This patch adds support for graphite for the toolchain as an optional
flag for versions 4.8 onwards as an optional flag, that is disabled by
default.

Signed-off-by: Steve Thomas <scjthm@live.com>
---
Changes v5 -> v6:
    - removing supported versions (as per gentoo) should be 4.8 onwards (MORIN)
Changes v4 -> v5:
    - fixed email address
    - removed the cloog version check
    - added note about the isl version check

Changes v3 -> v4:
    - no changes apart from incorrect email.

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
 package/gcc/Config.in.host |  6 ++++++
 package/gcc/gcc.mk         | 10 ++++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index ca991da..d2fecda 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -3,6 +3,9 @@ comment "GCC Options"
 config BR2_GCC_NEEDS_MPC
 	bool
 
+config BR2_GCC_SUPPORTS_GRAPHITE
+   bool
+
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
@@ -52,6 +55,7 @@ choice
 	config BR2_GCC_VERSION_4_8_X
 		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
+		select BR2_GCC_SUPPORTS_GRAPHITE
 		bool "gcc 4.8.x"
 
 	config BR2_GCC_VERSION_4_8_ARC
@@ -62,6 +66,7 @@ choice
 	config BR2_GCC_VERSION_4_9_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
+		select BR2_GCC_SUPPORTS_GRAPHITE
 		bool "gcc 4.9.x"
 
 	config BR2_GCC_VERSION_4_9_MICROBLAZE
@@ -72,6 +77,7 @@ choice
 	config BR2_GCC_VERSION_SNAP
 		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
+		select BR2_GCC_SUPPORTS_GRAPHITE
 		bool "gcc snapshot"
 endchoice
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 32219cc..8a35dbd 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -156,6 +156,16 @@ HOST_GCC_COMMON_DEPENDENCIES += host-mpc
 HOST_GCC_COMMON_CONF_OPT += --with-mpc=$(HOST_DIR)/usr
 endif
 
+ifeq ($(BR2_GCC_ENABLE_GRAPHITE),y)
+HOST_GCC_COMMON_DEPENDENCIES += \
+   host-isl \
+   host-cloog
+
+#This is needed as with-isl doesn't work
+HOST_GCC_COMMON_CONF_OPT += \
+   --disable-isl-version-check
+endif
+
 ifneq ($(BR2_arc)$(BR2_GCC_VERSION_SNAP),)
 HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
 endif
-- 
1.9.3
