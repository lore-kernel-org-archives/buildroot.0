From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 22:35:45 +0200
Subject: [Buildroot] [git commit branch/next] package/python-markdown2: bump
 to version 2.3.9
Message-ID: <20200515201948.4943791975@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81b3fd8654dec3a76af5767f45455e0b9dc1d508
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Drop patches (already in version)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...te-tags-with-punctuation-after-as-part-of.patch | 53 ----------------------
 .../0002-Better-fix-for-issue-348.patch            | 32 -------------
 package/python-markdown2/python-markdown2.hash     |  6 +--
 package/python-markdown2/python-markdown2.mk       |  8 +---
 4 files changed, 5 insertions(+), 94 deletions(-)

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
diff --git a/package/python-markdown2/python-markdown2.hash b/package/python-markdown2/python-markdown2.hash
index 2d72a78053..03315fd3ea 100644
--- a/package/python-markdown2/python-markdown2.hash
+++ b/package/python-markdown2/python-markdown2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown2/json
-md5	a8dee88993d05a3e10765a57b1e1ea07  markdown2-2.3.8.tar.gz
-sha256	7ff88e00b396c02c8e1ecd8d176cfa418fb01fe81234dcea77803e7ce4f05dbe  markdown2-2.3.8.tar.gz
+md5  5c1f9002060cf534bde0bdd584d6b70a  markdown2-2.3.9.tar.gz
+sha256  89526090907ae5ece66d783c434b35c29ee500c1986309e306ce2346273ada6a  markdown2-2.3.9.tar.gz
 # Locally computed sha256 checksums
-sha256	f8c7c4d554409cf621b8d653dbfffb719745fd36f5c49b8305258649b403ef9c  LICENSE.txt
+sha256  f8c7c4d554409cf621b8d653dbfffb719745fd36f5c49b8305258649b403ef9c  LICENSE.txt
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index f508c17a20..c7858a3966 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -4,15 +4,11 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN2_VERSION = 2.3.8
+PYTHON_MARKDOWN2_VERSION = 2.3.9
 PYTHON_MARKDOWN2_SOURCE = markdown2-$(PYTHON_MARKDOWN2_VERSION).tar.gz
-PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/e3/93/d37055743009d1a492b2670cc215831a388b3d6e4a28b7672fdf0f7854f5
+PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/14/69/c542025f80916457ff4fe962404a27ab6417d43822fe54bf88ee2dd1b36f
 PYTHON_MARKDOWN2_SETUP_TYPE = setuptools
 PYTHON_MARKDOWN2_LICENSE = MIT
 PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
 
-# 0001-Fix-for-issue-348-incomplete-tags-with-punctuation-after-as-part-of.patch
-# 0002-Better-fix-for-issue-348.patch
-PYTHON_MARKDOWN2_IGNORE_CVES += CVE-2020-11888
-
 $(eval $(python-package))
