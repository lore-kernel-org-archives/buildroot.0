From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 20 Aug 2012 10:55:00 +0200
Subject: [Buildroot] [PATCH 01/10] perl: new package
Message-ID: <1345452909-15756-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in                      |    1 +
 package/perl/Config.in                 |   16 +++++
 package/perl/perl-Makefile-SH.patch    |   28 ++++++++
 package/perl/perl-configure-qemu.patch |   22 +++++++
 package/perl/perl-fix-minitest.patch   |   96 +++++++++++++++++++++++++++
 package/perl/perl-make-ext.patch       |   35 ++++++++++
 package/perl/perl-mkppport.patch       |   36 ++++++++++
 package/perl/perl.mk                   |  112 ++++++++++++++++++++++++++++++++
 8 files changed, 346 insertions(+)
 create mode 100644 package/perl/Config.in
 create mode 100644 package/perl/perl-Makefile-SH.patch
 create mode 100644 package/perl/perl-configure-qemu.patch
 create mode 100644 package/perl/perl-fix-minitest.patch
 create mode 100644 package/perl/perl-make-ext.patch
 create mode 100644 package/perl/perl-mkppport.patch
 create mode 100644 package/perl/perl.mk

diff --git a/package/Config.in b/package/Config.in
index f308de7..00a79ab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -262,6 +262,7 @@ source "package/wsapi/Config.in"
 source "package/xavante/Config.in"
 endmenu
 endif
+source "package/perl/Config.in"
 source "package/microperl/Config.in"
 source "package/php/Config.in"
 source "package/python/Config.in"
