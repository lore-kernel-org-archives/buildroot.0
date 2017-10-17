From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 10:50:16 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] musl: add patch to fix
	build on ARMv4 with new binutils
Message-ID: <20171017090326.B8ACC7FD24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=990bf068b7d4ca86247ce7e257925d387ae6b3f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

New binutils (since 2.27.51) cannot build musl-1.1.16 due to breakage in ARMv4
atomics asm.  This patch from upstream musl repository is needed until
musl-1.1.17 is released:
https://git.musl-libc.org/cgit/musl/commit/?id=b261a24256792177a5f0531dbb25cc6267220ca5

Signed-off-by: Timothy Lee <timothy.ty.lee@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 27cf2d3baf879f7314f12787982d8f4a5b4218cf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-arm-atomics-asm-with-new-binutils.patch   | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/musl/0002-arm-atomics-asm-with-new-binutils.patch b/package/musl/0002-arm-atomics-asm-with-new-binutils.patch
new file mode 100644
index 0000000..3790889
--- /dev/null
+++ b/package/musl/0002-arm-atomics-asm-with-new-binutils.patch
@@ -0,0 +1,43 @@
+From b261a24256792177a5f0531dbb25cc6267220ca5 Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Wed, 15 Feb 2017 17:05:50 -0500
+Subject: fix build regression in arm atomics asm with new binutils
+
+binutils commit bada43421274615d0d5f629a61a60b7daa71bc15 tightened
+immediate fixup handling in gas in such a way that the final .arch of
+an object file must be compatible with the fixups used when the
+instruction was assembled; this in turn broke assembling of atomics.s,
+at least in thumb mode.
+
+it's not clear whether this should be considered a bug in gas, but
+.object_arch is preferable anyway for our purpose here of controlling
+the ISA level tag on the object file being produced, and it's the
+intended directive for use in object files with runtime code
+selection. research by Szabolcs Nagy confirmed that .object_arch is
+supported in all relevant versions of binutils and clang's integrated
+assembler.
+
+patch by Reiner Herrmann.
+
+Signed-off-by: Timothy Lee <timothy.ty.lee@gmail.com>
+[Backport from upstream https://git.musl-libc.org/cgit/musl/commit/?id=b261a24256792177a5f0531dbb25cc6267220ca5.]
+---
+ src/thread/arm/atomics.s | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/thread/arm/atomics.s b/src/thread/arm/atomics.s
+index 202faa4..101ad39 100644
+--- a/src/thread/arm/atomics.s
++++ b/src/thread/arm/atomics.s
+@@ -84,7 +84,7 @@ __a_gettp_cp15:
+ 	bx lr
+ 
+ /* Tag this file with minimum ISA level so as not to affect linking. */
+-.arch armv4t
++.object_arch armv4t
+ .eabi_attribute 6,2
+ 
+ .data
+-- 
+cgit v0.11.2
+
