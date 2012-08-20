From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 20 Aug 2012 10:55:02 +0200
Subject: [Buildroot] [PATCH 03/10] cpanminus: new package
In-Reply-To: <1345452909-15756-1-git-send-email-francois.perrad@gadz.org>
References: <1345452909-15756-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1345452909-15756-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in              |    5 +++++
 package/cpanminus/Config.in    |   24 ++++++++++++++++++++++++
 package/cpanminus/cpanminus.mk |   37 +++++++++++++++++++++++++++++++++++++
 package/perl/perl.mk           |   12 ++++++++++++
 4 files changed, 78 insertions(+)
 create mode 100644 package/cpanminus/Config.in
 create mode 100644 package/cpanminus/cpanminus.mk

diff --git a/package/Config.in b/package/Config.in
index 1b8237d..bb8c80d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -263,6 +263,11 @@ source "package/xavante/Config.in"
 endmenu
 endif
 source "package/perl/Config.in"
+if BR2_PACKAGE_PERL || BR2_PACKAGE_MINIPERL
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
index 0000000..b55dd3f
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
+	cd $(@D); $(HOST_DIR)/usr/bin/perl$(PERL_VERSION) Makefile.PL
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
+	rm -Rf $(TARGET_DIR)/usr/local/lib/perl5/$(shell $(HOST_DIR)/usr/bin/perl$(PERL_VERSION) -MConfig -e "print Config->{archname}")
+	# fix shebang
+	touch $(TARGET_DIR)/usr/local/bin/dummy
+	for i in $(TARGET_DIR)/usr/local/bin/*; do \
+		$(SED) 's/$(subst /,\/,$(HOST_DIR))//' $$i; \
+	done
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index d2679bc..38e1167 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -41,6 +41,7 @@ define PERL_CONFIGURE_CMDS
 		-Dlibc=$(TARGET_HOST)/usr/$(GNU_TARGET_NAME)/sysroot/lib/libc.so \
 		-Duseshrplib \
 		-Dprefix=/usr \
+		-Dsitelib=/usr/local/lib/perl5 \
 		-Uoptimize \
 		$(PERL_USE_DEVEL) \
 		$(call qstrip,$(BR2_PACKAGE_PERL_CUSTOM_CONFIGURE))
@@ -65,8 +66,19 @@ define PERL_CONFIGURE_CMDS
 	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
 endef
 
+# example of hack for XS module (cpanminus handles only pure Perl modules)
+#define PERL_HACK_4_XS_MODULES
+#	cd $(@D)/cpan; tar xfz $(BUILDROOT_DL_DIR)/HTML-Parser-3.69.tar.gz
+#endef
+
+PERL_PRE_CONFIGURE_HOOKS += PERL_HACK_4_XS_MODULES
+
 define PERL_BUILD_CMDS
 	$(MAKE) -C $(@D) all
+# example of hack for XS module
+#	cd $(@D); \
+#		$(HOST_DIR)/usr/bin/perl$(PERL_VERSION) -Ilib make_ext.pl MAKE="$(MAKE)" LIBPERL_A=libperl.a LINKTYPE=dynamic \
+#			HTML-Parser-3.69
 endef
 
 define PERL_INSTALL_STAGING_CMDS
-- 
1.7.9.5
