From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 21 Sep 2012 23:39:03 +0200
Subject: [Buildroot] [PATCH v7 08/13] microperl: bump version to 5.14.2
In-Reply-To: <1348263548-12975-1-git-send-email-francois.perrad@gadz.org>
References: <1348263548-12975-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1348263548-12975-8-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

patches have been merged in upstream
perl -V requires more modules

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../microperl/microperl-no-signal-handlers.patch   |   22 ---------
 package/microperl/microperl-uudmap.patch           |   47 --------------------
 package/microperl/microperl.mk                     |   10 ++---
 3 files changed, 5 insertions(+), 74 deletions(-)
 delete mode 100644 package/microperl/microperl-no-signal-handlers.patch
 delete mode 100644 package/microperl/microperl-uudmap.patch

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
index fa92144..1899e03 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -4,7 +4,8 @@
 #
 #############################################################
 
-MICROPERL_VERSION = 5.12.4
+MICROPERL_VERSION_MAJOR = 14
+MICROPERL_VERSION = 5.$(MICROPERL_VERSION_MAJOR).2
 MICROPERL_SITE = http://www.cpan.org/src/5.0
 MICROPERL_SOURCE = perl-$(MICROPERL_VERSION).tar.bz2
 MICROPERL_LICENSE = Artistic
@@ -16,12 +17,11 @@ MICROPERL_MODS = $(call qstrip,$(BR2_PACKAGE_MICROPERL_MODULES))
 
 # Minimal set of modules required for 'perl -V' to work
 MICROPERL_ARCH_MODS = Config.pm Config_git.pl Config_heavy.pl
-MICROPERL_BASE_MODS = strict.pm
+MICROPERL_BASE_MODS = strict.pm vars.pm warnings.pm warnings/register.pm
 
 # CGI bundle
 ifeq ($(BR2_PACKAGE_MICROPERL_BUNDLE_CGI),y)
-MICROPERL_MODS += constant.pm CGI CGI.pm Carp.pm Exporter.pm overload.pm \
-	vars.pm warnings.pm warnings/register.pm
+MICROPERL_MODS += constant.pm CGI CGI.pm Carp.pm Exporter.pm overload.pm
 endif
 
 # Host microperl is actually full-blown perl
@@ -70,7 +70,7 @@ define MICROPERL_CONFIGURE_CMDS
 		-e '/^osname=/d' -e '/^u32type=/d' -e '/^d_archlib=/d' \
 		-e '/^d_memset=/d' -e '/^i_fcntl=/d' -e '/^useperlio=/d' \
 		-e '/^need_va_copy=/d' $(@D)/uconfig.sh
-	$(SED) 's/5.12/$(MICROPERL_VERSION)/' $(@D)/uconfig.sh
+	$(SED) 's/5\.$(MICROPERL_VERSION_MAJOR)/$(MICROPERL_VERSION)/' $(@D)/uconfig.sh
 	echo "archlib='$(MICROPERL_ARCH_DIR)'" >>$(@D)/uconfig.sh
 	echo "archlibexp='$(MICROPERL_ARCH_DIR)'" >>$(@D)/uconfig.sh
 	echo "d_archlib='define'" >>$(@D)/uconfig.sh
-- 
1.7.9.5
