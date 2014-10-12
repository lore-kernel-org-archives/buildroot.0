From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 07:46:26 +0200
Subject: [Buildroot] [git commit] docs/manual: copying the manual sources is
	a common action
Message-ID: <20141012072419.8C80CB1B51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1750f31b1f1f7c4300a427e1dcebfc379c411d7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move the creation of $(BUILD_DIR)/manual and the rsyncing of the
sources into GENDOC.

This is is needed so that GENDOC can be easily used to generate another
document, without requiring that document to duplicate the copying rules.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/manual.mk |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 69113e3..dd6f0ea 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -1,10 +1,3 @@
-$(BUILD_DIR)/docs/$(pkgname):
-	$(Q)mkdir -p $@
-
-manual-rsync: $(BUILD_DIR)/docs/$(pkgname)
-	$(Q)$(call MESSAGE,"Preparing the manual sources...")
-	$(Q)rsync -a docs/$(pkgname)/ $(BUILD_DIR)/docs/$(pkgname)
-
 # Packages included in BR2_EXTERNAL are not part of buildroot, so they
 # should not be included in the manual.
 manual-update-lists: manual-check-dependencies-lists $(BUILD_DIR)/docs/$(pkgname)
@@ -127,6 +120,13 @@ endef
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
 ################################################################################
 define GENDOC
+$$(BUILD_DIR)/docs/$(pkgname):
+	$$(Q)mkdir -p $$@
+
+$(pkgname)-rsync: $$(BUILD_DIR)/docs/$(pkgname)
+	$$(Q)$$(call MESSAGE,"Preparing the $(pkgname) sources...")
+	$$(Q)rsync -a docs/$(pkgname)/ $$^
+
 $(call GENDOC_INNER,$(pkgname),xhtml,html,html,HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
 $(call GENDOC_INNER,$(pkgname),chunked,split-html,chunked,split HTML,\
