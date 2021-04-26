From: Michael Walle <michael@walle.cc>
Date: Mon, 26 Apr 2021 13:45:17 +0200
Subject: [Buildroot] [PATCH 1/2] {linux, linux-headers}: add version 5.12
Message-ID: <20210426114518.12145-1-michael@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Walle <michael@walle.cc>
---

Hi,

c6x was removed in 5.12. But that architecture was never supported
in buildroot.

See also:
https://kernelnewbies.org/Linux_5.12

-michael

 linux/Config.in                                     |  4 ++--
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 5 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index cf790963dd..7f1d9e3342 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,7 +28,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (5.11)"
+	bool "Latest version (5.12)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (4.19.182-cip45)"
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.11.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.12" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.182-cip45" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.165-cip41-rt18" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 992ae22d11..eedda7e007 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256  7d0df6f2bf2384d68d0bd8e1fe3e071d64364dcdc6002e7b5c87c92d48fac366  linux-5.12.tar.xz
 sha256  91f939263a350da676b274e3ec84ad5b57f27ffdf4bd6b74cd002ce21fc0c89f  linux-5.11.8.tar.xz
 sha256  930ae76b9a3b64b98802849aca332d17a706f20595de21e1ae729b55ee461add  linux-5.10.25.tar.xz
 sha256  1c3cef545f366b56332c11c28d074c9d9148c28059a970ec8710826652237560  linux-5.4.107.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6d83ecf952..52b67f31df 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_5_11
+	default BR2_KERNEL_HEADERS_5_12
 	help
 	  Select the kernel version to get headers from.
 
@@ -61,6 +61,10 @@ config BR2_KERNEL_HEADERS_5_10
 config BR2_KERNEL_HEADERS_5_11
 	bool "Linux 5.11.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
+
+config BR2_KERNEL_HEADERS_5_12
+	bool "Linux 5.12.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -135,8 +139,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12
+	bool "5.12.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11
-	bool "5.11.x or later"
+	bool "5.11.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10
@@ -361,6 +369,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.107"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.25"	if BR2_KERNEL_HEADERS_5_10
 	default "5.11.8"	if BR2_KERNEL_HEADERS_5_11
+	default "5.12"		if BR2_KERNEL_HEADERS_5_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index dc1e710603..c4df5f1274 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -500,6 +500,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -513,6 +517,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
 	default "5.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
 	default "5.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	default "5.9"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 4331c2528a..ba9aeb29ad 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -119,8 +119,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_12
+	bool "5.12.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_11
-	bool "5.11.x or later"
+	bool "5.11"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_10
-- 
2.20.1
