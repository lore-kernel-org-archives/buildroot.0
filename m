From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Aug 2016 22:21:11 +0200
Subject: [Buildroot] [git commit] openblas: fix build with old binutils
	versions
Message-ID: <20160822204501.63B3D82160@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=887a1dc3470700db25588affec792d1f5511483a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Older toolchains that use binutils <= 2.23.2 are affected by binutils
bug #14887 (https://sourceware.org/bugzilla/show_bug.cgi?id=14887),
where:

	someinstruction [ foo, something ]

is not accepted, due to the whitespace after [ and before ], causing the
following build failures for OpenBLAS:

  ARM register expected -- `pld [ r1,#512 ]'

Since we don't have any mechanism to add dependencies on binutils
versions, we work around this problem by patching the code to remove the
problematic whitespaces. As there are many many instances of this in the
ARM assembly code of OpenBLAS, we use a sed expression to make this
modification rather than a patch.

Fixes:

  http://autobuild.buildroot.net/results/43e50b480b4aea0fdec745d7875c85377c114cac/

[Peter: use single quotes in sed invocation]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openblas/openblas.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index baeef05..9583e0e 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -38,6 +38,19 @@ else ifeq ($(BR2_SHARED_LIBS),y)
 OPENBLAS_MAKE_OPTS += NO_STATIC=1
 endif
 
+# binutils version <= 2.23.2 has a bug
+# (https://sourceware.org/bugzilla/show_bug.cgi?id=14887) where
+# whitespaces in ARM register specifications such as [ r1, #12 ] or [
+# r2 ] cause the assembler to reject the code. Since there are
+# numerous instances of such cases in the code, we use sed rather than
+# a patch. We simply replace [ foobar ] by [foobar] to work around the
+# problem.
+define OPENBLAS_FIXUP_ARM_ASSEMBLY
+	$(SED) 's%\[\s*%\[%;s%\s*\]%\]%' $(@D)/kernel/arm/*.S
+endef
+
+OPENBLAS_POST_PATCH_HOOKS += OPENBLAS_FIXUP_ARM_ASSEMBLY
+
 define OPENBLAS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(OPENBLAS_MAKE_OPTS) \
 		-C $(@D)
