Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099FAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 20:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B01CC40438;
	Tue, 19 Apr 2022 20:35:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LJ2sT8a59uSR; Tue, 19 Apr 2022 20:35:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A0AC4030C;
	Tue, 19 Apr 2022 20:35:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93D641BF860
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FA55404D7
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wVTV1mezjYsE for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 20:35:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D48F74012D
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 20:35:38 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id v4so22771879edl.7
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 13:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lOOovXvGRRDNTr54P+Vs7hJwda5jIBGyT9J0Sk/U9V0=;
 b=anFoPIStl+w8eI61l8kQjguqVVaROGFPz+co5tUOpIFRuSQoyeFPUwVkhXqzhLqex2
 u0YN2OP0tU/uLNmLZoLwkiu27ejn4TPxg7DhSLBjhtrst1eBYj5f/KuYsF3nqcprq9kb
 kdMY1fZAX0TvJ0sKbGNbrPdAhck9syFKVxWdXyGjsPYQigq/XfF+PrvmP1NUtAbDDme0
 dQ4emlYJ2nbZufpgC3GzM9QkXqx9lfwU9enYGPb4O5GRZlXzYoR7jEz/mhJ/5oasB3Oj
 Q6NgN+/Ujh/VcqAqSc5E6Rm611S62LVanedNT7RkbaHtZXwLxRcfjLE8Ac+nap410L+j
 Gu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lOOovXvGRRDNTr54P+Vs7hJwda5jIBGyT9J0Sk/U9V0=;
 b=7StP3nIsEZK7CBLxXAb2AlhaBZeOvZUATvFOu3yF54GDyVPFXQLdPURNlKi7fHDG5L
 EA3136SYvKAdeIG1ow1zIlkk75u+vsZy05Fn2QlhKhn+daqbHwgnLuBeBaVo7fmmH+BR
 pRA9LoJxYIEEI8KIOmyiEKrKOr+FcaOAAZ6OYVzHvxn9qLONFMuTOK93swbg2eACDlpp
 vNO7ZMdd/3dTFOMhCgee8ymPmHPDOHxj57/IoUylkIIFwMXsEdlc78JV19wIsLrEPh92
 qp2zspAaNVhtwb5rwNqoOZGwqzUxl4hXOOxacfFRIuyPhGN+u6q9VjjqNz+X8Zjt8BT8
 44RA==
X-Gm-Message-State: AOAM531KJ5XrL20dsPGmTExK9TTOgdxNo3jlGfKbxltOync+Zvs1GQ3n
 E+ApPVL+Lecj34ywtpM7smQoPg==
X-Google-Smtp-Source: ABdhPJyhhkHUOizlGNNdQ0g8Dy1d/tVCohzvwjaUNXddcPtFMWtf3B8taQVYMnL8UUqmssORKQroVA==
X-Received: by 2002:a05:6402:4493:b0:41d:83ca:35d6 with SMTP id
 er19-20020a056402449300b0041d83ca35d6mr19190727edb.89.1650400537127; 
 Tue, 19 Apr 2022 13:35:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 lo15-20020a170906fa0f00b006e8a81cb623sm6020289ejb.224.2022.04.19.13.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 13:35:36 -0700 (PDT)
Message-ID: <bf3aa2a8-54d4-0b1f-a70c-5966b1e6e2d7@mind.be>
Date: Tue, 19 Apr 2022 22:35:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
References: <20220418142855.3489541-1-tianyuanhao3@163.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220418142855.3489541-1-tianyuanhao3@163.com>
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: bump to 903b6fc
 (v5.2.2.4 branch HEAD)
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/04/2022 16:28, TIAN Yuanhao wrote:
> This allows to build against newer kernels (up to 5.18).
> Tested on kernel v5.15.
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rtl8188eu/rtl8188eu.hash | 2 +-
>   package/rtl8188eu/rtl8188eu.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
> index 37767f5d16..9c7f2de4b6 100644
> --- a/package/rtl8188eu/rtl8188eu.hash
> +++ b/package/rtl8188eu/rtl8188eu.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  b2b06c842bccd730d68a26b1c1b5a24f18373401e907147bf5e775fa42a36bbb  rtl8188eu-60cb0b5a3cfc95e3f2e6fc294a28d987096b0559.tar.gz
> +sha256  6bc46a13b20a2ed121844e51fd690216b2ab3b1faa1af8d9501090026ca9bd22  rtl8188eu-903b6fcb821465fe9c63e83416080df70c1c3c90.tar.gz
>   sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
> diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
> index b2066080f3..fa420b0d57 100644
> --- a/package/rtl8188eu/rtl8188eu.mk
> +++ b/package/rtl8188eu/rtl8188eu.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RTL8188EU_VERSION = 60cb0b5a3cfc95e3f2e6fc294a28d987096b0559
> +RTL8188EU_VERSION = 903b6fcb821465fe9c63e83416080df70c1c3c90
>   RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
>   RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
>   RTL8188EU_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
