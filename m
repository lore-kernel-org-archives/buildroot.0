Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31869C433EF
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:33:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6FDF61037
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6FDF61037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89D0A403E8;
	Tue, 16 Nov 2021 20:33:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dtPn-1uXHy9i; Tue, 16 Nov 2021 20:33:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3472C40410;
	Tue, 16 Nov 2021 20:33:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 507E31BF973
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D35040144
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lOf1IfmagzY3 for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 20:33:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22AAA40130
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 20:33:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 763EC8D362; Tue, 16 Nov 2021 20:28:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 16 Nov 2021 20:49:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f92c032369e6794f4ba97ef0d11dd521c713c44
X-Git-Newrev: 0d5766452c9162cb81f975295d25bf98c8f537e2
X-Patchwork-Hint: ignore
Message-Id: <20211116202859.763EC8D362@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp: fix async_timeout
 4.0.0 compatibility
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0d5766452c9162cb81f975295d25bf98c8f537e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to backport an upstream patch adding async_timeout 4.0.0
compatibility since we are still on aiohttp version 3.7.4.post0.

Fixes:
>>> import aiohttp
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.9/site-packages/aiohttp/__init__.py", line 6, in <module>
  File "/usr/lib/python3.9/site-packages/aiohttp/client.py", line 35, in <module>
  File "/usr/lib/python3.9/site-packages/aiohttp/http.py", line 7, in <module>
  File "/usr/lib/python3.9/site-packages/aiohttp/http_parser.py", line 15, in <module>
  File "/usr/lib/python3.9/site-packages/aiohttp/helpers.py", line 667, in <module>
TypeError: function() argument 'code' must be code, not str

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...sync-timeout-version-for-aiohttp-3.8-5299.patch | 306 +++++++++++++++++++++
 1 file changed, 306 insertions(+)

