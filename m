From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Dec 2019 11:47:43 +0100
Subject: [Buildroot] [git commit] {linux, linux-headers}: add version 5.4
Message-ID: <20191202110750.E2B5583870@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e000606c34f95cd2e18fc5e5d7479260de1b785
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                                               |  4 ++--
 linux/linux.hash                                              |  1 +
 package/linux-headers/Config.in.host                          | 11 ++++++++++-
 toolchain/Config.in                                           |  5 +++++
 .../toolchain-external-custom/Config.in.options               |  4 ++++
 5 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 14d737311a..3d68ba1ebc 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -32,7 +32,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (5.3)"
+	bool "Latest version (5.4)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (4.19.82-cip14)"
@@ -133,7 +133,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.3.14" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.82-cip14" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.72-cip10-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index ba42b8357a..cb9e7c1b6f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,5 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256 955712688c7256675383ec5be4ee044dbb59116a9a1f24e8689d12a6f95f7932  linux-5.3.14.tar.xz
+sha256 bf338980b1670bca287f9994b7441c2361907635879169c64ae78364efc5f491  linux-5.4.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 fa1f8fe9c12e18e5cda18cf759b77ae9e778e1e9006d837426c955b75bd4eaa6  linux-4.4.205.tar.xz
 sha256 98b9e8644706acc0cf51022372bb263b59a1d2bbe3ccd7ce6bd9bc7378c78b05  linux-4.9.205.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 95748ea62c..3ff2b05b19 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_5_3
+	default BR2_KERNEL_HEADERS_5_4
 	help
 	  Select the kernel version to get headers from.
 
@@ -53,6 +53,10 @@ config BR2_KERNEL_HEADERS_5_3
 	bool "Linux 5.3.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
 
+config BR2_KERNEL_HEADERS_5_4
+	bool "Linux 5.4.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 	help
@@ -118,6 +122,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4
+	bool "5.4.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3
 	bool "5.3.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
@@ -310,6 +318,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.14.157"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.87"	if BR2_KERNEL_HEADERS_4_19
 	default "5.3.14"	if BR2_KERNEL_HEADERS_5_3
+	default "5.4" 		if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 7960131f0c..858121d2c5 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -454,10 +454,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.4"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	default "5.3"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
 	default "5.2"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 	default "5.1"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index fd95f8201b..665765a104 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -109,6 +109,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4
+	bool "5.4.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3
 	bool "5.3.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
