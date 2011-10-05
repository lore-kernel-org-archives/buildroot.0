From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Oct 2011 16:14:26 +0200
Subject: [Buildroot] [git commit] gdb: misc cleanup
Message-ID: <20111005150454.4521F8DEC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37f0d1bb7b5a379161e647b730f5a57b814122bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only use 6.6 on bfin, remove 6.7.1, mark 6.8 + 7.0 as deprecated and
default to 7.3.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gdb/6.7.1/600-fix-compile-flag-mismatch.patch  |   31 --------------------
 toolchain/gdb/Config.in                            |   13 +++-----
 2 files changed, 5 insertions(+), 39 deletions(-)

diff --git a/toolchain/gdb/6.7.1/600-fix-compile-flag-mismatch.patch b/toolchain/gdb/6.7.1/600-fix-compile-flag-mismatch.patch
deleted file mode 100644
index 13b72bb..0000000
--- a/toolchain/gdb/6.7.1/600-fix-compile-flag-mismatch.patch
+++ /dev/null
@@ -1,31 +0,0 @@
---- a/gdb/gdbserver/configure
-+++ b/gdb/gdbserver/configure
-@@ -1239,7 +1239,7 @@
-       ac_cache_corrupted=: ;;
-     ,);;
-     *)
--      if test "x$ac_old_val" != "x$ac_new_val"; then
-+      if test "`echo x$ac_old_val`" != "`echo x$ac_new_val`"; then
- 	{ echo "$as_me:$LINENO: error: \`$ac_var' has changed since the previous run:" >&5
- echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
- 	{ echo "$as_me:$LINENO:   former value:  $ac_old_val" >&5
---- a/gdb/configure
-+++ b/gdb/configure
-@@ -272,7 +272,7 @@
- PACKAGE_BUGREPORT=
- 
- ac_unique_file="main.c"
--ac_subdirs_all="$ac_subdirs_all doc testsuite"
-+ac_subdirs_all="$ac_subdirs_all doc"
- # Factoring default headers for most tests.
- ac_includes_default="\
- #include <stdio.h>
-@@ -3077,7 +3077,7 @@
- 
- 
- 
--subdirs="$subdirs doc testsuite"
-+subdirs="$subdirs doc"
- 
- 
- # Provide defaults for some variables set by the per-host and per-target
diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 6bf7fd4..28279a3 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -26,20 +26,16 @@ config BR2_PACKAGE_GDB_HOST
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_6_8 if !BR2_avr32
+	default BR2_GDB_VERSION_6_6 if !BR2_bfin
 	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
+	default BR2_GDB_VERSION_7_3
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_GDB_SERVER || BR2_PACKAGE_GDB_HOST
 	help
 	  Select the version of gdb you wish to use.
 
 	config BR2_GDB_VERSION_6_6
 		bool "gdb 6.6"
-		depends on !BR2_avr32
-		depends on BR2_DEPRECATED || BR2_bfin
-
-	config BR2_GDB_VERSION_6_7_1
-		depends on !(BR2_avr32 || BR2_bfin)
-		bool "gdb 6.7.1"
+		depends on BR2_bfin
 
 	config BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
 		depends on BR2_avr32
@@ -48,10 +44,12 @@ choice
 	config BR2_GDB_VERSION_6_8
 		bool "gdb 6.8"
 		depends on !(BR2_avr32 || BR2_bfin)
+		depends on BR2_DEPRECATED
 
 	config BR2_GDB_VERSION_7_0_1
 		bool "gdb 7.0.1"
 		depends on !BR2_bfin
+		depends on BR2_DEPRECATED
 		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
 
 	config BR2_GDB_VERSION_7_1
@@ -69,7 +67,6 @@ endchoice
 config BR2_GDB_VERSION
 	string
 	default "6.6"      if BR2_GDB_VERSION_6_6
-	default "6.7.1"    if BR2_GDB_VERSION_6_7_1
 	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
 	default "6.8"      if BR2_GDB_VERSION_6_8
 	default "7.0.1"    if BR2_GDB_VERSION_7_0_1
