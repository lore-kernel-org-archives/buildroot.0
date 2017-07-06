From: Adam Duskett <aduskett@gmail.com>
Date: Thu,  6 Jul 2017 11:23:46 -0400
Subject: [Buildroot] [PATCH 2/2] selinux packages: change glibc check to fts
	check
In-Reply-To: <20170706152346.30242-1-aduskett@codeblue.com>
References: <20170706152346.30242-1-aduskett@codeblue.com>
Message-ID: <20170706152346.30242-2-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As per the previous patch, now that fts support can be checked,
the selinux libraries and packages can check if the toolchain has
fts support instead of explicitly requiring glibc.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/checkpolicy/Config.in     |  6 +++---
 package/libselinux/Config.in      |  8 ++++----
 package/libsemanage/Config.in     |  8 ++++----
 package/policycoreutils/Config.in | 12 ++++++------
 package/refpolicy/Config.in       |  6 +++---
 package/setools/Config.in         |  6 +++---
 6 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/package/checkpolicy/Config.in b/package/checkpolicy/Config.in
index 97ad0b7..416cbd1 100644
--- a/package/checkpolicy/Config.in
+++ b/package/checkpolicy/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_CHECKPOLICY
 	bool "checkpolicy"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
 	depends on !BR2_STATIC_LIBS # libselinux
-	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
+	depends on BR2_TOOLCHAIN_HAS_FTS # libselinux
 	depends on !BR2_arc # libselinux
 	select BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_FLEX
@@ -15,7 +15,7 @@ config BR2_PACKAGE_CHECKPOLICY
 
 	  http://selinuxproject.org/page/Main_Page
 
-comment "checkpolicy needs a glibc toolchain w/ threads, dynamic library"
+comment "checkpolicy needs a toolchain w/ threads, dynamic library, fts"
 	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+		!BR2_TOOLCHAIN_HAS_FTS
diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index 6be816d..6b0d1fe 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_LIBSELINUX
 	bool "libselinux"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	# Uses <fts.h>, not available in musl or uClibc
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	# Uses <fts.h>, not available in musl
+	depends on BR2_TOOLCHAIN_HAS_FTS
 	# Toolchain issue: "fixup not contained within frag"
 	depends on !BR2_arc
 	select BR2_PACKAGE_LIBSEPOL
@@ -19,7 +19,7 @@ config BR2_PACKAGE_LIBSELINUX
 
 	  http://selinuxproject.org/page/Main_Page
 
-comment "libselinux needs a glibc toolchain w/ threads, dynamic library"
+comment "libselinux needs a toolchain w/ threads, dynamic library, fts"
 	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+		!BR2_TOOLCHAIN_HAS_FTS
diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index 7ee9c38..93a399e 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -3,10 +3,10 @@ config BR2_PACKAGE_LIBSEMANAGE
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	# - libselinux needs fts.h (not available in uClibc/musl)
+	# - libselinux needs fts.h (not available in musl)
 	# - libsemanage itself needs getpwent_r() not available in musl
 	# - audit is not available on musl
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_HAS_FTS
 	depends on !BR2_arc
 	select BR2_PACKAGE_AUDIT
 	select BR2_PACKAGE_LIBSELINUX
@@ -23,8 +23,8 @@ config BR2_PACKAGE_LIBSEMANAGE
 
 	  http://selinuxproject.org/page/Main_Page
 
-comment "libsemanage needs a glibc toolchain w/ threads, dynamic library"
+comment "libsemanage needs a toolchain w/ threads, dynamic library, fts"
 	depends on !BR2_arc
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+		!BR2_TOOLCHAIN_HAS_FTS
diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
index 6b58d6e..8fa891f 100644
--- a/package/policycoreutils/Config.in
+++ b/package/policycoreutils/Config.in
@@ -1,7 +1,7 @@
-comment "policycoreutils needs a glibc toolchain w/ threads, dynamic library"
+comment "policycoreutils needs a toolchain w/ threads, dynamic library, fts"
 	depends on !BR2_arc
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+	depends on !BR2_TOOLCHAIN_HAS_FTS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_POLICYCOREUTILS
@@ -10,7 +10,7 @@ config BR2_PACKAGE_POLICYCOREUTILS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage
 	depends on !BR2_STATIC_LIBS #libsemanage
 	depends on !BR2_arc # libsemanage
-	depends on BR2_TOOLCHAIN_USES_GLIBC # libsemanage
+	depends on BR2_TOOLCHAIN_HAS_FTS # libsemanage
 	select BR2_PACKAGE_LIBSEMANAGE
 	select BR2_PACKAGE_LIBCAP_NG
 	help
@@ -51,7 +51,7 @@ config BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW
 	depends on BR2_USE_MMU # python3, sepolgen
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python3, sepolgen, checkpolicy
 	depends on !BR2_STATIC_LIBS # python3, sepolgen
-	depends on BR2_TOOLCHAIN_USES_GLIBC # checkpolicy
+	depends on BR2_TOOLCHAIN_HAS_FTS # checkpolicy
 	depends on !BR2_arc # checkpolicy
 	select BR2_PACKAGE_SEPOLGEN
 	select BR2_PACKAGE_CHECKPOLICY
@@ -59,11 +59,11 @@ config BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW
 	help
 	  Enable audit2allow to be built
 
-comment "audit2allow needs a glibc toolchain w/ wchar, threads, dynamic library"
+comment "audit2allow needs a toolchain w/ wchar, threads, dynamic library, fts"
 	depends on BR2_USE_MMU
 	depends on !BR2_arc
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_FTS
 
 config BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
 	bool "restorecond"
diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 954dc3a..de26a5b 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_REFPOLICY
 	bool "refpolicy"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # policycoreutils
-	depends on BR2_TOOLCHAIN_USES_GLIBC # policycoreutils
+	depends on BR2_TOOLCHAIN_HAS_FTS # policycoreutils
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS # policycoreutils
 	depends on !BR2_STATIC_LIBS # policycoreutils
 	depends on !BR2_arc # policycoreutils
@@ -28,11 +28,11 @@ config BR2_PACKAGE_REFPOLICY
 
 	  https://github.com/TresysTechnology/refpolicy
 
-comment "refpolicy needs a glibc toolchain w/ threads, dynamic library"
+comment "refpolicy needs a toolchain w/ threads, dynamic library, fts"
 	depends on !BR2_arc
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+		!BR2_TOOLCHAIN_HAS_FTS
 
 if BR2_PACKAGE_REFPOLICY
 
diff --git a/package/setools/Config.in b/package/setools/Config.in
index d7b119f..fd26173 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SETOOLS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
+	depends on BR2_TOOLCHAIN_HAS_FTS # libselinux
 	# bfin: infamous _ symbol prefix issue
 	# nios2: triggers some toolchain issue "No symbol version
 	# section for versioned symbol"
@@ -29,8 +29,8 @@ config BR2_PACKAGE_SETOOLS
 
 	  https://github.com/TresysTechnology/setools3/wiki
 
-comment "setools needs a glibc toolchain w/ threads, C++, wchar, dynamic library"
+comment "setools needs a toolchain w/ threads, C++, wchar, dynamic library, fts"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
 		|| !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_USES_GLIBC
+		|| !BR2_TOOLCHAIN_HAS_FTS
 	depends on !BR2_nios2 && !BR2_bfin && !BR2_arc
-- 
2.9.4
