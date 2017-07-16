From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Jul 2017 23:25:54 +0200
Subject: [Buildroot] [git commit] expat: security bump to version 2.2.2
Message-ID: <20170716212230.703D07FF1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3eca095003aecde94414fd1f01a831f1af198ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes (security fixes):

[MOX-006]      Fix non-NULL parser parameter validation in XML_Parse;
                 resulted in NULL dereference, previously

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...c-Fix-mis-detection-of-getrandom-on-Debia.patch | 29 ----------------------
 package/expat/expat.hash                           |  8 +++---
 package/expat/expat.mk                             |  4 +--
 3 files changed, 5 insertions(+), 36 deletions(-)

diff --git a/package/expat/0001-configure.ac-Fix-mis-detection-of-getrandom-on-Debia.patch b/package/expat/0001-configure.ac-Fix-mis-detection-of-getrandom-on-Debia.patch
deleted file mode 100644
index 44f43e1..0000000
--- a/package/expat/0001-configure.ac-Fix-mis-detection-of-getrandom-on-Debia.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 602e6c78ca750c082b72f8cdf4a38839b312959f Mon Sep 17 00:00:00 2001
-From: Sebastian Pipping <sebastian@pipping.org>
-Date: Sun, 18 Jun 2017 18:55:10 +0200
-Subject: [PATCH] configure.ac: Fix mis-detection of getrandom on Debian
- GNU/kFreeBSD (#50)
-
-There is no such thing but we need to link (not just compile) to realize.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- expat/configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1357c9a..444c002 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -130,7 +130,7 @@ AC_LINK_IFELSE([AC_LANG_SOURCE([
- 
- 
- AC_MSG_CHECKING([for getrandom (Linux 3.17+, glibc 2.25+)])
--AC_COMPILE_IFELSE([AC_LANG_SOURCE([
-+AC_LINK_IFELSE([AC_LANG_SOURCE([
-   #include <stdlib.h>  /* for NULL */
-   #include <sys/random.h>
-   int main() {
--- 
-2.11.0
-
diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 595597b..f1e1919 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.2.1/
-md5	d9c3baeab58774cefc2f04faf29f2cf8	expat-2.2.1.tar.bz2
-sha1	f45eb724f182776a9cacec9ed70d549e87198987	expat-2.2.1.tar.bz2
+# From https://sourceforge.net/projects/expat/files/expat/2.2.2/
+md5	1ede9a41223c78528b8c5d23e69a2667	expat-2.2.2.tar.bz2
+sha1	891cee988b38d5d66953f62f94c3150b8810a70a	expat-2.2.2.tar.bz2
 # Calculated based on the hashes above
-sha256	1868cadae4c82a018e361e2b2091de103cd820aaacb0d6cfa49bd2cd83978885	expat-2.2.1.tar.bz2
+sha256	4376911fcf81a23ebd821bbabc26fd933f3ac74833f74924342c29aad2c86046	expat-2.2.2.tar.bz2
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index bb6e627..a10f2c9 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.2.1
+EXPAT_VERSION = 2.2.2
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.bz2
 EXPAT_INSTALL_STAGING = YES
@@ -14,8 +14,6 @@ EXPAT_DEPENDENCIES = host-pkgconf
 HOST_EXPAT_DEPENDENCIES = host-pkgconf
 EXPAT_LICENSE = MIT
 EXPAT_LICENSE_FILES = COPYING
-# for 0001-configure.ac-Fix-mis-detection-of-getrandom-on-Debia.patch
-EXPAT_AUTORECONF = YES
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
