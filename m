From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 14 Mar 2019 10:40:18 +0100
Subject: [Buildroot] [PATCH v2 07/13] Makefile: allow top-level parallel
 build with BR2_PER_PACKAGE_DIRECTORIES=y
In-Reply-To: <20190314094024.1961-1-anaumann@ultratronik.de>
References: <20190314094024.1961-1-anaumann@ultratronik.de>
Message-ID: <20190314094024.1961-8-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

With per-package folder support, top-level parallel build becomes
safe, so we can enclose the .NOTPARALLEL statement in a
!BR2_PER_PACKAGE_DIRECTORIES condition.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 Makefile | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index 58282dc098..4bbc3e5be9 100644
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
2.21.0
