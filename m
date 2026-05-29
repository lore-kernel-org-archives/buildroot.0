Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A0DCD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22C9A8428E;
	Fri, 29 May 2026 08:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b-IubremvsJR; Fri, 29 May 2026 08:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36FE484247
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043390;
	bh=XptUyQU7yZXEWoV+GDxqogIxRfX/ip9LUbAZ6C25M3k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sRn2Opa0CMvupgsD6RSHBmVI81RCBr71J+lxs8Y9SqZCNz5WnAbs0C7yf4LEwnIyj
	 KZHTTWSdtiX+NJLR2a7I8n0JgFUFeZert1YreEgjWa2R9WsYWcFtnx+8kS+SxOJOEn
	 WtHfrcz4+LnzEqoTphv+xC84dNJaJdhZSeDBg/txBeeQ2t9kMyiKvv7Hp3EfFaEbbZ
	 +tW+/lXuxC+LRDLFr9Df1UTTiBdRtHzGiT3kHyxQgtK61BkWlUvDji8hA1cUCRPtwV
	 YlKVT/Ffv3pA1xB89Vu/3t0lJ7SoeYg+gSOwGBUsb3wr3Wd4m96gkkeERat+kv/3uK
	 KVmmdqqcbz6ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36FE484247;
	Fri, 29 May 2026 08:29:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8150288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6B7A826C2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vm_FWDVKl_H1 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE19582661
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE19582661
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE19582661
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:45 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45eee266c6cso780735f8f.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043384; x=1780648184;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3o1BWwB8rFvdOnJbZjVJ1xwuI2O8holZgsDslobZYZI=;
 b=G/CG3m5DOKjFygUoSDmDzhk2n1yxq4cTqkE5U1YncX/C2l8zl4oCmXY1S2bban7hkh
 yo/4D0ch7foQxLVA/ok72o65k8+Y86GLE+U/WS7CnEMMiW3W6mYZqOZwdtu2uFVqK6kz
 LDV6lpUUWFsPvBPFKhWLsoUI9Ca1wBX7LYqwXya240IZVcRRuC3WKy5uIxHiGSwc7LZF
 jYCf5uuJX69wq29JrpqeDJhIGc4lECX1k0A1GFqdS5oCw4R/++W0Fc2LzlNRqHIB9kNs
 4Xa5Jc3PMvnQEol089zHiw/DXIkSaF+pfVqli0mHHoMtjAQPLYQWcrZM7gNc5RimCwFS
 c6rw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8d1edXIgSdMgoPTFHmlbEUKrhWMz7PqP7+tp7UAiAjVjf1WjAj02OR5+JcKKaFCRDujdmXCK8s2/c=@buildroot.org
X-Gm-Message-State: AOJu0YzFFh4RRcz7/nvR/rG1Ck93KoCGNw9q/zRxesfKqxOg49qM5Xut
 rs8H4K771vXU1SoMtZZpWUl2xBotLBnFwIwSDYv8eEBFSDLBvh/NPDX5JGd+jYueEcI=
X-Gm-Gg: Acq92OGcOUtfQWnQdSVVyzZNxI9atl2d6c9x0f2Fiqcyai4Sei1xCXjGxDa9V4X6Kny
 64fezsZlKqr5UDuiefNCqWUMp2dwHykabgZuJBHUy/Nf+fHq07emqt7kwmNNSQYK4M5kntsfnYy
 q9LFxDllG+Xe2LMXat8qQECO8CE/rFlkakqlK1tB/B+7UT4A0W5N6A0qRExB7VcOG1WljIA/IrY
 CSNN64a4J6FTigVK0CPDPBbVcLMu3FbShHPYIrvm67INgvVbBrlgatyJEtzInhEmQyCU+Wk3CUK
 1G2RW8L3DPLLMnlIWGh+J6/5ItQQQQ7aKH6MFGX6/wagWSpJ3EcQs2qRPNbHPW7Mz1aovArqJAh
 C6qT6C0IsezUEB3YWVE4EHeWLIgLZvXkvRANkPlOTiQPgXFxQc2CaBmFKGl1Khvo5Skmnxh0G3e
 r1niALJM4sT56wqQctNt2Ixxi4wmndTK1smT5AigBmF60jyH0tPXx0fknwSw==
