Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C874C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:26:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0845A611C8
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0845A611C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCA7780F3C;
	Tue,  9 Nov 2021 17:26:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 82bhJ3VpXCGq; Tue,  9 Nov 2021 17:26:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C53D180F44;
	Tue,  9 Nov 2021 17:26:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C88B71BF9AA
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6BA740399
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eC28A1QMUx_V for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 17:26:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47C4740392
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 17:26:02 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id w15so21389603ill.2
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 09:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NNqglwbYsB7hhj2d8shrjf3niNLlUFmMKpCjOSz1qrM=;
 b=YTKKqNBNtrwONDVLGUDdFME+bDmAH5MUClu1DIqdazDQjURUgySFg4VtNrMbgFF6lr
 pL3JNViieYUAUdiZDVCEdfolk98veioWGAqQjTQ+k2DSDKynoAbsytVUxEvdhqI5QM6d
 fWv2dB1qsEBoHKkeHx7anpo2V8ogSqEf+F356VDpWSE0/nHdoA5v5C4rnw/EXjkwxuQ+
 M+k4/qT8nXIRVsYhMOaYLQmWX+BGn2H4X8YZZ8xVk3A9pd4raK9WfF/NuG81NJn7iwTl
 9+CdpdMgPelLDsP+rVLp5CS5mDE+msyqIu5Ad+bB38nuauF+BkKDvr+BaU5IXCl4BCye
 TyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NNqglwbYsB7hhj2d8shrjf3niNLlUFmMKpCjOSz1qrM=;
 b=sCpFhJlSDVPgBTpm9N+becbovdSlhIsBqHeNMtCbK5q3iHNGFFQFEhIdA9zRuC2D+7
 MtXB+UyRrd3TggS8mnr+1EsZa3WAGSjfK8dNSxjxnj8yZNfSNRPDQyJDtMDv9KMfJElx
 XV/zWIMa3n6wFU4gBNSd2R0YJrZ4lHf5QJg2Y1L/jm2gtAmpKC2i3PeVjwc7dPCBs4YD
 ImY3F2d3eITIqZmCh3m2tbkcUeJ6uKwI/BGXJTHRnqelFGk8rWm4MkQCLI/7T3aDkxgP
 ERjTcLBygXpQXj+FKtip92jo5L7IKBc2qAJo8DlTpbExV1dphzUu3lxxMIAIhrRwmWjo
 k8qw==
X-Gm-Message-State: AOAM531IpQaA3urlzVSG2/oinXkr9zUnFSAj6sI0LFVyo3o8rIjkQqMl
 5JzOn1HfK2zZU8Uz7h9fJQNq4Xv39sqX2g==
X-Google-Smtp-Source: ABdhPJxnsUZJtbj3pWwzTvyYaKWJN42pbC+B52gIV30Ui16ys8OTa2c2BXku61dim+iRhMdJzoOHgw==
X-Received: by 2002:a05:6e02:1b8a:: with SMTP id
 h10mr6346133ili.237.1636478761126; 
 Tue, 09 Nov 2021 09:26:01 -0800 (PST)
Received: from james-x399.localdomain (97-118-146-63.hlrn.qwest.net.
 [97.118.146.63])
 by smtp.gmail.com with ESMTPSA id e17sm12339800iow.18.2021.11.09.09.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 09:26:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 10:25:15 -0700
Message-Id: <20211109172515.3342499-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: fix async_timeout
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...timeout-version-for-aiohttp-3.8-5299.patch | 306 ++++++++++++++++++
 1 file changed, 306 insertions(+)
 create mode 100644 package/python-aiohttp/0001-Bump-async-timeout-version-for-aiohttp-3.8-5299.patch

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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
