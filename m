Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F2FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 19:55:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D095561BBD
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 19:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D095561BBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95CD94022F;
	Tue, 16 Nov 2021 19:55:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6jLZRNXQ9Vsy; Tue, 16 Nov 2021 19:55:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8584D4023F;
	Tue, 16 Nov 2021 19:55:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 134271BF298
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 19:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0145C4023F
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 19:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s1If8Z6_1ibe for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 19:55:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A99A34022F
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 19:55:53 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z10so66473169edc.11
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 11:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=M1T2jlSvYLow4v0nmEpGK7HSQDtlK6Gz4ed0m6DlLi4=;
 b=LdmTEfgT3E0Bg/z0T0ixv6eXNGkWMf6L967GXsYeMLmD+CWoDDqE8X6ygT7HlECfw9
 UCXiHd+44XaLXw6sce65jEkoVwr9gaZfsSNtDhsooqmJVqwOKj2xJHPX+qba446kFg0n
 eVco3sHzL9ZpnDlY5ipJjicohvBqXraWjE02zJt5GfMwHyrxEYj7QbamT96/JbxKMlzx
 OpsQxS8QkOyF1gv5jBIcEy9mbICnGCSOneKsKBXl7yeclVd+YmeDDBatAyBYLRnHVqrf
 lngp/q2yKkbCP4sFclA2gx3JlkFmIlIv5DFL06NcJRmNvzThcFMlJXKDMBNJ9g0pvPxx
 0Q9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=M1T2jlSvYLow4v0nmEpGK7HSQDtlK6Gz4ed0m6DlLi4=;
 b=XQr3W7O1WUeXNzJWhyHpcbq5+o3PUSW++pwqzmv+RkPo2TTZdTfiNmbT4jFSC7uyCG
 7tRIQYURAs/TiOAVUk0dzYAXnG/0sZqhfoTktapmYWLEfu9lMED6UfEwo3JxYqqnNSaP
 R/xb0JuCb8Algbd7ejZYwV0VnoQMtlBF1O9sJYSdrLJGhWcGdnztXFaq6UWUOOB4U96e
 6nytmJ3hymKwEjJ7G5UgoNSp163QfNeurlz/5lWWJW06c7Yf+7gn5Axn3RvuzkIgDvLE
 u9ff2wzjarnhezuoNIQdR3WWli7YB2AC2ROxC2xi8TUGf3yccCpOoHI4cPfgk2hYKiqm
 RZsA==
X-Gm-Message-State: AOAM533FEXWQqp/zJQKx54rCOQzjgN9kXl5sGT/Nzr1nKBIZ+V63MoMV
 gbGEL3pFg6iycygtO82TUCLEDFcsu/Q1XQ==
X-Google-Smtp-Source: ABdhPJwTZlCiOzgFfB9bFxT/98EwRtLD7kZ01DImrrU4LTybT021xcaMqq5UkkjmHdv6FgNMOFU2pQ==
X-Received: by 2002:aa7:ccc1:: with SMTP id y1mr13317458edt.177.1637092551605; 
 Tue, 16 Nov 2021 11:55:51 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id sb19sm9139262ejc.120.2021.11.16.11.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 11:55:50 -0800 (PST)
