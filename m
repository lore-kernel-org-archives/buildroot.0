From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Aug 2014 15:40:36 +0200
Subject: [Buildroot] [PATCH 3 of 5 v4 for 2014.08] gendoc infra: add support
 for asciidoc configuration files
In-Reply-To: <patchbomb.1408110033@localhost>
References: <patchbomb.1408110033@localhost>
Message-ID: <81d40b841073724e161c.1408110036@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces support for asciidoc configuration files, specific for
each output format (html, text, pdf, ...). This is useful to make certain
tweaks in the document generation.

If a file docs/manual/asciidoc-<format>.conf is present, it is passed to
asciidoc as configuration file. If no file for the current format is
present, the options passed to asciidoc are empty.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>

---
v4: no changes
v3: no changes
v2: no changes

 docs/manual/manual.mk |  8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff -r 9d9af165df7b -r 81d40b841073 docs/manual/manual.mk
--- a/docs/manual/manual.mk	Sat Aug 09 18:18:58 2014 +0200
+++ b/docs/manual/manual.mk	Sat Aug 09 12:20:16 2014 +0200
@@ -56,6 +56,11 @@
 
 manual-check-dependencies-$(3):
 
+MANUAL_$(2)_ASCIIDOC_CONF = docs/$(1)/asciidoc-$(2).conf
+ifneq ($$(wildcard $$(MANUAL_$(2)_ASCIIDOC_CONF)),)
+MANUAL_$(2)_ASCIIDOC_OPTS += -f $$(MANUAL_$(2)_ASCIIDOC_CONF)
+endif
+
 $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
 			   $$($$(call UPPERCASE,$(1))_SOURCES) \
 			   manual-check-dependencies \
@@ -65,7 +70,8 @@
 	$$(Q)mkdir -p $$(@D)/.build
 	$$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
 	$$(Q)a2x $(6) -f $(2) -d book -L -r $$(TOPDIR)/docs/images \
-	        -D $$(@D) $$(@D)/.build/$(1).txt
+	        -D $$(@D) $$(@D)/.build/$(1).txt \
+	        --asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)"
 	-$$(Q)rm -rf $$(@D)/.build
 endef
 
