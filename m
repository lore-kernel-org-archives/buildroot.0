From: Markus Mayer <code@mmayer.net>
Date: Tue,  4 Jul 2017 16:54:44 -0700
Subject: [Buildroot] [PATCH 1/2] Makefile: don't rely on linux-tools being
	sorted alphabetically
In-Reply-To: <20170704235445.35255-1-code@mmayer.net>
References: <20170704235445.35255-1-code@mmayer.net>
Message-ID: <20170704235445.35255-2-code@mmayer.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markus Mayer <mmayer@broadcom.com>

The Linux tools master makefile (linux-tools.mk) must be included after
all Linux tools sub-makefiles (linux-tool-*.mk). This is currently
ensured by sorting all package makefiles alphabetically.

In preparation for adding linux-tool-tmon, we cannot keep relying on
this mechanism. In the C locale, linux-tool-tmon.mk will be sorted
behind linux-tools.mk, which would break the build.

Therefore, we ensure that linux-tools.mk always comes after
linux-tool-*.mk by explicitly including it after the other package
makefiles.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 Makefile                           | 6 +++++-
 package/linux-tools/linux-tools.mk | 8 +++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index b37171fcf..b5596444d 100644
--- a/Makefile
+++ b/Makefile
@@ -495,7 +495,11 @@ ifneq ($(PACKAGE_OVERRIDE_FILE),)
 -include $(PACKAGE_OVERRIDE_FILE)
 endif
 
-include $(sort $(wildcard package/*/*.mk))
+# We need to insure that linux-tools.mk is included after all linux-tool-*.mk
+# makefiles, and we can't rely on alphabetical sort order for this.
+LINUX_TOOLS_MK = package/linux-tools/linux-tools.mk
+include $(sort $(filter-out $(LINUX_TOOLS_MK),$(wildcard package/*/*.mk)))
+include $(LINUX_TOOLS_MK)
 
 include boot/common.mk
 include linux/linux.mk
diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
index 7fa8d194c..3d7a0bd92 100644
--- a/package/linux-tools/linux-tools.mk
+++ b/package/linux-tools/linux-tools.mk
@@ -14,11 +14,9 @@
 # to guarantee that each tool has a chance to register itself before we build
 # the list of build and install hooks, below.
 #
-# This is currently guaranteed by the naming of each file:
-# - they get included by the top-level Makefile, with $(sort $(wildcard ...))
-# - make's $(sort) function will aways sort in the C locale
-# - the files names correctly sort out in the C locale so that each tool's
-#   .mk file is included before this one.
+# This is ensured by the main buildroot makefile, which explicitly includes
+# linux-tools.mk after all linux-tool*.mk makefiles. Look for LINUX_TOOLS_MK
+# in the top-level makefile to see where this is happening.
 
 # We only need the kernel to be extracted, not actually built
 LINUX_TOOLS_PATCH_DEPENDENCIES = linux
-- 
2.13.0