diff --git a/package/python-aiohttp/0001-Bump-async-timeout-version-for-aiohttp-3.8-5299.patch b/package/python-aiohttp/0001-Bump-async-timeout-version-for-aiohttp-3.8-5299.patch
new file mode 100644
index 0000000000..95042b713e
--- /dev/null
+++ b/package/python-aiohttp/0001-Bump-async-timeout-version-for-aiohttp-3.8-5299.patch
@@ -0,0 +1,306 @@
+From 572db464d3b5123e433759411a0c8796ea9fb5c9 Mon Sep 17 00:00:00 2001
+From: Andrew Svetlov <andrew.svetlov@gmail.com>
+Date: Sun, 29 Nov 2020 15:12:15 +0200
+Subject: [PATCH] Bump async-timeout version for aiohttp 3.8 (#5299)
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+1e6ec85e709db083d240c5ca249660d0fa56c61c]
+---
+ aiohttp/client.py                  |  4 +--
+ aiohttp/client_ws.py               |  6 ++--
+ aiohttp/connector.py               | 15 ++++++---
+ aiohttp/helpers.py                 | 25 ++++++---------
+ aiohttp/web_protocol.py            |  6 ++--
+ aiohttp/web_ws.py                  |  6 ++--
+ setup.py                           |  2 +-
+ tests/test_client_ws_functional.py |  2 +-
+ tests/test_helpers.py              | 49 +++++++-----------------------
+ 10 files changed, 44 insertions(+), 73 deletions(-)
+
+diff --git a/aiohttp/client.py b/aiohttp/client.py
+index a9da8e15..2c87eb52 100644
+--- a/aiohttp/client.py
++++ b/aiohttp/client.py
+@@ -74,8 +74,8 @@ from .helpers import (
+     DEBUG,
+     PY_36,
+     BasicAuth,
+-    CeilTimeout,
+     TimeoutHandle,
++    ceil_timeout,
+     get_running_loop,
+     proxies_from_env,
+     sentinel,
+@@ -515,7 +515,7 @@ class ClientSession:
+ 
+                     # connection timeout
+                     try:
+-                        with CeilTimeout(real_timeout.connect, loop=self._loop):
++                        async with ceil_timeout(real_timeout.connect):
+                             assert self._connector is not None
+                             conn = await self._connector.connect(
+                                 req, traces=traces, timeout=real_timeout
+diff --git a/aiohttp/client_ws.py b/aiohttp/client_ws.py
+index 28fa371c..a4c7371f 100644
+--- a/aiohttp/client_ws.py
++++ b/aiohttp/client_ws.py
+@@ -191,7 +191,7 @@ class ClientWebSocketResponse:
+ 
+             while True:
+                 try:
+-                    with async_timeout.timeout(self._timeout, loop=self._loop):
++                    async with async_timeout.timeout(self._timeout):
+                         msg = await self._reader.read()
+                 except asyncio.CancelledError:
+                     self._close_code = 1006
+@@ -224,9 +224,7 @@ class ClientWebSocketResponse:
+             try:
+                 self._waiting = self._loop.create_future()
+                 try:
+-                    with async_timeout.timeout(
+-                        timeout or self._receive_timeout, loop=self._loop
+-                    ):
++                    async with async_timeout.timeout(timeout or self._receive_timeout):
+                         msg = await self._reader.read()
+                     self._reset_heartbeat()
+                 finally:
+diff --git a/aiohttp/connector.py b/aiohttp/connector.py
+index 748b22a4..77a4f379 100644
+--- a/aiohttp/connector.py
++++ b/aiohttp/connector.py
+@@ -44,7 +44,14 @@ from .client_exceptions import (
+ )
+ from .client_proto import ResponseHandler
+ from .client_reqrep import ClientRequest, Fingerprint, _merge_ssl_params
+-from .helpers import PY_36, CeilTimeout, get_running_loop, is_ip_address, noop, sentinel
++from .helpers import (
++    PY_36,
++    ceil_timeout,
++    get_running_loop,
++    is_ip_address,
++    noop,
++    sentinel,
++)
+ from .http import RESPONSES
+ from .locks import EventResultOrError
+ from .resolver import DefaultResolver
+@@ -965,7 +972,7 @@ class TCPConnector(BaseConnector):
+         **kwargs: Any,
+     ) -> Tuple[asyncio.Transport, ResponseHandler]:
+         try:
+-            with CeilTimeout(timeout.sock_connect):
++            async with ceil_timeout(timeout.sock_connect):
+                 return await self._loop.create_connection(*args, **kwargs)  # type: ignore  # noqa
+         except cert_errors as exc:
+             raise ClientConnectorCertificateError(req.connection_key, exc) from exc
+@@ -1189,7 +1196,7 @@ class UnixConnector(BaseConnector):
+         self, req: "ClientRequest", traces: List["Trace"], timeout: "ClientTimeout"
+     ) -> ResponseHandler:
+         try:
+-            with CeilTimeout(timeout.sock_connect):
++            async with ceil_timeout(timeout.sock_connect):
+                 _, proto = await self._loop.create_unix_connection(
+                     self._factory, self._path
+                 )
+@@ -1245,7 +1252,7 @@ class NamedPipeConnector(BaseConnector):
+         self, req: "ClientRequest", traces: List["Trace"], timeout: "ClientTimeout"
+     ) -> ResponseHandler:
+         try:
+-            with CeilTimeout(timeout.sock_connect):
++            async with ceil_timeout(timeout.sock_connect):
+                 _, proto = await self._loop.create_pipe_connection(  # type: ignore
+                     self._factory, self._path
+                 )
+diff --git a/aiohttp/helpers.py b/aiohttp/helpers.py
+index bbf5f129..a6b14025 100644
+--- a/aiohttp/helpers.py
++++ b/aiohttp/helpers.py
+@@ -664,21 +664,16 @@ class TimerContext(BaseTimerContext):
+             self._cancelled = True
+ 
+ 
+-class CeilTimeout(async_timeout.timeout):
+-    def __enter__(self) -> async_timeout.timeout:
+-        if self._timeout is not None:
+-            self._task = current_task(loop=self._loop)
+-            if self._task is None:
+-                raise RuntimeError(
+-                    "Timeout context manager should be used inside a task"
+-                )
+-            now = self._loop.time()
+-            delay = self._timeout
+-            when = now + delay
+-            if delay > 5:
+-                when = ceil(when)
+-            self._cancel_handler = self._loop.call_at(when, self._cancel_task)
+-        return self
++def ceil_timeout(delay: Optional[float]) -> async_timeout.Timeout:
++    if delay is None:
++        return async_timeout.timeout(None)
++    else:
++        loop = get_running_loop()
++        now = loop.time()
++        when = now + delay
++        if delay > 5:
++            when = ceil(when)
++        return async_timeout.timeout_at(when)
+ 
+ 
+ class HeadersMixin:
+diff --git a/aiohttp/web_protocol.py b/aiohttp/web_protocol.py
+index 8e02bc4a..16f4d4ef 100644
+--- a/aiohttp/web_protocol.py
++++ b/aiohttp/web_protocol.py
+@@ -13,7 +13,7 @@ import yarl
+ 
+ from .abc import AbstractAccessLogger, AbstractStreamWriter
+ from .base_protocol import BaseProtocol
+-from .helpers import CeilTimeout, current_task
++from .helpers import ceil_timeout, current_task
+ from .http import (
+     HttpProcessingError,
+     HttpRequestParser,
+@@ -228,7 +228,7 @@ class RequestHandler(BaseProtocol):
+ 
+         # wait for handlers
+         with suppress(asyncio.CancelledError, asyncio.TimeoutError):
+-            with CeilTimeout(timeout, loop=self._loop):
++            async with ceil_timeout(timeout):
+                 if self._error_handler is not None and not self._error_handler.done():
+                     await self._error_handler
+ 
+@@ -517,7 +517,7 @@ class RequestHandler(BaseProtocol):
+ 
+                         with suppress(asyncio.TimeoutError, asyncio.CancelledError):
+                             while not payload.is_eof() and now < end_t:
+-                                with CeilTimeout(end_t - now, loop=loop):
++                                async with ceil_timeout(end_t - now):
+                                     # read and ignore
+                                     await payload.readany()
+                                 now = loop.time()
+diff --git a/aiohttp/web_ws.py b/aiohttp/web_ws.py
+index da7ce6df..5f3cce56 100644
+--- a/aiohttp/web_ws.py
++++ b/aiohttp/web_ws.py
+@@ -359,7 +359,7 @@ class WebSocketResponse(StreamResponse):
+             reader = self._reader
+             assert reader is not None
+             try:
+-                with async_timeout.timeout(self._timeout, loop=self._loop):
++                async with async_timeout.timeout(self._timeout):
+                     msg = await reader.read()
+             except asyncio.CancelledError:
+                 self._close_code = 1006
+@@ -400,9 +400,7 @@ class WebSocketResponse(StreamResponse):
+             try:
+                 self._waiting = loop.create_future()
+                 try:
+-                    with async_timeout.timeout(
+-                        timeout or self._receive_timeout, loop=self._loop
+-                    ):
++                    async with async_timeout.timeout(timeout or self._receive_timeout):
+                         msg = await self._reader.read()
+                     self._reset_heartbeat()
+                 finally:
+diff --git a/setup.py b/setup.py
+index 54462ba7..c262de1e 100644
+--- a/setup.py
++++ b/setup.py
+@@ -68,7 +68,7 @@ install_requires = [
+     "attrs>=17.3.0",
+     "chardet>=2.0,<5.0",
+     "multidict>=4.5,<7.0",
+-    "async_timeout>=3.0,<4.0",
++    "async_timeout>=4.0.0a3,<5.0",
+     "yarl>=1.0,<2.0",
+     'idna-ssl>=1.0; python_version<"3.7"',
+     "typing_extensions>=3.6.5",
+diff --git a/tests/test_client_ws_functional.py b/tests/test_client_ws_functional.py
+index e423765a..76ef0525 100644
+--- a/tests/test_client_ws_functional.py
++++ b/tests/test_client_ws_functional.py
+@@ -461,7 +461,7 @@ async def test_recv_timeout(aiohttp_client) -> None:
+     await resp.send_str("ask")
+ 
+     with pytest.raises(asyncio.TimeoutError):
+-        with async_timeout.timeout(0.01):
++        async with async_timeout.timeout(0.01):
+             await resp.receive()
+ 
+     await resp.close()
+diff --git a/tests/test_helpers.py b/tests/test_helpers.py
+index 3367c24b..d36c7e4c 100644
+--- a/tests/test_helpers.py
++++ b/tests/test_helpers.py
+@@ -3,7 +3,6 @@ import base64
+ import gc
+ import os
+ import platform
+-import sys
+ import tempfile
+ from math import isclose, modf
+ from unittest import mock
+@@ -391,48 +390,22 @@ async def test_weakref_handle_weak(loop) -> None:
+     await asyncio.sleep(0.1)
+ 
+ 
+-def test_ceil_call_later() -> None:
+-    cb = mock.Mock()
+-    loop = mock.Mock()
+-    loop.time.return_value = 10.1
+-    helpers.call_later(cb, 10.1, loop)
+-    loop.call_at.assert_called_with(21.0, cb)
+-
+-
+-def test_ceil_call_later_no_timeout() -> None:
+-    cb = mock.Mock()
+-    loop = mock.Mock()
+-    helpers.call_later(cb, 0, loop)
+-    assert not loop.call_at.called
+-
+-
+-async def test_ceil_timeout(loop) -> None:
+-    with helpers.CeilTimeout(None, loop=loop) as timeout:
+-        assert timeout._timeout is None
+-        assert timeout._cancel_handler is None
++async def test_ceil_timeout() -> None:
++    async with helpers.ceil_timeout(None) as timeout:
++        assert timeout.deadline is None
+ 
+ 
+-def test_ceil_timeout_no_task(loop) -> None:
+-    with pytest.raises(RuntimeError):
+-        with helpers.CeilTimeout(10, loop=loop):
+-            pass
+-
+-
+-@pytest.mark.skipif(
+-    sys.version_info < (3, 7), reason="TimerHandle.when() doesn't exist"
+-)
+-async def test_ceil_timeout_round(loop) -> None:
+-    with helpers.CeilTimeout(7.5, loop=loop) as cm:
+-        frac, integer = modf(cm._cancel_handler.when())
++async def test_ceil_timeout_round() -> None:
++    async with helpers.ceil_timeout(7.5) as cm:
++        assert cm.deadline is not None
++        frac, integer = modf(cm.deadline)
+         assert frac == 0
+ 
+ 
+-@pytest.mark.skipif(
+-    sys.version_info < (3, 7), reason="TimerHandle.when() doesn't exist"
+-)
+-async def test_ceil_timeout_small(loop) -> None:
+-    with helpers.CeilTimeout(1.1, loop=loop) as cm:
+-        frac, integer = modf(cm._cancel_handler.when())
++async def test_ceil_timeout_small() -> None:
++    async with helpers.ceil_timeout(1.1) as cm:
++        assert cm.deadline is not None
++        frac, integer = modf(cm.deadline)
+         # a chance for exact integer with zero fraction is negligible
+         assert frac != 0
+ 
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
