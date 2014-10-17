From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Oct 2014 14:17:48 +0200
Subject: [Buildroot] [git commit] perl: add host variant
Message-ID: <20141017121829.2D184B328C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43f69458aef4987c6c59a45f75ffaec53d397d8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.mk |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

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
