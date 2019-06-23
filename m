From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 23:26:19 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/python: add
 upstream security fix for CVE-2019-9636
Message-ID: <20190623212544.1EBD382135@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bad3030c2e4dd35dd76ece3d5c7938ad3f73c5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes CVE-2019-9636: urlsplit does not handle NFKC normalization

https://bugs.python.org/issue36216

The fix unfortunately introduced regressions, so also apply the followup
fixes.

https://bugs.python.org/issue36742

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 58d0bc2f29fa427aa07876783dbc89e92b5e4302)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...dd-check-for-characters-in-netloc-that-no.patch | 159 +++++++++++++++++++++
 ...16-Only-print-test-messages-when-verbose-.patch |  28 ++++
 ...ixes-handling-of-pre-normalization-charac.patch |  66 +++++++++
 ...orrects-fix-to-handle-decomposition-in-us.patch |  67 +++++++++
 ...42-Fix-urlparse.urlsplit-error-message-fo.patch |  67 +++++++++
 5 files changed, 387 insertions(+)

diff --git a/package/python/0036-bpo-36216-Add-check-for-characters-in-netloc-that-no.patch b/package/python/0036-bpo-36216-Add-check-for-characters-in-netloc-that-no.patch
new file mode 100644
index 0000000000..3b61144713
--- /dev/null
+++ b/package/python/0036-bpo-36216-Add-check-for-characters-in-netloc-that-no.patch
@@ -0,0 +1,159 @@
+From e37ef41289b77e0f0bb9a6aedb0360664c55bdd5 Mon Sep 17 00:00:00 2001
+From: Steve Dower <steve.dower@microsoft.com>
+Date: Thu, 7 Mar 2019 09:08:45 -0800
+Subject: [PATCH] bpo-36216: Add check for characters in netloc that normalize
+ to separators (GH-12201)
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Doc/library/urlparse.rst                           | 20 ++++++++++++++++++
+ Lib/test/test_urlparse.py                          | 24 ++++++++++++++++++++++
+ Lib/urlparse.py                                    | 17 +++++++++++++++
+ .../2019-03-06-09-38-40.bpo-36216.6q1m4a.rst       |  3 +++
+ 4 files changed, 64 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
+
+diff --git a/Doc/library/urlparse.rst b/Doc/library/urlparse.rst
+index 22249da54f..0989c88c30 100644
+--- a/Doc/library/urlparse.rst
++++ b/Doc/library/urlparse.rst
+@@ -119,12 +119,22 @@ The :mod:`urlparse` module defines the following functions:
+    See section :ref:`urlparse-result-object` for more information on the result
+    object.
+ 
++   Characters in the :attr:`netloc` attribute that decompose under NFKC
++   normalization (as used by the IDNA encoding) into any of ``/``, ``?``,
++   ``#``, ``@``, or ``:`` will raise a :exc:`ValueError`. If the URL is
++   decomposed before parsing, or is not a Unicode string, no error will be
++   raised.
++
+    .. versionchanged:: 2.5
+       Added attributes to return value.
+ 
+    .. versionchanged:: 2.7
+       Added IPv6 URL parsing capabilities.
+ 
++   .. versionchanged:: 2.7.17
++      Characters that affect netloc parsing under NFKC normalization will
++      now raise :exc:`ValueError`.
++
+ 
+ .. function:: parse_qs(qs[, keep_blank_values[, strict_parsing[, max_num_fields]]])
+ 
+@@ -232,11 +242,21 @@ The :mod:`urlparse` module defines the following functions:
+    See section :ref:`urlparse-result-object` for more information on the result
+    object.
+ 
++   Characters in the :attr:`netloc` attribute that decompose under NFKC
++   normalization (as used by the IDNA encoding) into any of ``/``, ``?``,
++   ``#``, ``@``, or ``:`` will raise a :exc:`ValueError`. If the URL is
++   decomposed before parsing, or is not a Unicode string, no error will be
++   raised.
++
+    .. versionadded:: 2.2
+ 
+    .. versionchanged:: 2.5
+       Added attributes to return value.
+ 
++   .. versionchanged:: 2.7.17
++      Characters that affect netloc parsing under NFKC normalization will
++      now raise :exc:`ValueError`.
++
+ 
+ .. function:: urlunsplit(parts)
+ 
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
+index 4e1ded73c2..73b0228ea8 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -1,4 +1,6 @@
+ from test import test_support
++import sys
++import unicodedata
+ import unittest
+ import urlparse
+ 
+@@ -624,6 +626,28 @@ class UrlParseTestCase(unittest.TestCase):
+         self.assertEqual(urlparse.urlparse("http://www.python.org:80"),
+                 ('http','www.python.org:80','','','',''))
+ 
++    def test_urlsplit_normalization(self):
++        # Certain characters should never occur in the netloc,
++        # including under normalization.
++        # Ensure that ALL of them are detected and cause an error
++        illegal_chars = u'/:#?@'
++        hex_chars = {'{:04X}'.format(ord(c)) for c in illegal_chars}
++        denorm_chars = [
++            c for c in map(unichr, range(128, sys.maxunicode))
++            if (hex_chars & set(unicodedata.decomposition(c).split()))
++            and c not in illegal_chars
++        ]
++        # Sanity check that we found at least one such character
++        self.assertIn(u'\u2100', denorm_chars)
++        self.assertIn(u'\uFF03', denorm_chars)
++
++        for scheme in [u"http", u"https", u"ftp"]:
++            for c in denorm_chars:
++                url = u"{}://netloc{}false.netloc/path".format(scheme, c)
++                print "Checking %r" % url
++                with self.assertRaises(ValueError):
++                    urlparse.urlsplit(url)
++
+ def test_main():
+     test_support.run_unittest(UrlParseTestCase)
+ 
+diff --git a/Lib/urlparse.py b/Lib/urlparse.py
+index f7c2b032b0..54eda08651 100644
+--- a/Lib/urlparse.py
++++ b/Lib/urlparse.py
+@@ -165,6 +165,21 @@ def _splitnetloc(url, start=0):
+             delim = min(delim, wdelim)     # use earliest delim position
+     return url[start:delim], url[delim:]   # return (domain, rest)
+ 
++def _checknetloc(netloc):
++    if not netloc or not isinstance(netloc, unicode):
++        return
++    # looking for characters like \u2100 that expand to 'a/c'
++    # IDNA uses NFKC equivalence, so normalize for this check
++    import unicodedata
++    netloc2 = unicodedata.normalize('NFKC', netloc)
++    if netloc == netloc2:
++        return
++    _, _, netloc = netloc.rpartition('@') # anything to the left of '@' is okay
++    for c in '/?#@:':
++        if c in netloc2:
++            raise ValueError("netloc '" + netloc2 + "' contains invalid " +
++                             "characters under NFKC normalization")
++
+ def urlsplit(url, scheme='', allow_fragments=True):
+     """Parse a URL into 5 components:
+     <scheme>://<netloc>/<path>?<query>#<fragment>
+@@ -193,6 +208,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
+                 url, fragment = url.split('#', 1)
+             if '?' in url:
+                 url, query = url.split('?', 1)
++            _checknetloc(netloc)
+             v = SplitResult(scheme, netloc, url, query, fragment)
+             _parse_cache[key] = v
+             return v
+@@ -216,6 +232,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
+         url, fragment = url.split('#', 1)
+     if '?' in url:
+         url, query = url.split('?', 1)
++    _checknetloc(netloc)
+     v = SplitResult(scheme, netloc, url, query, fragment)
+     _parse_cache[key] = v
+     return v
+diff --git a/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
+new file mode 100644
+index 0000000000..1e1ad92c6f
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
+@@ -0,0 +1,3 @@
++Changes urlsplit() to raise ValueError when the URL contains characters that
++decompose under IDNA encoding (NFKC-normalization) into characters that
++affect how the URL is parsed.
+\ No newline at end of file
+-- 
+2.11.0
+
diff --git a/package/python/0037-3.7-bpo-36216-Only-print-test-messages-when-verbose-.patch b/package/python/0037-3.7-bpo-36216-Only-print-test-messages-when-verbose-.patch
new file mode 100644
index 0000000000..7e61fceb80
--- /dev/null
+++ b/package/python/0037-3.7-bpo-36216-Only-print-test-messages-when-verbose-.patch
@@ -0,0 +1,28 @@
+From 507bd8cde60ced74d13a1ffa883bb9b0e73c38be Mon Sep 17 00:00:00 2001
+From: Steve Dower <steve.dower@microsoft.com>
+Date: Tue, 12 Mar 2019 13:51:58 -0700
+Subject: [PATCH] [3.7] bpo-36216: Only print test messages when verbose
+ (GH-12291)
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Lib/test/test_urlparse.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
+index 73b0228ea8..1830d0b286 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -644,7 +644,8 @@ class UrlParseTestCase(unittest.TestCase):
+         for scheme in [u"http", u"https", u"ftp"]:
+             for c in denorm_chars:
+                 url = u"{}://netloc{}false.netloc/path".format(scheme, c)
+-                print "Checking %r" % url
++                if test_support.verbose:
++                    print "Checking %r" % url
+                 with self.assertRaises(ValueError):
+                     urlparse.urlsplit(url)
+ 
+-- 
+2.11.0
+
diff --git a/package/python/0038-bpo-36742-Fixes-handling-of-pre-normalization-charac.patch b/package/python/0038-bpo-36742-Fixes-handling-of-pre-normalization-charac.patch
new file mode 100644
index 0000000000..a5fadf8bb0
--- /dev/null
+++ b/package/python/0038-bpo-36742-Fixes-handling-of-pre-normalization-charac.patch
@@ -0,0 +1,66 @@
+From 98a4dcefbbc3bce5ab07e7c0830a183157250259 Mon Sep 17 00:00:00 2001
+From: Steve Dower <steve.dower@python.org>
+Date: Wed, 1 May 2019 15:00:27 +0000
+Subject: [PATCH] bpo-36742: Fixes handling of pre-normalization characters in
+ urlsplit() (GH-13017)
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Lib/test/test_urlparse.py                                     |  6 ++++++
+ Lib/urlparse.py                                               | 11 +++++++----
+ .../next/Security/2019-04-29-15-34-59.bpo-36742.QCUY0i.rst    |  1 +
+ 3 files changed, 14 insertions(+), 4 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-04-29-15-34-59.bpo-36742.QCUY0i.rst
+
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
+index 1830d0b286..6fd1071bf7 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -641,6 +641,12 @@ class UrlParseTestCase(unittest.TestCase):
+         self.assertIn(u'\u2100', denorm_chars)
+         self.assertIn(u'\uFF03', denorm_chars)
+ 
++        # bpo-36742: Verify port separators are ignored when they
++        # existed prior to decomposition
++        urlparse.urlsplit(u'http://\u30d5\u309a:80')
++        with self.assertRaises(ValueError):
++            urlparse.urlsplit(u'http://\u30d5\u309a\ufe1380')
++
+         for scheme in [u"http", u"https", u"ftp"]:
+             for c in denorm_chars:
+                 url = u"{}://netloc{}false.netloc/path".format(scheme, c)
+diff --git a/Lib/urlparse.py b/Lib/urlparse.py
+index 54eda08651..f08e0fe584 100644
+--- a/Lib/urlparse.py
++++ b/Lib/urlparse.py
+@@ -171,13 +171,16 @@ def _checknetloc(netloc):
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
diff --git a/package/python/0039-bpo-36742-Corrects-fix-to-handle-decomposition-in-us.patch b/package/python/0039-bpo-36742-Corrects-fix-to-handle-decomposition-in-us.patch
new file mode 100644
index 0000000000..c74bf73a80
--- /dev/null
+++ b/package/python/0039-bpo-36742-Corrects-fix-to-handle-decomposition-in-us.patch
@@ -0,0 +1,67 @@
+From f61599b050c621386a3fc6bc480359e2d3bb93de Mon Sep 17 00:00:00 2001
+From: Steve Dower <steve.dower@python.org>
+Date: Tue, 4 Jun 2019 09:40:16 -0700
+Subject: [PATCH] bpo-36742: Corrects fix to handle decomposition in usernames
+ (GH-13812)
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Lib/test/test_urlparse.py | 13 +++++++------
+ Lib/urlparse.py           | 12 ++++++------
+ 2 files changed, 13 insertions(+), 12 deletions(-)
+
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
+index 6fd1071bf7..857ed96d92 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -648,12 +648,13 @@ class UrlParseTestCase(unittest.TestCase):
+             urlparse.urlsplit(u'http://\u30d5\u309a\ufe1380')
+ 
+         for scheme in [u"http", u"https", u"ftp"]:
+-            for c in denorm_chars:
+-                url = u"{}://netloc{}false.netloc/path".format(scheme, c)
+-                if test_support.verbose:
+-                    print "Checking %r" % url
+-                with self.assertRaises(ValueError):
+-                    urlparse.urlsplit(url)
++            for netloc in [u"netloc{}false.netloc", u"n{}user at netloc"]:
++                for c in denorm_chars:
++                    url = u"{}://{}/path".format(scheme, netloc.format(c))
++                    if test_support.verbose:
++                        print "Checking %r" % url
++                    with self.assertRaises(ValueError):
++                        urlparse.urlsplit(url)
+ 
+ def test_main():
+     test_support.run_unittest(UrlParseTestCase)
+diff --git a/Lib/urlparse.py b/Lib/urlparse.py
+index f08e0fe584..6834f3c179 100644
+--- a/Lib/urlparse.py
++++ b/Lib/urlparse.py
+@@ -171,17 +171,17 @@ def _checknetloc(netloc):
+     # looking for characters like \u2100 that expand to 'a/c'
+     # IDNA uses NFKC equivalence, so normalize for this check
+     import unicodedata
+-    n = netloc.rpartition('@')[2] # ignore anything to the left of '@'
+-    n = n.replace(':', '')        # ignore characters already included
+-    n = n.replace('#', '')        # but not the surrounding text
+-    n = n.replace('?', '')
++    n = netloc.replace(u'@', u'') # ignore characters already included
++    n = n.replace(u':', u'')      # but not the surrounding text
++    n = n.replace(u'#', u'')
++    n = n.replace(u'?', u'')
+     netloc2 = unicodedata.normalize('NFKC', n)
+     if n == netloc2:
+         return
+     for c in '/?#@:':
+         if c in netloc2:
+-            raise ValueError("netloc '" + netloc + "' contains invalid " +
+-                             "characters under NFKC normalization")
++            raise ValueError(u"netloc '" + netloc + u"' contains invalid " +
++                             u"characters under NFKC normalization")
+ 
+ def urlsplit(url, scheme='', allow_fragments=True):
+     """Parse a URL into 5 components:
+-- 
+2.11.0
+
diff --git a/package/python/0040-2.7-bpo-36742-Fix-urlparse.urlsplit-error-message-fo.patch b/package/python/0040-2.7-bpo-36742-Fix-urlparse.urlsplit-error-message-fo.patch
new file mode 100644
index 0000000000..8bb9028267
--- /dev/null
+++ b/package/python/0040-2.7-bpo-36742-Fix-urlparse.urlsplit-error-message-fo.patch
@@ -0,0 +1,67 @@
+From 2b578479b96aa3deeeb8bac313a02b5cf3cb1aff Mon Sep 17 00:00:00 2001
+From: Victor Stinner <vstinner@redhat.com>
+Date: Tue, 11 Jun 2019 12:45:35 +0200
+Subject: [PATCH] [2.7] bpo-36742: Fix urlparse.urlsplit() error message for
+ Unicode URL (GH-13937)
+
+If urlparse.urlsplit() detects an invalid netloc according to NFKC
+normalization, the error message type is now str rather than unicode,
+and use repr() to format the URL, to prevent <exception str() failed>
+when display the error message.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Lib/test/test_urlparse.py                                        | 9 +++++++++
+ Lib/urlparse.py                                                  | 5 +++--
+ .../NEWS.d/next/Library/2019-06-10-12-02-45.bpo-36742.UEdHXJ.rst | 3 +++
+ 3 files changed, 15 insertions(+), 2 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2019-06-10-12-02-45.bpo-36742.UEdHXJ.rst
+
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
+index 857ed96d92..86c4a0595c 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -656,6 +656,15 @@ class UrlParseTestCase(unittest.TestCase):
+                     with self.assertRaises(ValueError):
+                         urlparse.urlsplit(url)
+ 
++        # check error message: invalid netloc must be formated with repr()
++        # to get an ASCII error message
++        with self.assertRaises(ValueError) as cm:
++            urlparse.urlsplit(u'http://example.com\uFF03 at bing.com')
++        self.assertEqual(str(cm.exception),
++                         "netloc u'example.com\\uff03 at bing.com' contains invalid characters "
++                         "under NFKC normalization")
++        self.assertIsInstance(cm.exception.args[0], str)
++
+ def test_main():
+     test_support.run_unittest(UrlParseTestCase)
+ 
+diff --git a/Lib/urlparse.py b/Lib/urlparse.py
+index 6834f3c179..798b467b60 100644
+--- a/Lib/urlparse.py
++++ b/Lib/urlparse.py
+@@ -180,8 +180,9 @@ def _checknetloc(netloc):
+         return
+     for c in '/?#@:':
+         if c in netloc2:
+-            raise ValueError(u"netloc '" + netloc + u"' contains invalid " +
+-                             u"characters under NFKC normalization")
++            raise ValueError("netloc %r contains invalid characters "
++                             "under NFKC normalization"
++                             % netloc)
+ 
+ def urlsplit(url, scheme='', allow_fragments=True):
+     """Parse a URL into 5 components:
+diff --git a/Misc/NEWS.d/next/Library/2019-06-10-12-02-45.bpo-36742.UEdHXJ.rst b/Misc/NEWS.d/next/Library/2019-06-10-12-02-45.bpo-36742.UEdHXJ.rst
+new file mode 100644
+index 0000000000..3ba774056f
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2019-06-10-12-02-45.bpo-36742.UEdHXJ.rst
+@@ -0,0 +1,3 @@
++:func:`urlparse.urlsplit` error message for invalid ``netloc`` according to
++NFKC normalization is now a :class:`str` string, rather than a
++:class:`unicode` string, to prevent error when displaying the error.
+-- 
+2.11.0
+
