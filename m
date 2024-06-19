Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76FDC27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 19:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50F3A415B0;
	Wed, 19 Jun 2024 19:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 57aP05W_-K6x; Wed, 19 Jun 2024 19:34:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AF98415B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AF98415B6;
	Wed, 19 Jun 2024 19:34:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 939D51BF25F
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 19:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80BC041676
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 19:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lp7YVlhCqx3J for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 19:34:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 329AB404D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 329AB404D3
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 329AB404D3
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 19:34:28 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-35f2c9e23d3so848876f8f.0
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 12:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718825666; x=1719430466;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oN6kcHGkDyx0BA/S21ADdSjOQxGfObAUwyJSGysCHIs=;
 b=BtSKT5cM8FciXl2NF/7Mlj/49flR/OeoxiPjbxj0dF91VWcMjGyVGCqyGEqAjqgMK5
 23L3mZqHod1RLek2YyZN7aExscQbDSZJtJfTTOVyX3r5pgYawzspCa+lTK3U+6COJns6
 tAo18cv/svHEKpMNJp+cnREDxz/gRyCajRKxuCAw96yxOoqpQq0UJ+cRJ36SNgDP+MIo
 csgI8Og6hLBeJEJfe6viCUfNvvlUxlfMWCi23gw9aTiBAVrHImHGuH2Nre+ZBUei2sBc
 3oEg9FOINJ7+EokYKnlh7Xt6+MNyLOmBkvMnJ0zXHoON8r167WIBmVzOvkltQ8h7zmII
 Xo9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU70ogmiKVbK+9CBttDqutl2MkAYsyfaX7YW797HU3oIpuQIM/VOjuQ+9p75QF5FFPoz9cQzBtgGlhMwBxkj7W/N4SgBLhDiw==
X-Gm-Message-State: AOJu0Yxxvs/32jiyHxxw3Hh3b5QoKTzDo7dnXrcGQqTz+xoC6VFsK1vr
 HJdXLCQJHD7/wSsScT5/H/NLEig+IdNeTlixj2awQGX8Ckp2whwREFkwZTjc6/A=
X-Google-Smtp-Source: AGHT+IHVaaETajOlNNc3w7S67H/vmHLRvhtPLhmshouag9hw8/lc2uMi/5T7X4M/OKk99cZ0bjdS6Q==
X-Received: by 2002:adf:f2c3:0:b0:362:862d:f7b2 with SMTP id
 ffacd0b85a97d-362862dfc82mr5399005f8f.4.1718825666128; 
 Wed, 19 Jun 2024 12:34:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0b8f37sm309675e9.1.2024.06.19.12.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 12:34:25 -0700 (PDT)
Message-ID: <94b84944-e39d-4c0e-9049-5db8939e14fa@mind.be>
Date: Wed, 19 Jun 2024 21:34:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michel Alex <Alex.Michel@wiedemann-group.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <AS1P250MB0608C70246EB85EBC2432F31A9ED2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Content-Language: en-GB
In-Reply-To: <AS1P250MB0608C70246EB85EBC2432F31A9ED2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718825666; x=1719430466; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oN6kcHGkDyx0BA/S21ADdSjOQxGfObAUwyJSGysCHIs=;
 b=MdnmsCtVKEW5Jput35FL++ssGUJ47qsT0Ri05lR7MsOtUPULAx0owsELPpid4BIhsA
 NoG4z+I4TM19b51yo56uhY0/V9UVu42EutW0F6aZPPTx1HK/8nrh7k7kWlolXz8rk1o0
 wqKK1zf84i+vWcWG18+3CHHL585j/wRve+GWe5f000usFVFl1IqnEyQm8UR7QB6MaZBP
 vMuVSQUAckW8CBUs7b7XF3idmPRtK2sa/accH6gmMBYRGiXcDQtpgvmtRDhrBXTJgtj2
 WmYGGIEdjgbO+D/sYtbSsBTIjnD1D6UGjGGLSMWvsyjuKrnDtKSGyjvXieUhELr546sS
 RZng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MdnmsCtV
Subject: Re: [Buildroot] [PATCH 1/1] package/libzenoh-pico: bump version to
 0.11.0.3
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



On 16/05/2024 13:59, Michel Alex wrote:
> https://github.com/eclipse-zenoh/zenoh-pico/releases
> 
> Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libzenoh-pico/libzenoh-pico.hash | 2 +-
>   package/libzenoh-pico/libzenoh-pico.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libzenoh-pico/libzenoh-pico.hash b/package/libzenoh-pico/libzenoh-pico.hash
> index 945d0f9aaf..9ea45969aa 100644
> --- a/package/libzenoh-pico/libzenoh-pico.hash
> +++ b/package/libzenoh-pico/libzenoh-pico.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  c259da44aa919919d1129b6a46edb05e2f5f2bf2818f73c27f515e443da9fc83  libzenoh-pico-0.11.0.1.tar.gz
> +sha256  a5bc5cae6fd4ade3d69d8a2ed0aef89f4c8f752f79d74b7462f5bb3437680b72  libzenoh-pico-0.11.0.3.tar.gz
>   sha256  d386df32cf327bbb25abe894277d3d7e0f447bafc59f4ad362615b0136f30db5  LICENSE
> diff --git a/package/libzenoh-pico/libzenoh-pico.mk b/package/libzenoh-pico/libzenoh-pico.mk
> index 86204de14f..9163ba30ad 100644
> --- a/package/libzenoh-pico/libzenoh-pico.mk
> +++ b/package/libzenoh-pico/libzenoh-pico.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBZENOH_PICO_VERSION = 0.11.0.1
> +LIBZENOH_PICO_VERSION = 0.11.0.3
>   LIBZENOH_PICO_SITE = $(call github,eclipse-zenoh,zenoh-pico,$(LIBZENOH_PICO_VERSION))
>   LIBZENOH_PICO_LICENSE = Apache-2.0 or EPL-2.0
>   LIBZENOH_PICO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
