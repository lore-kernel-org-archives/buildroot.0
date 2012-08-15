From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 15 Aug 2012 16:38:31 +0200
Subject: [Buildroot] [PATCH 09/12] miniperl: new package
In-Reply-To: <1345041514-31539-1-git-send-email-francois.perrad@gadz.org>
References: <1345041514-31539-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1345041514-31539-9-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                               |    1 +
 package/miniperl/Config.in                      |   18 ++++
 package/miniperl/miniperl-configure-qemu.patch  |   22 +++++
 package/miniperl/miniperl-fix-test.patch        |   30 ++++++
 package/miniperl/miniperl-generate-uudmap.patch |   20 ++++
 package/miniperl/miniperl-installperl.patch     |  116 +++++++++++++++++++++++
 package/miniperl/miniperl-make-ext.patch        |   17 ++++
 package/miniperl/miniperl-no-test.patch         |   19 ++++
 package/miniperl/miniperl-target-all.patch      |   17 ++++
 package/miniperl/miniperl.mk                    |   69 ++++++++++++++
 package/perl/Config.in                          |    4 +-
 package/perl/perl.mk                            |    4 +
 12 files changed, 336 insertions(+), 1 deletion(-)
 create mode 100644 package/miniperl/Config.in
 create mode 100644 package/miniperl/miniperl-configure-qemu.patch
 create mode 100644 package/miniperl/miniperl-fix-test.patch
 create mode 100644 package/miniperl/miniperl-generate-uudmap.patch
 create mode 100644 package/miniperl/miniperl-installperl.patch
 create mode 100644 package/miniperl/miniperl-make-ext.patch
 create mode 100644 package/miniperl/miniperl-no-test.patch
 create mode 100644 package/miniperl/miniperl-target-all.patch
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
index 0000000..437c358
--- /dev/null
+++ b/package/miniperl/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_MINIPERL
+	bool "miniperl"
+	help
+	  Perl without dynamic module loader.
+	  Usually used to bootstrap a full Perl (@INC contains only .).
+
+if BR2_PACKAGE_MINIPERL
+
+config BR2_PACKAGE_MINIPERL_INSTALL_TESTSUITE
+	bool "install testsuite"
+	help
+	  Install the test suite on target.
+		# cd /root/miniperl/t
+		# rm -f perl
+		# ln -s /usr/bin/miniperl perl
+		# ./perl TEST base/*.t comp/*.t cmd/*.t run/*.t io/*.t re/*.t op/*.t uni/*.t
+
+endif
diff --git a/package/miniperl/miniperl-configure-qemu.patch b/package/miniperl/miniperl-configure-qemu.patch
new file mode 100644
index 0000000..2d9c0dd
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
+@@ -2908,6 +2908,14 @@ fi
+ $targetrun -l $targetuser $targethost "cd \$cwd && ./\$exe \$@"
+ EOF
+ 	    ;;
++	qemu*)
++	    targetto=cp
++	    targetfrom=cp
++	    cat >$run <<EOF
++#!/bin/sh
++$targetrun -L $qemulib $exe \$@
++EOF
++	    ;;
+ 	*)  echo "Unknown targetrun '$targetrun'" >&4
+ 	    exit 1
+ 	    ;;
diff --git a/package/miniperl/miniperl-fix-test.patch b/package/miniperl/miniperl-fix-test.patch
new file mode 100644
index 0000000..dbc127c
--- /dev/null
+++ b/package/miniperl/miniperl-fix-test.patch
@@ -0,0 +1,30 @@
+re is a XS module
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
+@@ -6,7 +6,7 @@ use unicore::Name;    # mktables-generated algorithmically-defined names
+ use _charnames ();    # The submodule for this where most of the work gets done
+ 
+ use bytes ();          # for $bytes::hint_bits
+-use re "/aa";          # Everything in here should be ASCII
++#use re "/aa";          # Everything in here should be ASCII
+ 
+ # Translate between Unicode character names and their code points.
+ # This is a wrapper around the submodule C<_charnames>.  This design allows
diff --git a/package/miniperl/miniperl-generate-uudmap.patch b/package/miniperl/miniperl-generate-uudmap.patch
new file mode 100644
index 0000000..2ffea87
--- /dev/null
+++ b/package/miniperl/miniperl-generate-uudmap.patch
@@ -0,0 +1,20 @@
+allows to overload GENERATE_UUDMAP with a host executable
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/Makefile.SH
+===================================================================
+--- a/Makefile.SH
++++ b/Makefile.SH
+@@ -651,8 +651,10 @@
+ 
+ uudmap.h mg_data.h: bitcount.h
+ 
++RUN_GENERATE_UUDMAP = $(RUN) ./generate_uudmap$(HOST_EXE_EXT)
++
+ bitcount.h: generate_uudmap$(HOST_EXE_EXT)
+-	$(RUN) ./generate_uudmap$(HOST_EXE_EXT) $(generated_headers)
++	$(RUN_GENERATE_UUDMAP) $(generated_headers)
+ 
+ generate_uudmap$(OBJ_EXT): mg_raw.h
+ 
diff --git a/package/miniperl/miniperl-installperl.patch b/package/miniperl/miniperl-installperl.patch
new file mode 100644
index 0000000..a74d950
--- /dev/null
+++ b/package/miniperl/miniperl-installperl.patch
@@ -0,0 +1,116 @@
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
+@@ -118,19 +118,19 @@
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
+@@ -247,7 +247,7 @@
+ 
+ if (!$Is_NetWare) {
+ if (!$Is_VMS) {
+--x 'perl' . $exe_ext	|| die "perl isn't executable!\n";
++-x 'miniperl' . $exe_ext	|| die "miniperl isn't executable!\n";
+ }
+ else {
+ -x $ndbg . 'perl' . $exe_ext	|| die "${ndbg}perl$exe_ext isn't executable!\n";
+@@ -363,7 +363,7 @@
+ }
+ 
+ # Install header files and libraries.
+-mkpath("$installarchlib/CORE", $opts{verbose}, 0777);
++#mkpath("$installarchlib/CORE", $opts{verbose}, 0777);
+ my @corefiles;
+ if ($Is_VMS) {  # We did core file selection during build
+     my $coredir = "lib/$Config{archname}/$ver/CORE";
+@@ -401,18 +401,18 @@
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
+@@ -773,7 +773,7 @@
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
index 0000000..f237c04
--- /dev/null
+++ b/package/miniperl/miniperl-make-ext.patch
@@ -0,0 +1,17 @@
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/make_ext.pl
+===================================================================
+--- a/make_ext.pl
++++ b/make_ext.pl
+@@ -271,7 +271,8 @@ sub build_extension {
+     my $up = $ext_dir;
+     $up =~ s![^/]+!..!g;
+ 
+-    $perl ||= "$up/miniperl";
++    my @miniperl = split ' ', $ENV{MINIPERL};
++    $perl ||= $miniperl[-2];
+     my $return_dir = $up;
+     my $lib_dir = "$up/lib";
+     $ENV{PERL_CORE} = 1;
diff --git a/package/miniperl/miniperl-no-test.patch b/package/miniperl/miniperl-no-test.patch
new file mode 100644
index 0000000..e00ef05
--- /dev/null
+++ b/package/miniperl/miniperl-no-test.patch
@@ -0,0 +1,19 @@
+cannot run test on host
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/Makefile.SH
+===================================================================
+--- a/Makefile.SH
++++ b/Makefile.SH
+--- a/Makefile.SH
++++ b/Makefile.SH
+@@ -873,7 +873,7 @@
+ 	- at rm -f miniperl.xok
+ 	$(LDLIBPTH) $(CC) $(CLDFLAGS) -o $(MINIPERL_EXE) \
+ 	    $(mini_obj) $(libs)
+-	$(LDLIBPTH) $(RUN) ./miniperl$(HOST_EXE_EXT) -w -Ilib -MExporter -e '<?>' || $(MAKE) minitest
++#	$(LDLIBPTH) $(RUN) ./miniperl$(HOST_EXE_EXT) -w -Ilib -MExporter -e '<?>' || $(MAKE) minitest
+ !NO!SUBS!
+ 		;;
+ 	esac
diff --git a/package/miniperl/miniperl-target-all.patch b/package/miniperl/miniperl-target-all.patch
new file mode 100644
index 0000000..4c2f6ca
--- /dev/null
+++ b/package/miniperl/miniperl-target-all.patch
@@ -0,0 +1,17 @@
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
++all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(private) $(unidatafiles) $(nonxs_ext)
+ 	@echo " ";
+ 	@echo "	Everything is up to date. Type '$(MAKE) test' to run test suite."
+ 
diff --git a/package/miniperl/miniperl.mk b/package/miniperl/miniperl.mk
new file mode 100644
index 0000000..ae807bd
--- /dev/null
+++ b/package/miniperl/miniperl.mk
@@ -0,0 +1,69 @@
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
+MINIPERL_DEPENDENCIES = host-perl
+
+define MINIPERL_CONFIGURE_CMDS
+	$(PERL_CONFIGURE_COMMON)
+	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
+endef
+
+define MINIPERL_BUILD_CMDS
+	$(MAKE) RUN_GENERATE_UUDMAP=$(HOST_DIR)/usr/bin/generate_uudmap \
+		MINIPERL="$(HOST_DIR)/usr/bin/perl -Ilib" \
+		RUN_PERL=$(HOST_DIR)/usr/bin/perl \
+		-C $(@D) all
+endef
+
+define MINIPERL_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 $(@D)/miniperl $(TARGET_DIR)/usr/bin/miniperl
+	$(MAKE) INSTALL_DEPENDENCE= \
+		INSTALLFLAGS=-p \
+		RUN_PERL=$(HOST_DIR)/usr/bin/perl \
+		DESTDIR="$(TARGET_DIR)" \
+		-C $(@D) install.perl
+	# File::Spec is a pure module but packaged in a XS module
+	$(INSTALL) -m644 -D $(@D)/dist/Cwd/lib/File/Spec.pm             $(TARGET_DIR)/usr/lib/perl5/$(MINIPERL_VERSION)/File/Spec.pm
+	$(INSTALL) -m644 -D $(@D)/dist/Cwd/lib/File/Spec/Functions.pm   $(TARGET_DIR)/usr/lib/perl5/$(MINIPERL_VERSION)/File/Spec/Functions.pm
+	$(INSTALL) -m644 -D $(@D)/dist/Cwd/lib/File/Spec/Unix.pm        $(TARGET_DIR)/usr/lib/perl5/$(MINIPERL_VERSION)/File/Spec/Unix.pm
+	$(MINIPERL_INSTALL_TESTSUITE)
+endef
+
+ifdef BR2_PACKAGE_MINIPERL_INSTALL_TESTSUITE
+define MINIPERL_INSTALL_TESTSUITE
+	$(INSTALL) -m644 -D $(@D)/MANIFEST              $(TARGET_DIR)/root/miniperl/MANIFEST
+	$(INSTALL) -m644 -D $(@D)/t/TEST                $(TARGET_DIR)/root/miniperl/t/TEST
+	$(INSTALL) -m644 -D $(@D)/t/harness             $(TARGET_DIR)/root/miniperl/t/harness
+	$(INSTALL) -m644 -D $(@D)/t/test.pl             $(TARGET_DIR)/root/miniperl/t/test.pl
+	$(INSTALL) -m644 -D $(@D)/t/thread_it.pl        $(TARGET_DIR)/root/miniperl/t/thread_it.pl
+	cp -r $(@D)/lib         $(TARGET_DIR)/root/miniperl/lib
+	cp -r $(@D)/t/base      $(TARGET_DIR)/root/miniperl/t/base
+	cp -r $(@D)/t/comp      $(TARGET_DIR)/root/miniperl/t/comp
+	cp -r $(@D)/t/cmd       $(TARGET_DIR)/root/miniperl/t/cmd
+	cp -r $(@D)/t/run       $(TARGET_DIR)/root/miniperl/t/run
+	cp -r $(@D)/t/io        $(TARGET_DIR)/root/miniperl/t/io
+	cp -r $(@D)/t/lib       $(TARGET_DIR)/root/miniperl/t/lib
+	cp -r $(@D)/t/re        $(TARGET_DIR)/root/miniperl/t/re
+	cp -r $(@D)/t/op        $(TARGET_DIR)/root/miniperl/t/op
+	cp -r $(@D)/t/uni       $(TARGET_DIR)/root/miniperl/t/uni
+	echo "BEGIN { chdir 't' if -d 't'; @INC = ('../lib', '.'); } 1;" > $(TARGET_DIR)/root/miniperl/TestInit.pm
+	# File::Spec is a pure module but packaged in a XS module
+	$(INSTALL) -m644 -D $(@D)/dist/Cwd/lib/File/Spec.pm             $(TARGET_DIR)/root/miniperl/lib/File/Spec.pm
+	$(INSTALL) -m644 -D $(@D)/dist/Cwd/lib/File/Spec/Functions.pm   $(TARGET_DIR)/root/miniperl/lib/File/Spec/Functions.pm
+	$(INSTALL) -m644 -D $(@D)/dist/Cwd/lib/File/Spec/Unix.pm        $(TARGET_DIR)/root/miniperl/lib/File/Spec/Unix.pm
+endef
+endif
+
+define MINIPERL_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
diff --git a/package/perl/Config.in b/package/perl/Config.in
index 4b52e96..06b31d4 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -7,13 +7,15 @@ config BR2_PACKAGE_PERL
 
 	  http://www.perl.org/
 
-if BR2_PACKAGE_PERL
 
 config BR2_PACKAGE_PERL_CUSTOM_CONFIGURE
 	string "configuration flags"
+	depends on BR2_PACKAGE_PERL || BR2_PACKAGE_MINIPERL
 	help
 	  Allows to add some flags to Configure.
 
+if BR2_PACKAGE_PERL
+
 config BR2_PACKAGE_PERL_TEST_HOST
 	bool "test host"
 	help
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index f1859f0..9fcba89 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -17,6 +17,10 @@ ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
 PERL_USE_DEVEL=-Dusedevel
 endif
 
+ifneq ($(MINIPERL_VERSION), $(PERL_VERSION))
+$(error "MINIPERL_VERSION must be aligned with PERL_VERSION")
+endif
+
 # Host
 define HOST_PERL_CONFIGURE_CMDS
 	cd $(@D); ./Configure -des \
-- 
1.7.9.5
