From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 20 Oct 2019 11:15:41 +0300
Subject: [Buildroot] [PATCH 1/1] package/python: security bump to version
 2.7.17
In-Reply-To: <20191020081542.5711-1-asafka7@gmail.com>
References: <20191020081542.5711-1-asafka7@gmail.com>
Message-ID: <20191020081542.5711-3-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This release fixes CVE-2019-9740, CVE-2019-9948, CVE-2019-15903.

Adjust 0002-Fix-get_python_inc-for-cross-compilation.patch for 2.7.17.

Remove the following patches (now on upstream):
* 0035-bpo-35907-CVE-2019-9948-urllib-rejects-local_file-sc.patch
* 0036-bpo-36216-Add-check-for-characters-in-netloc-that-no.patch
* 0037-3.7-bpo-36216-Only-print-test-messages-when-verbose-.patch
* 0038-bpo-36742-Fixes-handling-of-pre-normalization-charac.patch
* 0039-bpo-36742-Corrects-fix-to-handle-decomposition-in-us.patch
* 0040-2.7-bpo-36742-Fix-urlparse.urlsplit-error-message-fo.patch
* 0041-bpo-30458-Disallow-control-chars-in-http-URLs-GH-127.patch

Full release details at:
https://github.com/python/cpython/blob/v2.7.17/Misc/NEWS.d/2.7.17rc1.rst

run-tests results:
10:30:20 TestPython2                              Starting
10:30:21 TestPython2                              Building
10:37:37 TestPython2                              Building done
10:37:47 TestPython2                              Cleaning up
.
----------------------------------------------------------------------
Ran 1 test in 448.616s

OK

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 ...get_python_inc-for-cross-compilation.patch |  20 +-
 ...19-9948-urllib-rejects-local_file-sc.patch |  59 -----
 ...eck-for-characters-in-netloc-that-no.patch | 159 -------------
 ...ly-print-test-messages-when-verbose-.patch |  28 ---
 ...handling-of-pre-normalization-charac.patch |  66 ------
 ...ts-fix-to-handle-decomposition-in-us.patch |  67 ------
 ...x-urlparse.urlsplit-error-message-fo.patch |  67 ------
 ...ow-control-chars-in-http-URLs-GH-127.patch | 216 ------------------
 package/python/python.hash                    |   6 +-
 package/python/python.mk                      |   2 +-
 10 files changed, 15 insertions(+), 675 deletions(-)
 delete mode 100644 package/python/0035-bpo-35907-CVE-2019-9948-urllib-rejects-local_file-sc.patch
 delete mode 100644 package/python/0036-bpo-36216-Add-check-for-characters-in-netloc-that-no.patch
 delete mode 100644 package/python/0037-3.7-bpo-36216-Only-print-test-messages-when-verbose-.patch
 delete mode 100644 package/python/0038-bpo-36742-Fixes-handling-of-pre-normalization-charac.patch
 delete mode 100644 package/python/0039-bpo-36742-Corrects-fix-to-handle-decomposition-in-us.patch
 delete mode 100644 package/python/0040-2.7-bpo-36742-Fix-urlparse.urlsplit-error-message-fo.patch
 delete mode 100644 package/python/0041-bpo-30458-Disallow-control-chars-in-http-URLs-GH-127.patch

diff --git a/package/python/0002-Fix-get_python_inc-for-cross-compilation.patch b/package/python/0002-Fix-get_python_inc-for-cross-compilation.patch
index b28ef2440e..1fa4e92788 100644
--- a/package/python/0002-Fix-get_python_inc-for-cross-compilation.patch
+++ b/package/python/0002-Fix-get_python_inc-for-cross-compilation.patch
@@ -24,23 +24,25 @@ This patch allows to fix the
 incorrectly added to the header paths.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Asaf: update for 2.7.17]
+Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
 ---
  Lib/distutils/sysconfig.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index de7da1d..d72b6e5 100644
+index 1a4b792644..14c7d81c48 100644
 --- a/Lib/distutils/sysconfig.py
 +++ b/Lib/distutils/sysconfig.py
-@@ -79,7 +79,7 @@ def get_python_inc(plat_specific=0, prefix=None):
- 
+@@ -85,7 +85,7 @@ def get_python_inc(plat_specific=0, prefix=None):
      if os.name == "posix":
          if python_build:
--            buildir = os.path.dirname(sys.executable)
-+            buildir = project_base
-             if plat_specific:
-                 # python.h is located in the buildir
-                 inc_dir = buildir
+             if sys.executable:
+-                buildir = os.path.dirname(sys.executable)
++                buildir = project_base
+             else:
+                 # sys.executable can be empty if argv[0] has been changed
+                 # and Python is unable to retrieve the real program name
 -- 
-2.7.4
+2.20.1
 
