From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 23:19:30 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] uboot: fix build for
 older uboot source trees
Message-ID: <20180330213200.1EABB83EBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef2811e13d2c6a04164b55afdc344fb54937d33f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The change in commit bf733342324b414a1142b57781504111f81c97ea only works
for newer uboot source trees. Add a check that scripts/dtc/libfdt
directory exists before making this change.

[Peter: add comment explaining why]
Signed-off-by: Stefan Becker <chemobejk@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit f437bf547ca44849db4578c31707afdd96b85018)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 58dd906a27..b7032d5901 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -191,8 +191,12 @@ UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_LOCAL_PATCHES
 # This is equivalent to upstream commit
 # http://git.denx.de/?p=u-boot.git;a=commitdiff;h=e0d20dc1521e74b82dbd69be53a048847798a90a. It
 # fixes a build failure when libfdt-devel is installed system-wide.
+# This only works when scripts/dtc/libfdt exists (E.G. versions containing
+# http://git.denx.de/?p=u-boot.git;a=commitdiff;h=c0e032e0090d6541549b19cc47e06ccd1f302893)
 define UBOOT_FIXUP_LIBFDT_INCLUDE
-	$(SED) 's%-I$$(srctree)/lib/libfdt%-I$$(srctree)/scripts/dtc/libfdt%' $(@D)/tools/Makefile
+	if [ -d $(@D)/scripts/dtc/libfdt ]; then \
+		$(SED) 's%-I$$(srctree)/lib/libfdt%-I$$(srctree)/scripts/dtc/libfdt%' $(@D)/tools/Makefile; \
+	fi
 endef
 UBOOT_POST_PATCH_HOOKS += UBOOT_FIXUP_LIBFDT_INCLUDE
 
