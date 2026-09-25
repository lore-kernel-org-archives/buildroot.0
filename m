Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA41C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A2B160D5E;
	Fri, 25 Sep 2026 14:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8xZp9EdCxNC; Fri, 25 Sep 2026 14:46:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 35C9B60D7A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347589;
	b=leMCf2IYUnW43uMmMclRBX+49u1yAhOPuFb26JHtPG7an5luCS7yMH/zquwS+Yu9Pfzh
	 C5vvsFhTZa6vbm/aUcZvXCd9N6eMMdY77T/mPpZ5P+aexsa8TdnNaEXcx7o6Igeja33n1
	 KfxGAPzI7jutaiDqIgrd5f7qSzScHkTsT/M5s7Zt+NGzRrAr0ErS9AaIjHlbg9A/cdWcX
	 D7L90dIKjOUu7JAxyfAk7JuZWWPUKZMn1H3ccpcjboxLcC1CdTJuRZRge7e84HgL6Eab9
	 j8ZKrn24vEN8HCM34uZPpuVbb1FT7ZtXMnFYyW7aRVdOnzmeFxvAgQZF3+lL6dGFuUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347589;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vTM846TZnMm1UU4SLv3OM8+h0M0HhJA0H8vsNcYTUlo=;
	b=S7ZIVahL3pg7LnTLI8JUmRDTzPM+LEPgIbV6eY5Qj3bQH3Bpt7g6gX6u2V/qG6+C2JBl
	 gEwJ/k+9YsQbmfjr+IFCOtP2YJ5Wdd+YivZefe2G1sWL2fY69Iinb5PkKMY+mxTucMRul
	 dy1UWBLnWs22u7HyYx/kr35YTgw8IbQ9wD4/DfHXX2PyDr6PZ5/ZeQTUHbOb07Uhh4KKE
	 kSODYlt8i0zYKsExKgrmfu1nsonrxDjgv4J7527TKNP5r866nlwQr+Q+oxVmVGed4yHeY
	 JdgmKDlChf8zgNzVzjsudA/IYjphEJhTBrDnv8EmLZ+jtnkhNCtYhqwZZktv5FVyAHQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347589;
	bh=vTM846TZnMm1UU4SLv3OM8+h0M0HhJA0H8vsNcYTUlo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b/SNMwBFvp6K5fCc48jv3zOEtWeKjFhER1o4doCkpbGtda1cd/ygFMveMWHVRpRfu
	 YNc+lr9zOTPuwS1Ah5zjeEu+/c/PjqXZQUONc9yioRzjX7pndyKv4cbdePKwI7xfyo
	 QhN7IKEyIDSsfbY0USyWUYdBmn8vfoYTlWQ32niPQB6MT3il2wJCOyjD2KgUHUhc2M
	 V8UNvHuUq2PuIAAX6IP8r1LYN7vJ49YGfbrg9wuHgf0JR6uLMp0D2gcib5SPU2TTKp
	 BWYfo9Pm0i3tzHAK3oBe66TEVTyhNJYFocK9Ex+e4Acgr1X/4ELVtngK1sCSyRp7ag
	 HpFs7vHBbsLEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35C9B60D7A;
	Fri, 25 Sep 2026 14:46:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 26BB1334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18F0B813F9
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H5T8fZQsDUac for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:46:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D3972813DC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347587;
 b=roKiFr9CwjLfv9PL/eoblkNyVXpCnoOM2QADZyBPQ10OpPtZ19g4y6ogvODQwd5eiMws
 KVq0dBLtcB43HsW3mwhhC3/O0SmE6lNk18ZNa3Lx0aUuazV4eS6rzMFiw/Hs7Lu75VcWF
 IuHfrN6VfNp5nKfnsZcj1W2LlLAq1w3DGRnrIopQDFOvd58NhhAK5JIpkla4lzQFaHPir
 2i77PGE2N33lep0Fnx6EOC/BgIK4fZuZU1eiRh2Yh4UpUMPGRsalxugaT7Dy0EiAMYwCh
 qrgkZmHLaUcjUDNqjE0iK2Un/Rw1QjWKYiKfs+4HVFRQ0Aix77YI1uxM1kg702x4acQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347587;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=XehuDLVM1Bv2l5+xhxYL4ZQldRyNcmqwuaGcBK4xzrQ=;
 b=Ha5y8ucee62aH3raN5cO0HcdRf12tCKg1BMrLR1wyq2kN9w0qpfsn6qDsGp/P/tk7IyU
 8td2i1DCeQv7mSyaS8W1Wwl8kSFd8bg2eaKy+aPTns3eJcvGYvv/LeE1F2WZts3+dh1+m
 1ZAyzosUz47O+8FXEaAzy0Gg5elyIecaD3P6zQG4G5Y5d57h5iDZXuRCi9IW3qDCV4RwT
 JBjIkKt11NfF5Vcw1UzApvaSq9TkEAEgywF08nOlXZMrB4DCEdSQF1zZpHFtT8pdDwG3d
 eOTqvR94vrWXiIkNmG1rgCW0RDcBezkcOfHpO8Q/Lh5tXDtpSLA+7ePFukQQH4iWWDw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DPUdeoC7; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3972813DC
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:26 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912d8239so7753135e9.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347585; x=1790952385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XehuDLVM1Bv2l5+xhxYL4ZQldRyNcmqwuaGcBK4xzrQ=;
 b=BfBpXErb9NLea3uuN/EP6dQXzYDe/8hFL6IftZIx1TSntNe/s9IzXCK+mIe8YR0ZJy
 nv8vieZ3rUUAPA0xoF3Xp4ni2foAHJemilWTDkiCxYXH8WfMdW0CEx/U4ckuM+t6v3L8
 4sxBaLkq408Sro6TbHsI1/cmj8uXMr8a++kHXFoajV7/hrowyX+PU176TCrnGNETzYvu
 8gKhGjXUnWYRb2Qa2HfmrPoW+mKFW01GMlJLk9Iq8/G1R1g1llUZfQMzHKiH2yDAEX0O
 EekbUWCfmWfDSp3qn1GegOFrgrY9ZggzR2unC07yFLBFAC29p9bvNJZpbLbuowPMLN66
 fJ6A==
