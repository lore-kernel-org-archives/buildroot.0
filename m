From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 23 Jul 2007 04:37:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070723113726.9F383A6856@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-23 04:37:25 -0700 (Mon, 23 Jul 2007)
New Revision: 19220

Log:
- iff the cross-compiler supports certain mtune,march,mabi flags then use them for the packages.
  This should make it obvious if the wrong compiler is used to build the target.


Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-07-23 11:35:26 UTC (rev 19219)
+++ trunk/buildroot/package/Makefile.in	2007-07-23 11:37:25 UTC (rev 19220)
@@ -34,6 +34,22 @@
 #TARGET_LDFLAGS=-Wl,$(BR2_SYSROOT)
 endif
 
+CC_TARGET_TUNE_:=$(strip $(subst ",,BR2_GCC_TARGET_TUNE))
+#"))
+CC_TARGET_ARCH_:=$(strip $(subst ",,BR2_GCC_TARGET_ARCH))
+#"))
+CC_TARGET_ABI_:=$(strip $(subst ",,BR2_GCC_TARGET_ABI))
+#"))
+ifneq ($(CC_TARGET_TUNE_),)
+TARGET_CFLAGS+=-mtune=$(CC_TARGET_TUNE_)
+endif
+ifneq ($(CC_TARGET_ARCH_),)
+TARGET_CFLAGS+=-march=$(CC_TARGET_ARCH_)
+endif
+ifneq ($(CC_TARGET_ABI_),)
+TARGET_CFLAGS+=-mabi=$(CC_TARGET_ABI_)
+endif
+
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
 ifeq ($(BR2_x86_64),y)
 TARGET_CFLAGS+=-fPIC -DPIC