diff --git a/package/python/0035-bpo-35907-CVE-2019-9948-urllib-rejects-local_file-sc.patch b/package/python/0035-bpo-35907-CVE-2019-9948-urllib-rejects-local_file-sc.patch
deleted file mode 100644
index 5ca1433465..0000000000
--- a/package/python/0035-bpo-35907-CVE-2019-9948-urllib-rejects-local_file-sc.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From b15bde8058e821b383d81fcae68b335a752083ca Mon Sep 17 00:00:00 2001
-From: SH <push0ebp@gmail.com>
-Date: Wed, 22 May 2019 06:12:23 +0900
-Subject: [PATCH] bpo-35907, CVE-2019-9948: urllib rejects local_file:// scheme
-  (GH-11842)
-
- CVE-2019-9948: Avoid file reading as disallowing the unnecessary URL scheme in urllib.urlopen().
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Lib/test/test_urllib.py                                           | 7 +++++++
- Lib/urllib.py                                                     | 4 +++-
- Misc/NEWS.d/next/Library/2019-02-13-17-21-10.bpo-35907.ckk2zg.rst | 1 +
- 3 files changed, 11 insertions(+), 1 deletion(-)
- create mode 100644 Misc/NEWS.d/next/Library/2019-02-13-17-21-10.bpo-35907.ckk2zg.rst
-
-diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
-index d7778d4194..ae1f6c0b29 100644
---- a/Lib/test/test_urllib.py
-+++ b/Lib/test/test_urllib.py
-@@ -1048,6 +1048,13 @@ class URLopener_Tests(unittest.TestCase):
-             "spam://c:|windows%/:=&?~#+!$,;'@()*[]|/path/"),
-             "//c:|windows%/:=&?~#+!$,;'@()*[]|/path/")
- 
-+    def test_local_file_open(self):
-+        class DummyURLopener(urllib.URLopener):
-+            def open_local_file(self, url):
-+                return url
-+        for url in ('local_file://example', 'local-file://example'):
-+            self.assertRaises(IOError, DummyURLopener().open, url)
-+            self.assertRaises(IOError, urllib.urlopen, url)
- 
- # Just commented them out.
- # Can't really tell why keep failing in windows and sparc.
-diff --git a/Lib/urllib.py b/Lib/urllib.py
-index d85504a5cb..156879dd0a 100644
---- a/Lib/urllib.py
-+++ b/Lib/urllib.py
-@@ -203,7 +203,9 @@ class URLopener:
-         name = 'open_' + urltype
-         self.type = urltype
-         name = name.replace('-', '_')
--        if not hasattr(self, name):
-+
-+        # bpo-35907: disallow the file reading with the type not allowed
-+        if not hasattr(self, name) or name == 'open_local_file':
-             if proxy:
-                 return self.open_unknown_proxy(proxy, fullurl, data)
-             else:
-diff --git a/Misc/NEWS.d/next/Library/2019-02-13-17-21-10.bpo-35907.ckk2zg.rst b/Misc/NEWS.d/next/Library/2019-02-13-17-21-10.bpo-35907.ckk2zg.rst
-new file mode 100644
-index 0000000000..bb187d8d65
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2019-02-13-17-21-10.bpo-35907.ckk2zg.rst
-@@ -0,0 +1 @@
-+CVE-2019-9948: Avoid file reading as disallowing the unnecessary URL scheme in urllib.urlopen
--- 
-2.11.0
-
diff --git a/package/python/0036-bpo-36216-Add-check-for-characters-in-netloc-that-no.patch b/package/python/0036-bpo-36216-Add-check-for-characters-in-netloc-that-no.patch
deleted file mode 100644
index 3b61144713..0000000000
--- a/package/python/0036-bpo-36216-Add-check-for-characters-in-netloc-that-no.patch
+++ /dev/null
@@ -1,159 +0,0 @@
-From e37ef41289b77e0f0bb9a6aedb0360664c55bdd5 Mon Sep 17 00:00:00 2001
-From: Steve Dower <steve.dower@microsoft.com>
-Date: Thu, 7 Mar 2019 09:08:45 -0800
-Subject: [PATCH] bpo-36216: Add check for characters in netloc that normalize
- to separators (GH-12201)
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Doc/library/urlparse.rst                           | 20 ++++++++++++++++++
- Lib/test/test_urlparse.py                          | 24 ++++++++++++++++++++++
- Lib/urlparse.py                                    | 17 +++++++++++++++
- .../2019-03-06-09-38-40.bpo-36216.6q1m4a.rst       |  3 +++
- 4 files changed, 64 insertions(+)
- create mode 100644 Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
-
-diff --git a/Doc/library/urlparse.rst b/Doc/library/urlparse.rst
-index 22249da54f..0989c88c30 100644
---- a/Doc/library/urlparse.rst
-+++ b/Doc/library/urlparse.rst
-@@ -119,12 +119,22 @@ The :mod:`urlparse` module defines the following functions:
-    See section :ref:`urlparse-result-object` for more information on the result
-    object.
- 
-+   Characters in the :attr:`netloc` attribute that decompose under NFKC
-+   normalization (as used by the IDNA encoding) into any of ``/``, ``?``,
-+   ``#``, ``@``, or ``:`` will raise a :exc:`ValueError`. If the URL is
-+   decomposed before parsing, or is not a Unicode string, no error will be
-+   raised.
-+
-    .. versionchanged:: 2.5
-       Added attributes to return value.
- 
-    .. versionchanged:: 2.7
-       Added IPv6 URL parsing capabilities.
- 
-+   .. versionchanged:: 2.7.17
-+      Characters that affect netloc parsing under NFKC normalization will
-+      now raise :exc:`ValueError`.
-+
- 
- .. function:: parse_qs(qs[, keep_blank_values[, strict_parsing[, max_num_fields]]])
- 
-@@ -232,11 +242,21 @@ The :mod:`urlparse` module defines the following functions:
-    See section :ref:`urlparse-result-object` for more information on the result
-    object.
- 
-+   Characters in the :attr:`netloc` attribute that decompose under NFKC
-+   normalization (as used by the IDNA encoding) into any of ``/``, ``?``,
-+   ``#``, ``@``, or ``:`` will raise a :exc:`ValueError`. If the URL is
-+   decomposed before parsing, or is not a Unicode string, no error will be
-+   raised.
-+
-    .. versionadded:: 2.2
- 
-    .. versionchanged:: 2.5
-       Added attributes to return value.
- 
-+   .. versionchanged:: 2.7.17
-+      Characters that affect netloc parsing under NFKC normalization will
-+      now raise :exc:`ValueError`.
-+
- 
- .. function:: urlunsplit(parts)
- 
-diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
-index 4e1ded73c2..73b0228ea8 100644
---- a/Lib/test/test_urlparse.py
-+++ b/Lib/test/test_urlparse.py
-@@ -1,4 +1,6 @@
- from test import test_support
-+import sys
-+import unicodedata
- import unittest
- import urlparse
- 
-@@ -624,6 +626,28 @@ class UrlParseTestCase(unittest.TestCase):
-         self.assertEqual(urlparse.urlparse("http://www.python.org:80"),
-                 ('http','www.python.org:80','','','',''))
- 
-+    def test_urlsplit_normalization(self):
-+        # Certain characters should never occur in the netloc,
-+        # including under normalization.
-+        # Ensure that ALL of them are detected and cause an error
-+        illegal_chars = u'/:#?@'
-+        hex_chars = {'{:04X}'.format(ord(c)) for c in illegal_chars}
-+        denorm_chars = [
-+            c for c in map(unichr, range(128, sys.maxunicode))
-+            if (hex_chars & set(unicodedata.decomposition(c).split()))
-+            and c not in illegal_chars
-+        ]
-+        # Sanity check that we found at least one such character
-+        self.assertIn(u'\u2100', denorm_chars)
-+        self.assertIn(u'\uFF03', denorm_chars)
-+
-+        for scheme in [u"http", u"https", u"ftp"]:
-+            for c in denorm_chars:
-+                url = u"{}://netloc{}false.netloc/path".format(scheme, c)
-+                print "Checking %r" % url
-+                with self.assertRaises(ValueError):
-+                    urlparse.urlsplit(url)
-+
- def test_main():
-     test_support.run_unittest(UrlParseTestCase)
- 
-diff --git a/Lib/urlparse.py b/Lib/urlparse.py
-index f7c2b032b0..54eda08651 100644
---- a/Lib/urlparse.py
-+++ b/Lib/urlparse.py
-@@ -165,6 +165,21 @@ def _splitnetloc(url, start=0):
-             delim = min(delim, wdelim)     # use earliest delim position
-     return url[start:delim], url[delim:]   # return (domain, rest)
- 
-+def _checknetloc(netloc):
-+    if not netloc or not isinstance(netloc, unicode):
-+        return
-+    # looking for characters like \u2100 that expand to 'a/c'
-+    # IDNA uses NFKC equivalence, so normalize for this check
-+    import unicodedata
-+    netloc2 = unicodedata.normalize('NFKC', netloc)
-+    if netloc == netloc2:
-+        return
-+    _, _, netloc = netloc.rpartition('@') # anything to the left of '@' is okay
-+    for c in '/?#@:':
-+        if c in netloc2:
-+            raise ValueError("netloc '" + netloc2 + "' contains invalid " +
-+                             "characters under NFKC normalization")
-+
- def urlsplit(url, scheme='', allow_fragments=True):
-     """Parse a URL into 5 components:
-     <scheme>://<netloc>/<path>?<query>#<fragment>
-@@ -193,6 +208,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
-                 url, fragment = url.split('#', 1)
-             if '?' in url:
-                 url, query = url.split('?', 1)
-+            _checknetloc(netloc)
-             v = SplitResult(scheme, netloc, url, query, fragment)
-             _parse_cache[key] = v
-             return v
-@@ -216,6 +232,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
-         url, fragment = url.split('#', 1)
-     if '?' in url:
-         url, query = url.split('?', 1)
-+    _checknetloc(netloc)
-     v = SplitResult(scheme, netloc, url, query, fragment)
-     _parse_cache[key] = v
-     return v
-diff --git a/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
-new file mode 100644
-index 0000000000..1e1ad92c6f
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
-@@ -0,0 +1,3 @@
-+Changes urlsplit() to raise ValueError when the URL contains characters that
-+decompose under IDNA encoding (NFKC-normalization) into characters that
-+affect how the URL is parsed.
-\ No newline at end of file
--- 
-2.11.0
-
diff --git a/package/python/0037-3.7-bpo-36216-Only-print-test-messages-when-verbose-.patch b/package/python/0037-3.7-bpo-36216-Only-print-test-messages-when-verbose-.patch
deleted file mode 100644
index 7e61fceb80..0000000000
--- a/package/python/0037-3.7-bpo-36216-Only-print-test-messages-when-verbose-.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 507bd8cde60ced74d13a1ffa883bb9b0e73c38be Mon Sep 17 00:00:00 2001
-From: Steve Dower <steve.dower@microsoft.com>
-Date: Tue, 12 Mar 2019 13:51:58 -0700
-Subject: [PATCH] [3.7] bpo-36216: Only print test messages when verbose
- (GH-12291)
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Lib/test/test_urlparse.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
-index 73b0228ea8..1830d0b286 100644
---- a/Lib/test/test_urlparse.py
-+++ b/Lib/test/test_urlparse.py
-@@ -644,7 +644,8 @@ class UrlParseTestCase(unittest.TestCase):
-         for scheme in [u"http", u"https", u"ftp"]:
-             for c in denorm_chars:
-                 url = u"{}://netloc{}false.netloc/path".format(scheme, c)
--                print "Checking %r" % url
-+                if test_support.verbose:
-+                    print "Checking %r" % url
-                 with self.assertRaises(ValueError):
-                     urlparse.urlsplit(url)
- 
--- 
-2.11.0
-
diff --git a/package/python/0038-bpo-36742-Fixes-handling-of-pre-normalization-charac.patch b/package/python/0038-bpo-36742-Fixes-handling-of-pre-normalization-charac.patch
deleted file mode 100644
index a5fadf8bb0..0000000000
--- a/package/python/0038-bpo-36742-Fixes-handling-of-pre-normalization-charac.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 98a4dcefbbc3bce5ab07e7c0830a183157250259 Mon Sep 17 00:00:00 2001
-From: Steve Dower <steve.dower@python.org>
-Date: Wed, 1 May 2019 15:00:27 +0000
-Subject: [PATCH] bpo-36742: Fixes handling of pre-normalization characters in
- urlsplit() (GH-13017)
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Lib/test/test_urlparse.py                                     |  6 ++++++
- Lib/urlparse.py                                               | 11 +++++++----
- .../next/Security/2019-04-29-15-34-59.bpo-36742.QCUY0i.rst    |  1 +
- 3 files changed, 14 insertions(+), 4 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2019-04-29-15-34-59.bpo-36742.QCUY0i.rst
-
-diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
-index 1830d0b286..6fd1071bf7 100644
---- a/Lib/test/test_urlparse.py
-+++ b/Lib/test/test_urlparse.py
-@@ -641,6 +641,12 @@ class UrlParseTestCase(unittest.TestCase):
-         self.assertIn(u'\u2100', denorm_chars)
-         self.assertIn(u'\uFF03', denorm_chars)
- 
-+        # bpo-36742: Verify port separators are ignored when they
-+        # existed prior to decomposition
-+        urlparse.urlsplit(u'http://\u30d5\u309a:80')
-+        with self.assertRaises(ValueError):
-+            urlparse.urlsplit(u'http://\u30d5\u309a\ufe1380')
-+
-         for scheme in [u"http", u"https", u"ftp"]:
-             for c in denorm_chars:
-                 url = u"{}://netloc{}false.netloc/path".format(scheme, c)
-diff --git a/Lib/urlparse.py b/Lib/urlparse.py
-index 54eda08651..f08e0fe584 100644
---- a/Lib/urlparse.py
-+++ b/Lib/urlparse.py
-@@ -171,13 +171,16 @@ def _checknetloc(netloc):
-     # looking for characters like \u2100 that expand to 'a/c'
-     # IDNA uses NFKC equivalence, so normalize for this check
-     import unicodedata
--    netloc2 = unicodedata.normalize('NFKC', netloc)
--    if netloc == netloc2:
-+    n = netloc.rpartition('@')[2] # ignore anything to the left of '@'
-+    n = n.replace(':', '')        # ignore characters already included
-+    n = n.replace('#', '')        # but not the surrounding text
-+    n = n.replace('?', '')
-+    netloc2 = unicodedata.normalize('NFKC', n)
-+    if n == netloc2:
-         return
--    _, _, netloc = netloc.rpartition('@') # anything to the left of '@' is okay
-     for c in '/?#@:':
-         if c in netloc2:
--            raise ValueError("netloc '" + netloc2 + "' contains invalid " +
-+            raise ValueError("netloc '" + netloc + "' contains invalid " +
-                              "characters under NFKC normalization")
- 
- def urlsplit(url, scheme='', allow_fragments=True):
-diff --git a/Misc/NEWS.d/next/Security/2019-04-29-15-34-59.bpo-36742.QCUY0i.rst b/Misc/NEWS.d/next/Security/2019-04-29-15-34-59.bpo-36742.QCUY0i.rst
-new file mode 100644
-index 0000000000..d729ed2f3c
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2019-04-29-15-34-59.bpo-36742.QCUY0i.rst
-@@ -0,0 +1 @@
-+Fixes mishandling of pre-normalization characters in urlsplit().
--- 
-2.11.0
-
diff --git a/package/python/0039-bpo-36742-Corrects-fix-to-handle-decomposition-in-us.patch b/package/python/0039-bpo-36742-Corrects-fix-to-handle-decomposition-in-us.patch
deleted file mode 100644
index c74bf73a80..0000000000
--- a/package/python/0039-bpo-36742-Corrects-fix-to-handle-decomposition-in-us.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From f61599b050c621386a3fc6bc480359e2d3bb93de Mon Sep 17 00:00:00 2001
-From: Steve Dower <steve.dower@python.org>
-Date: Tue, 4 Jun 2019 09:40:16 -0700
-Subject: [PATCH] bpo-36742: Corrects fix to handle decomposition in usernames
- (GH-13812)
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Lib/test/test_urlparse.py | 13 +++++++------
- Lib/urlparse.py           | 12 ++++++------
- 2 files changed, 13 insertions(+), 12 deletions(-)
-
-diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
-index 6fd1071bf7..857ed96d92 100644
---- a/Lib/test/test_urlparse.py
-+++ b/Lib/test/test_urlparse.py
-@@ -648,12 +648,13 @@ class UrlParseTestCase(unittest.TestCase):
-             urlparse.urlsplit(u'http://\u30d5\u309a\ufe1380')
- 
-         for scheme in [u"http", u"https", u"ftp"]:
--            for c in denorm_chars:
--                url = u"{}://netloc{}false.netloc/path".format(scheme, c)
--                if test_support.verbose:
--                    print "Checking %r" % url
--                with self.assertRaises(ValueError):
--                    urlparse.urlsplit(url)
-+            for netloc in [u"netloc{}false.netloc", u"n{}user at netloc"]:
-+                for c in denorm_chars:
-+                    url = u"{}://{}/path".format(scheme, netloc.format(c))
-+                    if test_support.verbose:
-+                        print "Checking %r" % url
-+                    with self.assertRaises(ValueError):
-+                        urlparse.urlsplit(url)
- 
- def test_main():
-     test_support.run_unittest(UrlParseTestCase)
-diff --git a/Lib/urlparse.py b/Lib/urlparse.py
-index f08e0fe584..6834f3c179 100644
---- a/Lib/urlparse.py
-+++ b/Lib/urlparse.py
-@@ -171,17 +171,17 @@ def _checknetloc(netloc):
-     # looking for characters like \u2100 that expand to 'a/c'
-     # IDNA uses NFKC equivalence, so normalize for this check
-     import unicodedata
--    n = netloc.rpartition('@')[2] # ignore anything to the left of '@'
--    n = n.replace(':', '')        # ignore characters already included
--    n = n.replace('#', '')        # but not the surrounding text
--    n = n.replace('?', '')
-+    n = netloc.replace(u'@', u'') # ignore characters already included
-+    n = n.replace(u':', u'')      # but not the surrounding text
-+    n = n.replace(u'#', u'')
-+    n = n.replace(u'?', u'')
-     netloc2 = unicodedata.normalize('NFKC', n)
-     if n == netloc2:
-         return
-     for c in '/?#@:':
-         if c in netloc2:
--            raise ValueError("netloc '" + netloc + "' contains invalid " +
--                             "characters under NFKC normalization")
-+            raise ValueError(u"netloc '" + netloc + u"' contains invalid " +
-+                             u"characters under NFKC normalization")
- 
- def urlsplit(url, scheme='', allow_fragments=True):
-     """Parse a URL into 5 components:
--- 
-2.11.0
-
diff --git a/package/python/0040-2.7-bpo-36742-Fix-urlparse.urlsplit-error-message-fo.patch b/package/python/0040-2.7-bpo-36742-Fix-urlparse.urlsplit-error-message-fo.patch
deleted file mode 100644
index 8bb9028267..0000000000
--- a/package/python/0040-2.7-bpo-36742-Fix-urlparse.urlsplit-error-message-fo.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 2b578479b96aa3deeeb8bac313a02b5cf3cb1aff Mon Sep 17 00:00:00 2001
-From: Victor Stinner <vstinner@redhat.com>
-Date: Tue, 11 Jun 2019 12:45:35 +0200
-Subject: [PATCH] [2.7] bpo-36742: Fix urlparse.urlsplit() error message for
- Unicode URL (GH-13937)
-
-If urlparse.urlsplit() detects an invalid netloc according to NFKC
-normalization, the error message type is now str rather than unicode,
-and use repr() to format the URL, to prevent <exception str() failed>
-when display the error message.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Lib/test/test_urlparse.py                                        | 9 +++++++++
- Lib/urlparse.py                                                  | 5 +++--
- .../NEWS.d/next/Library/2019-06-10-12-02-45.bpo-36742.UEdHXJ.rst | 3 +++
- 3 files changed, 15 insertions(+), 2 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Library/2019-06-10-12-02-45.bpo-36742.UEdHXJ.rst
-
-diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
-index 857ed96d92..86c4a0595c 100644
---- a/Lib/test/test_urlparse.py
-+++ b/Lib/test/test_urlparse.py
-@@ -656,6 +656,15 @@ class UrlParseTestCase(unittest.TestCase):
-                     with self.assertRaises(ValueError):
-                         urlparse.urlsplit(url)
- 
-+        # check error message: invalid netloc must be formated with repr()
-+        # to get an ASCII error message
-+        with self.assertRaises(ValueError) as cm:
-+            urlparse.urlsplit(u'http://example.com\uFF03 at bing.com')
-+        self.assertEqual(str(cm.exception),
-+                         "netloc u'example.com\\uff03 at bing.com' contains invalid characters "
-+                         "under NFKC normalization")
-+        self.assertIsInstance(cm.exception.args[0], str)
-+
- def test_main():
-     test_support.run_unittest(UrlParseTestCase)
- 
-diff --git a/Lib/urlparse.py b/Lib/urlparse.py
-index 6834f3c179..798b467b60 100644
---- a/Lib/urlparse.py
-+++ b/Lib/urlparse.py
-@@ -180,8 +180,9 @@ def _checknetloc(netloc):
-         return
-     for c in '/?#@:':
-         if c in netloc2:
--            raise ValueError(u"netloc '" + netloc + u"' contains invalid " +
--                             u"characters under NFKC normalization")
-+            raise ValueError("netloc %r contains invalid characters "
-+                             "under NFKC normalization"
-+                             % netloc)
- 
- def urlsplit(url, scheme='', allow_fragments=True):
-     """Parse a URL into 5 components:
-diff --git a/Misc/NEWS.d/next/Library/2019-06-10-12-02-45.bpo-36742.UEdHXJ.rst b/Misc/NEWS.d/next/Library/2019-06-10-12-02-45.bpo-36742.UEdHXJ.rst
-new file mode 100644
-index 0000000000..3ba774056f
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2019-06-10-12-02-45.bpo-36742.UEdHXJ.rst
-@@ -0,0 +1,3 @@
-+:func:`urlparse.urlsplit` error message for invalid ``netloc`` according to
-+NFKC normalization is now a :class:`str` string, rather than a
-+:class:`unicode` string, to prevent error when displaying the error.
--- 
-2.11.0
-
diff --git a/package/python/0041-bpo-30458-Disallow-control-chars-in-http-URLs-GH-127.patch b/package/python/0041-bpo-30458-Disallow-control-chars-in-http-URLs-GH-127.patch
deleted file mode 100644
index 587f9a6406..0000000000
--- a/package/python/0041-bpo-30458-Disallow-control-chars-in-http-URLs-GH-127.patch
+++ /dev/null
@@ -1,216 +0,0 @@
-From bb8071a4cae5ab3fe321481dd3d73662ffb26052 Mon Sep 17 00:00:00 2001
-From: Victor Stinner <victor.stinner@gmail.com>
-Date: Tue, 21 May 2019 15:12:33 +0200
-Subject: [PATCH] bpo-30458: Disallow control chars in http URLs (GH-12755)
- (GH-13154) (GH-13315)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Disallow control chars in http URLs in urllib2.urlopen.  This
-addresses a potential security problem for applications that do not
-sanity check their URLs where http request headers could be injected.
-
-Disable https related urllib tests on a build without ssl (GH-13032)
-These tests require an SSL enabled build. Skip these tests when
-python is built without SSL to fix test failures.
-
-Use httplib.InvalidURL instead of ValueError as the new error case's
-exception. (GH-13044)
-
-Backport Co-Authored-By: Miro Hron?ok <miro@hroncok.cz>
-
-(cherry picked from commit 7e200e0763f5b71c199aaf98bd5588f291585619)
-
-Notes on backport to Python 2.7:
-
-* test_urllib tests urllib.urlopen() which quotes the URL and so is
-  not vulerable to HTTP Header Injection.
-* Add tests to test_urllib2 on urllib2.urlopen().
-* Reject non-ASCII characters: range 0x80-0xff.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Lib/httplib.py                                     | 16 +++++++
- Lib/test/test_urllib.py                            | 25 +++++++++++
- Lib/test/test_urllib2.py                           | 51 +++++++++++++++++++++-
- Lib/test/test_xmlrpc.py                            |  8 +++-
- .../2019-04-10-08-53-30.bpo-30458.51E-DA.rst       |  1 +
- 5 files changed, 99 insertions(+), 2 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
-
-diff --git a/Lib/httplib.py b/Lib/httplib.py
-index 60a8fb4e35..1b41c346e0 100644
---- a/Lib/httplib.py
-+++ b/Lib/httplib.py
-@@ -247,6 +247,16 @@ _MAXHEADERS = 100
- _is_legal_header_name = re.compile(r'\A[^:\s][^:\r\n]*\Z').match
- _is_illegal_header_value = re.compile(r'\n(?![ \t])|\r(?![ \t\n])').search
- 
-+# These characters are not allowed within HTTP URL paths.
-+#  See https://tools.ietf.org/html/rfc3986#section-3.3 and the
-+#  https://tools.ietf.org/html/rfc3986#appendix-A pchar definition.
-+# Prevents CVE-2019-9740.  Includes control characters such as \r\n.
-+# Restrict non-ASCII characters above \x7f (0x80-0xff).
-+_contains_disallowed_url_pchar_re = re.compile('[\x00-\x20\x7f-\xff]')
-+# Arguably only these _should_ allowed:
-+#  _is_allowed_url_pchars_re = re.compile(r"^[/!$&'()*+,;=:@%a-zA-Z0-9._~-]+$")
-+# We are more lenient for assumed real world compatibility purposes.
-+
- # We always set the Content-Length header for these methods because some
- # servers will otherwise respond with a 411
- _METHODS_EXPECTING_BODY = {'PATCH', 'POST', 'PUT'}
-@@ -927,6 +937,12 @@ class HTTPConnection:
-         self._method = method
-         if not url:
-             url = '/'
-+        # Prevent CVE-2019-9740.
-+        match = _contains_disallowed_url_pchar_re.search(url)
-+        if match:
-+            raise InvalidURL("URL can't contain control characters. %r "
-+                             "(found at least %r)"
-+                             % (url, match.group()))
-         hdr = '%s %s %s' % (method, url, self._http_vsn_str)
- 
-         self._output(hdr)
-diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
-index 1ce9201c06..d7778d4194 100644
---- a/Lib/test/test_urllib.py
-+++ b/Lib/test/test_urllib.py
-@@ -257,6 +257,31 @@ class urlopen_HttpTests(unittest.TestCase, FakeHTTPMixin):
-         finally:
-             self.unfakehttp()
- 
-+    def test_url_with_control_char_rejected(self):
-+        for char_no in range(0, 0x21) + range(0x7f, 0x100):
-+            char = chr(char_no)
-+            schemeless_url = "//localhost:7777/test%s/" % char
-+            self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
-+            try:
-+                # urllib quotes the URL so there is no injection.
-+                resp = urllib.urlopen("http:" + schemeless_url)
-+                self.assertNotIn(char, resp.geturl())
-+            finally:
-+                self.unfakehttp()
-+
-+    def test_url_with_newline_header_injection_rejected(self):
-+        self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
-+        host = "localhost:7777?a=1 HTTP/1.1\r\nX-injected: header\r\nTEST: 123"
-+        schemeless_url = "//" + host + ":8080/test/?test=a"
-+        try:
-+            # urllib quotes the URL so there is no injection.
-+            resp = urllib.urlopen("http:" + schemeless_url)
-+            self.assertNotIn(' ', resp.geturl())
-+            self.assertNotIn('\r', resp.geturl())
-+            self.assertNotIn('\n', resp.geturl())
-+        finally:
-+            self.unfakehttp()
-+
-     def test_read_bogus(self):
-         # urlopen() should raise IOError for many error codes.
-         self.fakehttp('''HTTP/1.1 401 Authentication Required
-diff --git a/Lib/test/test_urllib2.py b/Lib/test/test_urllib2.py
-index 6d24d5ddf8..9531818e16 100644
---- a/Lib/test/test_urllib2.py
-+++ b/Lib/test/test_urllib2.py
-@@ -15,6 +15,9 @@ try:
- except ImportError:
-     ssl = None
- 
-+from test.test_urllib import FakeHTTPMixin
-+
-+
- # XXX
- # Request
- # CacheFTPHandler (hard to write)
-@@ -1262,7 +1265,7 @@ class HandlerTests(unittest.TestCase):
-         self.assertEqual(len(http_handler.requests), 1)
-         self.assertFalse(http_handler.requests[0].has_header(auth_header))
- 
--class MiscTests(unittest.TestCase):
-+class MiscTests(unittest.TestCase, FakeHTTPMixin):
- 
-     def test_build_opener(self):
-         class MyHTTPHandler(urllib2.HTTPHandler): pass
-@@ -1317,6 +1320,52 @@ class MiscTests(unittest.TestCase):
-             "Unsupported digest authentication algorithm 'invalid'"
-         )
- 
-+    @unittest.skipUnless(ssl, "ssl module required")
-+    def test_url_with_control_char_rejected(self):
-+        for char_no in range(0, 0x21) + range(0x7f, 0x100):
-+            char = chr(char_no)
-+            schemeless_url = "//localhost:7777/test%s/" % char
-+            self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
-+            try:
-+                # We explicitly test urllib.request.urlopen() instead of the top
-+                # level 'def urlopen()' function defined in this... (quite ugly)
-+                # test suite.  They use different url opening codepaths.  Plain
-+                # urlopen uses FancyURLOpener which goes via a codepath that
-+                # calls urllib.parse.quote() on the URL which makes all of the
-+                # above attempts at injection within the url _path_ safe.
-+                escaped_char_repr = repr(char).replace('\\', r'\\')
-+                InvalidURL = httplib.InvalidURL
-+                with self.assertRaisesRegexp(
-+                    InvalidURL, "contain control.*" + escaped_char_repr):
-+                    urllib2.urlopen("http:" + schemeless_url)
-+                with self.assertRaisesRegexp(
-+                    InvalidURL, "contain control.*" + escaped_char_repr):
-+                    urllib2.urlopen("https:" + schemeless_url)
-+            finally:
-+                self.unfakehttp()
-+
-+    @unittest.skipUnless(ssl, "ssl module required")
-+    def test_url_with_newline_header_injection_rejected(self):
-+        self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
-+        host = "localhost:7777?a=1 HTTP/1.1\r\nX-injected: header\r\nTEST: 123"
-+        schemeless_url = "//" + host + ":8080/test/?test=a"
-+        try:
-+            # We explicitly test urllib2.urlopen() instead of the top
-+            # level 'def urlopen()' function defined in this... (quite ugly)
-+            # test suite.  They use different url opening codepaths.  Plain
-+            # urlopen uses FancyURLOpener which goes via a codepath that
-+            # calls urllib.parse.quote() on the URL which makes all of the
-+            # above attempts at injection within the url _path_ safe.
-+            InvalidURL = httplib.InvalidURL
-+            with self.assertRaisesRegexp(
-+                InvalidURL, r"contain control.*\\r.*(found at least . .)"):
-+                urllib2.urlopen("http:" + schemeless_url)
-+            with self.assertRaisesRegexp(InvalidURL, r"contain control.*\\n"):
-+                urllib2.urlopen("https:" + schemeless_url)
-+        finally:
-+            self.unfakehttp()
-+
-+
- 
- class RequestTests(unittest.TestCase):
- 
-diff --git a/Lib/test/test_xmlrpc.py b/Lib/test/test_xmlrpc.py
-index 36b3be67fd..90ccb30716 100644
---- a/Lib/test/test_xmlrpc.py
-+++ b/Lib/test/test_xmlrpc.py
-@@ -659,7 +659,13 @@ class SimpleServerTestCase(BaseServerTestCase):
-     def test_partial_post(self):
-         # Check that a partial POST doesn't make the server loop: issue #14001.
-         conn = httplib.HTTPConnection(ADDR, PORT)
--        conn.request('POST', '/RPC2 HTTP/1.0\r\nContent-Length: 100\r\n\r\nbye')
-+        conn.send('POST /RPC2 HTTP/1.0\r\n'
-+                  'Content-Length: 100\r\n\r\n'
-+                  'bye HTTP/1.1\r\n'
-+                  'Host: %s:%s\r\n'
-+                  'Accept-Encoding: identity\r\n'
-+                  'Content-Length: 0\r\n\r\n'
-+                  % (ADDR, PORT))
-         conn.close()
- 
- class SimpleServerEncodingTestCase(BaseServerTestCase):
-diff --git a/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst b/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
-new file mode 100644
-index 0000000000..47cb899df1
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
-@@ -0,0 +1 @@
-+Address CVE-2019-9740 by disallowing URL paths with embedded whitespace or control characters through into the underlying http client request.  Such potentially malicious header injection URLs now cause an httplib.InvalidURL exception to be raised.
--- 
-2.11.0
-
diff --git a/package/python/python.hash b/package/python/python.hash
index 52b9984b0c..aa809b9a61 100644
--- a/package/python/python.hash
+++ b/package/python/python.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-2716/
-md5 30157d85a2c0479c09ea2cbe61f2aaf5 Python-2.7.16.tar.xz
+# From https://www.python.org/downloads/release/python-2717/
+md5 b3b6d2c92f42a60667814358ab9f0cfd Python-2.7.17.tar.xz
 # Locally calculated
-sha256 f222ef602647eecb6853681156d32de4450a2c39f4de93bd5b20235f2e660ed7  Python-2.7.16.tar.xz
+sha256 4d43f033cdbd0aa7b7023c81b0e986fd11e653b5248dac9144d508f11812ba41  Python-2.7.17.tar.xz
 sha256 a77d71d6be6f9032e6b6e5d2cf6da68f9eeab9036edfbc043633c8979cd5e82c  LICENSE
diff --git a/package/python/python.mk b/package/python/python.mk
index d1e70a015a..4b82cdcce3 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_VERSION_MAJOR = 2.7
-PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).16
+PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).17
 PYTHON_SOURCE = Python-$(PYTHON_VERSION).tar.xz
 PYTHON_SITE = https://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_LICENSE = Python-2.0, others
-- 
2.20.1
