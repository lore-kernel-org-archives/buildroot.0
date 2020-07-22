From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 23:11:12 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-twisted:
 Fix several request smuggling attacks
Message-ID: <20200722211134.418EF81057@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25bda2ef0a646cc498e564db97d07b0deec00d4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

CVE-2020-10108
In Twisted Web through 19.10.0, there was an HTTP request splitting
vulnerability. When presented with two content-length headers, it
ignored the first header. When the second content-length value was
set to zero, the request body was interpreted as a pipelined request.

CVE-2020-10109
In Twisted Web through 19.10.0, there was an HTTP request splitting
vulnerability. When presented with a content-length and a chunked
encoding header, the content-length took precedence and the remainder
of the request body was interpreted as a pipelined request.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-fix-several-request-smuggling-attacks.patch | 271 +++++++++++++++++++++
 1 file changed, 271 insertions(+)

diff --git a/package/python-twisted/0001-fix-several-request-smuggling-attacks.patch b/package/python-twisted/0001-fix-several-request-smuggling-attacks.patch
new file mode 100644
index 0000000000..9fe15ad7b8
--- /dev/null
+++ b/package/python-twisted/0001-fix-several-request-smuggling-attacks.patch
@@ -0,0 +1,271 @@
+From 4a7d22e490bb8ff836892cc99a1f54b85ccb0281 Mon Sep 17 00:00:00 2001
+From: Mark Williams <mrw@enotuniq.org>
+Date: Sun, 16 Feb 2020 19:00:10 -0800
+Subject: [PATCH] Fix several request smuggling attacks.
+
+1. Requests with multiple Content-Length headers were allowed (thanks
+to Jake Miller from Bishop Fox and ZeddYu Lu) and now fail with a 400;
+
+2. Requests with a Content-Length header and a Transfer-Encoding
+header honored the first header (thanks to Jake Miller from Bishop
+Fox) and now fail with a 400;
+
+3. Requests whose Transfer-Encoding header had a value other than
+"chunked" and "identity" (thanks to ZeddYu Lu) were allowed and now fail
+with a 400.
+
+Fixes CVE-2020-10108 & CVE-2020-10109 - HTTP request splitting
+https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-10108
+https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-10109
+
+Upstream:
+https://github.com/twisted/twisted/commit/4a7d22e490bb8ff836892cc99a1f54b85ccb0281
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+
+
+---
+ src/twisted/web/http.py                   |  64 +++++++---
+ src/twisted/web/newsfragments/9770.bugfix |   1 +
+ src/twisted/web/test/test_http.py         | 137 ++++++++++++++++++++++
+ 3 files changed, 187 insertions(+), 15 deletions(-)
+ create mode 100644 src/twisted/web/newsfragments/9770.bugfix
+
+diff --git a/src/twisted/web/http.py b/src/twisted/web/http.py
+index f0fb05b4d69..06d830fe30f 100644
+--- a/src/twisted/web/http.py
++++ b/src/twisted/web/http.py
+@@ -2171,6 +2171,51 @@ def _finishRequestBody(self, data):
+         self.allContentReceived()
+         self._dataBuffer.append(data)
+ 
++    def _maybeChooseTransferDecoder(self, header, data):
++        """
++        If the provided header is C{content-length} or
++        C{transfer-encoding}, choose the appropriate decoder if any.
++
++        Returns L{True} if the request can proceed and L{False} if not.
++        """
++
++        def fail():
++            self._respondToBadRequestAndDisconnect()
++            self.length = None
++
++        # Can this header determine the length?
++        if header == b'content-length':
++            try:
++                length = int(data)
++            except ValueError:
++                fail()
++                return False
++            newTransferDecoder = _IdentityTransferDecoder(
++                length, self.requests[-1].handleContentChunk, self._finishRequestBody)
++        elif header == b'transfer-encoding':
++            # XXX Rather poorly tested code block, apparently only exercised by
++            # test_chunkedEncoding
++            if data.lower() == b'chunked':
++                length = None
++                newTransferDecoder = _ChunkedTransferDecoder(
++                    self.requests[-1].handleContentChunk, self._finishRequestBody)
++            elif data.lower() == b'identity':
++                return True
++            else:
++                fail()
++                return False
++        else:
++            # It's not a length related header, so exit
++            return True
++
++        if self._transferDecoder is not None:
++            fail()
++            return False
++        else:
++            self.length = length
++            self._transferDecoder = newTransferDecoder
++            return True
++
+ 
+     def headerReceived(self, line):
+         """
+@@ -2196,21 +2241,10 @@ def headerReceived(self, line):
+ 
+         header = header.lower()
+         data = data.strip()
+-        if header == b'content-length':
+-            try:
+-                self.length = int(data)
+-            except ValueError:
+-                self._respondToBadRequestAndDisconnect()
+-                self.length = None
+-                return False
+-            self._transferDecoder = _IdentityTransferDecoder(
+-                self.length, self.requests[-1].handleContentChunk, self._finishRequestBody)
+-        elif header == b'transfer-encoding' and data.lower() == b'chunked':
+-            # XXX Rather poorly tested code block, apparently only exercised by
+-            # test_chunkedEncoding
+-            self.length = None
+-            self._transferDecoder = _ChunkedTransferDecoder(
+-                self.requests[-1].handleContentChunk, self._finishRequestBody)
++
++        if not self._maybeChooseTransferDecoder(header, data):
++            return False
++
+         reqHeaders = self.requests[-1].requestHeaders
+         values = reqHeaders.getRawHeaders(header)
+         if values is not None:
+diff --git a/src/twisted/web/newsfragments/9770.bugfix b/src/twisted/web/newsfragments/9770.bugfix
+new file mode 100644
+index 00000000000..4f1be97de8a
+--- /dev/null
++++ b/src/twisted/web/newsfragments/9770.bugfix
+@@ -0,0 +1 @@
++Fix several request smuggling attacks: requests with multiple Content-Length headers were allowed (thanks to Jake Miller from Bishop Fox and ZeddYu Lu) and now fail with a 400; requests with a Content-Length header and a Transfer-Encoding header honored the first header (thanks to Jake Miller from Bishop Fox) and now fail with a 400; requests whose Transfer-Encoding header had a value other than "chunked" and "identity" (thanks to ZeddYu Lu) were allowed and now fail a 400.
+\ No newline at end of file
+diff --git a/src/twisted/web/test/test_http.py b/src/twisted/web/test/test_http.py
+index 0a0db09b750..578cb500cda 100644
+--- a/src/twisted/web/test/test_http.py
++++ b/src/twisted/web/test/test_http.py
+@@ -2252,6 +2252,143 @@ def process(self):
+         self.flushLoggedErrors(AttributeError)
+ 
+ 
++    def assertDisconnectingBadRequest(self, request):
++        """
++        Assert that the given request bytes fail with a 400 bad
++        request without calling L{Request.process}.
++
++        @param request: A raw HTTP request
++        @type request: L{bytes}
++        """
++        class FailedRequest(http.Request):
++            processed = False
++            def process(self):
++                FailedRequest.processed = True
++
++        channel = self.runRequest(request, FailedRequest, success=False)
++        self.assertFalse(FailedRequest.processed, "Request.process called")
++        self.assertEqual(
++            channel.transport.value(),
++            b"HTTP/1.1 400 Bad Request\r\n\r\n")
++        self.assertTrue(channel.transport.disconnecting)
++
++
++    def test_duplicateContentLengths(self):
++        """
++        A request which includes multiple C{content-length} headers
++        fails with a 400 response without calling L{Request.process}.
++        """
++        self.assertRequestRejected([
++            b'GET /a HTTP/1.1',
++            b'Content-Length: 56',
++            b'Content-Length: 0',
++            b'Host: host.invalid',
++            b'',
++            b'',
++        ])
++
++
++    def test_duplicateContentLengthsWithPipelinedRequests(self):
++        """
++        Two pipelined requests, the first of which includes multiple
++        C{content-length} headers, trigger a 400 response without
++        calling L{Request.process}.
++        """
++        self.assertRequestRejected([
++            b'GET /a HTTP/1.1',
++            b'Content-Length: 56',
++            b'Content-Length: 0',
++            b'Host: host.invalid',
++            b'',
++            b'',
++            b'GET /a HTTP/1.1',
++            b'Host: host.invalid',
++            b'',
++            b'',
++        ])
++
++
++    def test_contentLengthAndTransferEncoding(self):
++        """
++        A request that includes both C{content-length} and
++        C{transfer-encoding} headers fails with a 400 response without
++        calling L{Request.process}.
++        """
++        self.assertRequestRejected([
++            b'GET /a HTTP/1.1',
++            b'Transfer-Encoding: chunked',
++            b'Content-Length: 0',
++            b'Host: host.invalid',
++            b'',
++            b'',
++        ])
++
++
++    def test_contentLengthAndTransferEncodingWithPipelinedRequests(self):
++        """
++        Two pipelined requests, the first of which includes both
++        C{content-length} and C{transfer-encoding} headers, triggers a
++        400 response without calling L{Request.process}.
++        """
++        self.assertRequestRejected([
++            b'GET /a HTTP/1.1',
++            b'Transfer-Encoding: chunked',
++            b'Content-Length: 0',
++            b'Host: host.invalid',
++            b'',
++            b'',
++            b'GET /a HTTP/1.1',
++            b'Host: host.invalid',
++            b'',
++            b'',
++        ])
++
++
++    def test_unknownTransferEncoding(self):
++        """
++        A request whose C{transfer-encoding} header includes a value
++        other than C{chunked} or C{identity} fails with a 400 response
++        without calling L{Request.process}.
++        """
++        self.assertRequestRejected([
++            b'GET /a HTTP/1.1',
++            b'Transfer-Encoding: unknown',
++            b'Host: host.invalid',
++            b'',
++            b'',
++        ])
++
++
++    def test_transferEncodingIdentity(self):
++        """
++        A request with a valid C{content-length} and a
++        C{transfer-encoding} whose value is C{identity} succeeds.
++        """
++        body = []
++
++        class SuccessfulRequest(http.Request):
++            processed = False
++            def process(self):
++                body.append(self.content.read())
++                self.setHeader(b'content-length', b'0')
++                self.finish()
++
++        request = b'''\
++GET / HTTP/1.1
++Host: host.invalid
++Content-Length: 2
++Transfer-Encoding: identity
++
++ok
++'''
++        channel = self.runRequest(request, SuccessfulRequest, False)
++        self.assertEqual(body, [b'ok'])
++        self.assertEqual(
++            channel.transport.value(),
++            b'HTTP/1.1 200 OK\r\nContent-Length: 0\r\n\r\n',
++        )
++
++
+ 
+ class QueryArgumentsTests(unittest.TestCase):
+     def testParseqs(self):
