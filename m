From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Mar 2012 22:50:31 +0100
Subject: [Buildroot] [git commit] microperl: bump to version 5.12.4 and
	convert to gentargets
Message-ID: <20120308215736.9D5C590D06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=335260afd429d694cddd7ada705184ad6717826a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Convert microperl to gentargets infrastructure
* Bump to a more modern version 5.12.4
* Introduce the bundle options to simplify people's lives

host-microperl is a fully-fledged perl.

For the time being we can't build XS modules thus breaking
target automake support for example since it requires IO.

target-automake was broken before anyway since the automake version
bump.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/microperl/Config.in                        |   27 ++-
 .../microperl/microperl-no-signal-handlers.patch   |   22 ++
 package/microperl/microperl-uudmap.patch           |   47 ++++
 package/microperl/microperl.mk                     |  250 +++++++++++---------
 4 files changed, 228 insertions(+), 118 deletions(-)

diff --git a/package/microperl/Config.in b/package/microperl/Config.in
index 82f964c..256e271 100644
--- a/package/microperl/Config.in
+++ b/package/microperl/Config.in
@@ -3,12 +3,25 @@ config BR2_PACKAGE_MICROPERL
 	help
 	  Perl without operating-specific functions such as readdir.
 
+if BR2_PACKAGE_MICROPERL
+
 config BR2_PACKAGE_MICROPERL_MODULES
-	string "microperl modules"
-	default ""
-	depends on BR2_PACKAGE_MICROPERL
+	string "additional modules"
+	help
+	  List of space-separated microperl modules to copy to the rootfs.
+
+	  Examples: warnings.pm Getopt/Std.pm Time::Local
+
+	  Module dependencies are not automatic so check your needs.
+	  You can't use XS modules like IO.
+
+menu "module bundles"
+
+config BR2_PACKAGE_MICROPERL_BUNDLE_CGI
+	bool "CGI"
 	help
-	  List of microperl modules to copy to the rootfs.
-	  E.g.
-	  warnings.pm warnings/register.pm strict.pm constant.pm vars.pm
-	  Exporter.pm Exporter/Heavy.pm Carp.pm Getopt/Long.pm
+	  Copy required modules to do CGI scripting.
+
+endmenu
+
+endif
diff --git a/package/microperl/microperl-no-signal-handlers.patch b/package/microperl/microperl-no-signal-handlers.patch
new file mode 100644
index 0000000..3c9aa41
--- /dev/null
+++ b/package/microperl/microperl-no-signal-handlers.patch
@@ -0,0 +1,22 @@
+Backport of http://perl5.git.perl.org/perl.git/commitdiff/01d65469392dfc0a?hp=a82b5f080d91ffe184d8ac4795ac71e72e612c2f
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura perl-5.12.3/miniperlmain.c perl-5.12.3-nosig/miniperlmain.c
+--- perl-5.12.3/miniperlmain.c	2011-01-09 17:20:57.000000000 -0300
++++ perl-5.12.3-nosig/miniperlmain.c	2011-04-14 10:16:53.564639438 -0300
+@@ -116,12 +116,14 @@
+     if (!exitstatus)
+         perl_run(my_perl);
+ 
++#ifndef PERL_MICRO
+     /* Unregister our signal handler before destroying my_perl */
+     for (i = 0; PL_sig_name[i]; i++) {
+ 	if (rsignal_state(PL_sig_num[i]) == (Sighandler_t) PL_csighandlerp) {
+ 	    rsignal(PL_sig_num[i], (Sighandler_t) SIG_DFL);
+ 	}
+     }
++#endif
+ 
+     exitstatus = perl_destruct(my_perl);
+ 
diff --git a/package/microperl/microperl-uudmap.patch b/package/microperl/microperl-uudmap.patch
new file mode 100644
index 0000000..c72f9c9
--- /dev/null
+++ b/package/microperl/microperl-uudmap.patch
@@ -0,0 +1,47 @@
+From a82b5f080d91ffe184d8ac4795ac71e72e612c2f Mon Sep 17 00:00:00 2001
+From: David Leadbeater <dgl@dgl.cx>
+Date: Mon, 7 Mar 2011 18:40:55 +0000
+Subject: [PATCH] microperl: Update generate_uudmap in Makefile.micro
+
+Makefile.micro hadn't kept up with the changes for generate_uudmap,
+make it match the real Makefile.
+---
+ Makefile.micro |    8 ++++----
+ 1 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.micro b/Makefile.micro
+index 4b738f5..567d98a 100644
+--- a/Makefile.micro
++++ b/Makefile.micro
+@@ -35,7 +35,7 @@ H = av.h uconfig.h cop.h cv.h embed.h embedvar.h form.h gv.h handy.h \
+ HE = $(H) EXTERN.h
+ 
+ clean:
+-	-rm -f $(O) microperl generate_uudmap$(_X) uudmap.h
++	-rm -f $(O) microperl generate_uudmap$(_X) uudmap.h bitcount.h
+ 
+ distclean:	clean
+ 
+@@ -74,7 +74,7 @@ udoop$(_O):	$(HE) doop.c
+ udump$(_O):	$(HE) dump.c regcomp.h regnodes.h
+ 	$(CC) $(CCFLAGS) -o $@ $(CFLAGS) dump.c
+ 
+-uglobals$(_O):	$(H) globals.c INTERN.h perlapi.h
++uglobals$(_O):	$(H) globals.c INTERN.h perlapi.h uudmap.h bitcount.h
+ 	$(CC) $(CCFLAGS) -o $@ $(CFLAGS) globals.c
+ 
+ ugv$(_O):	$(HE) gv.c
+@@ -173,8 +173,8 @@ uutil$(_O):	$(HE) util.c
+ uperlapi$(_O):	$(HE) perlapi.c perlapi.h
+ 	$(CC) $(CCFLAGS) -o $@ $(CFLAGS) perlapi.c
+ 
+-uudmap.h: generate_uudmap$(_X)
+-	$(RUN) ./generate_uudmap$(_X) >uudmap.h
++uudmap.h bitcount.h: generate_uudmap$(_X)
++	$(RUN) ./generate_uudmap$(_X) uudmap.h bitcount.h
+ 
+ generate_uudmap$(_O): generate_uudmap.c
+ 	$(CC) $(CCFLAGS) -o $@ $(CFLAGS) generate_uudmap.c
+-- 
+1.6.5.2.74.g610f9.dirty
+
diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index de5ecd6..d5b5a7c 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -3,122 +3,150 @@
 # microperl
 #
 #############################################################