X-Received: by 2002:a05:6000:4b05:b0:45e:ee20:b897 with SMTP id
 ffacd0b85a97d-45ef13fd94emr3192774f8f.6.1780043383722; 
 Fri, 29 May 2026 01:29:43 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef35874b7sm1765203f8f.35.2026.05.29.01.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:43 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:43 +0200
Message-ID: <20260529082943.58003-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511062425.1243680-1-bernd@kuhls.net>
References: <20260511062425.1243680-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043384; x=1780648184; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3o1BWwB8rFvdOnJbZjVJ1xwuI2O8holZgsDslobZYZI=;
 b=MCs+P6aLmAenbfwWddKLrS+XQ66GSC6VWpdpVmI6u1zjsloJ+YBZw0BTEMXawUeySQ
 n1Jz94QWeQMZNcCHE1z233WWDjZLyDQ63Wus5oOk1jGLOVSXm2DdggGn/CMMiP8PzKG9
 msyK8sE+Rdm6cCzadGtHKLft4HljEeoA/Nc7DstAbjk1Jr9K1AfWQY3zC4UZQzH7T33r
 J0BPQGHMhCfZJ7tBniSwL9aoYr00e4NHXfLSkyfMXZhmkPRtHrfHh2IjFPSUGiV0Axj/
 KLSssTvbHN5lXktMdZOxOAnRTg9HxzIxdumF4bLTbx6TXV58IQXivlMCPr9uY/d5xThq
 A9vg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MCs+P6aL
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: security bump version
 to 3.14.5
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
> https://www.python.org/downloads/release/python-3145/
> https://docs.python.org/release/3.14.5/whatsnew/changelog.html
> 
> This release includes various security fixes:
> 
> gh-148178: Hardened _remote_debugging by validating remote debug offset
>  tables before using them to size memory reads or interpret remote
>  layouts.
> gh-149254: Update Android and iOS installer to use OpenSSL 3.0.20.
> gh-149017: Update bundled libexpat to version 2.8.0.
> gh-90309: Base64-encode values when embedding cookies to JavaScript
>  using the http.cookies.BaseCookie.js_output() method to avoid injection
>  and escaping.
> gh-148395: Fix a dangling input pointer in lzma.LZMADecompressor,
>  bz2.BZ2Decompressor, and internal zlib._ZlibDecompressor when memory
>  allocation fails with MemoryError, which could let a subsequent
>  decompress() call read or write through a stale pointer to the already-
> released caller buffer.
> gh-148169: A bypass in webbrowser allowed URLs prefixed with %action to
>  pass the dash-prefix safety check.
> gh-146333: Fix quadratic backtracking in configparser.RawConfigParser
>  option parsing regexes (OPTCRE and OPTCRE_NV). A crafted configuration
>  line with many whitespace characters could cause excessive CPU usage.
> gh-146211: Reject CR/LF characters in tunnel request headers for the
>  HTTPConnection.set_tunnel() method.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/python3/python3.hash | 4 ++--
>  package/python3/python3.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index 13e2b94336..2217f688d3 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,4 +1,4 @@
> -# From https://www.python.org/downloads/release/python-3144/
> -sha256  d923c51303e38e249136fc1bdf3568d56ecb03214efdef48516176d3d7faaef8  Python-3.14.4.tar.xz
> +# From https://www.python.org/downloads/release/python-3145/
> +sha256  7e32597b99e5d9a39abed35de4693fa169df3e5850d4c334337ffd6a19a36db6  Python-3.14.5.tar.xz
>  # Locally computed
>  sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index c71cb0b05b..eeeb1c7e2a 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PYTHON3_VERSION_MAJOR = 3.14
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
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
