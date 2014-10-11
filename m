From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 11 Oct 2014 08:36:43 +0200
Subject: [Buildroot] [V2 2/4] perl: add host variant
In-Reply-To: <1413009405-13870-1-git-send-email-francois.perrad@gadz.org>
References: <1413009405-13870-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1413009405-13870-3-git-send-email-francois.perrad@gadz.org>
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
index 1816a9e..16a8d68 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -126,7 +126,25 @@ endef
 
 PERL_POST_INSTALL_STAGING_HOOKS += PERL_ADD_CORE_H
 
+HOST_PERL_CONF_OPTS = \
+	-des \
+	-Dprefix="$(HOST_DIR)/usr" \
+	-Dcc="$(HOSTCC)"
+
+define HOST_PERL_CONFIGURE_CMDS
+	(cd $(@D); HOSTCC='$(HOSTCC_NOCACHE)' ./Configure $(HOST_PERL_CONF_OPTS))
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
