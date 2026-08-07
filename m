Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12334C5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF96180EF2;
	Fri,  7 Aug 2026 11:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BoU_sGaUnsLP; Fri,  7 Aug 2026 11:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F319081258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786101889;
	bh=vaH4AH0mJyucCovVx8/AjMd8sAJD1T+4vLGBu0CPQvs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RLouX2NvxYo8p9l0ONFuS8Fk9oEZJvJLhe69oIqoIkcQXAJaoUtUhBEAEflVy8Gio
	 N5Dys266GPAGbOC/+6x9AhxRAT4s1zCa2qYV/awNzl4IGJXF6ZztAB1jBDoRAuUjJB
	 EwQXK3gUZV3y0C87kJxFDYer045tKm0tOH8GPC7TPyCJGUQD/HVDog0Qy5KR4P9rva
	 gmvgsATo75jNZR6VROAxqNqqRSdF4ydsvfrrqOLKiRjLfMOLysxRpMaUx4IyNviKyg
	 FoTW90xHGtfG6G8b1V6eTk4YMOMht2uSfdwjWZki5+gU+fkP04OqTg8eh4/3rn2gRs
	 P5yE6YGfgVm5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F319081258;
	Fri,  7 Aug 2026 11:24:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CBB010E
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E42281253
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GJVcxH_0c_Nf for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:24:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 244E280EF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 244E280EF2
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 244E280EF2
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:24:46 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-49954b88fffso16004565e9.0
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786101885; x=1786706685;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gAAYQNtmxZ0SqWYkne3B5c+KtTN1oaPz5r/udzdD/F4=;
 b=d3tW4vmfqUC4KFH09ZbTvIXqr0A655rvkn1hK10/IOVvr/SiTfY3MciNPb7dix5zKP
 mvUld6Yigic+PLEb4gfgU0Yaws8WkrnjOywrB2zoXjK4BeH8rcbAwlORvf2x2oqzebrA
 bdPkjwV0DnUpUObcbRT34qgi0J/SM9pogE1KX8X25Jz/MPWp+VBCSkqNYR12dB1eounM
 /YvuNguOlpaMtWk+DEWchpZFTMdYVF68d0iwraKYNdVbfw+WWvAJomhSBW9L2xnMWbZM
 TbtHKuBL/4VFZh67jO68culkbb4OUvICUSUI4pPkzB7Mm8iGBlk9oPZhx62uIkVnPyFe
 nmpg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpS1e7y2yNKYtGCDTOsX2z9QeoDEMd0vgCQbCSxgcNvGnAmqBGGL7nnJvAsImkOmpHnNu72PPDopX4=@buildroot.org
X-Gm-Message-State: AOJu0YwY0slmFqrfeNiD2lrPefIk34Tbnk7/UZhQpw6cUzjnnwKxiKtW
 1SS8JjFzfa6Po0xSrBXbN0dBkm9eDElTXimCl26OVsRwGIgJ3gi2I5kG3rNoHcQWtl+8Xgyzpdi
 XkZhT
X-Gm-Gg: AR+sD13REQB+jy/Vuz4YfE/Fa1rq2NBppjtY5Mf/+gtqGuHA4lYhWkhKQOkG2Phb4w/
 MGZR6MNeixKCxh+nJE5RUKDdp04zyzmScfVcX8ukO5YXTw+Hkk5o+KBPQG+qbnerD+9nTo8fGqz
 oJGZqGw9+snTSXGnQfq+JQQ2MDfJKJ6UbKw9W9r8S8JB7OmEzAKUDNLx6XpYoVWdhfdKl9sH2tt
 YI9QaOwu6SBn+w4GwZjYc+FTP+/D9IDdIzBJVdeUwnUyWX+G4NL0P/QJk7b6jqbIpfGtn9qANwu
 Fr/9BkqJNrUuUlbiD/M1MiPeCo3yeREZGfAaO3fXhP4wSO3eeaUIyQVVYMcTNt3GM6DXWrMk1QO
 7D7g9gPSHI1zl8lzkM07EtHzvUkby+G3owtpqECuZLSTB3+gjthd88OQ5uMCDG09Lgmb/Ca9/B6
 JfzTNJXJ9iDp01rUwGCRAPWy4BxhvGESdxXNoz1m0pLwiyKHEGH8dRvJN85/+oN0JQnXtRmV6BB
 3jeN1UYbHDmU4wOJw1Kjk2OXDqB7xcit78xbc4k2UaGJNYN
