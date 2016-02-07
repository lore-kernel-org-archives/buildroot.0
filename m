From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  7 Feb 2016 22:45:51 +0100
Subject: [Buildroot] [PATCH] package/libatomic_ops: rename libatomic_ops
	supported arch Kconfig symbol
Message-ID: <1454881551-9526-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to the discussion on the mailing-list [1], rename
the libatomic_ops supported architectures Kconfig symbol.

[1] http://lists.busybox.net/pipermail/buildroot/2016-February/152146.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
---
 Config.in.legacy                | 7 +++++++
 package/bdwgc/Config.in         | 2 +-
 package/erlang/Config.in        | 4 ++--
 package/guile/Config.in         | 2 +-
 package/libatomic_ops/Config.in | 4 ++--
 package/moarvm/Config.in        | 4 ++--
 6 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ec6f26e..958007a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.02"
 
+config BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
+	bool "libatomic_ops arch support option has been renamed"
+	select BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
+	help
+	  The old name of this option was confusing between gcc libatomic
+	  support and libatomic_ops package supported architectures.
+
 config BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
 	bool "openpowerlink debug option has been removed"
 	select BR2_LEGACY
diff --git a/package/bdwgc/Config.in b/package/bdwgc/Config.in
index 9aa7c7d..95139ef 100644
--- a/package/bdwgc/Config.in
+++ b/package/bdwgc/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_BDWGC
 	bool "bdwgc"
-	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBATOMIC_OPS
 	help
 	  The Boehm-Demers-Weiser conservative garbage collector can
diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 0ec01bb..5fa2028 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -1,13 +1,13 @@
 comment "erlang needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_ERLANG
 	bool "erlang"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBATOMIC_OPS
 	help
 	  Erlang is a programming language used to build massively scalable
diff --git a/package/guile/Config.in b/package/guile/Config.in
index e93d353..b3f744e 100644
--- a/package/guile/Config.in
+++ b/package/guile/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_GUILE
 	bool "guile"
 	depends on !BR2_TOOLCHAIN_USES_MUSL # no strtol_l
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # bdwgc
+	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # bdwgc
 	depends on BR2_USE_WCHAR # libunistring
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBUNISTRING
diff --git a/package/libatomic_ops/Config.in b/package/libatomic_ops/Config.in
index 73aab3d..c6fe7a0 100644
--- a/package/libatomic_ops/Config.in
+++ b/package/libatomic_ops/Config.in
@@ -1,10 +1,10 @@
-config BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
+config BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
 	bool
 	default y if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_sparc || BR2_sparc64 || BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64
 
 config BR2_PACKAGE_LIBATOMIC_OPS
 	bool "libatomic_ops"
-	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
 	help
 	  Atomic operations library
 
diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
index dcd353f..6bc3090 100644
--- a/package/moarvm/Config.in
+++ b/package/moarvm/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_MOARVM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libuv
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_USE_MMU # libuv
-	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # libatomic_ops
+	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # libatomic_ops
 	# needs AO_fetch_compare_and_swap, not implemented for sparcv9
 	depends on !BR2_sparc64
 	select BR2_PACKAGE_LIBUV
@@ -17,6 +17,6 @@ config BR2_PACKAGE_MOARVM
 comment "moarvm needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
 	depends on !BR2_sparc64
 
-- 
2.4.3
