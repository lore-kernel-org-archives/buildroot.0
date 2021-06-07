From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Jun 2021 23:32:25 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/mutt: add
 upstream security fix for CVE-2021-32055
Message-ID: <20210607211334.5DD288B845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51e7ddcf3bd18d41ad0c357287561f5c40c51ffa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the following security issue:

- CVE-2021-32055: Mutt 1.11.0 through 2.0.x before 2.0.7 (and NeoMutt
  2019-10-25 through 2021-05-04) has a $imap_qresync issue in which
  imap/util.c has an out-of-bounds read in situations where an IMAP sequence
  set ends with a comma.  NOTE: the $imap_qresync setting for QRESYNC is not
  enabled by default.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...x-seqset-iterator-when-it-ends-in-a-comma.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/mutt/0005-Fix-seqset-iterator-when-it-ends-in-a-comma.patch b/package/mutt/0005-Fix-seqset-iterator-when-it-ends-in-a-comma.patch
new file mode 100644
index 0000000000..b7a51ddc24
--- /dev/null
+++ b/package/mutt/0005-Fix-seqset-iterator-when-it-ends-in-a-comma.patch
@@ -0,0 +1,40 @@
+From 7c4779ac24d2fb68a2a47b58c7904118f40965d5 Mon Sep 17 00:00:00 2001
+From: Kevin McCarthy <kevin@8t8.us>
+Date: Mon, 3 May 2021 13:11:30 -0700
+Subject: [PATCH] Fix seqset iterator when it ends in a comma.
+
+If the seqset ended with a comma, the substr_end marker would be just
+before the trailing nul.  In the next call, the loop to skip the
+marker would iterate right past the end of string too.
+
+The fix is simple: place the substr_end marker and skip past it
+immediately.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Peter: fixes CVE-2021-32055]
+---
+ imap/util.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/imap/util.c b/imap/util.c
+index c529fd8f..488e8396 100644
+--- a/imap/util.c
++++ b/imap/util.c
+@@ -1036,13 +1036,11 @@ int mutt_seqset_iterator_next (SEQSET_ITERATOR *iter, unsigned int *next)
+     if (iter->substr_cur == iter->eostr)
+       return 1;
+ 
+-    while (!*(iter->substr_cur))
+-      iter->substr_cur++;
+     iter->substr_end = strchr (iter->substr_cur, ',');
+     if (!iter->substr_end)
+       iter->substr_end = iter->eostr;
+     else
+-      *(iter->substr_end) = '\0';
++      *(iter->substr_end++) = '\0';
+ 
+     range_sep = strchr (iter->substr_cur, ':');
+     if (range_sep)
+-- 
+2.20.1
+
