From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 17:51:29 +0100
Subject: [Buildroot] [git commit] gdb: adjust behavior when thread debug is
	not available
Message-ID: <20121103165737.AC55C99AA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db09796532d1b7b09bae61d1b297261a4a51b7c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/Config.in |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 272e196..8acce1e 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -4,8 +4,14 @@ config BR2_PACKAGE_GDB
 	bool "Build gdb debugger for the Target"
 	select BR2_PACKAGE_NCURSES
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze
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
