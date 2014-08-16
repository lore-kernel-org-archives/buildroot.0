From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Aug 2014 09:29:59 +0200
Subject: [Buildroot] [git commit] gendoc infra: add support for asciidoc
	configuration files
Message-ID: <20140816073245.29DA69C552@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=05fa99d03c8f5207efb4ae30846a07f01519965a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch introduces support for asciidoc configuration files, specific for
each output format (html, text, pdf, ...). This is useful to make certain
tweaks in the document generation.

If a file docs/manual/asciidoc-<format>.conf is present, it is passed to
asciidoc as configuration file. If no file for the current format is
present, the options passed to asciidoc are empty.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/manual.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index e69b08a..942bb35 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -56,6 +56,11 @@ $(1)-$(3): $$(O)/docs/$(1)/$(1).$(4)
 
 manual-check-dependencies-$(3):
 
+MANUAL_$(2)_ASCIIDOC_CONF = docs/$(1)/asciidoc-$(2).conf
+ifneq ($$(wildcard $$(MANUAL_$(2)_ASCIIDOC_CONF)),)
+MANUAL_$(2)_ASCIIDOC_OPTS += -f $$(MANUAL_$(2)_ASCIIDOC_CONF)
+endif
+
 $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
 			   $$($$(call UPPERCASE,$(1))_SOURCES) \
 			   manual-check-dependencies \
@@ -65,7 +70,8 @@ $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
 	$$(Q)mkdir -p $$(@D)/.build
 	$$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
 	$$(Q)a2x $(6) -f $(2) -d book -L -r $$(TOPDIR)/docs/images \
-	        -D $$(@D) $$(@D)/.build/$(1).txt
+	        -D $$(@D) $$(@D)/.build/$(1).txt \
+	        --asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)"
 	-$$(Q)rm -rf $$(@D)/.build
 endef
 
