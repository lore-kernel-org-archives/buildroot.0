From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Fri, 28 Oct 2016 10:18:24 -0300
Subject: [Buildroot] [PATCH 06/11] perl: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1477660709-5935-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1477660709-5935-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1477660709-5935-6-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/perl/perl.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index a8768b2..b19fa78 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -81,20 +81,21 @@ PERL_CONF_OPTS += --only-mod=$(subst $(space),$(comma),$(PERL_MODULES))
 endif
 
 define PERL_CONFIGURE_CMDS
-	(cd $(@D); HOSTCC='$(HOSTCC_NOCCACHE)' ./configure $(PERL_CONF_OPTS))
+	(cd $(@D); HOSTCC='$(HOSTCC_NOCCACHE)' $(TARGET_MAKE_ENV) \
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
-- 
2.7.3