Message-ID: <09a3c78d-bbc4-7c2d-bd69-02bc0b1c07e1@mind.be>
Date: Tue, 16 Nov 2021 20:55:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211109172515.3342499-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211109172515.3342499-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp: fix
 async_timeout 4.0.0 compatibility
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/11/2021 18:25, James Hilliard wrote:
> We need to backport an upstream patch adding async_timeout 4.0.0
> compatibility since we are still on aiohttp version 3.7.4.post0.
> 
> Fixes:
>>>> import aiohttp
> Traceback (most recent call last):
>    File "<stdin>", line 1, in <module>
>    File "/usr/lib/python3.9/site-packages/aiohttp/__init__.py", line 6, in <module>
>    File "/usr/lib/python3.9/site-packages/aiohttp/client.py", line 35, in <module>
>    File "/usr/lib/python3.9/site-packages/aiohttp/http.py", line 7, in <module>
>    File "/usr/lib/python3.9/site-packages/aiohttp/http_parser.py", line 15, in <module>
>    File "/usr/lib/python3.9/site-packages/aiohttp/helpers.py", line 667, in <module>
> TypeError: function() argument 'code' must be code, not str
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...timeout-version-for-aiohttp-3.8-5299.patch | 306 ++++++++++++++++++
>   1 file changed, 306 insertions(+)
>   create mode 100644 package/python-aiohttp/0001-Bump-async-timeout-version-for-aiohttp-3.8-5299.patch
> 
> diff --git a/package/python-aiohttp/0001-Bump-async-timeout-version-for-aiohttp-3.8-5299.patch b/package/python-aiohttp/0001-Bump-async-timeout-version-for-aiohttp-3.8-5299.patch
> new file mode 100644
> index 0000000000..95042b713e
> --- /dev/null
> +++ b/package/python-aiohttp/0001-Bump-async-timeout-version-for-aiohttp-3.8-5299.patch
> @@ -0,0 +1,306 @@
> +From 572db464d3b5123e433759411a0c8796ea9fb5c9 Mon Sep 17 00:00:00 2001
> +From: Andrew Svetlov <andrew.svetlov@gmail.com>
> +Date: Sun, 29 Nov 2020 15:12:15 +0200
> +Subject: [PATCH] Bump async-timeout version for aiohttp 3.8 (#5299)
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[james.hilliard1@gmail.com: backport from upstream commit
> +1e6ec85e709db083d240c5ca249660d0fa56c61c]
> +---
> + aiohttp/client.py                  |  4 +--
> + aiohttp/client_ws.py               |  6 ++--
> + aiohttp/connector.py               | 15 ++++++---
> + aiohttp/helpers.py                 | 25 ++++++---------
> + aiohttp/web_protocol.py            |  6 ++--
> + aiohttp/web_ws.py                  |  6 ++--
> + setup.py                           |  2 +-
> + tests/test_client_ws_functional.py |  2 +-
> + tests/test_helpers.py              | 49 +++++++-----------------------
> + 10 files changed, 44 insertions(+), 73 deletions(-)
> +
> +diff --git a/aiohttp/client.py b/aiohttp/client.py
> +index a9da8e15..2c87eb52 100644
> +--- a/aiohttp/client.py
> ++++ b/aiohttp/client.py
> +@@ -74,8 +74,8 @@ from .helpers import (
> +     DEBUG,
> +     PY_36,
> +     BasicAuth,
> +-    CeilTimeout,
> +     TimeoutHandle,
> ++    ceil_timeout,
> +     get_running_loop,
> +     proxies_from_env,
> +     sentinel,
> +@@ -515,7 +515,7 @@ class ClientSession:
> +
> +                     # connection timeout
> +                     try:
> +-                        with CeilTimeout(real_timeout.connect, loop=self._loop):
> ++                        async with ceil_timeout(real_timeout.connect):
> +                             assert self._connector is not None
> +                             conn = await self._connector.connect(
> +                                 req, traces=traces, timeout=real_timeout
> +diff --git a/aiohttp/client_ws.py b/aiohttp/client_ws.py
> +index 28fa371c..a4c7371f 100644
> +--- a/aiohttp/client_ws.py
> ++++ b/aiohttp/client_ws.py
> +@@ -191,7 +191,7 @@ class ClientWebSocketResponse:
> +
> +             while True:
> +                 try:
> +-                    with async_timeout.timeout(self._timeout, loop=self._loop):
> ++                    async with async_timeout.timeout(self._timeout):
> +                         msg = await self._reader.read()
> +                 except asyncio.CancelledError:
> +                     self._close_code = 1006
> +@@ -224,9 +224,7 @@ class ClientWebSocketResponse:
> +             try:
> +                 self._waiting = self._loop.create_future()
> +                 try:
> +-                    with async_timeout.timeout(
> +-                        timeout or self._receive_timeout, loop=self._loop
> +-                    ):
> ++                    async with async_timeout.timeout(timeout or self._receive_timeout):
> +                         msg = await self._reader.read()
> +                     self._reset_heartbeat()
> +                 finally:
> +diff --git a/aiohttp/connector.py b/aiohttp/connector.py
> +index 748b22a4..77a4f379 100644
> +--- a/aiohttp/connector.py
> ++++ b/aiohttp/connector.py
> +@@ -44,7 +44,14 @@ from .client_exceptions import (
> + )
> + from .client_proto import ResponseHandler
> + from .client_reqrep import ClientRequest, Fingerprint, _merge_ssl_params
> +-from .helpers import PY_36, CeilTimeout, get_running_loop, is_ip_address, noop, sentinel
> ++from .helpers import (
> ++    PY_36,
> ++    ceil_timeout,
> ++    get_running_loop,
> ++    is_ip_address,
> ++    noop,
> ++    sentinel,
> ++)
> + from .http import RESPONSES
> + from .locks import EventResultOrError
> + from .resolver import DefaultResolver
> +@@ -965,7 +972,7 @@ class TCPConnector(BaseConnector):
> +         **kwargs: Any,
> +     ) -> Tuple[asyncio.Transport, ResponseHandler]:
> +         try:
> +-            with CeilTimeout(timeout.sock_connect):
> ++            async with ceil_timeout(timeout.sock_connect):
> +                 return await self._loop.create_connection(*args, **kwargs)  # type: ignore  # noqa
> +         except cert_errors as exc:
> +             raise ClientConnectorCertificateError(req.connection_key, exc) from exc
> +@@ -1189,7 +1196,7 @@ class UnixConnector(BaseConnector):
> +         self, req: "ClientRequest", traces: List["Trace"], timeout: "ClientTimeout"
> +     ) -> ResponseHandler:
> +         try:
> +-            with CeilTimeout(timeout.sock_connect):
> ++            async with ceil_timeout(timeout.sock_connect):
> +                 _, proto = await self._loop.create_unix_connection(
> +                     self._factory, self._path
> +                 )
> +@@ -1245,7 +1252,7 @@ class NamedPipeConnector(BaseConnector):
> +         self, req: "ClientRequest", traces: List["Trace"], timeout: "ClientTimeout"
> +     ) -> ResponseHandler:
> +         try:
> +-            with CeilTimeout(timeout.sock_connect):
> ++            async with ceil_timeout(timeout.sock_connect):
> +                 _, proto = await self._loop.create_pipe_connection(  # type: ignore
> +                     self._factory, self._path
> +                 )
> +diff --git a/aiohttp/helpers.py b/aiohttp/helpers.py
> +index bbf5f129..a6b14025 100644
> +--- a/aiohttp/helpers.py
> ++++ b/aiohttp/helpers.py
> +@@ -664,21 +664,16 @@ class TimerContext(BaseTimerContext):
> +             self._cancelled = True
> +
> +
> +-class CeilTimeout(async_timeout.timeout):
> +-    def __enter__(self) -> async_timeout.timeout:
> +-        if self._timeout is not None:
> +-            self._task = current_task(loop=self._loop)
> +-            if self._task is None:
> +-                raise RuntimeError(
> +-                    "Timeout context manager should be used inside a task"
> +-                )
> +-            now = self._loop.time()
> +-            delay = self._timeout
> +-            when = now + delay
> +-            if delay > 5:
> +-                when = ceil(when)
> +-            self._cancel_handler = self._loop.call_at(when, self._cancel_task)
> +-        return self
> ++def ceil_timeout(delay: Optional[float]) -> async_timeout.Timeout:
> ++    if delay is None:
> ++        return async_timeout.timeout(None)
> ++    else:
> ++        loop = get_running_loop()
> ++        now = loop.time()
> ++        when = now + delay
> ++        if delay > 5:
> ++            when = ceil(when)
> ++        return async_timeout.timeout_at(when)
> +
> +
> + class HeadersMixin:
> +diff --git a/aiohttp/web_protocol.py b/aiohttp/web_protocol.py
> +index 8e02bc4a..16f4d4ef 100644
> +--- a/aiohttp/web_protocol.py
> ++++ b/aiohttp/web_protocol.py
> +@@ -13,7 +13,7 @@ import yarl
> +
> + from .abc import AbstractAccessLogger, AbstractStreamWriter
> + from .base_protocol import BaseProtocol
> +-from .helpers import CeilTimeout, current_task
> ++from .helpers import ceil_timeout, current_task
> + from .http import (
> +     HttpProcessingError,
> +     HttpRequestParser,
> +@@ -228,7 +228,7 @@ class RequestHandler(BaseProtocol):
> +
> +         # wait for handlers
> +         with suppress(asyncio.CancelledError, asyncio.TimeoutError):
> +-            with CeilTimeout(timeout, loop=self._loop):
> ++            async with ceil_timeout(timeout):
> +                 if self._error_handler is not None and not self._error_handler.done():
> +                     await self._error_handler
> +
> +@@ -517,7 +517,7 @@ class RequestHandler(BaseProtocol):
> +
> +                         with suppress(asyncio.TimeoutError, asyncio.CancelledError):
> +                             while not payload.is_eof() and now < end_t:
> +-                                with CeilTimeout(end_t - now, loop=loop):
> ++                                async with ceil_timeout(end_t - now):
> +                                     # read and ignore
> +                                     await payload.readany()
> +                                 now = loop.time()
> +diff --git a/aiohttp/web_ws.py b/aiohttp/web_ws.py
> +index da7ce6df..5f3cce56 100644
> +--- a/aiohttp/web_ws.py
> ++++ b/aiohttp/web_ws.py
> +@@ -359,7 +359,7 @@ class WebSocketResponse(StreamResponse):
> +             reader = self._reader
> +             assert reader is not None
> +             try:
> +-                with async_timeout.timeout(self._timeout, loop=self._loop):
> ++                async with async_timeout.timeout(self._timeout):
> +                     msg = await reader.read()
> +             except asyncio.CancelledError:
> +                 self._close_code = 1006
> +@@ -400,9 +400,7 @@ class WebSocketResponse(StreamResponse):
> +             try:
> +                 self._waiting = loop.create_future()
> +                 try:
> +-                    with async_timeout.timeout(
> +-                        timeout or self._receive_timeout, loop=self._loop
> +-                    ):
> ++                    async with async_timeout.timeout(timeout or self._receive_timeout):
> +                         msg = await self._reader.read()
> +                     self._reset_heartbeat()
> +                 finally:
> +diff --git a/setup.py b/setup.py
> +index 54462ba7..c262de1e 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -68,7 +68,7 @@ install_requires = [
> +     "attrs>=17.3.0",
> +     "chardet>=2.0,<5.0",
> +     "multidict>=4.5,<7.0",
> +-    "async_timeout>=3.0,<4.0",
> ++    "async_timeout>=4.0.0a3,<5.0",
> +     "yarl>=1.0,<2.0",
> +     'idna-ssl>=1.0; python_version<"3.7"',
> +     "typing_extensions>=3.6.5",
> +diff --git a/tests/test_client_ws_functional.py b/tests/test_client_ws_functional.py
> +index e423765a..76ef0525 100644
> +--- a/tests/test_client_ws_functional.py
> ++++ b/tests/test_client_ws_functional.py
> +@@ -461,7 +461,7 @@ async def test_recv_timeout(aiohttp_client) -> None:
> +     await resp.send_str("ask")
> +
> +     with pytest.raises(asyncio.TimeoutError):
> +-        with async_timeout.timeout(0.01):
> ++        async with async_timeout.timeout(0.01):
> +             await resp.receive()
> +
> +     await resp.close()
> +diff --git a/tests/test_helpers.py b/tests/test_helpers.py
> +index 3367c24b..d36c7e4c 100644
> +--- a/tests/test_helpers.py
> ++++ b/tests/test_helpers.py
> +@@ -3,7 +3,6 @@ import base64
> + import gc
> + import os
> + import platform
> +-import sys
> + import tempfile
> + from math import isclose, modf
> + from unittest import mock
> +@@ -391,48 +390,22 @@ async def test_weakref_handle_weak(loop) -> None:
> +     await asyncio.sleep(0.1)
> +
> +
> +-def test_ceil_call_later() -> None:
> +-    cb = mock.Mock()
> +-    loop = mock.Mock()
> +-    loop.time.return_value = 10.1
> +-    helpers.call_later(cb, 10.1, loop)
> +-    loop.call_at.assert_called_with(21.0, cb)
> +-
> +-
> +-def test_ceil_call_later_no_timeout() -> None:
> +-    cb = mock.Mock()
> +-    loop = mock.Mock()
> +-    helpers.call_later(cb, 0, loop)
> +-    assert not loop.call_at.called
> +-
> +-
> +-async def test_ceil_timeout(loop) -> None:
> +-    with helpers.CeilTimeout(None, loop=loop) as timeout:
> +-        assert timeout._timeout is None
> +-        assert timeout._cancel_handler is None
> ++async def test_ceil_timeout() -> None:
> ++    async with helpers.ceil_timeout(None) as timeout:
> ++        assert timeout.deadline is None
> +
> +
> +-def test_ceil_timeout_no_task(loop) -> None:
> +-    with pytest.raises(RuntimeError):
> +-        with helpers.CeilTimeout(10, loop=loop):
> +-            pass
> +-
> +-
> +-@pytest.mark.skipif(
> +-    sys.version_info < (3, 7), reason="TimerHandle.when() doesn't exist"
> +-)
> +-async def test_ceil_timeout_round(loop) -> None:
> +-    with helpers.CeilTimeout(7.5, loop=loop) as cm:
> +-        frac, integer = modf(cm._cancel_handler.when())
> ++async def test_ceil_timeout_round() -> None:
> ++    async with helpers.ceil_timeout(7.5) as cm:
> ++        assert cm.deadline is not None
> ++        frac, integer = modf(cm.deadline)
> +         assert frac == 0
> +
> +
> +-@pytest.mark.skipif(
> +-    sys.version_info < (3, 7), reason="TimerHandle.when() doesn't exist"
> +-)
> +-async def test_ceil_timeout_small(loop) -> None:
> +-    with helpers.CeilTimeout(1.1, loop=loop) as cm:
> +-        frac, integer = modf(cm._cancel_handler.when())
> ++async def test_ceil_timeout_small() -> None:
> ++    async with helpers.ceil_timeout(1.1) as cm:
> ++        assert cm.deadline is not None
> ++        frac, integer = modf(cm.deadline)
> +         # a chance for exact integer with zero fraction is negligible
> +         assert frac != 0
> +
> +--
> +2.25.1
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
