From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 12:17:19 -0800
Subject: [Buildroot] [git commit] cpanminus: fix installation paths
Message-ID: <20121203145717.0471681E08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4fbc4202ea47829396bc446e84fd85153513974
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

perlcross seems to set the installation paths differently than perl's
Configure, so adapt the reference to these paths in cpanminus.

[Francois: install into /usr/lib/perl]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cpanminus/cpanminus.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

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
