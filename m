From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Nov 2020 09:39:57 +0100
Subject: [Buildroot] [git commit] package/oniguruma: security bump to
 version 6.9.6
Message-ID: <20201105082748.59734829FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=969fe10855e2fbee623d545859a5209dea85534a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

Fixed many problems found by OSS-Fuzz
Fixed many problems found by Coverity

https://github.com/kkos/oniguruma/releases/tag/v6.9.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../oniguruma/0001-207-Out-of-bounds-write.patch   | 25 ----------------------
 package/oniguruma/oniguruma.hash                   |  2 +-
 package/oniguruma/oniguruma.mk                     |  5 +----
 3 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/package/oniguruma/0001-207-Out-of-bounds-write.patch b/package/oniguruma/0001-207-Out-of-bounds-write.patch
deleted file mode 100644
index 3317449702..0000000000
--- a/package/oniguruma/0001-207-Out-of-bounds-write.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From cbe9f8bd9cfc6c3c87a60fbae58fa1a85db59df0 Mon Sep 17 00:00:00 2001
-From: "K.Kosako" <kkosako0@gmail.com>
-Date: Mon, 21 Sep 2020 12:58:29 +0900
-Subject: [PATCH] #207: Out-of-bounds write
-
-[Retrieved from:
-https://github.com/kkos/oniguruma/commit/cbe9f8bd9cfc6c3c87a60fbae58fa1a85db59df0]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/regcomp.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/regcomp.c b/src/regcomp.c
-index f6494b6d..a0a68561 100644
---- a/src/regcomp.c
-+++ b/src/regcomp.c
-@@ -6257,7 +6257,7 @@ concat_opt_exact_str(OptStr* to, UChar* s, UChar* end, OnigEncoding enc)
- 
-   for (i = to->len, p = s; p < end && i < OPT_EXACT_MAXLEN; ) {
-     len = enclen(enc, p);
--    if (i + len > OPT_EXACT_MAXLEN) break;
-+    if (i + len >= OPT_EXACT_MAXLEN) break;
-     for (j = 0; j < len && p < end; j++)
-       to->s[i++] = *p++;
-   }
diff --git a/package/oniguruma/oniguruma.hash b/package/oniguruma/oniguruma.hash
index 82354d4b9e..668f21d37f 100644
--- a/package/oniguruma/oniguruma.hash
+++ b/package/oniguruma/oniguruma.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2f25cc3165e6da4b12dcabdb6b77c48f436d835e127ec2e3cad7abae9ea8e9a6  onig-6.9.5.tar.gz
+sha256  bd0faeb887f748193282848d01ec2dad8943b5dfcb8dc03ed52dcc963549e819  onig-6.9.6.tar.gz
 sha256  6c7038393e8f30fee16257e713f77e383712f1465d6d25929596746b10b42bd3  COPYING
diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
index c2330c7380..e7aaa43c2f 100644
--- a/package/oniguruma/oniguruma.mk
+++ b/package/oniguruma/oniguruma.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONIGURUMA_VERSION = 6.9.5
+ONIGURUMA_VERSION = 6.9.6
 ONIGURUMA_SITE = \
 	https://github.com/kkos/oniguruma/releases/download/v$(ONIGURUMA_VERSION)
 ONIGURUMA_SOURCE = onig-$(ONIGURUMA_VERSION).tar.gz
@@ -12,7 +12,4 @@ ONIGURUMA_LICENSE = BSD-2-Clause
 ONIGURUMA_LICENSE_FILES = COPYING
 ONIGURUMA_INSTALL_STAGING = YES
 
-# 0001-207-Out-of-bounds-write.patch
-ONIGURUMA_IGNORE_CVES += CVE-2020-26159
-
 $(eval $(autotools-package))
