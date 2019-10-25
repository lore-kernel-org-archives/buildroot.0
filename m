From: =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
Date: Fri, 25 Oct 2019 14:34:21 +0200
Subject: [Buildroot] [PATCH] web-legal-info: Generate html site for minimal
 legal info
Message-ID: <20191025123421.366017-1-mickael.tansorier@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

web-legal-info use legal-info output to generate html web page with some
informations:
 - buildroot config
 - target packages: package name, version, licenses and soures
 - host packages: package name, version, licenses and soures
Output is `index.html` in legal-info subdirectory. This page need file
`buildroot.config`, directory `host-sources` and `sources`.
So only packages used to build image from config are listed.
---
 Makefile                                      | 13 ++++++++++
 docs/manual/legal-notice.txt                  | 12 +++++++++
 .../web-legal-info-skeleton.txt               | 25 +++++++++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 support/web-legal-info/web-legal-info-skeleton.txt

diff --git a/Makefile b/Makefile
index ecaae13846..3953764094 100644
--- a/Makefile
+++ b/Makefile
@@ -218,6 +218,8 @@ LEGAL_MANIFEST_CSV_TARGET = $(LEGAL_INFO_DIR)/manifest.csv
 LEGAL_MANIFEST_CSV_HOST = $(LEGAL_INFO_DIR)/host-manifest.csv
 LEGAL_WARNINGS = $(LEGAL_INFO_DIR)/.warnings
 LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
+WEB_LEGAL_MANIFEST_CSV_TARGET = $(LEGAL_INFO_DIR)/web-manifest.csv
+WEB_LEGAL_MANIFEST_CSV_HOST = $(LEGAL_INFO_DIR)/web-host-manifest.csv
 
 BR2_CONFIG = $(CONFIG_DIR)/.config
 
@@ -852,6 +854,17 @@ legal-info: legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p)-all
 		mv .legal-info.sha256 legal-info.sha256)
 	@echo "Legal info produced in $(LEGAL_INFO_DIR)"
 
+.PHONY: web-legal-info
+web-legal-info: asciidoc-check-dependencies legal-info
+	@$(call MESSAGE,"Collecting web legal info")
+	@awk -F"\"" '{ print "\""$$2"\",\""$$4"\",\""$$6"\",\"link:sources/"$$2"-"$$4"["$$2"-"$$4"]\"" }' $(LEGAL_MANIFEST_CSV_TARGET) | tail -n +2 > $(WEB_LEGAL_MANIFEST_CSV_TARGET)
+	@awk -F"\"" '{ print "\""$$2"\",\""$$4"\",\""$$6"\",\"link:host-sources/"$$2"-"$$4"["$$2"-"$$4"]\"" }' $(LEGAL_MANIFEST_CSV_HOST) | tail -n +2 > $(WEB_LEGAL_MANIFEST_CSV_HOST)
+	@cp support/web-legal-info/web-legal-info-skeleton.txt $(LEGAL_INFO_DIR)
+	@$(call MESSAGE,"Generate html page")
+	@asciidoc -o $(LEGAL_INFO_DIR)/index.html $(LEGAL_INFO_DIR)/web-legal-info-skeleton.txt
+	@rm $(WEB_LEGAL_MANIFEST_CSV_TARGET) $(WEB_LEGAL_MANIFEST_CSV_HOST) $(LEGAL_INFO_DIR)/web-legal-info-skeleton.txt
+	@echo "Web legal info produced in $(LEGAL_INFO_DIR)"
+
 .PHONY: show-targets
 show-targets:
 	@echo $(sort $(PACKAGES)) $(sort $(TARGETS_ROOTFS))
diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index 69753282ec..0366d72e6c 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -83,6 +83,18 @@ of +make legal-info+ before using it as your own compliance delivery. See
 the _NO WARRANTY_ clauses (clauses 11 and 12) in the +COPYING+ file at the
 root of the Buildroot distribution.
 
+To produce minimal html web page informations with package, version, license
+and sources you car run:
+
+--------------------
+make web-legal-info
+--------------------
+
+This command depend of +legal-info+ command so it will run each time you run
++web-legal-info+. Output +index.html+ can be find under +legal-info+
+subdirectory.
+
+
 [[legal-info-buildroot]]
 === Complying with the Buildroot license
 
diff --git a/support/web-legal-info/web-legal-info-skeleton.txt b/support/web-legal-info/web-legal-info-skeleton.txt
new file mode 100644
index 0000000000..a6341b846d
--- /dev/null
+++ b/support/web-legal-info/web-legal-info-skeleton.txt
@@ -0,0 +1,25 @@
+Redistributable licenses
+========================
+
+Buildroot Config
+----------------
+link:buildroot.config[]
+
+Target packages
+---------------
+
+[format="csv",options="header"]
+|=======================================================
+"PACKAGE","VERSION","LICENSE","SOURCES"
+include::web-manifest.csv[]
+|=======================================================
+
+Host packages
+-------------
+
+[format="csv",options="header"]
+|=======================================================
+"PACKAGE","VERSION","LICENSE","SOURCES"
+include::web-host-manifest.csv[]
+|=======================================================
+
-- 
2.23.0
