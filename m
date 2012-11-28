From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 28 Nov 2012 17:09:22 +0100
Subject: [Buildroot] [PATCHv3 for-next 6/6] cpanminus: fix installation paths
In-Reply-To: <1354118962-18601-1-git-send-email-arnout@mind.be>
References: <1354118962-18601-1-git-send-email-arnout@mind.be>
Message-ID: <1354118962-18601-6-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

perlcross seems to set the installation paths differently than perl's
Configure, so adapt the reference to these paths in cpanminus.

[Francois: install into /usr/lib/perl]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
v2: integrated Francois' patch, merged with this one
---
 package/cpanminus/cpanminus.mk |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cpanminus/cpanminus.mk b/package/cpanminus/cpanminus.mk
index af35e93..e7e3f29 100644
--- a/package/cpanminus/cpanminus.mk
+++ b/package/cpanminus/cpanminus.mk
@@ -11,8 +11,8 @@ CPANMINUS_DEPENDENCIES = host-qemu perl $(call qstrip,$(BR2_PACKAGE_CPANMINUS_NA
 
 CPANMINUS_RUN_PERL = $(QEMU_USER) $(STAGING_DIR)/usr/bin/perl
 CPANMINUS_ARCHNAME = $(shell $(CPANMINUS_RUN_PERL) -MConfig -e "print Config->{archname}")
-CPANMINUS_PERL_LIB      = $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)
-CPANMINUS_PERL_SITELIB  = $(TARGET_DIR)/usr/lib/perl5/site_perl/$(PERL_VERSION)
+CPANMINUS_PERL_LIB      = $(STAGING_DIR)/usr/lib/perl
+CPANMINUS_PERL_SITELIB  = $(TARGET_DIR)/usr/lib/perl
 CPANMINUS_PERL_ARCHLIB  = $(CPANMINUS_PERL_LIB)/$(CPANMINUS_ARCHNAME)
 CPANMINUS_PERL_SITEARCH = $(CPANMINUS_PERL_SITELIB)/$(CPANMINUS_ARCHNAME)
 CPANMINUS_PERL5LIB = $(CPANMINUS_PERL_SITEARCH):$(CPANMINUS_PERL_SITELIB):$(CPANMINUS_PERL_ARCHLIB):$(CPANMINUS_PERL_LIB)
@@ -27,8 +27,8 @@ define CPANMINUS_INSTALL_TARGET_CMDS
 	echo "PERL5LIB=$(CPANMINUS_PERL5LIB) $(CPANMINUS_RUN_PERL) \"\$$@\""    >>$(@D)/run_perl
 	chmod +x $(@D)/run_perl
 	PERL5LIB=$(CPANMINUS_PERL5LIB) \
-	PERL_MM_OPT="DESTDIR=$(TARGET_DIR) PERL=$(@D)/run_perl PERL_LIB=$(CPANMINUS_PERL_LIB) PERL_ARCHLIB=$(CPANMINUS_PERL_ARCHLIB)" \
-	PERL_MB_OPT="--destdir $(TARGET_DIR)" \
+	PERL_MM_OPT="DESTDIR=$(CPANMINUS_PERL_SITELIB) PERL=$(@D)/run_perl PERL_LIB=$(CPANMINUS_PERL_LIB) PERL_ARCHLIB=$(CPANMINUS_PERL_ARCHLIB)" \
+	PERL_MB_OPT="--destdir $(CPANMINUS_PERL_SITELIB)" \
 	RUN_PERL="$(@D)/run_perl" \
 	$(CPANMINUS_RUN_PERL) $(@D)/cpanm \
 		--perl=$(@D)/run_perl \
@@ -36,7 +36,7 @@ define CPANMINUS_INSTALL_TARGET_CMDS
 		--no-man-pages \
 		$(CPANMINUS_MIRROR) \
 		$(call qstrip,$(BR2_PACKAGE_CPANMINUS_MODULES))
-	find $(CPANMINUS_PERL_SITEARCH) -type f -name *.bs -exec rm -f {} \;
+	-find $(CPANMINUS_PERL_SITEARCH) -type f -name *.bs -exec rm -f {} \;
 endef
 else
 define CPANMINUS_INSTALL_TARGET_CMDS
-- 
1.7.10.4
