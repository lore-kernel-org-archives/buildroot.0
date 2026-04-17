Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C24F436BA
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91301813C6;
	Fri, 17 Apr 2026 15:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KNGE5EvyW7a; Fri, 17 Apr 2026 15:25:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88E7A81399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439503;
	bh=oG2pZ+UJ/kpeCXA2gcQWNIO33uOCkrJw4kseAmZLtsw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iBA/DWaRxxjHdgpbTggwK18YLH4dF7SCXbCdXzehaw2gCxH9nKdXrjFhj6XcF6fVC
	 IwVEl3Fi9sG4X3fUYGhtO5WA73N90Oi3D5vNH76nzHXIssuO3X6R7nqf+tC05Lsc1d
	 2VPl6uz7ZqMjkcuy2E2V6/FkCYkgE1BcEX4peeTymkVppVPLR1RdRfULgSDGzj1CDt
	 B0GNkTPYwEbmTWuK4/ttUZLjGuSnqnEQZ7lS8fLz3/5m0T+56Lm+8IoHFz151Dhywb
	 LmUckxLeRw73LUDmQuFRXcgrvyyVVIHfYeNQopN51Psd7Dtr+JjpLWnCZCAsX0nXqm
	 ajm3ry2BPb6Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88E7A81399;
	Fri, 17 Apr 2026 15:25:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2524C259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D5E6813A3
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D7wTtxptMvVB for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:25:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07F4E81348
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07F4E81348
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07F4E81348
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:58 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43fe608cb92so474816f8f.2
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439497; x=1777044297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dCm0POcztnLDPch6Pg1zqrk2wbmaNzV85PiZPk2QmzI=;
 b=LxqNtBnqdo3agFOV6waRid6V9zJPq5lzWdonzyg97oFcsr8bqgrKJEGO/FIUbM7LNA
 z9NpPMpOx1jMoade9jc3XKIOrZ8QpuPT4sNOW9P6i2TRgw5eIJDDG+kfFWpm1WWRz4iz
 8Ei7qJdwrZnaFN8ij3IMmVsnIwTjx+G2HKHffszEWJrU4ZgqHpN4rL8YPBD7RpE/NqX9
 4r5ZIi/QI2j93SOY9cK2lN8yPu4OVFIFCFU5AsdHdiaR6lQcOxLfXmXSsjMhyNNKhWuF
 JDJ5Q5E4RTfZDoY/tsik/U6iJC5752+8FtHhq9sRgBhokBtXBoFOoj/7pm0Pw+151F6l
 YWtw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+h0EAFpPvg/rzLFKSaucmi6PL9QrE5HH9w38dWIhhIXkxufOGpSzcjlpixhgT74d10S+ECWZXv2M8=@buildroot.org
X-Gm-Message-State: AOJu0YyVUpiNwllrlz+i+ugAL43x/XZDM5v3DwPwcB0p2a+hBGOaE+G1
 7iiZwfxZqKUoIyrUqpLjravK5qvqigcZNj12OA4xukPx4nRdBNqDzUhawLTnjOkM1M8=
X-Gm-Gg: AeBDieuznvPwVWeIwGPsud211+9vLaQoA/jcZs9InCILO8vB5UuS8IYGcI5pFd7SaI1
 WZo5Yz98Sf1P3RLOswX5oYXFRcXxRM8asgS+EsmiFpzyAcjuJEgI64jw84xyBZPeQZh7WEyTVnI
 PBz2JA4fxaLR4/q9rCfKV0jqUlzDOaDY6iCBeRKm/+dkLI79gFtEXbPiO7Q/r/p0r3ofpCb5Jo9
 D1IhB2AOkSAY42jfhlUMD8xiUy3Yw/1QAzl5ekClQvYFPhA2Vzr3/IcdetiCz6uC2B5v49h+M4O
 FK0+URb90i3u4gLljJ4i+zfzDpL+eg0RXg9WwMN/OZZ4Qhfh8FoU83/EEDt6lvAaS1KcxpD1pON
 MjgRXNknshxjK+HhWAmypSP3gRxiKwFeqNN5gysLc4PbGi/6lcR9vVc3eLhcgwbyebAWfxUTTXR
 B/sDcWU32D72jyQ0F4wHusCMLVCRMpo9JQT54y/g==
X-Received: by 2002:a05:6000:2890:b0:43d:7aa8:f64e with SMTP id
 ffacd0b85a97d-43fe3e0a2c4mr5382183f8f.32.1776439496880; 
 Fri, 17 Apr 2026 08:24:56 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a341sm5740845f8f.24.2026.04.17.08.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:24:56 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:24:56 +0200
