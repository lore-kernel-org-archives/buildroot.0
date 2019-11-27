From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 27 Nov 2019 14:39:05 +0100
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump to version 5.4
Message-ID: <20191127133905.343071-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 linux/Config.in                                       |  4 ++--
 linux/linux.hash                                      |  1 +
 package/linux-headers/Config.in.host                  | 11 ++++++++++-
 toolchain/Config.in                                   |  5 +++++
 .../toolchain-external-custom/Config.in.options       |  4 ++++
 5 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 3fa0d7e7b2..d9199562b6 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -32,7 +32,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (5.3)"
+	bool "Latest version (5.4)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.19.75-cip11)"
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.3.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.75-cip11" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 3566c93266..f1a7c6eeb4 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,5 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256 9f04e53f03d0ead6561195fb71aac18cbee419112ed54f9d4fc1515a5fa5c92f  linux-5.3.13.tar.xz
+sha256 bf338980b1670bca287f9994b7441c2361907635879169c64ae78364efc5f491  linux-5.4.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 9262528aeaf5991c2008d7d9ea3994f9a548f000da39c0565a35f50863b4790a  linux-4.4.203.tar.xz
 sha256 1cd950cfaff8ddcc11596d970ec622fa3cdbedd75d3e28ddd3a9383f3cb2a849  linux-4.9.203.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5f1952731c..4d6bf2aa68 100644
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
 	default "4.14.156"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.86"	if BR2_KERNEL_HEADERS_4_19
 	default "5.3.13"	if BR2_KERNEL_HEADERS_5_3
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
-- 
2.24.0
