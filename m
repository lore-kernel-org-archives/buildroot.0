Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B8CC624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD8D460D9F;
	Fri,  4 Sep 2026 12:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJ3mF-CCrlJy; Fri,  4 Sep 2026 12:19:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9437860DAA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524369;
	b=az0YfnzO07iBJlLLhp2tAPXebPxP4auodh2QTS/H+QgZW/T2Bc8ycZcClz2NrKJcSWXI
	 VNF6YPegt146w591IzAGuAwGlBTMNGunNEapPHgyypTKB3pUVo26Esjh1NCo0lkv2Oy5B
	 +0x8QkHX8oeNTd3mdQg/0RDP5Q5hStbAqIZlt/JdKbsNWNEZikrug1U5Mr82r1fj7yQzP
	 JcabvYyOc7VPuUiZ4uaZvVX4QuNLBO7BOu7qWbkTDSEKQsu7XkHSGFPvp+mKj5dJEwdqZ
	 PB+oflq4fdYDmGBPps7RDPaQn8aNm+fQn3ZbYmrt9eOGUzw1cqEpt2i+akSi4t71acw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524369;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=M5SViGF7rIUWEIABhtDbikuYKHgXH6OKjZffCqe+smg=;
	b=Msj7oEzeU0vgoCO8CXolgYQ0llMv7h3wQIBpAE4JscRsYM5uLwDDIT+1It7bb+YhhXvF
	 4zHrV/xKzwx6Mna4Uu/z7Xq2UNC3sQule6Nv7io8wqE5YHVRyu1+aQC2CwgbEBmyO1toh
	 BYWpHQV2lMl2+NqSFNup5LcJRhOTVeOgYEdWfnqnLEcIYdK/jbjAbcwSEb/UV0sqEewr1
	 iBhUe3NmVgbecqAKFYqgb1xLUhcceGh1PhbetpCjwrIGErWPgJipYWdcU+asNdmU3LLZv
	 Orf6HillOHk1JUw18UaOcUmCqA53J5LhhQoEHXlI7SSGcRpsJH37U2Vw5zr9vMH7p5g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524369;
	bh=M5SViGF7rIUWEIABhtDbikuYKHgXH6OKjZffCqe+smg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xk4Y3wQaO9nfvAXCPhj4up82KcRCSnB3MUxoNcfbdphBwC8wkqo674acYsA5FJjRR
	 XtmiAcjCpgHiMVJ7qFa9J8uEHpk0UieHjE2zMJzMeBI94Joy0Ejqmuuk21cysAhSm5
	 0lbrDE6gsp1NN8qeU5iP4/VYMHDGD2nWRnYbpZX/UjPDP7T+Gpb/uir7ycQnbewLpk
	 nkN9I6A5k5JMHS4yjPtNECZkzpUAnHn13k0yj/qG6NTxuJHfksQjVVIj8wA/fwaBJY
	 I44aaeuBpAbgRhqZNrqzDtPh0IEnh9BNmyPK3FyxlC75P+5B8aMTDCjyx5yNJIGOys
	 cmg/Lt2jy+KAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9437860DAA;
	Fri,  4 Sep 2026 12:19:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 808BCF14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7249540388
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cMxw8M3Zxf4c for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:19:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3BEF240080
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524355;
 b=Wp9K7smlNtigSWO8+it+dF2fdmLa/ti0i4yd5cMRcpIs4Td+6JmnqdvWQSbq6mkAdbCg
 X3sjqj+Llxjv8Vuf84nTE9w+wsxUwQ7MBo4fR+UlRn7A3YdyxqHOn+GZ5McKf7Kd1bhLW
 R7gA04X7ZzY4/ZLXvsh5UdD+F5A8LvVc1ujILhs4mIRP5po/c6sg3GnrdSzYAJqHwZqGq
 TowzryJ8nGpjVagaAG8Jpc37ytK/SA5ErqaqtwfY6l1SppvWWErVCGT2Th0PJya4rrX1p
 nuVTIINgrSPwGNFUpqTuqLuncKL9yG40TPyOGYQ/MB8W7hsqrmlCw+DtAHpFvTQqq3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524355;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=rBszs4WUoZJeK/2W1MCs4lKKDcpXioPjSV9f9X9Ozdg=;
 b=X5ZPJmeE1oah5/zdcnQVP7FjP1LsJrZyFHklJAmkDYVvKTFspuxxqjsAUFV54Yzv9iAq
 M8HTK+lI1jGUWJWAhJOHM24BTUcdFc4sgXsp4bWRZGHUz90vLL7ETQmhIPay7nYkFQAfC
 rALgi5gQHgTKHrf9vA/HMM5w3kl9bCJASm6hUw/yWrnGsa7eLytewQttRfZaNTy8/Zk6U
 IO71c2ppTJ90rWxaub1oZTLwb++oP6/e4DP8+WC2rYJkA1cJezfmROg0wPONuNtfZAmQX
 w4NgeXukVL80k4wfu3unCG3bB04yvIqyNNWSrrrvXLsUjHsMgs/iL+Wvo2QEte+0xkQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QYRdbDdi; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BEF240080
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:15 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48589798dbbso574130f8f.3
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524353; x=1789129153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rBszs4WUoZJeK/2W1MCs4lKKDcpXioPjSV9f9X9Ozdg=;
 b=SZGUC/n3SXOy1V4SG1QleKSKqKUuZDfqtkgb8qS4L6dMTOC3Y+UNL0YGlZ+dao9jna
 lSZGKfe6OIualArthuPaHvi1OfqL9+o6qFuoGN2QQDlPsMK+lnfJSAFirjnXuKXveyl9
 NbDbaYf3GeASWmXY5BmlkqrTWecBY4uZd5XP2rO6fONvFFeO4+I3zVSD/8YGeagz867s
 gwyyPZS0SueG+yV1nXwR7N7+Dy7WyX9fDI1/Fnk5W/BtmrfOBzDPsjlHfOY8wyabgFAc
 OrIHO0T4WiQioaoS0wAF9Nc50LoUarXhuToPL413D2s/GA0SMbgBEGozlQi7YEscJK8b
 V8hw==
