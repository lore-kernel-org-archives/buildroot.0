From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 22:11:11 +0100
Subject: [Buildroot] [git commit] package: refactor listing of extractor
	dependencies
Message-ID: <20170215211147.5E73E821DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc7fcbe494ffddcaba630889fe1a2915569be3f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't special case $(XZCAT) when constructing DL_TOOLS_DEPENDENCIES. The next
commit will introduce another extractor that automatically builds when not
installed. Introduce EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS that lists
archive extensions for which the extractor is already checked in
support/dependencies/check-host-foo.mk. Use this in the newly introduced
extractor-dependency to populate DL_TOOLS_DEPENDENCIES.

Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
[Thomas: add missing space after "firstword", as noticed by Thomas DS.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk                   | 8 +-------
 package/pkg-utils.mk                     | 7 +++++++
 support/dependencies/check-host-xzcat.mk | 1 +
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3ca71b0..e8a8021 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -926,13 +926,7 @@ else ifeq ($$($(2)_SITE_METHOD),cvs)
 DL_TOOLS_DEPENDENCIES += cvs
 endif # SITE_METHOD
 
-# $(firstword) is used here because the extractor can have arguments, like
-# ZCAT="gzip -d -c", and to check for the dependency we only want 'gzip'.
-# Do not add xzcat to the list of required dependencies, as it gets built
-# automatically if it isn't found.
-ifneq ($$(call suitable-extractor,$$($(2)_SOURCE)),$$(XZCAT))
-DL_TOOLS_DEPENDENCIES += $$(firstword $$(call suitable-extractor,$$($(2)_SOURCE)))
-endif
+DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
 
 # Ensure all virtual targets are PHONY. Listed alphabetically.
 .PHONY:	$(1) \
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index c5d4080..38d00db 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -45,6 +45,13 @@ INFLATE.tar  = cat
 # suitable-extractor(filename): returns extractor based on suffix
 suitable-extractor = $(INFLATE$(suffix $(1)))
 
+# extractor-dependency(filename): returns extractor for 'filename' if the
+# extractor is a dependency. If we build the extractor return nothing.
+# $(firstword) is used here because the extractor can have arguments, like
+# ZCAT="gzip -d -c", and to check for the dependency we only want 'gzip'.
+extractor-dependency = $(firstword $(INFLATE$(filter-out \
+	$(EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS),$(suffix $(1)))))
+
 # check-deprecated-variable -- throw an error on deprecated variables
 # example:
 #   $(eval $(call check-deprecated-variable,FOO_MAKE_OPT,FOO_MAKE_OPTS))
diff --git a/support/dependencies/check-host-xzcat.mk b/support/dependencies/check-host-xzcat.mk
index 5e08b6e..c6d9eeb 100644
--- a/support/dependencies/check-host-xzcat.mk
+++ b/support/dependencies/check-host-xzcat.mk
@@ -3,5 +3,6 @@
 
 ifeq (,$(call suitable-host-package,xzcat,$(XZCAT)))
 DEPENDENCIES_HOST_PREREQ += host-xz
+EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .xz .lzma
 XZCAT = $(HOST_DIR)/usr/bin/xzcat
 endif
