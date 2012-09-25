From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 25 Sep 2012 19:18:23 +0200
Subject: [Buildroot] [PATCH v8 07/11] cpanminus: new package
In-Reply-To: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1348593508-14254-7-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                        |    5 ++++
 package/cpanminus/Config.in              |   34 +++++++++++++++++++++++
 package/cpanminus/cpanminus.mk           |   44 ++++++++++++++++++++++++++++++
 package/perl/perl-fix-Module-Build.patch |   16 +++++++++++
 4 files changed, 99 insertions(+)
 create mode 100644 package/cpanminus/Config.in
 create mode 100644 package/cpanminus/cpanminus.mk
 create mode 100644 package/perl/perl-fix-Module-Build.patch

diff --git a/package/Config.in b/package/Config.in
index d9cadf9..06050f2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -263,6 +263,11 @@ source "package/xavante/Config.in"
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
index 0000000..3b57ffd
--- /dev/null
+++ b/package/cpanminus/Config.in
@@ -0,0 +1,34 @@
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
+	help
+	  List of space-separated Perl modules to install from CPAN.
+
+	  Examples: Try::Tiny Dancer YAML Moo
+
+	  Install the listed modules and their dependencies.
+
+config BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES
+	string "native dependencies"
+	help
+	  Some XS modules require native libraries.
+
+endif
diff --git a/package/cpanminus/cpanminus.mk b/package/cpanminus/cpanminus.mk
new file mode 100644
index 0000000..1b2857a
--- /dev/null
+++ b/package/cpanminus/cpanminus.mk
@@ -0,0 +1,44 @@
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
+CPANMINUS_ARCH=$(ARCH)
+ifeq ($(CPANMINUS_ARCH),i686)
+    CPANMINUS_ARCH=i386
+endif
+CPANMINUS_QEMU_USER_MODE=$(HOST_DIR)/usr/bin/qemu-$(CPANMINUS_ARCH)
+CPANMINUS_RUN_PERL=$(CPANMINUS_QEMU_USER_MODE) $(STAGING_DIR)/usr/bin/perl
+CPANMINUS_ARCHNAME=$(shell $(CPANMINUS_RUN_PERL) -MConfig -e "print Config->{archname}")
+CPANMINUS_PERL_LIB=$(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)
+CPANMINUS_PERL_ARCHLIB=$(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(CPANMINUS_ARCHNAME)
+CPANMINUS_PERL_SITELIB=$(TARGET_DIR)/usr/lib/perl5/site_perl/$(PERL_VERSION)
+CPANMINUS_PERL_SITEARCH=$(TARGET_DIR)/usr/lib/perl5/site_perl/$(PERL_VERSION)/$(CPANMINUS_ARCHNAME)
+CPANMINUS_PERL5LIB=$(CPANMINUS_PERL_SITEARCH):$(CPANMINUS_PERL_SITELIB):$(CPANMINUS_PERL_ARCHLIB):$(CPANMINUS_PERL_LIB)
+ifneq ($(BR2_PACKAGE_CPANMINUS_MIRROR),"")
+    CPANMINUS_MIRROR=--mirror $(call qstrip,$(BR2_PACKAGE_CPANMINUS_MIRROR)) --mirror-only
+endif
+
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
+endef
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
-- 
1.7.9.5
