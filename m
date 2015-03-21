From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Mar 2015 20:49:46 +0100
Subject: [Buildroot] [PATCH 2/4] Makefile: split off 'list-defconfigs' from
	'help'
In-Reply-To: <1426967388-559-1-git-send-email-arnout@mind.be>
References: <1426967388-559-1-git-send-email-arnout@mind.be>
Message-ID: <1426967388-559-3-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed in the FOSDEM2015 BR developer meeting, the output of
'make help' is too long for comfortable reading. To shorten it, split
off the list of defconfigs in a new target, 'list-defconfigs'.

Declare the new target as phony.

Add 'list-defconfigs' to the documentation.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                             | 10 ++++++----
 docs/manual/customize-outside-br.txt |  6 +++---
 docs/manual/make-tips.txt            |  6 ++++++
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index de2abfe..ea08e6a 100644
--- a/Makefile
+++ b/Makefile
@@ -434,7 +434,7 @@ world: target-post-image
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars help \
-	target-finalize target-post-image \
+	list-defconfigs target-finalize target-post-image \
 	$(TARGETS) $(TARGETS_ROOTFS) \
 	$(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
 	$(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
@@ -905,6 +905,11 @@ endif
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
 	@echo
+	@echo 'For further details, see README, generate the Buildroot manual, or consult'
+	@echo 'it on-line at http://buildroot.org/docs.html'
+	@echo
+
+list-defconfigs:
 	@echo 'Built-in configs:'
 	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
@@ -915,9 +920,6 @@ ifneq ($(wildcard $(BR2_EXTERNAL)/configs/*_defconfig),)
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 endif
 	@echo
-	@echo 'For further details, see README, generate the Buildroot manual, or consult'
-	@echo 'it on-line at http://buildroot.org/docs.html'
-	@echo
 
 release: OUT = buildroot-$(BR2_VERSION)
 
diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 5d63e60..aac9a43 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -100,6 +100,6 @@ And then in +$(BR2_EXTERNAL)/package/package1+ and
 
  * One can store Buildroot defconfigs in the +configs+ subdirectory of
    +$(BR2_EXTERNAL)+. Buildroot will automatically show them in the
-   output of +make help+ and allow them to be loaded with the normal
-   +make <name>_defconfig+ command. They will be visible under the
-   +User-provided configs+' label in the 'make help' output.
+   output of +make list-defconfigs+ and allow them to be loaded with the
+   normal +make <name>_defconfig+ command. They will be visible under the
+   +User-provided configs+' label in the 'make list-defconfigs' output.
diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 027eddf..1cf1544 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -12,6 +12,12 @@ This is a collection of tips that help you make the most of Buildroot.
  $ make V=1 <target>
 --------------------
 
+.Display the list of boards with a defconfig:
+
+--------------------
+ $ make list-defconfigs
+--------------------
+
 .Display all available targets:
 
 --------------------
-- 
2.1.4
