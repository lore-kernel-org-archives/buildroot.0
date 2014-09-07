From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  8 Sep 2014 01:39:05 +0200
Subject: [Buildroot] [PATCH 06/18 v4] docs/manual: copying the manual
	sources is a common action
In-Reply-To: <cover.1410132603.git.yann.morin.1998@free.fr>
References: <cover.1410132603.git.yann.morin.1998@free.fr>
Message-ID: <c482fe23ff8d3e0214b31233534842639a9189c8.1410132603.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the creation of $(BUILD_DIR)/manual and the rsyncing of the
sources into GENDOC.

This is is needed so that GENDOC can be easily used to generate another
document, without requiring that document to duplicate the copying rules.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 docs/manual/manual.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 4825a70..bae517b 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -1,10 +1,3 @@
-$(BUILD_DIR)/$(pkgname):
-	$(Q)mkdir -p $@
-
-manual-rsync: $(BUILD_DIR)/$(pkgname)
-	$(Q)$(call MESSAGE,"Preparing the manual sources...")
-	$(Q)rsync -a docs/$(pkgname)/ $(BUILD_DIR)/$(pkgname)
-
 # Packages included in BR2_EXTERNAL are not part of buildroot, so they
 # should not be included in the manual.
 manual-update-lists: manual-check-dependencies-lists $(BUILD_DIR)/$(pkgname)
@@ -127,6 +120,13 @@ endef
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
 ################################################################################
 define GENDOC
+$$(BUILD_DIR)/$(pkgname):
+	$$(Q)mkdir -p $$@
+
+$(pkgname)-rsync: $$(BUILD_DIR)/$(pkgname)
+	$$(Q)$$(call MESSAGE,"Preparing the $(pkgname) sources...")
+	$$(Q)rsync -a docs/$(pkgname)/ $$^
+
 $(call GENDOC_INNER,$(pkgname),xhtml,html,html,HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
 $(call GENDOC_INNER,$(pkgname),chunked,split-html,chunked,split HTML,\
-- 
1.9.1
