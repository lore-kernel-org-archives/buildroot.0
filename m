From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  9 Nov 2012 11:04:01 +0100
Subject: [Buildroot] [PATCH] perl: fix build
Message-ID: <1352455441-4836-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qemu-i386 & qemu-x86_64 cannot run properly miniperl with system(),
see https://bugs.launchpad.net/qemu/+bug/1076445

replace qemu/miniperl by host-perl.

qemu is still used during the configure step (and cpanminus).

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cpanminus/Config.in                   |    1 +
 package/perl/perl-add-patch-Makefile-SH.patch |   82 +++++++++++++++++++++
 package/perl/perl-configure-qemu.patch        |    4 +-
 package/perl/perl-fix-Module-Build.patch      |   16 ----
 package/perl/perl-fix-installperl.patch       |   25 +++++++
 package/perl/perl-mkppport.patch              |   37 ----------
 package/perl/perl-run-perl-lib.patch          |   98 +++++++++++++++++++++++++
 package/perl/perl.mk                          |   50 ++++++++++---
 8 files changed, 249 insertions(+), 64 deletions(-)
 create mode 100644 package/perl/perl-add-patch-Makefile-SH.patch
 delete mode 100644 package/perl/perl-fix-Module-Build.patch
 create mode 100644 package/perl/perl-fix-installperl.patch
 delete mode 100644 package/perl/perl-mkppport.patch
 create mode 100644 package/perl/perl-run-perl-lib.patch

diff --git a/package/cpanminus/Config.in b/package/cpanminus/Config.in
index b8b39dc..e8c1aad 100644
--- a/package/cpanminus/Config.in
+++ b/package/cpanminus/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CPANMINUS
 	bool "cpanminus"
+	depends on !BR2_i386 && !BR2_x86_64
 	help
 	  cpanminus is a script to get, unpack, build and install Perl modules
 	  from CPAN.
diff --git a/package/perl/perl-add-patch-Makefile-SH.patch b/package/perl/perl-add-patch-Makefile-SH.patch
new file mode 100644
index 0000000..ba49be7
--- /dev/null
+++ b/package/perl/perl-add-patch-Makefile-SH.patch
@@ -0,0 +1,82 @@
+add a patch which must applied only for perl (not for host-perl)
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/Cross/Makefile-buildroot-SH.patch
+===================================================================
+--- /dev/null
++++ b/Cross/Makefile-buildroot-SH.patch
+@@ -0,0 +1,73 @@
++remove rules for miniperl & generates_uudmap which come from host-perl
++
++Index: b/Makefile.SH
++===================================================================
++--- a/Makefile.SH
+++++ b/Makefile.SH
++@@ -654,10 +654,7 @@
++ bitcount.h: generate_uudmap$(HOST_EXE_EXT)
++ 	$(RUN) ./generate_uudmap$(HOST_EXE_EXT) $(generated_headers)
++ 
++-generate_uudmap$(OBJ_EXT): mg_raw.h
++-
++-generate_uudmap$(HOST_EXE_EXT): generate_uudmap$(OBJ_EXT)
++-	$(CC) -o generate_uudmap$(EXE_EXT) $(LDFLAGS) generate_uudmap$(OBJ_EXT) $(libs)
+++# generate_uudmap$(HOST_EXE_EXT) comes from host-perl
++ 
++ miniperlmain$(OBJ_EXT): miniperlmain.c patchlevel.h
++ 	$(CCCMD) $(PLDLFLAGS) $*.c
++@@ -829,52 +826,9 @@
++ 
++ !NO!SUBS!
++ 
++-	case "${osname}${osvers}" in
++-	aix*|beos*)
++-		$spitshell >>$Makefile <<'!NO!SUBS!'
++-$(MINIPERL_EXE): $& $(mini_obj)
++-	$(CC) -o $(MINIPERL_EXE) $(CLDFLAGS) $(mini_obj) $(libs)
++-	$(LDLIBPTH) $(RUN) ./miniperl$(HOST_EXE_EXT) -w -Ilib -MExporter -e '<?>' || $(MAKE) minitest
++-!NO!SUBS!
++-		;;
++-	next4*)
++-		$spitshell >>$Makefile <<'!NO!SUBS!'
++-$(MINIPERL_EXE): $& $(mini_obj)
++-	$(CC) -o $(MINIPERL_EXE) $(mini_obj) $(libs)
++-	$(LDLIBPTH) $(RUN) ./miniperl$(HOST_EXE_EXT) -w -Ilib -MExporter -e '<?>' || $(MAKE) minitest
++-!NO!SUBS!
++-		;;
++-	darwin*)
++-		case "$osvers" in
++-		[1-6].*) ;;
++-		*) case "$ldflags" in
++-		    *"-flat_namespace"*) ;;
++-		    *) # to allow opmini.o to override stuff in libperl.dylib
++-		$spitshell >>$Makefile <<!NO!SUBS!
++-NAMESPACEFLAGS = -force_flat_namespace
++-!NO!SUBS!
++-		       ;;
++-		    esac
++-		    ;;
++-		esac
++-		$spitshell >>$Makefile <<'!NO!SUBS!'
++-$(MINIPERL_EXE): $& $(mini_obj)
++-	-@rm -f miniperl.xok
++-	$(CC) $(CLDFLAGS) $(NAMESPACEFLAGS) -o $(MINIPERL_EXE) \
++-	    $(mini_obj) $(libs)
++-	$(LDLIBPTH) $(RUN) ./miniperl$(HOST_EXE_EXT) -w -Ilib -MExporter -e '<?>' || $(MAKE) minitest
++-!NO!SUBS!
++-		;;
++-	*)
++-		$spitshell >>$Makefile <<'!NO!SUBS!'
++-$(MINIPERL_EXE): $& $(mini_obj)
++-	-@rm -f miniperl.xok
++-	$(LDLIBPTH) $(CC) $(CLDFLAGS) -o $(MINIPERL_EXE) \
++-	    $(mini_obj) $(libs)
++-	$(LDLIBPTH) $(RUN) ./miniperl$(HOST_EXE_EXT) -w -Ilib -MExporter -e '<?>' || $(MAKE) minitest
+++	$spitshell >>$Makefile <<'!NO!SUBS!'
+++# $(MINIPERL_EXE) comes from host-perl
++ !NO!SUBS!
++-		;;
++-	esac
++ 
++ 	$spitshell >>$Makefile <<'!NO!SUBS!'
++ 
diff --git a/package/perl/perl-configure-qemu.patch b/package/perl/perl-configure-qemu.patch
index c2d6b92..ddd53ae 100644
--- a/package/perl/perl-configure-qemu.patch
+++ b/package/perl/perl-configure-qemu.patch
@@ -23,7 +23,7 @@ Index: b/Configure
  	'') targetfrom=scp ;;
  	esac
 -    	run=$run-$targetrun
