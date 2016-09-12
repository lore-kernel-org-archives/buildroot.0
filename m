From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 12 Sep 2016 13:15:54 -0300
Subject: [Buildroot] [PATCH v2 1/2] linux-headers: Allow building a 4.8-rc
	kernel
Message-ID: <1473696955-24297-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

It is useful to be able to build the latest rc kernel, so
add support for it.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Do not make 4.8-rc the default kernel (Thomas)

 package/linux-headers/Config.in.host   | 8 ++++++++
 toolchain/toolchain-common.in          | 5 +++++
 toolchain/toolchain-external/Config.in | 4 ++++
 3 files changed, 17 insertions(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7fea748..8601eff 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -86,6 +86,10 @@ choice
 		bool "Linux 4.7.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 
+	config BR2_KERNEL_HEADERS_4_8
+		bool "Linux 4.8-rc kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -106,6 +110,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8
+	bool "4.8.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7
 	bool "4.7.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 03fa880..b682e4d 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -222,10 +222,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
 	default "4.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	default "4.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
 	default "4.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 63b7712..c3822ed 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -794,6 +794,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_8
+	bool "4.8.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_7
 	bool "4.7.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
-- 
2.7.4
