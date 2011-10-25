From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Oct 2011 09:59:22 +0200
Subject: [Buildroot] [git commit] manual: provide make targets to build the
	documentation
Message-ID: <20111025102334.139BE8EF75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8792cf9e0d290b9e49d934d5e3025466ed0bd286
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Special thanks for Yann E. Morin for giving input and suggestions to
implement this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
[Peter: skip double mention of manual target in make help]
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |   44 +++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 43 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 8525b7d..be90f47 100644
--- a/Makefile
+++ b/Makefile
@@ -672,6 +672,14 @@ ifeq ($(BR2_TARGET_BAREBOX),y)
 	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
 endif
 	@echo
+	@echo 'Documentation:'
+	@echo '  manual                 - build manual in HTML, split HTML, PDF and txt'
+	@echo '  manual-html            - build manual in HTML'
+	@echo '  manual-split-html      - build manual in split HTML'
+	@echo '  manual-pdf             - build manual in PDF'
+	@echo '  manual-txt             - build manual in txt'
+	@echo '  manual-epub            - build manual in ePub'
+	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
 	@echo '  source-check           - check all packages for valid download URLs'
@@ -683,7 +691,7 @@ endif
 	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 	@echo
-	@echo 'See docs/README and docs/buildroot.html for further details'
+	@echo 'See docs/README, or generate the Buildroot manual for further details'
 	@echo
 
 release: OUT=buildroot-$(BR2_VERSION)
@@ -691,5 +699,39 @@ release: OUT=buildroot-$(BR2_VERSION)
 release:
 	git archive --format=tar --prefix=$(OUT)/ master|gzip -9 >$(OUT).tar.gz
 
+MANUAL_SOURCES = $(wildcard docs/manual/*.txt)
+
+manual: manual-html manual-split-html manual-pdf manual-txt manual-epub
+
+manual-html: $(MANUAL_SOURCES)
+	@echo "HTML manual..."
+	$(Q)mkdir -p $(O)/docs/manual
+	$(Q)a2x -f xhtml -d book -L -r docs/images -D $(O)/docs/manual/ \
+		docs/manual/manual.txt
+
+manual-split-html: $(MANUAL_SOURCES)
+	@echo "Split HTML manual..."
+	$(Q)mkdir -p $(O)/docs/manual
+	$(Q)a2x -f chunked -d book -L -r docs/images -D $(O)/docs/manual/ \
+		docs/manual/manual.txt
+
+manual-pdf: $(MANUAL_SOURCES)
+	@echo "PDF manual..."
+	$(Q)mkdir -p $(O)/docs/manual
+	$(Q)a2x --dblatex-opts "-P latex.output.revhistory=0" -f pdf -d book -L -D $(O)/docs/manual/ \
+		docs/manual/manual.txt
+
+manual-txt: $(MANUAL_SOURCES)
+	@echo "Text manual..."
+	$(Q)mkdir -p $(O)/docs/manual
+	$(Q)a2x -f text -d book -L -D $(O)/docs/manual/ \
+		docs/manual/manual.txt
+
+manual-epub: $(MANUAL_SOURCES)
+	@echo "EPUB manual..."
+	$(Q)mkdir -p $(O)/docs/manual
+	$(Q)a2x -f epub -d book -L -r docs/images/ -D $(O)/docs/manual/ \
+		docs/manual/manual.txt
+
 .PHONY: $(noconfig_targets)
 
