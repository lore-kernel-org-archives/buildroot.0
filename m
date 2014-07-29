From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 29 Jul 2014 20:18:14 +0200
Subject: [Buildroot] [PATCH 1/2] perl: refactor with TARGET_FINALIZE_HOOKS
Message-ID: <1406657895-22458-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 Makefile             |  5 -----
 package/perl/perl.mk | 12 ++++++++++++
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 258495c..ee66494 100644
--- a/Makefile
+++ b/Makefile
@@ -577,11 +577,6 @@ ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
 endif
 	rm -rf $(TARGET_DIR)/usr/lib/luarocks
-	rm -rf $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/pod
-	rm -rf $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE
-	find $(TARGET_DIR)/usr/lib/perl5/ -name 'extralibs.ld' -print0 | xargs -0 rm -f
-	find $(TARGET_DIR)/usr/lib/perl5/ -name '*.bs' -print0 | xargs -0 rm -f
-	find $(TARGET_DIR)/usr/lib/perl5/ -name '.packlist' -print0 | xargs -0 rm -f
 	$(STRIP_FIND_CMD) | xargs $(STRIPCMD) 2>/dev/null || true
 	if test -d $(TARGET_DIR)/lib/modules; then \
 		find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index e4aad7f..e01570e 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -122,3 +122,15 @@ endef
 PERL_POST_INSTALL_STAGING_HOOKS += PERL_ADD_CORE_H
 
 $(eval $(generic-package))
+
+define PERL_FINALIZE_TARGET
+	rm -rf $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/pod
+	rm -rf $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE
+	find $(TARGET_DIR)/usr/lib/perl5/ -name 'extralibs.ld' -print0 | xargs -0 rm -f
+	find $(TARGET_DIR)/usr/lib/perl5/ -name '*.bs' -print0 | xargs -0 rm -f
+	find $(TARGET_DIR)/usr/lib/perl5/ -name '.packlist' -print0 | xargs -0 rm -f
+	find $(TARGET_DIR)/usr/lib/perl5/ -name 'autosplit.ix' -print0 | xargs -0 rm -f
+endef
+
+TARGET_FINALIZE_HOOKS += PERL_FINALIZE_TARGET
+
-- 
1.9.1
