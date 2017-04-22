From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 22 Apr 2017 13:17:57 -0400
Subject: [Buildroot] [PATCH v2 11/25] fix ordering on configs starting with
	'k'
In-Reply-To: <20170422171811.1346-1-Adamduskett@outlook.com>
References: <20170422171811.1346-1-Adamduskett@outlook.com>
Message-ID: <20170422171811.1346-11-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter k in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
v1 -> v2:
  - Broke package up into just packages starting with the letter k.
  
 package/kbd/Config.in            | 2 +-
 package/knock/Config.in          | 2 +-
 package/kodi/Config.in           | 2 +-
 package/kvm-unit-tests/Config.in | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kbd/Config.in b/package/kbd/Config.in
index 44c3163..ab1f1b3 100644
--- a/package/kbd/Config.in
+++ b/package/kbd/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_KBD
 	bool "kbd"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	# Uses fork()
 	depends on BR2_USE_MMU
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Keytable files and keyboard utilities.
 
diff --git a/package/knock/Config.in b/package/knock/Config.in
index 8778a7e..0060ad0 100644
--- a/package/knock/Config.in
+++ b/package/knock/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_KNOCK
 	bool "knock"
-	select BR2_PACKAGE_LIBPCAP
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBPCAP
 	help
 	  A port knocking implementation.
 	  Provides a daemon and a user application. Port knocking can be
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 5b1b424..ba9557e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
-	depends on BR2_USE_MMU # libcdio, and others
 	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \
 		&& BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS \
 		&& BR2_TOOLCHAIN_HAS_SYNC_8
+	depends on BR2_USE_MMU # libcdio, and others
 
 comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.7, host gcc >= 4.6"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index 7265646..7eab0c2 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_KVM_UNIT_TESTS
 	bool "kvm-unit-tests"
-	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64=y
 	# on i386 and x86-64, __builtin_reachable is used, so we need
 	# gcc 4.5 at least. on i386, we use the target gcc, while on
 	# x86-64 we use the host gcc (see .mk file for details)
@@ -11,6 +10,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
 		BR2_powerpc64 || \
 		BR2_powerpc64le || \
 		(BR2_x86_64 && BR2_HOST_GCC_AT_LEAST_4_5)
+	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64=y
 	help
 	  kvm-unit-tests is a project as old as KVM. As its name
 	  suggests, it's purpose is to provide unit tests for KVM. The
-- 
2.9.3
