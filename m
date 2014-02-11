From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 11 Feb 2014 16:25:22 +0200
Subject: [Buildroot] [PATCH 3/3] gcc: xtensa: fix __builtin_frame_address
	use with shared libgcc
In-Reply-To: <cover.1392128329.git.baruch@tkos.co.il>
References: <cover.1392128329.git.baruch@tkos.co.il>
Message-ID: <55f56cc35e7fbbd83488b13936bcdcdde519119c.1392128329.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 .../4.7.3/850-xtensa-libgcc-linker-script.patch    | 29 ++++++++++++++++++++++
 .../4.8.2/850-xtensa-libgcc-linker-script.patch    | 29 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 package/gcc/4.7.3/850-xtensa-libgcc-linker-script.patch
 create mode 100644 package/gcc/4.8.2/850-xtensa-libgcc-linker-script.patch

diff --git a/package/gcc/4.7.3/850-xtensa-libgcc-linker-script.patch b/package/gcc/4.7.3/850-xtensa-libgcc-linker-script.patch
new file mode 100644
index 000000000000..6ffa897863fd
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
index 000000000000..378445da3904
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
-- 
1.8.5.3
