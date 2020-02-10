From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 10 Feb 2020 17:21:02 +0100
Subject: [Buildroot] [PATCH] {linux, linux-headers}: add version 5.5
Message-ID: <20200210162102.27584-1-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 linux/Config.in                                       |  4 ++--
 linux/linux.hash                                      |  1 +
 package/linux-headers/Config.in.host                  | 11 ++++++++++-
 toolchain/Config.in                                   |  5 +++++
 .../toolchain-external-custom/Config.in.options       |  4 ++++
 5 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 14b76205e4..5c4d58092e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -27,7 +27,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (5.4)"
+	bool "Latest version (5.5)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (4.19.94-cip18)"
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.94-cip18" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.90-cip16-rt6" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 560bdfc704..be43bef708 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,5 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256 49fb29d96d7e7c1d7e6082701bd26bfddd0fbc87a796fb6ba6258bc5fd386ad7  linux-5.4.13.tar.xz
+sha256 a6fbd4ee903c128367892c2393ee0d9657b6ed3ea90016d4dc6f1f6da20b2330  linux-5.5.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 da02389a9c39284dca01b7ba48e845be3dd5ce0fed0b5f30150d8d303429e7dd  linux-4.4.210.tar.xz
 sha256 a0915203836d02cc3cd70252904700412c4a409737a81b392465fb70d7625313  linux-4.9.210.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ee3a8fe1ba..d10a50fd40 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_5_4
+	default BR2_KERNEL_HEADERS_5_5
 	help
 	  Select the kernel version to get headers from.
 
@@ -53,6 +53,10 @@ config BR2_KERNEL_HEADERS_5_4
 	bool "Linux 5.4.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 
+config BR2_KERNEL_HEADERS_5_5
+	bool "Linux 5.5.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 	help
@@ -118,6 +122,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_5
+	bool "5.5.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4
 	bool "5.4.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
@@ -314,6 +322,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.14.166"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.97"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.13"	if BR2_KERNEL_HEADERS_5_4
+	default "5.5"		if BR2_KERNEL_HEADERS_5_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 858121d2c5..c166c9d201 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -458,10 +458,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
 	default "5.4"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	default "5.3"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
 	default "5.2"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 665765a104..f256105463 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -109,6 +109,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_5
+	bool "5.5.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4
 	bool "5.4.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
-- 
2.17.1
