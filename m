Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614B4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:44:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98EFB60F94
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98EFB60F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3846A6071B;
	Sun, 26 Sep 2021 19:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1cIY1vVPN7R; Sun, 26 Sep 2021 19:44:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 958B560719;
	Sun, 26 Sep 2021 19:44:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B99A81BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7C3780E93
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HWmIuEBzbJem for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:44:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D63E80E82
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:44:47 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id dm26so25808406edb.12
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 12:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=STbzHaBq9KjoH3lG6sVuLp9/1+4bGse7tWm50CxIZNU=;
 b=hTgvB169h9GrGsfNfkt1VIrRds/CBZIjtZeRgcK1iwgJ7uMch3RHiHcCGwaxoDn/tu
 28o1WLnCmXI0bsAtFtwN57SZYLXd2Kz888g2/g47zu3G4KhtlOu1WhFvcSIQq5CKzVKD
 qTF9TTN/d7eaX5tXWx7kniAoRm0iWBS5u0veUJagIAL737lfP5SdZdcHzBid6dIxEN2p
 5nl29aV/TeFkGX/gA8zes1C33c5l/ES6lL8SPXeYgedkORGAHj2Lzvi8Uy7piKcwKi7z
 xKVlxDMVrfi3FPiT1599e3VS6a7NCseXJdlBrxngcuWdIysE4FrnIgv2Eqt9YPz/hiKX
 oZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=STbzHaBq9KjoH3lG6sVuLp9/1+4bGse7tWm50CxIZNU=;
 b=L5yBkuUBRSUK6NU5sZfXelFuCKqrxkJ7ESHku/e1RDaHf1RXK+5+heeRCCc6RwzsGx
 R62i/behFeOIiKAwjj4/9hSKEWjUgkeFF9MSMe+mOSUO2zVkzPFfx2Yto+GGqlKEYaF0
 tp/vrPabIo3O04X0fRM9JnByri20Z4nSVH3R/hLI9T5+R2zy33UABzaHwdE2nHnPUFgc
 JLMaHsyAHmsQQSlGizf8sNe0RD6YsOd6+mnmR+bpKBzRqt3oTLoHDdNsBtAejPnbtc/D
 R/xKeTxvQsu3Er8Z3kCraCixlolmYILcZYWYrfQ4AXy6DnYvJYNnLGHDJHCFX0q1FHli
 i8Yg==
X-Gm-Message-State: AOAM532GheitkAzDNcaGZYUyJDU5MlII6rEntMt7qW+ZJVWb4Jh/0iyr
 SQEV7o1FgdN1c+UJP1zJG1C+0A==
X-Google-Smtp-Source: ABdhPJyXl2OOd/zEYsnlNCPvK2Rg9yLtyehi5HC/Wz37EP3pdEOgiivKPcCVzuf8RWfLbd2WScqnAw==
X-Received: by 2002:a05:6402:1841:: with SMTP id
 v1mr19518884edy.170.1632685485562; 
 Sun, 26 Sep 2021 12:44:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id dk27sm9332261edb.19.2021.09.26.12.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:44:45 -0700 (PDT)
Message-ID: <771ee988-a47c-3618-0318-408940eca7ed@mind.be>
Date: Sun, 26 Sep 2021 21:44:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210925074940.3212124-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210925074940.3212124-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/2] package/lvm2: make a standard install for host
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
Cc: Jared Bents <jared.bents@rockwellcollins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/09/2021 09:49, Fabrice Fontaine wrote:
> Make a standard install (i.e. with pvcreate) for host as it is needed
> for libvirt

  I don't fully understand this. Does it mean:

Use the standard install for the host, so e.g. pvcreate is installed as well.
pvcreate is needed for libvirt.

> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>   - Use --with-confdir instead of DESTDIR
> 
>   package/lvm2/lvm2.mk | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
> index 3a94aebfd4..5ca0dc565f 100644
> --- a/package/lvm2/lvm2.mk
> +++ b/package/lvm2/lvm2.mk
> @@ -71,9 +71,9 @@ HOST_LVM2_CONF_OPTS = \
>   	--disable-dmeventd \
>   	--disable-fsadm \
>   	--disable-readline \
> -	--disable-selinux
> -HOST_LVM2_MAKE_OPTS = device-mapper
> -HOST_LVM2_INSTALL_OPTS = install_device-mapper
> +	--disable-selinux \
> +	--with-confdir=$(HOST_DIR)/etc
> +HOST_LVM2_INSTALL_OPTS = install

  This is the default, right? So this line can simply be removed?

  Regards,
  Arnout

>   
>   $(eval $(autotools-package))
>   $(eval $(host-autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
