From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 17:07:24 +0100
Subject: [Buildroot] [git commit] cpanminus: new package
Message-ID: <20121103161145.A7D3A99A6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51b5cf20bbd07f7ac5855108b17bd08e6a9edf69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                        |    5 +++
 package/cpanminus/Config.in              |   36 +++++++++++++++++++++++
 package/cpanminus/cpanminus.mk           |   47 ++++++++++++++++++++++++++++++
 package/perl/perl-fix-Module-Build.patch |   16 ++++++++++
 4 files changed, 104 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c895e7a..2ac2568 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -280,6 +280,11 @@ source "package/xavante/Config.in"
 endmenu
 endif
 source "package/perl/Config.in"
+if BR2_PACKAGE_PERL
+menu "Perl libraries/modules"
+source "package/cpanminus/Config.in"
+endmenu
+endif
 source "package/microperl/Config.in"
 source "package/php/Config.in"
 source "package/python/Config.in"
diff --git a/package/cpanminus/Config.in b/package/cpanminus/Config.in
new file mode 100644
index 0000000..b8b39dc
--- /dev/null
+++ b/package/cpanminus/Config.in
@@ -0,0 +1,36 @@
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
+config BR2_PACKAGE_CPANMINUS_MIRROR
+	string "mirror"
+	help
+	  Specifies the base URL for the CPAN mirror to use,
+	  such as http://cpan.cpantesters.org/.
+
+config BR2_PACKAGE_CPANMINUS_MODULES
+	string "Perl modules from CPAN"
+	default "Curses::UI"
+	help
+	  List of space-separated Perl modules to install from CPAN.
+
+	  Examples: Try::Tiny Dancer YAML Moo
+
+	  Install the listed modules and their dependencies.
+
+config BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES
+	string "native dependencies"
+	default "ncurses"
+	help
+	  Some XS modules require native libraries.
+
+endif
diff --git a/package/cpanminus/cpanminus.mk b/package/cpanminus/cpanminus.mk
new file mode 100644
index 0000000..d3a338b
--- /dev/null
+++ b/package/cpanminus/cpanminus.mk
@@ -0,0 +1,47 @@
+#############################################################
+#
+# cpanminus
+#
+#############################################################
+
+CPANMINUS_VERSION = 1.5018
+CPANMINUS_SOURCE = miyagawa-cpanminus-$(CPANMINUS_VERSION)-0-gee6cd30.tar.gz
+CPANMINUS_SITE = https://github.com/miyagawa/cpanminus/tarball/$(CPANMINUS_VERSION)
+CPANMINUS_DEPENDENCIES = perl $(call qstrip,$(BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES))
+
+CPANMINUS_RUN_PERL = $(QEMU_USER) $(STAGING_DIR)/usr/bin/perl
+CPANMINUS_ARCHNAME = $(shell $(CPANMINUS_RUN_PERL) -MConfig -e "print Config->{archname}")
+CPANMINUS_PERL_LIB      = $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)
+CPANMINUS_PERL_SITELIB  = $(TARGET_DIR)/usr/lib/perl5/site_perl/$(PERL_VERSION)
+CPANMINUS_PERL_ARCHLIB  = $(CPANMINUS_PERL_LIB)/$(CPANMINUS_ARCHNAME)
+CPANMINUS_PERL_SITEARCH = $(CPANMINUS_PERL_SITELIB)/$(CPANMINUS_ARCHNAME)
+CPANMINUS_PERL5LIB = $(CPANMINUS_PERL_SITEARCH):$(CPANMINUS_PERL_SITELIB):$(CPANMINUS_PERL_ARCHLIB):$(CPANMINUS_PERL_LIB)
+ifneq ($(BR2_PACKAGE_CPANMINUS_MIRROR),"")
+    CPANMINUS_MIRROR = --mirror $(call qstrip,$(BR2_PACKAGE_CPANMINUS_MIRROR)) --mirror-only
+endif
+CPANMINUS_MODULES = $(call qstrip,$(BR2_PACKAGE_CPANMINUS_MODULES))
+
+ifneq ($(CPANMINUS_MODULES),)
+define CPANMINUS_INSTALL_TARGET_CMDS
+	echo "#!/bin/sh"                                                        > $(@D)/run_perl
+	echo "PERL5LIB=$(CPANMINUS_PERL5LIB) $(CPANMINUS_RUN_PERL) \"\$$@\""    >>$(@D)/run_perl
+	chmod +x $(@D)/run_perl
+	PERL5LIB=$(CPANMINUS_PERL5LIB) \
+	PERL_MM_OPT="DESTDIR=$(TARGET_DIR) PERL=$(@D)/run_perl PERL_LIB=$(CPANMINUS_PERL_LIB) PERL_ARCHLIB=$(CPANMINUS_PERL_ARCHLIB)" \
+	PERL_MB_OPT="--destdir $(TARGET_DIR)" \
+	RUN_PERL="$(@D)/run_perl" \
+	$(CPANMINUS_RUN_PERL) $(@D)/cpanm \
+		--perl=$(@D)/run_perl \
+		--notest \
+		--no-man-pages \
+		$(CPANMINUS_MIRROR) \
+		$(call qstrip,$(BR2_PACKAGE_CPANMINUS_MODULES))
+	find $(CPANMINUS_PERL_SITEARCH) -type f -name *.bs -exec rm -f {} \;
+endef
+else
+define CPANMINUS_INSTALL_TARGET_CMDS
+	@echo "No modules to install"
+endef
+endif
+
+$(eval $(generic-package))
diff --git a/package/perl/perl-fix-Module-Build.patch b/package/perl/perl-fix-Module-Build.patch
new file mode 100644
index 0000000..26b15e4
--- /dev/null
+++ b/package/perl/perl-fix-Module-Build.patch
@@ -0,0 +1,16 @@
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/cpan/Module-Build/lib/Module/Build/Base.pm
+===================================================================
+--- a/cpan/Module-Build/lib/Module/Build/Base.pm
++++ b/cpan/Module-Build/lib/Module/Build/Base.pm
+@@ -456,7 +456,7 @@
+   my $proto = shift;
+   my $c     = ref($proto) ? $proto->{config} : 'Module::Build::Config';
+ 
+-  my $perl  = $^X;
++  my $perl  = $ENV{RUN_PERL} || $^X;
+   my $perl_basename = File::Basename::basename($perl);
+ 
+   my @potential_perls;
