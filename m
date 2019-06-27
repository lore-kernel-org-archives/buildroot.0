From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Jun 2019 17:56:46 +0200
Subject: [Buildroot] [git commit] package/bzip2: add upstream security fix
 for CVE-2019-12900
Message-ID: <20190627160032.926B2841FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6581c441dfc06c5e5e3666718e5c2e9801485ede
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch to resolve cve-2019-12900 which affects bzip2 versions 1.0.6 and older

More information can be found at
https://nvd.nist.gov/vuln/detail/CVE-2019-12900

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Make-sure-nSelectors-is-not-out-of-range.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/bzip2/0003-Make-sure-nSelectors-is-not-out-of-range.patch b/package/bzip2/0003-Make-sure-nSelectors-is-not-out-of-range.patch
new file mode 100644
index 0000000000..77a500d46d
--- /dev/null
+++ b/package/bzip2/0003-Make-sure-nSelectors-is-not-out-of-range.patch
@@ -0,0 +1,33 @@
+From 74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc Mon Sep 17 00:00:00 2001
+From: Albert Astals Cid <aacid@kde.org>
+Date: Tue, 28 May 2019 19:35:18 +0200
+Subject: [PATCH] Make sure nSelectors is not out of range
+
+nSelectors is used in a loop from 0 to nSelectors to access selectorMtf
+which is
+	UChar    selectorMtf[BZ_MAX_SELECTORS];
+so if nSelectors is bigger than BZ_MAX_SELECTORS it'll do an invalid memory
+access
+
+Fixes out of bounds access discovered while fuzzying karchive
+
+Signed-off-by: Albert Astals Cid <aacid@kde.org>
+---
+ decompress.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/decompress.c b/decompress.c
+index ab6a624..f3db91d 100644
+--- a/decompress.c
++++ b/decompress.c
+@@ -287,7 +287,7 @@ Int32 BZ2_decompress ( DState* s )
+       GET_BITS(BZ_X_SELECTOR_1, nGroups, 3);
+       if (nGroups < 2 || nGroups > 6) RETURN(BZ_DATA_ERROR);
+       GET_BITS(BZ_X_SELECTOR_2, nSelectors, 15);
+-      if (nSelectors < 1) RETURN(BZ_DATA_ERROR);
++      if (nSelectors < 1 || nSelectors > BZ_MAX_SELECTORS) RETURN(BZ_DATA_ERROR);
+       for (i = 0; i < nSelectors; i++) {
+          j = 0;
+          while (True) {
+-- 
+2.21.0