-+    	run=$run-`basename $targetrun`
++    	run=$run-`basename \`echo "$targetrun" | sed -e 's/^\([^ \t]*\).*$/\1/'\``
      	to=$to-$targetto
      	from=$from-$targetfrom
  	case "$targetdir" in
@@ -36,7 +36,7 @@ Index: b/Configure
 +	    from=:
 +	    cat >$run <<EOF
 +#!/bin/sh
-+$targetrun -L $qemulib "\$@"
++$targetrun "\$@"
 +EOF
 +	    ;;
  	*)  echo "Unknown targetrun '$targetrun'" >&4
diff --git a/package/perl/perl-fix-Module-Build.patch b/package/perl/perl-fix-Module-Build.patch
deleted file mode 100644
index 26b15e4..0000000
--- a/package/perl/perl-fix-Module-Build.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-Index: b/cpan/Module-Build/lib/Module/Build/Base.pm
-===================================================================
---- a/cpan/Module-Build/lib/Module/Build/Base.pm
-+++ b/cpan/Module-Build/lib/Module/Build/Base.pm
-@@ -456,7 +456,7 @@
-   my $proto = shift;
-   my $c     = ref($proto) ? $proto->{config} : 'Module::Build::Config';
- 
--  my $perl  = $^X;
-+  my $perl  = $ENV{RUN_PERL} || $^X;
-   my $perl_basename = File::Basename::basename($perl);
- 
-   my @potential_perls;
diff --git a/package/perl/perl-fix-installperl.patch b/package/perl/perl-fix-installperl.patch
new file mode 100644
index 0000000..e9a9f81
--- /dev/null
+++ b/package/perl/perl-fix-installperl.patch
@@ -0,0 +1,25 @@
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
diff --git a/package/perl/perl-mkppport.patch b/package/perl/perl-mkppport.patch
deleted file mode 100644
index 97f27a2..0000000
--- a/package/perl/perl-mkppport.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Add RUN
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-Index: b/mkppport
-===================================================================
---- a/mkppport
-+++ b/mkppport
-@@ -1,6 +1,7 @@
- use strict;
- use warnings;
- 
-+use Config;
- use Getopt::Long;
- use File::Spec;
- use File::Compare qw( compare );
-@@ -136,14 +137,18 @@
- #----------------------------------------------
- sub run
- {
-+  my @run = $Config{run};
-+  @run = () if not defined $run[0] or $run[0] eq '';
-   my @args = ("-I" . File::Spec->catdir((File::Spec->updir) x 2, 'lib'), @_);
-   my $run = $perl =~ m/\s/ ? qq("$perl") : $perl;
-   for (@args) {
-     $_ = qq("$_") if $^O eq 'VMS' && /^[^"]/;
-     $run .= " $_";
-   }
--  print "running $run\n";
--  system $run and die "$run failed: $?\n";
-+#  print "running $run\n";
-+#  system $run and die "$run failed: $?\n";
-+  print "running ", join(' ', @run, $run), "\n";
-+  system join(' ', @run, $run) and die "@run $run failed: $?\n";
- }
- 
- __END__
diff --git a/package/perl/perl-run-perl-lib.patch b/package/perl/perl-run-perl-lib.patch
new file mode 100644
index 0000000..2a4be0d
--- /dev/null
+++ b/package/perl/perl-run-perl-lib.patch
@@ -0,0 +1,98 @@
+RUN_PERL is overloaded by host-perl which cannot use target libraries
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/Makefile.SH
+===================================================================
+--- a/Makefile.SH
++++ b/Makefile.SH
+@@ -309,7 +309,7 @@
+ 
+ # Macros to invoke a copy of our fully operational perl during the build.
+ PERL_EXE = perl\$(EXE_EXT)
+-RUN_PERL = \$(LDLIBPTH) \$(RUN) ./perl\$(EXE_EXT)
++RUN_PERL = \$(LDLIBPTH) \$(RUN) ./perl\$(EXE_EXT) -Ilib
+ 
+ # Macros to run our tests
+ RUN_TESTS = \$(LDLIBPTH) ./runtests
+@@ -1048,7 +1048,7 @@
+ # But also this ensures that all extensions are built before we try to scan
+ # them, which picks up Devel::PPPort's documentation.
+ pod/perltoc.pod: $(perltoc_pod_prereqs)  $(PERL_EXE) $(ext) pod/buildtoc
+-	$(RUN_PERL) -f -Ilib pod/buildtoc -q
++	$(RUN_PERL) -f pod/buildtoc -q
+ 
+ pod/perlapi.pod: pod/perlintern.pod
+ 
+@@ -1071,13 +1071,13 @@
+ 	done
+ 
+ extras.make: $(PERL_EXE)
+-	- at test ! -s extras.lst || PATH="`pwd`:${PATH}" PERL5LIB="`pwd`/lib" $(RUN_PERL) -Ilib -MCPAN -e '@ARGV&&make(@ARGV)' `cat extras.lst`
++	- at test ! -s extras.lst || PATH="`pwd`:${PATH}" PERL5LIB="`pwd`/lib" $(RUN_PERL) -MCPAN -e '@ARGV&&make(@ARGV)' `cat extras.lst`
+ 
+ extras.test: $(PERL_EXE)
+-	- at test ! -s extras.lst || PATH="`pwd`:${PATH}" PERL5LIB="`pwd`/lib" $(RUN_PERL) -Ilib -MCPAN -e '@ARGV&&test(@ARGV)' `cat extras.lst`
++	- at test ! -s extras.lst || PATH="`pwd`:${PATH}" PERL5LIB="`pwd`/lib" $(RUN_PERL) -MCPAN -e '@ARGV&&test(@ARGV)' `cat extras.lst`
+ 
+ extras.install: $(PERL_EXE)
+-	- at test ! -s extras.lst || PATH="`pwd`:${PATH}" PERL5LIB="`pwd`/lib" $(RUN_PERL) -Ilib -MCPAN -e '@ARGV&&install(@ARGV)' `cat extras.lst`
++	- at test ! -s extras.lst || PATH="`pwd`:${PATH}" PERL5LIB="`pwd`/lib" $(RUN_PERL) -MCPAN -e '@ARGV&&install(@ARGV)' `cat extras.lst`
+ 
+ .PHONY: install install-strip install-all install-verbose install-silent \
+ 	no-install install.perl install.man install.html
+@@ -1180,7 +1180,7 @@
+ regen_meta regen-meta:  META.yml
+ 
+ META.yml:   FORCE
+-	PATH="`pwd`:${PATH}" PERL5LIB="`pwd`/lib" $(RUN_PERL) -Ilib Porting/makemeta
++	PATH="`pwd`:${PATH}" PERL5LIB="`pwd`/lib" $(RUN_PERL) Porting/makemeta
+ 
+ 
+ regen_all regen-all: regen regen_meta
+@@ -1225,7 +1225,7 @@
+
+ .PHONY: printconfig
+ printconfig:
+-	@eval `$(RUN_PERL) -Ilib -V:$(CONFIGVAR)`; echo $$$(CONFIGVAR)
++	@eval `$(RUN_PERL) -V:$(CONFIGVAR)`; echo $$$(CONFIGVAR)
+ 
+ .PHONY: clean _tidy _mopup _cleaner1 _cleaner2 \
+ 	realclean _realcleaner clobber _clobber \
+@@ -1540,28 +1540,28 @@
+ .PHONY: ok okfile oknack okfilenack nok nokfile noknack nokfilenack
+ 
+ ok:	utilities
+-	$(RUN_PERL) -Ilib utils/perlbug -ok -s '(UNINSTALLED)'
++	$(RUN_PERL) utils/perlbug -ok -s '(UNINSTALLED)'
+ 
+ okfile:	utilities
+-	$(RUN_PERL) -Ilib utils/perlbug -ok -s '(UNINSTALLED)' -F perl.ok
++	$(RUN_PERL) utils/perlbug -ok -s '(UNINSTALLED)' -F perl.ok
+ 
+ oknack:	utilities
+-	$(RUN_PERL) -Ilib utils/perlbug -ok -s '(UNINSTALLED)' -A
++	$(RUN_PERL) utils/perlbug -ok -s '(UNINSTALLED)' -A
+ 
+ okfilenack:	utilities
+-	$(RUN_PERL) -Ilib utils/perlbug -ok -s '(UNINSTALLED)' -F perl.ok -A
++	$(RUN_PERL) utils/perlbug -ok -s '(UNINSTALLED)' -F perl.ok -A
+ 
+ nok:	utilities
+-	$(RUN_PERL) -Ilib utils/perlbug -nok -s '(UNINSTALLED)'
++	$(RUN_PERL) utils/perlbug -nok -s '(UNINSTALLED)'
+ 
+ nokfile:	utilities
+-	$(RUN_PERL) -Ilib utils/perlbug -nok -s '(UNINSTALLED)' -F perl.nok
++	$(RUN_PERL) utils/perlbug -nok -s '(UNINSTALLED)' -F perl.nok
+ 
+ noknack:	utilities
+-	$(RUN_PERL) -Ilib utils/perlbug -nok -s '(UNINSTALLED)' -A
++	$(RUN_PERL) utils/perlbug -nok -s '(UNINSTALLED)' -A
+ 
+ nokfilenack:	utilities
+-	$(RUN_PERL) -Ilib utils/perlbug -nok -s '(UNINSTALLED)' -F perl.nok -A
++	$(RUN_PERL) utils/perlbug -nok -s '(UNINSTALLED)' -F perl.nok -A
+ 
+ .PHONY: clist hlist shlist
+ 
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 81dff04..b96ba77 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -12,18 +12,18 @@ PERL_LICENSE = Artistic
 PERL_LICENSE_FILES = Artistic
 PERL_INSTALL_STAGING = YES
 
-PERL_DEPENDENCIES = host-qemu
+PERL_DEPENDENCIES = host-qemu host-perl
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
     PERL_DEPENDENCIES += berkeleydb
 endif
 ifeq ($(BR2_PACKAGE_GDBM),y)
     PERL_DEPENDENCIES += gdbm
 endif
+HOST_PERL_DEPENDENCIES =
 
 PERL_CONF_OPT = -des \
 		-Dusecrosscompile \
 		-Dtargetrun=$(QEMU_USER) \
-		-Dqemulib=$(STAGING_DIR) \
 		-Dar="$(TARGET_AR)" \
 		-Dcc="$(TARGET_CC)" \
 		-Dcpp="$(TARGET_CC)" \
@@ -38,15 +38,41 @@ PERL_CONF_OPT = -des \
 		-Dprefix=/usr \
 		-Uoptimize
 
+HOST_PERL_CONF_OPT = -des \
+		-Dcc="$(HOSTCC)" \
+		-Dprefix="$(HOST_DIR)/usr"
+
 ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
     PERL_CONF_OPT += -Dusedevel
+    HOST_PERL_CONF_OPT += -Dusedevel
 endif
 
 ifneq ($(BR2_LARGEFILE),y)
     PERL_CONF_OPT += -Uuselargefiles
 endif
 
+
+define HOST_PERL_CONFIGURE_CMDS
+	(cd $(@D); ./Configure $(HOST_PERL_CONF_OPT))
+endef
+
+define HOST_PERL_BUILD_CMDS
+	$(MAKE) -C $(@D) all
+endef
+
+define HOST_PERL_INSTALL_CMDS
+	$(MAKE) INSTALL_DEPENDENCE= \
+		-C $(@D) install
+	$(INSTALL) -m 755 $(@D)/miniperl $(HOST_DIR)/usr/bin/miniperl
+	$(INSTALL) -m 755 $(@D)/generate_uudmap $(HOST_DIR)/usr/bin/generate_uudmap
+endef
+
+define HOST_PERL_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
+
 define PERL_CONFIGURE_CMDS
+	(cd $(@D); patch -p1 < Cross/Makefile-buildroot-SH.patch)
 	rm -f $(@D)/config.sh
 	(cd $(@D); ./Configure $(PERL_CONF_OPT))
 	echo "# patched values"                                 >>$(@D)/config.sh
@@ -57,6 +83,7 @@ define PERL_CONFIGURE_CMDS
 		-e '/^osname=/d' \
 		-e '/^osvers=/d' \
 		-e '/^perladmin=/d' \
+		-e '/^run=/d' \
 		$(@D)/config.sh
 	echo "myarchname='$(GNU_TARGET_NAME)'"                  >>$(@D)/config.sh
 	echo "mydomain=''"                                      >>$(@D)/config.sh
@@ -65,21 +92,24 @@ define PERL_CONFIGURE_CMDS
 	echo "osname='linux'"                                   >>$(@D)/config.sh
 	echo "osvers='$(BR2_LINUX_KERNEL_VERSION)'"             >>$(@D)/config.sh
 	echo "perladmin='root'"                                 >>$(@D)/config.sh
+	echo "run=''"                                           >>$(@D)/config.sh
 	(cd $(@D); ./Configure -S)
 	cp $(@D)/config.h $(@D)/xconfig.h
 	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
 endef
 
 define PERL_BUILD_CMDS
-	echo "#!/bin/sh"                                > $(@D)/Cross/miniperl
-	echo "$(QEMU_USER) $(@D)/miniperl \"\$$@\""     >>$(@D)/Cross/miniperl
-	chmod +x $(@D)/Cross/miniperl
-	PERL_MM_OPT="PERL=$(@D)/Cross/miniperl" \
-		$(MAKE) -C $(@D) all
+	rm -f $(@D)/miniperl
+	ln -s $(HOST_DIR)/usr/bin/miniperl $(@D)/miniperl
+	rm -f $(@D)/generate_uudmap
+	ln -s $(HOST_DIR)/usr/bin/generate_uudmap $(@D)/generate_uudmap
+	$(MAKE) RUN_PERL=$(HOST_DIR)/usr/bin/perl \
+		-C $(@D) all
 endef
 
 define PERL_INSTALL_STAGING_CMDS
-	$(MAKE) INSTALL_DEPENDENCE= \
+	$(MAKE) RUN_PERL=$(HOST_DIR)/usr/bin/perl \
+		INSTALL_DEPENDENCE= \
 		INSTALLFLAGS= \
 		DESTDIR="$(STAGING_DIR)" \
 		-C $(@D) install.perl
@@ -122,7 +152,8 @@ define PERL_INSTALL_TARGET_CMDS
 endef
 else
 define PERL_INSTALL_TARGET_CMDS
-	$(MAKE) INSTALL_DEPENDENCE= \
+	$(MAKE) RUN_PERL=$(HOST_DIR)/usr/bin/perl \
+		INSTALL_DEPENDENCE= \
 		INSTALLFLAGS=-p \
 		DESTDIR="$(TARGET_DIR)" \
 		-C $(@D) install.perl
@@ -136,3 +167,4 @@ define PERL_CLEAN_CMDS
 endef
 
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.7.9.5
