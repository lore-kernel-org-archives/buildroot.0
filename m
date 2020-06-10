From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 23:24:34 +0200
Subject: [Buildroot] [git commit] package/nftables: fix build with gcc <= 4.8
Message-ID: <20200610212347.EB1E58186C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3f669df51a2c20bc85032c851ff0ee216296178
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/cf2359b8311fe91f9335c91f2bb4a730c9f4c9dc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-src-main.c-fix-build-with-gcc-4.8.patch   | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/nftables/0001-src-main.c-fix-build-with-gcc-4.8.patch b/package/nftables/0001-src-main.c-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..11b63b452a
--- /dev/null
+++ b/package/nftables/0001-src-main.c-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,46 @@
+From e871a7ad19f6b38d9c0a1c6cf554692b5cdea9bc Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 7 Jun 2020 23:25:55 +0200
+Subject: [PATCH] src/main.c: fix build with gcc <= 4.8
+
+Since commit 719e44277f8e89323a87219b4d4bc7abac05b051, build with
+gcc <= 4.8 fails on:
+
+main.c:186:2: error: 'for' loop initial declarations are only allowed in C99 mode
+  for (size_t i = IDX_INTERACTIVE + 1; i < NR_NFT_OPTIONS; ++i)
+  ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/cf2359b8311fe91f9335c91f2bb4a730c9f4c9dc
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://marc.info/?l=netfilter-devel&m=159156583001993]
+---
+ src/main.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/main.c b/src/main.c
+index d830c7a2..e248a347 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -169,6 +169,7 @@ static void print_option(const struct nft_opt *opt)
+ 
+ static void show_help(const char *name)
+ {
++	size_t i;
+ 	printf("Usage: %s [ options ] [ cmds... ]\n"
+ 	       "\n"
+ 	       "Options:\n", name);
+@@ -185,7 +186,7 @@ static void show_help(const char *name)
+ 
+ 	fputs("\n", stdout);
+ 
+-	for (size_t i = IDX_INTERACTIVE + 1; i < NR_NFT_OPTIONS; ++i)
++	for (i = IDX_INTERACTIVE + 1; i < NR_NFT_OPTIONS; ++i)
+ 		print_option(&nft_options[i]);
+ 
+ 	fputs("\n", stdout);
+-- 
+2.26.2
+
