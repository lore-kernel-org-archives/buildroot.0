From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  5 Nov 2019 17:46:41 +0100
Subject: [Buildroot] [PATCH next v8 2/6] Makefile: allow top-level parallel
 build with BR2_PER_PACKAGE_DIRECTORIES=y
In-Reply-To: <20191105164646.23820-1-thomas.petazzoni@bootlin.com>
References: <20191105164646.23820-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191105164646.23820-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With per-package folder support, top-level parallel build becomes
safe, so we can enclose the .NOTPARALLEL statement in a
!BR2_PER_PACKAGE_DIRECTORIES condition.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index 823c219c86..c117da7e8c 100644
--- a/Makefile
+++ b/Makefile
@@ -227,21 +227,12 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(BR2_CONFIG)
 endif
 
-# Parallel execution of this Makefile is disabled because it changes
-# the packages building order, that can be a problem for two reasons:
-# - If a package has an unspecified optional dependency and that
-#   dependency is present when the package is built, it is used,
-#   otherwise it isn't (but compilation happily proceeds) so the end
-#   result will differ if the order is swapped due to parallel
-#   building.
-# - Also changing the building order can be a problem if two packages
-#   manipulate the same file in the target directory.
-#
-# Taking into account the above considerations, if you still want to execute
-# this top-level Makefile in parallel comment the ".NOTPARALLEL" line and
-# use the -j<jobs> option when building, e.g:
-#      make -j$((`getconf _NPROCESSORS_ONLN`+1))
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),)
+# Disable top-level parallel build if per-package directories is not
+# used. Indeed, per-package directories is necessary to guarantee
+# determinism and reproducibility with top-level parallel build.
 .NOTPARALLEL:
+endif
 
 # timezone and locale may affect build output
 ifeq ($(BR2_REPRODUCIBLE),y)
-- 
2.21.0
