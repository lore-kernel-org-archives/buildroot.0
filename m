From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 05 Feb 2014 14:50:59 +0100
Subject: [Buildroot] [PATCH 7 of 8 v2] kernel-headers: remove deprecated
 versions 3.1, 3.3, 3.5
In-Reply-To: <patchbomb.1391608252@argentina>
References: <patchbomb.1391608252@argentina>
Message-ID: <db89333313976d299c34.1391608259@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Linux kernel headers versions 3.1, 3.3, and 3.5 have been deprecated
since 2013.02 and thus can be removed in 2014.02.
For legacy handling, we automatically select versions 3.2, 3.4, and 3.6,
respectively.

Additionally, this patch removes the now unused symbol
BR2_DEPRECATED_SINCE_2013_02.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: no changes

 Config.in                            |   4 ----
 Config.in.legacy                     |  30 ++++++++++++++++++++++++++++++
 package/linux-headers/Config.in.host |  15 ---------------
 3 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/Config.in b/Config.in
--- a/Config.in
+++ b/Config.in
@@ -264,10 +264,6 @@ config BR2_DEPRECATED
 
 if BR2_DEPRECATED
 
-config BR2_DEPRECATED_SINCE_2013_02
-	bool
-	default y
-
 config BR2_DEPRECATED_SINCE_2013_05
 	bool
 	default y
diff --git a/Config.in.legacy b/Config.in.legacy
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,36 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.02"
 
+config BR2_KERNEL_HEADERS_3_1
+	bool "kernel headers version 3.1.x are no longer supported"
+	select BR2_KERNEL_HEADERS_3_2
+	select BR2_LEGACY
+	help
+	  Version 3.1.x of the Linux kernel headers have been deprecated
+	  for more than four buildroot releases and are now removed.
+	  As an alternative, version 3.2.x of the headers have been
+	  automatically selected in your configuration.
+
+config BR2_KERNEL_HEADERS_3_3
+	bool "kernel headers version 3.3.x are no longer supported"
+	select BR2_KERNEL_HEADERS_3_4
+	select BR2_LEGACY
+	help
+	  Version 3.3.x of the Linux kernel headers have been deprecated
+	  for more than four buildroot releases and are now removed.
+	  As an alternative, version 3.4.x of the headers have been
+	  automatically selected in your configuration.
+
+config BR2_KERNEL_HEADERS_3_5
+	bool "kernel headers version 3.5.x are no longer supported"
+	select BR2_KERNEL_HEADERS_3_6
+	select BR2_LEGACY
+	help
+	  Version 3.5.x of the Linux kernel headers have been deprecated
+	  for more than four buildroot releases and are now removed.
+	  As an alternative, version 3.6.x of the headers have been
+	  automatically selected in your configuration.
+
 config BR2_GDB_VERSION_7_2
 	bool "gdb 7.2.x is no longer supported"
 	select BR2_GDB_VERSION_7_5
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -18,26 +18,14 @@ choice
 		bool "Linux 3.0.x kernel headers"
 		depends on !BR2_arc
 
-	config BR2_KERNEL_HEADERS_3_1
-		bool "Linux 3.1.x kernel headers"
-		depends on BR2_DEPRECATED_SINCE_2013_02 && !BR2_arc
-
 	config BR2_KERNEL_HEADERS_3_2
 		bool "Linux 3.2.x kernel headers"
 		depends on !BR2_arc
 
-	config BR2_KERNEL_HEADERS_3_3
-		bool "Linux 3.3.x kernel headers"
-		depends on BR2_DEPRECATED_SINCE_2013_02 && !BR2_arc
-
 	config BR2_KERNEL_HEADERS_3_4
 		bool "Linux 3.4.x kernel headers"
 		depends on !BR2_arc
 
-	config BR2_KERNEL_HEADERS_3_5
-		bool "Linux 3.5.x kernel headers"
-		depends on BR2_DEPRECATED_SINCE_2013_02 && !BR2_arc
-
 	config BR2_KERNEL_HEADERS_3_6
 		bool "Linux 3.6.x kernel headers"
 		depends on BR2_DEPRECATED_SINCE_2013_05 && !BR2_arc
@@ -83,11 +71,8 @@ config BR2_DEFAULT_KERNEL_VERSION
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
-	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.54"	if BR2_KERNEL_HEADERS_3_2
-	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
 	default "3.4.78"	if BR2_KERNEL_HEADERS_3_4
-	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
