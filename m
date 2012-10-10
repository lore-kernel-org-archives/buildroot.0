From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 10 Oct 2012 17:06:27 +0200
Subject: [Buildroot] [PATCH v10 06/10] perl: add option "custom install"
In-Reply-To: <1349881591-7062-1-git-send-email-francois.perrad@gadz.org>
References: <1349881591-7062-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1349881591-7062-6-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

allows same behaviour (and footprint) as microperl

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/Config.in |   16 ++++++++++++++++
 package/perl/perl.mk   |   32 ++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/package/perl/Config.in b/package/perl/Config.in
index 98b41da..0642deb 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -16,6 +16,22 @@ config BR2_PACKAGE_PERL
 
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
index 56abbc1..81dff04 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -89,7 +89,38 @@ PERL_RUN_PERL = $(QEMU_USER) $(@D)/perl -Ilib
 PERL_ARCHNAME = $(shell $(PERL_RUN_PERL) -MConfig -e "print Config->{archname}")
 PERL_LIB = $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)
 PERL_ARCHLIB = $(PERL_LIB)/$(PERL_ARCHNAME)
+PERL_MODS = $(call qstrip,$(BR2_PACKAGE_PERL_MODULES))
+# Minimal set of modules required for 'perl -V' to work
+PERL_ARCH_MODS = Config.pm Config_git.pl Config_heavy.pl
+PERL_BASE_MODS = strict.pm vars.pm warnings.pm warnings/register.pm
 
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
@@ -98,6 +129,7 @@ define PERL_INSTALL_TARGET_CMDS
 	rm -f $(PERL_ARCHLIB)/CORE/*.h
 	find $(PERL_ARCHLIB) -type f -name *.bs -exec rm -f {} \;
 endef
+endif
 
 define PERL_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
-- 
1.7.9.5
