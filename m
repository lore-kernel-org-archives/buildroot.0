From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 15 Aug 2012 16:38:34 +0200
Subject: [Buildroot] [PATCH 12/12] cpanminus: new package
In-Reply-To: <1345041514-31539-1-git-send-email-francois.perrad@gadz.org>
References: <1345041514-31539-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1345041514-31539-12-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

and adjust sitelib in perl & microperl

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in              |    5 +++++
 package/cpanminus/Config.in    |   24 ++++++++++++++++++++++++
 package/cpanminus/cpanminus.mk |   37 +++++++++++++++++++++++++++++++++++++
 package/microperl/microperl.mk |    5 ++++-
 package/perl/perl.mk           |   12 ++++++++++++
 5 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 package/cpanminus/Config.in
 create mode 100644 package/cpanminus/cpanminus.mk

diff --git a/package/Config.in b/package/Config.in
index 1b8237d..986fc89 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -263,6 +263,11 @@ source "package/xavante/Config.in"
 endmenu
 endif
 source "package/perl/Config.in"
+if BR2_PACKAGE_PERL || BR2_PACKAGE_MINIPERL || BR2_PACKAGE_MICROPERL
+menu "Perl libraries/modules"
+source "package/cpanminus/Config.in"
+endmenu
+endif
 source "package/miniperl/Config.in"
 source "package/microperl/Config.in"
 source "package/php/Config.in"
diff --git a/package/cpanminus/Config.in b/package/cpanminus/Config.in
new file mode 100644
index 0000000..9db7b2e
--- /dev/null
+++ b/package/cpanminus/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_CPANMINUS
+	bool "cpanminus"
+	help
+	  cpanminus is a script to get, unpack, build and install Perl modules
+	  from CPAN.
+
+	  Why? It's dependency free, requires zero configuration, and stands
+	  alone. When running, it requires only 10MB of RAM.
+
+	  http://github.com/miyagawa/cpanminus
+
+if BR2_PACKAGE_CPANMINUS
+
+config BR2_PACKAGE_CPANMINUS_MODULES
+	string "Perl modules from CPAN"
+	help
+	  List of space-separated Perl modules to install from CPAN.
+
+	  Examples: Try::Tiny Dancer YAML Moo
+
+	  Install the listed modules and their dependencies.
+	  cpanm run on host, so you cannot use it for XS modules.
+
+endif
diff --git a/package/cpanminus/cpanminus.mk b/package/cpanminus/cpanminus.mk
new file mode 100644
index 0000000..6df9f73
--- /dev/null
+++ b/package/cpanminus/cpanminus.mk
@@ -0,0 +1,37 @@
+#############################################################
+#
+# cpanminus
+#
+#############################################################
+
+CPANMINUS_VERSION = 1.5017
+CPANMINUS_SITE = http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA
+CPANMINUS_SOURCE = App-cpanminus-$(CPANMINUS_VERSION).tar.gz
+CPANMINUS_DEPENDENCIES = host-perl host-cpanminus
+CPANMINUS_MODS = $(call qstrip,$(BR2_PACKAGE_CPANMINUS_MODULES))
+
+define HOST_CPANMINUS_CONFIGURE_CMDS
+	cd $(@D); $(HOST_DIR)/usr/bin/perl Makefile.PL
+endef
+
+define HOST_CPANMINUS_INSTALL_CMDS
+	$(MAKE) -C $(@D) install
+endef
+
+define CPANMINUS_INSTALL_TARGET_CMDS
+	for i in $(CPANMINUS_MODS); do \
+		cd $(@D); $(HOST_DIR)/usr/bin/cpanm -L $(TARGET_DIR)/usr/local $$i; \
+	done
+	# show XS modules
+	find $(TARGET_DIR)/usr/local/lib/perl5 -name *.so -print
+	# remove XS modules
+	rm -Rf $(TARGET_DIR)/usr/local/lib/perl5/$(shell $(HOST_DIR)/usr/bin/perl -MConfig -e "print Config->{archname}")
+	# fix shebang
+	touch $(TARGET_DIR)/usr/local/bin/dummy
+	for i in $(TARGET_DIR)/usr/local/bin/*; do \
+		$(SED) 's/$(subst /,\/,$(HOST_DIR))//' $$i; \
+	done
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index f130666..544702f 100644
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
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index a7b94e0..dc67dd0 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -81,6 +81,7 @@ define PERL_CONFIGURE_COMMON
 		-Dlibc=$(TARGET_HOST)/usr/$(GNU_TARGET_NAME)/sysroot/lib/libc.so \
 		-Duseshrplib \
 		-Dprefix=/usr \
+		-Dsitelib=/usr/local/lib/perl5 \
 		-Uoptimize \
 		$(PERL_USE_DEVEL) \
 		$(call qstrip,$(BR2_PACKAGE_PERL_CUSTOM_CONFIGURE))
@@ -113,9 +114,20 @@ define PERL_CONFIGURE_CMDS
 	$(INSTALL) -m 755 $(HOST_DIR)/usr/bin/generate_uudmap $(@D)/generate_uudmap
 endef
 
+# example of hack for XS module (cpanminus handles only pure Perl modules)
+#define PERL_HACK_4_XS_MODULES
+#	cd $(@D)/cpan; tar xfz $(BUILDROOT_DL_DIR)/HTML-Parser-3.69.tar.gz
+#endef
+
+PERL_PRE_CONFIGURE_HOOKS += PERL_HACK_4_XS_MODULES
+
 define PERL_BUILD_CMDS
 	$(MAKE) RUN_PERL=$(HOST_DIR)/usr/bin/perl \
 		-C $(@D) all
+# example of hack for XS module
+#	cd $(@D); \
+#		$(HOST_DIR)/usr/bin/perl -Ilib make_ext.pl MAKE="$(MAKE)" LIBPERL_A=libperl.a LINKTYPE=dynamic \
+#			HTML-Parser-3.69
 endef
 
 define PERL_INSTALL_STAGING_CMDS
-- 
1.7.9.5
