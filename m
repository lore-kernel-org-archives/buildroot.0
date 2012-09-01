From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  1 Sep 2012 09:25:21 +0200
Subject: [Buildroot] [PATCH 03/14] cpanminus: new package v2
In-Reply-To: <1346484332-31433-1-git-send-email-francois.perrad@gadz.org>
References: <1346484332-31433-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1346484332-31433-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in                         |    5 +++++
 package/cpanminus/Config.in               |   23 +++++++++++++++++++
 package/cpanminus/cpanminus-destdir.patch |   24 ++++++++++++++++++++
 package/cpanminus/cpanminus.mk            |   34 +++++++++++++++++++++++++++++
 package/perl/perl-EUMM.patch              |   19 +++++++++++++++-
 5 files changed, 104 insertions(+), 1 deletion(-)
 create mode 100644 package/cpanminus/Config.in
 create mode 100644 package/cpanminus/cpanminus-destdir.patch
 create mode 100644 package/cpanminus/cpanminus.mk

diff --git a/package/Config.in b/package/Config.in
index 00a79ab..48d25fc 100644
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
index 0000000..7c41c4d
--- /dev/null
+++ b/package/cpanminus/Config.in
@@ -0,0 +1,23 @@
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
+
+endif
diff --git a/package/cpanminus/cpanminus-destdir.patch b/package/cpanminus/cpanminus-destdir.patch
new file mode 100644
index 0000000..c1c61ad
--- /dev/null
+++ b/package/cpanminus/cpanminus-destdir.patch
@@ -0,0 +1,24 @@
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/cpanm
+===================================================================
+--- a/cpanm
++++ b/cpanm
+@@ -399,6 +399,7 @@
+           'h|help'    => sub { $self->{action} = 'show_help' },
+           'V|version' => sub { $self->{action} = 'show_version' },
+           'perl=s'    => \$self->{perl},
++          'destdir=s' => \$self->{destdir},
+           'l|local-lib=s' => sub { $self->{local_lib} = $self->maybe_abs($_[1]) },
+           'L|local-lib-contained=s' => sub {
+               $self->{local_lib} = $self->maybe_abs($_[1]);
+@@ -1636,7 +1637,7 @@
+           $self->diag_progress("Building " . ($self->{notest} ? "" : "and testing ") . $distname);
+           $self->build([ $self->{make} ], $distname) &&
+           $self->test([ $self->{make}, "test" ], $distname) &&
+-          $self->install([ $self->{make}, "install" ], [ "UNINST=1" ], $depth) &&
++          $self->install([ $self->{make}, "install", "DESTDIR=$self->{destdir}" ], [ "UNINST=1" ], $depth) &&
+           $installed++;
+       } else {
+           my $why;
diff --git a/package/cpanminus/cpanminus.mk b/package/cpanminus/cpanminus.mk
new file mode 100644
index 0000000..ce2a09b
--- /dev/null
+++ b/package/cpanminus/cpanminus.mk
@@ -0,0 +1,34 @@
+#############################################################
+#
+# cpanminus
+#
+#############################################################
+
+CPANMINUS_VERSION = 1.5017
+CPANMINUS_SOURCE = miyagawa-cpanminus-$(CPANMINUS_VERSION)-0-g917a607.tar.gz
+CPANMINUS_SITE = https://github.com/miyagawa/cpanminus/tarball/$(CPANMINUS_VERSION)
+CPANMINUS_DEPENDENCIES = perl
+
+CPANMINUS_ARCH=$(call qstrip,$(BR2_ARCH))
+ifeq ($(CPANMINUS_ARCH),i686)
+    CPANMINUS_ARCH=i386
+endif
+CPANMINUS_QEMU_USER_MODE=qemu-$(CPANMINUS_ARCH) -L $(STAGING_DIR)
+CPANMINUS_RUN_PERL=$(CPANMINUS_QEMU_USER_MODE) $(STAGING_DIR)/usr/bin/perl
+CPANMINUS_ARCHNAME=$(shell $(CPANMINUS_RUN_PERL) -MConfig -e "print Config->{archname}")
+CPANMINUS_PERL5LIB=$(TARGET_DIR)/usr/lib/perl5/site_perl/$(PERL_VERSION)/$(CPANMINUS_ARCHNAME):$(TARGET_DIR)/usr/lib/perl5/site_perl/$(PERL_VERSION):$(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(CPANMINUS_ARCHNAME):$(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)
+
+define CPANMINUS_INSTALL_TARGET_CMDS
+	echo "#!/bin/sh"                                                        > $(@D)/run_perl
+	echo "PERL5LIB=$(CPANMINUS_PERL5LIB) $(CPANMINUS_RUN_PERL) \"\$$@\""    >>$(@D)/run_perl
+	chmod +x $(@D)/run_perl
+	PERL5LIB=$(CPANMINUS_PERL5LIB) \
+	$(CPANMINUS_RUN_PERL) $(@D)/cpanm \
+		--perl=$(@D)/run_perl \
+		--destdir="$(TARGET_DIR)" \
+		--notest \
+		--no-man-pages \
+		$(call qstrip,$(BR2_PACKAGE_CPANMINUS_MODULES))
+endef
+
+$(eval $(generic-package))
diff --git a/package/perl/perl-EUMM.patch b/package/perl/perl-EUMM.patch
index 4134f8a..689c2c9 100644
--- a/package/perl/perl-EUMM.patch
+++ b/package/perl/perl-EUMM.patch
@@ -6,7 +6,24 @@ Index: b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 ===================================================================
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -1924,7 +1925,7 @@
+@@ -1659,8 +1659,14 @@
+     } else {
+ 	# we should also consider $ENV{PERL5LIB} here
+         my $old = $self->{PERL_LIB} || $self->{PERL_ARCHLIB} || $self->{PERL_INC};
+-	$self->{PERL_LIB}     ||= $Config{privlibexp};
+-	$self->{PERL_ARCHLIB} ||= $Config{archlibexp};
++	if ($Config{run}) {
++	    $self->{PERL_LIB}     ||= $inc_carp_dir;
++	    $self->{PERL_ARCHLIB} ||= $inc_config_dir;
++	}
++	else {
++	    $self->{PERL_LIB}     ||= $Config{privlibexp};
++	    $self->{PERL_ARCHLIB} ||= $Config{archlibexp};
++	}
+ 	$self->{PERL_INC}     = $self->catdir("$self->{PERL_ARCHLIB}","CORE"); # wild guess for now
+ 	my $perl_h;
+ 
+@@ -1924,7 +1930,7 @@
      foreach my $perl (qw(PERL FULLPERL ABSPERL)) {
          my $run  = $perl.'RUN';
  
-- 
1.7.9.5
