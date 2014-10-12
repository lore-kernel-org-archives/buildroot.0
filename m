From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 07:46:27 +0200
Subject: [Buildroot] [git commit] docs/manual: move manual-prepare-sources
	rule into GENDOC
Message-ID: <20141012072419.A7EA2B1909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4cf14e177f85abc20f07bd2873408f9c2bd68ea7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Copying the document's source files is a generic GENDOC action, that
will be common to all documents, so the dependency rule should be
handled in GENDOC, rather than letting all documents duplicate it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/manual.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 3b79716..c40f371 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -7,7 +7,7 @@ manual-update-lists: manual-check-dependencies-lists $(BUILD_DIR)/docs/$(pkgname
 		BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
 		python -B $(TOPDIR)/support/scripts/gen-manual-lists.py
 
-manual-prepare-sources: manual-rsync manual-update-lists
+manual-prepare-sources: manual-update-lists
 
 # we can't use suitable-host-package here because that's not available in
 # the context of 'make release'
@@ -127,6 +127,8 @@ $(pkgname)-rsync: $$(BUILD_DIR)/docs/$(pkgname)
 	$$(Q)$$(call MESSAGE,"Preparing the $(pkgname) sources...")
 	$$(Q)rsync -a docs/$(pkgname)/ $$^
 
+$(pkgname)-prepare-sources: $(pkgname)-rsync
+
 $(call GENDOC_INNER,$(pkgname),xhtml,html,html,HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
 $(call GENDOC_INNER,$(pkgname),chunked,split-html,chunked,split HTML,\