-MICROPERL_MAJ=5
-MICROPERL_VERSION=$(MICROPERL_MAJ).8.8
-MICROPERL_SOURCE=perl-$(MICROPERL_VERSION).tar.bz2
-MICROPERL_CAT:=$(BZCAT)
-MICROPERL_SITE=ftp://ftp.cpan.org/pub/CPAN/src/5.0
-MICROPERL_DIR=$(BUILD_DIR)/perl-$(MICROPERL_VERSION)
 
-MICROPERL_MODS_DIR=/usr/lib/perl$(MICROPERL_MAJ)/$(MICROPERL_VERSION)
-MICROPERL_MODS=$(call qstrip,$(BR2_PACKAGE_MICROPERL_MODULES))
-ifeq ($(BR2_PACKAGE_AUTOMAKE),y)
-MICROPERL_MODS+=File/Basename.pm Errno.pm Config.pm IO/File.pm Symbol.pm \
-	SelectSaver.pm IO/Seekable.pm IO/Handle.pm IO.pm XSLoader.pm \
-	DynaLoader.pm AutoLoader.pm Carp/Heavy.pm
+MICROPERL_VERSION = 5.12.4
+MICROPERL_SITE = http://www.cpan.org/src/5.0
+MICROPERL_SOURCE = perl-$(MICROPERL_VERSION).tar.bz2
+MICROPERL_DEPENDENCIES = host-microperl
+MICROPERL_MODS_DIR = /usr/lib/perl5/$(MICROPERL_VERSION)
+MICROPERL_ARCH_DIR = $(MICROPERL_MODS_DIR)/$(REAL_GNU_TARGET_NAME)
+MICROPERL_MODS = $(call qstrip,$(BR2_PACKAGE_MICROPERL_MODULES))
+
+# Minimal set of modules required for 'perl -V' to work
+MICROPERL_ARCH_MODS = Config.pm Config_git.pl Config_heavy.pl
+MICROPERL_BASE_MODS = strict.pm
+
+# CGI bundle
+ifeq ($(BR2_PACKAGE_MICROPERL_BUNDLE_CGI),y)
+MICROPERL_MODS += constant.pm CGI CGI.pm Carp.pm Exporter.pm overload.pm \
+	vars.pm warnings.pm warnings/register.pm
 endif
