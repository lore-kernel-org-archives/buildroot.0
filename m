From: Markus Mayer <mmayer@broadcom.com>
Date: Tue, 18 Jul 2017 11:11:37 -0700
Subject: [Buildroot] [PATCH] package/linux-tools: change method for
	including linux-tool sub-makefiles
Message-ID: <20170718181137.23347-1-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make inclusion ordering of all linux-tool-*.mk sub-makefiles explicit
instead of relying on alphabetical sort order. This is done by
renaming the Linux tools sub-makefiles to the format linux-tool-*.mk.in.
This causes the top-level Makefile to ignore the Linux tools
sub-makefiles.

Until now, the main Makefile included all linux-tool-*.mk files, as
well as linux-tools.mk, and it relied on alphabetical sorting to
include them in the proper order (linux-tool-*.mk before
linux-tools.mk).

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---

This patch is the result of the discussion that can be found at
http://lists.busybox.net/pipermail/buildroot/2017-July/thread.html#196876

 docs/manual/adding-packages-linux-kernel-spec-infra.txt  |  4 ++--
 ...{linux-tool-cpupower.mk => linux-tool-cpupower.mk.in} |  0
 .../{linux-tool-gpio.mk => linux-tool-gpio.mk.in}        |  0
 .../{linux-tool-iio.mk => linux-tool-iio.mk.in}          |  0
 .../{linux-tool-perf.mk => linux-tool-perf.mk.in}        |  0
 ...inux-tool-selftests.mk => linux-tool-selftests.mk.in} |  0
 package/linux-tools/linux-tools.mk                       | 16 +++++++---------
 7 files changed, 9 insertions(+), 11 deletions(-)
 rename package/linux-tools/{linux-tool-cpupower.mk => linux-tool-cpupower.mk.in} (100%)
 rename package/linux-tools/{linux-tool-gpio.mk => linux-tool-gpio.mk.in} (100%)
 rename package/linux-tools/{linux-tool-iio.mk => linux-tool-iio.mk.in} (100%)
 rename package/linux-tools/{linux-tool-perf.mk => linux-tool-perf.mk.in} (100%)
 rename package/linux-tools/{linux-tool-selftests.mk => linux-tool-selftests.mk.in} (100%)

diff --git a/docs/manual/adding-packages-linux-kernel-spec-infra.txt b/docs/manual/adding-packages-linux-kernel-spec-infra.txt
index 6deb6d4..b948e20 100644
--- a/docs/manual/adding-packages-linux-kernel-spec-infra.txt
+++ b/docs/manual/adding-packages-linux-kernel-spec-infra.txt
@@ -40,8 +40,8 @@ Unlike other packages, the +linux-tools+ package options appear in the
 +linux+ kernel menu, under the `Linux Kernel Tools` sub-menu, not under
 the `Target packages` main menu.
 
-Then for each linux tool, add a new +.mk+ file named
-+package/linux-tools/linux-tool-foo.mk+. It would basically look like:
+Then for each linux tool, add a new +.mk.in+ file named
++package/linux-tools/linux-tool-foo.mk.in+. It would basically look like:
 
 ------------------------------
 01: ################################################################################
diff --git a/package/linux-tools/linux-tool-cpupower.mk b/package/linux-tools/linux-tool-cpupower.mk.in
similarity index 100%
rename from package/linux-tools/linux-tool-cpupower.mk
rename to package/linux-tools/linux-tool-cpupower.mk.in
diff --git a/package/linux-tools/linux-tool-gpio.mk b/package/linux-tools/linux-tool-gpio.mk.in
similarity index 100%
rename from package/linux-tools/linux-tool-gpio.mk
rename to package/linux-tools/linux-tool-gpio.mk.in
diff --git a/package/linux-tools/linux-tool-iio.mk b/package/linux-tools/linux-tool-iio.mk.in
similarity index 100%
rename from package/linux-tools/linux-tool-iio.mk
rename to package/linux-tools/linux-tool-iio.mk.in
diff --git a/package/linux-tools/linux-tool-perf.mk b/package/linux-tools/linux-tool-perf.mk.in
similarity index 100%
rename from package/linux-tools/linux-tool-perf.mk
rename to package/linux-tools/linux-tool-perf.mk.in
diff --git a/package/linux-tools/linux-tool-selftests.mk b/package/linux-tools/linux-tool-selftests.mk.in
similarity index 100%
rename from package/linux-tools/linux-tool-selftests.mk
rename to package/linux-tools/linux-tool-selftests.mk.in
diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
index 7fa8d19..2827ade 100644
--- a/package/linux-tools/linux-tools.mk
+++ b/package/linux-tools/linux-tools.mk
@@ -10,15 +10,13 @@
 #
 # So, all tools refer to $(LINUX_DIR) instead of $(@D).
 
-# Note: we need individual tools .mk files to be included *before* this one
-# to guarantee that each tool has a chance to register itself before we build
-# the list of build and install hooks, below.
-#
-# This is currently guaranteed by the naming of each file:
-# - they get included by the top-level Makefile, with $(sort $(wildcard ...))
-# - make's $(sort) function will aways sort in the C locale
-# - the files names correctly sort out in the C locale so that each tool's
-#   .mk file is included before this one.
+# Note: we need individual tools makefiles to be included *before* we build
+# the list of build and install hooks below to guarantee that each tool has
+# a chance to register itself. Therefore, the makefiles are named
+# linux-tool-*.mk.in, so they won't be picked up by the top-level Makefile,
+# but can be included here, guaranteeing proper ordering.
+
+include $(sort $(wildcard package/linux-tools/*.mk.in))
 
 # We only need the kernel to be extracted, not actually built
 LINUX_TOOLS_PATCH_DEPENDENCIES = linux
-- 
2.7.4
