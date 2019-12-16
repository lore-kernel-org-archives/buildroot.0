From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 16:31:13 +0100
Subject: [Buildroot] [PATCH v2 1/5] package/pkg-utils.mk: rename
 extractor-dependency to extractor-system-dependency
In-Reply-To: <20191216153118.1844417-1-thomas.petazzoni@bootlin.com>
References: <20191216153118.1844417-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191216153118.1844417-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The extractor-dependency macro returns which system-provided tools are
needed to be able to extract the archive passed as argument. The
result of this macro is added to DL_TOOLS_DEPENDENCIES so that the
logic in support/dependencies/ verifies that the necessary tools are
provided by the system.

However, we are going to add another macro, extractor-pkg-dependency,
which says which Buildroot packages are needed to extract the archive
passed as argument. Indeed, for those archive types, if the extractor
is not provided system-wide, we build it as a host Buildroot package.

To clarify the distinction between the upcoming
extractor-pkg-dependency and existing extractor-dependency, we rename
the latter to extractor-system-dependency.

We take this opportunity to extend the documentation of this macro.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
---
 package/pkg-generic.mk |  2 +-
 package/pkg-utils.mk   | 14 +++++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3904a1c4db..fd1817a86c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1098,7 +1098,7 @@ else ifeq ($$($(2)_SITE_METHOD),cvs)
 DL_TOOLS_DEPENDENCIES += cvs
 endif # SITE_METHOD
 
-DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
+DL_TOOLS_DEPENDENCIES += $$(call extractor-system-dependency,$$($(2)_SOURCE))
 
 # Ensure all virtual targets are PHONY. Listed alphabetically.
 .PHONY:	$(1) \
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index d38971caf6..0f916d81d8 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -46,11 +46,15 @@ INFLATE.tar  = cat
 # suitable-extractor(filename): returns extractor based on suffix
 suitable-extractor = $(INFLATE$(suffix $(1)))
 
-# extractor-dependency(filename): returns extractor for 'filename' if the
-# extractor is a dependency. If we build the extractor return nothing.
-# $(firstword) is used here because the extractor can have arguments, like
-# ZCAT="gzip -d -c", and to check for the dependency we only want 'gzip'.
-extractor-dependency = $(firstword $(INFLATE$(filter-out \
+# extractor-system-dependency(filename): returns the name of the tool
+# needed to extract 'filename', and is meant to be used with
+# DL_TOOLS_DEPENDENCIES, in order to check that the necesary tool is
+# provided by the system Buildroot runs on.
+#
+# $(firstword) is used here because the extractor can have arguments,
+# like ZCAT="gzip -d -c", and to check for the dependency we only want
+# 'gzip'.
+extractor-system-dependency = $(firstword $(INFLATE$(filter-out \
 	$(EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS),$(suffix $(1)))))
 
 # check-deprecated-variable -- throw an error on deprecated variables
-- 
2.23.0