-$(DL_DIR)/$(MICROPERL_SOURCE):
-	$(call DOWNLOAD,$(MICROPERL_SITE),$(MICROPERL_SOURCE))
 
-$(MICROPERL_DIR)/.source: $(DL_DIR)/$(MICROPERL_SOURCE)
-	$(MICROPERL_CAT) $(DL_DIR)/$(MICROPERL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	# makedepend contains bashisms
-	$(SED) 's~sh ./makedepend~bash ./makedepend~' \
-		$(MICROPERL_DIR)/Makefile.SH \
-		$(MICROPERL_DIR)/x2p/Makefile.SH \
-		$(MICROPERL_DIR)/pod/Makefile.SH
-	chmod -R u+w $(MICROPERL_DIR)
-	touch $@
-
-$(MICROPERL_DIR)/.host_configured: $(MICROPERL_DIR)/.source
-	# we need to build a perl for the host just for Errno.pm
-	(cd $(MICROPERL_DIR); ./Configure -Dcc="$(HOSTCC)" -de -A libs='-lm' )
-	touch $@
-
-
-$(MICROPERL_DIR)/.host_configured_and_fixed: $(MICROPERL_DIR)/.host_configured
-	$(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/Makefile
-	$(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/x2p/Makefile
-	$(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/makefile
-	$(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/x2p/makefile
-	touch $@
-
-$(MICROPERL_DIR)/.host_make: $(MICROPERL_DIR)/.host_configured_and_fixed
-	$(MAKE) -C $(MICROPERL_DIR)		|| echo "An error is expected on make"
-	touch $@
-
-$(MICROPERL_DIR)/.host_make_fixed: $(MICROPERL_DIR)/.host_make
-	$(MAKE) -C $(MICROPERL_DIR) test	|| echo "An error is expected on make test"
-	touch $@
-
-$(MICROPERL_DIR)/.configured: $(MICROPERL_DIR)/.host_make_fixed
-	# we need to build a perl for the host just for Errno.pm
-	(cd $(MICROPERL_DIR); \
-	 chmod a+x ext/util/make_ext; \
-	 ext/util/make_ext nonxs Errno MAKE="$(firstword $(MAKE))" \
-	)
-	(cd $(MICROPERL_DIR); \
-	 chmod u+w uconfig.h; ./uconfig.sh; \
-	 $(MAKE) -f $(MICROPERL_DIR)/Makefile.micro regen_uconfig; \
-	 $(SED) 's,PRIVLIB ".*,PRIVLIB "/$(MICROPERL_MODS_DIR)",' \
-		 -e 's,PRIVLIB_EXP ".*,PRIVLIB_EXP "$(MICROPERL_MODS_DIR)",' \
-		 -e 's,BIN ".*,BIN "/usr/bin",' \
-		 ./uconfig.h; \
-	)
-	touch $@
-
-$(MICROPERL_DIR)/microperl: $(MICROPERL_DIR)/.configured
-	$(MAKE) -f $(MICROPERL_DIR)/Makefile.micro CC="$(TARGET_CC)" \
-		OPTIMIZE="$(TARGET_CFLAGS)" -C $(MICROPERL_DIR)
-ifeq ($(BR2_PACKAGE_AUTOMAKE),y)
-	#(cd $(@D); \
-	# CONFIG=uconfig.h $(SHELL) ext/util/make_ext nonxs Errno MAKE="$(firstword $(MAKE))"; \
-	#)
+# Host microperl is actually full-blown perl
+define HOST_MICROPERL_CONFIGURE_CMDS
+	cd $(@D) ; \
+	./Configure -Dcc="$(HOSTCC)" -Dprefix="$(HOST_DIR)/usr" \
+		-Dloclibpth='/lib /lib64 /usr/lib /usr/lib64' -des
+endef
+
+define HOST_MICROPERL_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define HOST_MICROPERL_INSTALL_CMDS
+	$(MAKE) -C $(@D) install
+endef
+
+ifeq ($(BR2_ENDIAN),"BIG")
+define MICROPERL_BIGENDIAN
+	$(SED) '/^byteorder=/d' $(@D)/uconfig.sh
+	echo "byteorder='4321'" >>$(@D)/uconfig.sh
+endef
 endif
 
-$(TARGET_DIR)/usr/bin/microperl: $(MICROPERL_DIR)/microperl
-ifneq ($(MICROPERL_MODS),)
-	(cd $(MICROPERL_DIR); \
-	 for i in $(patsubst %,$(TARGET_DIR)/$(MICROPERL_MODS_DIR)/%,$(dir $(MICROPERL_MODS))); do \
-		[ -d $$i ] || mkdir -p $$i; \
-	 done; \
-	 for i in $(MICROPERL_MODS); do \
-	 cp -dpf $(MICROPERL_DIR)/lib/$$i $(TARGET_DIR)/$(MICROPERL_MODS_DIR)/$$i; \
-	 done; \
-	)
-endif
-	cp -dpf $(MICROPERL_DIR)/microperl $@
-ifneq ($(BR2_STRIP_none),y)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
+ifeq ($(BR2_LARGEFILE),y)
+define MICROPERL_LARGEFILE
+	$(SED) '/^uselargefiles=/d' $(@D)/uconfig.sh
+	echo "uselargefiles='define'" >>$(@D)/uconfig.sh
+endef
 endif
-	(cd $(TARGET_DIR)/usr/bin; rm -f perl; ln -s microperl perl;)
-
-microperl: $(TARGET_DIR)/usr/bin/microperl
-
-microperl-source: $(DL_DIR)/$(MICROPERL_SOURCE)
-
-microperl-unpacked: $(MICROPERL_DIR)/.source
 
-microperl-config: $(MICROPERL_DIR)/.host_configured
-
-microperl-host: $(MICROPERL_DIR)/.host_make
-
-microperl-host-fixed: $(MICROPERL_DIR)/.host_make_fixed
-
-microperl-clean:
-	rm -rf $(TARGET_DIR)/usr/bin/microperl \
-		$(TARGET_DIR)/$(MICROPERL_MODS_DIR) $(TARGET_DIR)/usr/bin/perl
-	-rmdir $(TARGET_DIR)/usr/lib/perl$(MICROPERL_MAJ)
-	-$(MAKE) -C $(MICROPERL_DIR) -f Makefile.micro clean
-
-microperl-dirclean:
-	rm -rf $(MICROPERL_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MICROPERL),y)
-TARGETS+=microperl
+ifeq ($(BR2_USE_WCHAR),y)
+define MICROPERL_WCHAR
+	$(SED) '/^d_mbstowcs=/d' -e '/^d_mbtowc=/d' -e '/^d_wcstombs=/d' \
+		-e '/^d_wctomb=/d' $(@D)/uconfig.sh
+	echo "d_mbstowcs='define'" >>$(@D)/uconfig.sh
+	echo "d_mbtowc='define'" >>$(@D)/uconfig.sh
+	echo "d_wcstombs='define'" >>$(@D)/uconfig.sh
+	echo "d_wctomb='define'" >>$(@D)/uconfig.sh
+endef
 endif
+
+define MICROPERL_CONFIGURE_CMDS
+	$(SED) '/^archlib=/d' -e '/^archlibexp=/d' -e '/^optimize=/d' \
+		-e '/^archname=/d' -e '/^d_poll=/d' -e '/^i_poll=/d' \
+		-e '/^osname=/d' -e '/^u32type=/d' -e '/^d_archlib=/d' \
+		-e '/^d_memset=/d' -e '/^i_fcntl=/d' -e '/^useperlio=/d' \
+		-e '/^need_va_copy=/d' $(@D)/uconfig.sh
+	$(SED) 's/5.12/$(MICROPERL_VERSION)/' $(@D)/uconfig.sh
+	echo "archlib='$(MICROPERL_ARCH_DIR)'" >>$(@D)/uconfig.sh
+	echo "archlibexp='$(MICROPERL_ARCH_DIR)'" >>$(@D)/uconfig.sh
+	echo "d_archlib='define'" >>$(@D)/uconfig.sh
+	echo "archname='$(REAL_GNU_TARGET_NAME)'" >>$(@D)/uconfig.sh
+	echo "osname='linux'" >>$(@D)/uconfig.sh
+	echo "cc='$(TARGET_CC)'" >>$(@D)/uconfig.sh
+	echo "ccflags='$(TARGET_CFLAGS)'" >>$(@D)/uconfig.sh
+	echo "optimize='$(TARGET_CFLAGS)'" >>$(@D)/uconfig.sh
+	echo "usecrosscompile='define'" >>$(@D)/uconfig.sh
+	echo "d_memset='define'" >>$(@D)/uconfig.sh
+	echo "i_fcntl='define'" >>$(@D)/uconfig.sh
+	echo "useperlio='define'" >>$(@D)/uconfig.sh
+	echo "u32type='unsigned int'" >>$(@D)/uconfig.sh
+	echo "need_va_copy='define'" >>$(@D)/uconfig.sh
+	echo "d_poll='define'" >>$(@D)/uconfig.sh
+	echo "i_poll='define'" >>$(@D)/uconfig.sh
+	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
+	$(SED) 's/local\///' $(@D)/uconfig.sh
+	$(MICROPERL_BIGENDIAN)
+	$(MICROPERL_LARGEFILE)
+	$(MICROPERL_WCHAR)
+	$(MAKE) -C $(@D) -f Makefile.micro regen_uconfig
+	cp -f $(@D)/uconfig.h $(@D)/config.h
+	cp -f $(@D)/uconfig.sh $(@D)/config.sh
+	echo "ccname='$(TARGET_CC)'" >>$(@D)/config.sh
+	echo "PERL_CONFIG_SH=true" >>$(@D)/config.sh
+	cd $(@D) ; $(HOST_DIR)/usr/bin/perl make_patchnum.pl ; \
+	$(HOST_DIR)/usr/bin/perl configpm
+endef
+
+define MICROPERL_BUILD_CMDS
+	$(MAKE) -f Makefile.micro -C $(@D) \
+		CC="$(HOSTCC)" bitcount.h
+	$(MAKE) -f Makefile.micro -C $(@D) \
+		CC="$(TARGET_CC)" OPTIMIZE="$(TARGET_CFLAGS)"
+endef
+
+# Some extensions don't need a build run
+# We try to build anyway to avoid a huge black list
+# Just ignore make_ext.pl warning/errors
+define MICROPERL_BUILD_EXTENSIONS
+	for i in $(MICROPERL_MODS); do \
+	cd $(@D); ln -sf $(HOST_DIR)/usr/bin/perl miniperl; \
+		PERL5LIB=$(TARGET_DIR)/$(MICROPERL_ARCH_DIR) \
+		$(HOST_DIR)/usr/bin/perl make_ext.pl MAKE="$(MAKE)" --nonxs \
+		`echo $$i|sed -e 's/.pm//'`; \
+	done
+endef
+
+define MICROPERL_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/microperl $(TARGET_DIR)/usr/bin/microperl
+	ln -sf microperl $(TARGET_DIR)/usr/bin/perl
+	for i in $(MICROPERL_ARCH_MODS); do \
+		$(INSTALL) -m 0644 -D $(@D)/lib/$$i \
+			$(TARGET_DIR)/$(MICROPERL_ARCH_DIR)/$$i; \
+	done
+	for i in $(MICROPERL_BASE_MODS); do \
+		$(INSTALL) -m 0644 -D $(@D)/lib/$$i \
+			$(TARGET_DIR)/$(MICROPERL_MODS_DIR)/$$i; \
+	done
+	$(MICROPERL_BUILD_EXTENSIONS)
+	for i in $(MICROPERL_MODS); do \
+		j=`echo $$i|cut -d : -f 1` ; \
+		[ -d $(@D)/lib/$$j ] && cp -af $(@D)/lib/$$j \
+			$(TARGET_DIR)/$(MICROPERL_MODS_DIR) ; \
+		[ -f $(@D)/lib/$$i ] && $(INSTALL) -m 0644 -D $(@D)/lib/$$i \
+			$(TARGET_DIR)/$(MICROPERL_MODS_DIR)/$$i; \
+	done
+	# Remove test files
+	find $(TARGET_DIR)/$(MICROPERL_MODS_DIR) -type f -name *.t \
+		-exec rm -f {} \;
+endef
+
+define MICROPERL_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/perl
+	rm -f $(TARGET_DIR)/usr/bin/microperl
+	rm -rf $(TARGET_DIR)/usr/lib/perl5
+endef
+
+$(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
