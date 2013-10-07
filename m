From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 07 Oct 2013 08:50:07 +0200
Subject: [Buildroot] [PATCH 1 of 2 v3] manual generation: check dependencies
	first
In-Reply-To: <patchbomb.1381128606@argentina>
References: <patchbomb.1381128606@argentina>
Message-ID: <5933d239de31541ff436.1381128607@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To generate the manual, you need a few tools. If these are not present,
pretty cryptic error messages are given.
This patch adds a simple check for these dependencies, before attempting to
build the manual.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v3: use direct $(shell) instead of $(call suitable-host-package) to fix
    'make release' (Peter)
v2:
- update manual with the list of tools (comment Ryan)
- add check for dblatex and python-argparse (comment Samuel)
- check minimal version of asciidoc, using suitable-host-package mechanism

 docs/manual/make-tips.txt                   |   3 +-
 docs/manual/manual.mk                       |  32 ++++++++++++++++++++++++-
 docs/manual/prerequisite.txt                |   5 +++-
 support/dependencies/check-host-asciidoc.sh |  36 +++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+), 4 deletions(-)

diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
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
@@ -22,8 +48,12 @@ define GENDOC_INNER
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
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -76,4 +76,7 @@ development context (further details: re
 ** The +jar+ tool
 
 * Documentation generation tools:
-** +asciidoc+
+** +asciidoc+, version 8.6.3 or higher
+** +w3m+
+** +python+ with the +argparse+ module (automatically present in 2.7+ and 3.2+)
+** +dblatex+ (required for the pdf manual only)
diff --git a/support/dependencies/check-host-asciidoc.sh b/support/dependencies/check-host-asciidoc.sh
new file mode 100755
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
