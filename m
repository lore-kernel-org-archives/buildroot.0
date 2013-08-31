From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 21:34:01 -0000
Subject: [Buildroot] [git commit] perl-cross: bump to version 0.7.4
Message-ID: <20130831213336.CBA499B5D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1808f90378360850831eb9291ef1d799bd41c6a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

since 0.7.3: install paths adjusted to match mainline perl

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cpanminus/cpanminus.mk |   12 ++++++------
 package/perl/perl.mk           |    2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/cpanminus/cpanminus.mk b/package/cpanminus/cpanminus.mk
index 60a72ee..52921b5 100644
--- a/package/cpanminus/cpanminus.mk
+++ b/package/cpanminus/cpanminus.mk
@@ -11,9 +11,9 @@ CPANMINUS_DEPENDENCIES = host-qemu perl $(call qstrip,$(BR2_PACKAGE_CPANMINUS_NA
 
 CPANMINUS_RUN_PERL = $(QEMU_USER) $(STAGING_DIR)/usr/bin/perl
 CPANMINUS_ARCHNAME = $(shell $(CPANMINUS_RUN_PERL) -MConfig -e "print Config->{archname}")
-CPANMINUS_PERL_LIB      = $(STAGING_DIR)/usr/lib/perl
-CPANMINUS_PERL_SITELIB  = $(TARGET_DIR)/usr/lib/perl
-CPANMINUS_PERL_ARCHLIB  = $(CPANMINUS_PERL_LIB)/$(CPANMINUS_ARCHNAME)
+CPANMINUS_PERL_LIB      = $(STAGING_DIR)/usr/lib/perl5
+CPANMINUS_PERL_SITELIB  = $(TARGET_DIR)/usr/lib/perl5/site_perl/$(PERL_VERSION)
+CPANMINUS_PERL_ARCHLIB  = $(CPANMINUS_PERL_LIB)/$(PERL_VERSION)/$(CPANMINUS_ARCHNAME)
 CPANMINUS_PERL_SITEARCH = $(CPANMINUS_PERL_SITELIB)/$(CPANMINUS_ARCHNAME)
 CPANMINUS_PERL5LIB = $(CPANMINUS_PERL_SITEARCH):$(CPANMINUS_PERL_SITELIB):$(CPANMINUS_PERL_ARCHLIB):$(CPANMINUS_PERL_LIB)
 ifneq ($(BR2_PACKAGE_CPANMINUS_MIRROR),"")
@@ -27,8 +27,8 @@ define CPANMINUS_INSTALL_TARGET_CMDS
 	echo "PERL5LIB=$(CPANMINUS_PERL5LIB) $(CPANMINUS_RUN_PERL) \"\$$@\""    >>$(@D)/run_perl
 	chmod +x $(@D)/run_perl
 	PERL5LIB=$(CPANMINUS_PERL5LIB) \
-	PERL_MM_OPT="DESTDIR=$(CPANMINUS_PERL_SITELIB) PERL=$(@D)/run_perl PERL_LIB=$(CPANMINUS_PERL_LIB) PERL_ARCHLIB=$(CPANMINUS_PERL_ARCHLIB)" \
-	PERL_MB_OPT="--destdir $(CPANMINUS_PERL_SITELIB)" \
+	PERL_MM_OPT="DESTDIR=$(TARGET_DIR) PERL=$(@D)/run_perl PERL_LIB=$(CPANMINUS_PERL_LIB) PERL_ARCHLIB=$(CPANMINUS_PERL_ARCHLIB)" \
+	PERL_MB_OPT="--destdir $(TARGET_DIR)" \
 	RUN_PERL="$(@D)/run_perl" \
 	$(CPANMINUS_RUN_PERL) $(@D)/cpanm \
 		--perl=$(@D)/run_perl \
@@ -36,7 +36,7 @@ define CPANMINUS_INSTALL_TARGET_CMDS
 		--no-man-pages \
 		$(CPANMINUS_MIRROR) \
 		$(call qstrip,$(BR2_PACKAGE_CPANMINUS_MODULES))
-	-find $(CPANMINUS_PERL_SITEARCH) -type f -name *.bs -exec rm -f {} \;
+	-find $(CPANMINUS_PERL_SITELIB) -type f -name *.bs -exec rm -f {} \;
 endef
 else
 define CPANMINUS_INSTALL_TARGET_CMDS
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 5afaaaf..37a38f7 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -12,7 +12,7 @@ PERL_LICENSE = Artistic
 PERL_LICENSE_FILES = Artistic
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 0.7.2
+PERL_CROSS_VERSION = 0.7.4
 PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).3
 PERL_CROSS_SITE    = http://download.berlios.de/perlcross
 PERL_CROSS_SOURCE  = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
