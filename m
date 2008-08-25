From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 25 Aug 2008 02:05:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/psmisc
Message-ID: <20080825090504.7EE6F3C72F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-25 02:05:00 -0700 (Mon, 25 Aug 2008)
New Revision: 23199

Log:
psmic: locale support

Closes #4274.

Modified:
   trunk/buildroot/package/psmisc/Config.in
   trunk/buildroot/package/psmisc/psmisc.mk


Changeset:
Modified: trunk/buildroot/package/psmisc/Config.in
===================================================================
--- trunk/buildroot/package/psmisc/Config.in	2008-08-25 09:04:49 UTC (rev 23198)
+++ trunk/buildroot/package/psmisc/Config.in	2008-08-25 09:05:00 UTC (rev 23199)
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PSMISC
 	bool "psmisc"
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_GETTEXT if BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_ENABLE_LOCALE
 	help
 	  Helpful /proc related utilities such as pstree, fuser, and killall
 

Modified: trunk/buildroot/package/psmisc/psmisc.mk
===================================================================
--- trunk/buildroot/package/psmisc/psmisc.mk	2008-08-25 09:04:49 UTC (rev 23198)
+++ trunk/buildroot/package/psmisc/psmisc.mk	2008-08-25 09:05:00 UTC (rev 23199)
@@ -15,4 +15,10 @@
 PSMISC_CONF_OPT:= $(DISABLE_NLS) $(DISABLE_IPV6)
 PSMISC_DEPENDENCIES:=uclibc ncurses
 
+ifeq ($(BR2_ENABLE_LOCALE),y)
+# psmisc gets confused and forgets to link with libintl
+PSMISC_MAKE_OPT:=LIBS=-lintl
+PSMISC_DEPENDENCIES+= gettext libintl
+endif
+
 $(eval $(call AUTOTARGETS,package,psmisc))
