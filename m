From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 07:46:26 +0200
Subject: [Buildroot] [git commit] gendoc infra: avoid a2x warning
Message-ID: <20141012072419.6D5EDB1B51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7cfa38274f00c54e8097f9285b7da5cbc4ebc60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Though the --destination-dir option works as expected, a2x displays the
following message when generating the pdf and text manual:

  a2x: WARNING: --destination-dir option is only applicable to HTML based outputs

To avoid this warning, we now just build the manual in its build location,
then move the generated files into $(O)/docs/manual.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[yann.morin.1998 at free.fr: tested all but PDF]
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/manual.mk |   17 ++++++++++++++++-
 1 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index cdc4c73..03e3a0b 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -70,6 +70,19 @@ ifneq ($$(wildcard $$(MANUAL_$(2)_ASCIIDOC_CONF)),)
 MANUAL_$(2)_ASCIIDOC_OPTS += -f $$(MANUAL_$(2)_ASCIIDOC_CONF)
 endif
 
+# Handle a2x warning about --destination-dir option only applicable to HTML
+# based outputs. So:
+# - use the --destination-dir option if possible (html and split-html),
+# - otherwise copy the generated manual to the output directory
+MANUAL_$(2)_A2X_OPTS =
+ifneq ($$(filter $(3),html split-html),)
+MANUAL_$(2)_A2X_OPTS += --destination-dir="$$(@D)"
+else
+define MANUAL_$(2)_INSTALL_CMDS
+	$$(Q)cp -f $$(BUILD_DIR)/docs/$(1)/$(1).$(4) $$(@D)
+endef
+endif
+
 $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
 			   $$($$(call UPPERCASE,$(1))_SOURCES) \
 			   manual-check-dependencies \
@@ -78,9 +91,11 @@ $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
 	$$(Q)$$(call MESSAGE,"Generating $(5) $(1)...")
 	$$(Q)mkdir -p $$(@D)
 	$$(Q)a2x $(6) -f $(2) -d book -L -r $$(TOPDIR)/docs/images \
+		$$(MANUAL_$(2)_A2X_OPTS) \
 		--asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)" \
-		-D $$(@D) \
 		$$(BUILD_DIR)/docs/$(1)/$(1).txt
+# install the generated manual
+	$$(MANUAL_$(2)_INSTALL_CMDS)
 endef
 
 ################################################################################