X-Forwarded-Encrypted: i=1;
 AKwUvByIlrliFSUEIGMstaztaQVDTb4sESGClcyIq7Ah0Edt3MO6clcU2CTsSk5+4QXSCsxhtQvQdfVYZI0=@buildroot.org
X-Gm-Message-State: AFuF++kO/NlDpLEC11Ro8IMxdcLW2Bs5f0UdexTiRy2Px85F7arXp/Fl
 khyxjam13hVxKTKQBpDPI93pP4JXCwBfAgmpDYr2RF65uSYRbs+QFOvgNYaTdT321RE=
X-Gm-Gg: AYBFou2Rs5os+G/C3FLKuiBzWe5Noy8uLIUpD0ehwWyM5Ky2ApWffg0sBKlGcoqVDfn
 a/lJe4JaktIsGINJW3umj1o8SbSvrgrrdZoinXBVwUMjL+zDKheNAtKoC9k7wlXC7cvM4ApuJvA
 kkiZ94dd2635x1f1YO9UOiOg+Y44a9NEusO2zUH31DKp1GQ9H9AvXTxCC9RCsMfl7heG0BcNwZE
 fQF7u7HQPRsGwWDgPXGMlN6TFwKwTuCrgFriu43bv2rJfS0SSMRpkXYhrVvSRBWwMuXQKSI3GYF
 i/bieeY6ZxS73Er2pY1BGTqA60VhZF5DPvFvG7wazzucAuZb1wRTcfK570IDWUQKA7aJw9a5QtO
 wVKYF0ArUAUMZEbuXSi8IgSLoStBy4tx6cJQyWT+OqNKYGtqk1kzlJrGKoa2lVOODuODVnuSngQ
 7vr30FSp64ikXpyxUXu0J2pdQTbc3LoiT9X0kJYzJdRjzS/Ogu6ivJouQc1ePRfllfbkY=
