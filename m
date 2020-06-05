From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Jun 2020 23:37:00 +0200
Subject: [Buildroot] [git commit] package/python-markdown2: drop patches
Message-ID: <20200605213926.0491881EAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cae6c8b57f1396bd617f697102b21a77361fe3cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On master, commit 544007dcc4 itroduced patches to fix CVE-2020-11888.
On next, commit 604fe08806 itroduced the exact same patches for the
exact same reason.

But on next, commit 81b3fd8654 bumped the version and dropped the
patches.

When next was merged into master in commit a6569f2b3d, the patches
introduced by 544007dcc4 (on master) were retained.

Fixes:
 - http://autobuild.buildroot.org/results/bf305c78dddd035b97e88943a1d19a8ceb6b41f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: rewrite commit log with detailed explanations]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...te-tags-with-punctuation-after-as-part-of.patch | 53 ----------------------
 .../0002-Better-fix-for-issue-348.patch            | 32 -------------
 package/python-markdown2/python-markdown2.mk       |  4 --
 3 files changed, 89 deletions(-)

diff --git a/package/python-markdown2/0001-Fix-for-issue-348-incomplete-tags-with-punctuation-after-as-part-of.patch b/package/python-markdown2/0001-Fix-for-issue-348-incomplete-tags-with-punctuation-after-as-part-of.patch
deleted file mode 100644
index ee980e22e8..0000000000
--- a/package/python-markdown2/0001-Fix-for-issue-348-incomplete-tags-with-punctuation-after-as-part-of.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 9144d0fc5d5249cc4d81287ee79091806e6dde52 Mon Sep 17 00:00:00 2001
-From: Gareth Simpson <gareth.simpson@zoodigital.com>
-Date: Fri, 1 May 2020 19:31:21 +0100
-Subject: [PATCH] Fix for issue 348 - incomplete tags with punctuation after as
- part of the tag name are a source of XSS
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/trentm/python-markdown2/commit/9144d0fc5d5249cc4d81287ee79091806e6dde52]
----
- lib/markdown2.py                           | 2 +-
- test/tm-cases/issue348_incomplete_tag.html | 1 +
- test/tm-cases/issue348_incomplete_tag.opts | 1 +
- test/tm-cases/issue348_incomplete_tag.text | 1 +
- 4 files changed, 4 insertions(+), 1 deletion(-)
- create mode 100644 test/tm-cases/issue348_incomplete_tag.html
- create mode 100644 test/tm-cases/issue348_incomplete_tag.opts
- create mode 100644 test/tm-cases/issue348_incomplete_tag.text
-
-diff --git a/lib/markdown2.py b/lib/markdown2.py
-index 3a5d5d9..636bf07 100755
---- a/lib/markdown2.py
-+++ b/lib/markdown2.py
-@@ -2164,7 +2164,7 @@ def _encode_amps_and_angles(self, text):
-         text = self._naked_gt_re.sub('&gt;', text)
-         return text
- 
--    _incomplete_tags_re = re.compile("<(/?\w+[\s/]+?)")
-+    _incomplete_tags_re = re.compile("<(/?\w+?(?!://).?[\s/]+?)")
- 
-     def _encode_incomplete_tags(self, text):
-         if self.safe_mode not in ("replace", "escape"):
-diff --git a/test/tm-cases/issue348_incomplete_tag.html b/test/tm-cases/issue348_incomplete_tag.html
-new file mode 100644
-index 0000000..46059cc
---- /dev/null
-+++ b/test/tm-cases/issue348_incomplete_tag.html
-@@ -0,0 +1 @@
-+<p>&lt;lol@/ //id="pwn"//onclick="alert(1)"//<strong>abc</strong></p>
-diff --git a/test/tm-cases/issue348_incomplete_tag.opts b/test/tm-cases/issue348_incomplete_tag.opts
-new file mode 100644
-index 0000000..ad487c0
---- /dev/null
-+++ b/test/tm-cases/issue348_incomplete_tag.opts
-@@ -0,0 +1 @@
-+{"safe_mode": "escape"}
-diff --git a/test/tm-cases/issue348_incomplete_tag.text b/test/tm-cases/issue348_incomplete_tag.text
-new file mode 100644
-index 0000000..bb4a0de
---- /dev/null
-+++ b/test/tm-cases/issue348_incomplete_tag.text
-@@ -0,0 +1 @@
-+<lol@/ //id="pwn"//onclick="alert(1)"//**abc**
diff --git a/package/python-markdown2/0002-Better-fix-for-issue-348.patch b/package/python-markdown2/0002-Better-fix-for-issue-348.patch
deleted file mode 100644
index 127bb51da2..0000000000
--- a/package/python-markdown2/0002-Better-fix-for-issue-348.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 0c0543846fa54281e2269b0bff841a0b9ffe23fe Mon Sep 17 00:00:00 2001
-From: Gareth Simpson <gareth.simpson@zoodigital.com>
-Date: Sat, 2 May 2020 21:22:36 +0100
-Subject: [PATCH] Better fix for issue 348
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/trentm/python-markdown2/commit/0c0543846fa54281e2269b0bff841a0b9ffe23fe]
----
- lib/markdown2.py | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/lib/markdown2.py b/lib/markdown2.py
-index 636bf07..be86502 100755
---- a/lib/markdown2.py
-+++ b/lib/markdown2.py
-@@ -2164,11 +2164,14 @@ def _encode_amps_and_angles(self, text):
-         text = self._naked_gt_re.sub('&gt;', text)
-         return text
- 
--    _incomplete_tags_re = re.compile("<(/?\w+?(?!://).?[\s/]+?)")
-+    _incomplete_tags_re = re.compile("<(/?\w+?(?!\w).+?[\s/]+?)")
- 
-     def _encode_incomplete_tags(self, text):
-         if self.safe_mode not in ("replace", "escape"):
-             return text
-+            
-+        if text.endswith(">"):
-+            return text  # this is not an incomplete tag, this is a link in the form <http://x.y.z>
- 
-         return self._incomplete_tags_re.sub("&lt;\\1", text)
- 
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index 095f672028..c7858a3966 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -11,8 +11,4 @@ PYTHON_MARKDOWN2_SETUP_TYPE = setuptools
 PYTHON_MARKDOWN2_LICENSE = MIT
 PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
 
-# 0001-Fix-for-issue-348-incomplete-tags-with-punctuation-after-as-part-of.patch
-# 0002-Better-fix-for-issue-348.patch
-PYTHON_MARKDOWN2_IGNORE_CVES += CVE-2020-11888
-
 $(eval $(python-package))
