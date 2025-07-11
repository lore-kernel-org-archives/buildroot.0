Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AEAC8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BB0C8217F;
	Fri, 11 Jul 2025 10:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haOeNyM8rXgY; Fri, 11 Jul 2025 10:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 945278219A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 945278219A;
	Fri, 11 Jul 2025 10:44:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB171199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD0A440251
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9er2rW6-vSts for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 935DF40094
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 935DF40094
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 935DF40094
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:41 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4555f89b236so5040995e9.1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230680; x=1752835480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=huoahL5Sycnu3Ow9BxrDzjWS/Nrm17ISW76iCiVIT5w=;
 b=EChLPkul5vfaLeIPk84SRCEdGAP1tXuLMbrozfnCTn2qJw4wVybNnzIn1dErGilu/R
 DR9D6EjfmkhCi7uLqTuZu1KTBG30qaP1KKaI7ZaXaWRkQF/E/H28JwBtlN8L5xQ57BkS
 raKeC1l+oNwlUJYxd/L2gCiPyWXH8aB9AVqJJCTtMfVszStb3OGG8etCWCr5n+ZKnD9I
 KWycMMOKs9eIEzVKoBBj/NHniGA6MFP0SIHyx97rwAepSCEUd8kCfYTG25l3sqmc8Phy
 4GghTQqpYOWKdZ27VjIRr2XkudXX1nXQCZjv4FpyuPNQwDinWwNWVBIPzDb7O6fpVHp8
 QW3w==
X-Gm-Message-State: AOJu0YypPfg8lpDvblx+Ujeg0KNSgSDBqTYPfC+roWsmdXTYAn8wG+aI
 9YbDFs0+Rhzx7l1h6yyeGhIcNYjecGgiOjXgAiN4lcQ/pr6TuDishreKjgC0PSPzOWg=
X-Gm-Gg: ASbGnctvr3sNZeqG9KBcyLaVMmF50wqacFvZhiuaSyaNqNx80OyoqTZIkBPgTIYu/pk
 EYkiTEPVhroMkRQiKcsNFANrSUD36M4Mz8R8mU6VUX8TqJ1sKzzwy2Xw2zNvwLnTem0smLVM9g3
 OG4DZ4yQBhH2vE+QKwICcmaNqQ5lj7OQLUFPqUAToe78v0oeZFaMLQcMNZuwf5YG508aTdua/Tm
 PToYooNr5DPqb1huvAhP2ZJ2X3zrP5mJZQvlZSBMHrwNR+eEU6/r953Toch5cgmPZ1Op3mArYQz
 Dzztjt0p6xhFAP7HlwgE5D3UKihwB5l65Uh+Hf9xJnYLZGeJIkjVh5JYF8VhjIuaTW/rqjGJP+5
 Zb8XSFUHcR0rHlg==
X-Google-Smtp-Source: AGHT+IFs4M1aspMHs9FQo8kQfRFk6bTF8Q1t7ho2vawJg6lE6tTTLOkb9Vu3L0G17CBV/LEdcUw1xw==
X-Received: by 2002:a05:600c:a05:b0:450:d4a6:799d with SMTP id
 5b1f17b1804b1-454ec14a434mr22149345e9.7.1752230679546; 
 Fri, 11 Jul 2025 03:44:39 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd537932sm43576925e9.20.2025.07.11.03.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:39 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:38 +0200
Message-ID: <20250711104438.823490-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250701150331.530854-1-thomas.perale@mind.be>
References: <20250701150331.530854-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230680; x=1752835480; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=huoahL5Sycnu3Ow9BxrDzjWS/Nrm17ISW76iCiVIT5w=;
 b=UboGZmtf8CEZinjZkrVeEn/j9u+XqqAJ7Gj+l6Tj3DcOp8nE7DHMwXLoiakmedg20n
 RJdWM2RlY75IdALwtBopBi3VE7o2X5J7fqyTJFPL6So/A/jgL1ibVhjjVg4XAIypZ0Fs
 FzAv9OHXBJgbnP7IJ/2G9OeR1F3bR4Tb+9q8ZBiO155i53TS33jUPCnZd8nEH8TVKG8g
 S3sAYjO9ZspG2b0+uBOX+vyfKZ89MtnhxDmVdRjYXx4zDBxFrjj7+9fllFb68M+e9/Zk
 Rbsvm+ZcXHPv/UevMBDyIiPRcwSZCvlOCOQHrHRyKfH5IW2D35GqzG1De1yBNW/QrVzy
 U1GA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UboGZmtf
