From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  5 Jun 2018 10:15:22 +0200
Subject: [Buildroot] [PATCH] python-websockets: bump to version 5.0.1
Message-ID: <20180605081522.14753-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Remove upstream patch.

Fixes:
http://autobuild.buildroot.net/results/0b59939faaefc12cd7da4f26ab86659ac031b008/
http://autobuild.buildroot.net/results/c0196693cfdbf10b429c5c03684d5308a68c8509/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...ehavior-of-recv-in-the-CLOSING-state.patch | 261 ------------------
 .../python-websockets/python-websockets.hash  |   4 +-
 .../python-websockets/python-websockets.mk    |   4 +-
 3 files changed, 4 insertions(+), 265 deletions(-)
 delete mode 100644 package/python-websockets/0001-Fix-behavior-of-recv-in-the-CLOSING-state.patch

diff --git a/package/python-websockets/0001-Fix-behavior-of-recv-in-the-CLOSING-state.patch b/package/python-websockets/0001-Fix-behavior-of-recv-in-the-CLOSING-state.patch
deleted file mode 100644
index cb97b36bde..0000000000
--- a/package/python-websockets/0001-Fix-behavior-of-recv-in-the-CLOSING-state.patch
+++ /dev/null
@@ -1,261 +0,0 @@
-From 402059e4a46a764632eba8a669f5b012f173ee7b Mon Sep 17 00:00:00 2001
-From: Aymeric Augustin <aymeric.augustin@m4x.org>
-Date: Tue, 1 May 2018 17:05:05 +0200
-Subject: [PATCH] Fix behavior of recv() in the CLOSING state.
-
-The behavior wasn't tested correctly: in some test cases, the connection
-had already moved to the CLOSED state, where the close code and reason
-are already known.
-
-Refactor half_close_connection_{local,remote} to allow multiple runs of
-the event loop while remaining in the CLOSING state. Refactor affected
-tests accordingly.
-
-I verified that all tests in the CLOSING state were behaving is intended
-by inserting debug statements in recv/send/ping/pong and running:
-
-$ PYTHONASYNCIODEBUG=1 python -m unittest -v websockets.test_protocol.{Client,Server}Tests.test_{recv,send,ping,pong}_on_closing_connection_{local,remote}
-
-Fix #317, #327, #350, #357.
-
-Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
----
- websockets/protocol.py      | 10 ++---
- websockets/test_protocol.py | 78 +++++++++++++++++++++++++++++--------
- 2 files changed, 66 insertions(+), 22 deletions(-)
-
-diff --git a/websockets/protocol.py b/websockets/protocol.py
-index f8121a1..7583fe9 100644
---- a/websockets/protocol.py
-+++ b/websockets/protocol.py
-@@ -303,7 +303,7 @@ class WebSocketCommonProtocol(asyncio.StreamReaderProtocol):
-         # Don't yield from self.ensure_open() here because messages could be
-         # received before the closing frame even if the connection is closing.
- 
--        # Wait for a message until the connection is closed
-+        # Wait for a message until the connection is closed.
-         next_message = asyncio_ensure_future(
-             self.messages.get(), loop=self.loop)
-         try:
-@@ -315,15 +315,15 @@ class WebSocketCommonProtocol(asyncio.StreamReaderProtocol):
-             next_message.cancel()
-             raise
- 
--        # Now there's no need to yield from self.ensure_open(). Either a
--        # message was received or the connection was closed.
--
-         if next_message in done:
-             return next_message.result()
-         else:
-             next_message.cancel()
-             if not self.legacy_recv:
--                raise ConnectionClosed(self.close_code, self.close_reason)
-+                assert self.state in [State.CLOSING, State.CLOSED]
-+                # Wait until the connection is closed to raise
-+                # ConnectionClosed with the correct code and reason.
-+                yield from self.ensure_open()
- 
-     @asyncio.coroutine
-     def send(self, data):
-diff --git a/websockets/test_protocol.py b/websockets/test_protocol.py
-index 70348fb..bfd4e3b 100644
---- a/websockets/test_protocol.py
-+++ b/websockets/test_protocol.py
-@@ -105,7 +105,7 @@ class CommonTests:
-         self.loop.call_soon(self.loop.stop)
-         self.loop.run_forever()
- 
--    def make_drain_slow(self, delay=3 * MS):
-+    def make_drain_slow(self, delay=MS):
-         # Process connection_made in order to initialize self.protocol.writer.
-         self.run_loop_once()
- 
-@@ -174,6 +174,8 @@ class CommonTests:
-         # Empty the outgoing data stream so we can make assertions later on.
-         self.assertOneFrameSent(True, OP_CLOSE, close_frame_data)
- 
-+        assert self.protocol.state is State.CLOSED
-+
-     def half_close_connection_local(self, code=1000, reason='close'):
-         """
-         Start a closing handshake but do not complete it.
-@@ -181,31 +183,56 @@ class CommonTests:
-         The main difference with `close_connection` is that the connection is
-         left in the CLOSING state until the event loop runs again.
- 
-+        The current implementation returns a task that must be awaited or
-+        cancelled, else asyncio complains about destroying a pending task.
-+
-         """
-         close_frame_data = serialize_close(code, reason)
--        # Trigger the closing handshake from the local side.
--        self.ensure_future(self.protocol.close(code, reason))
-+        # Trigger the closing handshake from the local endpoint.
-+        close_task = self.ensure_future(self.protocol.close(code, reason))
-         self.run_loop_once()    # wait_for executes
-         self.run_loop_once()    # write_frame executes
-         # Empty the outgoing data stream so we can make assertions later on.
-         self.assertOneFrameSent(True, OP_CLOSE, close_frame_data)
--        # Prepare the response to the closing handshake from the remote side.
--        self.loop.call_soon(
--            self.receive_frame, Frame(True, OP_CLOSE, close_frame_data))
--        self.loop.call_soon(self.receive_eof_if_client)
-+
-+        assert self.protocol.state is State.CLOSING
-+
-+        # Complete the closing sequence at 1ms intervals so the test can run
-+        # at each point even it goes back to the event loop several times.
-+        self.loop.call_later(
-+            MS, self.receive_frame, Frame(True, OP_CLOSE, close_frame_data))
-+        self.loop.call_later(2 * MS, self.receive_eof_if_client)
-+
-+        # This task must be awaited or cancelled by the caller.
-+        return close_task
- 
-     def half_close_connection_remote(self, code=1000, reason='close'):
-         """
--        Receive a closing handshake.
-+        Receive a closing handshake but do not complete it.
- 
-         The main difference with `close_connection` is that the connection is
-         left in the CLOSING state until the event loop runs again.
- 
-         """
-+        # On the server side, websockets completes the closing handshake and
-+        # closes the TCP connection immediately. Yield to the event loop after
-+        # sending the close frame to run the test while the connection is in
-+        # the CLOSING state.
-+        if not self.protocol.is_client:
-+            self.make_drain_slow()
-+
-         close_frame_data = serialize_close(code, reason)
--        # Trigger the closing handshake from the remote side.
-+        # Trigger the closing handshake from the remote endpoint.
-         self.receive_frame(Frame(True, OP_CLOSE, close_frame_data))
--        self.receive_eof_if_client()
-+        self.run_loop_once()    # read_frame executes
-+        # Empty the outgoing data stream so we can make assertions later on.
-+        self.assertOneFrameSent(True, OP_CLOSE, close_frame_data)
-+
-+        assert self.protocol.state is State.CLOSING
-+
-+        # Complete the closing sequence at 1ms intervals so the test can run
-+        # at each point even it goes back to the event loop several times.
-+        self.loop.call_later(2 * MS, self.receive_eof_if_client)
- 
-     def process_invalid_frames(self):
-         """
-@@ -335,11 +362,13 @@ class CommonTests:
-         self.assertEqual(data, b'tea')
- 
-     def test_recv_on_closing_connection_local(self):
--        self.half_close_connection_local()
-+        close_task = self.half_close_connection_local()
- 
-         with self.assertRaises(ConnectionClosed):
-             self.loop.run_until_complete(self.protocol.recv())
- 
-+        self.loop.run_until_complete(close_task)    # cleanup
-+
-     def test_recv_on_closing_connection_remote(self):
-         self.half_close_connection_remote()
- 
-@@ -421,24 +450,29 @@ class CommonTests:
-         self.assertNoFrameSent()
- 
-     def test_send_on_closing_connection_local(self):
--        self.half_close_connection_local()
-+        close_task = self.half_close_connection_local()
- 
-         with self.assertRaises(ConnectionClosed):
-             self.loop.run_until_complete(self.protocol.send('foobar'))
-+
-         self.assertNoFrameSent()
- 
-+        self.loop.run_until_complete(close_task)    # cleanup
-+
-     def test_send_on_closing_connection_remote(self):
-         self.half_close_connection_remote()
- 
-         with self.assertRaises(ConnectionClosed):
-             self.loop.run_until_complete(self.protocol.send('foobar'))
--        self.assertOneFrameSent(True, OP_CLOSE, serialize_close(1000, 'close'))
-+
-+        self.assertNoFrameSent()
- 
-     def test_send_on_closed_connection(self):
-         self.close_connection()
- 
-         with self.assertRaises(ConnectionClosed):
-             self.loop.run_until_complete(self.protocol.send('foobar'))
-+
-         self.assertNoFrameSent()
- 
-     # Test the ping coroutine.
-@@ -466,24 +500,29 @@ class CommonTests:
-         self.assertNoFrameSent()
- 
-     def test_ping_on_closing_connection_local(self):
--        self.half_close_connection_local()
-+        close_task = self.half_close_connection_local()
- 
-         with self.assertRaises(ConnectionClosed):
-             self.loop.run_until_complete(self.protocol.ping())
-+
-         self.assertNoFrameSent()
- 
-+        self.loop.run_until_complete(close_task)    # cleanup
-+
-     def test_ping_on_closing_connection_remote(self):
-         self.half_close_connection_remote()
- 
-         with self.assertRaises(ConnectionClosed):
-             self.loop.run_until_complete(self.protocol.ping())
--        self.assertOneFrameSent(True, OP_CLOSE, serialize_close(1000, 'close'))
-+
-+        self.assertNoFrameSent()
- 
-     def test_ping_on_closed_connection(self):
-         self.close_connection()
- 
-         with self.assertRaises(ConnectionClosed):
-             self.loop.run_until_complete(self.protocol.ping())
-+
-         self.assertNoFrameSent()
- 
-     # Test the pong coroutine.
-@@ -506,24 +545,29 @@ class CommonTests:
-         self.assertNoFrameSent()
- 
-     def test_pong_on_closing_connection_local(self):
--        self.half_close_connection_local()
-+        close_task = self.half_close_connection_local()
- 
-         with self.assertRaises(ConnectionClosed):
-             self.loop.run_until_complete(self.protocol.pong())
-+
-         self.assertNoFrameSent()
- 
-+        self.loop.run_until_complete(close_task)    # cleanup
-+
-     def test_pong_on_closing_connection_remote(self):
-         self.half_close_connection_remote()
- 
-         with self.assertRaises(ConnectionClosed):
-             self.loop.run_until_complete(self.protocol.pong())
--        self.assertOneFrameSent(True, OP_CLOSE, serialize_close(1000, 'close'))
-+
-+        self.assertNoFrameSent()
- 
-     def test_pong_on_closed_connection(self):
-         self.close_connection()
- 
-         with self.assertRaises(ConnectionClosed):
-             self.loop.run_until_complete(self.protocol.pong())
-+
-         self.assertNoFrameSent()
- 
-     # Test the protocol's logic for acknowledging pings with pongs.
--- 
-2.17.0
-
diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 2805e8a534..0fbe144173 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5	fde30398f43401731ba38340a7031ab0  websockets-5.0.tar.gz
-sha256	4ea90a598b546233a4c61bef98db4171ac30f1302826729af30001ac1f471098  websockets-5.0.tar.gz
+md5	cd2f92f07bca588acd9238b18f6cfbcf  websockets-5.0.1.tar.gz
+sha256	a49d315db5a7a19d55422e1678e8a1c3b9661d7296bef3179fa620cf80b12674  websockets-5.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256	2cd4d416e432ca7fda2c103b38b852f8d3cb327d70c3db44410b9fe97e6c4d73  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index f7f2caaf0b..0e225b90f1 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 5.0
+PYTHON_WEBSOCKETS_VERSION = 5.0.1
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/0d/ea/0cc41f9ab63b4af08840a667b047d6fab6406aebb076932ef877a4511f78
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/4b/c6/026da2eeed75a49dd0b72a0c7ed6ee5cb2943e396ca9753eabff7359b27b
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.17.0
