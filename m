From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  9 Feb 2009 13:01:33 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: gmp mpfr
Message-ID: <20090209130134.AA3817644E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-09 13:01:32 +0000 (Mon, 09 Feb 2009)
New Revision: 25269

Log:
gmp/mpfr: force static linking

Patch by Maxim Grigoriev.

GCC 4.3.x would link with the correct shared library versions, but without
any RPATH, so it ended up looking for then in /usr/lib/ at runtime.
This is less than good, as the version there might not be compatible, and
even worse for distributions like Ubuntu, which doesn't install those
libs by default, the build breaks.

Fix it by forcing static linking instead.

Modified:
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2009-02-09 09:07:10 UTC (rev 25268)
+++ trunk/buildroot/package/gmp/gmp.mk	2009-02-09 13:01:32 UTC (rev 25269)
@@ -83,7 +83,7 @@
 		--prefix="$(GMP_HOST_DIR)" \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
-		--enable-shared \
+		--disable-shared \
 		--enable-static \
 		$(DISABLE_NLS) \
 	)

Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2009-02-09 09:07:10 UTC (rev 25268)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2009-02-09 13:01:32 UTC (rev 25269)
@@ -96,7 +96,7 @@
 		--prefix="$(MPFR_HOST_DIR)" \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
-		--enable-shared \
+		--disable-shared \
 		--enable-static \
 		--with-gmp=$(GMP_HOST_DIR) \
 		$(DISABLE_NLS) \
