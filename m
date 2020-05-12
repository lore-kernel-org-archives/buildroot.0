From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2020 12:58:02 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-markdown2:
 fix CVE-2020-11888
Message-ID: <20200512104437.7E6C2908CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60685507c73e07465cb4c1f725522ca49523773a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

python-markdown2 through 2.3.8 allows XSS because element names are
mishandled unless a \w+ match succeeds. For example, an attack might use
elementname@ or elementname- with an onclick attribute.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 544007dcc4fe4561a9775436d3abcde4fb19bbe3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...te-tags-with-punctuation-after-as-part-of.patch | 53 ++++++++++++++++++++++
 .../0002-Better-fix-for-issue-348.patch            | 32 +++++++++++++
 package/python-markdown2/python-markdown2.mk       |  4 ++
 3 files changed, 89 insertions(+)

diff --git a/package/python-markdown2/0001-Fix-for-issue-348-incomplete-tags-with-punctuation-after-as-part-of.patch b/package/python-markdown2/0001-Fix-for-issue-348-incomplete-tags-with-punctuation-after-as-part-of.patch
new file mode 100644
index 0000000000..ee980e22e8
--- /dev/null
+++ b/package/python-markdown2/0001-Fix-for-issue-348-incomplete-tags-with-punctuation-after-as-part-of.patch
@@ -0,0 +1,53 @@
+From 9144d0fc5d5249cc4d81287ee79091806e6dde52 Mon Sep 17 00:00:00 2001
+From: Gareth Simpson <gareth.simpson@zoodigital.com>
+Date: Fri, 1 May 2020 19:31:21 +0100
+Subject: [PATCH] Fix for issue 348 - incomplete tags with punctuation after as
+ part of the tag name are a source of XSS
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/trentm/python-markdown2/commit/9144d0fc5d5249cc4d81287ee79091806e6dde52]
+---
+ lib/markdown2.py                           | 2 +-
+ test/tm-cases/issue348_incomplete_tag.html | 1 +
+ test/tm-cases/issue348_incomplete_tag.opts | 1 +
+ test/tm-cases/issue348_incomplete_tag.text | 1 +
+ 4 files changed, 4 insertions(+), 1 deletion(-)
+ create mode 100644 test/tm-cases/issue348_incomplete_tag.html
+ create mode 100644 test/tm-cases/issue348_incomplete_tag.opts
+ create mode 100644 test/tm-cases/issue348_incomplete_tag.text
+
+diff --git a/lib/markdown2.py b/lib/markdown2.py
+index 3a5d5d9..636bf07 100755
+--- a/lib/markdown2.py
++++ b/lib/markdown2.py
+@@ -2164,7 +2164,7 @@ def _encode_amps_and_angles(self, text):
+         text = self._naked_gt_re.sub('&gt;', text)
+         return text
+ 
+-    _incomplete_tags_re = re.compile("<(/?\w+[\s/]+?)")
++    _incomplete_tags_re = re.compile("<(/?\w+?(?!://).?[\s/]+?)")
+ 
+     def _encode_incomplete_tags(self, text):
+         if self.safe_mode not in ("replace", "escape"):
+diff --git a/test/tm-cases/issue348_incomplete_tag.html b/test/tm-cases/issue348_incomplete_tag.html
+new file mode 100644
+index 0000000..46059cc
+--- /dev/null
++++ b/test/tm-cases/issue348_incomplete_tag.html
+@@ -0,0 +1 @@
++<p>&lt;lol@/ //id="pwn"//onclick="alert(1)"//<strong>abc</strong></p>
+diff --git a/test/tm-cases/issue348_incomplete_tag.opts b/test/tm-cases/issue348_incomplete_tag.opts
+new file mode 100644
+index 0000000..ad487c0
+--- /dev/null
++++ b/test/tm-cases/issue348_incomplete_tag.opts
+@@ -0,0 +1 @@
++{"safe_mode": "escape"}
+diff --git a/test/tm-cases/issue348_incomplete_tag.text b/test/tm-cases/issue348_incomplete_tag.text
+new file mode 100644
+index 0000000..bb4a0de
+--- /dev/null
++++ b/test/tm-cases/issue348_incomplete_tag.text
+@@ -0,0 +1 @@
++<lol@/ //id="pwn"//onclick="alert(1)"//**abc**
diff --git a/package/python-markdown2/0002-Better-fix-for-issue-348.patch b/package/python-markdown2/0002-Better-fix-for-issue-348.patch
new file mode 100644
index 0000000000..127bb51da2
--- /dev/null
+++ b/package/python-markdown2/0002-Better-fix-for-issue-348.patch
@@ -0,0 +1,32 @@
+From 0c0543846fa54281e2269b0bff841a0b9ffe23fe Mon Sep 17 00:00:00 2001
+From: Gareth Simpson <gareth.simpson@zoodigital.com>
+Date: Sat, 2 May 2020 21:22:36 +0100
+Subject: [PATCH] Better fix for issue 348
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/trentm/python-markdown2/commit/0c0543846fa54281e2269b0bff841a0b9ffe23fe]
+---
+ lib/markdown2.py | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/lib/markdown2.py b/lib/markdown2.py
+index 636bf07..be86502 100755
+--- a/lib/markdown2.py
++++ b/lib/markdown2.py
+@@ -2164,11 +2164,14 @@ def _encode_amps_and_angles(self, text):
+         text = self._naked_gt_re.sub('&gt;', text)
+         return text
+ 
+-    _incomplete_tags_re = re.compile("<(/?\w+?(?!://).?[\s/]+?)")
++    _incomplete_tags_re = re.compile("<(/?\w+?(?!\w).+?[\s/]+?)")
+ 
+     def _encode_incomplete_tags(self, text):
+         if self.safe_mode not in ("replace", "escape"):
+             return text
++            
++        if text.endswith(">"):
++            return text  # this is not an incomplete tag, this is a link in the form <http://x.y.z>
+ 
+         return self._incomplete_tags_re.sub("&lt;\\1", text)
+ 
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index d8b946e140..f508c17a20 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -11,4 +11,8 @@ PYTHON_MARKDOWN2_SETUP_TYPE = setuptools
 PYTHON_MARKDOWN2_LICENSE = MIT
 PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
 
+# 0001-Fix-for-issue-348-incomplete-tags-with-punctuation-after-as-part-of.patch
+# 0002-Better-fix-for-issue-348.patch
+PYTHON_MARKDOWN2_IGNORE_CVES += CVE-2020-11888
+
 $(eval $(python-package))
