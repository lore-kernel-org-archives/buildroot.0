From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 May 2014 23:35:06 +0200
Subject: [Buildroot] [git commit] kernel headers: remove deprecated versions
	3.6 and 3.7
Message-ID: <20140501213801.1D54F9C468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47c2d1b485d08fc4c0643ffed3d20f3c76254808
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kernel headers versions 3.6.x and 3.7.x have been deprecated since 2013.05
and thus can be removed in 2014.05.
An automatic selection of 3.8.x headers is performed in the legacy menu.
An existing automatic selection of 3.6.x headers is modified to select
3.8.x.

As this patch removes the last occurrances of BR2_DEPRECATED_SINCE_2013_05,
the symbol is removed too.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in                            |    4 ----
 Config.in.legacy                     |   24 ++++++++++++++++++++++--
 package/linux-headers/Config.in.host |   12 ------------
 3 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/Config.in b/Config.in
index 5823274..79a455d 100644
--- a/Config.in
+++ b/Config.in
@@ -280,10 +280,6 @@ config BR2_DEPRECATED
 
 if BR2_DEPRECATED
 
-config BR2_DEPRECATED_SINCE_2013_05
-	bool
-	default y
-
 config BR2_DEPRECATED_SINCE_2013_08
 	bool
 	default y
diff --git a/Config.in.legacy b/Config.in.legacy
index 023dfd3..1eb2985 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,26 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.05"
 
+config BR2_KERNEL_HEADERS_3_6
+	bool "kernel headers version 3.6.x are no longer supported"
+	select BR2_KERNEL_HEADERS_3_8
+	select BR2_LEGACY
+	help
+	  Version 3.6.x of the Linux kernel headers have been deprecated
+	  for more than four buildroot releases and are now removed.
+	  As an alternative, version 3.8.x of the headers have been
+	  automatically selected in your configuration.
+
+config BR2_KERNEL_HEADERS_3_7
+	bool "kernel headers version 3.7.x are no longer supported"
+	select BR2_KERNEL_HEADERS_3_8
+	select BR2_LEGACY
+	help
+	  Version 3.7.x of the Linux kernel headers have been deprecated
+	  for more than four buildroot releases and are now removed.
+	  As an alternative, version 3.8.x of the headers have been
+	  automatically selected in your configuration.
+
 config BR2_PACKAGE_VALA
 	bool "vala target package has been removed"
 	select BR2_LEGACY
@@ -278,12 +298,12 @@ config BR2_KERNEL_HEADERS_3_3
 
 config BR2_KERNEL_HEADERS_3_5
 	bool "kernel headers version 3.5.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_6
+	select BR2_KERNEL_HEADERS_3_8
 	select BR2_LEGACY
 	help
 	  Version 3.5.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.6.x of the headers have been
+	  As an alternative, version 3.8.x of the headers have been
 	  automatically selected in your configuration.
 
 config BR2_GDB_VERSION_7_2
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6e2b7f7..477e0af 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -26,16 +26,6 @@ choice
 		depends on !BR2_arc
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 
-	config BR2_KERNEL_HEADERS_3_6
-		bool "Linux 3.6.x kernel headers"
-		depends on BR2_DEPRECATED_SINCE_2013_05 && !BR2_arc
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
-
-	config BR2_KERNEL_HEADERS_3_7
-		bool "Linux 3.7.x kernel headers"
-		depends on BR2_DEPRECATED_SINCE_2013_05 && !BR2_arc
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
-
 	config BR2_KERNEL_HEADERS_3_8
 		bool "Linux 3.8.x kernel headers"
 		depends on BR2_DEPRECATED_SINCE_2013_08 && !BR2_arc
@@ -157,8 +147,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.57"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.88"	if BR2_KERNEL_HEADERS_3_4
-	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
-	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
 	default "3.10.38"	if BR2_KERNEL_HEADERS_3_10
