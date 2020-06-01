From: Michael Walle <michael@walle.cc>
Date: Mon,  1 Jun 2020 17:16:59 +0200
Subject: [Buildroot] [PATCH for-next v4 1/3] {linux,
 linux-headers}: add version 5.7
Message-ID: <20200601151701.21569-1-michael@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Walle <michael@walle.cc>
---
This is a prerequisite for the sl28 board support which needs at least
kernel 5.7, thus pack it into one series. This is a new patch and thus,
there is no former version. This patch can also be picked early, before the
other two patches.

Changes since v3:
 new patch

 linux/Config.in                                     |  4 ++--
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 5 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d7373ab25a..e335931575 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -27,7 +27,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (5.6)"
+	bool "Latest version (5.7)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (4.19.98-cip19)"
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.6.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.98-cip19" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.98-cip19-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 0449be680d..c9fb7edb4f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256  de8163bb62f822d84f7a3983574ec460060bf013a78ff79cd7c979ff1ec1d7e0  linux-5.7.tar.xz
 sha256  23a0420f29eacb66d71f86f64fbd35a1b6ff617d520e3e05f3e1f537d46692ca  linux-5.6.7.tar.xz
 sha256  1448334371fb52f511255726832464d33877a210a7350260fb18eb225ae211eb  linux-5.5.19.tar.xz
 sha256  e16bd5f7284a80a41328bf712e1136b0adf5b71cc0bd263efa7cac75539806d4  linux-5.4.35.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c6ba8469fd..8e3663481f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_5_6
+	default BR2_KERNEL_HEADERS_5_7
 	help
 	  Select the kernel version to get headers from.
 
@@ -63,6 +63,10 @@ config BR2_KERNEL_HEADERS_5_6
 	bool "Linux 5.6.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
 
+config BR2_KERNEL_HEADERS_5_7
+	bool "Linux 5.7.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 	help
@@ -135,8 +139,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7
+	bool "5.7.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6
-	bool "5.6.x or later"
+	bool "5.6.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_5
@@ -341,6 +349,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.35"	if BR2_KERNEL_HEADERS_5_4
 	default "5.5.19"	if BR2_KERNEL_HEADERS_5_5
 	default "5.6.7"		if BR2_KERNEL_HEADERS_5_6
+	default "5.7"		if BR2_KERNEL_HEADERS_5_7
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index b6bcde4a95..6865199ffc 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -476,6 +476,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -489,6 +493,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
 	default "5.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
 	default "5.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
 	default "5.4"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 9a8078d314..a4430f7169 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -115,8 +115,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_7
+	bool "5.7.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_6
-	bool "5.6.x or later"
+	bool "5.6.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_5
-- 
2.20.1
