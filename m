From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 07:46:26 +0200
Subject: [Buildroot] [git commit] gendoc infra: disable pdf manual
	generation if xsltproc is buggy
Message-ID: <20141012072419.78A94B1B51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9f44f0abb59b6a4349adc1c87b1c71413034e1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The PDF manual generation reaches the default xsltproc's template
recursion limit when processing the target package list; this makes the
PDF manual generation fail [1-3].

This limit can be raised with the '--maxvars' option. Unfortunately,
this option is not correctly handled in the latest xsltproc/libxslt
release (1.1.28), but this bug is already fixed in the libxslt
repository [4].

This patch disables the PDF manual generation (makes it warn with a
meaningful error message) when the xsltproc program found in the PATH
does not support the --maxvars option.
So, one can still generate the PDF manual if he/she extends PATH with
the location of a working xsltproc, by running:

  $ PATH=/path/to/custom-xsltproc/bin:${PATH} make manual-pdf

[1] http://lists.busybox.net/pipermail/buildroot/2014-August/104390.html
[2] http://lists.busybox.net/pipermail/buildroot/2014-August/104418.html
[3] http://lists.busybox.net/pipermail/buildroot/2014-August/104421.html
[4] https://gitorious.org/libxslt/libxslt/commit/5af7ad745323004984287e48b42712e7305de35c

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[yann.morin.1998 at free.fr: move the assignment block out of GENDOC_INNER, no
 need to retest for each type of each document: it's always the same answer;
 make it a warning as per Thomas DS. suggestion]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/manual.mk |   28 +++++++++++++++++++++++++++-
 1 files changed, 27 insertions(+), 1 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 03e3a0b..e9078f1 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -41,6 +41,20 @@ manual-check-dependencies-lists:
 		exit 1; \
 	fi
 
+# PDF manual generation is broken because of a bug in xsltproc program provided
+# by libxslt <=1.1.28, which does not honor an option we need to set.
+# Fortunately, this bug is already fixed upstream:
+#   https://gitorious.org/libxslt/libxslt/commit/5af7ad745323004984287e48b42712e7305de35c
+#
+# So, bail out when trying to build the pdf manual using a buggy version of the
+# xsltproc program.
+#
+# So, to overcome this issue and being able to build the pdf manual, you can
+# build xsltproc from it source repository, then run:
+#   $ PATH=/path/to/custom-xsltproc/bin:${PATH} make manual
+MANUAL_XSLTPROC_IS_BROKEN = \
+	$(shell xsltproc --maxvars 0 >/dev/null 2>/dev/null || echo y)
+
 ################################################################################
 # GENDOC_INNER -- generates the make targets needed to build a specific type of
 #                 asciidoc documentation.
@@ -83,6 +97,14 @@ define MANUAL_$(2)_INSTALL_CMDS
 endef
 endif
 
+ifeq ($(4)-$$(MANUAL_XSLTPROC_IS_BROKEN),pdf-y)
+$$(O)/docs/$(1)/$(1).$(4):
+	$$(warning PDF manual generation is disabled because of a bug in \
+		xsltproc. To be able to generate the PDF manual, you should \
+		build xsltproc from the libxslt sources >=1.1.29 and pass it \
+		to make through the command line: \
+		'PATH=/path/to/custom-xsltproc/bin:$$$${PATH} make manual-pdf')
+else
 $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
 			   $$($$(call UPPERCASE,$(1))_SOURCES) \
 			   manual-check-dependencies \
@@ -96,6 +118,7 @@ $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
 		$$(BUILD_DIR)/docs/$(1)/$(1).txt
 # install the generated manual
 	$$(MANUAL_$(2)_INSTALL_CMDS)
+endif
 endef
 
 ################################################################################
@@ -111,8 +134,11 @@ $(call GENDOC_INNER,$(pkgname),xhtml,html,html,HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
 $(call GENDOC_INNER,$(pkgname),chunked,split-html,chunked,split HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
+# dblatex needs to pass the '--maxvars ...' option to xsltproc to prevent it
+# from reaching the template recursion limit when processing the (long) target
+# package table and bailing out.
 $(call GENDOC_INNER,$(pkgname),pdf,pdf,pdf,PDF,\
-	--dblatex-opts "-P latex.output.revhistory=0")
+	--dblatex-opts "-P latex.output.revhistory=0 -x '--maxvars 100000'")
 $(call GENDOC_INNER,$(pkgname),text,text,text,text)
 $(call GENDOC_INNER,$(pkgname),epub,epub,epub,ePUB)
 clean: $(pkgname)-clean
