From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 20 Aug 2012 10:55:01 +0200
Subject: [Buildroot] [PATCH 02/10] miniperl: new package
In-Reply-To: <1345452909-15756-1-git-send-email-francois.perrad@gadz.org>
References: <1345452909-15756-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1345452909-15756-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in                              |    1 +
 package/miniperl/Config.in                     |    6 ++
 package/miniperl/miniperl-Makefile-SH.patch    |   48 +++++++++
 package/miniperl/miniperl-configure-qemu.patch |   22 ++++
 package/miniperl/miniperl-fix-minitest.patch   |  122 +++++++++++++++++++++
 package/miniperl/miniperl-installperl.patch    |  135 ++++++++++++++++++++++++
 package/miniperl/miniperl-make-ext.patch       |   35 ++++++
 package/miniperl/miniperl-mkppport.patch       |   36 +++++++
 package/miniperl/miniperl.mk                   |   35 ++++++
 package/perl/Config.in                         |    2 +-
 10 files changed, 441 insertions(+), 1 deletion(-)
 create mode 100644 package/miniperl/Config.in
 create mode 100644 package/miniperl/miniperl-Makefile-SH.patch
 create mode 100644 package/miniperl/miniperl-configure-qemu.patch
 create mode 100644 package/miniperl/miniperl-fix-minitest.patch
 create mode 100644 package/miniperl/miniperl-installperl.patch
 create mode 100644 package/miniperl/miniperl-make-ext.patch
 create mode 100644 package/miniperl/miniperl-mkppport.patch
 create mode 100644 package/miniperl/miniperl.mk

diff --git a/package/Config.in b/package/Config.in
index 00a79ab..1b8237d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -263,6 +263,7 @@ source "package/xavante/Config.in"
 endmenu
 endif
 source "package/perl/Config.in"
+source "package/miniperl/Config.in"
 source "package/microperl/Config.in"
 source "package/php/Config.in"
 source "package/python/Config.in"
