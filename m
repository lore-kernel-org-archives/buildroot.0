From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Jun 2012 18:39:16 +0200
Subject: [Buildroot] [PATCH] gdb: adjust behavior when thread debug is not
	available
Message-ID: <1338655156-4133-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When an external toolchain without thread debug is used, the gdb
package can be selected, but no version can be choosen, since none
match any of the requirements. This leads Buildroot to try to build
gdb for the target without a version being defined, as in the
following build log:

 http://autobuild.buildroot.org/results/84e8fd2df0cc22448052a572c2e9a6e03dd137eb/build-end.log

To fix this, we adjust the dependencies of the BR2_PACKAGE_GDB option
so that the package as a whole is not selectable when the required
conditions are not met. Basically, we have the choice of:

 * Having a toolchain that supports thread debugging, which is needed
   for gdb >= 7.x

 * Having BR2_DEPRECATED enabled, which allows gdb 6.8 to be selected,
   which doesn't require thread debugging

 * Using bfin, since this architectures has a special old gdb version

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gdb/Config.in |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index fd6956b..7e4539d 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -4,8 +4,14 @@ config BR2_PACKAGE_GDB
 	bool "Build gdb debugger for the Target"
 	select BR2_PACKAGE_NCURSES
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32
+	# The newest versions of gdb require thread debugging in the
+	# toolchain. The only cases for which this is not needed is if
+	# we use gdb 6.8 (marked deprecated)
+	depends on \
+		BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED || \
+		BR2_DEPRECATED || \
+		BR2_bfin
 	help
 	    Build the full gdb debugger to run on the target.
 
@@ -90,9 +96,8 @@ choice
 
 endchoice
 
-comment "gdb 7.x support needs pthread debug support in toolchain"
-	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_GDB_SERVER || BR2_PACKAGE_GDB_HOST
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
+comment "gdb support needs pthread debug support in toolchain"
+	depends on !BR2_DEPRECATED && !BR2_bfin && !BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 
 config BR2_GDB_VERSION
 	string
-- 
1.7.9.5
