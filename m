From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 14:15:37 +0200
Subject: [Buildroot] [git commit] python-twisted: bump to version 18.7.0
Message-ID: <20181004121647.E73768C609@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27beaf4b6d7fbfb63ec8c4bf24dfb4bf82f83686
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license hash.

Add a patch to fit python3.7 syntax ("async" is now a keyword).
The patch was already applied on upstream, but only after the last tag
was created.

Fixes:
http://autobuild.buildroot.org/results/704/7043ccfac86439406480649b3ead4882112d36e2/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-syntax-for-python3.7.patch            | 160 +++++++++++++++++++++
 package/python-twisted/Config.in                   |   2 +
 package/python-twisted/python-twisted.hash         |   8 +-
 package/python-twisted/python-twisted.mk           |   4 +-
 4 files changed, 169 insertions(+), 5 deletions(-)

diff --git a/package/python-twisted/0001-Fix-syntax-for-python3.7.patch b/package/python-twisted/0001-Fix-syntax-for-python3.7.patch
new file mode 100644
index 0000000000..a55695c764
--- /dev/null
+++ b/package/python-twisted/0001-Fix-syntax-for-python3.7.patch
@@ -0,0 +1,160 @@
+From ef2bd5d0c0ca66aae16bf1344dfb18d52a6f5c74 Mon Sep 17 00:00:00 2001
+From: Asaf Kahlon <asafka7@gmail.com>
+Date: Wed, 26 Sep 2018 17:47:02 +0300
+Subject: [PATCH 1/1] Fix syntax for python3.7
+
+Based on upstream patch (dcaf946217b4ea1684e98a9ebc4f9925d76f3108)
+to solve python3.7 syntax error with "async" keyword.
+
+Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
+---
+ src/twisted/conch/manhole.py | 15 ++++++++-------
+ src/twisted/mail/imap4.py    | 19 +++++++++++--------
+ src/twisted/python/compat.py | 24 ++++++++++++++++++++++++
+ 3 files changed, 43 insertions(+), 15 deletions(-)
+
+diff --git a/src/twisted/conch/manhole.py b/src/twisted/conch/manhole.py
+index 3326f90aa..17ca05c58 100644
+--- a/src/twisted/conch/manhole.py
++++ b/src/twisted/conch/manhole.py
+@@ -19,7 +19,7 @@ from io import BytesIO
+ from twisted.conch import recvline
+ 
+ from twisted.internet import defer
+-from twisted.python.compat import _tokenize
++from twisted.python.compat import _tokenize, get_async_param
+ from twisted.python.htmlizer import TokenPrinter
+ 
+ class FileWrapper:
+@@ -151,9 +151,9 @@ class ManholeInterpreter(code.InteractiveInterpreter):
+         return failure
+ 
+ 
+-    def write(self, data, async=False):
+-        self.handler.addOutput(data, async)
+-
++    def write(self, data, async_=None, **kwargs):
++        async_ = get_async_param(async_, **kwargs)
++        self.handler.addOutput(data, async_)
+ 
+ 
+ CTRL_C = b'\x03'
+@@ -237,14 +237,15 @@ class Manhole(recvline.HistoricRecvLine):
+         return not w.endswith(b'\n') and not w.endswith(b'\x1bE')
+ 
+ 
+-    def addOutput(self, data, async=False):
+-        if async:
++    def addOutput(self, data, async_=None, **kwargs):
++        async_ = get_async_param(async_, **kwargs)
++        if async_:
+             self.terminal.eraseLine()
+             self.terminal.cursorBackward(len(self.lineBuffer) + len(self.ps[self.pn]))
+ 
+         self.terminal.write(data)
+ 
+-        if async:
++        if async_:
+             if self._needsNewline():
+                 self.terminal.nextLine()
+ 
+diff --git a/src/twisted/mail/imap4.py b/src/twisted/mail/imap4.py
+index 0ca1f1c5e..295053a6c 100644
+--- a/src/twisted/mail/imap4.py
++++ b/src/twisted/mail/imap4.py
+@@ -42,7 +42,7 @@ from twisted.python.compat import (
+     _bytesChr, unichr as chr, _b64decodebytes as decodebytes,
+     _b64encodebytes as encodebytes,
+     intToBytes, iterbytes, long, nativeString, networkString, unicode,
+-    _matchingString, _PY3
++    _matchingString, _PY3, get_async_param,
+ )
+ from twisted.internet import interfaces
+ 
+@@ -1090,8 +1090,9 @@ class IMAP4Server(basic.LineReceiver, policies.TimeoutMixin):
+         self._respond(b'NO', tag, message)
+ 
+ 
+-    def sendUntaggedResponse(self, message, async=False):
+-        if not async or (self.blocked is None):
++    def sendUntaggedResponse(self, message, async_=None, **kwargs):
++        async_ = get_async_param(async_, **kwargs)
++        if not async_ or (self.blocked is None):
+             self._respond(message, None, None)
+         else:
+             self._queuedAsync.append(message)
+@@ -2497,9 +2498,9 @@ class IMAP4Server(basic.LineReceiver, policies.TimeoutMixin):
+     #
+     def modeChanged(self, writeable):
+         if writeable:
+-            self.sendUntaggedResponse(message=b'[READ-WRITE]', async=True)
++            self.sendUntaggedResponse(message=b'[READ-WRITE]', async_=True)
+         else:
+-            self.sendUntaggedResponse(message=b'[READ-ONLY]', async=True)
++            self.sendUntaggedResponse(message=b'[READ-ONLY]', async_=True)
+ 
+ 
+     def flagsChanged(self, newFlags):
+@@ -2508,14 +2509,16 @@ class IMAP4Server(basic.LineReceiver, policies.TimeoutMixin):
+             msg = intToBytes(mId) + (
+                 b' FETCH (FLAGS (' +b' '.join(encodedFlags) + b'))'
+             )
+-            self.sendUntaggedResponse(msg, async=True)
++            self.sendUntaggedResponse(msg, async_=True)
+ 
+ 
+     def newMessages(self, exists, recent):
+         if exists is not None:
+-            self.sendUntaggedResponse(intToBytes(exists) + b' EXISTS', async=True)
++            self.sendUntaggedResponse(
++                intToBytes(exists) + b' EXISTS', async_=True)
+         if recent is not None:
+-            self.sendUntaggedResponse(intToBytes(recent) + b' RECENT', async=True)
++            self.sendUntaggedResponse(
++                intToBytes(recent) + b' RECENT', async_=True)
+ 
+ 
+ TIMEOUT_ERROR = error.TimeoutError()
+diff --git a/src/twisted/python/compat.py b/src/twisted/python/compat.py
+index 855e427aa..ba13bb4dd 100644
+--- a/src/twisted/python/compat.py
++++ b/src/twisted/python/compat.py
+@@ -833,6 +833,29 @@ except ImportError:
+     from collections import Sequence
+ 
+ 
++def get_async_param(async_=None, **kwargs):
++    """
++    Provide a backwards-compatible way to get async param value that does not
++    cause a syntax error under Python 3.7.
++
++    @param async_: async_ param value (should default to None)
++    @type async_: L{bool}
++
++    @param kwargs: keyword arguments of the caller (only async is allowed)
++    @type async_: L{dict}
++
++    @raise TypeError: Both async_ and async specified.
++
++    @return: Final async_ param value
++    @rtype: L{bool}
++    """
++    if async_ is None and 'async' in kwargs:
++        async_ = kwargs.pop('async')
++    if kwargs:
++        raise TypeError
++    return bool(async_)
++
++
+ __all__ = [
+     "reraise",
+     "execfile",
+@@ -874,4 +897,5 @@ __all__ = [
+     "raw_input",
+     "_tokenize",
+     "Sequence",
++    "get_async_param",
+ ]
+-- 
+2.17.1
+
diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 344edb4a0a..b72952f979 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -1,9 +1,11 @@
 config BR2_PACKAGE_PYTHON_TWISTED
 	bool "python-twisted"
 	select BR2_PACKAGE_PYTHON_INCREMENTAL
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_AUTOMAT # runtime
 	select BR2_PACKAGE_PYTHON_CONSTANTLY # runtime
 	select BR2_PACKAGE_PYTHON_HYPERLINK # runtime
+	select BR2_PACKAGE_PYTHON_PYHAMCREST # runtime
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
 	help
 	  Twisted is an event-driven networking engine written in
diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index c22f33643f..89ae44043e 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/twisted/json, sha256 locally computed
-md5 cd5c287802dcbaf7be15cf937c922b71 Twisted-17.5.0.tar.bz2
-sha256 f198a494f0df2482f7c5f99d7f3eef33d22763ffc76641b36fec476b878002ea Twisted-17.5.0.tar.bz2
+# md5, sha256 from https://pypi.org/pypi/twisted/json
+md5 16396b4d8d7fd0d668736b3d510279db Twisted-18.7.0.tar.bz2
+sha256 95ae985716e8107816d8d0df249d558dbaabb677987cc2ace45272c166b267e4 Twisted-18.7.0.tar.bz2
+# Locally computed sha256
+sha256 a516053f954d4f16fbdffa8924e42d6d2490a7241fe5de053541a766ae778fd4 LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index fe276d641e..9f54ecae4f 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 17.5.0
+PYTHON_TWISTED_VERSION = 18.7.0
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.bz2
-PYTHON_TWISTED_SITE = https://pypi.python.org/packages/31/bf/7f86a8f8b9778e90d8b2921e9f442a8c8aa33fd2489fc10f236bc8af1749
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/90/50/4c315ce5d119f67189d1819629cae7908ca0b0a6c572980df5cc6942bc22
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
