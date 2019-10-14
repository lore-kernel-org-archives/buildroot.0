From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 14 Oct 2019 09:26:48 +0200
Subject: [Buildroot] [git commit] package/python-ws4py: add patch to fit
 Python 3.7 syntax
Message-ID: <20191014072138.849A48DE93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=372088ca7c37938ba5bf972ff8993fff8f38f7a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch comes from an upstream pull request, but doesn't apply as is since
the test is not part of the tarball.

Fixes:
 - http://autobuild.buildroot.net/results/2999d8de19ed7bf7a5ce148da4b1b98f144bad9b

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-Adjust-ws4py-for-Python-3.7-syntax.patch  | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch b/package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch
new file mode 100644
index 0000000000..07fbb6ccc1
--- /dev/null
+++ b/package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch
@@ -0,0 +1,55 @@
+From dfe6f65b7078315c32cebb727e9c47ead7603475 Mon Sep 17 00:00:00 2001
+From: Asaf Kahlon <asafka7@gmail.com>
+Date: Sun, 13 Oct 2019 16:44:44 +0300
+Subject: [PATCH 1/1] Adjust ws4py for Python 3.7 syntax
+
+Since Python 3.7, "async" has become a keyword and cannot be used.
+Thus, instead of asyncio.async we will use asyncio.ensure_future.
+
+There's also a pull request with this change:
+https://github.com/Lawouach/WebSocket-for-Python/pull/245
+
+Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
+---
+ ws4py/async_websocket.py    | 4 ++--
+ ws4py/server/tulipserver.py | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/ws4py/async_websocket.py b/ws4py/async_websocket.py
+index 9e2a4c7..ea296b4 100644
+--- a/ws4py/async_websocket.py
++++ b/ws4py/async_websocket.py
+@@ -84,7 +84,7 @@ class WebSocket(_WebSocket):
+         def closeit():
+             yield from self.proto.writer.drain()
+             self.proto.writer.close()
+-        asyncio.async(closeit())
++        asyncio.ensure_future(closeit())
+ 
+     def _write(self, data):
+         """
+@@ -94,7 +94,7 @@ class WebSocket(_WebSocket):
+         def sendit(data):
+             self.proto.writer.write(data)
+             yield from self.proto.writer.drain()
+-        asyncio.async(sendit(data))
++        asyncio.ensure_future(sendit(data))
+ 
+     @asyncio.coroutine
+     def run(self):
+diff --git a/ws4py/server/tulipserver.py b/ws4py/server/tulipserver.py
+index 2786c16..85312a2 100644
+--- a/ws4py/server/tulipserver.py
++++ b/ws4py/server/tulipserver.py
+@@ -40,7 +40,7 @@ class WebSocketProtocol(asyncio.StreamReaderProtocol):
+         #self.stream.set_transport(transport)
+         asyncio.StreamReaderProtocol.connection_made(self, transport)
+         # Let make it concurrent for others to tag along
+-        f = asyncio.async(self.handle_initial_handshake())
++        f = asyncio.ensure_future(self.handle_initial_handshake())
+         f.add_done_callback(self.terminated)
+ 
+     @property
+-- 
+2.20.1
+
