Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99251C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 15:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 485AA82660;
	Sun,  5 Dec 2021 15:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7tbKaMflyXhC; Sun,  5 Dec 2021 15:54:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C819E81C93;
	Sun,  5 Dec 2021 15:54:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9BAB1BF57C
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98400401FF
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:54:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HXM1I6hxENH7 for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 15:54:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5015400D3
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 15:54:19 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w1so32837683edc.6
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 07:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Cevv53CUkaUEnhCTPKK2ySre7fgAymGlG5TB55GdMIw=;
 b=HSqKcAmcYueNIG2py9dgxGi0d42toQsra8YigGcaYZYZF3NIJmi3ByXQ0MlYDFsic1
 d2hpoXPTkKzW5B0UGF+rCNj9cKAO8AdaVgLAOZzTux1iXPPk1/t4IDPiUAWXNVRkbRrf
 weh+2jq2Xl4rz1BEfNh6EswQWiaEEg/p/2c0gptbXzwTsjeU416/p1JeyXjnqbJsGGST
 rvPVwwgOeG47j5YuWdQvfbzkhoOCzBGn8DL7z9w7yYHo7GTElC7mG336ArLVujZM3jw7
 UEHLXi4MwAmUHmrK1W0P0semhK/Ej2BJ7WYLZen1UeRkxgVtm9yPEObmpQuPdbuepU4L
 eTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Cevv53CUkaUEnhCTPKK2ySre7fgAymGlG5TB55GdMIw=;
 b=pnmq8Bq/LXkdTPB2yzxq+CLBrfvisFV5Me93nS7QlsBlnGQlSSJtcPKxKQ05C08UYT
 w4bd63yD8DJMTNlnuLxdWSiVjCGYpKHwpxJ6sHy3wGwkgkSU2LitTWpo9TaYuxLoow9s
 REyP7eozF/w1mg3Zwq8Ykl9C4i1pF7ozouvmpGcAbrXjRu1kKIz3udyrnJ5Xrn0X5bQg
 zYoBgAmuZEM+IrjT00OhjBlmV9pJW/Bjd41GQH8wWEIgGunxhgnARNKmohahVVRGeei7
 ou4ikOlRfJ2Af1ZAdVyi+LyJEYJxn84mY0Zzr/rYB9T920aJV7UQJjyZzK/5WRyuSSgo
 1dAg==
X-Gm-Message-State: AOAM530iVqsHdWREftX7eBFK/yXMMP4lwQnUMLhQ7my3CPZpzqbhT+mQ
 MI2/uOti99g9Bhj0Wy211zFFeA==
X-Google-Smtp-Source: ABdhPJyhVGMu1noQLHDBWkCMUakx6ZCr1m21XkhICW9B1RJYXD7jK/CWFUAGSpluEsWCrJzSY9sCfA==
X-Received: by 2002:a17:906:3489:: with SMTP id
 g9mr38476449ejb.17.1638719658018; 
 Sun, 05 Dec 2021 07:54:18 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t7sm6235495edi.90.2021.12.05.07.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Dec 2021 07:54:17 -0800 (PST)
Message-ID: <7413def9-7c88-3e8e-4bb1-f05a557f7b24@mind.be>
Date: Sun, 5 Dec 2021 16:54:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Bartosz Bilas <b.bilas@grinn-global.com>, buildroot@buildroot.org
References: <20211123160833.29036-1-b.bilas@grinn-global.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211123160833.29036-1-b.bilas@grinn-global.com>
Subject: Re: [Buildroot] [PATCH] configs/chiliboard: bump to u-boot 2020.10
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



On 23/11/2021 17:08, Bartosz Bilas wrote:
> Fixes:
>   /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of `yylloc';
> 	scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>   2020.10 version is the latest one that boots correctly,
>   the newer ones are being stuck during clocks initialization.

  As this thread concluded, we'll simply take 2020.10.

  Applied to master, thanks.

  Regards,
  Arnout

> 
>   configs/grinn_chiliboard_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/grinn_chiliboard_defconfig b/configs/grinn_chiliboard_defconfig
> index e72a82cee8..80f3077b76 100644
> --- a/configs/grinn_chiliboard_defconfig
> +++ b/configs/grinn_chiliboard_defconfig
> @@ -16,7 +16,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="chiliboard"
>   BR2_TARGET_UBOOT_FORMAT_IMG=y
>   BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
