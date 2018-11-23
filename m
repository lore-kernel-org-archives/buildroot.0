From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 15:58:09 +0100
Subject: [Buildroot] [PATCH next v6 04/10] Makefile: move .NOTPARALLEL
 statement after including .config file
In-Reply-To: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181123145815.13008-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In a follow-up commit, we will make the .NOTPARALLEL statement
conditional on a Config.in option, so we need to move it further down.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/Makefile b/Makefile
index e675ac26aa..24c803872d 100644
--- a/Makefile
+++ b/Makefile
@@ -105,22 +105,6 @@ ifneq ($(firstword $(sort $(RUNNING_MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MIN_MA
 $(error You have make '$(RUNNING_MAKE_VERSION)' installed. GNU make >= $(MIN_MAKE_VERSION) is required)
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
-.NOTPARALLEL:
-
 # absolute path
 TOPDIR := $(CURDIR)
 CONFIG_CONFIG_IN = Config.in
@@ -246,6 +230,22 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(BR2_CONFIG)
 endif
 
+# Parallel execution of this Makefile is disabled because it changes
+# the packages building order, that can be a problem for two reasons:
+# - If a package has an unspecified optional dependency and that
+#   dependency is present when the package is built, it is used,
+#   otherwise it isn't (but compilation happily proceeds) so the end
+#   result will differ if the order is swapped due to parallel
+#   building.
+# - Also changing the building order can be a problem if two packages
+#   manipulate the same file in the target directory.
+#
+# Taking into account the above considerations, if you still want to execute
+# this top-level Makefile in parallel comment the ".NOTPARALLEL" line and
+# use the -j<jobs> option when building, e.g:
+#      make -j$((`getconf _NPROCESSORS_ONLN`+1))
+.NOTPARALLEL:
+
 # timezone and locale may affect build output
 ifeq ($(BR2_REPRODUCIBLE),y)
 export TZ = UTC
-- 
2.19.1
