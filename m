From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 30 Mar 2020 20:22:50 +0200
Subject: [Buildroot] [PATCH 3/3] {linux, linux-headers}: add version 5.6
In-Reply-To: <20200330182250.1515995-1-bernd.kuhls@t-online.de>
References: <20200330182250.1515995-1-bernd.kuhls@t-online.de>
Message-ID: <20200330182250.1515995-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 linux/Config.in                                       |  4 ++--
 linux/linux.hash                                      |  1 +
 package/linux-headers/Config.in.host                  | 11 ++++++++++-
 toolchain/Config.in                                   |  5 +++++
 .../toolchain-external-custom/Config.in.options       |  4 ++++
 5 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 86b5092b8a..1adbd86b1f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -27,7 +27,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (5.5)"
+	bool "Latest version (5.6)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (4.19.98-cip19)"
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.5.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.98-cip19" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.98-cip19-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index e37d5eb86b..b634841ceb 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256  e342b04a2aa63808ea0ef1baab28fc520bd031ef8cf93d9ee4a31d4058fcb622  linux-5.6.tar.xz
 sha256  1f3b3614a06bffc9c621c82f98d8ca88c60538a8c6dd77f96f2e7fee310a4ee2  linux-5.5.13.tar.xz
 sha256  19b9cd362d647f2529c5ffc02ede52ac6b517eb685481b9cd00f7de3d30dec6b  linux-5.4.27.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b89605bbf7..d7b887ed82 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_5_5
+	default BR2_KERNEL_HEADERS_5_6
 	help
 	  Select the kernel version to get headers from.
 
@@ -59,6 +59,10 @@ config BR2_KERNEL_HEADERS_5_5
 	bool "Linux 5.5.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
 
+config BR2_KERNEL_HEADERS_5_6
+	bool "Linux 5.6.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 	help
@@ -131,6 +135,10 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6
+	bool "5.6.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_5
 	bool "5.5.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
@@ -332,6 +340,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.112"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.27"	if BR2_KERNEL_HEADERS_5_4
 	default "5.5.13"	if BR2_KERNEL_HEADERS_5_5
+	default "5.6"		if BR2_KERNEL_HEADERS_5_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index a34436d16b..b6bcde4a95 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -472,6 +472,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -485,6 +489,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
 	default "5.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
 	default "5.4"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	default "5.3"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 91d55602e0..6e55c0ef1d 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -115,6 +115,10 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_6
+	bool "5.6.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_5
 	bool "5.5.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
-- 
2.25.0
