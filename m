From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:53:03 +0200
Subject: [Buildroot] [git commit] perl: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161029135923.7B7857FEB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2072c96eece0dc521d3a0cf945276b7fa5c70780
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl/perl.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index a8768b2..56fc579 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -81,20 +81,21 @@ PERL_CONF_OPTS += --only-mod=$(subst $(space),$(comma),$(PERL_MODULES))
 endif
 
 define PERL_CONFIGURE_CMDS
-	(cd $(@D); HOSTCC='$(HOSTCC_NOCCACHE)' ./configure $(PERL_CONF_OPTS))
+	(cd $(@D); $(TARGET_MAKE_ENV) HOSTCC='$(HOSTCC_NOCCACHE)' \
+		./configure $(PERL_CONF_OPTS))
 	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
 endef
 
 define PERL_BUILD_CMDS
-	$(MAKE1) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) all
 endef
 
 define PERL_INSTALL_STAGING_CMDS
-	$(MAKE1) -C $(@D) DESTDIR="$(STAGING_DIR)" install.perl
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR="$(STAGING_DIR)" install.perl
 endef
 
 define PERL_INSTALL_TARGET_CMDS
-	$(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" install.perl
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" install.perl
 endef
 
 HOST_PERL_CONF_OPTS = \
