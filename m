From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 31 Jan 2014 00:15:48 +0100
Subject: [Buildroot] [PATCH] gnutls: bump to 3.2.9
Message-ID: <1391123748-29594-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gnutls-01-gettime.patch was applied upstream, AUTORECONF is no longer
necessary.

The GNUTLS_LIBREGEX_CHECK_FIX didn't actually work before, because it was
overwritten by the autoreconf. It looks like things still work without
regex. However, this patch reinstates the regex support by setting
libopts_cv_with_libregex=yes in the environment.

Fixes http://autobuild.buildroot.net/results/b22/b22f2caa79f371c625939b65a88a2073382c5288
(failure in libvncserver) because gnutls.so is now properly linked with -lrt.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I think it will still fail when linking statically, because the -lrt is
still missing from the .pc file. However, I couldn't find a package in
buildroot that doesn't either add -lrt itself, or fails linking statically
for other reasons.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gnutls/gnutls-01-gettime.patch | 25 -------------------------
 package/gnutls/gnutls.mk               | 10 ++--------
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 package/gnutls/gnutls-01-gettime.patch

diff --git a/package/gnutls/gnutls-01-gettime.patch b/package/gnutls/gnutls-01-gettime.patch
deleted file mode 100644
index e230199..0000000
--- a/package/gnutls/gnutls-01-gettime.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From b9dee5a0afec0f78343863048d6564021416e65a Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 26 Dec 2013 13:09:34 -0300
-Subject: [PATCH] Add LIB_CLOCK_GETTIME to crywrap
-
-It's used indirectly thus causing build breakage on versions of glibc
-where it's defined in librt rather than libc directly.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- src/crywrap/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/crywrap/Makefile.am b/src/crywrap/Makefile.am
-index ca41259..d86ca55 100644
---- a/src/crywrap/Makefile.am
-+++ b/src/crywrap/Makefile.am
-@@ -29,3 +29,4 @@ bin_PROGRAMS = crywrap
- 
- crywrap_SOURCES = crywrap.c primes.h crywrap.h
- crywrap_LDADD = ../../lib/libgnutls.la $(LIBIDN_LIBS) #../../gl/libgnu.la 
-+crywrap_LDADD += $(LIB_CLOCK_GETTIME)
--- 
-1.8.3.2
-
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 1d49757..a9483a3 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,11 +5,9 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.2
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).8
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).9
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
-# gettime patch
-GNUTLS_AUTORECONF = YES
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
 GNUTLS_LICENSE_FILES = COPYING COPYING.LESSER
 GNUTLS_DEPENDENCIES = host-pkgconf nettle pcre \
@@ -35,11 +33,7 @@ GNUTLS_CONF_OPT += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(
 
 # gnutls needs libregex, but pcre can be used too
 # The check isn't cross-compile friendly
-define GNUTLS_LIBREGEX_CHECK_FIX
-	$(SED) 's/libopts_cv_with_libregex=no/libopts_cv_with_libregex=yes/g;'\
-		$(@D)/configure
-endef
-GNUTLS_PRE_CONFIGURE_HOOKS += GNUTLS_LIBREGEX_CHECK_FIX
+GNUTLS_CONF_ENV += libopts_cv_with_libregex=yes
 GNUTLS_CONF_OPT += --with-regex-header=pcreposix.h \
 	--with-libregex-cflags="`$(PKG_CONFIG_HOST_BINARY) libpcreposix --cflags`" \
 	--with-libregex-libs="`$(PKG_CONFIG_HOST_BINARY) libpcreposix --libs`"
-- 
1.8.5.3
