From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Fri, 2 Oct 2015 11:49:14 +0000
Subject: [Buildroot] [PATCH v5 2/2] Patch to assembler to strip LOCK prefix.
Message-ID: <1443786554.3328.21.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The lock prefix is usually stripped by passing to the compiler
-Wa,momit-lock-prefix=yes via EXTRA_CFLAGS. However I couldn't find
a way to get buildroot to pass CFLAGS/EXTRA_CFLAGS around.

I tried using BR2_TARGET_OPTIMIZATION, and creating a new processor type
but the flag kept stripping it out. I found the most reliable way to 
achieve the behavior was to make stripping the LOCK prefix the assembler's 
default behavior, hence the patch

Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
---
 .../galileo/patches/binutils/2.25/default-lock-prefix.patch   | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 board/intel/galileo/patches/binutils/2.25/default-lock-prefix.patch

diff --git a/board/intel/galileo/patches/binutils/2.25/default-lock-prefix.patch b/board/intel/galileo/patches/binutils/2.25/default-lock-prefix.patch
new file mode 100644
index 0000000..7814ae4
--- /dev/null
+++ b/board/intel/galileo/patches/binutils/2.25/default-lock-prefix.patch
@@ -0,0 +1,11 @@
+--- a/gas/config/tc-i386.orig	2015-07-24 15:54:51.359080778 +0100
++++ b/gas/config/tc-i386.c	2015-07-24 15:54:59.692192247 +0100
+@@ -545,7 +545,7 @@ static int allow_index_reg = 0;
+ 
+ /* 1 if the assembler should ignore LOCK prefix, even if it was
+    specified explicitly.  */
+-static int omit_lock_prefix = 0;
++static int omit_lock_prefix = 1;
+ 
+ static enum check_kind
+   {
-- 
2.1.0
