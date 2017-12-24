From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 24 Dec 2017 21:49:12 +0200
Subject: [Buildroot] [PATCH] faad2: bump to version 2.8.8
Message-ID: <6a79654b376420cca710f9b4fecbdde8cd6dc430.1514144952.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch; issue fixed upstream.

Add license file hash.

Revert back to .tar.gz since that is what upstream provides.

Remove autoreconf; tarball has configure script.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-getopt-fix-strncmp-declaration.patch      | 40 ----------------------
 package/faad2/faad2.hash                           |  6 ++--
 package/faad2/faad2.mk                             |  5 +--
 3 files changed, 5 insertions(+), 46 deletions(-)
 delete mode 100644 package/faad2/0001-getopt-fix-strncmp-declaration.patch

diff --git a/package/faad2/0001-getopt-fix-strncmp-declaration.patch b/package/faad2/0001-getopt-fix-strncmp-declaration.patch
deleted file mode 100644
index 0e5f27e52af2..000000000000
--- a/package/faad2/0001-getopt-fix-strncmp-declaration.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 6787914efad562e4097a153988109c5c7158abf7 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Wed, 16 Aug 2017 13:35:57 +0300
-Subject: [PATCH] getopt: fix strncmp() declaration
-
-The strncmp() declaration does not conform with the standard as to the
-type of the 'n' parameter. Fix this to avoid the following build failure
-with musl libc:
-
-n file included from main.c:61:0:
-getopt.c:175:13: error: conflicting types for 'strncmp'
- extern int  strncmp(const char *s1, const char *s2, unsigned int n);
-             ^~~~~~~
-In file included from main.c:49:0:
-.../host/x86_64-buildroot-linux-musl/sysroot/usr/include/string.h:38:5: note: previous declaration of 'strncmp' was here
- int strncmp (const char *, const char *, size_t);
-     ^~~~~~~
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://sourceforge.net/p/faac/bugs/217/
-
- frontend/getopt.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/frontend/getopt.c b/frontend/getopt.c
-index 185d49b804dd..40c7a2242551 100644
---- a/frontend/getopt.c
-+++ b/frontend/getopt.c
-@@ -172,7 +172,7 @@ static enum
- #if __STDC__ || defined(PROTO)
- extern char *getenv(const char *name);
- extern int  strcmp (const char *s1, const char *s2);
--extern int  strncmp(const char *s1, const char *s2, unsigned int n);
-+extern int  strncmp(const char *s1, const char *s2, size_t n);
- 
- static int my_strlen(const char *s);
- static char *my_index (const char *str, int chr);
--- 
-2.14.1
-
diff --git a/package/faad2/faad2.hash b/package/faad2/faad2.hash
index d298e909a97c..2c6acee3d7fb 100644
--- a/package/faad2/faad2.hash
+++ b/package/faad2/faad2.hash
@@ -1,4 +1,6 @@
 # From http://sourceforge.net/projects/faac/files/faad2-src/faad2-2.8.0/ (used by upstream):
-sha1	a5caa71cd915acd502d96cba56f38296277f2350  faad2-2.8.1.tar.bz2
+md5	28f6116efdbe9378269f8a6221767d1f  faad2-2.8.8.tar.gz
+sha1	0d49c516d4a83c39053a9bd214fddba72cbc34ad  faad2-2.8.8.tar.gz
 # Locally computed
-sha256  f4042496f6b0a60f5ded6acd11093230044ef8a2fd965360c1bbd5b58780933d  faad2-2.8.1.tar.bz2
+sha256  985c3fadb9789d2815e50f4ff714511c79c2710ac27a4aaaf5c0c2662141426d  faad2-2.8.8.tar.gz
+sha256  d3baf3a54943cf12a994c85867a18dec84f810901b2f2878ddfd77efcc3c150f  COPYING
diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index fa965fe5909c..27daadfc125f 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -5,13 +5,10 @@
 ################################################################################
 
 FAAD2_VERSION_MAJOR = 2.8
-FAAD2_VERSION = $(FAAD2_VERSION_MAJOR).1
+FAAD2_VERSION = $(FAAD2_VERSION_MAJOR).8
 FAAD2_SITE = http://downloads.sourceforge.net/project/faac/faad2-src/faad2-$(FAAD2_VERSION_MAJOR).0
-FAAD2_SOURCE = faad2-$(FAAD2_VERSION).tar.bz2
 FAAD2_LICENSE = GPL-2.0
 FAAD2_LICENSE_FILES = COPYING
-# No configure script in upstream tarball
-FAAD2_AUTORECONF = YES
 # frontend/faad calls frexp()
 FAAD2_CONF_ENV = LIBS=-lm
 FAAD2_INSTALL_STAGING = YES
-- 
2.15.1
