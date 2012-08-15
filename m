From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 15 Aug 2012 16:38:33 +0200
Subject: [Buildroot] [PATCH 11/12] microperl: remove host-microperl
In-Reply-To: <1345041514-31539-1-git-send-email-francois.perrad@gadz.org>
References: <1345041514-31539-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1345041514-31539-11-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/microperl/microperl.mk |   18 +-----------------
 package/perl/perl.mk           |    3 +++
 2 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index e4846b4..f130666 100644
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
@@ -218,4 +203,3 @@ define MICROPERL_UNINSTALL_TARGET_CMDS
 endef
 
 $(eval $(generic-package))
-$(eval $(host-generic-package))
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 9fcba89..a7b94e0 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -20,6 +20,9 @@ endif
 ifneq ($(MINIPERL_VERSION), $(PERL_VERSION))
 $(error "MINIPERL_VERSION must be aligned with PERL_VERSION")
 endif
+ifneq ($(MICROPERL_VERSION), $(PERL_VERSION))
+$(error "MICROPERL_VERSION must be aligned with PERL_VERSION")
+endif
 
 # Host
 define HOST_PERL_CONFIGURE_CMDS
-- 
1.7.9.5