X-Received: by 2002:a05:6000:25c4:b0:485:8a46:705e with SMTP id
 ffacd0b85a97d-4858a46722bmr3766125f8f.48.1788524352215; 
 Fri, 04 Sep 2026 05:19:12 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858ac2b4cdsm4440364f8f.16.2026.09.04.05.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:19:11 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:19:10 +0200
Message-ID: <20260904121910.406779-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829180930.105786-1-bernd@kuhls.net>
References: <20260829180930.105786-1-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: security bump version
 to 1.23.2
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
> https://github.com/strukturag/libheif/releases/tag/v1.23.2
> 
> Fixes the following CVEs:
> 
> (CVE numbers will be added upstream when assigned.)
> 
> CVE-2026-XXXXX (GHSA-g89c-p67h-r497)
>  Heap buffer overflow in scale_nearest_neighbor() via duplicate alpha
>  planes from nested iden/auxl items. (critical)
> 
> (GHSA-2jg2-4ch7-h545)
>  Out-of-bounds read and write in derived-item and pixel-plane handling.
>  Through iden and auxl item chains, a crafted file could attach pixel
>  planes whose size differs from the image geometry; crop, scale, and
>  plane-extraction code then indexed those planes with the wrong size.
>  A working code-execution exploit was confirmed. Plane sizes are now
>  validated wherever they are consumed. (critical)
> 
> CVE-2026-XXXXX (GHSA-24wx-9w62-c96w)
>  brotli/zlib decompression of mime metadata and unci image data had no
>  effective output-size limit, so a decompression bomb could exhaust
>  memory. Decompressed output is now bounded by the security limits.
>  (high)
> 
> CVE-2026-XXXXX (GHSA-x8xm-cm2c-cfc8)
>  Chains of derived-image references (grid, iovl, iden) bypassed decode
>  caching and memory limits, causing CPU and memory amplification. (high)
> 
> CVE-2026-XXXXX (GHSA-xw34-mjcp-jqh8)
>  Sequence sample-timing initialization could produce non-terminating
>  decode loops and unbounded memory, bypassing max_sequence_frames.
>  (high)
> 
> CVE-2026-XXXXX (GHSA-j264-xvrp-5v7q)
>  Out-of-bounds write in the unci encoder when
>  heif_context_add_image_tile() is given a tile whose planes do not match
>  its declared size. (high)
> 
> CVE-2026-XXXXX (GHSA-p58j-h3vm-3fp5)
>  Heap out-of-bounds read in the inline-mask region API when
>  mask_data_len does not match the region geometry. (medium)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/libheif/libheif.hash | 4 ++--
>  package/libheif/libheif.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
> index ff8c05c7e4..31fe79b16e 100644
> --- a/package/libheif/libheif.hash
> +++ b/package/libheif/libheif.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/strukturag/libheif/releases/tag/v1.23.1
> -sha256  0de0327f60fcd47de90d5654c6fe152232738d60d84fe084ec3e0f35e03b166a  libheif-1.23.1.tar.gz
> +# From https://github.com/strukturag/libheif/releases/tag/v1.23.2
> +sha256  8bd5d41d19dc84536d118b04774709f244df6104ef66d623dad5fa4650143405  libheif-1.23.2.tar.gz
>  # Locally computed:
>  sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
> diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
> index 124dba7c24..755a9909c4 100644
> --- a/package/libheif/libheif.mk
> +++ b/package/libheif/libheif.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBHEIF_VERSION = 1.23.1
> +LIBHEIF_VERSION = 1.23.2
>  LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
>  LIBHEIF_LICENSE = LGPL-3.0+
>  LIBHEIF_LICENSE_FILES = COPYING
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
