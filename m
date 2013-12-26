From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Dec 2013 13:13:56 -0300
Subject: [Buildroot] [PATCH] gnutls: add crywrap clock_gettime patch
Message-ID: <1388074436-30285-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/1bd/1bd67b616e996d684dd584576569517f4653addd/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls-01-gettime.patch | 25 +++++++++++++++++++++++++
 package/gnutls/gnutls.mk               |  2 ++
 2 files changed, 27 insertions(+)
 create mode 100644 package/gnutls/gnutls-01-gettime.patch

diff --git a/package/gnutls/gnutls-01-gettime.patch b/package/gnutls/gnutls-01-gettime.patch
new file mode 100644
index 0000000..e230199
--- /dev/null
+++ b/package/gnutls/gnutls-01-gettime.patch
@@ -0,0 +1,25 @@
+From b9dee5a0afec0f78343863048d6564021416e65a Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 26 Dec 2013 13:09:34 -0300
+Subject: [PATCH] Add LIB_CLOCK_GETTIME to crywrap
+
+It's used indirectly thus causing build breakage on versions of glibc
+where it's defined in librt rather than libc directly.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ src/crywrap/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/crywrap/Makefile.am b/src/crywrap/Makefile.am
+index ca41259..d86ca55 100644
+--- a/src/crywrap/Makefile.am
++++ b/src/crywrap/Makefile.am
+@@ -29,3 +29,4 @@ bin_PROGRAMS = crywrap
+ 
+ crywrap_SOURCES = crywrap.c primes.h crywrap.h
+ crywrap_LDADD = ../../lib/libgnutls.la $(LIBIDN_LIBS) #../../gl/libgnu.la 
++crywrap_LDADD += $(LIB_CLOCK_GETTIME)
+-- 
+1.8.3.2
+
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 9ad673e..1d49757 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -8,6 +8,8 @@ GNUTLS_VERSION_MAJOR = 3.2
 GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).8
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
+# gettime patch
+GNUTLS_AUTORECONF = YES
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
 GNUTLS_LICENSE_FILES = COPYING COPYING.LESSER
 GNUTLS_DEPENDENCIES = host-pkgconf nettle pcre \
-- 
1.8.3.2
