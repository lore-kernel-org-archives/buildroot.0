From: Bamvor Jian Zhang <bamvor.zhangjian@huawei.com>
Date: Tue, 21 Jul 2015 16:46:00 +0800
Subject: [Buildroot] [PATCH V3 1/5] aarch64: align aarch64_be config with
	aarch64s'
In-Reply-To: <1437468364-19245-1-git-send-email-bamvor.zhangjian@huawei.com>
References: <1437468364-19245-1-git-send-email-bamvor.zhangjian@huawei.com>
Message-ID: <1437468364-19245-2-git-send-email-bamvor.zhangjian@huawei.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@huawei.com>
---
 package/binutils/Config.in              | 4 ++--
 package/binutils/Config.in.host         | 5 +++--
 package/dropwatch/Config.in             | 5 +++--
 package/gcc/Config.in.host              | 8 ++++----
 package/gdb/Config.in.host              | 2 +-
 package/gpsd/Config.in                  | 2 +-
 package/lightning/Config.in             | 5 +++--
 package/nginx/Config.in                 | 3 +--
 package/oprofile/Config.in              | 6 ++++--
 toolchain/toolchain-buildroot/Config.in | 7 ++++---
 10 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index 64d0a09..f9e0f16 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_BINUTILS
 	bool "binutils"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	depends on !BR2_aarch64 && !BR2_nios2
+	depends on !BR2_aarch64 && !BR2_aarch64_be && !BR2_nios2
 	depends on BR2_USE_WCHAR
 	help
 	  Install binutils on the target
@@ -22,5 +22,5 @@ config BR2_PACKAGE_BINUTILS_TARGET
 endif
 
 comment "binutils needs a toolchain w/ wchar"
-	depends on !BR2_aarch64 && !BR2_nios2
+	depends on !BR2_aarch64 && !BR2_aarch64_be && !BR2_nios2
 	depends on !BR2_USE_WCHAR
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 70253cc..751ff77 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -8,8 +8,9 @@ choice
 	  Select the version of binutils you wish to use.
 
 	config BR2_BINUTILS_VERSION_2_23_2
-		depends on !BR2_aarch64 && !BR2_microblaze && \
-			   !BR2_powerpc64le && !BR2_nios2
+		depends on !BR2_aarch64 && !BR2_aarch64_be && \
+			   !BR2_microblaze && !BR2_powerpc64le && \
+			   !BR2_nios2
 		bool "binutils 2.23.2"
 
 	config BR2_BINUTILS_VERSION_2_24
diff --git a/package/dropwatch/Config.in b/package/dropwatch/Config.in
index d331e5e..e109242 100644
--- a/package/dropwatch/Config.in
+++ b/package/dropwatch/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_DROPWATCH
 	bool "dropwatch"
 	select BR2_PACKAGE_BINUTILS
-	depends on !BR2_aarch64 && !BR2_nios2 # binutils
+	# binutils
+	depends on !BR2_aarch64 && !BR2_aarch64_be && !BR2_nios2
 	depends on BR2_USE_WCHAR # binutils
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_LIBNL
@@ -13,5 +14,5 @@ config BR2_PACKAGE_DROPWATCH
 	  https://fedorahosted.org/dropwatch/
 
 comment "dropwatch needs a toolchain w/ threads, wchar"
-	depends on !BR2_aarch64 && !BR2_nios2
+	depends on !BR2_aarch64 && !BR2_aarch64_be && !BR2_nios2
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 3d64b6f..7d2c999 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -17,8 +17,8 @@ choice
 		bool "gcc 4.5.x"
 		depends on BR2_DEPRECATED_SINCE_2015_05
 		# Broken or unsupported architectures
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
-			&& !BR2_powerpc64le && !BR2_nios2
+		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_aarch64_be && \
+			   !BR2_arc && !BR2_powerpc64le && !BR2_nios2
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a7 && !BR2_cortex_a12 && \
 			!BR2_cortex_a15 && !BR2_fa526 && !BR2_pj4
