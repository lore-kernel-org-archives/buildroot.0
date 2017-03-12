From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 23:46:15 +0100
Subject: [Buildroot] [git commit] linux-headers: remove 3.18.x and 4.8.x
	series
Message-ID: <20170312224702.D279E82489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f73ff5317f21f746b0e724f7e1817603a08572e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These aren't supported upstream any more so remove the options and add
them to legacy handling.

Switch older deprecations that used 3.18.x to 3.12.x

Remove stray version strings as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                     | 28 ++++++++++++++++++++++++----
 package/linux-headers/Config.in.host | 13 -------------
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 67a9a23..090e60a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -167,6 +167,26 @@ config BR2_PACKAGE_GMOCK
 	help
 	  GMock is now a suboption of the GTest package.
 
+config BR2_KERNEL_HEADERS_4_8
+	bool "kernel headers version 4.8.x are no longer supported"
+	select BR2_KERNEL_HEADERS_4_4
+	select BR2_LEGACY
+	help
+	  Version 4.8.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed. As an alternative,
+	  version 4.4.x of the headers have been automatically
+	  selected in your configuration.
+
+config BR2_KERNEL_HEADERS_3_18
+	bool "kernel headers version 3.18.x are no longer supported"
+	select BR2_KERNEL_HEADERS_3_12
+	select BR2_LEGACY
+	help
+	  Version 3.18.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed. As an alternative,
+	  version 3.12.x of the headers have been automatically
+	  selected in your configuration.
+
 config BR2_GLIBC_VERSION_2_22
 	bool "glibc 2.22 removed"
 	select BR2_LEGACY
@@ -444,22 +464,22 @@ config BR2_GCC_VERSION_4_8_ARC
 
 config BR2_KERNEL_HEADERS_4_0
 	bool "kernel headers version 4.0.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_18
+	select BR2_KERNEL_HEADERS_3_12
 	select BR2_LEGACY
 	help
 	  Version 4.0.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.18.x of the headers have been
+	  As an alternative, version 3.12.x of the headers have been
 	  automatically selected in your configuration.
 
 config BR2_KERNEL_HEADERS_3_19
 	bool "kernel headers version 3.19.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_18
+	select BR2_KERNEL_HEADERS_3_12
 	select BR2_LEGACY
 	help
 	  Version 3.19.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.18.x of the headers have been
+	  As an alternative, version 3.12.x of the headers have been
 	  automatically selected in your configuration.
 
 config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7c36e17..57e690e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -46,11 +46,6 @@ choice
 		depends on !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 
-	config BR2_KERNEL_HEADERS_3_18
-		bool "Linux 3.18.x kernel headers"
-		depends on !BR2_nios2
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
-
 	config BR2_KERNEL_HEADERS_4_1
 		bool "Linux 4.1.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
@@ -59,10 +54,6 @@ choice
 		bool "Linux 4.4.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
 
-	config BR2_KERNEL_HEADERS_4_8
-		bool "Linux 4.8.x kernel headers"
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
-
 	config BR2_KERNEL_HEADERS_4_9
 		bool "Linux 4.9.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
@@ -226,12 +217,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.70"	if BR2_KERNEL_HEADERS_3_12
-	default "3.18.48"	if BR2_KERNEL_HEADERS_3_18
-	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
-	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.38"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.52"	if BR2_KERNEL_HEADERS_4_4
-	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
 	default "4.9.13"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.1"	if BR2_KERNEL_HEADERS_4_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
