From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 15 Aug 2012 16:38:26 +0200
Subject: [Buildroot] [PATCH 04/12] microperl: bump version to 5.14.2
In-Reply-To: <1345041514-31539-1-git-send-email-francois.perrad@gadz.org>
References: <1345041514-31539-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1345041514-31539-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

patches have been merged in upstream

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../microperl/microperl-no-signal-handlers.patch   |   22 ---------
 package/microperl/microperl-uudmap.patch           |   47 --------------------
 package/microperl/microperl.mk                     |    6 ++-
 3 files changed, 4 insertions(+), 71 deletions(-)
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
index f2a43c0..595e1fa 100644
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
@@ -70,7 +71,7 @@ define MICROPERL_CONFIGURE_CMDS
 		-e '/^osname=/d' -e '/^u32type=/d' -e '/^d_archlib=/d' \
 		-e '/^d_memset=/d' -e '/^i_fcntl=/d' -e '/^useperlio=/d' \
 		-e '/^need_va_copy=/d' $(@D)/uconfig.sh
-	$(SED) 's/5.12/$(MICROPERL_VERSION)/' $(@D)/uconfig.sh
+	$(SED) 's/5\.$(MICROPERL_VERSION_MAJOR)/$(MICROPERL_VERSION)/' $(@D)/uconfig.sh
 	echo "archlib='$(MICROPERL_ARCH_DIR)'" >>$(@D)/uconfig.sh
 	echo "archlibexp='$(MICROPERL_ARCH_DIR)'" >>$(@D)/uconfig.sh
 	echo "d_archlib='define'" >>$(@D)/uconfig.sh
@@ -152,6 +153,7 @@ ifdef BR2_PACKAGE_MICROPERL_INSTALL_TESTSUITE
 define MICROPERL_INSTALL_TESTSUITE
 	$(INSTALL) -m644 -D $(@D)/t/TEST                $(TARGET_DIR)/root/microperl/t/TEST
 	$(INSTALL) -m644 -D $(@D)/t/harness             $(TARGET_DIR)/root/microperl/t/harness
+	$(INSTALL) -m644 -D $(@D)/t/test.pl             $(TARGET_DIR)/root/microperl/t/test.pl
 	cp -r $(@D)/lib         $(TARGET_DIR)/root/microperl/lib
 	cp -r $(@D)/t/base      $(TARGET_DIR)/root/microperl/t/base
 	cp -r $(@D)/t/cmd       $(TARGET_DIR)/root/microperl/t/cmd
-- 
1.7.9.5
