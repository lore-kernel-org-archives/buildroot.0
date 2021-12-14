Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A12C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDD614060C;
	Tue, 14 Dec 2021 20:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id weoEweiXEVh2; Tue, 14 Dec 2021 20:06:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D953E405F4;
	Tue, 14 Dec 2021 20:06:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 317A21BF30E
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 208FF60BF3
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cwt9LAUnsDws for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:05:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B2E460648
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:05:51 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id v1so67398418edx.2
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 12:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=50+tb1nEgNrCMTw2bbeyGlUwhtVQFZZdH/3ihs+S778=;
 b=YkHQ051EXLqiU5UdzLILaMbKR5Ehf7ZYpHkrhGEMk0Pc8LyXR6kN6KvkcJw6X8Nmw0
 w36oDLJ/K934ngoRLEv0gk1t4xoeYHVzuFIWDLmYQvRINWaSJjsdcrfWUkrt3O/Me4XN
 CqvGmngYgY3JYmoZeqFPbzthbjbKwrSkNn7eLyyzK/t4boaGxAr2z6WAM2ekj6hE5BhM
 eYBkW6q87GM7c1c/xdH1InC+RkzBosxpRsAz+yY1wrmQhr9kc/jxhMv1Ecc5QJguuQOm
 IhdoxmQC2Na7WczVaZzX51wzFK/3Ectjm5uxYSUQFfgOmPEowo6JHyUnjQ3RkjIN93sQ
 2hNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=50+tb1nEgNrCMTw2bbeyGlUwhtVQFZZdH/3ihs+S778=;
 b=ZAnhhKSIVa1tW8lmoR9MjIUsKaOonio6u++0Um9SF7lUXu4Nnfb6UlJ75YfQTicf9T
 O6/2ck4UiGkXsotpqH9hCjPhGeCQZ47+MwWECfJF5JiLdpGtcQ8THTcJ+92RNc39b3/V
 PstCkv3HABFpDdYQ1o3GhwAwtDSuTEEU40jbbZsrcn3WIr+uEz2SxkibT60d+fFmjvDp
 hYcfOEPZ7HJP3IREID3LmsYEaU4HUXFbfI9m3xbWkpBAcSZ+5GrqyHaXV1tv7POW/3Ox
 KS4NNl2QS5glD9p2u+SakE3/VPLzR3ICuU53uAYz5rTXe+WixrCHA1swH/C8ocgdGyeN
 uzTA==
X-Gm-Message-State: AOAM533yrjHLN01VGgUMPefNzO3653+XT0WcHqW7bnH8dTU4c95qcpb5
 PfrBnu/cRBcq+nVXALtzVRtpfw==
X-Google-Smtp-Source: ABdhPJxlYsAlUstoSl4LZXq0Ppp9JTEr8SBQIWjKubyIPWiIo4M9CPgJIMuqPIC1QbVI6nMiYVCGGQ==
X-Received: by 2002:a17:906:9258:: with SMTP id
 c24mr2366505ejx.473.1639512349564; 
 Tue, 14 Dec 2021 12:05:49 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ga37sm236776ejc.65.2021.12.14.12.05.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 12:05:48 -0800 (PST)
Message-ID: <ddbc8c35-fe6e-8b4e-2488-3a6ec9416ccd@mind.be>
Date: Tue, 14 Dec 2021 21:05:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, buildroot@buildroot.org
References: <20211213105255.650164-1-maxime.chevallier@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211213105255.650164-1-maxime.chevallier@bootlin.com>
Subject: Re: [Buildroot] [PATCH] configs/beaglebone: add DT for the
 Beaglebone Black Wireless
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
Cc: Lothar Felten <lothar.felten@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/12/2021 11:52, Maxime Chevallier wrote:
> The Beaglebone Black Wireless needs a specific DT, which u-boot tries to
> load based on the board name. Make sure we ship the DT so that we can
> boot on that platform.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   board/beaglebone/genimage.cfg    | 1 +
>   configs/beaglebone_defconfig     | 2 +-
>   configs/beaglebone_qt5_defconfig | 2 +-
>   3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/board/beaglebone/genimage.cfg b/board/beaglebone/genimage.cfg
> index 1fa6c5f381..42ca2cf107 100644
> --- a/board/beaglebone/genimage.cfg
> +++ b/board/beaglebone/genimage.cfg
> @@ -10,6 +10,7 @@ image boot.vfat {
>   			"am335x-bone.dtb",
>   			"am335x-boneblack.dtb",
>   			"am335x-bonegreen.dtb",
> +			"am335x-boneblack-wireless.dtb",
>   		}
>   	}
>   
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index 763696d1dd..06154d98b7 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -23,7 +23,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,5.10.30-ti-r3)/linux-5.10.30-ti-r3.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>   
>   # Filesystem
> diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
> index 5f084b77df..11a91677ce 100644
> --- a/configs/beaglebone_qt5_defconfig
> +++ b/configs/beaglebone_qt5_defconfig
> @@ -15,7 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,4.19.7
>   BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglebone/linux-sgx.fragment"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>   BR2_PACKAGE_FBV=y
>   BR2_PACKAGE_QT5=y
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
