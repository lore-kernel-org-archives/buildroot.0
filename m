From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Sep 2020 22:02:16 +0200
Subject: [Buildroot] [git commit] {linux, linux-headers}: add version 5.8
Message-ID: <20200905195416.7D286877EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=775b81b270b0b5758302933d7ffe9d995a732702
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                                             |  4 ++--
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 5 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 834f362ead..49da2b81b2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -27,7 +27,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (5.7)"
+	bool "Latest version (5.8)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (4.19.132-cip30)"
@@ -124,7 +124,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.7.19" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.8.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.132-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.132-cip30-rt12" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index fbda638da6..d9f51e0dcc 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256  7b0bf5029c94df72d1244b6b77e79e376cff2817a782c3ac50767a4121fd17fe  linux-5.8.7.tar.xz
 sha256  419c6248b9ae4dfead4599787aecbfd202e88bc4124523adfa6dd2d642b99fe7  linux-5.7.19.tar.xz
 sha256  86f13d050f6389c5a1727fa81510ee8eceac795297bc584f443354609617fea4  linux-5.4.61.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a04866d8cb..a70a0f2b6b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_5_7
+	default BR2_KERNEL_HEADERS_5_8
 	help
 	  Select the kernel version to get headers from.
 
@@ -59,6 +59,10 @@ config BR2_KERNEL_HEADERS_5_7
 	bool "Linux 5.7.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
 
+config BR2_KERNEL_HEADERS_5_8
+	bool "Linux 5.8.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 	help
@@ -131,8 +135,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8
+	bool "5.8.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7
-	bool "5.7.x or later"
+	bool "5.7.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6
@@ -340,6 +348,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.142"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.61"	if BR2_KERNEL_HEADERS_5_4
 	default "5.7.19"	if BR2_KERNEL_HEADERS_5_7
+	default "5.8.7"		if BR2_KERNEL_HEADERS_5_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 83f5286701..6e2befed20 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -480,6 +480,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -493,6 +497,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
 	default "5.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
 	default "5.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
 	default "5.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index ee45e73292..d69db68a23 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -119,8 +119,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_8
+	bool "5.8.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_7
-	bool "5.7.x or later"
+	bool "5.7.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_6
