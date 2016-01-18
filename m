From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 23:22:14 +0100
Subject: [Buildroot] [git commit] libffi: fix the build for MIPS soft-float
	with recent compilers
Message-ID: <20160118222342.9384A82757@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=190aa2b98f8f88563beb48b4b03269e7acbcfe77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recent MIPS compilers have an stricter agreement between the compiler
and the assembler on the ABI. The compiler now passes -msoft-float to
the assembler where it previously did not.

libffi uses MIPS hard-float instructions so when we try to build it for
soft-float using a recent compiler it fails because of the explained
above. This package should be fixed in order to add support for
soft-float.

In the meantime we can add a little hack in order to be able to build it
for soft-float. Basically we add ".set hardfloat" so the assembler will
not disable the hard-float instructions. The build will of course
include some hard-float bits which shouldn't exist in a soft-float
build, and that may cause runtime problems. But that's what we already
had before and we had lived with it.

We choose to apply this temporary fix because it only affects MIPS
soft-float builds. Otherwise we would need to disable libffi and
recursively all the packages depending on it (python, libglib2...) for
MIPS soft-float, which would be a bit overkill.

Fixes:

  http://autobuild.buildroot.net/results/6b0607b7cb0ac5525c2e47e819301f38bd2d6b30/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nable-hardfloat-in-the-MIPS-assembly-code.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/libffi/0003-libffi-enable-hardfloat-in-the-MIPS-assembly-code.patch b/package/libffi/0003-libffi-enable-hardfloat-in-the-MIPS-assembly-code.patch
new file mode 100644
index 0000000..776990d
--- /dev/null
+++ b/package/libffi/0003-libffi-enable-hardfloat-in-the-MIPS-assembly-code.patch
@@ -0,0 +1,41 @@
+From 48bc37fabbc685b1e3293055bd33ca66c619305e Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Wed, 13 Jan 2016 14:49:59 +0000
+Subject: [PATCH] libffi: enable hardfloat in the MIPS assembly code
+
+This way it will be possible to build it for soft-float. This is only a
+temporary fix. The package needs to be fixed properly.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ src/mips/n32.S | 1 +
+ src/mips/o32.S | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/mips/n32.S b/src/mips/n32.S
+index c6985d3..dc842d5 100644
+--- a/src/mips/n32.S
++++ b/src/mips/n32.S
+@@ -44,6 +44,7 @@
+ 	.abicalls
+ #endif
+ 	.set mips4
++	.set hardfloat
+ 	.text
+ 	.align	2
+ 	.globl	ffi_call_N32
+diff --git a/src/mips/o32.S b/src/mips/o32.S
+index eb27981..b653daf 100644
+--- a/src/mips/o32.S
++++ b/src/mips/o32.S
+@@ -42,6 +42,7 @@
+ #define RA_OFF		(SIZEOF_FRAME - 1 * FFI_SIZEOF_ARG)
+ 
+ 	.abicalls
++	.set hardfloat
+ 	.text
+ 	.align	2
+ 	.globl	ffi_call_O32
+-- 
+2.4.10
+
