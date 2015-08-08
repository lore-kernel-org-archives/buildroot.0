From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 10:56:11 +0200
Subject: [Buildroot] [git commit] package/elfutils: does not build with musl
Message-ID: <20150808085625.9AB9F818BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb60820c0a9b3f938f32516f24df2eee9aac1e26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

elfutils uses so many GNUisms in so many places that patching them out
is a tedious task which would make us diverge so much from upstream that
it would become a nightmare to bump elfutils in the future.

Furthermore, elfutils needs argp, which is missing in musl, so it would
need argp-standalone too (as when using a uClibc toolchain).

Make elfutils depend on either glibc or uClibc. argp-standalone is
already required when using a uClibc toolchain, but since we do not
support musl, no need to add that to the condition.

Fixes (configure failures due to missing argp):
    http://autobuild.buildroot.org/results/743/7432ccd0d060a70bc35f0ac21ec92ae0071592ae/
    http://autobuild.buildroot.org/results/cc9/cc90bd9312f30f91daa50af4253629f58b82c486/
    http://autobuild.buildroot.org/results/d5e/d5e583c695afbc2e686e3002765ce9e1937aa0d5/
    [...]

Fixes (build failures due to GNUisms):
    http://autobuild.buildroot.org/results/ee7/ee7eaf80247dd96548d66be9884b179e20204a98/
    http://autobuild.buildroot.org/results/3f2/3f242853e600bb6bec6ce2f0598d304751ceb81a/
    http://autobuild.buildroot.org/results/7f0/7f0c7c9cb746104f93907544247bc1008d6ad0dc/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avrdude/Config.in    |    4 +++-
 package/elfutils/Config.in   |    5 ++++-
 package/kexec-lite/Config.in |    4 +++-
 package/ltrace/Config.in     |    4 +++-
 package/racehound/Config.in  |    4 +++-
 5 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
index dc84237..79b26a2 100644
--- a/package/avrdude/Config.in
+++ b/package/avrdude/Config.in
@@ -8,12 +8,14 @@ config BR2_PACKAGE_AVRDUDE
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on !BR2_bfin # elfutils
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	help
 	  avrdude is a programmer for Atmel AVR microcontrollers
 	  this package provides a version with new linuxspi driver
 
 	  https://github.com/kcuzner/avrdude
 
-comment "avrdude needs a toolchain w/ threads, wchar, dynamic library"
+comment "avrdude needs a uclibc or (e)glibc toolchain w/ threads, wchar, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC && !BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_bfin
diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 6c6856e..19ab8fc 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -1,6 +1,7 @@
-comment "elfutils needs a toolchain w/ wchar, dynamic library"
+comment "elfutils needs a uClibc or (e)glibc toolchain w/ wchar, dynamic library"
 	depends on !BR2_bfin
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC && !BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_ELFUTILS
 	bool "elfutils"
@@ -8,6 +9,8 @@ config BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
+	# Only glibc and uClibc implement the myriad of required GNUisms
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC
 	# build issue caused by the _ prefix used on blackfin for
 	# assembly symbols
 	depends on !BR2_bfin
diff --git a/package/kexec-lite/Config.in b/package/kexec-lite/Config.in
index 8417dac..6242c46 100644
--- a/package/kexec-lite/Config.in
+++ b/package/kexec-lite/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_KEXEC_LITE
 	depends on BR2_powerpc || BR2_powerpc64
 	depends on !BR2_STATIC_LIBS # dtc, elfutils
 	depends on BR2_USE_WCHAR # elfutils
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_DTC
 	select BR2_PACKAGE_DTC_PROGRAMS
@@ -13,6 +14,7 @@ config BR2_PACKAGE_KEXEC_LITE
 	  This package is a tiny implementation of the kexec userspace
 	  components, for devicetree-based platforms.
 
-comment "kexec-lite needs a toolchain w/ wchar, dynamic library"
+comment "kexec-lite needs a uClibc or (e)glibc toolchain w/ wchar, dynamic library"
 	depends on BR2_powerpc || BR2_powerpc64
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC && !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 2b42a84..5576efc 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_LTRACE
 	select BR2_PACKAGE_ELFUTILS
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	help
 	  Debugging program which runs a specified command until it exits.
 	  While the command is executing, ltrace intercepts and records
@@ -17,5 +18,6 @@ config BR2_PACKAGE_LTRACE
 
 	  http://ltrace.org
 
-comment "ltrace needs toolchain w/ wchar, dynamic library"
+comment "ltrace needs a uclibc or (e)glibc toolchain w/ wchar, dynamic library"
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC && !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/racehound/Config.in b/package/racehound/Config.in
index 9fac802..af56b03 100644
--- a/package/racehound/Config.in
+++ b/package/racehound/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_RACEHOUND
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	# only x86/x86_64 supported
 	depends on BR2_i386 || BR2_x86_64
 	help
@@ -28,6 +29,7 @@ comment "racehound needs an Linux kernel >= 3.14 to be built"
 	depends on !BR2_LINUX_KERNEL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	depends on BR2_i386 || BR2_x86_64
 
-comment "racehound needs a toolchain w/ C++, wchar, dynamic library"
+comment "racehound needs a uClibc or (e)glibc toolchain w/ C++, wchar, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || BR2_STATIC_LIBS
 	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC && !BR2_TOOLCHAIN_USES_GLIBC
