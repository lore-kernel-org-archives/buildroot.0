From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 24 Oct 2017 22:24:59 -0500
Subject: [Buildroot] [PATCH 1/2] stack protector: moved option to security
	menu
Message-ID: <1508901900-11190-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 Config.in | 114 ++++++++++++++++++++++++++++++++------------------------------
 1 file changed, 59 insertions(+), 55 deletions(-)

diff --git a/Config.in b/Config.in
index 814dc02..f3c9dcd 100644
--- a/Config.in
+++ b/Config.in
@@ -566,61 +566,6 @@ config BR2_GOOGLE_BREAKPAD_INCLUDE_FILES
 endif
 
 choice
-	bool "build code with Stack Smashing Protection"
-	default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
-	depends on BR2_TOOLCHAIN_HAS_SSP
-	help
-	  Enable stack smashing protection support using GCC's
-	  -fstack-protector option family.
-
-	  See
-	  http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
-	  for details.
-
-	  Note that this requires the toolchain to have SSP support.
-	  This is always the case for glibc and eglibc toolchain, but is
-	  optional in uClibc toolchains.
-
-config BR2_SSP_NONE
-	bool "None"
-	help
-	  Disable stack-smashing protection.
-
-config BR2_SSP_REGULAR
-	bool "-fstack-protector"
-	help
-	  Emit extra code to check for buffer overflows, such as stack
-	  smashing attacks. This is done by adding a guard variable to
-	  functions with vulnerable objects. This includes functions
-	  that call alloca, and functions with buffers larger than 8
-	  bytes. The guards are initialized when a function is entered
-	  and then checked when the function exits. If a guard check
-	  fails, an error message is printed and the program exits.
-
-config BR2_SSP_STRONG
-	bool "-fstack-protector-strong"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	help
-	  Like -fstack-protector but includes additional functions to be
-	  protected - those that have local array definitions, or have
-	  references to local frame addresses.
-
-comment "Stack Smashing Protection strong needs a toolchain w/ gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-
-config BR2_SSP_ALL
-	bool "-fstack-protector-all"
-	help
-	  Like -fstack-protector except that all functions are
-	  protected. This option might have a significant performance
-	  impact on the compiled binaries.
-
-endchoice
-
-comment "Stack Smashing Protection needs a toolchain w/ SSP"
-	depends on !BR2_TOOLCHAIN_HAS_SSP
-
-choice
 	bool "libraries"
 	default BR2_SHARED_LIBS if BR2_BINFMT_SUPPORTS_SHARED
 	default BR2_STATIC_LIBS if !BR2_BINFMT_SUPPORTS_SHARED
@@ -728,6 +673,65 @@ config BR2_REPRODUCIBLE
 
 endmenu
 
+menu "Security Hardening Options"
+
+choice
+	bool "build code with Stack Smashing Protection"
+	default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	help
+	  Enable stack smashing protection support using GCC's
+	  -fstack-protector option family.
+
+	  See
+	  http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
+	  for details.
+
+	  Note that this requires the toolchain to have SSP support.
+	  This is always the case for glibc and eglibc toolchain, but is
+	  optional in uClibc toolchains.
+
+config BR2_SSP_NONE
+	bool "None"
+	help
+	  Disable stack-smashing protection.
+
+config BR2_SSP_REGULAR
+	bool "-fstack-protector"
+	help
+	  Emit extra code to check for buffer overflows, such as stack
+	  smashing attacks. This is done by adding a guard variable to
+	  functions with vulnerable objects. This includes functions
+	  that call alloca, and functions with buffers larger than 8
+	  bytes. The guards are initialized when a function is entered
+	  and then checked when the function exits. If a guard check
+	  fails, an error message is printed and the program exits.
+
+config BR2_SSP_STRONG
+	bool "-fstack-protector-strong"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	help
+	  Like -fstack-protector but includes additional functions to be
+	  protected - those that have local array definitions, or have
+	  references to local frame addresses.
+
+comment "Stack Smashing Protection strong needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
+config BR2_SSP_ALL
+	bool "-fstack-protector-all"
+	help
+	  Like -fstack-protector except that all functions are
+	  protected. This option might have a significant performance
+	  impact on the compiled binaries.
+
+endchoice
+
+comment "Stack Smashing Protection needs a toolchain w/ SSP"
+	depends on !BR2_TOOLCHAIN_HAS_SSP
+
+endmenu
+
 endmenu
 
 source "toolchain/Config.in"
-- 
1.9.1
