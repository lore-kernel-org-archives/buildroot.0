From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Aug 2011 23:23:20 +0200
Subject: [Buildroot] [PATCH 2/5] manual: provide make targets to build the
	documentation
In-Reply-To: <cover.1312492948.git.thomas.petazzoni@free-electrons.com>
References: <cover.1312492948.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ab98242259a83d1329c12ef548b33d0c2ce41200.1312492948.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |   40 +++++++++++++++++++++++++++++++++++++++-
 1 files changed, 39 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 02a1659..5face9f 100644
--- a/Makefile
+++ b/Makefile
@@ -660,10 +660,18 @@ ifeq ($(BR2_TOOLCHAIN_CTNG),y)
 	@echo '  ctng-menuconfig        - Run crosstool-NG menuconfig'
 endif
 	@echo
+	@echo 'Documentation:'
+	@echo '  manual                 - build manual in HTML, splitted HTML, PDF and txt'
+	@echo '  manual-html            - build manual in HTML'
+	@echo '  manual-splitted-html   - build manual in splitted HTML'
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
@@ -671,7 +679,7 @@ endif
 	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 	@echo
-	@echo 'See docs/README and docs/buildroot.html for further details'
+	@echo 'See docs/README and the Buildroot manual for further details'
 	@echo
 
 release: OUT=buildroot-$(BR2_VERSION)
@@ -679,5 +687,35 @@ release: OUT=buildroot-$(BR2_VERSION)
 release:
 	git archive --format=tar --prefix=$(OUT)/ master|gzip -9 >$(OUT).tar.gz
 
+manual: manual-html manual-splitted-html manual-pdf manual-txt
+
+manual-html:
+	@echo "HTML manual..."
+	@(cd docs/manual; 				\
+		cp ../images/logo.png .; 		\
+		asciidoc -b xhtml11 -d book manual.txt; \
+		rm logo.png)
+
+manual-splitted-html:
+	@echo "Splited HTML manual..."
+	@(cd docs/manual; 				\
+		cp ../images/logo.png .; 		\
+		a2x -f chunked -d book -L manual.txt; 	\
+		rm logo.png)
+
+manual-pdf:
+	@echo "PDF manual..."
+	@(cd docs/manual; 				\
+		cp ../images/logo.png .; 		\
+		a2x --dblatex-opts "-P latex.output.revhistory=0" -f pdf -d book -L manual.txt ; \
+		rm logo.png)
+
+manual-txt:
+	@echo "Text manual..."
+	@(cd docs/manual; 				\
+		cp ../images/logo.png .; 		\
+		a2x -f text -d book -L manual.txt; 	\
+		rm logo.png)
+
 .PHONY: $(noconfig_targets)
 
-- 
1.7.4.1
