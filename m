From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  1 Sep 2012 09:25:19 +0200
Subject: [Buildroot] [PATCH 01/14] perl: new package v5
Message-ID: <1346484332-31433-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in                                  |    1 +
 package/perl/Config.in                             |   17 ++
 package/perl/perl-EUMM.patch                       |   30 ++++
 package/perl/perl-add-targets-remote-test.patch    |   27 +++
 package/perl/perl-configure-qemu.patch             |   32 ++++
 package/perl/perl-fix-cpan-Encode.patch            |  109 ++++++++++++
 package/perl/perl-fix-cpan-IPC-SysV.patch          |   17 ++
 package/perl/perl-fix-test-base-term-t.patch       |   17 ++
 package/perl/perl-fix-test-pl.patch                |   18 ++
 package/perl/perl-make-ext.patch                   |   24 +++
 package/perl/perl-mkppport.patch                   |   37 +++++
 .../perl/perl-rewrite-tests-with-which-perl.patch  |  175 ++++++++++++++++++++
 package/perl/perl.mk                               |  112 +++++++++++++
 13 files changed, 616 insertions(+)
 create mode 100644 package/perl/Config.in
 create mode 100644 package/perl/perl-EUMM.patch
 create mode 100644 package/perl/perl-add-targets-remote-test.patch
 create mode 100644 package/perl/perl-configure-qemu.patch
 create mode 100644 package/perl/perl-fix-cpan-Encode.patch
 create mode 100644 package/perl/perl-fix-cpan-IPC-SysV.patch
 create mode 100644 package/perl/perl-fix-test-base-term-t.patch
 create mode 100644 package/perl/perl-fix-test-pl.patch
 create mode 100644 package/perl/perl-make-ext.patch
 create mode 100644 package/perl/perl-mkppport.patch
 create mode 100644 package/perl/perl-rewrite-tests-with-which-perl.patch
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
index 0000000..286b09e
--- /dev/null
+++ b/package/perl/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_PERL
+	bool "perl"
+	help
+	  Larry Wall's Practical Extraction and Report Language
+	  An interpreted scripting language, known among some as "Unix's Swiss
+	  Army Chainsaw".
+
+	  http://www.perl.org/
+
+if BR2_PACKAGE_PERL
+
+config BR2_PACKAGE_PERL_CUSTOM_CONFIGURE
+	string "configuration flags"
+	help
+	  Allows to add some flags to Configure.
+
+endif
diff --git a/package/perl/perl-EUMM.patch b/package/perl/perl-EUMM.patch
new file mode 100644
index 0000000..4134f8a
--- /dev/null
+++ b/package/perl/perl-EUMM.patch
@@ -0,0 +1,30 @@
+Add RUN
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
+===================================================================
+--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
+@@ -1924,7 +1925,7 @@
+     foreach my $perl (qw(PERL FULLPERL ABSPERL)) {
+         my $run  = $perl.'RUN';
+ 
+-        $self->{$run}  = "\$($perl)";
++        $self->{$run}  = "\$(RUN) \$($perl)";
+ 
+         # Make sure perl can find itself before it's installed.
+         $self->{$run} .= q{ "-I$(PERL_LIB)" "-I$(PERL_ARCHLIB)"} 
+Index: b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
+===================================================================
+--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
+@@ -350,7 +350,7 @@
+     @Get_from_Config = 
+         qw(
+            ar cc cccdlflags ccdlflags dlext dlsrc exe_ext full_ar ld 
+-           lddlflags ldflags libc lib_ext obj_ext osname osvers ranlib 
++           lddlflags ldflags libc lib_ext obj_ext osname osvers ranlib run
+            sitelibexp sitearchexp so
+           );
+ 
diff --git a/package/perl/perl-add-targets-remote-test.patch b/package/perl/perl-add-targets-remote-test.patch
new file mode 100644
index 0000000..455375c
--- /dev/null
+++ b/package/perl/perl-add-targets-remote-test.patch
@@ -0,0 +1,27 @@
+Add targets rminitest/rtest for cross testing with qemu
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/Makefile.SH
+===================================================================
+--- a/Makefile.SH
++++ b/Makefile.SH
+@@ -1533,6 +1533,18 @@
+ test_porting test-porting: test_prep
+ 	cd t && $(RUN_PERL) harness porting/*.t ../lib/diagnostics.t
+ 
++
++# Remote Test (via qemu)
++
++rminitest: $(MINIPERL_EXE)
++	- cd t && (rm -f $(PERL_EXE); echo "#!/bin/sh\\n$(RUN) ../miniperl \"\$$@\"" >$(PERL_EXE); chmod +x $(PERL_EXE)) \
++		&& $(PERL_EXE) TEST base/*.t comp/*.t cmd/*.t run/*.t io/*.t re/*.t op/*.t uni/*.t </dev/tty
++
++rtest: $(PERL_EXE)
++	- cd t && (rm -f $(PERL_EXE); echo "#!/bin/sh\\n$(RUN) ../perl \"\$$@\"" >$(PERL_EXE); chmod +x $(PERL_EXE)) \
++		&& $(PERL_EXE) TEST */*.t </dev/tty
++
++
+ # Handy way to run perlbug -ok without having to install and run the
+ # installed perlbug. We don't re-run the tests here - we trust the user.
+ # Please *don't* use this unless all tests pass.
diff --git a/package/perl/perl-configure-qemu.patch b/package/perl/perl-configure-qemu.patch
new file mode 100644
index 0000000..65f8387
--- /dev/null
+++ b/package/perl/perl-configure-qemu.patch
@@ -0,0 +1,32 @@
+Add qemu support
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
++	    to=:
++	    from=:
++	    cat >$run <<EOF
++#!/bin/sh
++$targetrun -L $qemulib $exe "\$@"
++EOF
++	    ;;
+ 	*)  echo "Unknown targetrun '$targetrun'" >&4
+ 	    exit 1
+ 	    ;;
+@@ -5048,7 +5056,7 @@
+ echo " ";
+ echo "Checking if your compiler accepts $flag" 2>&1;
+ echo "int main(void) { return 0; }" > gcctest.c;
+-if $cc -O2 $flag -o gcctest gcctest.c 2>gcctest.out && ./gcctest; then
++if $cc -O2 $flag -o gcctest gcctest.c 2>gcctest.out && $run ./gcctest; then
+     echo "Yes, it does." 2>&1;
+     if $test -s gcctest.out ; then
+         echo "But your platform does not like it:";
diff --git a/package/perl/perl-fix-cpan-Encode.patch b/package/perl/perl-fix-cpan-Encode.patch
new file mode 100644
index 0000000..3a1f4e6
--- /dev/null
+++ b/package/perl/perl-fix-cpan-Encode.patch
@@ -0,0 +1,109 @@
+Use PERLRUN instead of PERL
+note: $plib could be simplified
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/cpan/Encode/Byte/Makefile.PL
+===================================================================
+--- a/cpan/Encode/Byte/Makefile.PL
++++ b/cpan/Encode/Byte/Makefile.PL
+@@ -180,7 +180,7 @@
+     $plib .= " -MCross=$::Cross::platform" if defined $::Cross::platform;
+     my $ucopts = '-"Q" -"O"';
+     $str .=  
+-        qq{\n\t\$(PERL) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
++        qq{\n\t\$(PERLRUN) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
+     open (FILELIST, ">$table.fnm")
+         || die "Could not open $table.fnm: $!";
+     foreach my $file (@{$tables{$table}})
+Index: b/cpan/Encode/CN/Makefile.PL
+===================================================================
+--- a/cpan/Encode/CN/Makefile.PL
++++ b/cpan/Encode/CN/Makefile.PL
+@@ -156,7 +156,7 @@
+     $plib .= " -MCross=$::Cross::platform" if defined $::Cross::platform;
+     my $ucopts = '-"Q"';
+     $str .=  
+-        qq{\n\t\$(PERL) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
++        qq{\n\t\$(PERLRUN) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
+     open (FILELIST, ">$table.fnm")
+         || die "Could not open $table.fnm: $!";
+     foreach my $file (@{$tables{$table}})
+Index: b/cpan/Encode/EBCDIC/Makefile.PL
+===================================================================
+--- a/cpan/Encode/EBCDIC/Makefile.PL
++++ b/cpan/Encode/EBCDIC/Makefile.PL
+@@ -137,7 +137,7 @@
+     $plib .= " -MCross=$::Cross::platform" if defined $::Cross::platform;
+     my $ucopts = '-"Q" -"O"';
+     $str .=  
+-        qq{\n\t\$(PERL) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
++        qq{\n\t\$(PERLRUN) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
+     open (FILELIST, ">$table.fnm")
+         || die "Could not open $table.fnm: $!";
+     foreach my $file (@{$tables{$table}})
+Index: b/cpan/Encode/JP/Makefile.PL
+===================================================================
+--- a/cpan/Encode/JP/Makefile.PL
++++ b/cpan/Encode/JP/Makefile.PL
+@@ -156,7 +156,7 @@
+     $plib .= " -MCross=$::Cross::platform" if defined $::Cross::platform;
+     my $ucopts = '-"Q"';
+     $str .=  
+-        qq{\n\t\$(PERL) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
++        qq{\n\t\$(PERLRUN) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
+     open (FILELIST, ">$table.fnm")
+         || die "Could not open $table.fnm: $!";
+     foreach my $file (@{$tables{$table}})
+Index: b/cpan/Encode/KR/Makefile.PL
+===================================================================
+--- a/cpan/Encode/KR/Makefile.PL
++++ b/cpan/Encode/KR/Makefile.PL
+@@ -154,7 +154,7 @@
+     $plib .= " -MCross=$::Cross::platform" if defined $::Cross::platform;
+     my $ucopts = '-"Q"';
+     $str .=  
+-        qq{\n\t\$(PERL) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
++        qq{\n\t\$(PERLRUN) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
+     open (FILELIST, ">$table.fnm")
+         || die "Could not open $table.fnm: $!";
+     foreach my $file (@{$tables{$table}})
+Index: b/cpan/Encode/Makefile.PL
+===================================================================
+--- a/cpan/Encode/Makefile.PL
++++ b/cpan/Encode/Makefile.PL
+@@ -119,7 +119,7 @@
+     $plib .= " -MCross=$::Cross::platform" if defined $::Cross::platform;
+     my $ucopts = '-"Q" -"O"';
+     $str .=
+-        qq{\n\t\$(PERL) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
++        qq{\n\t\$(PERLRUN) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
+     open (FILELIST, ">$table.fnm")
+         || die "Could not open $table.fnm: $!";
+     foreach my $file (@{$tables{$table}})
+Index: b/cpan/Encode/Symbol/Makefile.PL
+===================================================================
+--- a/cpan/Encode/Symbol/Makefile.PL
++++ b/cpan/Encode/Symbol/Makefile.PL
+@@ -142,7 +142,7 @@
+     $plib .= " -MCross=$::Cross::platform" if defined $::Cross::platform;
+     my $ucopts = '-"Q" -"O"';
+     $str .=  
+-        qq{\n\t\$(PERL) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
++        qq{\n\t\$(PERLRUN) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
+     open (FILELIST, ">$table.fnm")
+         || die "Could not open $table.fnm: $!";
+     foreach my $file (@{$tables{$table}})
+Index: b/cpan/Encode/TW/Makefile.PL
+===================================================================
+--- a/cpan/Encode/TW/Makefile.PL
++++ b/cpan/Encode/TW/Makefile.PL
+@@ -152,7 +152,7 @@
+     $plib .= " -MCross=$::Cross::platform" if defined $::Cross::platform;
+     my $ucopts = '-"Q"';
+     $str .=  
+-        qq{\n\t\$(PERL) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
++        qq{\n\t\$(PERLRUN) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
+     open (FILELIST, ">$table.fnm")
+         || die "Could not open $table.fnm: $!";
+     foreach my $file (@{$tables{$table}})
diff --git a/package/perl/perl-fix-cpan-IPC-SysV.patch b/package/perl/perl-fix-cpan-IPC-SysV.patch
new file mode 100644
index 0000000..911c1a1
--- /dev/null
+++ b/package/perl/perl-fix-cpan-IPC-SysV.patch
@@ -0,0 +1,17 @@
+Use PERLRUN instead of PERL
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/cpan/IPC-SysV/Makefile.PL
+===================================================================
+--- a/cpan/IPC-SysV/Makefile.PL
++++ b/cpan/IPC-SysV/Makefile.PL
+@@ -93,7 +93,7 @@
+ 	@$(RM_F) const-c.inc const-xs.inc
+ 
+ regen:
+-	$(PERL) -I$(PERL_ARCHLIB) -I$(PERL_LIB) regen.pl
++	$(PERLRUN) regen.pl
+ 
+ const-c.inc: lib/IPC/SysV.pm regen.pl
+ 	@$(MAKE) regen
diff --git a/package/perl/perl-fix-test-base-term-t.patch b/package/perl/perl-fix-test-base-term-t.patch
new file mode 100644
index 0000000..724c5d0
--- /dev/null
+++ b/package/perl/perl-fix-test-base-term-t.patch
@@ -0,0 +1,17 @@
+not for upstream
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
diff --git a/package/perl/perl-fix-test-pl.patch b/package/perl/perl-fix-test-pl.patch
new file mode 100644
index 0000000..202c6a6
--- /dev/null
+++ b/package/perl/perl-fix-test-pl.patch
@@ -0,0 +1,18 @@
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/t/test.pl
+===================================================================
+--- a/t/test.pl
++++ b/t/test.pl
+@@ -733,6 +733,10 @@
+ 
+ 	# For subcommands to use.
+ 	$ENV{PERLEXE} = $Perl;
++
++	if ($Config::Config{run}) {
++	    $Perl = './perl';
++	}
+     }
+     return $Perl;
+ }
diff --git a/package/perl/perl-make-ext.patch b/package/perl/perl-make-ext.patch
new file mode 100644
index 0000000..5596298
--- /dev/null
+++ b/package/perl/perl-make-ext.patch
@@ -0,0 +1,24 @@
+Don't use RUN with make (only for perl)
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/make_ext.pl
+===================================================================
+--- a/make_ext.pl
++++ b/make_ext.pl
+@@ -458,11 +458,13 @@
+ 	# Give makefile an opportunity to rewrite itself.
+ 	# reassure users that life goes on...
+ 	my @args = ('config', @$pass_through);
+-	system(@run, @make, @args) and print "@run @make @args failed, continuing anyway...\n";
++#	system(@run, @make, @args) and print "@run @make @args failed, continuing anyway...\n";
++	system(@make, @args) and print "@run @make @args failed, continuing anyway...\n";
+     }
+     my @targ = ($target, @$pass_through);
+     print "Making $target in $ext_dir\n at run @make @targ\n";
+-    my $code = system(@run, @make, @targ);
++#    my $code = system(@run, @make, @targ);
++    my $code = system(@make, @targ);
+     die "Unsuccessful make($ext_dir): code=$code" if $code != 0;
+ 
+     chdir $return_dir || die "Cannot cd to $return_dir: $!";
diff --git a/package/perl/perl-mkppport.patch b/package/perl/perl-mkppport.patch
new file mode 100644
index 0000000..97f27a2
--- /dev/null
+++ b/package/perl/perl-mkppport.patch
@@ -0,0 +1,37 @@
+Add RUN
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
diff --git a/package/perl/perl-rewrite-tests-with-which-perl.patch b/package/perl/perl-rewrite-tests-with-which-perl.patch
new file mode 100644
index 0000000..a67522e
--- /dev/null
+++ b/package/perl/perl-rewrite-tests-with-which-perl.patch
@@ -0,0 +1,175 @@
+Allows to run tests via qemu user mode
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/t/io/dup.t
+===================================================================
+--- a/t/io/dup.t
++++ b/t/io/dup.t
+@@ -9,6 +9,8 @@
+ use Config;
+ no warnings 'once';
+ 
++my $Perl = which_perl();
++
+ my $test = 1;
+ my $tests_needing_perlio = 17;
+ plan(12 + $tests_needing_perlio);
+@@ -29,7 +31,7 @@
+ print STDERR "ok 3\n";
+ 
+ # Since some systems don't have echo, we use Perl.
+-$echo = qq{$^X -le "print q(ok %d)"};
++$echo = qq{$Perl -le "print q(ok %d)"};
+ 
+ $cmd = sprintf $echo, 4;
+ print `$cmd`;
+Index: b/t/io/fflush.t
+===================================================================
+--- a/t/io/fflush.t
++++ b/t/io/fflush.t
+@@ -14,6 +14,8 @@
+ use warnings;
+ use strict;
+ 
++my $Perl = which_perl();
++
+ # This attempts to mirror the #ifdef forest found in perl.h so that we
+ # know when to run these tests.  If that forest ever changes, change
+ # it here too or expect test gratuitous test failures.
+@@ -28,7 +30,7 @@
+ 
+ plan(tests => 7);
+ 
+-my $runperl = $^X =~ m/\s/ ? qq{"$^X"} : $^X;
++my $runperl = $Perl =~ m/\s/ ? qq{"$Perl"} : $Perl;
+ $runperl .= qq{ "-I../lib"};
+ 
+ sub file_eq {
+Index: b/t/lib/1_compile.t
+===================================================================
+--- a/t/lib/1_compile.t
++++ b/t/lib/1_compile.t
+@@ -7,12 +7,15 @@
+ BEGIN {
+     chdir 't';
+     @INC = '../lib';
++    require './test.pl';
+ }
+ 
+ use strict;
+ use warnings;
+ use File::Spec::Functions;
+ 
++my $Perl = which_perl();
++
+ # Okay, this is the list.
+ 
+ my @Core_Modules = grep /\S/, <DATA>;
+@@ -59,7 +62,7 @@
+     my $compmod = catfile(curdir(), 'lib', 'compmod.pl');
+     my $lib     = '-I' . catdir(updir(), 'lib');
+ 
+-    my $out = scalar `$^X $lib $compmod $module`;
++    my $out = scalar `$Perl $lib $compmod $module`;
+     print "# $out";
+     return $out =~ /^ok/;
+ }
+Index: b/t/op/die_exit.t
+===================================================================
+--- a/t/op/die_exit.t
++++ b/t/op/die_exit.t
+@@ -15,6 +15,8 @@
+ 
+ skip_all('broken on MPE/iX') if $^O eq 'mpeix';
+ 
++my $Perl = which_perl();
++
+ $| = 1;
+ 
+ my @tests = (
+@@ -66,10 +68,10 @@
+     my($bang, $query, $code) = @$test;
+     $code ||= 'die;';
+     if ($^O eq 'MSWin32' || $^O eq 'NetWare' || $^O eq 'VMS') {
+-        system(qq{$^X -e "\$! = $bang; \$? = $query; $code"});
++        system(qq{$Perl -e "\$! = $bang; \$? = $query; $code"});
+     }
+     else {
+-        system(qq{$^X -e '\$! = $bang; \$? = $query; $code'});
++        system(qq{$Perl -e '\$! = $bang; \$? = $query; $code'});
+     }
+     my $exit = $?;
+ 
+Index: b/t/op/lex_assign.t
+===================================================================
+--- a/t/op/lex_assign.t
++++ b/t/op/lex_assign.t
+@@ -3,12 +3,15 @@
+ BEGIN {
+     chdir 't' if -d 't';
+     @INC = '../lib';
++    require './test.pl';
+ }
+ 
++my $Perl = which_perl();
++
+ $| = 1;
+ umask 0;
+ $xref = \ "";
+-$runme = $^X;
++$runme = $Perl;
+ @a = (1..5);
+ %h = (1..6);
+ $aref = \@a;
+Index: b/t/op/srand.t
+===================================================================
+--- a/t/op/srand.t
++++ b/t/op/srand.t
+@@ -12,6 +12,8 @@
+ require "test.pl";
+ plan(tests => 9);
+ 
++my $Perl = which_perl();
++
+ # Generate a load of random numbers.
+ # int() avoids possible floating point error.
+ sub mk_rand { map int rand 10000, 1..100; }
+@@ -52,9 +54,9 @@
+ }
+ 
+ # This test checks whether Perl called srand for you.
+- at first_run  = `$^X -le "print int rand 100 for 1..100"`;
++ at first_run  = `$Perl -le "print int rand 100 for 1..100"`;
+ sleep(1); # in case our srand() is too time-dependent
+- at second_run = `$^X -le "print int rand 100 for 1..100"`;
++ at second_run = `$Perl -le "print int rand 100 for 1..100"`;
+ 
+ ok( !eq_array(\@first_run, \@second_run), 'srand() called automatically');
+ 
+Index: b/t/run/switchF1.t
+===================================================================
+--- a/t/run/switchF1.t
++++ b/t/run/switchF1.t
+@@ -1,4 +1,13 @@
+ #!perl -w
++
++BEGIN {
++    chdir 't' if -d 't';
++    @INC = qw(. ../lib);
++    require './test.pl';
++}
++
++my $Perl = which_perl();
++
+ print "1..5\n";
+ 
+ my $file = "Run_switchF1.pl";
+@@ -26,6 +35,6 @@
+ print F $prog;
+ close F or die "Close $file: $!";
+ 
+-print system ($^X, $file) ? "not ok 5\n" : "ok 5\n";
++print system ($Perl, $file) ? "not ok 5\n" : "ok 5\n";
+ 
+ unlink $file or die "Unlink $file: $!";
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
new file mode 100644
index 0000000..813d8bf
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
+		-Dqemulib=$(STAGING_DIR) \
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
+	$(INSTALL) -m 755 $(@D)/libperl.so $(STAGING_DIR)/usr/lib/libperl.so
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
+		$(PERL_USE_DEVEL)
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
