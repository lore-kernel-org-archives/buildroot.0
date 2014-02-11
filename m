From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2014 19:33:19 +0100
Subject: [Buildroot] [git commit] gcc: xtensa: fix __builtin_frame_address
	use with shared libgcc
Message-ID: <20140211185414.8353E9C989@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd1c4f65b1f377c79a642f1f351e0b3e1f12a2c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The xtensa port uses __xtensa_libgcc_window_spill in libgcc to implement
__builtin_frame_address. This symbol is local/hidden in libgcc. This is not a
problem when linking against static libgcc. But g++ defaults to
-shared-libgcc, thus breaking link against C++ shared libraries that are using
__builtin_frame_address as follows:

ld: test: hidden symbol `__xtensa_libgcc_window_spill' in .../libgcc.a(lib2funcs.o) is referenced by DSO

Add upstream patches that make libgcc_s.so a linker script that links in
unresolved symbols from the static libgcc, similar to the ARM and PowerPC
ports.

Fixes:
http://autobuild.buildroot.net/results/e2d/e2d1a763fa86b8575e2e48e6d73c018175f43e7c/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../4.7.3/850-xtensa-libgcc-linker-script.patch    |   29 ++++++++++++++++++++
 .../4.8.2/850-xtensa-libgcc-linker-script.patch    |   29 ++++++++++++++++++++
 2 files changed, 58 insertions(+), 0 deletions(-)

diff --git a/package/gcc/4.7.3/850-xtensa-libgcc-linker-script.patch b/package/gcc/4.7.3/850-xtensa-libgcc-linker-script.patch
new file mode 100644
index 0000000..6ffa897
--- /dev/null
+++ b/package/gcc/4.7.3/850-xtensa-libgcc-linker-script.patch
@@ -0,0 +1,29 @@
+From a89db366b98fffc61b20074e658c7285fb302776 Mon Sep 17 00:00:00 2001
+Message-Id: <a89db366b98fffc61b20074e658c7285fb302776.1392126646.git.baruch@tkos.co.il>
+From: sterling <sterling@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Tue, 21 Jan 2014 19:29:23 +0000
+Subject: [PATCH] 2014-01-21  Baruch Siach <barch@tkos.co.il>
+
+	* config.host (tmake_file): add t-slibgcc-libgcc for xtensa*-*-linux*.
+
+Patch status: upstream (4.7 branch commit r206898)
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+diff --git a/libgcc/config.host b/libgcc/config.host
+index e18e1d25021d..a6f7c450d702 100644
+--- a/libgcc/config.host
++++ b/libgcc/config.host
+@@ -1127,7 +1127,7 @@ xtensa*-*-elf*)
+ 	extra_parts="$extra_parts crti.o crtn.o"
+ 	;;
+ xtensa*-*-linux*)
+-	tmake_file="$tmake_file xtensa/t-xtensa xtensa/t-linux"
++	tmake_file="$tmake_file xtensa/t-xtensa xtensa/t-linux t-slibgcc-libgcc"
+ 	md_unwind_header=xtensa/linux-unwind.h
+ 	;;
+ am33_2.0-*-linux*)
+-- 
+1.8.5.3
+
diff --git a/package/gcc/4.8.2/850-xtensa-libgcc-linker-script.patch b/package/gcc/4.8.2/850-xtensa-libgcc-linker-script.patch
new file mode 100644
index 0000000..378445d
--- /dev/null
+++ b/package/gcc/4.8.2/850-xtensa-libgcc-linker-script.patch
@@ -0,0 +1,29 @@
+From 7c722c07a0781e4279f643650bc528422c80ce5e Mon Sep 17 00:00:00 2001
+Message-Id: <7c722c07a0781e4279f643650bc528422c80ce5e.1392126765.git.baruch@tkos.co.il>
+From: sterling <sterling@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Tue, 21 Jan 2014 19:50:02 +0000
+Subject: [PATCH] 2014-01-21  Baruch Siach <barch@tkos.co.il>
+
+	* config.host (tmake_file): add t-slibgcc-libgcc for xtensa*-*-linux*.
+
+Patch status: upstream (4.8 branch commit r206905)
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+diff --git a/libgcc/config.host b/libgcc/config.host
+index ee16d60e34a6..302aa6135211 100644
+--- a/libgcc/config.host
++++ b/libgcc/config.host
+@@ -1102,7 +1102,7 @@ xtensa*-*-elf*)
+ 	extra_parts="$extra_parts crti.o crtn.o"
+ 	;;
+ xtensa*-*-linux*)
+-	tmake_file="$tmake_file xtensa/t-xtensa xtensa/t-linux"
++	tmake_file="$tmake_file xtensa/t-xtensa xtensa/t-linux t-slibgcc-libgcc"
+ 	md_unwind_header=xtensa/linux-unwind.h
+ 	;;
+ am33_2.0-*-linux*)
+-- 
+1.8.5.3
+
