From: Michael Walle <michael@walle.cc>
Date: Tue, 16 Feb 2021 11:47:22 +0100
Subject: [Buildroot] [PATCH 1/2] {linux, linux-headers}: add version 5.11
Message-ID: <20210216104723.17538-1-michael@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Walle <michael@walle.cc>
---
Romain, this time I've checked wether PPC40x support is dropped and the
patches you mentioned last time didn't make it into mainline (yet) ;)

 linux/Config.in                                     |  4 ++--
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 5 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f0515632e5..3370162faa 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,7 +28,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (5.10)"
+	bool "Latest version (5.11)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (4.19.152-cip37)"
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.10.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.152-cip37" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.152-cip37-rt16" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 5200c53a35..58b8c1171a 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256  04f07b54f0d40adfab02ee6cbd2a942c96728d87c1ef9e120d0cb9ba3fe067b4  linux-5.11.tar.xz
 sha256  06698c0ce35ceefa9b79ceb108ec7fb86de05f51fe615f3ae5cc82e293dfe1f2  linux-5.10.13.tar.xz
 sha256  030ae544f346bfa2ce619dd9e17e93d10ec393632d3b6d6cf5d1fc84b914d449  linux-5.4.95.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8da119cfa9..f50a9d0ff4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_5_10
+	default BR2_KERNEL_HEADERS_5_11
 	help
 	  Select the kernel version to get headers from.
 
@@ -57,6 +57,10 @@ config BR2_KERNEL_HEADERS_5_4
 config BR2_KERNEL_HEADERS_5_10
 	bool "Linux 5.10.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+
+config BR2_KERNEL_HEADERS_5_11
+	bool "Linux 5.11.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -131,8 +135,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11
+	bool "5.11.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10
-	bool "5.10.x or later"
+	bool "5.10.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_9
@@ -352,6 +360,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.173"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.95"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.13"	if BR2_KERNEL_HEADERS_5_10
+	default "5.11"		if BR2_KERNEL_HEADERS_5_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 553612c4aa..ce7e7f6cc4 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -492,6 +492,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -505,6 +509,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
 	default "5.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	default "5.9"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
 	default "5.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 992fd2c150..4331c2528a 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -119,8 +119,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_11
+	bool "5.11.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_10
-	bool "5.10.x or later"
+	bool "5.10.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9
-- 
2.20.1
