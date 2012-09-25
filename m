From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 25 Sep 2012 19:18:24 +0200
Subject: [Buildroot] [PATCH v8 08/11] perl: add option "custom install"
In-Reply-To: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1348593508-14254-8-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

allows same behaviour (and footprint) as microperl

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cpanminus/Config.in |    4 ++++
 package/perl/Config.in      |   16 +++++++++++++++
 package/perl/perl.mk        |   47 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)

diff --git a/package/cpanminus/Config.in b/package/cpanminus/Config.in
index 3b57ffd..d6ada47 100644
--- a/package/cpanminus/Config.in
+++ b/package/cpanminus/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CPANMINUS
 	bool "cpanminus"
+	depends on !BR2_PACKAGE_PERL_CUSTOM_INSTALL
 	help
 	  cpanminus is a script to get, unpack, build and install Perl modules
 	  from CPAN.
@@ -9,6 +10,9 @@ config BR2_PACKAGE_CPANMINUS
 
 	  http://github.com/miyagawa/cpanminus
 
+comment "cpanminus requires a fully installed perl"
+	depends on BR2_PACKAGE_PERL_CUSTOM_INSTALL
+
 if BR2_PACKAGE_CPANMINUS
 
 config BR2_PACKAGE_CPANMINUS_MIRROR
diff --git a/package/perl/Config.in b/package/perl/Config.in
index 8d8430d..ec0c60d 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -16,6 +16,22 @@ config BR2_PACKAGE_PERL_ONLY_MINIPERL
 	  Install only miniperl (without dynamic module loader)
 	  Usually used to bootstrap a full Perl (@INC contains only .).
 
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
 endif
 
 if BR2_PACKAGE_PERL && !BR2_PACKAGE_PERL_ONLY_MINIPERL
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 71762e1..fbe7ba9 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -96,12 +96,59 @@ define PERL_INSTALL_STAGING_CMDS
 		-C $(@D) install.perl
 endef
 
+PERL_RUN_PERL=$(PERL_QEMU_USER_MODE) $(@D)/perl -Ilib
+PERL_ARCHNAME=$(shell $(PERL_RUN_PERL) -MConfig -e "print Config->{archname}")
+PERL_LIB=$(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)
+PERL_ARCHLIB=$(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)
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
+ifeq ($(BR2_PACKAGE_PERL_ONLY_MINIPERL),y)
+define PERL_INSTALL_INTERPRETER
+	$(INSTALL) -m 0755 -D $(@D)/miniperl $(TARGET_DIR)/usr/bin/miniperl
+endef
+else
+define PERL_INSTALL_INTERPRETER
+	$(INSTALL) -m 0755 -D $(@D)/perl $(TARGET_DIR)/usr/bin/perl
+	$(INSTALL) -m 0755 -D $(@D)/libperl.so $(PERL_ARCHLIB)/CORE/libperl.so
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_PERL_CUSTOM_INSTALL),y)
+define PERL_INSTALL_TARGET_CMDS
+	$(PERL_INSTALL_INTERPRETER)
+	$(PERL_INSTALL_MODULES)
+endef
+else
 define PERL_INSTALL_TARGET_CMDS
 	$(MAKE) INSTALL_DEPENDENCE= \
 		INSTALLFLAGS="-p $(PERL_INSTALL_ONLY_MINIPERL)"\
 		DESTDIR="$(TARGET_DIR)" \
 		-C $(@D) install.perl
 endef
+endif
 
 define PERL_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
-- 
1.7.9.5