Subject: Re: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server:
 security bump to version 21.1.18
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
> Fixes the following security issues:
> 
> - CVE-2025-49175: A flaw was found in the X Rendering extension's
>   handling of animated cursors. If a client provides no cursors, the
>   server assumes at least one is present, leading to an out-of-bounds
>   read and potential crash.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-49175
>   - https://gitlab.freedesktop.org/xorg/xserver/-/commit/0885e0b2
> 
> - CVE-2025-49176: A flaw was found in the Big Requests extension. The
>   request length is multiplied by 4 before checking against the maximum
>   allowed size, potentially causing an integer overflow and bypassing
>   the size check.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-49176
>   - https://gitlab.freedesktop.org/xorg/xserver/-/commit/03731b32
> 
> - CVE-2025-49177: A flaw was found in the XFIXES extension. The
>   XFixesSetClientDisconnectMode handler does not validate the request
>   length, allowing a client to read unintended memory from previous
>   requests.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-49177
>   - https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab02fb96
> 
> - CVE-2025-49178: A flaw was found in the X server's request handling.
>   Non-zero 'bytes to ignore' in a client's request can cause the server
>   to skip processing another client's request, potentially leading to a
>   denial of service.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-49178
>   - https://gitlab.freedesktop.org/xorg/xserver/-/commit/d55c54ce
> 
> - CVE-2025-49179: A flaw was found in the X Record extension. The
>   RecordSanityCheckRegisterClients function does not check for an
>   integer overflow when computing request length, which allows a client
>   to bypass length checks.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-49179
>   - https://gitlab.freedesktop.org/xorg/xserver/-/commit/2bde9ca4
> 
> - CVE-2025-49180: A flaw was found in the RandR extension, where the
>   RRChangeProviderProperty function does not properly validate input.
>   This issue leads to an integer overflow when computing the total size
>   to allocate.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-49180
>   - https://gitlab.freedesktop.org/xorg/xserver/-/commit/3c3a4b76
>   - https://gitlab.freedesktop.org/xorg/xserver/-/commit/0235121c
> 
> For more details on the version bump, see:
>   - Security Advisory https://lists.x.org/archives/xorg/2025-June/062055.html
>   - 21.1.17 https://lists.x.org/archives/xorg/2025-June/062056.html
>   - 21.1.18 https://lists.x.org/archives/xorg/2025-June/062066.html
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 4 ++--
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> index abf1c83c75..7d373850d0 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.x.org/archives/xorg-announce/2025-February/003585.html
> -sha256  59fa52b63f6f8747ee2c4716decb29ced249c4c574e2a18c96b7d3b1420f7fd9  xorg-server-21.1.16.tar.gz
> +# From https://lists.x.org/archives/xorg/2025-June/062065.html
> +sha256  c8591ceb70b177440062406542fe52ba60212f217f27f8f802dd20373ca9e74b  xorg-server-21.1.18.tar.gz
>  sha512  d0cd176e4c7273b6870999a3d008ed282fd5609acb2e0919c16447af3a5b2228d8592424388a8ace67acf216cdfae3a2d52f7a7ba81f6071467c61d57f32f314  xorg-server-21.1.16.tar.gz
>  # Locally calculated
>  sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index afb79b223e..f480c1c0ac 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XSERVER_XORG_SERVER_VERSION = 21.1.16
> +XSERVER_XORG_SERVER_VERSION = 21.1.18
>  XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.gz
>  XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
>  XSERVER_XORG_SERVER_LICENSE = MIT
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
