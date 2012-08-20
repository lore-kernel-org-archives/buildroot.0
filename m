From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 20 Aug 2012 10:55:09 +0200
Subject: [Buildroot] [PATCH 10/10] microperl: compatible with cpanminus
In-Reply-To: <1345452909-15756-1-git-send-email-francois.perrad@gadz.org>
References: <1345452909-15756-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1345452909-15756-10-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in              |    2 +-
 package/microperl/microperl.mk |    5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index bb8c80d..986fc89 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -263,7 +263,7 @@ source "package/xavante/Config.in"
 endmenu
 endif
 source "package/perl/Config.in"
-if BR2_PACKAGE_PERL || BR2_PACKAGE_MINIPERL
+if BR2_PACKAGE_PERL || BR2_PACKAGE_MINIPERL || BR2_PACKAGE_MICROPERL
 menu "Perl libraries/modules"
 source "package/cpanminus/Config.in"
 endmenu
diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index a3d1018..f512fae 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -108,11 +108,15 @@ define MICROPERL_CONFIGURE_CMDS
 	$(SED) '/^archlib=/d' -e '/^archlibexp=/d' -e '/^optimize=/d' \
 		-e '/^archname=/d' -e '/^d_poll=/d' -e '/^i_poll=/d' \
 		-e '/^osname=/d' -e '/^d_archlib=/d' -e '/^i_fcntl=/d' \
+		-e '/^sitelib=/d' -e '/^sitelibexp=/d' \
 		-e '/^useperlio=/d' $(MICROPERL_UCONFIG_SH)
 	$(SED) 's/5\.$(MICROPERL_VERSION_MAJOR)/$(MICROPERL_VERSION)/' $(MICROPERL_UCONFIG_SH)
+	$(SED) 's/local\///' $(MICROPERL_UCONFIG_SH)
 	echo "archlib='$(MICROPERL_ARCH_DIR)'" >>$(MICROPERL_UCONFIG_SH)
 	echo "archlibexp='$(MICROPERL_ARCH_DIR)'" >>$(MICROPERL_UCONFIG_SH)
 	echo "d_archlib='define'" >>$(MICROPERL_UCONFIG_SH)
+	echo "sitelib='/usr/local/lib/perl5'" >>$(MICROPERL_UCONFIG_SH)
+	echo "sitelibexp='/usr/local/lib/perl5'" >>$(MICROPERL_UCONFIG_SH)
 	echo "archname='$(GNU_TARGET_NAME)'" >>$(MICROPERL_UCONFIG_SH)
 	echo "osname='linux'" >>$(MICROPERL_UCONFIG_SH)
 	echo "cc='$(TARGET_CC)'" >>$(MICROPERL_UCONFIG_SH)
@@ -126,7 +130,6 @@ define MICROPERL_CONFIGURE_CMDS
 	$(MICROPERL_BIGENDIAN)
 	$(MICROPERL_LARGEFILE)
 	$(MICROPERL_WCHAR)
-	$(SED) 's/local\///' $(MICROPERL_UCONFIG_SH)
 	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
 	$(MICROPERL_REGEN_CONFIG)
 	cp -f $(@D)/uconfig.h $(@D)/config.h
-- 
1.7.9.5