@@ -38,8 +38,8 @@ choice
 	config BR2_GCC_VERSION_4_7_X
 		bool "gcc 4.7.x"
 		# Broken or unsupported architectures
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
-			&& !BR2_powerpc64le && !BR2_nios2
+		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_aarch64_be && \
+			   !BR2_arc && !BR2_powerpc64le && !BR2_nios2
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a12 && !BR2_pj4
 		# Broken or unsupported PPC cores
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 3207794..d736f25 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -4,7 +4,7 @@ config BR2_PACKAGE_HOST_GDB
 	# allow to build a cross-gdb, as the one of the external
 	# toolchain should be used.
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
-	depends on !BR2_aarch64 && !BR2_nios2
+	depends on !BR2_aarch64 && !BR2_aarch64_be && !BR2_nios2
 	help
 	  Build a cross gdb that runs on the host machine and debugs
 	  programs running on the target. It requires 'gdbserver'
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index fa8b8f6..36813ab 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -39,7 +39,7 @@ config BR2_PACKAGE_GPSD_OLDSTYLE
 config BR2_PACKAGE_GPSD_PROFILING
 	bool "profiling support"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on !BR2_aarch64
+	depends on !BR2_aarch64 && !BR2_aarch64_be
 
 comment "profiling support not available with uClibc-based toolchain"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/lightning/Config.in b/package/lightning/Config.in
index 8caf39f..3ca477a 100644
--- a/package/lightning/Config.in
+++ b/package/lightning/Config.in
@@ -14,13 +14,14 @@ config BR2_PACKAGE_LIGHTNING_DISASSEMBLER
 	bool "enable disassembler"
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_ZLIB
-	depends on !BR2_aarch64 && !BR2_nios2 # binutils
+	# binutils
+	depends on !BR2_aarch64 && !BR2_aarch64_be && !BR2_nios2
 	depends on BR2_USE_WCHAR # binutils
 	help
 	  Enable the GNU lightning disassembler.
 
 comment "lightning disassembler needs a toolchain w/ wchar"
-	depends on !BR2_aarch64 && !BR2_nios2
+	depends on !BR2_aarch64 && !BR2_aarch64_be && !BR2_nios2
 	depends on !BR2_USE_WCHAR
 
 endif
diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index be445f4..ef0266e 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -15,8 +15,7 @@ config BR2_PACKAGE_NGINX_FILE_AIO
 	# but it's available on neither AArch64 nor ARC where only
 	# eventfd() is available. See
 	# https://bugs.launchpad.net/linaro-aarch64/+bug/1160013
-	depends on !BR2_aarch64
-	depends on !BR2_arc
+	depends on !BR2_aarch64 && !BR2_aarch64_be && !BR2_arc
 
 config BR2_PACKAGE_NGINX_HTTP
 	bool "http server"
diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 9cf5693..b5d0bb6 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -5,7 +5,8 @@ config BR2_PACKAGE_OPROFILE
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_LIBPFM4 if BR2_powerpc
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_aarch64 && !BR2_nios2 # binutils
+	# binutils
+	depends on !BR2_aarch64 && !BR2_aarch64_be && !BR2_nios2
 	depends on BR2_USE_WCHAR # binutils
 	depends on !BR2_xtensa
 	# libpfm4 is needed on PowerPC, and requires thread support
@@ -28,7 +29,8 @@ config BR2_PACKAGE_OPROFILE
 
 comment "oprofile needs a toolchain w/ C++, wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_aarch64 && !BR2_nios2 && !BR2_xtensa
+	depends on !BR2_aarch64 && !BR2_aarch64_be && !BR2_nios2 && \
+		   !BR2_xtensa
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 
 comment "oprofile needs a toolchain w/ NPTL on PPC"
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 13e2b15..0869243 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -85,9 +85,10 @@ comment "(e)glibc only available with shared lib support"
 
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl (experimental)"
-	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
-		BR2_microblaze || BR2_mips || BR2_mipsel || BR2_powerpc || \
-		BR2_sh || BR2_x86_64
+	depends on BR2_arm         || BR2_armeb      || BR2_aarch64 || \
+		   BR2_aarch64_be  || BR2_i386       || BR2_microblaze || \
+		   BR2_mips        || BR2_mipsel     || BR2_powerpc || \
+		   BR2_sh          || BR2_x86_64
 	depends on !BR2_powerpc_SPE # not supported, build breaks
 	select BR2_TOOLCHAIN_USES_MUSL
 	help
-- 
2.1.4
