From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 14 Dec 2006 07:37:12 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20061214153712.EE9BF48605@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-14 07:37:12 -0800 (Thu, 14 Dec 2006)
New Revision: 16926

Log:
- eventually let configure check our cross-compiler. nil the checks otherwise.


Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2006-12-14 15:36:12 UTC (rev 16925)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2006-12-14 15:37:12 UTC (rev 16926)
@@ -34,12 +34,15 @@
 endif
 	touch $(MPFR_DIR)/.unpacked
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),)
+MPFR_CXX:=CXX=""
+endif
 $(MPFR_DIR)/.configured: $(MPFR_DIR)/.unpacked $(STAGING_DIR)/lib/$(GMP_BINARY)
 	(cd $(MPFR_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		ac_cv_c_bigendian=$(MPFR_BE) \
-		CXX="" \
+		$(MPFR_CXX) \
 		./configure \
 		--host=$(REAL_GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
