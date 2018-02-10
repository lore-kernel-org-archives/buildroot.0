From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Feb 2018 08:55:56 +0100
Subject: [Buildroot] [git commit] nftables: fix build with glibc before 2.19
Message-ID: <20180210075608.185FE88524@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5d5ae21b6982773789c282d3d4dbaadbca22be3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch that has a local definition of IPPROTO_MH. This fixes build
with glibc before 2.19 that missed IPPROTO_MH.

Fixes:
http://autobuild.buildroot.net/results/b0a/b0ab6c8c765977cfdc9791d768d3ec2cf129d25d/
http://autobuild.buildroot.net/results/3ef/3ef36d9d03497ee1d5d20bd44aee6ccf12868f7b/
http://autobuild.buildroot.net/results/445/445f2291ebba521f0faac961ca8868ae99b2d795/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-src-fix-build-with-older-glibc.patch      | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/nftables/0001-src-fix-build-with-older-glibc.patch b/package/nftables/0001-src-fix-build-with-older-glibc.patch
new file mode 100644
index 0000000000..d1ba295306
--- /dev/null
+++ b/package/nftables/0001-src-fix-build-with-older-glibc.patch
@@ -0,0 +1,38 @@
+From 381eaa40735385a1a60e5ab0a7daf4bb847fc2ab Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 9 Feb 2018 14:42:31 +0200
+Subject: [PATCH] src: fix build with older glibc
+
+glibc before 2.19 missed the definition of IPPROTO_MH. This leads to
+build failure:
+
+parser_bison.y: In function 'nft_parse':
+parser_bison.y:3793:21: error: 'IPPROTO_MH' undeclared (first use in this function)
+    | MH { $$ = IPPROTO_MH; }
+                     ^
+
+Since we have a local definition of IPPROTO_MH in headers.h use that to
+fix the build.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://marc.info/?l=netfilter-devel&m=151818061103886&w=2
+
+ src/parser_bison.y | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/parser_bison.y b/src/parser_bison.y
+index 2e79109f4da3..578bfdc10429 100644
+--- a/src/parser_bison.y
++++ b/src/parser_bison.y
+@@ -29,6 +29,7 @@
+ #include <rule.h>
+ #include <statement.h>
+ #include <expression.h>
++#include <headers.h>
+ #include <utils.h>
+ #include <parser.h>
+ #include <erec.h>
+-- 
+2.15.1
+
