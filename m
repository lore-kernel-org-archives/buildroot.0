From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Wed,  5 Nov 2008 00:09:30 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/make
Message-ID: <20081105080930.8D6EE3C808@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-11-05 00:09:30 -0800 (Wed, 05 Nov 2008)
New Revision: 23928

Log:
make: select gettext and libintl if locale is enabled

This patch makes sure gettext and libintl are selected if locale support is
enabled. Gettext must also be compiled before make so appropriate headers are
available to make.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/make/Config.in
   trunk/buildroot/package/make/make.mk


Changeset:
Modified: trunk/buildroot/package/make/Config.in
===================================================================
--- trunk/buildroot/package/make/Config.in	2008-11-04 22:29:02 UTC (rev 23927)
+++ trunk/buildroot/package/make/Config.in	2008-11-05 08:09:30 UTC (rev 23928)
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_MAKE
 	bool "make"
+	select BR2_PACKAGE_GETTEXT if BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_ENABLE_LOCALE
 	help
 	  A tool which controls the generation of executables and other
 	  non-source files of a program from the program's source files.

Modified: trunk/buildroot/package/make/make.mk
===================================================================
--- trunk/buildroot/package/make/make.mk	2008-11-04 22:29:02 UTC (rev 23927)
+++ trunk/buildroot/package/make/make.mk	2008-11-05 08:09:30 UTC (rev 23928)
@@ -71,5 +71,5 @@
 #
 #############################################################
 ifeq ($(strip $(BR2_PACKAGE_MAKE)),y)
-TARGETS+=make
+TARGETS+=$(if $(BR2_PACKAGE_GETTEXT),gettext) make
 endif
