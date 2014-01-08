From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  8 Jan 2014 13:27:27 +0100
Subject: [Buildroot] [PATCH 2/2] perl-cross: workaround with PERL5LIB no
	longer needed
In-Reply-To: <1389184048-21247-1-git-send-email-francois.perrad@gadz.org>
References: <1389184048-21247-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1389184048-21247-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.mk |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index bf8eac2..ec94e4f 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -82,14 +82,12 @@ define PERL_CONFIGURE_CMDS
 	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
 endef
 
-# perlcross's miniperl_top forgets base, which is required by mktables.
-# Instead of patching, it's easier to just set PERL5LIB
 define PERL_BUILD_CMDS
-	PERL5LIB=$(@D)/dist/base/lib $(MAKE1) -C $(@D) all
+	$(MAKE1) -C $(@D) all
 endef
 
 define PERL_INSTALL_STAGING_CMDS
-	PERL5LIB=$(@D)/dist/base/lib $(MAKE1) -C $(@D) DESTDIR="$(STAGING_DIR)" install.perl
+	$(MAKE1) -C $(@D) DESTDIR="$(STAGING_DIR)" install.perl
 endef
 
 PERL_INSTALL_TARGET_GOALS = install.perl
@@ -99,7 +97,7 @@ endif
 
 
 define PERL_INSTALL_TARGET_CMDS
-	PERL5LIB=$(@D)/dist/base/lib $(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" $(PERL_INSTALL_TARGET_GOALS)
+	$(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" $(PERL_INSTALL_TARGET_GOALS)
 endef
 
 $(eval $(generic-package))
-- 
1.7.9.5
