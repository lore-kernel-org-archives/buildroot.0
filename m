From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 22:44:50 +0200
Subject: [Buildroot] [git commit] {linux,
 linux-headers}: bump to version 5.3.1
Message-ID: <20190928203959.C47ED82619@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d899562f4fcf947b7abb65578ff694bf49a6663a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                                               |  4 ++--
 linux/linux.hash                                              |  1 +
 package/linux-headers/Config.in.host                          | 11 ++++++++++-
 toolchain/Config.in                                           |  5 +++++
 .../toolchain-external-custom/Config.in.options               |  4 ++++
 5 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 0e3cabf107..7e236b035b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -32,7 +32,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (5.2)"
+	bool "Latest version (5.3)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.19.65-cip8)"
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.2.16" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.3.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.65-cip8" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 576f263966..b6442c42f2 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256 9890b5a909d316211d045a95f5f0680e39749f2319cb26d7cd067efaa692f858  linux-5.3.1.tar.xz
 sha256 0c2061c9edc8ab213b77f23af1d5a018127c2603404498a528651d56a795e575  linux-5.2.16.tar.xz
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 91e648d110..b67a48cf3d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_5_2
+	default BR2_KERNEL_HEADERS_5_3
 	help
 	  Select the kernel version to get headers from.
 
@@ -57,6 +57,10 @@ config BR2_KERNEL_HEADERS_5_2
 	bool "Linux 5.2.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 
+config BR2_KERNEL_HEADERS_5_3
+	bool "Linux 5.3.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 	help
@@ -122,6 +126,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3
+	bool "5.3.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_2
 	bool "5.2.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
@@ -311,6 +319,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.74"	if BR2_KERNEL_HEADERS_4_19
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
 	default "5.2.16"	if BR2_KERNEL_HEADERS_5_2
+	default "5.3.1"		if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index bd2c547ff1..3bc3b1b4b0 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -433,10 +433,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.3"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
 	default "5.2"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 	default "5.1"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 	default "5.0"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 679e727509..83d9ed61d7 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -109,6 +109,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3
+	bool "5.3.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_2
 	bool "5.2.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
