Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F616CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 062FE41B92;
	Fri, 15 May 2026 13:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ol1jCxS1kW6U; Fri, 15 May 2026 13:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DD3941B9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852016;
	bh=ktuRIaNZ3UHnD6xu6Dx2TDYIqaPYMH2zh7ql6LIM+6s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Itkha4r4UVfTsH+9zIon21yXqzwt1cbKGKQ7ttstta/pnJxD/1V6SY3p0svLEIwEa
	 Nj9QnoXIhRtJKg4dsMpErExtnMJVcd1Q8DabGI4TR6umT7WlwqUjTKdr5GSba7+8r5
	 IqcUtyhwRtDzIyJn3ND10QmER9OQrWPdsxo377TmUO1XxwODZBjmX7Et4lCUAzntow
	 MWOw/MoR33Rds1iDguX/yqJRilXQbrZ8wqfFANcCs62JX1geR1zXC617D8SMlpFIsa
	 JhEqnSbTpci8V/EGNlqgI2zVtMmiHSl9bGXcrSaDd9Krt3CyrCEtTVfRhcSj3+GBhZ
	 WUALTbcNLOWWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DD3941B9A;
	Fri, 15 May 2026 13:33:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FBD836E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2583941B9A
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VW2eBAyPirE2 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:33:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB40F41B40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB40F41B40
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB40F41B40
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:33 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so101953315e9.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852012; x=1779456812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7JxO/hLqMHKU0apcupNkPWjwzvzYMX0cu3oNwnAClJc=;
 b=bVUSqTws2CzV77c8aTBSrj6UGqmpUl6Jt4uf5MpeHWU2UdgqoI6tUEX5YvQaDQmlew
 FiYLl4s9kVDv9K025zvx9JjObsdktMYgN6ADHJAgNbCwXklunyaC9DZTvrHXyXRvYEGH
 bdjOu98gJOoO4XAhNORc88ZvAWkpa9ugrVPC0OvcOPuTAuqqkSiYJTmVGSNtgrLJ9fLx
 s2UnaI4poBkQjn5PsT1/a7GOGeBtIMqJAjSCqqHupBz3xa5DLwOVffj3Ci+m1KB5QZHQ
 QVUtQWC4pW2JFSq9I/ZJTXTVPqBQu0ckpGrUMG2l7RRxnYKs4Ph+n1llRyZbSqahnZVH
 8RbA==
X-Gm-Message-State: AOJu0YxKipCeK6w5IHriwqs6nJCgsfjaphhhfloVlZ4JzXv/GoFHl/pB
 sKwhai3X5j9swxTCxONazn7ai/srBoee2kdfvpdnX95O3k5OIu5M/n4M7g6YWAy4x7uMWkvCEFY
 r2SRE
X-Gm-Gg: Acq92OEx2ZiP/keVBZo73zfQoMTwBjIQHKHtxCd96Qlmfmmu+OQKZUs1lEHmuyAq2QS
 DxOA2AaZjy74+Ji/SXs8XeSCFM//MrVARxmE1Yytj9LamF0cjo+RIM4PUSp3i3E0GKZe2ePFTRH
 gvp5bECILyLFzyZEqoLUc8vn6svCIjpPVY9uJqTIo9NkWAmjC/yOuoQV/KtYLYnpuRdorlXBOb+
 oM+KiZH+CFqABNzY1eLPmpUwk1EzDzs7V/S4+KP+gy6tjLoQrQIMaYhEd7i07KWUCO2PX9MtGpE
 zojDZuH29J0twL3DHH0eaRPA5FChhOPOVuh9DBzk+COa0yX5xzcM9kvDV8FgtihLKW9L9XE0rDW
 Y982cpQNdVD1TuZFM4Y3mtEQm+DHhtRYDBDpaP6lpXR5g4+WD23WIfkczE/5h+isGWbD7IfgTZC
 tt40KDY60V2B8AlSBUvaZRuXGbRMld5zS+LSVfzzPDrrg6
X-Received: by 2002:a05:600c:46cf:b0:48e:8974:c377 with SMTP id
 5b1f17b1804b1-48fe6626ba1mr54540475e9.29.1778852011610; 
 Fri, 15 May 2026 06:33:31 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe6b60csm19720805e9.6.2026.05.15.06.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:33:30 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 15 May 2026 15:33:30 +0200
