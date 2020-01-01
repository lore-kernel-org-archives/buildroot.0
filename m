From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jan 2020 13:02:30 +0100
Subject: [Buildroot] [git commit] boot/uboot: cover more u-boot versions
 when fixing up libfdt include paths
Message-ID: <20200101120450.5F5B98EA3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35c040d1abc894a0f1eb9cb157087949223b4642
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The original UBOOT_FIXUP_LIBFDT_INCLUDE hook only works for u-boot versions
starting from v2017.11.

As older u-boot versions are still in common use today, e.g. in the
ci20_defconfig, extend the hook to cover a wider range of u-boot versions.

The main code change was proposed by Arnout Vandecappelle in [1].
Testing and comment changes were done by Thomas De Schampheleire.
Additional (build) testing done by Yann.

[1] http://lists.busybox.net/pipermail/buildroot/2019-May/251231.html

This was tested with the following defconfigs, that each excercise one
case:

    ----.--     No defconfig identified
    2010.06     'lib/libfdt/', used to be simply 'libfdt' before upstream commit 0de71d507157...
    2013.10     ci20_defconfig
    2014.04     'srctree' used to be called 'SRCTREE' before upstream commit 01286329b27b27ea...
    2017.05     olimex_a13_olinuxino_defconfig
    2017.11     scripts/dtc/libfdt only exists since upstream commit c0e032e0090d6541549b19cc...
    2018.01     mx6udoo_defconfig
    2018.03     core change is equivalent to upstream commit e0d20dc1521e74b82dbd69be53a04884...
    2019.10     nanopi_neo_defconfig

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
[yann.morin.1998 at free.fr: add the build-test results]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/uboot/uboot.mk | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 0ebda6588c..a4879bb8b2 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -207,15 +207,35 @@ define UBOOT_APPLY_LOCAL_PATCHES
 endef
 UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_LOCAL_PATCHES
 
-# This is equivalent to upstream commit
-# http://git.denx.de/?p=u-boot.git;a=commitdiff;h=e0d20dc1521e74b82dbd69be53a048847798a90a. It
-# fixes a build failure when libfdt-devel is installed system-wide.
-# This only works when scripts/dtc/libfdt exists (E.G. versions containing
-# http://git.denx.de/?p=u-boot.git;a=commitdiff;h=c0e032e0090d6541549b19cc47e06ccd1f302893)
+# Fixup inclusion of libfdt headers, which can fail in older u-boot versions
+# when libfdt-devel is installed system-wide.
+# The core change is equivalent to upstream commit
+# e0d20dc1521e74b82dbd69be53a048847798a90a (first in v2018.03). However, the fixup
+# is complicated by the fact that the underlying u-boot code changed multiple
+# times in history:
+# - The directory scripts/dtc/libfdt only exists since upstream commit
+#   c0e032e0090d6541549b19cc47e06ccd1f302893 (first in v2017.11). For earlier
+#   versions, create a dummy scripts/dtc/libfdt directory with symlinks for the
+#   fdt-related files. This allows to use the same -I<path> option for both
+#   cases.
+# - The variable 'srctree' used to be called 'SRCTREE' before upstream commit
+#   01286329b27b27eaeda045b469d41b1d9fce545a (first in v2014.04).
+# - The original location for libfdt, 'lib/libfdt/', used to be simply
+#   'libfdt' before upstream commit 0de71d507157c4bd4fddcd3a419140d2b986eed2
+#   (first in v2010.06). Make the 'lib' part optional in the substitution to
+#   handle this.
 define UBOOT_FIXUP_LIBFDT_INCLUDE
-	if [ -d $(@D)/scripts/dtc/libfdt ]; then \
-		$(SED) 's%-I$$(srctree)/lib/libfdt%-I$$(srctree)/scripts/dtc/libfdt%' $(@D)/tools/Makefile; \
+	$(Q)if [ ! -d $(@D)/scripts/dtc/libfdt ]; then \
+		mkdir -p $(@D)/scripts/dtc/libfdt; \
+		cd $(@D)/scripts/dtc/libfdt; \
+		ln -s ../../../include/fdt.h .; \
+		ln -s ../../../include/libfdt*.h .; \
+		ln -s ../../../lib/libfdt/libfdt_internal.h .; \
 	fi
+	$(Q)$(SED) \
+		's%-I\ *\$$(srctree)/lib/libfdt%-I$$(srctree)/scripts/dtc/libfdt%; \
+		s%-I\ *\$$(SRCTREE)\(/lib\)\?/libfdt%-I$$(SRCTREE)/scripts/dtc/libfdt%' \
+		$(@D)/tools/Makefile
 endef
 UBOOT_POST_PATCH_HOOKS += UBOOT_FIXUP_LIBFDT_INCLUDE
 
