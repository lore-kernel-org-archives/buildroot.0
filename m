Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAAEBCD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 18:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F8A74031D;
	Wed, 10 Apr 2024 18:04:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u0DvZ3k82Hsd; Wed, 10 Apr 2024 18:04:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 469C0416FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 469C0416FA;
	Wed, 10 Apr 2024 18:04:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A9AE1BF5A2
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 18:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5519680E6E
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 18:04:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGMvpC-o7UpO for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 18:04:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BAE9180BED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAE9180BED
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BAE9180BED
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 18:04:21 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-416b7f372b3so11311395e9.3
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 11:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712772259; x=1713377059;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YVqOg0q2q+q8RI5ds/QffDw5gA4FqNaBKNODefq6hK0=;
 b=knoq4fNjOIp3LbthEvDxfYleeW9dvEDuh4BMeF1DyKg08iCH0dlGQzJWSj4L0fS+FW
 c92kzudFfV56mh2iWoT72CkyPAFAJ2DLtuD1JPprZ2uLBnWCnzMfQGd6pJklTLxc+fFw
 AIBD2ooOqNYsRSOFztHU08BBMhDlle5bDo52ok+z6BqpxS/tZaCgg4Gwx226EmZWM0Qi
 E3iwtQPR4BdqcJER2p4o4LUFExXC4BEcI6PFZuiDv2TTYDJm7g2+nQxMpSlnk8hTHufw
 N5GOgBWsMtxxOvMjbq7giVDFwRu4UCmD38N/h/hzmosLgbVJXNhZm2OgEK4t/Abtr4BZ
 OTgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWRJox/x435Yu7pGAScbeOhVgfqtVvdmYD/34PhRCs01Ma1tNN4WsBOL/6GePkg0HNHMEAxlbd9S9AuD/AJvkX2NjqeLD7Mg==
X-Gm-Message-State: AOJu0Yx/50+bVa9dug9agSnFVBNIAdlX35xCsKpkY8bpBSRtCpfzhWU0
 IIe/HXsn518PN5AM5Pg++T5SUFJcsfU5ZHPNWYMKlwf757APE9EbA4OxL+RClOA=
X-Google-Smtp-Source: AGHT+IHwZw8QbOS113Bm18GO5AK9Dwb/SSiW4e6E1IXOg7f3VYDgOhCrozYqliPm1eJ1SYfL88SgCA==
X-Received: by 2002:a5d:4e92:0:b0:33e:38f1:77f6 with SMTP id
 e18-20020a5d4e92000000b0033e38f177f6mr2377640wru.39.1712772259212; 
 Wed, 10 Apr 2024 11:04:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a5d6944000000b00343b09729easm14333229wrw.69.2024.04.10.11.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 11:04:18 -0700 (PDT)
Message-ID: <e16166b5-9ca0-4d2e-9c69-80d74d5d7e07@mind.be>
Date: Wed, 10 Apr 2024 20:04:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240409212758.380547-1-ju.o@free.fr>
 <20240409212758.380547-2-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240409212758.380547-2-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712772259; x=1713377059; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YVqOg0q2q+q8RI5ds/QffDw5gA4FqNaBKNODefq6hK0=;
 b=dvfYJHtIS8DltEuUclbWopyHgqO9f6Ubp8lZ46kuDS2c5DN7cOxLXNvksilZDq6Wjw
 mLSTK6nJqwkcjM3l5eM89wB6+v5GxfVbbE230gJB4zyIXCRkzq9osDkpZaWQjCUJrgwR
 16rD8UcHTQaXg/wYODnUN9KIL+31Sxa7HQyyNPNOsbv3QJPv1R7zIi8X11+g5DwPyAjH
 TjLmHNpkGbaczdWPZsIY+kZWwsn5KSc/F/C2kjHnfYb8QScfKz6ICHwJddTMrLJ7yc32
 FycvLR/g8VOXCT6i1oli9yj9iL5uc8tI+Bfpv1qg7+qe/HJDKD3DhWbv7PFO3S8t/3h0
 ymcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dvfYJHtI
Subject: Re: [Buildroot] [PATCH v2 2/2] package/rdma-core: bump to version
 v51.0
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



On 09/04/2024 23:27, Julien Olivain wrote:
> For change log, see:
> https://github.com/linux-rdma/rdma-core/releases/tag/v51.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Changes v1 -> v2:
> - introduced this new patch for v51.0 bump.

  Why did you do this in two separate patches, instead of a single patch that 
bumps to v51.0?

  Regards,
  Arnout

> ---
>   package/rdma-core/rdma-core.hash | 2 +-
>   package/rdma-core/rdma-core.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rdma-core/rdma-core.hash b/package/rdma-core/rdma-core.hash
> index 27fe7e208d8..f8b01e882dc 100644
> --- a/package/rdma-core/rdma-core.hash
> +++ b/package/rdma-core/rdma-core.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  ecb866caaec7ce13f40074c769860f9c36c3a37a70913c5218217e3293d7cb11  rdma-core-50.0.tar.gz
> +sha256  a4065b0454249839dc75b61c6ee428e917d9cddf964ff7a33d479f00d1264ba0  rdma-core-51.0.tar.gz
>   sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
>   sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
> diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
> index 7818b396a46..834d9ea3efe 100644
> --- a/package/rdma-core/rdma-core.mk
> +++ b/package/rdma-core/rdma-core.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RDMA_CORE_VERSION = 50.0
> +RDMA_CORE_VERSION = 51.0
>   RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
>   RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
>   RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
