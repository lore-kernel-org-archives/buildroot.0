From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Mar 2018 11:05:25 +0100
Subject: [Buildroot] [git commit] nftables: bump to version 0.8.3
Message-ID: <20180306100810.2241C8221D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43500d5c85df7f73ccb55ce866cbe9293b8b4b10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable man pages and pdf build to avoid dependency on docbook and
dblatex.

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-src-fix-build-with-older-glibc.patch      | 38 ----------------------
 package/nftables/nftables.hash                     |  6 ++--
 package/nftables/nftables.mk                       | 11 ++-----
 3 files changed, 6 insertions(+), 49 deletions(-)

diff --git a/package/nftables/0001-src-fix-build-with-older-glibc.patch b/package/nftables/0001-src-fix-build-with-older-glibc.patch
deleted file mode 100644
index d1ba295306..0000000000
--- a/package/nftables/0001-src-fix-build-with-older-glibc.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 381eaa40735385a1a60e5ab0a7daf4bb847fc2ab Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 9 Feb 2018 14:42:31 +0200
-Subject: [PATCH] src: fix build with older glibc
-
-glibc before 2.19 missed the definition of IPPROTO_MH. This leads to
-build failure:
-
-parser_bison.y: In function 'nft_parse':
-parser_bison.y:3793:21: error: 'IPPROTO_MH' undeclared (first use in this function)
-    | MH { $$ = IPPROTO_MH; }
-                     ^
-
-Since we have a local definition of IPPROTO_MH in headers.h use that to
-fix the build.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://marc.info/?l=netfilter-devel&m=151818061103886&w=2
-
- src/parser_bison.y | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/parser_bison.y b/src/parser_bison.y
-index 2e79109f4da3..578bfdc10429 100644
---- a/src/parser_bison.y
-+++ b/src/parser_bison.y
-@@ -29,6 +29,7 @@
- #include <rule.h>
- #include <statement.h>
- #include <expression.h>
-+#include <headers.h>
- #include <utils.h>
- #include <parser.h>
- #include <erec.h>
--- 
-2.15.1
-
diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index d6ccf7b479..3effe68f2e 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,6 +1,6 @@
 # From http://www.netfilter.org/projects/nftables/downloads.html
-sha1	51fd436845718f1221ee198128656ef9055c2588	nftables-0.8.1.tar.bz2
+sha1	533cb3bf17e90579d24f9621fdb22bdb4f7e3287 	nftables-0.8.3.tar.bz2
 # Locally calculated after checking pgp signature
-# http://www.netfilter.org/projects/nftables/files/nftables-0.8.1.tar.bz2.sig
-sha256	8aead66cce70d68c70e4be917813abcbcf62811ee6de4c7761d0e34391772fc4	nftables-0.8.1.tar.bz2
+# http://www.netfilter.org/projects/nftables/files/nftables-0.8.3.tar.bz2.sig
+sha256	d16be1f5db88e95d29fc0b0e4df88acd079f3ee8e2b872ec7673f9a0d5d95e38	nftables-0.8.3.tar.bz2
 sha256	c17bc4fa5b2434c6f283ffcb2312e5bf3c7cdf5787b79505f094d8de734ac53e	COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 329b9871fe..571cd33ad5 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 0.8.1
+NFTABLES_VERSION = 0.8.3
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = http://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = gmp libmnl libnftnl host-bison host-flex \
 	host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 NFTABLES_LICENSE = GPL-2.0
 NFTABLES_LICENSE_FILES = COPYING
+NFTABLES_CONF_OPTS = --disable-man-doc --disable-pdf-doc
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 NFTABLES_DEPENDENCIES += readline
@@ -23,12 +24,6 @@ ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_LIBNFTNL_JSON),yy)
 NFTABLES_LIBS += -ljansson -lm
 endif
 
-NFTABLES_CONF_ENV = \
-	ac_cv_prog_CONFIG_PDF=no \
-	LIBS="$(NFTABLES_LIBS)" \
-	DBLATEX=no \
-	DOCBOOK2X_MAN=no \
-	DOCBOOK2MAN=no \
-	DB2X_DOCBOOK2MAN=no
+NFTABLES_CONF_ENV = LIBS="$(NFTABLES_LIBS)"
 
 $(eval $(autotools-package))
