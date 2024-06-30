Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BA1C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37B9D81099;
	Sun, 30 Jun 2024 14:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-oltCkDzLTd; Sun, 30 Jun 2024 14:39:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EC2681091
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EC2681091;
	Sun, 30 Jun 2024 14:39:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3AC131BF35A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28A4E60635
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3TAFNOwx6yW for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:39:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0FFD560633
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FFD560633
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FFD560633
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:39:42 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4256742f67fso15987055e9.3
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 07:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719758381; x=1720363181;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4xql9v4TvDkLUdXXtM5z9ErOb93h5lyGrPOcW7Ct7g8=;
 b=LTqfNilNblAveMJrF8Q9h+cQuwS8BtXFnvAbvpdkLh+yi9/s8Evq2mASFWWd8cxIx2
 VjVC2gb07GbAVKuGV8v6oXZri6Q5z0xBTKNwMIbFIZoyddeByqV9TVwrD/xW/83HLPjw
 w0kmmI6fujj5vog/EtRg7fEoxdt/TDNUDeUZ4awV0J7BpH+oonzOZX+rYqzuX2FS+uwM
 rwxM0RSLO7UTR/tl+eaqnbUu1cwEQ68j2+1MmM/NjjeTObopZWDrVMh3ohDrmusFh+ZT
 GEhN5lllmZYOXIc19yuVn64jGom+klhIJxGOLB1J2r1NPldtvR9059vlTIjpU9Xvlln9
 ueAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUz0yQy1IujgG+Uar4dmXq8BT/7xXhN/EETpR66+OKsF05hbvWcoHdXU0TsxaHTft4TUtzh0VCmsWT+EdjZWQEU053IhMjAA==
X-Gm-Message-State: AOJu0YxMcd9G6c8x6sfRIj3GAY9539whpbpLuV86HLWgtUvHHa2g/Ap6
 7g9uLw1QfrY7k6I1Ww+Mf659vrgoBlJMJxSyMOikIH+LaLT2wGgoM0A44q3sW87USBgtkn6SMgA
 n
X-Google-Smtp-Source: AGHT+IGfx/g/m+iRH4jemjXtG/9178Dx+PYF6Gig8uhyWFsPIOYeT1uiH2GYgyLL/5kMgK9KeqbvdA==
X-Received: by 2002:a05:600c:2e0a:b0:425:7853:e2d8 with SMTP id
 5b1f17b1804b1-4257a00c929mr20950665e9.18.1719758380968; 
 Sun, 30 Jun 2024 07:39:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4257a2f7451sm54532845e9.0.2024.06.30.07.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jun 2024 07:39:40 -0700 (PDT)
Message-ID: <635cfdcc-c057-4f94-9b5a-d52f56365bba@mind.be>
Date: Sun, 30 Jun 2024 16:39:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
References: <20240628161227.50575-1-christian@aperture.us>
Content-Language: en-GB
In-Reply-To: <20240628161227.50575-1-christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719758381; x=1720363181; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4xql9v4TvDkLUdXXtM5z9ErOb93h5lyGrPOcW7Ct7g8=;
 b=CKgss3vN3r2D1birC9FviBfWBUNJ5qT6v6Hcbz/zdEvRiak19h2q3ut5OTi/uHh47E
 LYmWqnnjE4P0Treoi5hSKakRRIWv1Awl3u7FPtChzWMk3SVeB8YksonJJ9nPAWJ3dPpa
 KKKxDCu3o3nu/98ZXjgXeSDZR7KQZftN/Q6e4L09KTogUayJ+z6wDiPIG/ty1h1GCOV+
 id4pzqVMPtN1PaBJe6TpXH0lt1tSMtBqcGVAwfuQ2s9Iuazq+mySndlhhhTXlmtwMHg+
 Jk0AnJVKL+qFDUNvoAe3nJgQO8Lo8GZGJNf57bdhbZTcIz3iTJEUhJ3RRU38KtcxPgIt
 6Jcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CKgss3vN
Subject: Re: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.7.18
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/06/2024 18:12, Christian Stewart via buildroot wrote:
> https://github.com/containerd/containerd/releases/tag/v1.7.18
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/containerd/containerd.hash | 2 +-
>   package/containerd/containerd.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
> index 1b2609e880..03964ace3f 100644
> --- a/package/containerd/containerd.hash
> +++ b/package/containerd/containerd.hash
> @@ -1,3 +1,3 @@
>   # Computed locally
> -sha256  ae55b25fb04b45dfbbde8280b034783a48ae7c40350d17fd272be5cbf0284cf1  containerd-1.7.14-go2.tar.gz
> +sha256  91685cebd50e3f353a402adadf61e2a6aeda3f63754fa0fcc978a043e00acac4  containerd-1.7.18-go2.tar.gz
>   sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
> diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
> index 81875f763c..b822516938 100644
> --- a/package/containerd/containerd.mk
> +++ b/package/containerd/containerd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CONTAINERD_VERSION = 1.7.14
> +CONTAINERD_VERSION = 1.7.18
>   CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
>   CONTAINERD_LICENSE = Apache-2.0
>   CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
