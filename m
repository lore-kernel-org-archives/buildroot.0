From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 31 Mar 2014 09:20:59 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: add 3.14 and bump 3.4.x
	stable version
Message-ID: <1396268460-11000-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 13 +++++++++++--
 toolchain/toolchain-common.in        |  5 +++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1fa498d..6d8b867 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,7 +5,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_13
+	default BR2_KERNEL_HEADERS_3_14
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -65,6 +65,10 @@ choice
 		bool "Linux 3.13.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
 
+	config BR2_KERNEL_HEADERS_3_14
+		bool "Linux 3.14.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -86,6 +90,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14
+	bool "3.14.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13
 	bool "3.13.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
@@ -151,7 +159,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.55"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.84"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.85"	if BR2_KERNEL_HEADERS_3_4
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
@@ -160,4 +168,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.15"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.7"	if BR2_KERNEL_HEADERS_3_13
+	default "3.14"		if BR2_KERNEL_HEADERS_3_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 9dd2f5d..b65b227 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -173,10 +173,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "3.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	default "3.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
 	default "3.12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	default "3.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
-- 
1.8.3.2
