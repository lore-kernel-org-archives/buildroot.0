Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B689FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 20:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EF1A60E31;
	Mon, 27 Jun 2022 20:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EF1A60E31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jFLRx4rFZjpY; Mon, 27 Jun 2022 20:13:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5534360C28;
	Mon, 27 Jun 2022 20:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5534360C28
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FE181BF2B0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A34060C28
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A34060C28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lp3xWBDM-QPS for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 20:13:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E530D60ACF
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E530D60ACF
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 20:13:10 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ay16so21456212ejb.6
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 13:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UWQGtsvaiqA7H/LFzxu8peYtSBk+DtW78amZzmlyN5o=;
 b=d7ZZQEPhAyXYmO/8F9Fd2fX03qq9CHk5ZKLh8OUoC5Olo/+gXoQoMPoYTg7Ir8/xQC
 qFqVMftBujMBPUlNlalBhptDHRkYVQ4FL3PjjOsWHJ3I8sa20jZjjfCAuXsjQkhRJG+r
 J9b32QV/kTx7hFctc/So02e3x4gTEDsaKcwYXdLE9u7+HKBK5mbjzBlKNUtEMJdVR5PT
 vGA4vOXBsgj99dGbeHesf2srvUZEetwSZjfSf54Vy++QNv2oJpOJSPXzhK6Smw1fgb9V
 qCyopEqTTaeOMVpgRnmS5UnWE9JXKFpwd9KkLjloMVhWnKhrCdZc0egp5pCYUrF6Gx4o
 gxkg==
X-Gm-Message-State: AJIora8js1Wb5RdAacdda/oAuWh9esI4WOODPHCWvxXMGKj5pB+l4fEW
 sbG+eG/SCpoX7Lxk0A9CwKsizQ==
X-Google-Smtp-Source: AGRyM1tCaoaIJkaRBR9ypbg8eSgXnQthq+psJGevb40OAzoCkHGPbk/cCBIl1onMhv3l5N73g1kbCw==
X-Received: by 2002:a17:906:4fc4:b0:6da:b4c6:fadb with SMTP id
 i4-20020a1709064fc400b006dab4c6fadbmr14750143ejw.282.1656360788980; 
 Mon, 27 Jun 2022 13:13:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a50ff12000000b0043789187c1esm3190025edu.80.2022.06.27.13.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 13:13:08 -0700 (PDT)
Message-ID: <d10ed559-6557-d269-a628-713af06e0ec9@mind.be>
Date: Mon, 27 Jun 2022 22:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
References: <20220621083027.2587218-1-thomas@devoogdt.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220621083027.2587218-1-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UWQGtsvaiqA7H/LFzxu8peYtSBk+DtW78amZzmlyN5o=;
 b=D8/p2vTTvm925iR1EQQZrvVWr+9ViZ9ns+2O0IRB8enMBRI3ozhInk8t+T2M+97InI
 toD7HYiriqbkE7lS9Kcos2jVsUrpaBMpazWcXdhJKYZSRQnCJaVD2GEijRT6l1hkkjry
 +r2u8Xpv088oA6JwlDJWRNVRqQ6T8oBDP5VDlCN0SOb1nSiyrGihYn5ekSJfzmsH1ODB
 4s5YbJUkBhlcGxHJG4zkQJF/dCE4fSAeBotvMGRP2v76Q5+cD/GC1+xz5kxpLikkNlfU
 BYE0On6lsi/VCVvMMyOfNPinBaHvFQI3nGTFVyF+ZjdGc84IwZL4KocnNx9pcPf56xM/
 9LIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=D8/p2vTT
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: add qemu host tools
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/06/2022 10:30, Thomas Devoogdt wrote:
> From: Thomas Devoogdt <thomas.devoogdt@gmail.com>
> 
> Always build host qemu-tools e.g. qemu-img.
> https://qemu.readthedocs.io/en/latest/tools/index.html
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/qemu/qemu.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 290186ec4e..9e1bec3836 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -390,6 +390,7 @@ define HOST_QEMU_CONFIGURE_CMDS
>   		--disable-vnc-jpeg \
>   		--disable-vnc-png \
>   		--disable-vnc-sasl \
> +		--enable-tools \
>   		$(HOST_QEMU_OPTS)
>   endef
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
