From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 22 Aug 2008 07:24:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080822142454.4BD2E3C64D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-22 07:24:53 -0700 (Fri, 22 Aug 2008)
New Revision: 23181

Log:
xorg: depend on WCHAR and LOCALE

Xorg needs WCHAR and LOCALE, so make sure it cannot be selected unless
this is enabled in the toolchain.

We unfortunately cannot make BR2_XSERVER_xorg depend on BR2_USE_LOCALE
because of a strange recursion error with dbus, but now we atleast
inform the user what to do to get a working configuration.

The real solution is ofcause of fix xorg, but that's for another day.

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-08-22 14:24:51 UTC (rev 23180)
+++ trunk/buildroot/package/Config.in	2008-08-22 14:24:53 UTC (rev 23181)
@@ -353,6 +353,10 @@
 	default y
 config BR2_PACKAGE_XSERVER_xorg
 	bool "modular xorg"
+	depends on BR2_USE_WCHAR # && BR2_ENABLE_LOCALE
+# depending on BR2_ENABLE_LOCALE gives a recursion error with dbus
+comment "xorg requires a toolchain with LOCALE and WCHAR support"
+	depends on !(BR2_USE_WCHAR && BR2_ENABLE_LOCALE)
 config BR2_PACKAGE_XSERVER_tinyx
 	bool "tinyx"
 endmenu
