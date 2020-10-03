From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Oct 2020 21:35:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/elfutils: needs threads
Message-ID: <20201003193547.177673-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

threads is a mandatory dependency since version 0.178 and
https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=e9d4067a15eb100c0598a9895567aac6e9ed6a10

Fixes:
 - http://autobuild.buildroot.org/results/1c818a50530816ba80864efaacb724cb4bdeebf9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/elfutils/Config.in   | 4 +++-
 package/kexec-lite/Config.in | 4 +++-
 package/ltrace/Config.in     | 4 +++-
 package/racehound/Config.in  | 4 +++-
 package/sysdig/Config.in     | 2 +-
 5 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index f094e7b865..5f45de14ab 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -1,11 +1,13 @@
-comment "elfutils needs a uClibc or glibc toolchain w/ wchar, dynamic library"
+comment "elfutils needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
 
 config BR2_PACKAGE_ELFUTILS
 	bool "elfutils"
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# Only glibc and uClibc implement the myriad of required GNUisms
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_ZLIB
diff --git a/package/kexec-lite/Config.in b/package/kexec-lite/Config.in
index 3e84f90d57..abfa95ab36 100644
--- a/package/kexec-lite/Config.in
+++ b/package/kexec-lite/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_KEXEC_LITE
 	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	depends on !BR2_STATIC_LIBS # dtc, elfutils
 	depends on BR2_USE_WCHAR # elfutils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_DTC
@@ -17,7 +18,8 @@ config BR2_PACKAGE_KEXEC_LITE
 
 	  https://github.com/antonblanchard/kexec-lite
 
-comment "kexec-lite needs a uClibc or glibc toolchain w/ wchar, dynamic library"
+comment "kexec-lite needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
 	depends on BR2_powerpc || BR2_powerpc64
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 667338a26e..ce5a85edcf 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_LTRACE
 	bool "ltrace"
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	depends on BR2_PACKAGE_LTRACE_ARCH_SUPPORTS
 	select BR2_PACKAGE_ELFUTILS
@@ -25,7 +26,8 @@ config BR2_PACKAGE_LTRACE
 
 	  http://ltrace.org
 
-comment "ltrace needs a uClibc or glibc toolchain w/ wchar, dynamic library"
+comment "ltrace needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
 	depends on BR2_PACKAGE_LTRACE_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/racehound/Config.in b/package/racehound/Config.in
index 2d1ccb8381..d13f90adb4 100644
--- a/package/racehound/Config.in
+++ b/package/racehound/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_RACEHOUND
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	# only x86/x86_64 supported
 	depends on BR2_i386 || BR2_x86_64
@@ -29,7 +30,8 @@ comment "racehound needs an Linux kernel >= 3.14 to be built"
 	depends on !BR2_LINUX_KERNEL
 	depends on BR2_i386 || BR2_x86_64
 
-comment "racehound needs a uClibc or glibc toolchain w/ C++, wchar, dynamic library"
+comment "racehound needs a uClibc or glibc toolchain w/ C++, wchar, dynamic library, threads"
 	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 0ca468c396..7d3c570392 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_SYSDIG
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_INSTALL_LIBSTDCPP # libjson
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	depends on BR2_TOOLCHAIN_HAS_THREADS # jq
+	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, jq
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_USE_WCHAR # elfutils
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
-- 
2.28.0
