Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55ACCC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE93240AEA;
	Sat, 23 Jul 2022 13:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE93240AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vn53NlB0dFfz; Sat, 23 Jul 2022 13:05:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7664B40B10;
	Sat, 23 Jul 2022 13:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7664B40B10
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7FE791BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67AE160FDE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67AE160FDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9D6gV-wZdlxN for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:05:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58FED60FD1
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58FED60FD1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:05:16 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id c22so4210729wmr.2
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 06:05:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1UuFaGM7wy/SpD/sAssQ+DOtlIyjtFXCNxjlolsqh+w=;
 b=a3GxXkLkFpLHHpgDhxWx672VIpr6khi/UTpM7vIqThf2h4vD9gibok5B7xJYbd0HVN
 S4BXvbuUMD//58xt5IWsTo4TobnD4fsjjcG+Q2G05bLMm0R6DrhXz/80K5MSF+ymEGsa
 y9Deg+FdptGF+P271+HqMiLJoYmAVPgiouo3+aVyoymcsr0HXuvwL+HXBSdj24dCBoVL
 AasAkaG/rpBUNLNjT7C/3nUuTlDsSqbF6iFkTVfpxyjTuOz2z30h6PrHj10RA7OnUZWj
 38eoKZwBNdNpZqgnxSY9/8e+d9/iVbNxxvSynocmQrpRcVVOeuTQhkXXRQyh5zFYbzoi
 R1xA==
X-Gm-Message-State: AJIora+7XHvyY/6cWMsoxRe1hO7/Qm8nBKLsvwPe6L+3CvWA6N2RRnKI
 UBhsRzBLzFRp8FQiMBWjqYkE2w==
X-Google-Smtp-Source: AGRyM1tIouhtj7553WV1ROzvqHUuKqa7974r1+Ptedsl7oeOSJgEn4ItwNZ1HaymP846HFEEcop6jw==
X-Received: by 2002:a05:600c:a4c:b0:39c:34d0:fd25 with SMTP id
 c12-20020a05600c0a4c00b0039c34d0fd25mr2954135wmq.172.1658581514400; 
 Sat, 23 Jul 2022 06:05:14 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b003a33227e49bsm7970883wms.4.2022.07.23.06.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 06:05:13 -0700 (PDT)
Message-ID: <22bbdf89-8434-4dde-9232-7b89054c85aa@mind.be>
Date: Sat, 23 Jul 2022 15:05:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
References: <20220723123202.17977-1-heiko.thiery@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220723123202.17977-1-heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1UuFaGM7wy/SpD/sAssQ+DOtlIyjtFXCNxjlolsqh+w=;
 b=aDLGfUFtUMJG0T5x5QBsXz8g+0ZJ12rMvgZClqv0fOhTE3jGSPumqqzOAV+1pnGqZh
 GCuy3u1UZKBJFfqD29UA1MMHujAPw4QygjDzuEg+IDbBQJYZGlhI+yBwqAqYsn7BVrje
 Wspl0VXYCe2yu9cYvnCKcj5/N4N9EonlLTcwZew4iV3KReyVYUCbzvQZZijaISawpp3e
 +rtHICYjLRVsYD9XDkDEGQZgmnTmf9WNuB6Cl3bDuceQWe46VSzcgNx+XqKPSZKEWiUN
 T23vZyGaMRo6mj4xUwc2BFluPWAFypgPiuNkxa49/X+QFw3eWzw9sLVZdUPG6WNKGo53
 9mQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aDLGfUFt
Subject: Re: [Buildroot] [PATCH] configs/kontron_pitx_imx8m_defconfig: add
 BR2_GLOBAL_PATCH_DIR
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/07/2022 14:32, Heiko Thiery wrote:
> Add config option to set the board specific GLOBAL_PATCH_DIR.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360083
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/kontron_pitx_imx8m_defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
> index ac03871682..460f1a97e9 100644
> --- a/configs/kontron_pitx_imx8m_defconfig
> +++ b/configs/kontron_pitx_imx8m_defconfig
> @@ -6,6 +6,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
>   BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/pitx-imx8m/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
> +BR2_GLOBAL_PATCH_DIR="board/kontron/pitx-imx8m/patches"
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
