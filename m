Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA8AC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A491680E28;
	Thu,  7 Aug 2025 18:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YELYzUacLkrJ; Thu,  7 Aug 2025 18:24:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4297480D12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4297480D12;
	Thu,  7 Aug 2025 18:24:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B0A6C4C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2C3540087
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36UH4rF04S-4 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9395540057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9395540057
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9395540057
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:22 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so7312345e9.2
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591061; x=1755195861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=twQGLtX1Gg+nNZyIb0z/AbvcHMbgJqWH6SK9mHcak4c=;
 b=F+p4qwToIfCrxsRhzMu4Vqb2jpWCFqBSdDe16xWLqj8S9vlW9QdqPDGVlG0OIZLE1A
 p+17dAdS/fYOmQNUT46btaK6V6/tr+R31mnYz/r6pAx1b8vOjgoN4HrxyrsQF3VQ32Hh
 1j1xfMXuhYWR5G/CURKvAeo24ayhDlZ5Gt9mMIMD6rCsw84CxnOuzRoJ/PojaCjFh+4l
 B2s8PMLl0lVKeNgg3fZ/z40iHw/ZAk/ah5jZS+72xtnV+ZqFqF0qo4fzDQ1BCHcCHDbt
 99uJ1Pxf04JKhb9LIuwT3lviOmKY9NrptPcZjNuGsWMvRNJqywBOHpuHj/CVrVzLLIfC
 bDLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhMkZdlLEOC6++3fv5noONf853WSIbnvsseQ/k9yTPgGYJdBIyBZkZyq98/jeM2WQdZx57YgOVpZ0=@buildroot.org
X-Gm-Message-State: AOJu0YzZBSwZEpIHmNhcpb1Xn4DX6JIu//rgDhIFOQCDEJxgNla9vMCD
 +3TM6VInLj+aY/PPLML9p2mZMW3vcIyyhsmJ4Nupka8jWKrBNWVDO46aNbMWCNVa9bmI55evwoZ
 ztoht
X-Gm-Gg: ASbGncs7KjaW25IxWNwz5g+qfgvSZIhkknmJOyJEZ7MppgF4weDKlPL5axSwTv+poy4
 1WvceXt+IBjAy4fFHORfFAgTxMeKXvsu+rL2Bfo0aE0svJd9J0B1TUYsQHifQqCA55TAh1a8rOL
 BMMnSXjoD2AxNrRIfPUWSEUUWqKK4P31Ddo4fWFSza4I0B49Y1yaXzUA3ndAhvwKThIjJ3g3q5D
 O0piIeIrqiHE+XF/eh0z2WCEO/ZRaJJBe8ozydllZkqRe3gm/athOt6iDpW6EfJLhQ1i5FrWd74
 ZgjOmzpnSqLMN+0Wa6wOAPaOsV/Xw75RSIcx5VClNtCRgz+C6zvkN+TX0sXo9/QJCYF3qdbP0MQ
 k1b575q8xHgoCCQ==
X-Google-Smtp-Source: AGHT+IGQl8ZWXxfJPznicACNzNOM5mJ1MRDWGFlILfinFt7t1IZoKmrcvjpgcT6zi8Tzdf+3r9KcoQ==
X-Received: by 2002:a05:600c:35c6:b0:456:12ad:ec30 with SMTP id
 5b1f17b1804b1-459f4eb35a8mr164365e9.13.1754591060648; 
 Thu, 07 Aug 2025 11:24:20 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3c51e2sm26854307f8f.32.2025.08.07.11.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:20 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:19 +0200
Message-ID: <20250807182419.725021-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722171326.ABE90869CD@busybox.osuosl.org>
References: <20250722171326.ABE90869CD@busybox.osuosl.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591061; x=1755195861; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=twQGLtX1Gg+nNZyIb0z/AbvcHMbgJqWH6SK9mHcak4c=;
 b=b1I+v3oZfDb9A2jA87mj5BjLJpRXQ3LOxQjSaCFz1KaONN4XUd2WI+wHGGXKyboh34
 6XEXuN7zmNqOBwiJ0HK15mYXW2e4Svq8CFugaN/uqFeY8/ti/iGtowvq3pId+YDv0Dom
 pLQ/sKt75xq/AuoAk6QOn20qCFpZYctwyda97oviiEiJAV/aQrhRrQBxWrUQuPnQSx+W
 O8V06lGV0wGlgLh8a2bdDhw2tZ4Vpbmrnlpzczy2ZxacrNHm9KuJ940hsZcDrGbTtIRo
 fbWj9M75nigPwiuVHRQpipskSHn6oATatYH2AcC2u8Q94iE5Xmmeql/8iYPU96j3gnJx
 Nx9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=b1I+v3oZ
Subject: Re: [Buildroot] [git commit] package/python-starlette: security
 bump to v0.47.2
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
> commit: https://git.buildroot.net/buildroot/commit/?id=8945ea3e671954ec7c36f0000a707184c7686234
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> For release note, see:
> https://github.com/encode/starlette/releases/tag/0.47.2
> 
> This fixes the following vulnerability:
> 
> - CVE-2025-54121:
>     Starlette is a lightweight ASGI (Asynchronous Server Gateway
>     Interface) framework/toolkit, designed for building async web services
>     in Python. In versions 0.47.1 and below, when parsing a multi-part
>     form with large files (greater than the default max spool size)
>     starlette will block the main thread to roll the file over to disk.
>     This blocks the event thread which means the application can't accept
>     new connections. The UploadFile code has a minor bug where instead of
>     just checking for self._in_memory, the logic should also check if the
>     additional bytes will cause a rollover. The vulnerability is fixed in
>     version 0.47.2.
>     https://www.cve.org/CVERecord?id=CVE-2025-54121
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>
> [Julien: add link to release note]
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/python-starlette/python-starlette.hash | 4 ++--
>  package/python-starlette/python-starlette.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
> index be23e4ccb1..5939eb198f 100644
> --- a/package/python-starlette/python-starlette.hash
> +++ b/package/python-starlette/python-starlette.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/starlette/json
> -md5  b876ddd8665f70bb74e45d1fda053699  starlette-0.47.1.tar.gz
> -sha256  aef012dd2b6be325ffa16698f9dc533614fb1cebd593a906b90dc1025529a79b  starlette-0.47.1.tar.gz
> +md5  b58c9f8d38df9946689cb3e9f94555da  starlette-0.47.2.tar.gz
> +sha256  6ae9aa5db235e4846decc1e7b79c4f346adf41e9777aebeb49dfd09bbd7023d8  starlette-0.47.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
> diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
> index eb49230600..4037903cc5 100644
> --- a/package/python-starlette/python-starlette.mk
> +++ b/package/python-starlette/python-starlette.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_STARLETTE_VERSION = 0.47.1
> +PYTHON_STARLETTE_VERSION = 0.47.2
>  PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
> -PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/0a/69/662169fdb92fb96ec3eaee218cf540a629d629c86d7993d9651226a6789b
> +PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/04/57/d062573f391d062710d4088fa1369428c38d51460ab6fedff920efef932e
>  PYTHON_STARLETTE_SETUP_TYPE = hatch
>  PYTHON_STARLETTE_LICENSE = BSD-3-Clause
>  PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
