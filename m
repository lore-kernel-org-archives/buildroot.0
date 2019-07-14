From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jul 2019 12:38:55 +0200
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump to version 5.2
Message-ID: <20190714110118.12BC08129D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48491aa0a49c04a1438c75c59a012536628f5fb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Serhii Sakhno <sergei.sakhno@gmail.com>
[Peter: default to 5.2.x kernel headers]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                                               |  4 ++--
 linux/linux.hash                                              |  1 +
 package/linux-headers/Config.in.host                          | 11 ++++++++++-
 toolchain/Config.in                                           |  5 +++++
 .../toolchain-external-custom/Config.in.options               |  4 ++++
 5 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 19889830fc..9076f40ce6 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -32,7 +32,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (5.1)"
+	bool "Latest version (5.2)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.19.13-cip1)"
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.1.16" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.13-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index e0b9a0650a..009e9bd7c5 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256 54ad66f672e1a831b574f5e704e8a05f1e6180a8245d4bdd811208a6cb0ac1e7  linux-5.2.tar.xz
 sha256 8a3e55be3e788700836db6f75875b4d3b824a581d1eacfc2fcd29ed4e727ba3e  linux-5.1.16.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 327c5759d5888361d6c9d6adb0c8ad7e3c624eb05bb9e5869d9f3078dd0d3f87  linux-4.19.57.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6242b6e843..e003de090e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_5_1
+	default BR2_KERNEL_HEADERS_5_2
 	help
 	  Select the kernel version to get headers from.
 
@@ -53,6 +53,10 @@ config BR2_KERNEL_HEADERS_5_1
 	bool "Linux 5.1.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 
+config BR2_KERNEL_HEADERS_5_2
+	bool "Linux 5.2.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 	help
@@ -118,6 +122,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_2
+	bool "5.2.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1
 	bool "5.1.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
@@ -302,6 +310,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.14.132"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.57"	if BR2_KERNEL_HEADERS_4_19
 	default "5.1.16"	if BR2_KERNEL_HEADERS_5_1
+	default "5.2"		if BR2_KERNEL_HEADERS_5_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index db3ce3cf24..bd2c547ff1 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -429,10 +429,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.2"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 	default "5.1"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 	default "5.0"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
 	default "4.20" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index a2cc97f936..c5e2ce221b 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -129,6 +129,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_2
+	bool "5.2.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1
 	bool "5.1.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
