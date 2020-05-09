From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 16:53:06 +0200
Subject: [Buildroot] [git commit] package/gcc: remove powerpc conditional
 patching logic
Message-ID: <20200509144243.DBA0D911B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c82f3f63563c4d4d7e034d0e9e4ceb766d92322
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Back in commit [1], a patch fixing an issue a PowerPC issue in gcc was
added in gcc 4.3.3. It was present until gcc 4.9, which itself was
removed in [2]. The patch was dropped starting gcc 5.1 [3] but it's
know to be useful for gcc 4.7.3 [4]. However, even though we no longer
support building any of those older gcc versions, the conditional
patching logic in gcc.mk is still there.

We used to have a patch directory (package/gcc/$(GCC_VERSION)) for
every gcc version available in Buildroot, the apply-patches.sh script
doesn't error out even if
1000-powerpc-link-with-math-lib.patch.conditional is missing.

But with gcc 10, we don't need (for the moment) to apply any patch, so
the patch directory doesn't exist. apply-patches.sh breaks the build
since the patch directory is missing:

  Aborting.  'package/gcc/10.1.0' is not a directory.

Since we removed gcc 4.9 last year [2], we can safely remove this code.

Tested using qemu_ppc_virtex_ml507_defconfig.

[1] bb1f42e4426c432af60fc80da45c6daf7e31c1a0
[2] baf177502214a67619d9d0d6d0a780458e4d652d
[3] 4deb2d93c5ab317b6addf4e1e132571ba8dac031
[4] 197006a41c1a0450bf6350d5742e186b5b0c69de

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 50f2a3fcb7..af25d268a7 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -32,14 +32,6 @@ endef
 # Apply patches
 #
 
-ifeq ($(ARCH),powerpc)
-ifneq ($(BR2_SOFT_FLOAT),)
-define HOST_GCC_APPLY_POWERPC_PATCH
-	$(APPLY_PATCHES) $(@D) package/gcc/$(GCC_VERSION) 1000-powerpc-link-with-math-lib.patch.conditional
-endef
-endif
-endif
-
 # gcc is a special package, not named gcc, but gcc-initial and
 # gcc-final, but patches are nonetheless stored in package/gcc in the
 # tree, and potentially in BR2_GLOBAL_PATCH_DIR directories as well.
