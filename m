From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Fri, 12 Jul 2013 10:39:50 +0200
Subject: [Buildroot] [PATCH] toolchain: Add BR2_TOOLCHAIN_HAS_THREADS_NATIVE
Message-ID: <1373618390-7548-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This can be used to check dependencies for packages that need NPTL;
furthermore it can be used to determine the number of stages required
for building the toolchain.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/uclibc/Config.in                   |    1 +
 toolchain/Config.in                        |    1 +
 toolchain/toolchain-common.in              |    3 +++
 toolchain/toolchain-crosstool-ng/Config.in |    1 +
 toolchain/toolchain-external/Config.in     |   11 +++++++++++
 5 files changed, 17 insertions(+)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index f309243..d810495 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -114,6 +114,7 @@ choice
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
 	        select BR2_TOOLCHAIN_HAS_THREADS
+	        select BR2_TOOLCHAIN_HAS_THREADS_NATIVE
 		depends on !BR2_ARM_OABI
 		depends on !BR2_x86_i386
 		depends on !BR2_avr32
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 53d2573..b66cdcb 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -9,6 +9,7 @@ config BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_ENABLE_LOCALE
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS_NATIVE
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 7c9b842..59bdad9 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -29,6 +29,9 @@ config BR2_TOOLCHAIN_HAS_THREADS
 config BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	bool
 
+config BR2_TOOLCHAIN_HAS_THREADS_NATIVE
+	bool
+
 config BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	bool
 
diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 7cfd8c2..d057178 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -128,6 +128,7 @@ choice
 		bool "Native POSIX Threading (NPTL)"
 		select BR2_TOOLCHAIN_HAS_THREADS
 		select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+		select BR2_TOOLCHAIN_HAS_THREADS_NATIVE
 endchoice
 
 endif # BR2_TOOLCHAIN_CTNG
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 130b705..71cbff1 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -899,6 +899,17 @@ config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG
 	  debugging support. If you don't know, leave the default
 	  value, Buildroot will tell you if it's correct or not.
 
+config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NATIVE
+	bool "Toolchain has NPTL support?"
+	depends on BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NATIVE
+	default y
+	help
+	  Select this option if your external toolchain has native
+	  POSIX thread library (NPTL) support. If you don't know,
+	  leave the default value, Buildroot will tell you if it's
+	  correct or not.
+
 endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
 config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
-- 
1.7.9.5
