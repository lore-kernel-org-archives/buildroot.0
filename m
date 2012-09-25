From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 25 Sep 2012 19:18:27 +0200
Subject: [Buildroot] [PATCH v8 11/11] microperl: remove it
In-Reply-To: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1348593508-14254-11-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

replaced by perl
use BR2_PACKAGE_PERL_CUSTOM_INSTALL if you want a small footprint

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                                  |    1 -
 package/autoconf/Config.in                         |    2 +-
 package/autoconf/autoconf.mk                       |    7 +-
 package/automake/Config.in                         |    2 +-
 package/automake/automake.mk                       |    7 +-
 package/libxml-parser-perl/libxml-parser-perl.mk   |    6 -
 package/microperl/Config.in                        |   30 ----
 .../microperl/microperl-no-signal-handlers.patch   |   22 ---
 package/microperl/microperl-uudmap.patch           |   47 ------
 package/microperl/microperl.mk                     |  156 --------------------
 package/ntp/Config.in                              |    4 +-
 package/samba/Config.in                            |    4 +-
 12 files changed, 8 insertions(+), 280 deletions(-)
 delete mode 100644 package/microperl/Config.in
 delete mode 100644 package/microperl/microperl-no-signal-handlers.patch
 delete mode 100644 package/microperl/microperl-uudmap.patch
 delete mode 100644 package/microperl/microperl.mk

diff --git a/package/Config.in b/package/Config.in
index 06050f2..987d1d1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -268,7 +268,6 @@ menu "Perl libraries/modules"
 source "package/cpanminus/Config.in"
 endmenu
 endif
-source "package/microperl/Config.in"
 source "package/php/Config.in"
 source "package/python/Config.in"
 if BR2_PACKAGE_PYTHON
diff --git a/package/autoconf/Config.in b/package/autoconf/Config.in
index 41866ad..5f2f148 100644
--- a/package/autoconf/Config.in
+++ b/package/autoconf/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_AUTOCONF
 	bool "autoconf"
-	select BR2_PACKAGE_MICROPERL if !BR2_PACKAGE_PERL
+	select BR2_PACKAGE_PERL
 	help
 	  Extensible program for developing configure scripts.  These
 	  scripts handle all the mundane system/feature detection.
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 13a474e..0cb50db 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -10,12 +10,7 @@ AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 		    ac_cv_prog_gnu_m4_gnu=no
 
-AUTOCONF_DEPENDENCIES = host-m4
-ifeq ($(BR2_PACKAGE_PERL),y)
-    AUTOCONF_DEPENDENCIES += perl
-else
-    AUTOCONF_DEPENDENCIES += microperl
-endif
+AUTOCONF_DEPENDENCIES = host-m4 perl
 
 HOST_AUTOCONF_CONF_ENV = ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 			ac_cv_prog_gnu_m4_gnu=no
diff --git a/package/automake/Config.in b/package/automake/Config.in
index c0b29d1..9a9673a 100644
--- a/package/automake/Config.in
+++ b/package/automake/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_AUTOMAKE
 	bool "automake"
 	select BR2_PACKAGE_AUTOCONF
-	select BR2_PACKAGE_MICROPERL if !BR2_PACKAGE_PERL
+	select BR2_PACKAGE_PERL
 	help
 	  Tool for automatically generating Makefile's for input to
 	  configure scripts (made by autoconf).
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 0766111..8be56c3 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -7,12 +7,7 @@
 AUTOMAKE_VERSION = 1.11.5
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 
-AUTOMAKE_DEPENDENCIES = host-autoconf autoconf
-ifeq ($(BR2_PACKAGE_PERL),y)
-    AUTOMAKE_DEPENDENCIES += perl
-else
-    AUTOMAKE_DEPENDENCIES += microperl
-endif
+AUTOMAKE_DEPENDENCIES = host-autoconf autoconf perl
 
 HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
 
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index a6f8ae9..8e2f899 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -9,12 +9,6 @@ LIBXML_PARSER_PERL_SITE:=http://www.cpan.org/modules/by-module/XML/
 
 LIBXML_PARSER_PERL_DEPENDENCIES = expat
 
