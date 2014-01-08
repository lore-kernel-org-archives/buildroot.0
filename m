From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Jan 2014 22:34:32 +0100
Subject: [Buildroot] [git commit] perl-cross: workaround with PERL5LIB no
	longer needed
Message-ID: <20140108213640.21C3F9BD08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1bedb6b30bcc796fd0da70f269271c388b3965e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.mk |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

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
