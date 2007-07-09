From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  9 Jul 2007 11:23:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070709182323.E2B3A30072@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-09 11:23:20 -0700 (Mon, 09 Jul 2007)
New Revision: 19056

Log:
- fix evaluation of HOSTCFLAGS for kconfig. Closes #1415


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-09 17:59:19 UTC (rev 19055)
+++ trunk/buildroot/Makefile	2007-07-09 18:23:20 UTC (rev 19056)
@@ -264,14 +264,17 @@
 # configuration
 # ---------------------------------------------------------------------------
 
+HOSTCFLAGS=$(CFLAGS_FOR_BUILD)
+export HOSTCFLAGS
+
 $(CONFIG)/conf:
-	$(MAKE) CC="$(HOSTCC)" HOSTCFLAGS="$(CFLAGS_FOR_BUILD)" MAKECMDGOALS="$(MAKECMDGOALS)" \
+	$(MAKE) CC="$(HOSTCC)" MAKECMDGOALS="$(MAKECMDGOALS)" \
 		-C $(CONFIG) conf
 	- at if [ ! -f .config ] ; then \
 		cp $(CONFIG_DEFCONFIG) .config; \
 	fi
 $(CONFIG)/mconf:
-	$(MAKE) CC="$(HOSTCC)" HOSTCFLAGS="$(CFLAGS_FOR_BUILD)" MAKECMDGOALS="$(MAKECMDGOALS)" \
+	$(MAKE) CC="$(HOSTCC)" MAKECMDGOALS="$(MAKECMDGOALS)" \
 		-C $(CONFIG) conf mconf
 	- at if [ ! -f .config ] ; then \
 		cp $(CONFIG_DEFCONFIG) .config; \
