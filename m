From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 16:41:04 +0100
Subject: [Buildroot] [git commit] manual generation: check dependencies first
Message-ID: <20131104211054.D73249BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6fb84874b2545d25fdb85b4b2a0a5c8fac1c6305
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To generate the manual, you need a few tools. If these are not present,
pretty cryptic error messages are given.
This patch adds a simple check for these dependencies, before attempting to
build the manual.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/make-tips.txt                   |    3 +-
 docs/manual/manual.mk                       |   32 +++++++++++++++++++++++-
 docs/manual/prerequisite.txt                |    5 +++-
 support/dependencies/check-host-asciidoc.sh |   36 +++++++++++++++++++++++++++
 4 files changed, 72 insertions(+), 4 deletions(-)

diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 31a88bf..0159ffe 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -64,9 +64,8 @@ To generate the manual:
 The manual outputs will be generated in 'output/docs/manual'.
 
 .Notes
-- +asciidoc+ is required to build the documentation (see:
+- A few tools are required to build the documentation (see:
   xref:requirement-optional[]).
-- There is a known issue that you can't build it under Debian Squeeze.
 
 .Reseting Buildroot for a new target:
 
diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index d092d3f..fcfe47b 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -1,8 +1,34 @@
-manual-update-lists:
+manual-update-lists: manual-check-dependencies-lists
 	$(Q)$(call MESSAGE,"Updating the manual lists...")
 	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build \
 		$(TOPDIR)/support/scripts/gen-manual-lists.py
 
+# we can't use suitable-host-package here because that's not available in
+# the context of 'make release'
+manual-check-dependencies:
+	$(Q)if [ -z "$(shell support/dependencies/check-host-asciidoc.sh)" ]; then \
+		echo "You need a sufficiently recent asciidoc on your host" \
+			"to generate the manual"; \
+		exit 1; \
+	fi
+	$(Q)if [ -z "`which w3m 2>/dev/null`" ]; then \
+		echo "You need w3m on your host to generate the manual"; \
+		exit 1; \
+	fi
+
+manual-check-dependencies-pdf:
+	$(Q)if [ -z "`which dblatex 2>/dev/null`" ]; then \
+		echo "You need dblatex on your host to generate the pdf manual"; \
+		exit 1; \
+	fi
+
+manual-check-dependencies-lists:
+	$(Q)if ! python -c "import argparse" >/dev/null 2>&1 ; then \
+		echo "You need python with argparse on your host to generate" \
+			"the list of packages in the manual"; \
+		exit 1; \
+	fi
+
 ################################################################################
 # GENDOC -- generates the make targets needed to build a specific type of
 #           asciidoc documentation.
@@ -22,8 +48,12 @@ $(1): $(1)-$(3)
 .PHONY: $(1)-$(3)
 $(1)-$(3): $$(O)/docs/$(1)/$(1).$(4)
 
+manual-check-dependencies-$(3):
+
 $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
 			   $$($(call UPPERCASE,$(1))_SOURCES) \
+			   manual-check-dependencies \
+			   manual-check-dependencies-$(3) \
 			   manual-update-lists
 	$(Q)$(call MESSAGE,"Generating $(5) $(1)...")
 	$(Q)mkdir -p $$(@D)/.build
diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 78ce436..729d64c 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -76,4 +76,7 @@ development context (further details: refer to xref:download-infra[]).
 ** The +jar+ tool
 
 * Documentation generation tools:
-** +asciidoc+
+** +asciidoc+, version 8.6.3 or higher
+** +w3m+
+** +python+ with the +argparse+ module (automatically present in 2.7+ and 3.2+)
+** +dblatex+ (required for the pdf manual only)
diff --git a/support/dependencies/check-host-asciidoc.sh b/support/dependencies/check-host-asciidoc.sh
new file mode 100755
index 0000000..fc5fcba
--- /dev/null
+++ b/support/dependencies/check-host-asciidoc.sh
@@ -0,0 +1,36 @@
+#!/bin/sh
+
+candidate="$1" #ignored
+
+asciidoc=`which asciidoc`
+if [ ! -x "$asciidoc" ]; then
+	# echo nothing: no suitable asciidoc found
+	exit 1
+fi
+
+# Output of 'asciidoc --version' examples:
+# asciidoc 8.6.7
+version=`$asciidoc --version | cut -d\  -f2`
+major=`echo "$version" | cut -d. -f1`
+minor=`echo "$version" | cut -d. -f2`
+bugfix=`echo "$version" | cut -d. -f3`
+
+# To generate the manual, we need asciidoc >= 8.6.3
+major_min=8
+minor_min=6
+bugfix_min=3
+if [ $major -gt $major_min ]; then
+	echo $asciidoc
+else
+	if [ $major -eq $major_min -a $minor -ge $minor_min ]; then
+		echo $asciidoc
+	else
+		if [ $major -eq $major_min -a $minor -eq $minor_min \
+			-a $bugfix -ge $bugfix_min ]; then
+			echo $asciidoc
+		else
+			# echo nothing: no suitable asciidoc found
+			exit 1
+		fi
+	fi
+fi
