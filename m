From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Sep 2014 13:07:43 +0200
Subject: [Buildroot] [PATCH 09/23 v5] docs/manual: move
	manual-prepare-sources rule into GENDOC
In-Reply-To: <cover.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <5f7a6dc13281f3ddc0803f443331406f78c61272.1410692670.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Copying the document's source files is a generic GENDOC action, that
will be common to all documents, so the dependency rule should be
handled in GENDOC, rather than letting all documents duplicate it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 docs/manual/manual.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 08addd1..0ae2d83 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -7,7 +7,7 @@ manual-update-lists: manual-check-dependencies-lists $(BUILD_DIR)/$(pkgname)
 		BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
 		python -B $(TOPDIR)/support/scripts/gen-manual-lists.py
 
-manual-prepare-sources: manual-rsync manual-update-lists
+manual-prepare-sources: manual-update-lists
 
 # we can't use suitable-host-package here because that's not available in
 # the context of 'make release'
@@ -127,6 +127,8 @@ $(pkgname)-rsync: $$(BUILD_DIR)/$(pkgname)
 	$$(Q)$$(call MESSAGE,"Preparing the $(pkgname) sources...")
 	$$(Q)rsync -a docs/$(pkgname)/ $$^
 
+$(pkgname)-prepare-sources: $(pkgname)-rsync
+
 $(call GENDOC_INNER,$(pkgname),xhtml,html,html,HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
 $(call GENDOC_INNER,$(pkgname),chunked,split-html,chunked,split HTML,\
-- 
1.9.1
