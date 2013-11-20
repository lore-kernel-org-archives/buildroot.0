From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 20 Nov 2013 18:01:51 +0100
Subject: [Buildroot] [pkg-perl infra 03/12] cpanminus: remove it
In-Reply-To: <1384966920-9454-1-git-send-email-francois.perrad@gadz.org>
References: <1384966920-9454-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1384966920-9454-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in              |    1 -
 package/cpanminus/Config.in    |   40 ----------------------------------
 package/cpanminus/cpanminus.mk |   47 ----------------------------------------
 3 files changed, 88 deletions(-)
 delete mode 100644 package/cpanminus/Config.in
 delete mode 100644 package/cpanminus/cpanminus.mk

diff --git a/package/Config.in b/package/Config.in
index 3f7bb3e..8ae83f9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -381,7 +381,6 @@ source "package/nodejs/Config.in"
 source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
-source "package/cpanminus/Config.in"
 source "package/cpan/Config.in"
 endmenu
 endif
diff --git a/package/cpanminus/Config.in b/package/cpanminus/Config.in
deleted file mode 100644
index b10d211..0000000
--- a/package/cpanminus/Config.in
+++ /dev/null
@@ -1,40 +0,0 @@
-config BR2_PACKAGE_CPANMINUS
-	bool "cpanminus"
-	# Requires host-qemu, which cannot work properly due to kernel
-	# headers mismatch between the build environment and the
-	# target.
-	depends on BR2_BROKEN
-	help
-	  cpanminus is a script to get, unpack, build and install Perl modules
-	  from CPAN.
-
-	  Why? It's dependency free, requires zero configuration, and stands
-	  alone. When running, it requires only 10MB of RAM.
-
-	  http://github.com/miyagawa/cpanminus
-
-if BR2_PACKAGE_CPANMINUS
-
-config BR2_PACKAGE_CPANMINUS_MIRROR
-	string "mirror"
-	help
-	  Specifies the base URL for the CPAN mirror to use,
-	  such as http://cpan.cpantesters.org/.
-
-config BR2_PACKAGE_CPANMINUS_MODULES
-	string "Perl modules from CPAN"
-	default "Curses::UI"
-	help
-	  List of space-separated Perl modules to install from CPAN.
-
-	  Examples: Try::Tiny Dancer YAML Moo
-
-	  Install the listed modules and their dependencies.
-
-config BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES
-	string "native dependencies"
-	default "ncurses"
-	help
-	  Some XS modules require native libraries.
-
-endif
diff --git a/package/cpanminus/cpanminus.mk b/package/cpanminus/cpanminus.mk
deleted file mode 100644
index b315388..0000000
--- a/package/cpanminus/cpanminus.mk
+++ /dev/null
@@ -1,47 +0,0 @@
-################################################################################
-#
-# cpanminus
-#
-################################################################################
-
-CPANMINUS_VERSION = 1.6109
-CPANMINUS_SOURCE = $(CPANMINUS_VERSION).tar.gz
-CPANMINUS_SITE = https://github.com/miyagawa/cpanminus/archive
-CPANMINUS_DEPENDENCIES = host-qemu perl $(call qstrip,$(BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES))
-
-CPANMINUS_RUN_PERL = $(QEMU_USER) $(STAGING_DIR)/usr/bin/perl
-CPANMINUS_ARCHNAME = $(shell $(CPANMINUS_RUN_PERL) -MConfig -e "print Config->{archname}")
-CPANMINUS_PERL_LIB      = $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)
-CPANMINUS_PERL_SITELIB  = $(TARGET_DIR)/usr/lib/perl5/site_perl/$(PERL_VERSION)
-CPANMINUS_PERL_ARCHLIB  = $(CPANMINUS_PERL_LIB)/$(CPANMINUS_ARCHNAME)
-CPANMINUS_PERL_SITEARCH = $(CPANMINUS_PERL_SITELIB)/$(CPANMINUS_ARCHNAME)
-CPANMINUS_PERL5LIB = $(CPANMINUS_PERL_SITEARCH):$(CPANMINUS_PERL_SITELIB):$(CPANMINUS_PERL_ARCHLIB):$(CPANMINUS_PERL_LIB)
-ifneq ($(BR2_PACKAGE_CPANMINUS_MIRROR),"")
-    CPANMINUS_MIRROR = --mirror $(call qstrip,$(BR2_PACKAGE_CPANMINUS_MIRROR)) --mirror-only
-endif
-CPANMINUS_MODULES = $(call qstrip,$(BR2_PACKAGE_CPANMINUS_MODULES))
-
-ifneq ($(CPANMINUS_MODULES),)
-define CPANMINUS_INSTALL_TARGET_CMDS
-	echo "#!/bin/sh"                                                        > $(@D)/run_perl
-	echo "PERL5LIB=$(CPANMINUS_PERL5LIB) $(CPANMINUS_RUN_PERL) \"\$$@\""    >>$(@D)/run_perl
-	chmod +x $(@D)/run_perl
-	PERL5LIB=$(CPANMINUS_PERL5LIB) \
-	PERL_MM_OPT="DESTDIR=$(TARGET_DIR) PERL=$(@D)/run_perl PERL_LIB=$(CPANMINUS_PERL_LIB) PERL_ARCHLIB=$(CPANMINUS_PERL_ARCHLIB)" \
-	PERL_MB_OPT="--destdir $(TARGET_DIR)" \
-	RUN_PERL="$(@D)/run_perl" \
-	$(CPANMINUS_RUN_PERL) $(@D)/cpanm \
-		--perl=$(@D)/run_perl \
-		--notest \
-		--no-man-pages \
-		$(CPANMINUS_MIRROR) \
-		$(call qstrip,$(BR2_PACKAGE_CPANMINUS_MODULES))
-	-find $(CPANMINUS_PERL_SITELIB) -type f -name *.bs -exec rm -f {} \;
-endef
-else
-define CPANMINUS_INSTALL_TARGET_CMDS
-	@echo "No modules to install"
-endef
-endif
-
-$(eval $(generic-package))
-- 
1.7.9.5
