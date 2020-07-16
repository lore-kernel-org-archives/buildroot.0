From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 16 Jul 2020 23:31:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/nftables: bump to version 0.9.6
Message-ID: <20200716213138.2073736-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (already in version)
- Drop host-bison and host-flex, not needed since version 0.9.5 and
  https://git.netfilter.org/nftables/commit/?id=2885cf2e65042b3dbc44fc232fd35840df255935

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-src-main.c-fix-build-with-gcc-4.8.patch | 46 -------------------
 package/nftables/nftables.hash                |  2 +-
 package/nftables/nftables.mk                  |  5 +-
 3 files changed, 3 insertions(+), 50 deletions(-)
 delete mode 100644 package/nftables/0001-src-main.c-fix-build-with-gcc-4.8.patch

diff --git a/package/nftables/0001-src-main.c-fix-build-with-gcc-4.8.patch b/package/nftables/0001-src-main.c-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 11b63b452a..0000000000
--- a/package/nftables/0001-src-main.c-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From e871a7ad19f6b38d9c0a1c6cf554692b5cdea9bc Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 7 Jun 2020 23:25:55 +0200
-Subject: [PATCH] src/main.c: fix build with gcc <= 4.8
-
-Since commit 719e44277f8e89323a87219b4d4bc7abac05b051, build with
-gcc <= 4.8 fails on:
-
-main.c:186:2: error: 'for' loop initial declarations are only allowed in C99 mode
-  for (size_t i = IDX_INTERACTIVE + 1; i < NR_NFT_OPTIONS; ++i)
-  ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/cf2359b8311fe91f9335c91f2bb4a730c9f4c9dc
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://marc.info/?l=netfilter-devel&m=159156583001993]
----
- src/main.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/main.c b/src/main.c
-index d830c7a2..e248a347 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -169,6 +169,7 @@ static void print_option(const struct nft_opt *opt)
- 
- static void show_help(const char *name)
- {
-+	size_t i;
- 	printf("Usage: %s [ options ] [ cmds... ]\n"
- 	       "\n"
- 	       "Options:\n", name);
-@@ -185,7 +186,7 @@ static void show_help(const char *name)
- 
- 	fputs("\n", stdout);
- 
--	for (size_t i = IDX_INTERACTIVE + 1; i < NR_NFT_OPTIONS; ++i)
-+	for (i = IDX_INTERACTIVE + 1; i < NR_NFT_OPTIONS; ++i)
- 		print_option(&nft_options[i]);
- 
- 	fputs("\n", stdout);
--- 
-2.26.2
-
diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index afe16ddfaf..1112b7a8ad 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,3 +1,3 @@
 # From https://netfilter.org/projects/nftables/downloads.html
-sha256  08b8683a9db5fba980bc092b75288af98d218bbe8ab446daf2338570d0730f9a  nftables-0.9.4.tar.bz2
+sha256  68d6fdfe8ab02303e6b1f13968a4022da5b0120110eaee3233d806857937b66e  nftables-0.9.6.tar.bz2
 sha256  c17bc4fa5b2434c6f283ffcb2312e5bf3c7cdf5787b79505f094d8de734ac53e  COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index c5503e2039..8a003a5e34 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 0.9.4
+NFTABLES_VERSION = 0.9.6
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
-NFTABLES_DEPENDENCIES = libmnl libnftnl host-bison host-flex \
-	host-pkgconf $(TARGET_NLS_DEPENDENCIES)
+NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 NFTABLES_LICENSE = GPL-2.0
 NFTABLES_LICENSE_FILES = COPYING
 NFTABLES_CONF_OPTS = --disable-man-doc --disable-pdf-doc
-- 
2.27.0