-ifeq ($(BR2_PACKAGE_MICROPERL),y)
-# microperl builds host-microperl, so ensure we build after that to build
-# against host-microperl instead of the system perl
-LIBXML_PARSER_PERL_DEPENDENCIES += microperl
-endif
-
 define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
  (cd $(@D) ; \
    $(HOST_CONFIGURE_OPTS) perl Makefile.PL \
diff --git a/package/microperl/Config.in b/package/microperl/Config.in
deleted file mode 100644
index 19d104a..0000000
--- a/package/microperl/Config.in
+++ /dev/null
@@ -1,30 +0,0 @@
-config BR2_PACKAGE_MICROPERL
-	bool "microperl"
-	# needs fork()
-	depends on BR2_USE_MMU
-	depends on BR2_DEPRECATED
-	help
-	  Perl without operating-specific functions such as readdir.
-
-if BR2_PACKAGE_MICROPERL
-
-config BR2_PACKAGE_MICROPERL_MODULES
-	string "additional modules"
-	help
-	  List of space-separated microperl modules to copy to the rootfs.
-
-	  Examples: warnings.pm Getopt/Std.pm Time::Local
-
-	  Module dependencies are not automatic so check your needs.
-	  You can't use XS modules like IO.
-
-menu "module bundles"
-
-config BR2_PACKAGE_MICROPERL_BUNDLE_CGI
-	bool "CGI"
-	help
-	  Copy required modules to do CGI scripting.
-
-endmenu
-
-endif
diff --git a/package/microperl/microperl-no-signal-handlers.patch b/package/microperl/microperl-no-signal-handlers.patch
deleted file mode 100644
index 3c9aa41..0000000
--- a/package/microperl/microperl-no-signal-handlers.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Backport of http://perl5.git.perl.org/perl.git/commitdiff/01d65469392dfc0a?hp=a82b5f080d91ffe184d8ac4795ac71e72e612c2f
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura perl-5.12.3/miniperlmain.c perl-5.12.3-nosig/miniperlmain.c
---- perl-5.12.3/miniperlmain.c	2011-01-09 17:20:57.000000000 -0300
-+++ perl-5.12.3-nosig/miniperlmain.c	2011-04-14 10:16:53.564639438 -0300
-@@ -116,12 +116,14 @@
-     if (!exitstatus)
-         perl_run(my_perl);
- 
-+#ifndef PERL_MICRO
-     /* Unregister our signal handler before destroying my_perl */
-     for (i = 0; PL_sig_name[i]; i++) {
- 	if (rsignal_state(PL_sig_num[i]) == (Sighandler_t) PL_csighandlerp) {
- 	    rsignal(PL_sig_num[i], (Sighandler_t) SIG_DFL);
- 	}
-     }
-+#endif
- 
-     exitstatus = perl_destruct(my_perl);
- 
diff --git a/package/microperl/microperl-uudmap.patch b/package/microperl/microperl-uudmap.patch
deleted file mode 100644
index c72f9c9..0000000
--- a/package/microperl/microperl-uudmap.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From a82b5f080d91ffe184d8ac4795ac71e72e612c2f Mon Sep 17 00:00:00 2001
-From: David Leadbeater <dgl@dgl.cx>
-Date: Mon, 7 Mar 2011 18:40:55 +0000
-Subject: [PATCH] microperl: Update generate_uudmap in Makefile.micro
-
-Makefile.micro hadn't kept up with the changes for generate_uudmap,
-make it match the real Makefile.
----
- Makefile.micro |    8 ++++----
- 1 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.micro b/Makefile.micro
-index 4b738f5..567d98a 100644
---- a/Makefile.micro
-+++ b/Makefile.micro
-@@ -35,7 +35,7 @@ H = av.h uconfig.h cop.h cv.h embed.h embedvar.h form.h gv.h handy.h \
- HE = $(H) EXTERN.h
- 
- clean:
--	-rm -f $(O) microperl generate_uudmap$(_X) uudmap.h
-+	-rm -f $(O) microperl generate_uudmap$(_X) uudmap.h bitcount.h
- 
- distclean:	clean
- 
-@@ -74,7 +74,7 @@ udoop$(_O):	$(HE) doop.c
- udump$(_O):	$(HE) dump.c regcomp.h regnodes.h
- 	$(CC) $(CCFLAGS) -o $@ $(CFLAGS) dump.c
- 
--uglobals$(_O):	$(H) globals.c INTERN.h perlapi.h
-+uglobals$(_O):	$(H) globals.c INTERN.h perlapi.h uudmap.h bitcount.h
- 	$(CC) $(CCFLAGS) -o $@ $(CFLAGS) globals.c
- 
- ugv$(_O):	$(HE) gv.c
-@@ -173,8 +173,8 @@ uutil$(_O):	$(HE) util.c
- uperlapi$(_O):	$(HE) perlapi.c perlapi.h
- 	$(CC) $(CCFLAGS) -o $@ $(CFLAGS) perlapi.c
- 
--uudmap.h: generate_uudmap$(_X)
--	$(RUN) ./generate_uudmap$(_X) >uudmap.h
-+uudmap.h bitcount.h: generate_uudmap$(_X)
-+	$(RUN) ./generate_uudmap$(_X) uudmap.h bitcount.h
- 
- generate_uudmap$(_O): generate_uudmap.c
- 	$(CC) $(CCFLAGS) -o $@ $(CFLAGS) generate_uudmap.c
--- 
-1.6.5.2.74.g610f9.dirty
-
diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
deleted file mode 100644
index b2a912a..0000000
--- a/package/microperl/microperl.mk
+++ /dev/null
@@ -1,156 +0,0 @@
-#############################################################
-#
-# microperl
-#
-#############################################################
-
-MICROPERL_VERSION = 5.12.4
-MICROPERL_SITE = http://www.cpan.org/src/5.0
-MICROPERL_SOURCE = perl-$(MICROPERL_VERSION).tar.bz2
-MICROPERL_LICENSE = Artistic
-MICROPERL_LICENSE_FILES = Artistic
-MICROPERL_DEPENDENCIES = host-microperl
-MICROPERL_MODS_DIR = /usr/lib/perl5/$(MICROPERL_VERSION)
-MICROPERL_ARCH_DIR = $(MICROPERL_MODS_DIR)/$(GNU_TARGET_NAME)
-MICROPERL_MODS = $(call qstrip,$(BR2_PACKAGE_MICROPERL_MODULES))
-
-# Minimal set of modules required for 'perl -V' to work
-MICROPERL_ARCH_MODS = Config.pm Config_git.pl Config_heavy.pl
-MICROPERL_BASE_MODS = strict.pm
-
-# CGI bundle
-ifeq ($(BR2_PACKAGE_MICROPERL_BUNDLE_CGI),y)
-MICROPERL_MODS += constant.pm CGI CGI.pm Carp.pm Exporter.pm overload.pm \
-	vars.pm warnings.pm warnings/register.pm
-endif
-
-# Host microperl is actually full-blown perl
-define HOST_MICROPERL_CONFIGURE_CMDS
-	cd $(@D) ; \
-	./Configure -Dcc="$(HOSTCC)" -Dprefix="$(HOST_DIR)/usr" \
-		-Dloclibpth='/lib /lib64 /usr/lib /usr/lib64' -des
-endef
-
-define HOST_MICROPERL_BUILD_CMDS
-	$(MAKE) -C $(@D)
-endef
-
-define HOST_MICROPERL_INSTALL_CMDS
-	$(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_ENDIAN),"BIG")
-define MICROPERL_BIGENDIAN
-	$(SED) '/^byteorder=/d' $(@D)/uconfig.sh
-	echo "byteorder='4321'" >>$(@D)/uconfig.sh
-endef
-endif
-
-ifeq ($(BR2_LARGEFILE),y)
-define MICROPERL_LARGEFILE
-	$(SED) '/^uselargefiles=/d' $(@D)/uconfig.sh
-	echo "uselargefiles='define'" >>$(@D)/uconfig.sh
-endef
-endif
-
-ifeq ($(BR2_USE_WCHAR),y)
-define MICROPERL_WCHAR
-	$(SED) '/^d_mbstowcs=/d' -e '/^d_mbtowc=/d' -e '/^d_wcstombs=/d' \
-		-e '/^d_wctomb=/d' $(@D)/uconfig.sh
-	echo "d_mbstowcs='define'" >>$(@D)/uconfig.sh
-	echo "d_mbtowc='define'" >>$(@D)/uconfig.sh
-	echo "d_wcstombs='define'" >>$(@D)/uconfig.sh
-	echo "d_wctomb='define'" >>$(@D)/uconfig.sh
-endef
-endif
-
-define MICROPERL_CONFIGURE_CMDS
-	$(SED) '/^archlib=/d' -e '/^archlibexp=/d' -e '/^optimize=/d' \
-		-e '/^archname=/d' -e '/^d_poll=/d' -e '/^i_poll=/d' \
-		-e '/^osname=/d' -e '/^u32type=/d' -e '/^d_archlib=/d' \
-		-e '/^d_memset=/d' -e '/^i_fcntl=/d' -e '/^useperlio=/d' \
-		-e '/^need_va_copy=/d' $(@D)/uconfig.sh
-	$(SED) 's/5.12/$(MICROPERL_VERSION)/' $(@D)/uconfig.sh
-	echo "archlib='$(MICROPERL_ARCH_DIR)'" >>$(@D)/uconfig.sh
-	echo "archlibexp='$(MICROPERL_ARCH_DIR)'" >>$(@D)/uconfig.sh
-	echo "d_archlib='define'" >>$(@D)/uconfig.sh
-	echo "archname='$(GNU_TARGET_NAME)'" >>$(@D)/uconfig.sh
-	echo "osname='linux'" >>$(@D)/uconfig.sh
-	echo "cc='$(TARGET_CC)'" >>$(@D)/uconfig.sh
-	echo "ccflags='$(TARGET_CFLAGS)'" >>$(@D)/uconfig.sh
-	echo "optimize='$(TARGET_CFLAGS)'" >>$(@D)/uconfig.sh
-	echo "usecrosscompile='define'" >>$(@D)/uconfig.sh
-	echo "d_memset='define'" >>$(@D)/uconfig.sh
-	echo "i_fcntl='define'" >>$(@D)/uconfig.sh
-	echo "useperlio='define'" >>$(@D)/uconfig.sh
-	echo "u32type='unsigned int'" >>$(@D)/uconfig.sh
-	echo "need_va_copy='define'" >>$(@D)/uconfig.sh
-	echo "d_poll='define'" >>$(@D)/uconfig.sh
-	echo "i_poll='define'" >>$(@D)/uconfig.sh
-	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
-	$(SED) 's/local\///' $(@D)/uconfig.sh
-	$(MICROPERL_BIGENDIAN)
-	$(MICROPERL_LARGEFILE)
-	$(MICROPERL_WCHAR)
-	$(MAKE) -C $(@D) -f Makefile.micro regen_uconfig
-	cp -f $(@D)/uconfig.h $(@D)/config.h
-	cp -f $(@D)/uconfig.sh $(@D)/config.sh
-	echo "ccname='$(TARGET_CC)'" >>$(@D)/config.sh
-	echo "PERL_CONFIG_SH=true" >>$(@D)/config.sh
-	cd $(@D) ; $(HOST_DIR)/usr/bin/perl make_patchnum.pl ; \
-	$(HOST_DIR)/usr/bin/perl configpm
-endef
-
-define MICROPERL_BUILD_CMDS
-	$(MAKE) -f Makefile.micro -C $(@D) \
-		CC="$(HOSTCC)" bitcount.h
-	$(MAKE) -f Makefile.micro -C $(@D) \
-		CC="$(TARGET_CC)" OPTIMIZE="$(TARGET_CFLAGS)"
-endef
-
-# Some extensions don't need a build run
-# We try to build anyway to avoid a huge black list
-# Just ignore make_ext.pl warning/errors
-define MICROPERL_BUILD_EXTENSIONS
-	for i in $(MICROPERL_MODS); do \
-	cd $(@D); ln -sf $(HOST_DIR)/usr/bin/perl miniperl; \
-		PERL5LIB=$(TARGET_DIR)/$(MICROPERL_ARCH_DIR) \
-		$(HOST_DIR)/usr/bin/perl make_ext.pl MAKE="$(MAKE)" --nonxs \
-		`echo $$i|sed -e 's/.pm//'`; \
-	done
-endef
-
-define MICROPERL_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/microperl $(TARGET_DIR)/usr/bin/microperl
-	ln -sf microperl $(TARGET_DIR)/usr/bin/perl
-	for i in $(MICROPERL_ARCH_MODS); do \
-		$(INSTALL) -m 0644 -D $(@D)/lib/$$i \
-			$(TARGET_DIR)/$(MICROPERL_ARCH_DIR)/$$i; \
-	done
-	for i in $(MICROPERL_BASE_MODS); do \
-		$(INSTALL) -m 0644 -D $(@D)/lib/$$i \
-			$(TARGET_DIR)/$(MICROPERL_MODS_DIR)/$$i; \
-	done
-	$(MICROPERL_BUILD_EXTENSIONS)
-	for i in $(MICROPERL_MODS); do \
-		j=`echo $$i|cut -d : -f 1` ; \
-		if [ -d $(@D)/lib/$$j ] ; then \
-			cp -af $(@D)/lib/$$j $(TARGET_DIR)/$(MICROPERL_MODS_DIR) ; \
-		fi ; \
-		if [ -f $(@D)/lib/$$i ] ; then \
-			$(INSTALL) -m 0644 -D $(@D)/lib/$$i $(TARGET_DIR)/$(MICROPERL_MODS_DIR)/$$i; \
-		fi ; \
-	done
-	# Remove test files
-	find $(TARGET_DIR)/$(MICROPERL_MODS_DIR) -type f -name *.t \
-		-exec rm -f {} \;
-endef
-
-define MICROPERL_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/perl
-	rm -f $(TARGET_DIR)/usr/bin/microperl
-	rm -rf $(TARGET_DIR)/usr/lib/perl5
-endef
-
-$(eval $(generic-package))
-$(eval $(host-generic-package))
diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index 434cd2d..ec5dbbb 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_NTP_NTP_KEYGEN
 
 config BR2_PACKAGE_NTP_NTP_WAIT
 	bool "ntp-wait"
