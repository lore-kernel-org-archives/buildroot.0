Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B4BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:22:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F16860F0F
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F16860F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 606D1404FB;
	Mon, 11 Oct 2021 21:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rmcWBNb4uvPs; Mon, 11 Oct 2021 21:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB07C404FE;
	Mon, 11 Oct 2021 21:22:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EAECC1BF865
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E66DD4037E
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:21:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NJa4PaE1Ec8I for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 21:21:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B813640375
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 21:21:12 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id a25so56871796edx.8
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 14:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=C6+iC3ugLNT+jxaohe1Bp4vk7vJbvy/Ojzr9SYts/ts=;
 b=fqxfn9bm/uTF0L7mQnU+P8FPcrmiverqtYKszKiNx1NqBDHJ+pySC2jNbiVo5kVqVS
 7mUT1sgH2KgntIKB91wlM3bL/G+QcQfiLfzB81NUElukr1VuFqMjLSHgeaZWA/hYOV7R
 aHaOxTxekfi5vC/ZoJAwbfKihf8HD+pnskrfaGc6FLoukk3xB215ZzVMlyUwB21Ru590
 k5CXiiQtiixCmPWAvNa1Aa+u9/yoHuB6Y1durIwaK61KggRXv88LYnpnpvDw8S8Dm4Hp
 zMeb5/hTf7TU+5/DylMBOyc5Ut0TbYoCx+Uc5vghuOImaRj5bWiwo0Xn4yAlxgFaLJn5
 ivhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=C6+iC3ugLNT+jxaohe1Bp4vk7vJbvy/Ojzr9SYts/ts=;
 b=06sKz+xThFPB4Ay3+tmQfwZy0cKgWWAcn/mxUZJ+gCdcZRD5klUMkCoPWM00LWJT6X
 QB39DecahBiWvAb5PzGqzrRkujIEykTBRIGA28dk+es2L4M6F3O7rR1rPV2eYRzrvpRg
 M55X8+FlakcDBbi1StFlmnhXx8OJemM4QuKxsaO3Wth3g6Yx8izKb6yngUPA+1lzXmE3
 whEpP/BDshlZ68ybMRZe1npSR9M9Co04dPZ7GOTcy3nMf7Ben+ygFSEWfjECOEp8BEq1
 Kxq+rF8CGIhxqij4GDMgjIHs5SXTLdkUGA4QZ+JwiiaPOXC27pebarIQTFJp9Cdycn0a
 GiQg==
X-Gm-Message-State: AOAM533oWcZQ6WIQjKKtovLRt7ItbWqDtsfFXOfC8vWTRD2rKTYtRwex
 N8SrSK4gE9w8TcWwY+yNR5oOeh0idyV0JPDk
X-Google-Smtp-Source: ABdhPJxdolaqRpPLHqX4evlZPvfX/gHOWJrXTrCyN+SqZv9pp8gxZz3Swj7wCiHLgBH5QV2pV4XMBw==
X-Received: by 2002:a17:906:6c8:: with SMTP id
 v8mr28662709ejb.428.1633987271023; 
 Mon, 11 Oct 2021 14:21:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t20sm3990055ejc.105.2021.10.11.14.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:21:10 -0700 (PDT)
Message-ID: <4d1f4847-175e-54ea-8e06-748e7e901007@mind.be>
Date: Mon, 11 Oct 2021 23:21:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211003085637.535029-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211003085637.535029-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/boinc: bump version to 7.18.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/10/2021 10:56, Bernd Kuhls wrote:
> Release notes: https://boinc.berkeley.edu/wiki/Release_Notes
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/boinc/boinc.hash | 2 +-
>   package/boinc/boinc.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/boinc/boinc.hash b/package/boinc/boinc.hash
> index 981d9141ea..35e59ce415 100644
> --- a/package/boinc/boinc.hash
> +++ b/package/boinc/boinc.hash
> @@ -1,4 +1,4 @@
>   # Locally computed:
> -sha256  e66fe2e2a804687c1fef2a0d2819d634dc24c9af1cb371c71ac468352f7a562a  boinc-7.16.18.tar.gz
> +sha256  274388d9c49e488b6c8502ffc6eb605d5ceae391fb0c2fc56dbb0254d0ceb27e  boinc-7.18.1.tar.gz
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
>   sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
> diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
> index 079b065efd..12394ae924 100644
> --- a/package/boinc/boinc.mk
> +++ b/package/boinc/boinc.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -BOINC_VERSION_MAJOR = 7.16
> -BOINC_VERSION = $(BOINC_VERSION_MAJOR).18
> +BOINC_VERSION_MAJOR = 7.18
> +BOINC_VERSION = $(BOINC_VERSION_MAJOR).1
>   BOINC_SITE = \
>   	$(call github,BOINC,boinc,client_release/$(BOINC_VERSION_MAJOR)/$(BOINC_VERSION))
>   BOINC_LICENSE = LGPL-3.0+
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
