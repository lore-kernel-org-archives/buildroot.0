From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Aug 2014 09:29:59 +0200
Subject: [Buildroot] [git commit] gendoc infra: use $(pkgname) instead of
	explicitly passing 'manual'
Message-ID: <20140816073245.1FE0B9C552@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd935d6771e3cdab15f997cd9f565d867343fa6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the gendoc infrastructure, using an assignment of the form
    FOO = docs/$(1)/bar
inside GENDOC_INNER does not work as expected: the $(1) value is empty here
and the value of FOO becomes 'docs//bar'.

Parameters $(2), $(3), etc. do not have this problem. The specific thing
about $(1) is that it is a parameter to GENDOC itself (indicating the
document to create) and passed transparently to GENDOC_INNER.

This is different from the package infrastructures, where $(1) is set from
$(pkgname). In fact, the same strategy could be used by the gendoc
infrastructure as well, as $(pkgname) resolves to 'manual' for file
docs/manual/manual.mk. This has the advantage that the described problem
does not occur.

Note that this means that if we want to use the same GENDOC infrastructure
for another document, it will have to reside in a separate directory than
the manual.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/manual.mk |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 0d463fd..e69b08a 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -78,16 +78,16 @@ endef
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
 ################################################################################
 define GENDOC
-$(call GENDOC_INNER,$(1),xhtml,html,html,HTML,--xsltproc-opts "--stringparam toc.section.depth 2")
-$(call GENDOC_INNER,$(1),chunked,split-html,chunked,split HTML,--xsltproc-opts "--stringparam toc.section.depth 2")
-$(call GENDOC_INNER,$(1),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhistory=0")
-$(call GENDOC_INNER,$(1),text,text,text,text)
-$(call GENDOC_INNER,$(1),epub,epub,epub,ePUB)
-clean: $(1)-clean
-$(1)-clean:
-	$$(Q)$$(RM) -rf $$(O)/docs/$(1)
-.PHONY: $(1) $(1)-clean manual-update-lists
+$(call GENDOC_INNER,$(pkgname),xhtml,html,html,HTML,--xsltproc-opts "--stringparam toc.section.depth 2")
+$(call GENDOC_INNER,$(pkgname),chunked,split-html,chunked,split HTML,--xsltproc-opts "--stringparam toc.section.depth 2")
+$(call GENDOC_INNER,$(pkgname),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhistory=0")
+$(call GENDOC_INNER,$(pkgname),text,text,text,text)
+$(call GENDOC_INNER,$(pkgname),epub,epub,epub,ePUB)
+clean: $(pkgname)-clean
+$(pkgname)-clean:
+	$$(Q)$$(RM) -rf $$(O)/docs/$(pkgname)
+.PHONY: $(pkgname) $(pkgname)-clean manual-update-lists
 endef
 
 MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
-$(eval $(call GENDOC,manual))
+$(eval $(call GENDOC))