X-Gm-Message-State: AFuF++no+wC25QQ1SPxv6Ok7tCj8i6bITRk8NZ85L7Fyuxr2mMuv9sjf
 KppSjA8nzXVY2ErbWo5d6jaWN5IEpOUl7oN8McN2bfERuWkjnBMSnhav9yXZZWjvhHYzBj/KGt8
 TElkuUEuMRA==
X-Gm-Gg: AYBFou2TnOlivpp4DWiggIdr5pWraajZbeE0k8dTpohe7wbJUz/9DXFqBB+MCgI5Q/s
 E9EC3b8IAuajZ52dRvoExty8eIkZtDLHwnnS7419+vefmDtb6f8rvRdPPUgKmWnTQXIAap0spuT
 DhT3HrHn8uxdvPzaupGY0Rhcc3632uycMl0FudXwiYBAhDR1A+aqSok5/c0MvS5OgeLq0vM2wmS
 X+x9LxjV3j1aARqOGiHbHa6v2GkIRT0CJ1S8zU51hYSo8vQrDGKOllO8UUmK/ha+a+m8rucuOtW
 M90PQzOUmXgXwhzPHRYJmsB5JnmuzRDFfDpqxkDbke1jTSaKVzXRKhUSs8ZvlYy7BVtMjYu6LpD
 pWw3ouxCsCSTTZ4+CwYIq0qvz2f/pHqV9ZiRmkZYiClJWG6yp3Gj9rqTFPC9z/zMJ+xfeHXqAfM
 WNCy8CF5olmTcJcF+EG9VbijBkP29binrkDUbFxoS5c3yEURN2JEV9UTa4WAZWE1g5gUqGiu7EN
 eRzx79t+TvRMOQxyUs7bzbEsTnzasK54DocGslKTqBy/Tw3s6s1UQ==
X-Received: by 2002:a05:600c:4f54:b0:49c:fa21:1c89 with SMTP id
 5b1f17b1804b1-49fe7bd0003mr102747905e9.30.1790347584859; 
 Fri, 25 Sep 2026 07:46:24 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff06cbdfasm62621695e9.14.2026.09.25.07.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:46:23 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:46:18 +0200
Message-ID: <20260925144620.4099186-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916205245.2349520-2-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/ghostscript: security bump to
 version 10.08.0
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://ghostscript.readthedocs.io/en/gs10.08.0/News.html
> "This release addresses a number of potential security issues."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/ebe6eaa9932490d58aa2eded1e2ab76d399f13a1
> with the exception of an unrelated build error with the
> bootlin-arcle-hs38-uclibc toolchain.
> 
>  package/ghostscript/ghostscript.hash | 4 ++--
>  package/ghostscript/ghostscript.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
> index 94017262df..00cb1378d5 100644
> --- a/package/ghostscript/ghostscript.hash
> +++ b/package/ghostscript/ghostscript.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10071/SHA512SUMS
> -sha512  7b38ca10fa7ab648924f7db3e2e4933c3d18e04c8db1346fca4d4f7b85dfbd7888d5fc46f413613b46429fb47b675a593994c25e50e9de4dcdbee3bdd8a5e449  ghostscript-10.07.1.tar.xz
> +# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10080/SHA512SUMS
> +sha512  8006e2a32d03759a905b9548bdd83d4563173041006750e17e428b9eea24ad519aa4452ceecd7c073d3c420a68bf1b07ccc9e0533b1a05935f6b39ea8d9ce875  ghostscript-10.08.0.tar.xz
>  
>  # Hash for license file:
>  sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
> diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
> index 08e2667981..288efe2674 100644
> --- a/package/ghostscript/ghostscript.mk
> +++ b/package/ghostscript/ghostscript.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GHOSTSCRIPT_VERSION = 10.07.1
> +GHOSTSCRIPT_VERSION = 10.08.0
>  GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
>  GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
>  GHOSTSCRIPT_LICENSE = AGPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