X-Received: by 2002:a05:600c:12c8:b0:495:63e4:7f78 with SMTP id
 5b1f17b1804b1-4994e7baae6mr198241265e9.10.1786101884887; 
 Fri, 07 Aug 2026 04:24:44 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499542183b2sm156327265e9.4.2026.08.07.04.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:24:44 -0700 (PDT)
Message-ID: <07452f3d-ed10-4c5b-9199-366080ee76d5@mind.be>
Date: Fri, 7 Aug 2026 13:24:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>
References: <20260726204646.3149810-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20260726204646.3149810-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786101885; x=1786706685; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=gAAYQNtmxZ0SqWYkne3B5c+KtTN1oaPz5r/udzdD/F4=;
 b=F7pjCR/B47gT/yf6bbrNtYAjmmHpuRs9x/kChflWLAo+CJ37jMmuGFa2b7tfYPHNpB
 57y8cAI2t4DsYawrXPFHXhEbYwV89p+Cs2PeNY2IFCEkSp2VVJhm6cRawi849aIM7AS3
 JZAtF3wwvwnK4/DTfkxr5UHEflVprvs7hQH08tlnjX0FtR2pIOZoR0RlY75hHDLQarcU
 b30W8rDl0cES2QCweq10/ONhCjyE3Y4WxZ05EC8erA/STz9aZd9IQ2Zxbj5WQWqCOJin
 GiA8IBLXEMQlnZbmd6XZx+cZa99379Qre8ca0GGIJBrzFUWo5o4OB1TUDnnB8hGwyRiV
 5+8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F7pjCR/B
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx91frdm: bump
 U-Boot, TF-A and Linux
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 26/07/26 22:46, Julien Olivain via buildroot wrote:
> Since Buildroot commit [1] "package/gcc: switch to GCC 15.x as the
> default", compiling freescale_imx91frdm_defconfig fails in TF-A with
> error:
>
>      include/drivers/nxp/trdc/imx_trdc.h:7: error: header guard 'IMX_TRDC_H' followed by '#define' of a different macro [-Werror=header-guard]
>          7 | #ifndef IMX_TRDC_H
>      include/drivers/nxp/trdc/imx_trdc.h:8: note: 'IMX_XRDC_H' is defined here; did you mean 'IMX_TRDC_H'?
>          8 | #define IMX_XRDC_H
>
> The issue happen because this defconfig is using a Buildroot
> (internal) toolchain which uses gcc version 15 by default.
>
> This issue was fixed upstream in [2], first included in TF-A v2.13.
>
> This commit updates U-Boot, TF-A and Linux to use the NXP
> tag lf-6.18.20-2.0.0, which include this fixes.
>
> Note that, as described in the commit log of [3] which was used as a
> base for this defconfig, U-Boot and Linux were forks. Now the
> necessary patches are included in the vendor BSP, this commit
> switches those repos to use the vendor ones.
>
> This commit also removes the linux-headers.hash custom hash file
> which was never needed, because the defconfig used an external
> toolchain.
>
> Also, due to the upstream uboot commit [4], this commit adds a uboot
> config fragment to disable CONFIG_EFI_CAPSULE_AUTHENTICATE, to
> remove the dependency on the command "cert-to-efi-sig-list", provided
> the host efitools package, which is not yet in Buildroot.
>
> This commit was run tested on board 700-94610 Rev A1.
>
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/a75b8623f5515d99bec48f96586115953150558e
> [2] https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/2e9198d0e0cbe9546348dd0a71ff6c3d2061d4eb%5E%21/
> [3] https://gitlab.com/buildroot.org/buildroot/-/commit/2e05f22ff862192a7e512d0db0486351bba94ae8
> [4] https://git.u-boot-project.org/u-boot/u-boot/-/commit/fd58c275f6ba524101ba0990e53f5a11ac390bd0
>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
Applied to 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