diff --git a/package/miniperl/Config.in b/package/miniperl/Config.in
new file mode 100644
index 0000000..abe283b
--- /dev/null
+++ b/package/miniperl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_MINIPERL
+	bool "miniperl"
+	help
+	  Perl without dynamic module loader.
+	  Usually used to bootstrap a full Perl (@INC contains only .).
+
diff --git a/package/miniperl/miniperl-Makefile-SH.patch b/package/miniperl/miniperl-Makefile-SH.patch
new file mode 100644
index 0000000..6b28b0a
--- /dev/null
+++ b/package/miniperl/miniperl-Makefile-SH.patch
@@ -0,0 +1,48 @@
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/Makefile.SH
+===================================================================
+--- a/Makefile.SH
++++ b/Makefile.SH
+@@ -555,7 +555,8 @@
+ .c.s:
+ 	$(CCCMDSRC) -S $*.c
+ 
+-all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(unidatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make
++#all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(unidatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make
++all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(private) $(unidatafiles) $(nonxs_ext) lib/auto/Cwd/Cwd.so
+ 	@echo " ";
+ 	@echo "	Everything is up to date. Type '$(MAKE) test' to run test suite."
+ 
+@@ -1101,7 +1102,8 @@
+ INSTALL_DEPENDENCE = all
+ 
+ install.perl:	$(INSTALL_DEPENDENCE) installperl
+-	$(RUN_PERL) installperl --destdir=$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
++#	$(RUN_PERL) installperl --destdir=$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
++	$(MINIPERL) installperl --destdir=$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
+ 	- at test ! -s extras.lst || $(MAKE) extras.install
+ 
+ install.man:	all installman
+@@ -1512,8 +1514,10 @@
+ # Can't depend on lib/Config.pm because that might be where miniperl
+ # is crashing.
+ minitest: $(MINIPERL_EXE) minitest.prep
+-	- cd t && (rm -f $(PERL_EXE); $(LNS) ../$(MINIPERL_EXE) $(PERL_EXE)) \
+-		&& $(RUN_PERL) TEST base/*.t comp/*.t cmd/*.t run/*.t io/*.t re/*.t op/*.t uni/*.t </dev/tty
++#	- cd t && (rm -f $(PERL_EXE); $(LNS) ../$(MINIPERL_EXE) $(PERL_EXE)) \
++#		&& $(RUN_PERL) TEST base/*.t comp/*.t cmd/*.t run/*.t io/*.t re/*.t op/*.t uni/*.t </dev/tty
++	- cd t && (rm -f $(PERL_EXE); cp run_miniperl $(PERL_EXE); chmod +x $(PERL_EXE)) \
++		&& $(PERL_EXE) TEST base/*.t comp/*.t cmd/*.t run/*.t io/*.t re/*.t op/*.t uni/*.t </dev/tty
+ 
+ # Test via harness
+ 
+Index: b/t/run_miniperl
+new file mode 100755
+===================================================================
+--- /dev/null
++++ b/t/run_miniperl
+@@ -0,0 +1,2 @@
++#!/bin/sh
++../Cross/run-qemu-arm ../miniperl "$@"
diff --git a/package/miniperl/miniperl-configure-qemu.patch b/package/miniperl/miniperl-configure-qemu.patch
new file mode 100644
index 0000000..c7276b0
--- /dev/null
+++ b/package/miniperl/miniperl-configure-qemu.patch
@@ -0,0 +1,22 @@
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/Configure
+===================================================================
+--- a/Configure
++++ b/Configure
+@@ -2908,6 +2908,14 @@
+ $targetrun -l $targetuser $targethost "cd \$cwd && ./\$exe \$@"
+ EOF
+ 	    ;;
++	qemu*)
++	    targetto=cp
++	    targetfrom=cp
++	    cat >$run <<EOF
++#!/bin/sh
++$targetrun -L $qemulib $exe "\$@"
++EOF
++	    ;;
+ 	*)  echo "Unknown targetrun '$targetrun'" >&4
+ 	    exit 1
+ 	    ;;
diff --git a/package/miniperl/miniperl-fix-minitest.patch b/package/miniperl/miniperl-fix-minitest.patch
new file mode 100644
index 0000000..1ea474e
--- /dev/null
+++ b/package/miniperl/miniperl-fix-minitest.patch
@@ -0,0 +1,122 @@
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/lib/_charnames.pm
+===================================================================
+--- a/lib/_charnames.pm
++++ b/lib/_charnames.pm
+@@ -11,7 +11,7 @@
+ use unicore::Name;    # mktables-generated algorithmically-defined names
+ 
+ use bytes ();          # for $bytes::hint_bits
+-use re "/aa";          # Everything in here should be ASCII
++#use re "/aa";          # Everything in here should be ASCII
+ 
+ $Carp::Internal{ (__PACKAGE__) } = 1;
+ 
+Index: b/lib/charnames.pm
+===================================================================
+--- a/lib/charnames.pm
++++ b/lib/charnames.pm
+@@ -6,7 +6,7 @@
+ use _charnames ();    # The submodule for this where most of the work gets done
+ 
+ use bytes ();          # for $bytes::hint_bits
+-use re "/aa";          # Everything in here should be ASCII
++#use re "/aa";          # Everything in here should be ASCII
+ 
+ # Translate between Unicode character names and their code points.
+ # This is a wrapper around the submodule C<_charnames>.  This design allows
+Index: b/t/base/term.t
+===================================================================
+--- a/t/base/term.t
++++ b/t/base/term.t
+@@ -17,7 +17,7 @@
+ 
+ # check `` processing
+ 
+-$x = `$^X -le "print 'hi there'"`;
++$x = `./perl -le "print 'hi there'"`;
+ if ($x eq "hi there\n") {print "ok 2\n";} else {print "not ok 2\n";}
+ 
+ # check $#array
+Index: b/t/io/fflush.t
+===================================================================
+--- a/t/io/fflush.t
++++ b/t/io/fflush.t
+@@ -28,7 +28,7 @@
+ 
+ plan(tests => 7);
+ 
+-my $runperl = $^X =~ m/\s/ ? qq{"$^X"} : $^X;
++my $runperl = './perl';
+ $runperl .= qq{ "-I../lib"};
+ 
+ sub file_eq {
+Index: b/t/op/lex_assign.t
+===================================================================
+--- a/t/op/lex_assign.t
++++ b/t/op/lex_assign.t
+@@ -8,7 +8,7 @@
+ $| = 1;
+ umask 0;
+ $xref = \ "";
+-$runme = $^X;
++$runme = './perl';
+ @a = (1..5);
+ %h = (1..6);
+ $aref = \@a;
+Index: b/t/op/sigsystem.t
+===================================================================
+--- a/t/op/sigsystem.t
++++ b/t/op/sigsystem.t
+@@ -7,7 +7,7 @@
+ }
+ 
+ use strict;
+-use constant TRUE => ($^X, '-e', 'exit 0');
++use constant TRUE => ('./perl', '-e', 'exit 0');
+ use Data::Dumper;
+ 
+ plan tests => 4;
+Index: b/t/op/srand.t
+===================================================================
+--- a/t/op/srand.t
++++ b/t/op/srand.t
+@@ -52,9 +52,9 @@
+ }
+ 
+ # This test checks whether Perl called srand for you.
+- at first_run  = `$^X -le "print int rand 100 for 1..100"`;
++ at first_run  = `./perl -le "print int rand 100 for 1..100"`;
+ sleep(1); # in case our srand() is too time-dependent
+- at second_run = `$^X -le "print int rand 100 for 1..100"`;
++ at second_run = `./perl -le "print int rand 100 for 1..100"`;
+ 
+ ok( !eq_array(\@first_run, \@second_run), 'srand() called automatically');
+ 
+Index: b/t/run/switchF1.t
+===================================================================
+--- a/t/run/switchF1.t
++++ b/t/run/switchF1.t
+@@ -26,6 +26,6 @@
+ print F $prog;
+ close F or die "Close $file: $!";
+ 
+-print system ($^X, $file) ? "not ok 5\n" : "ok 5\n";
++print system ('./perl', $file) ? "not ok 5\n" : "ok 5\n";
+ 
+ unlink $file or die "Unlink $file: $!";
+Index: b/t/test.pl
+===================================================================
+--- a/t/test.pl
++++ b/t/test.pl
+@@ -684,7 +684,7 @@
+ # A somewhat safer version of the sometimes wrong $^X.
+ sub which_perl {
+     unless (defined $Perl) {
+-	$Perl = $^X;
++	$Perl = './perl';
+ 
+ 	# VMS should have 'perl' aliased properly
+ 	return $Perl if $is_vms;
diff --git a/package/miniperl/miniperl-installperl.patch b/package/miniperl/miniperl-installperl.patch
new file mode 100644
index 0000000..f8b5889
--- /dev/null
+++ b/package/miniperl/miniperl-installperl.patch
@@ -0,0 +1,135 @@
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/installperl
+===================================================================
+--- a/installperl
++++ b/installperl
+@@ -3,11 +3,17 @@
+ BEGIN {
+     require 5.004;
+     chdir '..' if !-d 'lib' and -d '../lib';
++
++    my @sav = @INC;
++    my $sav = $ENV{PERL5LIB};
+     @INC = 'lib';
+     $ENV{PERL5LIB} = 'lib';
+ 
+     # This needs to be at BEGIN time, before any use of Config
+     require './install_lib.pl';
++
++    @INC = @sav;
++    $ENV{PERL5LIB} = $sav;
+ }
+ 
+ use strict;
+@@ -29,7 +35,7 @@
+ use ExtUtils::Packlist;
+ use Cwd;
+ 
+-require './Porting/pod_lib.pl';
++#require './Porting/pod_lib.pl';
+ 
+ if ($Is_NetWare) {
+     $Is_W32 = 0;
+@@ -112,19 +118,19 @@
+ 
+ $versiononly = 1 if $Config{versiononly} && !defined $versiononly;
+ my (@scripts, @tolink);
+-open SCRIPTS, "utils.lst" or die "Can't open utils.lst: $!";
+-while (<SCRIPTS>) {
+-    next if /^#/;
+-    next if /a2p/; # a2p is binary, to be installed separately
+-    chomp;
+-    if (/(\S*)\s*#\s*link\s*=\s*(\S*)/) {
+-	push @scripts, $1;
+-	push @tolink, [$1, $2];
+-    } else {
+-	push @scripts, $_;
+-    }
+-}
+-close SCRIPTS;
++#open SCRIPTS, "utils.lst" or die "Can't open utils.lst: $!";
++#while (<SCRIPTS>) {
++#    next if /^#/;
++#    next if /a2p/; # a2p is binary, to be installed separately
++#    chomp;
++#    if (/(\S*)\s*#\s*link\s*=\s*(\S*)/) {
++#	push @scripts, $1;
++#	push @tolink, [$1, $2];
++#    } else {
++#	push @scripts, $_;
++#    }
++#}
++#close SCRIPTS;
+ 
+ if ($scr_ext) { @scripts = map { "$_$scr_ext" } @scripts; }
+ 
+@@ -241,7 +247,7 @@
+ 
+ if (!$Is_NetWare) {
+ if (!$Is_VMS) {
+--x 'perl' . $exe_ext	|| die "perl isn't executable!\n";
++-x 'miniperl' . $exe_ext	|| die "miniperl isn't executable!\n";
+ }
+ else {
+ -x $ndbg . 'perl' . $exe_ext	|| die "${ndbg}perl$exe_ext isn't executable!\n";
+@@ -357,7 +363,7 @@
+ }
+ 
+ # Install header files and libraries.
+-mkpath("$installarchlib/CORE", $opts{verbose}, 0777);
++#mkpath("$installarchlib/CORE", $opts{verbose}, 0777);
+ my @corefiles;
+ if ($Is_VMS) {  # We did core file selection during build
+     my $coredir = "lib/$Config{archname}/$ver/CORE";
+@@ -395,18 +401,18 @@
+ 	push(@corefiles,'mpeix/mpeixish.h');
+     }
+ }
+-foreach my $file (@corefiles) {
+-    # HP-UX (at least) needs to maintain execute permissions
+-    # on dynamically-loadable libraries. So we do it for all.
+-    if (copy_if_diff($file,"$installarchlib/CORE/$file")) {
+-	if ($file =~ /\.(\Q$so\E|\Q$dlext\E)$/) {
+-	    strip("-S", "$installarchlib/CORE/$file") if $^O =~ /^(rhapsody|darwin)$/;
+-	    chmod(0555, "$installarchlib/CORE/$file");
+-	} else {
+-	    chmod(0444, "$installarchlib/CORE/$file");
+-	}
+-    }
+-}
++#foreach my $file (@corefiles) {
++#    # HP-UX (at least) needs to maintain execute permissions
++#    # on dynamically-loadable libraries. So we do it for all.
++#    if (copy_if_diff($file,"$installarchlib/CORE/$file")) {
++#	if ($file =~ /\.(\Q$so\E|\Q$dlext\E)$/) {
++#	    strip("-S", "$installarchlib/CORE/$file") if $^O =~ /^(rhapsody|darwin)$/;
++#	    chmod(0555, "$installarchlib/CORE/$file");
++#	} else {
++#	    chmod(0444, "$installarchlib/CORE/$file");
++#	}
++#    }
++#}
+ 
+ # Install main perl executables
+ # Make links to ordinary names if installbin directory isn't current directory.
+@@ -757,7 +763,8 @@
+     $name = "$dir/$name" if $dir ne '';
+ 
+     # ignore pods that are stand alone documentation from dual life modules.
+-    return if /\.pod\z/ && is_duplicate_pod($_);
++#    return if /\.pod\z/ && is_duplicate_pod($_);
++    return if /\.pod\z/;
+ 
+     return if $name eq 'ExtUtils/XSSymSet.pm' and !$Is_VMS;
+ 
+@@ -767,7 +774,7 @@
+ 	  ($name =~ /^(.*)\.(?:h|lib)$/i && ($Is_W32 || $Is_NetWare)) ||
+ 	  $name=~/^Config_(heavy|git)\.pl\z/
+        ) {
+-	$installlib = $installarchlib;
++#	$installlib = $installarchlib;
+ 	return unless $do_installarchlib;
+     } else {
+ 	return unless $do_installprivlib;
diff --git a/package/miniperl/miniperl-make-ext.patch b/package/miniperl/miniperl-make-ext.patch
new file mode 100644
index 0000000..f109487
--- /dev/null
+++ b/package/miniperl/miniperl-make-ext.patch
@@ -0,0 +1,35 @@
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/make_ext.pl
+===================================================================
+--- a/make_ext.pl
++++ b/make_ext.pl
+@@ -11,6 +11,7 @@
+     }
+ }
+ use Cwd;
++use File::Spec;
+ 
+ my $is_Win32 = $^O eq 'MSWin32';
+ my $is_VMS = $^O eq 'VMS';
+@@ -458,11 +459,17 @@
+ 	# Give makefile an opportunity to rewrite itself.
+ 	# reassure users that life goes on...
+ 	my @args = ('config', @$pass_through);
+-	system(@run, @make, @args) and print "@run @make @args failed, continuing anyway...\n";
++#	system(@run, @make, @args) and print "@run @make @args failed, continuing anyway...\n";
++	push @args, 'PERL="' . join(' ', @run, File::Spec->rel2abs($perl)) . '"';
++	push @args, 'ABSPERL="' . join(' ', @run, File::Spec->rel2abs($perl)) . '"';
++	system(join(' ', @make, @args)) and print "@make @args failed, continuing anyway...\n";
+     }
+     my @targ = ($target, @$pass_through);
+     print "Making $target in $ext_dir\n at run @make @targ\n";
+-    my $code = system(@run, @make, @targ);
++#    my $code = system(@run, @make, @targ);
++    push @targ, 'PERL="' . join(' ', @run, File::Spec->rel2abs($perl)) . '"';
++    push @targ, 'ABSPERL="' . join(' ', @run, File::Spec->rel2abs($perl)) . '"';
++    my $code = system(join(' ', @make, @targ));
+     die "Unsuccessful make($ext_dir): code=$code" if $code != 0;
+ 
+     chdir $return_dir || die "Cannot cd to $return_dir: $!";
diff --git a/package/miniperl/miniperl-mkppport.patch b/package/miniperl/miniperl-mkppport.patch
new file mode 100644
index 0000000..fce1d6e
--- /dev/null
+++ b/package/miniperl/miniperl-mkppport.patch
@@ -0,0 +1,36 @@
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/mkppport
+===================================================================
+--- a/mkppport
++++ b/mkppport
+@@ -1,6 +1,7 @@
+ use strict;
+ use warnings;
+ 
++use Config;
+ use Getopt::Long;
+ use File::Spec;
+ use File::Compare qw( compare );
+@@ -136,14 +137,18 @@
+ #----------------------------------------------
+ sub run
+ {
++  my @run = $Config{run};
++  @run = () if not defined $run[0] or $run[0] eq '';
+   my @args = ("-I" . File::Spec->catdir((File::Spec->updir) x 2, 'lib'), @_);
+   my $run = $perl =~ m/\s/ ? qq("$perl") : $perl;
+   for (@args) {
+     $_ = qq("$_") if $^O eq 'VMS' && /^[^"]/;
+     $run .= " $_";
+   }
+-  print "running $run\n";
+-  system $run and die "$run failed: $?\n";
++#  print "running $run\n";
++#  system $run and die "$run failed: $?\n";
++  print "running ", join(' ', @run, $run), "\n";
++  system join(' ', @run, $run) and die "@run $run failed: $?\n";
+ }
+ 
+ __END__
diff --git a/package/miniperl/miniperl.mk b/package/miniperl/miniperl.mk
new file mode 100644
index 0000000..68972b9
--- /dev/null
+++ b/package/miniperl/miniperl.mk
@@ -0,0 +1,35 @@
+#############################################################
+#
+# miniperl
+#
+#############################################################
+
+MINIPERL_VERSION = 5.16.1
+MINIPERL_SITE = http://www.cpan.org/src/5.0
+MINIPERL_SOURCE = perl-$(MINIPERL_VERSION).tar.bz2
+MINIPERL_LICENSE = Artistic
+MINIPERL_LICENSE_FILES = Artistic
+
+define MINIPERL_CONFIGURE_CMDS
+	$(PERL_CONFIGURE_CMDS)
+endef
+
+define MINIPERL_BUILD_CMDS
+	$(MAKE) -C $(@D) all
+endef
+
+define MINIPERL_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 $(@D)/miniperl $(TARGET_DIR)/usr/bin/miniperl
+	$(MAKE) INSTALL_DEPENDENCE= \
+		INSTALLFLAGS=-p \
+		DESTDIR="$(TARGET_DIR)" \
+		-C $(@D) install.perl
+	# File::Spec is a pure module but packaged in the XS module Cwd
+	rm -rf $(TARGET_DIR)/usr/lib/perl5/$(MINIPERL_VERSION)/auto
+endef
+
+define MINIPERL_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
diff --git a/package/perl/Config.in b/package/perl/Config.in
index 387448e..58971a0 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_PERL
 
 config BR2_PACKAGE_PERL_CUSTOM_CONFIGURE
 	string "configuration flags"
-	depends on BR2_PACKAGE_PERL
+	depends on BR2_PACKAGE_PERL || BR2_PACKAGE_MINIPERL
 	help
 	  Allows to add some flags to Configure.
 
-- 
1.7.9.5
