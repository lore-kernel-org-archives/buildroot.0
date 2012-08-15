From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 15 Aug 2012 16:38:29 +0200
Subject: [Buildroot] [PATCH 07/12] microperl: improve configure step on
	64bits platform
In-Reply-To: <1345041514-31539-1-git-send-email-francois.perrad@gadz.org>
References: <1345041514-31539-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1345041514-31539-7-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

use uconfig64.sh instead of uconfig.sh

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/microperl/microperl.mk |   74 ++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 33 deletions(-)

diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index 8cd1a42..aaa47be 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -15,6 +15,18 @@ MICROPERL_MODS_DIR = /usr/lib/perl5/$(MICROPERL_VERSION)
 MICROPERL_ARCH_DIR = $(MICROPERL_MODS_DIR)/$(GNU_TARGET_NAME)
 MICROPERL_MODS = $(call qstrip,$(BR2_PACKAGE_MICROPERL_MODULES))
 
+ifeq ($(BR2_ARCH_IS_64),y)
+MICROPERL_UCONFIG_SH = $(@D)/uconfig64.sh
+define MICROPERL_REGEN_CONFIG
+	$(MAKE) -C $(@D) -f Makefile.micro regen_uconfig64
+endef
+else
+MICROPERL_UCONFIG_SH = $(@D)/uconfig.sh
+define MICROPERL_REGEN_CONFIG
+	$(MAKE) -C $(@D) -f Makefile.micro regen_uconfig
+endef
+endif
+
 # Minimal set of modules required for 'perl -V' to work
 MICROPERL_ARCH_MODS = Config.pm Config_git.pl Config_heavy.pl
 MICROPERL_BASE_MODS = strict.pm vars.pm warnings.pm warnings/register.pm
@@ -84,60 +96,56 @@ endef
 
 ifeq ($(BR2_ENDIAN),"BIG")
 define MICROPERL_BIGENDIAN
-	$(SED) '/^byteorder=/d' $(@D)/uconfig.sh
-	echo "byteorder='4321'" >>$(@D)/uconfig.sh
+	$(SED) '/^byteorder=/d' $(MICROPERL_UCONFIG_SH)
+	echo "byteorder='4321'" >>$(MICROPERL_UCONFIG_SH)
 endef
 endif
 
 ifeq ($(BR2_LARGEFILE),y)
 define MICROPERL_LARGEFILE
-	$(SED) '/^uselargefiles=/d' $(@D)/uconfig.sh
-	echo "uselargefiles='define'" >>$(@D)/uconfig.sh
+	$(SED) '/^uselargefiles=/d' $(MICROPERL_UCONFIG_SH)
+	echo "uselargefiles='define'" >>$(MICROPERL_UCONFIG_SH)
 endef
 endif
 
 ifeq ($(BR2_USE_WCHAR),y)
 define MICROPERL_WCHAR
 	$(SED) '/^d_mbstowcs=/d' -e '/^d_mbtowc=/d' -e '/^d_wcstombs=/d' \
-		-e '/^d_wctomb=/d' $(@D)/uconfig.sh
-	echo "d_mbstowcs='define'" >>$(@D)/uconfig.sh
-	echo "d_mbtowc='define'" >>$(@D)/uconfig.sh
-	echo "d_wcstombs='define'" >>$(@D)/uconfig.sh
-	echo "d_wctomb='define'" >>$(@D)/uconfig.sh
+		-e '/^d_wctomb=/d' $(MICROPERL_UCONFIG_SH)
+	echo "d_mbstowcs='define'" >>$(MICROPERL_UCONFIG_SH)
+	echo "d_mbtowc='define'" >>$(MICROPERL_UCONFIG_SH)
+	echo "d_wcstombs='define'" >>$(MICROPERL_UCONFIG_SH)
+	echo "d_wctomb='define'" >>$(MICROPERL_UCONFIG_SH)
 endef
 endif
 
 define MICROPERL_CONFIGURE_CMDS
 	$(SED) '/^archlib=/d' -e '/^archlibexp=/d' -e '/^optimize=/d' \
 		-e '/^archname=/d' -e '/^d_poll=/d' -e '/^i_poll=/d' \