-	depends on BR2_PACKAGE_MICROPERL || BR2_PACKAGE_PERL
+	depends on BR2_PACKAGE_PERL
 	help
 	  ntp-wait waits until the locally running ntpd is in state 4
 	  (synchronized). This could be useful at boot time, to delay the
@@ -59,7 +59,7 @@ config BR2_PACKAGE_NTP_NTPSNMPD
 
 config BR2_PACKAGE_NTP_NTPTRACE
 	bool "ntptrace"
-	depends on BR2_PACKAGE_MICROPERL || BR2_PACKAGE_PERL
+	depends on BR2_PACKAGE_PERL
 	help
 	  ntptrace is a perl script that uses the ntpq utility program to
 	  follow the chain of NTP servers from a given host back to the
diff --git a/package/samba/Config.in b/package/samba/Config.in
index ee3244f..92714d7 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -36,12 +36,12 @@ config BR2_PACKAGE_SAMBA_FINDSMB
 	default y
 	depends on BR2_PACKAGE_SAMBA_SMBCLIENT
 	depends on BR2_PACKAGE_SAMBA_NMBLOOKUP
-	depends on BR2_PACKAGE_MICROPERL || BR2_PACKAGE_PERL
+	depends on BR2_PACKAGE_PERL
 	help
 	  Script to browse network
 
 comment "findsmb       - disabled (requires nmblookup, smbclient and perl)"
-	depends on !BR2_PACKAGE_SAMBA_SMBCLIENT || !BR2_PACKAGE_SAMBA_NMBLOOKUP || !(BR2_PACKAGE_MICROPERL || BR2_PACKAGE_PERL)
+	depends on !BR2_PACKAGE_SAMBA_SMBCLIENT || !BR2_PACKAGE_SAMBA_NMBLOOKUP || !BR2_PACKAGE_PERL
 
 config BR2_PACKAGE_SAMBA_NET
 	bool "net"
-- 
1.7.9.5