Message-ID: <20260417152456.313457-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409131728.278764-1-bernd@kuhls.net>
References: <20260409131728.278764-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439497; x=1777044297; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dCm0POcztnLDPch6Pg1zqrk2wbmaNzV85PiZPk2QmzI=;
 b=Don8/dLYax9EjG/8cKvX/qDZvmRGDFpRm/mWupw4rfonmu+7yY8eGqyoCmuc94KVo/
 t65RVSZzxzydH5QKu1LUj2Jt68KJe4e1Xc6fPPoP+TWx/dqUIpyLDizi5hYVk6P886Xh
 58KrNeyw0R7bI8F9QZkre5wIY3BeBhdKj6KYu9jBz8anFgnlBm6MB2YbAH3Qv/c+Lv6M
 QV0Iuw/kyRRB0ZcmNRNjoFczcFMGnPJM2jFAzSoKsowoX/q/P6r+15OTTIfqHMDFGQrL
 jFriAO8NsIDXqbIN8IBlqKCuBQzuYa6icNFL30Evb0ddeTx17M6x5RoqwUG+Kz9/ZEF+
 3h8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Don8/dLY
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: security bump version
 to 3.14.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://www.python.org/downloads/release/python-3144/
> https://docs.python.org/release/3.14.4/whatsnew/changelog.html
> 
> Fixes
> CVE 2026-4224: https://www.cve.org/CVERecord?id=CVE-2026-4224
> CVE 2026-3644: https://www.cve.org/CVERecord?id=CVE-2026-3644
> CVE 2026-2297: https://www.cve.org/CVERecord?id=CVE-2026-2297
> 
> Rebased patch 0010 due to upstream commit
> https://github.com/python/cpython/commit/616e6118442832544fab0b93e9dd7d15411a2a58
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  ...-Fix-compilation-of-Modules-_remote_debuggi.patch | 12 ++++++------
>  package/python3/python3.hash                         |  4 ++--
>  package/python3/python3.mk                           |  2 +-
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
> index 716d9d3e8a..b000a68e9b 100644
> --- a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
> +++ b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
> @@ -7,7 +7,7 @@ Subject: [PATCH] gh-139275: Fix compilation of
>  
>  Upstream: https://github.com/python/cpython/commit/1963e701001839389cfb1b11d803b0743f4705d7
>  
> -[ Bernd Kuhls: ported to Python 3.14.2]
> +[ Bernd Kuhls: ported to Python 3.14.4]
>  [ Vincent Fazio: update to apply cleanly to 3.14.3 ]
>  Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  ---
> @@ -29,28 +29,28 @@ diff --git a/Modules/_remote_debugging_module.c b/Modules/_remote_debugging_modu
>  index b46538b76df..e86a27d5812 100644
>  --- a/Modules/_remote_debugging_module.c
>  +++ b/Modules/_remote_debugging_module.c
> -@@ -812,7 +812,7 @@ _Py_RemoteDebug_GetAsyncioDebugAddress(proc_handle_t* handle)
> +@@ -834,7 +834,7 @@ _Py_RemoteDebug_GetAsyncioDebugAddress(proc_handle_t* handle)
>           PyErr_SetString(PyExc_RuntimeError, "Failed to find the AsyncioDebug section in the process.");
>           _PyErr_ChainExceptions1(exc);
>       }
>  -#elif defined(__linux__)
>  +#elif defined(__linux__) && HAVE_PROCESS_VM_READV
>       // On Linux, search for asyncio debug in executable or DLL
> -     address = search_linux_map_for_section(handle, "AsyncioDebug", "_asyncio.cpython");
> +     address = search_linux_map_for_section(handle, "AsyncioDebug", "_asyncio.cpython", NULL);
>       if (address == 0) {
>  diff --git a/Python/remote_debug.h b/Python/remote_debug.h
>  index 8f9b6cd4c49..b7d17a0f345 100644
>  --- a/Python/remote_debug.h
>  +++ b/Python/remote_debug.h
> -@@ -886,7 +886,7 @@ _Py_RemoteDebug_GetPyRuntimeAddress(proc_handle_t* handle)
> +@@ -923,7 +923,7 @@
>               handle->pid);
>           _PyErr_ChainExceptions1(exc);
>       }
>  -#elif defined(__linux__)
>  +#elif defined(__linux__) && HAVE_PROCESS_VM_READV
>       // On Linux, search for 'python' in executable or DLL
> -     address = search_linux_map_for_section(handle, "PyRuntime", "python");
> -     if (address == 0) {
> +     address = search_linux_map_for_section(handle, "PyRuntime", "python",
> +                                            _Py_RemoteDebug_ValidatePyRuntimeCookie);
>  -- 
>  2.47.3
>  
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index b674b589bd..13e2b94336 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,4 +1,4 @@
> -# From https://www.python.org/downloads/release/python-3143/
> -sha256  a97d5549e9ad81fe17159ed02c68774ad5d266c72f8d9a0b5a9c371fe85d902b  Python-3.14.3.tar.xz
> +# From https://www.python.org/downloads/release/python-3144/
> +sha256  d923c51303e38e249136fc1bdf3568d56ecb03214efdef48516176d3d7faaef8  Python-3.14.4.tar.xz
>  # Locally computed
>  sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 07cba7c02d..c71cb0b05b 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PYTHON3_VERSION_MAJOR = 3.14
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
>  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>  PYTHON3_LICENSE = Python-2.0, others
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
