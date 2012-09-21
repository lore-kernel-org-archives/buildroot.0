From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 21 Sep 2012 23:38:56 +0200
Subject: [Buildroot] [PATCH v7 01/13] perl: new package
Message-ID: <1348263548-12975-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                      |    1 +
 package/perl/Config.in                 |    8 +++
 package/perl/perl-configure-qemu.patch |   34 +++++++++
 package/perl/perl-make-ext.patch       |   24 +++++++
 package/perl/perl-mkppport.patch       |   37 ++++++++++
 package/perl/perl.mk                   |  119 ++++++++++++++++++++++++++++++++
 6 files changed, 223 insertions(+)
 create mode 100644 package/perl/Config.in
 create mode 100644 package/perl/perl-configure-qemu.patch
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
index 0000000..c8b311a
--- /dev/null
+++ b/package/perl/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PERL
+	bool "perl"
+	help
+	  Larry Wall's Practical Extraction and Report Language
+	  An interpreted scripting language, known among some as "Unix's Swiss
+	  Army Chainsaw".
+
+	  http://www.perl.org/
diff --git a/package/perl/perl-configure-qemu.patch b/package/perl/perl-configure-qemu.patch
new file mode 100644
index 0000000..b988b31
--- /dev/null
+++ b/package/perl/perl-configure-qemu.patch
@@ -0,0 +1,34 @@
+Add qemu support
+
+see https://rt.perl.org/rt3//Public/Bug/Display.html?id=114798
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
++$targetrun -L $qemulib "\$@"
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
diff --git a/package/perl/perl-make-ext.patch b/package/perl/perl-make-ext.patch
new file mode 100644
index 0000000..e0195e7
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
++	system(@make, @args) and print "@make @args failed, continuing anyway...\n";
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
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
new file mode 100644
index 0000000..b3997bc
--- /dev/null
+++ b/package/perl/perl.mk
@@ -0,0 +1,119 @@
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
+    PERL_USE_DEVEL=-Dusedevel
+endif
+
+ifneq ($(BR2_LARGEFILE),y)
+    PERL_NO_LARGEFILE=-Uuselargefiles
+endif
+
+PERL_ARCH=$(ARCH)
+ifeq ($(PERL_ARCH),i686)
+    PERL_ARCH=i386
+endif
+PERL_QEMU_USER_MODE=qemu-$(PERL_ARCH)
+
+define PERL_CONFIGURE_CMDS
+	rm -f $(@D)/config.sh
+	(cd $(@D); ./Configure -des \
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
+		$(PERL_NO_LARGEFILE))
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
+	(cd $(@D); ./Configure -S)
+	cp $(@D)/config.h $(@D)/xconfig.h
+	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
+endef
+
+define PERL_BUILD_CMDS
+	echo "#!/bin/sh"                                                        > $(@D)/Cross/miniperl
+	echo "$(PERL_QEMU_USER_MODE) -L $(STAGING_DIR) $(@D)/miniperl \"\$$@\"" >>$(@D)/Cross/miniperl
+	chmod +x $(@D)/Cross/miniperl
+	PERL_MM_OPT="PERL=$(@D)/Cross/miniperl" \
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
+	(cd $(@D); ./Configure -des \
+		-Dcc="$(HOSTCC)" \
+		-Dprefix="$(HOST_DIR)/usr" \
+		$(PERL_USE_DEVEL))
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