-		-e '/^osname=/d' -e '/^u32type=/d' -e '/^d_archlib=/d' \
-		-e '/^d_memset=/d' -e '/^i_fcntl=/d' -e '/^useperlio=/d' \
-		-e '/^need_va_copy=/d' $(@D)/uconfig.sh
-	$(SED) 's/5\.$(MICROPERL_VERSION_MAJOR)/$(MICROPERL_VERSION)/' $(@D)/uconfig.sh
-	echo "archlib='$(MICROPERL_ARCH_DIR)'" >>$(@D)/uconfig.sh
-	echo "archlibexp='$(MICROPERL_ARCH_DIR)'" >>$(@D)/uconfig.sh
-	echo "d_archlib='define'" >>$(@D)/uconfig.sh
-	echo "archname='$(GNU_TARGET_NAME)'" >>$(@D)/uconfig.sh
-	echo "osname='linux'" >>$(@D)/uconfig.sh
-	echo "cc='$(TARGET_CC)'" >>$(@D)/uconfig.sh
-	echo "ccflags='$(TARGET_CFLAGS)'" >>$(@D)/uconfig.sh
-	echo "optimize='$(TARGET_CFLAGS)'" >>$(@D)/uconfig.sh
-	echo "usecrosscompile='define'" >>$(@D)/uconfig.sh
-	echo "d_memset='define'" >>$(@D)/uconfig.sh
-	echo "i_fcntl='define'" >>$(@D)/uconfig.sh
-	echo "useperlio='define'" >>$(@D)/uconfig.sh
-	echo "u32type='unsigned int'" >>$(@D)/uconfig.sh
-	echo "need_va_copy='define'" >>$(@D)/uconfig.sh
-	echo "d_poll='define'" >>$(@D)/uconfig.sh
-	echo "i_poll='define'" >>$(@D)/uconfig.sh
-	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
-	$(SED) 's/local\///' $(@D)/uconfig.sh
+		-e '/^osname=/d' -e '/^d_archlib=/d' -e '/^i_fcntl=/d' \
+		-e '/^useperlio=/d' $(MICROPERL_UCONFIG_SH)
+	$(SED) 's/5\.$(MICROPERL_VERSION_MAJOR)/$(MICROPERL_VERSION)/' $(MICROPERL_UCONFIG_SH)
+	echo "archlib='$(MICROPERL_ARCH_DIR)'" >>$(MICROPERL_UCONFIG_SH)
+	echo "archlibexp='$(MICROPERL_ARCH_DIR)'" >>$(MICROPERL_UCONFIG_SH)
+	echo "d_archlib='define'" >>$(MICROPERL_UCONFIG_SH)
+	echo "archname='$(GNU_TARGET_NAME)'" >>$(MICROPERL_UCONFIG_SH)
+	echo "osname='linux'" >>$(MICROPERL_UCONFIG_SH)
+	echo "cc='$(TARGET_CC)'" >>$(MICROPERL_UCONFIG_SH)
+	echo "ccflags='$(TARGET_CFLAGS)'" >>$(MICROPERL_UCONFIG_SH)
+	echo "optimize='$(TARGET_CFLAGS)'" >>$(MICROPERL_UCONFIG_SH)
+	echo "usecrosscompile='define'" >>$(MICROPERL_UCONFIG_SH)
+	echo "i_fcntl='define'" >>$(MICROPERL_UCONFIG_SH)
+	echo "useperlio='define'" >>$(MICROPERL_UCONFIG_SH)
+	echo "d_poll='define'" >>$(MICROPERL_UCONFIG_SH)
+	echo "i_poll='define'" >>$(MICROPERL_UCONFIG_SH)
 	$(MICROPERL_BIGENDIAN)
 	$(MICROPERL_LARGEFILE)
 	$(MICROPERL_WCHAR)
-	$(MAKE) -C $(@D) -f Makefile.micro regen_uconfig
+	$(SED) 's/local\///' $(MICROPERL_UCONFIG_SH)
+	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
+	$(MICROPERL_REGEN_CONFIG)
 	cp -f $(@D)/uconfig.h $(@D)/config.h
-	cp -f $(@D)/uconfig.sh $(@D)/config.sh
+	cp -f $(MICROPERL_UCONFIG_SH) $(@D)/config.sh
 	echo "ccname='$(TARGET_CC)'" >>$(@D)/config.sh
 	echo "PERL_CONFIG_SH=true" >>$(@D)/config.sh
 	touch $(@D)/config.h    # avoid warning : out of date
-- 
1.7.9.5
