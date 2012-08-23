From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 23 Aug 2012 10:14:20 +0200
Subject: [Buildroot] [PATCH 9/9] microperl: remove host-microperl
In-Reply-To: <1345709660-25443-1-git-send-email-francois.perrad@gadz.org>
References: <1345709660-25443-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1345709660-25443-9-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/microperl/microperl.mk |   24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index b601754..a3d1018 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -10,7 +10,7 @@ MICROPERL_SITE = http://www.cpan.org/src/5.0
 MICROPERL_SOURCE = perl-$(MICROPERL_VERSION).tar.bz2
 MICROPERL_LICENSE = Artistic
 MICROPERL_LICENSE_FILES = Artistic
-MICROPERL_DEPENDENCIES = host-microperl
+MICROPERL_DEPENDENCIES = host-perl
 MICROPERL_MODS_DIR = /usr/lib/perl5/$(MICROPERL_VERSION)
 MICROPERL_ARCH_DIR = $(MICROPERL_MODS_DIR)/$(GNU_TARGET_NAME)
 MICROPERL_MODS = $(call qstrip,$(BR2_PACKAGE_MICROPERL_MODULES))
@@ -79,21 +79,6 @@ ifeq ($(BR2_PACKAGE_MICROPERL_BUNDLE_CGI),y)
 MICROPERL_MODS += CGI CGI.pm
 endif
 
-# Host microperl is actually full-blown perl
-define HOST_MICROPERL_CONFIGURE_CMDS
-	cd $(@D) ; \
-	./Configure -Dcc="$(HOSTCC)" -Dprefix="$(HOST_DIR)/usr" \
-		-Dloclibpth='/lib /lib64 /usr/lib /usr/lib64' -des
-endef
-
-define HOST_MICROPERL_BUILD_CMDS
-	$(MAKE) -C $(@D)
-endef
-
-define HOST_MICROPERL_INSTALL_CMDS
-	$(MAKE) -C $(@D) install
-endef
-
 ifeq ($(BR2_ENDIAN),"BIG")
 define MICROPERL_BIGENDIAN
 	$(SED) '/^byteorder=/d' $(MICROPERL_UCONFIG_SH)
@@ -149,8 +134,8 @@ define MICROPERL_CONFIGURE_CMDS
 	echo "ccname='$(TARGET_CC)'" >>$(@D)/config.sh
 	echo "PERL_CONFIG_SH=true" >>$(@D)/config.sh
 	touch $(@D)/config.h    # avoid warning : out of date
-	cd $(@D) ; $(HOST_DIR)/usr/bin/perl make_patchnum.pl ; \
-	$(HOST_DIR)/usr/bin/perl configpm
+	cd $(@D) ; $(HOST_DIR)/usr/bin/perl$(PERL_VERSION) make_patchnum.pl ; \
+	$(HOST_DIR)/usr/bin/perl$(PERL_VERSION) configpm
 endef
 
 define MICROPERL_BUILD_CMDS
@@ -165,7 +150,7 @@ endef
 # We try to build anyway to avoid a huge black list
 # Just ignore make_ext.pl warning/errors
 define MICROPERL_BUILD_EXTENSIONS
-	cd $(@D); rm -f miniperl; ln -s $(HOST_DIR)/usr/bin/perl miniperl;
+	cd $(@D); rm -f miniperl; ln -s $(HOST_DIR)/usr/bin/perl$(PERL_VERSION) miniperl;
 	for i in $(MICROPERL_MODS); do \
 	cd $(@D); PERL5LIB=lib \
 		./miniperl make_ext.pl MAKE="$(MAKE)" --nonxs \
@@ -205,4 +190,3 @@ define MICROPERL_UNINSTALL_TARGET_CMDS
 endef
 
 $(eval $(generic-package))
-$(eval $(host-generic-package))
-- 
1.7.9.5
