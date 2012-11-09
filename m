From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri,  9 Nov 2012 20:34:04 +0100
Subject: [Buildroot] [PATCH 2/4] perl: substitute perlcross pod with
	perl-version-specific pod
In-Reply-To: <1352489646-30635-1-git-send-email-arnout@mind.be>
References: <1352489646-30635-1-git-send-email-arnout@mind.be>
Message-ID: <1352489646-30635-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

As suggested by Dan Pattison at ethertek ca.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/perl/perl.mk |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index f3c73dd..b84917b 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -13,8 +13,11 @@ PERL_LICENSE_FILES = Artistic
 PERL_INSTALL_STAGING = YES
 
 PERL_CROSS_VERSION = 0.7
+PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).0
 PERL_CROSS_SITE    = http://download.berlios.de/perlcross
-PERL_CROSS_SOURCE  = perl-5.$(PERL_VERSION_MAJOR).0-cross-$(PERL_CROSS_VERSION).tar.gz
+PERL_CROSS_SOURCE  = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
+PERL_CROSS_OLD_POD = perl$(subst .,,$(PERL_CROSS_BASE_VERSION))delta.pod
+PERL_CROSS_NEW_POD = perl$(subst .,,$(PERL_VERSION))delta.pod
 
 # We use the perlcross hack to cross-compile perl. It should
 # be extracted over the perl sources, so we don't define that
@@ -32,6 +35,11 @@ define PERL_CROSS_EXTRACT
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
+define PERL_CROSS_SET_POD
+	$(SED) s/$(PERL_CROSS_OLD_POD)/$(PERL_CROSS_NEW_POD)/g $(@D)/Makefile
+endef
+PERL_POST_PATCH_HOOKS += PERL_CROSS_SET_POD
+
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
     PERL_DEPENDENCIES += berkeleydb
 endif
-- 
1.7.10.4
