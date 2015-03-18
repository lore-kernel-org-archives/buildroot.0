From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 14:46:22 -0700
Subject: [Buildroot] [PATCH] implement granular choice for stack protector
Message-ID: <1426715182-25003-1-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows us to choose between the varying degrees of stack-smashing
protection. The differences are documented in the GCC online documentation[1].
The -fstack-protector-full option tends to be far too aggressive and have too
much of an impact on performance to be worth doing.

[1] https://gcc.gnu.org/onlinedocs/gcc-4.9.2/gcc/Optimize-Options.html
Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 Config.in                  | 42 ++++++++++++++++++++++++++++++++++++++----
 package/Makefile.in        | 10 +++++++++-
 package/gcc/Config.in.host |  4 ++++
 3 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/Config.in b/Config.in
index 2b39d6a..0006e37 100644
--- a/Config.in
+++ b/Config.in
@@ -506,12 +506,13 @@ config BR2_GOOGLE_BREAKPAD_INCLUDE_FILES
 
 endif
 
-config BR2_ENABLE_SSP
+choice
 	bool "build code with Stack Smashing Protection"
-	depends on BR2_TOOLCHAIN_HAS_SSP
+	default BR2_SSP_STRONG if BR2_TOOLCHAIN_HAS_SSP_STRONG
+	default BR2_SSP_REGULAR
 	help
-	  Enable stack smashing protection support using GCCs
-	  -fstack-protector-all option.
+	  Enable stack smashing protection support using GCC's
+	  -fstack-protector option family.
 
 	  See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
 	  for details.
@@ -520,6 +521,39 @@ config BR2_ENABLE_SSP
 	  support. This is always the case for glibc and eglibc
 	  toolchain, but is optional in uClibc toolchains.
 
+config BR2_SSP_NONE
+	bool "None"
+	help
+	  Disable stack-smashing protection.
+
+config BR2_SSP_REGULAR
+	bool "-fstack-protector"
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	help
+	  Emit extra code to check for buffer overflows, such as stack smashing
+	  attacks. This is done by adding a guard variable to functions with
+	  vulnerable objects. This includes functions that call alloca, and
+	  functions with buffers larger than 8 bytes. The guards are initialized
+	  when a function is entered and then checked when the function exits. If
+	  a guard check fails, an error message is printed and the program exits.
+
+config BR2_SSP_STRONG
+	bool "-fstack-protector-strong"
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	depends on BR2_TOOLCHAIN_HAS_SSP_STRONG
+	help
+	  Like -fstack-protector but includes additional functions to be protected
+	  ? those that have local array definitions, or have references to local
+	  frame addresses.
+
+config BR2_SSP_ALL
+	bool "-fstack-protector-all"
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	help
+	  Like -fstack-protector except that all functions are protected.
+
+endchoice
+
 comment "enabling Stack Smashing Protection requires support in the toolchain"
 	depends on !BR2_TOOLCHAIN_HAS_SSP
 
diff --git a/package/Makefile.in b/package/Makefile.in
index 803b162..68dc329 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -163,7 +163,15 @@ TARGET_CFLAGS += -msep-data
 TARGET_CXXFLAGS += -msep-data
 endif
 
-ifeq ($(BR2_ENABLE_SSP),y)
+ifeq ($(BR2_SSP_REGULAR),y)
+TARGET_CFLAGS += -fstack-protector
+TARGET_CXXFLAGS += -fstack-protector
+endif
+ifeq ($(BR2_SSP_STRONG),y)
+TARGET_CFLAGS += -fstack-protector-strong
+TARGET_CXXFLAGS += -fstack-protector-strong
+endif
+ifeq ($(BR2_SSP_ALL),y)
 TARGET_CFLAGS += -fstack-protector-all
 TARGET_CXXFLAGS += -fstack-protector-all
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 1a5281c..410bf35 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -6,6 +6,9 @@ config BR2_GCC_NEEDS_MPC
 config BR2_GCC_SUPPORTS_GRAPHITE
 	bool
 
+config BR2_TOOLCHAIN_HAS_SSP_STRONG
+	bool
+
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_4_8_ARC if BR2_arc
@@ -77,6 +80,7 @@ choice
 		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
+		select BR2_TOOLCHAIN_HAS_SSP_STRONG
 
 endchoice
 
-- 
2.3.3
