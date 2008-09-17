From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 17 Sep 2008 14:35:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lighttpd
Message-ID: <20080917213551.658F53C69C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-17 14:35:51 -0700 (Wed, 17 Sep 2008)
New Revision: 23417

Log:
lighttpd: fix compilation without largefile support

lighttpd uses --disable-lfs instead of --disable-largefile.
Remove redundant configure args while we're at it.

Modified:
   trunk/buildroot/package/lighttpd/lighttpd.mk


Changeset:
Modified: trunk/buildroot/package/lighttpd/lighttpd.mk
===================================================================
--- trunk/buildroot/package/lighttpd/lighttpd.mk	2008-09-17 21:33:19 UTC (rev 23416)
+++ trunk/buildroot/package/lighttpd/lighttpd.mk	2008-09-17 21:35:51 UTC (rev 23417)
@@ -10,18 +10,18 @@
 LIGHTTPD_INSTALL_TARGET = YES
 LIGHTTPD_DEPENDENCIES = uclibc
 LIGHTTPD_CONF_ENV =
+
+ifneq ($(BR2_LARGEFILE),y)
+LIGHTTPD_LFS:=$(DISABLE_LARGEFILE) --disable-lfs
+endif
+
 LIGHTTPD_CONF_OPT = \
-	--target=$(GNU_TARGET_NAME) \
-	--host=$(GNU_TARGET_NAME) \
-	--build=$(GNU_HOST_NAME) \
-	--prefix=/usr \
 	--libdir=/usr/lib/lighttpd \
 	--libexecdir=/usr/lib \
-	--sysconfdir=/etc \
 	--localstatedir=/var \
 	--program-prefix="" \
 	$(DISABLE_IPV6) \
-	$(DISABLE_LARGEFILE)
+	$(LIGHTTPD_LFS)
 
 ifeq ($(strip $(BR2_PACKAGE_LIGHTTPD_OPENSSL)),y)
 LIGHTTPD_DEPENDENCIES += openssl
