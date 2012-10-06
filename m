From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  6 Oct 2012 15:53:50 +0200
Subject: [Buildroot] [PATCH v9 07/10] perl: add option "custom install"
In-Reply-To: <1349531633-26717-1-git-send-email-francois.perrad@gadz.org>
References: <1349531633-26717-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1349531633-26717-7-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

allows same behaviour (and footprint) as microperl

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cpanminus/Config.in |    4 ++++
 package/perl/Config.in      |   16 ++++++++++++++++
 package/perl/perl.mk        |   37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/package/cpanminus/Config.in b/package/cpanminus/Config.in
index b8b39dc..58fcb0c 100644
--- a/package/cpanminus/Config.in
+++ b/package/cpanminus/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CPANMINUS
 	bool "cpanminus"
+	depends on !BR2_PACKAGE_PERL_CUSTOM_INSTALL
 	help
 	  cpanminus is a script to get, unpack, build and install Perl modules
 	  from CPAN.
@@ -34,3 +35,6 @@ config BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES
 	  Some XS modules require native libraries.
 
 endif
+
+comment "cpanminus requires a fully installed perl"
+	depends on BR2_PACKAGE_PERL_CUSTOM_INSTALL
diff --git a/package/perl/Config.in b/package/perl/Config.in
index 6369243..dcd4b58 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -17,6 +17,22 @@ config BR2_PACKAGE_PERL
 
 if BR2_PACKAGE_PERL
 
+config BR2_PACKAGE_PERL_CUSTOM_INSTALL
+	bool "custom install"
+	help
+	  Don't use the full install target
+	  Install only a selection of modules (like microperl).
+
+config BR2_PACKAGE_PERL_MODULES
+	string "additional modules"
+	depends on BR2_PACKAGE_PERL_CUSTOM_INSTALL
+	help
+	  List of space-separated perl modules to copy to the rootfs.
+
+	  Examples: constant.pm Getopt/Std.pm Time/Local.pm
+
+	  Module dependencies are not automatic so check your needs.
+
 config BR2_PACKAGE_PERL_DB_FILE
 	bool "DB_File"
 	select BR2_PACKAGE_BERKELEYDB
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 0f12044..1fee4e0 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -85,12 +85,49 @@ define PERL_INSTALL_STAGING_CMDS
 		-C $(@D) install.perl
 endef
 
+PERL_RUN_PERL = $(QEMU_USER) $(@D)/perl -Ilib
+PERL_ARCHNAME = $(shell $(PERL_RUN_PERL) -MConfig -e "print Config->{archname}")
+PERL_LIB = $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)
+PERL_ARCHLIB = $(PERL_LIB)/$(PERL_ARCHNAME)
+PERL_MODS = $(call qstrip,$(BR2_PACKAGE_PERL_MODULES))
+# Minimal set of modules required for 'perl -V' to work
+PERL_ARCH_MODS = Config.pm Config_git.pl Config_heavy.pl
+PERL_BASE_MODS = strict.pm vars.pm warnings.pm warnings/register.pm
+
+define PERL_INSTALL_MODULES
+	for i in $(PERL_ARCH_MODS); do \
+		$(INSTALL) -m 0644 -D $(@D)/lib/$$i $(PERL_ARCHLIB)/$$i; \
+	done
+	for i in $(PERL_BASE_MODS); do \
+		$(INSTALL) -m 0644 -D $(@D)/lib/$$i $(PERL_LIB)/$$i; \
+	done
+	for i in $(PERL_MODS); do \
+		j=`echo $$i|cut -d : -f 1` ; \
+		if [ -d $(@D)/lib/$$j ] ; then \
+			cp -af $(@D)/lib/$$j $(PERL_LIB) ; \
+		fi ; \
+		if [ -f $(@D)/lib/$$i ] ; then \
+			$(INSTALL) -m 0644 -D $(@D)/lib/$$i $(PERL_LIB)/$$i; \
+		fi ; \
+	done
+	# Remove test files
+	find $(PERL_LIB) -type f -name *.t -exec rm -f {} \;
+endef
+
+ifeq ($(BR2_PACKAGE_PERL_CUSTOM_INSTALL),y)
+define PERL_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/perl $(TARGET_DIR)/usr/bin/perl
+	$(INSTALL) -m 0755 -D $(@D)/libperl.so $(PERL_ARCHLIB)/CORE/libperl.so
+	$(PERL_INSTALL_MODULES)
+endef
+else
 define PERL_INSTALL_TARGET_CMDS
 	$(MAKE) INSTALL_DEPENDENCE= \
 		INSTALLFLAGS=-p \
 		DESTDIR="$(TARGET_DIR)" \
 		-C $(@D) install.perl
 endef
+endif
 
 define PERL_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
-- 
1.7.9.5
