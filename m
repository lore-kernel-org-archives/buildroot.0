From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jun 2014 22:27:39 +0200
Subject: [Buildroot] [git commit] kernel headers: remove deprecated version
	3.8
Message-ID: <20140613203016.11C989CFBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dfae6f6765a6e596cde9f40de73b0c1979269174
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kernel headers version 3.8.x has been deprecated since 2013.08 and thus can
be removed in 2014.08.
An automatic selection of 3.9.x headers is performed in the legacy menu.
Existing automatic selections of 3.8.x headers are modified to select
3.9.x.

As this patch removes the last occurrence of BR2_DEPRECATED_SINCE_2013_08,
the symbol is removed too.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in                            |    4 ----
 Config.in.legacy                     |   16 +++++++++++++---
 package/linux-headers/Config.in.host |    6 ------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Config.in b/Config.in
index 0799cb7..8ff725a 100644
--- a/Config.in
+++ b/Config.in
@@ -280,10 +280,6 @@ config BR2_DEPRECATED
 
 if BR2_DEPRECATED
 
-config BR2_DEPRECATED_SINCE_2013_08
-	bool
-	default y
-
 config BR2_DEPRECATED_SINCE_2013_11
 	bool
 	default y
diff --git a/Config.in.legacy b/Config.in.legacy
index c6bb2fe..a2c7846 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,16 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.08"
 
+config BR2_KERNEL_HEADERS_3_8
+	bool "kernel headers version 3.8.x are no longer supported"
+	select BR2_KERNEL_HEADERS_3_9
+	select BR2_LEGACY
+	help
+	  Version 3.8.x of the Linux kernel headers have been deprecated
+	  for more than four buildroot releases and are now removed.
+	  As an alternative, version 3.9.x of the headers have been
+	  automatically selected in your configuration.
+
 config BR2_PACKAGE_GETTEXT_TOOLS
 	bool "support for gettext-tools on target has been removed"
 	select BR2_LEGACY
@@ -131,7 +141,7 @@ config BR2_PACKAGE_EVTEST_CAPTURE
 
 config BR2_KERNEL_HEADERS_3_6
 	bool "kernel headers version 3.6.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_8
+	select BR2_KERNEL_HEADERS_3_9
 	select BR2_LEGACY
 	help
 	  Version 3.6.x of the Linux kernel headers have been deprecated
@@ -141,7 +151,7 @@ config BR2_KERNEL_HEADERS_3_6
 
 config BR2_KERNEL_HEADERS_3_7
 	bool "kernel headers version 3.7.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_8
+	select BR2_KERNEL_HEADERS_3_9
 	select BR2_LEGACY
 	help
 	  Version 3.7.x of the Linux kernel headers have been deprecated
@@ -326,7 +336,7 @@ config BR2_KERNEL_HEADERS_3_3
 
 config BR2_KERNEL_HEADERS_3_5
 	bool "kernel headers version 3.5.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_8
+	select BR2_KERNEL_HEADERS_3_9
 	select BR2_LEGACY
 	help
 	  Version 3.5.x of the Linux kernel headers have been deprecated
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a9d42ca..7b674bb 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -26,11 +26,6 @@ choice
 		depends on !BR2_arc
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 
-	config BR2_KERNEL_HEADERS_3_8
-		bool "Linux 3.8.x kernel headers"
-		depends on BR2_DEPRECATED_SINCE_2013_08 && !BR2_arc
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
-
 	config BR2_KERNEL_HEADERS_3_9
 		bool "Linux 3.9.x kernel headers"
 		depends on BR2_DEPRECATED_SINCE_2013_11
@@ -155,7 +150,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.60"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.93"	if BR2_KERNEL_HEADERS_3_4
-	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
 	default "3.10.43"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
