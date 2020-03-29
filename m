From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2020 19:14:59 +0200
Subject: [Buildroot] [git commit] {linux, linux-headers}: add version 5.5
Message-ID: <20200329170202.53A1188F4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb094c0110494ae13643ad9e7599b2f39ee3536a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
[yann.morin.1998 at free.fr:
  - bump to 5.5.13
  - rebase on top of master
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/Config.in                                             |  4 ++--
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 5 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 72230f1a61..86b5092b8a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -27,7 +27,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (5.4)"
+	bool "Latest version (5.5)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (4.19.98-cip19)"
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.27" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.5.13" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.98-cip19" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.98-cip19-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 91d9aeb4fc..e37d5eb86b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256  1f3b3614a06bffc9c621c82f98d8ca88c60538a8c6dd77f96f2e7fee310a4ee2  linux-5.5.13.tar.xz
 sha256  19b9cd362d647f2529c5ffc02ede52ac6b517eb685481b9cd00f7de3d30dec6b  linux-5.4.27.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  fdeac4c05fcca993927fdce51446b4f81725f54e753fea02b0b2dacf3d64526f  linux-4.4.217.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 00a796fb93..5c5a9b0330 100644
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
 
@@ -55,6 +55,10 @@ config BR2_KERNEL_HEADERS_5_4
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_KERNEL_HEADERS_LATEST
 
+config BR2_KERNEL_HEADERS_5_5
+	bool "Linux 5.5.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 	help
@@ -127,8 +131,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_5
+	bool "5.5.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4
-	bool "5.4.x or later"
+	bool "5.4.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3
@@ -323,6 +331,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.14.174"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.112"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.27"	if BR2_KERNEL_HEADERS_5_4
+	default "5.5.13"	if BR2_KERNEL_HEADERS_5_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index bff572805d..24bb982e9b 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -477,10 +477,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 config BR2_TOOLCHAIN_HEADERS_LATEST
 	bool
 
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
index 8c38dd9fcd..31fe651081 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -115,8 +115,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_5
+	bool "5.5.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4
-	bool "5.4.x or later"
+	bool "5.4.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3
