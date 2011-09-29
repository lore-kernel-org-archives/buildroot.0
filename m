From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Sep 2011 22:05:59 +0200
Subject: [Buildroot] [PATCH 2/4] manual: provide make targets to build the
	documentation
In-Reply-To: <cover.1317326629.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317326629.git.thomas.petazzoni@free-electrons.com>
Message-ID: <41d440a0142e3bb0e20ad8524aeca52fe94e8404.1317326629.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Special thanks for Yann E. Morin for giving input and suggestions to
implement this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |   46 +++++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 45 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index a20d3e2..278a3a0 100644
--- a/Makefile
+++ b/Makefile
@@ -665,10 +665,18 @@ ifeq ($(BR2_TARGET_BAREBOX),y)
 	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
 endif
 	@echo
+	@echo 'Documentation:'
+	@echo '  manual                 - build manual in HTML, split HTML, PDF and txt'
+	@echo '  manual-html            - build manual in HTML'
+	@echo '  manual-split-html      - build manual in split HTML'
+	@echo '  manual-pdf             - build manual in PDF'
+	@echo '  manual-txt             - build manual in txt'
+	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
 	@echo '  source-check           - check all packages for valid download URLs'
 	@echo '  external-deps          - list external packages used'
+	@echo '  manual			- build the Buildroot manual'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
@@ -676,7 +684,7 @@ endif
 	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 	@echo
-	@echo 'See docs/README and docs/buildroot.html for further details'
+	@echo 'See docs/README and the Buildroot manual for further details'
 	@echo
 
 release: OUT=buildroot-$(BR2_VERSION)
@@ -684,5 +692,41 @@ release: OUT=buildroot-$(BR2_VERSION)
 release:
 	git archive --format=tar --prefix=$(OUT)/ master|gzip -9 >$(OUT).tar.gz
 
+MANUAL_SOURCES = $(wildcard docs/manual/*.txt)
+
+manual: manual-html manual-split-html manual-pdf manual-txt manual-epub
+
+manual-html: $(MANUAL_SOURCES)
+	@echo "HTML manual..."
+	$(Q)mkdir -p $(O)/docs/manual
+	$(Q)cp -f docs/images/logo.png $(O)/docs/manual/
+	$(Q)asciidoc -b xhtml11 -d book -o $(O)/docs/manual/manual.html \
+		docs/manual/manual.txt
+
+manual-split-html: $(MANUAL_SOURCES)
+	@echo "Split HTML manual..."
+	$(Q)mkdir -p $(O)/docs/manual
+	$(Q)a2x -f chunked -d book -L docs/manual/manual.txt -r docs/images \
+		-D $(O)/docs/manual/
+
+manual-pdf: $(MANUAL_SOURCES)
+	@echo "PDF manual..."
+	$(Q)mkdir -p $(O)/docs/manual
+	$(Q)a2x --dblatex-opts "-P latex.output.revhistory=0" -f pdf -d book -L docs/manual/manual.txt \
+		-D $(O)/docs/manual/
+
+manual-txt: $(MANUAL_SOURCES)
+	@echo "Text manual..."
+	$(Q)mkdir -p $(O)/docs/manual
+	$(Q)a2x -f text -d book -L docs/manual/manual.txt \
+		-D $(O)/docs/manual
+
+manual-epub: $(MANUAL_SOURCES)
+	@echo "EPUB manual..."
+	$(Q)mkdir -p $(O)/docs/manual
+	$(Q)a2x -f epub -d book -L docs/manual/manual.txt \
+		-r docs/images/	\
+		-D $(O)/docs/manual
+
 .PHONY: $(noconfig_targets)
 
-- 
1.7.4.1
