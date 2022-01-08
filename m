Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D85CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAD7940252;
	Sat,  8 Jan 2022 15:12:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pvu-f3mktK_E; Sat,  8 Jan 2022 15:12:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B167402D3;
	Sat,  8 Jan 2022 15:12:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE0D01BF95D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8AFE40180
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JcQuO9NikR6V for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:12:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D74EF40117
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:12:15 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id c66so5833965wma.5
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 07:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=96L6h0EH7OfMGVZUvSr9yxdhmJ5j7bmN96RkamCKnpA=;
 b=L4ekSt1ddOb2kcMubQQkNXuvtbtUdFG0BbHl99XvG4Mv/m58jvuxKJEM478tXryEDD
 mYKc3PTzc4+8kKK2xt0EimQD1j5TfjJ5BXJ5Vfx444h3l/ZhrpDU0yEnqdWrurEvVvkP
 ltCkqj6dAtwpg19P+lfZmHYz7oEQ3Dt+ZaSRbpErFUiNotpDSU4jwEiSnWD2rCaz6EvQ
 UorGhXlgLGM64yIZC1VQvQX6DGzrzZDWfmIh4u/YoJAMsDyMTN59GCAC+iWlZUV/o64T
 ucX4fhm1ZYWcv/M48xmGHuYg6tXqWkrtjIb1TGKS2wo8RsmUWiQyF+XEay4vEy/mjnSm
 zTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=96L6h0EH7OfMGVZUvSr9yxdhmJ5j7bmN96RkamCKnpA=;
 b=beczB3qscu/bpUJ7XVH+PIEgIGSzNdMqlrBJSmBHwBkmEthqnKOSVyBbYbzLieL0pq
 4L+iRZ96o/k0tdVelj6CMb44nMYI4/wXPiufBd+x5zwnJ6Tg9IdyBLQgGSZ5u+Ble5HB
 8jRoZVY00hhWQTmV1YZUrnG3OAoQZX7uC/ER2Yl5lwi8mUzBeqXAHCPMxZ80zHYUL7X9
 jk9LViaJZGky8xopsrcVKWOaQmJoY/CO2yK8nRRcHWLG8nRuVxFPY+qYGdudWDSwgYqh
 J1bkm6pvqkqIuvI85I7f2IZaj2G+71GHtyUi/u9TVNYGrqDPW5vXjvV0gjmVSPKI+VXn
 RxCA==
X-Gm-Message-State: AOAM531HgvEZgxUjUQZzu+QOdbErwzcMXa/ylZO75K7GODjSiqBqf5tK
 oVbHLYngp9xaZ6EJ3X0bAFja3Q==
X-Google-Smtp-Source: ABdhPJyWGlPRh9t+rFBZsqUdVQHNzQAMke06hMGDg2dOR/3b5arFyuMxRr8N9D+BpairvMdpwA3k8g==
X-Received: by 2002:a1c:a747:: with SMTP id q68mr13614755wme.98.1641654734172; 
 Sat, 08 Jan 2022 07:12:14 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id l4sm1985981wry.85.2022.01.08.07.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 07:12:13 -0800 (PST)
Message-ID: <89aa2f7a-5293-89ec-cdeb-89039cb1992c@mind.be>
Date: Sat, 8 Jan 2022 16:12:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Colin Foster <colin.foster@in-advantage.com>, buildroot@buildroot.org
References: <20220107222644.1612206-1-colin.foster@in-advantage.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220107222644.1612206-1-colin.foster@in-advantage.com>
Subject: Re: [Buildroot] [PATCH v1 next] package/mstpd: bump version to 0.1.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/01/2022 23:26, Colin Foster wrote:
> Shortly after MSTPd was added, version 0.1.0 was released. Update to the
> latest version.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mstpd/mstpd.hash | 1 +
>   package/mstpd/mstpd.mk   | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mstpd/mstpd.hash b/package/mstpd/mstpd.hash
> index fd76b959db..64e946d6d1 100644
> --- a/package/mstpd/mstpd.hash
> +++ b/package/mstpd/mstpd.hash
> @@ -1,4 +1,5 @@
>   # locally computed
>   sha256  91a1862548b5b509caa2e96e5fb9912bc98d4d58cc98e99a577824735756c14d  mstpd-0.0.9.tar.gz
> +sha256  03d1ff4ca189d54322562cb2891888768af719d2c73ceafa5f1ca96133dffeb2  mstpd-0.1.0.tar.gz
>   sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  LICENSE
>   sha256  c5cfd44652276184374adf454150d436ce958ce50acc4ef9ccb3605a5ca7a9d3  hmac_md5.c
> diff --git a/package/mstpd/mstpd.mk b/package/mstpd/mstpd.mk
> index a870352869..907d094242 100644
> --- a/package/mstpd/mstpd.mk
> +++ b/package/mstpd/mstpd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MSTPD_VERSION = 0.0.9
> +MSTPD_VERSION = 0.1.0
>   MSTPD_SITE = $(call github,mstpd,mstpd,$(MSTPD_VERSION))
>   MSTPD_AUTORECONF = YES
>   MSTPD_LICENSE = GPL-2.0, RSA Data Security (md5)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
