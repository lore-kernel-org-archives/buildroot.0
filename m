From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 23:30:21 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/python3: add
 upstream security fix for CVE-2019-10160
Message-ID: <20190623212922.B386A8270E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c284f1fe3831b8ec3b6507b99f2d7c3f8b5268d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes CVE-2019-10160: urlsplit does not handle NFKC normalization (2nd fix)

While the fix for CVE-2019-9936 is included in 3.7.3, the followup
regression fixes unfortunatly aren't.

https://bugs.python.org/issue36742

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b57490563c065e813e176173017e45dbd764939b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ixes-handling-of-pre-normalization-charac.patch | 70 ++++++++++++++++++++++
 ...orrects-fix-to-handle-decomposition-in-us.patch | 58 ++++++++++++++++++
 2 files changed, 128 insertions(+)

diff --git a/package/python3/0033-bpo-36742-Fixes-handling-of-pre-normalization-charac.patch b/package/python3/0033-bpo-36742-Fixes-handling-of-pre-normalization-charac.patch
new file mode 100644
index 0000000000..38f8ed625b
--- /dev/null
+++ b/package/python3/0033-bpo-36742-Fixes-handling-of-pre-normalization-charac.patch
@@ -0,0 +1,70 @@
+From 4d723e76e1ad17e9e7d5e828e59bb47e76f2174b Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Tue, 30 Apr 2019 05:21:02 -0700
+Subject: [PATCH] bpo-36742: Fixes handling of pre-normalization characters in
+ urlsplit() (GH-13017)
+
+(cherry picked from commit d537ab0ff9767ef024f26246899728f0116b1ec3)
+
+Co-authored-by: Steve Dower <steve.dower@python.org>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Lib/test/test_urlparse.py                                     |  6 ++++++
+ Lib/urllib/parse.py                                           | 11 +++++++----
+ .../next/Security/2019-04-29-15-34-59.bpo-36742.QCUY0i.rst    |  1 +
+ 3 files changed, 14 insertions(+), 4 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-04-29-15-34-59.bpo-36742.QCUY0i.rst
+
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
+index e6638aee22..c262354494 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -1001,6 +1001,12 @@ class UrlParseTestCase(unittest.TestCase):
+         self.assertIn('\u2100', denorm_chars)
+         self.assertIn('\uFF03', denorm_chars)
+ 
++        # bpo-36742: Verify port separators are ignored when they
++        # existed prior to decomposition
++        urllib.parse.urlsplit('http://\u30d5\u309a:80')
++        with self.assertRaises(ValueError):
++            urllib.parse.urlsplit('http://\u30d5\u309a\ufe1380')
++
+         for scheme in ["http", "https", "ftp"]:
+             for c in denorm_chars:
+                 url = "{}://netloc{}false.netloc/path".format(scheme, c)
+diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
+index 1eec26e0f1..f5b3487ea9 100644
+--- a/Lib/urllib/parse.py
++++ b/Lib/urllib/parse.py
+@@ -397,13 +397,16 @@ def _checknetloc(netloc):
+     # looking for characters like \u2100 that expand to 'a/c'
+     # IDNA uses NFKC equivalence, so normalize for this check
+     import unicodedata
+-    netloc2 = unicodedata.normalize('NFKC', netloc)
+-    if netloc == netloc2:
++    n = netloc.rpartition('@')[2] # ignore anything to the left of '@'
++    n = n.replace(':', '')        # ignore characters already included
++    n = n.replace('#', '')        # but not the surrounding text
++    n = n.replace('?', '')
++    netloc2 = unicodedata.normalize('NFKC', n)
++    if n == netloc2:
+         return
+-    _, _, netloc = netloc.rpartition('@') # anything to the left of '@' is okay
+     for c in '/?#@:':
+         if c in netloc2:
+-            raise ValueError("netloc '" + netloc2 + "' contains invalid " +
++            raise ValueError("netloc '" + netloc + "' contains invalid " +
+                              "characters under NFKC normalization")
+ 
+ def urlsplit(url, scheme='', allow_fragments=True):
+diff --git a/Misc/NEWS.d/next/Security/2019-04-29-15-34-59.bpo-36742.QCUY0i.rst b/Misc/NEWS.d/next/Security/2019-04-29-15-34-59.bpo-36742.QCUY0i.rst
+new file mode 100644
+index 0000000000..d729ed2f3c
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2019-04-29-15-34-59.bpo-36742.QCUY0i.rst
+@@ -0,0 +1 @@
++Fixes mishandling of pre-normalization characters in urlsplit().
+-- 
+2.11.0
+
diff --git a/package/python3/0034-bpo-36742-Corrects-fix-to-handle-decomposition-in-us.patch b/package/python3/0034-bpo-36742-Corrects-fix-to-handle-decomposition-in-us.patch
new file mode 100644
index 0000000000..653d4116c9
--- /dev/null
+++ b/package/python3/0034-bpo-36742-Corrects-fix-to-handle-decomposition-in-us.patch
@@ -0,0 +1,58 @@
+From 250b62acc59921d399f0db47db3b462cd6037e09 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Tue, 4 Jun 2019 09:15:13 -0700
+Subject: [PATCH] bpo-36742: Corrects fix to handle decomposition in usernames
+ (GH-13812)
+
+(cherry picked from commit 8d0ef0b5edeae52960c7ed05ae8a12388324f87e)
+
+Co-authored-by: Steve Dower <steve.dower@python.org>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Lib/test/test_urlparse.py | 11 ++++++-----
+ Lib/urllib/parse.py       |  6 +++---
+ 2 files changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
+index c262354494..68f633ca3a 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -1008,11 +1008,12 @@ class UrlParseTestCase(unittest.TestCase):
+             urllib.parse.urlsplit('http://\u30d5\u309a\ufe1380')
+ 
+         for scheme in ["http", "https", "ftp"]:
+-            for c in denorm_chars:
+-                url = "{}://netloc{}false.netloc/path".format(scheme, c)
+-                with self.subTest(url=url, char='{:04X}'.format(ord(c))):
+-                    with self.assertRaises(ValueError):
+-                        urllib.parse.urlsplit(url)
++            for netloc in ["netloc{}false.netloc", "n{}user at netloc"]:
++                for c in denorm_chars:
++                    url = "{}://{}/path".format(scheme, netloc.format(c))
++                    with self.subTest(url=url, char='{:04X}'.format(ord(c))):
++                        with self.assertRaises(ValueError):
++                            urllib.parse.urlsplit(url)
+ 
+ class Utility_Tests(unittest.TestCase):
+     """Testcase to test the various utility functions in the urllib."""
+diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
+index f5b3487ea9..4c8e77fe39 100644
+--- a/Lib/urllib/parse.py
++++ b/Lib/urllib/parse.py
+@@ -397,9 +397,9 @@ def _checknetloc(netloc):
+     # looking for characters like \u2100 that expand to 'a/c'
+     # IDNA uses NFKC equivalence, so normalize for this check
+     import unicodedata
+-    n = netloc.rpartition('@')[2] # ignore anything to the left of '@'
+-    n = n.replace(':', '')        # ignore characters already included
+-    n = n.replace('#', '')        # but not the surrounding text
++    n = netloc.replace('@', '')   # ignore characters already included
++    n = n.replace(':', '')        # but not the surrounding text
++    n = n.replace('#', '')
+     n = n.replace('?', '')
+     netloc2 = unicodedata.normalize('NFKC', n)
+     if n == netloc2:
+-- 
+2.11.0
+
