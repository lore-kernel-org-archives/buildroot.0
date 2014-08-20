From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 20 Aug 2014 12:03:22 +0200
Subject: [Buildroot] [PATCH 4/6] gendoc infra: disable pdf manual generation
In-Reply-To: <1408529004-18632-1-git-send-email-s.martin49@gmail.com>
References: <1408529004-18632-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1408529004-18632-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The PDF manual generation reaches the default xsltproc's template
recursion limit when processing the target package list; this makes the
PDF manual generation failed [1-3].

This limit can be raised with the '--maxvars' option. Unfortunately,
this option is not correctly handled in the latest xsltproc/libxslt
release (1.1.28), but this bug is already fixed in the libxslt
repository [4].

This patch disables the PDF manual generation (makes it failed with a
meaningful error message) when the xsltproc program found in the PATH
is not recent enough. However, this check is disabled if the XSLTPROC
variable is set on the make command line, pointing to a (assumed)
not-bugged xsltproc program. So, one can still generate the PDF manual
running:

  $ make XSLTPROC=/path/to/custom/xsltproc manual-pdf

[1] http://lists.busybox.net/pipermail/buildroot/2014-August/104390.html
[2] http://lists.busybox.net/pipermail/buildroot/2014-August/104418.html
[3] http://lists.busybox.net/pipermail/buildroot/2014-August/104421.html
[4] https://gitorious.org/libxslt/libxslt/commit/5af7ad745323004984287e48b42712e7305de35c

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/manual.mk | 47 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 66f3dc1..a3be8ed 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -83,6 +83,43 @@ define MANUAL_$(2)_INSTALL_CMDS
 endef
 endif
 
+# PDF manual generation is currently broken because of a bug in xsltproc
+# program (provided by libxslt), which does not honor an option we need to set.
+# Fortunately, this bug is already fixed upstream:
+#   https://gitorious.org/libxslt/libxslt/commit/5af7ad745323004984287e48b42712e7305de35c
+#
+# So, bail out when trying to build the pdf manual using a buggy version of the
+# xsltproc program.
+#
+# The PDF manual generation is disabled when a buggy xsltproc program is
+# detected (i.e. when the host system xsltproc program is use and it was built
+# using libxslt <=1.1.28).
+# The PDF manual is allowed in the other cases:
+# - xsltproc was built using libxslt >=1.1.29 sources;
+# - xsltproc is set on the make command line.
+#
+# So, to overcome this issue and being able to build the pdf manual, you can
+# build xsltproc from it source repository, then run:
+#   $ make XSLTPROC=/path/to/custom/xsltproc manual
+ifneq ($(XSLTPROC),)
+XSLTPROC = $$(abspath $$(shell PATH=$$(BR_PATH) which xsltproc 2>/dev/null))
+XSLTPROC_VERSION = $$(shell $$(XSLTPROC) --version | \
+	sed -nre '2 s/.*libxslt ([0-9]+(\.[0-9]+)*).*/\1/p')
+
+XSLTPROC_VERSION_GT_10129 = $$(filter 10129,\
+	$$(shell printf "10129\n$$(XSLTPROC_VERSION)" | sort | head -1))
+
+USE_BUGGY_XSLTPROC = $$(if $$(XSLTPROC_VERSION_GT_10129),,y)
+endif
+
+ifeq ($(4)-$$(USE_BUGGY_XSLTPROC),pdf-y)
+$$(O)/docs/$(1)/$(1).$(4):
+	$$(error PDF manual generation is disabled because of a bug in \
+		xsltproc program. To be able to generate the PDF manual, you \
+		should build xsltproc from the libxslt sources >=1.1.29 and \
+		passed it to make through the command line: \
+		'make XSLTPROC=/path/to/custom/xsltproc manual-pdf')
+else
 $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
 			   $$($$(call UPPERCASE,$(1))_SOURCES) \
 			   manual-check-dependencies \
@@ -90,13 +127,16 @@ $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
 			   manual-prepare-sources
 	$$(Q)$$(call MESSAGE,"Generating $(5) $(1)...")
 	$$(Q)mkdir -p $$(@D)
-	$$(Q)a2x $(6) -f $(2) -d book -L -r $$(TOPDIR)/docs/images \
+# make sure the xsltproc directory is in the PATH
+	$$(Q)PATH=$$(dir $(XSLTPROC)):$$(BR_PATH) \
+		a2x $(6) -f $(2) -d book -L -r $$(TOPDIR)/docs/images \
 		$$(MANUAL_$(2)_A2X_OPTS) \
 		--asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)" \
 		-D $$(@D) \
 		$$(BUILD_DIR)/$(1)/$(1).txt \
 # install the generated manual
 	$$(MANUAL_$(2)_INSTALL_CMDS)
+endif
 endef
 
 ################################################################################
@@ -112,8 +152,11 @@ $(call GENDOC_INNER,$(pkgname),xhtml,html,html,HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
 $(call GENDOC_INNER,$(pkgname),chunked,split-html,chunked,split HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
+# dblatex needs to pass '--maxvars ...' option to xsltproc to prevent it from
+# reaching the template recursion limit when processing the (long) target
+# package table and bailing out.
 $(call GENDOC_INNER,$(pkgname),pdf,pdf,pdf,PDF,\
-	--dblatex-opts "-P latex.output.revhistory=0")
+	--dblatex-opts "-P latex.output.revhistory=0 -x '--maxvars 100000'")
 $(call GENDOC_INNER,$(pkgname),text,text,text,text)
 $(call GENDOC_INNER,$(pkgname),epub,epub,epub,ePUB)
 clean: $(pkgname)-clean
-- 
2.0.4
