From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2020 15:54:26 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/oniguruma: fix
 CVE-2020-26159
Message-ID: <20201028150625.634D683F07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=196f605d55ecc8aca0557cba01d3c2c4339b22e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fix CVE-2020-26159: In Oniguruma 6.9.5_rev1, an attacker able to supply
a regular expression for compilation may be able to overflow a buffer by
one byte in concat_opt_exact_str in src/regcomp.c.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5dbebf3d35095e26463bbb0fddebf906454a685c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../oniguruma/0001-207-Out-of-bounds-write.patch   | 25 ++++++++++++++++++++++
 package/oniguruma/oniguruma.mk                     |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/package/oniguruma/0001-207-Out-of-bounds-write.patch b/package/oniguruma/0001-207-Out-of-bounds-write.patch
new file mode 100644
index 0000000000..3317449702
--- /dev/null
+++ b/package/oniguruma/0001-207-Out-of-bounds-write.patch
@@ -0,0 +1,25 @@
+From cbe9f8bd9cfc6c3c87a60fbae58fa1a85db59df0 Mon Sep 17 00:00:00 2001
+From: "K.Kosako" <kkosako0@gmail.com>
+Date: Mon, 21 Sep 2020 12:58:29 +0900
+Subject: [PATCH] #207: Out-of-bounds write
+
+[Retrieved from:
+https://github.com/kkos/oniguruma/commit/cbe9f8bd9cfc6c3c87a60fbae58fa1a85db59df0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/regcomp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/regcomp.c b/src/regcomp.c
+index f6494b6d..a0a68561 100644
+--- a/src/regcomp.c
++++ b/src/regcomp.c
+@@ -6257,7 +6257,7 @@ concat_opt_exact_str(OptStr* to, UChar* s, UChar* end, OnigEncoding enc)
+ 
+   for (i = to->len, p = s; p < end && i < OPT_EXACT_MAXLEN; ) {
+     len = enclen(enc, p);
+-    if (i + len > OPT_EXACT_MAXLEN) break;
++    if (i + len >= OPT_EXACT_MAXLEN) break;
+     for (j = 0; j < len && p < end; j++)
+       to->s[i++] = *p++;
+   }
diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
index d1ff1f115f..c2330c7380 100644
--- a/package/oniguruma/oniguruma.mk
+++ b/package/oniguruma/oniguruma.mk
@@ -12,4 +12,7 @@ ONIGURUMA_LICENSE = BSD-2-Clause
 ONIGURUMA_LICENSE_FILES = COPYING
 ONIGURUMA_INSTALL_STAGING = YES
 
+# 0001-207-Out-of-bounds-write.patch
+ONIGURUMA_IGNORE_CVES += CVE-2020-26159
+
 $(eval $(autotools-package))
