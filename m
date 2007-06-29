From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 29 Jun 2007 19:09:08 +0300
Subject: [Buildroot] PATCH: uclibc.iconv.diff - fix for glib 2.12.9 (No
 iconv() implementation found in C library or libiconv)
Message-ID: <20070629190908.76e442ce@newbox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,

This patch disables building of iconv binary in uclibc ( it's failed when locale support is enabled).
In turn correct building of uclibc with locale support gives correct build for glibc 2.12.9 - a bug was recently opened: 
 [buildroot 0001408]: Fail to build glib 2.12.9 (No iconv() implementation found in C library or libiconv)

Actually it's just Assen Stoyanov's patch but made from root of buildroot for suitable applying in svn for maintainer.

Without this patch glib build fails.

Best regards, Ivan

---

diff -urN buildroot.orig/toolchain/uClibc/uClibc.iconv.patch buildroot.new/toolchain/uClibc/uClibc.iconv.patch
--- buildroot.orig/toolchain/uClibc/uClibc.iconv.patch	1970-01-01 03:00:00 +0300
+++ buildroot.new/toolchain/uClibc/uClibc.iconv.patch	2007-06-29 16:15:24 +0300
@@ -0,0 +1,22 @@
+--- uClibc-0.9.29-orig/utils/Makefile.in	2007-06-29 11:34:47.000000000 +0300
++++ uClibc-0.9.29/utils/Makefile.in	2007-06-29 11:33:03.000000000 +0300
+@@ -52,7 +52,8 @@
+ 
+ utils_ICONV_OBJ =
+ ifeq ($(UCLIBC_HAS_LOCALE),y)
+-utils_ICONV_OBJ := $(utils_OUT)/iconv
++# temporary disabled - compilation is broken!
++#utils_ICONV_OBJ := $(utils_OUT)/iconv
+ endif
+ 
+ utils_OBJ := $(patsubst %,$(utils_OUT)/%,$(utils_OBJ))
+@@ -85,7 +86,8 @@
+ 	$(INSTALL) -m 755 $(utils_OUT)/ldconfig $(PREFIX)$(RUNTIME_PREFIX)sbin/ldconfig
+ endif
+ ifeq ($(UCLIBC_HAS_LOCALE),y)
+-	$(INSTALL) -m 755 $(utils_OUT)/iconv $(PREFIX)$(RUNTIME_PREFIX)usr/bin/iconv
++	# temporary disabled - compilation is broken!
++	#$(INSTALL) -m 755 $(utils_OUT)/iconv $(PREFIX)$(RUNTIME_PREFIX)usr/bin/iconv
+ endif
+ 
+ objclean-y += utils_clean