Message-ID: <20260515133330.315259-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513103913.419755-3-thomas.perale@mind.be>
References: <20260513103913.419755-3-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852012; x=1779456812; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7JxO/hLqMHKU0apcupNkPWjwzvzYMX0cu3oNwnAClJc=;
 b=dMUM8GEy0EOxT49Ua72gCa+bewgmpO0RJamGnVqwptes3AbQlXiNgowwi42kxVRlGw
 8d609dIPJaobCSVnxtNa3aFMQfPlmwoopW6CWfG29r397R5rDsGa8AsHBbi1h1sKvA8/
 ZXyTzbz765aA+y1T2GvrzrocfP4pH6Pm0OSaurF4nU3pGIXIVCRSWYAwAyQ1MeS9lplG
 6B4jJdaihi5yN1W2ZtAvB4ZhukjzV5Sw/SukqUlj6IuVNyICOmZof9vFb9nLuVIIndkn
 WSNTYV01pov3q6QuR8hVlUubFrWJgN6ackA6gB/UBDSLqPcpQWwMvXj0byVPkghtlIBG
 0xsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dMUM8GEy
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/python-pyopenssl: patch
 CVE-2026-274{48, 59}
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
> - CVE-2026-27448:
>     pyOpenSSL is a Python wrapper around the OpenSSL library. Starting in
>     version 0.14.0 and prior to version 26.0.0, if a user provided
>     callback to `set_tlsext_servername_callback` raised an unhandled
>     exception, this would result in a connection being accepted. If a user
>     was relying on this callback for any security-sensitive behavior, this
>     could allow bypassing it. Starting in version 26.0.0, unhandled
>     exceptions now result in rejecting the connection.
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-27448
>  - https://github.com/pyca/pyopenssl/commit/d41a814759a9fb49584ca8ab3f7295de49a85aa0
> 
> - CVE-2026-27459:
>     pyOpenSSL is a Python wrapper around the OpenSSL library. Starting in
>     version 22.0.0 and prior to version 26.0.0, if a user provided
>     callback to `set_cookie_generate_callback` returned a cookie value
>     greater than 256 bytes, pyOpenSSL would overflow an OpenSSL provided
>     buffer. Starting in version 26.0.0, cookie values that are too long
>     are now rejected.
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-27459
>  - https://github.com/pyca/pyopenssl/commit/57f09bb4bb051d3bc2a1abd36e9525313d5cd408
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  .../0001-CVE-2026-27448.patch                 | 50 +++++++++++++++++++
>  .../0002-CVE-2026-27459.patch                 | 46 +++++++++++++++++
>  package/python-pyopenssl/python-pyopenssl.mk  |  6 +++
>  3 files changed, 102 insertions(+)
>  create mode 100644 package/python-pyopenssl/0001-CVE-2026-27448.patch
>  create mode 100644 package/python-pyopenssl/0002-CVE-2026-27459.patch
> 
> diff --git a/package/python-pyopenssl/0001-CVE-2026-27448.patch b/package/python-pyopenssl/0001-CVE-2026-27448.patch
> new file mode 100644
> index 0000000000..e2940fc168
> --- /dev/null
> +++ b/package/python-pyopenssl/0001-CVE-2026-27448.patch
> @@ -0,0 +1,50 @@
> +From d41a814759a9fb49584ca8ab3f7295de49a85aa0 Mon Sep 17 00:00:00 2001
> +From: Alex Gaynor <alex.gaynor@gmail.com>
> +Date: Mon, 16 Feb 2026 21:04:37 -0500
> +Subject: [PATCH] Handle exceptions in set_tlsext_servername_callback callbacks
> + (#1478)
> +
> +When the servername callback raises an exception, call sys.excepthook
> +with the exception info and return SSL_TLSEXT_ERR_ALERT_FATAL to abort
> +the handshake. Previously, exceptions would propagate uncaught through
> +the CFFI callback boundary.
> +
> +https://claude.ai/code/session_01P7y1XmWkdtC5UcmZwGDvGi
> +
> +Co-authored-by: Claude <noreply@anthropic.com>
> +
> +Upstream: https://github.com/pyca/pyopenssl/commit/d41a814759a9fb49584ca8ab3f7295de49a85aa0
> +CVE: CVE-2026-27448
> +[thomas: backported, stripped tests and changelog]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/OpenSSL/SSL.py |  7 ++++++-
> + 1 files changed, 7 insertions(+)
> + 
> +diff --git a/src/OpenSSL/SSL.py b/src/OpenSSL/SSL.py
> +index 4db5240..a6263c4 100644
> +--- a/src/OpenSSL/SSL.py
> ++++ b/src/OpenSSL/SSL.py
> +@@ -2,6 +2,7 @@
> + 
> + import os
> + import socket
> ++import sys
> + import typing
> + import warnings
> + from collections.abc import Sequence
> +@@ -1686,7 +1687,11 @@ class Context:
> + 
> +         @wraps(callback)
> +         def wrapper(ssl, alert, arg):  # type: ignore[no-untyped-def]
> +-            callback(Connection._reverse_mapping[ssl])
> ++            try:
> ++                callback(Connection._reverse_mapping[ssl])
> ++            except Exception:
> ++                sys.excepthook(*sys.exc_info())
> ++                return _lib.SSL_TLSEXT_ERR_ALERT_FATAL
> +             return 0
> + 
> +         self._tlsext_servername_callback = _ffi.callback(
> +-- 
> +2.43.0
> diff --git a/package/python-pyopenssl/0002-CVE-2026-27459.patch b/package/python-pyopenssl/0002-CVE-2026-27459.patch
> new file mode 100644
> index 0000000000..586c443093
> --- /dev/null
> +++ b/package/python-pyopenssl/0002-CVE-2026-27459.patch
> @@ -0,0 +1,46 @@
> +From 57f09bb4bb051d3bc2a1abd36e9525313d5cd408 Mon Sep 17 00:00:00 2001
> +From: Alex Gaynor <alex.gaynor@gmail.com>
> +Date: Wed, 18 Feb 2026 07:46:15 -0500
> +Subject: [PATCH] Fix buffer overflow in DTLS cookie generation callback
> + (#1479)
> +
> +The cookie generate callback copied user-returned bytes into a
> +fixed-size native buffer without enforcing a maximum length. A
> +callback returning more than DTLS1_COOKIE_LENGTH bytes would overflow
> +the OpenSSL-provided buffer, corrupting adjacent memory.
> +
> +Co-authored-by: Claude Opus 4.6 <noreply@anthropic.com>
> +
> +Upstream: https://github.com/pyca/pyopenssl/commit/57f09bb4bb051d3bc2a1abd36e9525313d5cd408
> +CVE: CVE-2026-27459
> +[thomas: backported, stripped tests and changelog]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/OpenSSL/SSL.py |  7 +++++++
> + 1 files changed, 7 insertions(+)
> + 
> +diff --git a/src/OpenSSL/SSL.py b/src/OpenSSL/SSL.py
> +index a6263c4..2e4da78 100644
> +--- a/src/OpenSSL/SSL.py
> ++++ b/src/OpenSSL/SSL.py
> +@@ -716,11 +716,18 @@ class _CookieGenerateCallbackHelper(_CallbackExceptionHelper):
> +     def __init__(self, callback: _CookieGenerateCallback) -> None:
> +         _CallbackExceptionHelper.__init__(self)
> + 
> ++        max_cookie_len = getattr(_lib, "DTLS1_COOKIE_LENGTH", 255)
> ++
> +         @wraps(callback)
> +         def wrapper(ssl, out, outlen):  # type: ignore[no-untyped-def]
> +             try:
> +                 conn = Connection._reverse_mapping[ssl]
> +                 cookie = callback(conn)
> ++                if len(cookie) > max_cookie_len:
> ++                    raise ValueError(
> ++                        f"Cookie too long (got {len(cookie)} bytes, "
> ++                        f"max {max_cookie_len})"
> ++                    )
> +                 out[0 : len(cookie)] = cookie
> +                 outlen[0] = len(cookie)
> +                 return 1
> +-- 
> +2.43.0
> diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
> index 33884f8d6c..2e1e93cb7e 100644
> --- a/package/python-pyopenssl/python-pyopenssl.mk
> +++ b/package/python-pyopenssl/python-pyopenssl.mk
> @@ -13,4 +13,10 @@ PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
>  PYTHON_PYOPENSSL_CPE_ID_PRODUCT = pyopenssl
>  PYTHON_PYOPENSSL_SETUP_TYPE = setuptools
>  
> +# 0001-CVE-2026-27448.patch
> +PYTHON_PYOPENSSL_IGNORE_CVES += CVE-2026-27448
> +
> +# 0002-CVE-2026-27459.patch
> +PYTHON_PYOPENSSL_IGNORE_CVES += CVE-2026-27459
> +
>  $(eval $(python-package))
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
