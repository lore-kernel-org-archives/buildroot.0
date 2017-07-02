From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Jul 2017 12:30:30 +0200
Subject: [Buildroot] [PATCH] core: postpone evaluation on decompressor
	dependencies
Message-ID: <20170702103030.2210-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we build any extractor dependency as soone as the host
utility is missing, even when such utility is not needed.

That is expecially the case for host-lzip, which is lacking except in
the most recent distributions, and thus is always built, which is a bit
of a shame since only very few packages need it.

To fix that, we change the host dependecies check to set a variable
named after the extension they support, to the name of the host package
that provides the necessary decompressor, if not installed on the host.

Then, we introduce a new variable, UNCOMP_TOOLS_DEPENDENCIES, to which
packages, when they are enabled, append their decompressors dependencies,
which they get from the variable set above, to form the list of host
packages that provides a decompressor.

Finally, we add this list of host packages as a (Makefile) dependency
of our 'dependencies' rule, but very late in the Makefile, after all
packages (even from a br2-external tree) have been parsed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                                 | 4 ++++
 package/pkg-generic.mk                   | 1 +
 support/dependencies/check-host-lzip.mk  | 2 +-
 support/dependencies/check-host-xzcat.mk | 3 ++-
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 811158295a..6894696ef1 100644
--- a/Makefile
+++ b/Makefile
@@ -511,6 +511,10 @@ include $(BR2_EXTERNAL_FILE)
 # Nothing to include if no BR2_EXTERNAL tree in use
 include $(BR2_EXTERNAL_MKS)
 
+# Apply final core dependencies on uncompressor tools.
+# This must be done after we have parsed all the packages.
+dependencies: $(UNCOMP_TOOLS_DEPENDENCIES)
+
 # Now we are sure we have all the packages scanned and defined. We now
 # check for each package in the list of enabled packages, that all its
 # dependencies are indeed enabled.
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f474704980..5745a9cfcf 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -942,6 +942,7 @@ DL_TOOLS_DEPENDENCIES += cvs
 endif # SITE_METHOD
 
 DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
+UNCOMP_TOOLS_DEPENDENCIES += $$(UNCOMP_TOOL_DEPENDENCY$$(suffix $$($(2)_SOURCE)))
 
 # Ensure all virtual targets are PHONY. Listed alphabetically.
 .PHONY:	$(1) \
diff --git a/support/dependencies/check-host-lzip.mk b/support/dependencies/check-host-lzip.mk
index 6acfdc6dfa..fc0ec07cec 100644
--- a/support/dependencies/check-host-lzip.mk
+++ b/support/dependencies/check-host-lzip.mk
@@ -1,5 +1,5 @@
 ifeq (,$(call suitable-host-package,lzip,$(LZCAT)))
-DEPENDENCIES_HOST_PREREQ += host-lzip
+UNCOMP_TOOL_DEPENDENCY.lz = host-lzip
 EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .lz
 LZCAT = $(HOST_DIR)/usr/bin/lzip -d -c
 endif
diff --git a/support/dependencies/check-host-xzcat.mk b/support/dependencies/check-host-xzcat.mk
index c6d9eebe4d..544d2c7aa5 100644
--- a/support/dependencies/check-host-xzcat.mk
+++ b/support/dependencies/check-host-xzcat.mk
@@ -2,7 +2,8 @@
 # If it is not present, build our own host-xzcat
 
 ifeq (,$(call suitable-host-package,xzcat,$(XZCAT)))
-DEPENDENCIES_HOST_PREREQ += host-xz
+UNCOMP_TOOL_DEPENDENCY.xz = host-xz
+UNCOMP_TOOL_DEPENDENCY.lzma = host-xz
 EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .xz .lzma
 XZCAT = $(HOST_DIR)/usr/bin/xzcat
 endif
-- 
2.11.0
