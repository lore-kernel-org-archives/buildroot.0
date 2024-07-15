Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E67C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F21F40965;
	Mon, 15 Jul 2024 14:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vywh85o6lOQd; Mon, 15 Jul 2024 14:45:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0540A408E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0540A408E5;
	Mon, 15 Jul 2024 14:45:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F7151BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38E6E80F85
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rgQrhTIfAnPk for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:45:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29C1880F6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29C1880F6B
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29C1880F6B
 for <buildroot@busybox.net>; Mon, 15 Jul 2024 14:45:15 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42679f33fefso29439305e9.2
 for <buildroot@busybox.net>; Mon, 15 Jul 2024 07:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721054713; x=1721659513;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LlpCKfa1UBkJej9572uNQDtHpjX0Xg/yFVurf7RmgFU=;
 b=bZmCXQd1rGWddPuzIyGIyW8hxP2A3CItN+5/Qz7eff9tdExY2qNg6DMjq3xx4NFmF9
 CnI8Utx3F19QsaamY6xmiJoEUVE6blO1b2EzyXe3SwfkFSixaX6TUJoKXAYHSOa7t03Y
 dFfB57b/Ry3XXNB6lWT7ZSKx3MXT7LN2pK9kXLYENLxYC5RFpqL2RNzkNf1gpdRlmt2i
 Ycd23KzYP1HstkSAHQ60wAH5Qm4IctMgPoux+JXzilUCzFxy0lRsGHdI89fse8G1Xh7m
 UoGai3poMU4Jaf7y+V1s2Ti877NvbBvkJ4xQqvmboS4k6T1dv77w6WrKhEp7UkZ7QkOK
 h4kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPVjzjeG7yXQSESYe+39ceChr4TY3JRDMKbc6zRUKLeKAoxtSRrbTBZW4HpRHYXp4ipuDI+dSAMWQtelRt5qflgtBl6OQ=
X-Gm-Message-State: AOJu0YwY4ABK/Y4m+FVGzvMKS51pzh3keYeLDVeNULsUUJPA9M+IolHt
 ouG70M9w5sqbJUWjXW5MPRDVQB8Jl9Tu+djveUS4qdo+5+s6N6WSDnCp7kHCYL8XYFvPPngpQXM
 IRkA=
X-Google-Smtp-Source: AGHT+IGtrhLg2+E9H3vRhCBLNAGcpX7YjQtZALZNfFTQ2Csa9oqQLTrXZvraytp92/kTGGQGPS7JOQ==
X-Received: by 2002:a05:600c:6548:b0:426:6eb9:db07 with SMTP id
 5b1f17b1804b1-426707db48bmr117726525e9.13.1721054713267; 
 Mon, 15 Jul 2024 07:45:13 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2d73bdsm125489485e9.43.2024.07.15.07.45.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 07:45:12 -0700 (PDT)
Message-ID: <d22724e1-cac3-4dd6-852c-77b160292428@mind.be>
Date: Mon, 15 Jul 2024 16:45:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad@gadz.org>, buildroot@busybox.net
References: <20240715134119.508896-1-francois.perrad@gadz.org>
Content-Language: en-GB
In-Reply-To: <20240715134119.508896-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721054713; x=1721659513; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LlpCKfa1UBkJej9572uNQDtHpjX0Xg/yFVurf7RmgFU=;
 b=hrJ57J35LpvuUDFnAGu/g2kGBG1x5d9xqqfD9ZiEbz2vWFk0tu+UP5Ej7JE4q+Ek0C
 h3C+5wPpxEC1L8KTthCn0LHtXiPWPpXSHHfximSF3Oo8v/ICLsR90OCRlJ7FY63eXJUt
 rPY3bkKkDaUptTBi8FM3/m729Z4NRT/P352RjTFjonK6b7/YhZA0t3fW4I1h3F8CM0FZ
 57JQ7yr8TiLDYGgLsnaTLNuu9OZA4ovbe6xD31xvODFycFfH1gJbIJE3oTLb4U09SXJx
 DAqqtGxQqgGcOXkc2yOOjEr3lwSp/dAiuHvgTiOP6cFin+jXhgJ/b25094oOCJ5IOacX
 +/nA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hrJ57J35
Subject: Re: [Buildroot] [PATCH] package/nano: bump to version 8.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/07/2024 15:41, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/nano/nano.hash | 4 ++--
>   package/nano/nano.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nano/nano.hash b/package/nano/nano.hash
> index fc9a0947a..04e3c6290 100644
> --- a/package/nano/nano.hash
> +++ b/package/nano/nano.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -# https://www.nano-editor.org/dist/v8/nano-8.0.tar.xz.asc
> +# https://www.nano-editor.org/dist/v8/nano-8.1.tar.xz.asc
>   # using key 168E6F4297BFD7A79AFD4496514BBE2EB8E1961F
> -sha256  c17f43fc0e37336b33ee50a209c701d5beb808adc2d9f089ca831b40539c9ac4  nano-8.0.tar.xz
> +sha256  93b3e3e9155ae389fe9ccf9cb7ab380eac29602835ba3077b22f64d0f0cbe8cb  nano-8.1.tar.xz
>   sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
> diff --git a/package/nano/nano.mk b/package/nano/nano.mk
> index 72f4de6a0..db614feb7 100644
> --- a/package/nano/nano.mk
> +++ b/package/nano/nano.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   NANO_VERSION_MAJOR = 8
> -NANO_VERSION = $(NANO_VERSION_MAJOR).0
> +NANO_VERSION = $(NANO_VERSION_MAJOR).1
>   NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
>   NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
>   NANO_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
