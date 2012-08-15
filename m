From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 15 Aug 2012 16:38:30 +0200
Subject: [Buildroot] [PATCH 08/12] perl: new package
In-Reply-To: <1345041514-31539-1-git-send-email-francois.perrad@gadz.org>
References: <1345041514-31539-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1345041514-31539-8-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                             |    1 +
 package/perl/Config.in                        |   31 +++++
 package/perl/perl-add-patch-Makefile-SH.patch |   82 +++++++++++++
 package/perl/perl-configure-qemu.patch        |   22 ++++
 package/perl/perl-fix-installperl.patch       |   25 ++++
 package/perl/perl-run-perl-lib.patch          |   98 ++++++++++++++++
 package/perl/perl.mk                          |  156 +++++++++++++++++++++++++
 7 files changed, 415 insertions(+)
 create mode 100644 package/perl/Config.in
 create mode 100644 package/perl/perl-add-patch-Makefile-SH.patch
 create mode 100644 package/perl/perl-configure-qemu.patch
 create mode 100644 package/perl/perl-fix-installperl.patch
 create mode 100644 package/perl/perl-run-perl-lib.patch
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
index 0000000..4b52e96
--- /dev/null
+++ b/package/perl/Config.in
@@ -0,0 +1,31 @@
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
+config BR2_PACKAGE_PERL_TEST_HOST
+	bool "test host"
+	help
+	  Run 'make test' after the building of host-perl.
+
+config BR2_PACKAGE_PERL_INSTALL_TESTSUITE
+	bool "install testsuite"
+	help
+	  Install the test suite (~500000 tests) on target.
+		# cd /root/perl/t
+		# rm -f perl
+		# ln -s /usr/bin/perl perl
+		# ./perl TEST
+
+endif
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
new file mode 100644
index 0000000..2d9c0dd
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
diff --git a/package/perl/perl-run-perl-lib.patch b/package/perl/perl-run-perl-lib.patch
new file mode 100644
index 0000000..15e0edc
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
new file mode 100644
index 0000000..f1859f0
--- /dev/null
+++ b/package/perl/perl.mk
@@ -0,0 +1,156 @@
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
+PERL_DEPENDENCIES = host-perl
+PERL_INSTALL_STAGING = YES
+
+ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
+PERL_USE_DEVEL=-Dusedevel
+endif
+
+# Host
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
+	$(HOST_PERL_MAKE_TEST)
+endef
+
+ifdef BR2_PACKAGE_PERL_TEST_HOST
+define HOST_PERL_MAKE_TEST
+	$(MAKE) -C $(@D) test
+endef
+endif
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
+# Target
+PERL_ARCH=$(call qstrip,$(BR2_ARCH))
+ifeq ($(PERL_ARCH),i686)
+    PERL_ARCH=i386
+endif
+PERL_QEMU_USER_MODE=qemu-$(PERL_ARCH)
+
+define PERL_CONFIGURE_COMMON
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
+		-e '/^run=/d' \
+		$(@D)/config.sh
+	echo "myarchname='$(GNU_TARGET_NAME)'"                  >>$(@D)/config.sh
+	echo "mydomain=''"                                      >>$(@D)/config.sh
+	echo "myhostname='$(BR2_TARGET_GENERIC_HOSTNAME)'"      >>$(@D)/config.sh
+	echo "myuname='Buildroot $(BR2_VERSION_FULL)'"          >>$(@D)/config.sh
+	echo "osname='linux'"                                   >>$(@D)/config.sh
+	echo "osvers='$(BR2_LINUX_KERNEL_VERSION)'"             >>$(@D)/config.sh
+	echo "perladmin='root'"                                 >>$(@D)/config.sh
+	echo "run=''"                                           >>$(@D)/config.sh
+	cd $(@D); ./Configure -S
+	cp $(@D)/config.h $(@D)/xconfig.h
+endef
+
+define PERL_CONFIGURE_CMDS
+	$(PERL_CONFIGURE_COMMON)
+	cd $(@D); patch -p1 < Cross/Makefile-buildroot-SH.patch
+	$(INSTALL) -m 755 $(HOST_DIR)/usr/bin/miniperl $(@D)/miniperl
+	$(INSTALL) -m 755 $(HOST_DIR)/usr/bin/generate_uudmap $(@D)/generate_uudmap
+endef
+
+define PERL_BUILD_CMDS
+	$(MAKE) RUN_PERL=$(HOST_DIR)/usr/bin/perl \
+		-C $(@D) all
+endef
+
+define PERL_INSTALL_STAGING_CMDS
+	$(MAKE) INSTALL_DEPENDENCE= \
+		INSTALLFLAGS= \
+		RUN_PERL=$(HOST_DIR)/usr/bin/perl \
+		DESTDIR="$(STAGING_DIR)" \
+		-C $(@D) install.perl
+endef
+
+define PERL_INSTALL_TARGET_CMDS
+	$(MAKE) INSTALL_DEPENDENCE= \
+		INSTALLFLAGS=-p \
+		RUN_PERL=$(HOST_DIR)/usr/bin/perl \
+		DESTDIR="$(TARGET_DIR)" \
+		-C $(@D) install.perl
+	$(PERL_INSTALL_TESTSUITE)
+endef
+
+ifdef BR2_PACKAGE_PERL_INSTALL_TESTSUITE
+define PERL_INSTALL_TESTSUITE
+	$(INSTALL) -m644 -D $(@D)/MANIFEST $(TARGET_DIR)/root/perl/MANIFEST
+	$(SED)     '/^cpan\/CPAN/d' \
+		-e '/^cpan\/ExtUtils/d' \
+		-e '/^cpan\/Module-Build/d' \
+		-e '/^dist\/ExtUtils/d' \
+		-e '/^lib\/ExtUtils/d' \
+		$(TARGET_DIR)/root/perl/MANIFEST
+	$(INSTALL) -m644 -D $(@D)/TestInit.pm $(TARGET_DIR)/root/perl/TestInit.pm
+	cp -r $(@D)/cpan    $(TARGET_DIR)/root/perl/cpan
+	cp -r $(@D)/dist    $(TARGET_DIR)/root/perl/dist
+	cp -r $(@D)/ext     $(TARGET_DIR)/root/perl/ext
+	cp -r $(@D)/lib     $(TARGET_DIR)/root/perl/lib
+	cp -r $(@D)/regen   $(TARGET_DIR)/root/perl/regen
+	cp -r $(@D)/t       $(TARGET_DIR)/root/perl/t
+	rm -rf $(TARGET_DIR)/root/perl/t/porting
+endef
+endif
+
+define PERL_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.7.9.5
