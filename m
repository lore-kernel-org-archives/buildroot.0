From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 27 Jul 2007 05:37:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package/config
Message-ID: <20070727123732.24B4BA4637@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-27 05:37:30 -0700 (Fri, 27 Jul 2007)
New Revision: 19275

Log:
- fix building mconf with curses flags
- make sure to rm .config when the first 'make menuconfig' was interrupted and thus no .config.cmd was created.


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/config/Makefile
   trunk/buildroot/package/config/Makefile.kconfig


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-27 11:22:34 UTC (rev 19274)
+++ trunk/buildroot/Makefile	2007-07-27 12:37:30 UTC (rev 19275)
@@ -320,9 +320,11 @@
 
 menuconfig: $(CONFIG)/mconf
 	@-mkdir -p $(CONFIG)/buildroot-config
-	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
+	@if ! KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
-		$(CONFIG)/mconf $(CONFIG_CONFIG_IN)
+		$(CONFIG)/mconf $(CONFIG_CONFIG_IN); then \
+		test -f .config.cmd || rm -f .config; \
+	fi
 
 config: $(CONFIG)/conf
 	@-mkdir -p $(CONFIG)/buildroot-config

Modified: trunk/buildroot/package/config/Makefile
===================================================================
--- trunk/buildroot/package/config/Makefile	2007-07-27 11:22:34 UTC (rev 19274)
+++ trunk/buildroot/package/config/Makefile	2007-07-27 12:37:30 UTC (rev 19275)
@@ -5,7 +5,7 @@
 srctree := .
 
 include Makefile.kconfig
-HOSTCFLAGS+=-Dinline="" -include foo.h
+#HOSTCFLAGS+=-Dinline="" -include foo.h
 -include .depend
 .depend: $(wildcard *.h *.c)
 	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) -MM *.c > .depend 2>/dev/null || :

Modified: trunk/buildroot/package/config/Makefile.kconfig
===================================================================
--- trunk/buildroot/package/config/Makefile.kconfig	2007-07-27 11:22:34 UTC (rev 19274)
+++ trunk/buildroot/package/config/Makefile.kconfig	2007-07-27 12:37:30 UTC (rev 19275)
@@ -120,6 +120,9 @@
 ifeq ($(MAKECMDGOALS),menuconfig)
 	hostprogs-y += mconf
 endif
+ifeq ($(findstring mconf,$(MAKECMDGOALS)),mconf)
+	hostprogs-y += mconf
+endif
 
 ifeq ($(MAKECMDGOALS),xconfig)
 	qconf-target := 1
