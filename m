From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 19 Aug 2014 20:07:13 +0200
Subject: [Buildroot] [PATCH 1/6] perl: add host variant
Message-ID: <1408471638-4551-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 01e0166..78b77d8 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -121,7 +121,25 @@ endef
 
 PERL_POST_INSTALL_STAGING_HOOKS += PERL_ADD_CORE_H
 
+HOST_PERL_CONF_OPT = \
+	-des \
+	-Dprefix="$(HOST_DIR)/usr" \
+	-Dcc="$(HOSTCC)"
+
+define HOST_PERL_CONFIGURE_CMDS
+	(cd $(@D); HOSTCC='$(HOSTCC_NOCACHE)' ./Configure $(HOST_PERL_CONF_OPT))
+endef
+
+define HOST_PERL_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define HOST_PERL_INSTALL_CMDS
+	$(MAKE) -C $(@D) INSTALL_DEPENDENCE='' install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
 
 define PERL_FINALIZE_TARGET
 	rm -rf $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/pod
-- 
1.9.1
