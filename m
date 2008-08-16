From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 16 Aug 2008 05:32:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pcre
Message-ID: <20080816123254.E7D393C827@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-16 05:32:54 -0700 (Sat, 16 Aug 2008)
New Revision: 23091

Log:
pcre: fix compilation when C++ support is disabled

pcre will use host g++ is no cross g++ is available, so explicitly disable
c++ support in pcre if it isn't enabled in buildroot instead.

Modified:
   trunk/buildroot/package/pcre/pcre.mk


Changeset:
Modified: trunk/buildroot/package/pcre/pcre.mk
===================================================================
--- trunk/buildroot/package/pcre/pcre.mk	2008-08-16 11:59:59 UTC (rev 23090)
+++ trunk/buildroot/package/pcre/pcre.mk	2008-08-16 12:32:54 UTC (rev 23091)
@@ -9,9 +9,10 @@
 PCRE_INSTALL_STAGING = YES
 PCRE_INSTALL_TARGET = YES
 
-PCRE_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-        --build=$(GNU_HOST_NAME) --prefix=/usr \
-        --includedir=/usr/include
+ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
+# pcre will use the host g++ if a cross version isn't available
+PCRE_CONF_OPT = --disable-cpp
+endif
 
 PCRE_DEPENDENCIES = uclibc
 
