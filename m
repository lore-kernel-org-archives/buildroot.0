From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 11:43:31 +0100
Subject: [Buildroot] [PATCH v7 4/8] Makefile: allow top-level parallel build
 with BR2_PER_PACKAGE_DIRECTORIES=y
In-Reply-To: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181228104335.22379-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With per-package folder support, top-level parallel build becomes
safe, so we can enclose the .NOTPARALLEL statement in a
!BR2_PER_PACKAGE_DIRECTORIES condition.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index e01ec4c963..74c0757fd8 100644
--- a/Makefile
+++ b/Makefile
@@ -228,21 +228,12 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
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
2.20.1