diff --git a/package/perl/Config.in b/package/perl/Config.in
new file mode 100644
index 0000000..387448e
--- /dev/null
+++ b/package/perl/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_PERL
+	bool "perl"
+	help
+	  Larry Wall's Practical Extraction and Report Language
+	  An interpreted scripting language, known among some as "Unix's Swiss
+	  Army Chainsaw".
+
+	  http://www.perl.org/
+
+
+config BR2_PACKAGE_PERL_CUSTOM_CONFIGURE
+	string "configuration flags"
+	depends on BR2_PACKAGE_PERL
+	help
+	  Allows to add some flags to Configure.
+
diff --git a/package/perl/perl-Makefile-SH.patch b/package/perl/perl-Makefile-SH.patch
new file mode 100644
index 0000000..00d26b9
--- /dev/null
+++ b/package/perl/perl-Makefile-SH.patch
@@ -0,0 +1,28 @@
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/Makefile.SH
+===================================================================
+--- a/Makefile.SH
++++ b/Makefile.SH
+@@ -1512,8 +1512,10 @@
+ # Can't depend on lib/Config.pm because that might be where miniperl
+ # is crashing.
+ minitest: $(MINIPERL_EXE) minitest.prep
+-	- cd t && (rm -f $(PERL_EXE); $(LNS) ../$(MINIPERL_EXE) $(PERL_EXE)) \
+-		&& $(RUN_PERL) TEST base/*.t comp/*.t cmd/*.t run/*.t io/*.t re/*.t op/*.t uni/*.t </dev/tty
++#	- cd t && (rm -f $(PERL_EXE); $(LNS) ../$(MINIPERL_EXE) $(PERL_EXE)) \
++#		&& $(RUN_PERL) TEST base/*.t comp/*.t cmd/*.t run/*.t io/*.t re/*.t op/*.t uni/*.t </dev/tty
++	- cd t && (rm -f $(PERL_EXE); cp run_perl $(PERL_EXE); chmod +x $(PERL_EXE)) \
++		&& $(PERL_EXE) TEST base/*.t comp/*.t cmd/*.t run/*.t io/*.t re/*.t op/*.t uni/*.t </dev/tty
+ 
+ # Test via harness
+ 
+Index: b/t/run_perl
+new file mode 100755
+===================================================================
+--- /dev/null
++++ b/t/run_perl
+@@ -0,0 +1,2 @@
++#!/bin/sh
++../Cross/run-qemu-arm ../perl "$@"
diff --git a/package/perl/perl-configure-qemu.patch b/package/perl/perl-configure-qemu.patch
new file mode 100644
index 0000000..c7276b0
--- /dev/null
+++ b/package/perl/perl-configure-qemu.patch
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
diff --git a/package/perl/perl-fix-minitest.patch b/package/perl/perl-fix-minitest.patch
new file mode 100644
index 0000000..0d6b25f
--- /dev/null
+++ b/package/perl/perl-fix-minitest.patch
@@ -0,0 +1,96 @@
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
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
diff --git a/package/perl/perl-make-ext.patch b/package/perl/perl-make-ext.patch
new file mode 100644
index 0000000..f109487
--- /dev/null
+++ b/package/perl/perl-make-ext.patch
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
diff --git a/package/perl/perl-mkppport.patch b/package/perl/perl-mkppport.patch
new file mode 100644
index 0000000..fce1d6e
--- /dev/null
+++ b/package/perl/perl-mkppport.patch
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
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
new file mode 100644
index 0000000..d2679bc
--- /dev/null
+++ b/package/perl/perl.mk
@@ -0,0 +1,112 @@
+#############################################################
+#
+# perl
+#
+#############################################################
+
+PERL_VERSION_MAJOR = 16
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_SITE = http://www.cpan.org/src/5.0
+PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
+PERL_LICENSE = Artistic
+PERL_LICENSE_FILES = Artistic
+PERL_INSTALL_STAGING = YES
+
+ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
+PERL_USE_DEVEL=-Dusedevel
+endif
+
+PERL_ARCH=$(call qstrip,$(BR2_ARCH))
+ifeq ($(PERL_ARCH),i686)
+    PERL_ARCH=i386
+endif
+PERL_QEMU_USER_MODE=qemu-$(PERL_ARCH)
+
+define PERL_CONFIGURE_CMDS
+	rm -f $(@D)/config.sh
+	cd $(@D); ./Configure -des \
+		-Dusecrosscompile \
+		-Dtargetrun=$(PERL_QEMU_USER_MODE) \
+		-Dqemulib=$(TARGET_DIR) \
+		-Dtargethost=dummy \
+		-Dar="$(TARGET_AR)" \
+		-Dcc="$(TARGET_CC)" \
+		-Dcpp="$(TARGET_CC)" \
+		-Dld="$(TARGET_LD)" \
+		-Dnm="$(TARGET_NM)" \
+		-Dranlib="$(TARGET_RANLIB)" \
+		-Dccflags="$(TARGET_CFLAGS)" \
+		-Dldflags="$(TARGET_LDFLAGS) -l gcc_s" \
+		-Dlddlflags="-shared" \
+		-Dlibc=$(TARGET_HOST)/usr/$(GNU_TARGET_NAME)/sysroot/lib/libc.so \
+		-Duseshrplib \
+		-Dprefix=/usr \
+		-Uoptimize \
+		$(PERL_USE_DEVEL) \
+		$(call qstrip,$(BR2_PACKAGE_PERL_CUSTOM_CONFIGURE))
+	echo "# patched values"                 >>$(@D)/config.sh
+	$(SED) '/^myarchname=/d' \
+		-e '/^mydomain=/d' \
+		-e '/^myhostname=/d' \
+		-e '/^myuname=/d' \
+		-e '/^osname=/d' \
+		-e '/^osvers=/d' \
+		-e '/^perladmin=/d' \
+		$(@D)/config.sh
+	echo "myarchname='$(GNU_TARGET_NAME)'"                  >>$(@D)/config.sh
+	echo "mydomain=''"                                      >>$(@D)/config.sh
+	echo "myhostname='$(BR2_TARGET_GENERIC_HOSTNAME)'"      >>$(@D)/config.sh
+	echo "myuname='Buildroot $(BR2_VERSION_FULL)'"          >>$(@D)/config.sh
+	echo "osname='linux'"                                   >>$(@D)/config.sh
+	echo "osvers='$(BR2_LINUX_KERNEL_VERSION)'"             >>$(@D)/config.sh
+	echo "perladmin='root'"                                 >>$(@D)/config.sh
+	cd $(@D); ./Configure -S
+	cp $(@D)/config.h $(@D)/xconfig.h
+	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
+endef
+
+define PERL_BUILD_CMDS
+	$(MAKE) -C $(@D) all
+endef
+
+define PERL_INSTALL_STAGING_CMDS
+	$(MAKE) INSTALL_DEPENDENCE= \
+		INSTALLFLAGS= \
+		DESTDIR="$(STAGING_DIR)" \
+		-C $(@D) install.perl
+endef
+
+define PERL_INSTALL_TARGET_CMDS
+	$(MAKE) INSTALL_DEPENDENCE= \
+		INSTALLFLAGS=-p \
+		DESTDIR="$(TARGET_DIR)" \
+		-C $(@D) install.perl
+endef
+
+define PERL_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
+
+define HOST_PERL_CONFIGURE_CMDS
+	cd $(@D); ./Configure -des \
+		-Dcc="$(HOSTCC)" \
+		-Dprefix="$(HOST_DIR)/usr" \
+		$(PERL_USE_DEVEL) \
+		$(call qstrip,$(BR2_PACKAGE_PERL_CUSTOM_CONFIGURE))
+endef
+
+define HOST_PERL_BUILD_CMDS
+	$(MAKE) -C $(@D) all
+endef
+
+define HOST_PERL_INSTALL_CMDS
+	$(MAKE) INSTALL_DEPENDENCE= \
+		-C $(@D) install
+endef
+
+define HOST_PERL_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.7.9.5
