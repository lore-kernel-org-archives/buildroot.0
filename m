Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82901C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 13:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BFD560AA8;
	Mon,  8 Apr 2024 13:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnlHtSO0sAsj; Mon,  8 Apr 2024 13:27:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A5F860B00
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A5F860B00;
	Mon,  8 Apr 2024 13:27:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D215C1BF344
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 13:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBCD440ACB
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 13:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2OC1tUJRGtt for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 13:27:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CFFB440159
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFFB440159
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFFB440159
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 13:27:00 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33ddd1624beso2541775f8f.1
 for <buildroot@buildroot.org>; Mon, 08 Apr 2024 06:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712582819; x=1713187619;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e9QpCZdUmEFpdLiYyLzVEgFai2zujg4WlrXrB9wxBqU=;
 b=oNvSoa4EM4IegV7i7VUTNvCKPg8Zi9NoIHRgOLMbylkM77cBAsIPBunYyIeAhjelOH
 U5jvKJ/efVCpXX1NnBJg8XgUpV+u8SAIVYPg+YthdRS4FXMi+pRWNf209+mR2lSZiIud
 B72XS3BF6lt2zmVosCcPCFJapBj0BOHLsUMfcmpZMFk9Ul8mjUCP+k7D44zPoeKhAchb
 Ipvd3gv8pm2U2hmhwWnupWStm1431Ln6UUUVth9h7OKhllhAm1zOp8dNmaI+jjyxEmI/
 wo6B+Y8iT79JAp2NmPK+Yz5Zzbhsz+xjdwiGm8PqgDngBH09AYfmQDdZZiAqbqv/Eg/q
 A3RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg3t94iJo3o6VrqethbIuKRLWj0XN76sgcoryzxLKL9f/icMPmQUG+zw0qr0FFEy4vpEcOzDQKpW0dBnPFn53BskYBjaEyXA==
X-Gm-Message-State: AOJu0Yxxgdj5PtsUKTT68/r5kold+uDdSVfkMvbS1ZCphRMMbCMBeOM/
 11MsRztF/6P9ZntzgywK7KqxLhCq1XmQuNglW91XZEaHW7IdUl8sbZCFadN8WWU=
X-Google-Smtp-Source: AGHT+IG2lFls/eUT6Ge244UkS86WN1XxMoSEDhbf00gsEUgLsdQ676qmAYGCWqWLqulSVp4I6wEcZA==
X-Received: by 2002:adf:ed11:0:b0:341:c739:5ec1 with SMTP id
 a17-20020adfed11000000b00341c7395ec1mr9148140wro.4.1712582805628; 
 Mon, 08 Apr 2024 06:26:45 -0700 (PDT)
Received: from [10.1.0.191] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 q1-20020adffec1000000b00345aa92fa1dsm2923774wrs.117.2024.04.08.06.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 06:26:44 -0700 (PDT)
Message-ID: <49c61fda-f6d1-41a3-a37f-2a3fd75198b8@mind.be>
Date: Mon, 8 Apr 2024 15:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <20240407103512.1112712-11-romain.naour@smile.fr>
Content-Language: en-GB
In-Reply-To: <20240407103512.1112712-11-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712582819; x=1713187619; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e9QpCZdUmEFpdLiYyLzVEgFai2zujg4WlrXrB9wxBqU=;
 b=T8QVF/rJoHjShSmVuVF4X/1HzJW8Q9YshHmuL0+oE0/YJq16U2eYRhkRW87fQNo7dH
 LmCJVwBsfBfi7k3TI8cF0/cYBak9dV9b9/bjhWvn8bZIqaZWTeOfo/do1A+fULbaje+A
 MKrwkZXiYelL9618n0GU9wLx6oIQ5dmROqN9EBJoYNZBEUjz1hoSC1+YCEJixlR4rs4B
 asw96Vz6qO2pu//94Vg+ks9wk4vHefUPmE9fRrcQXwLaz0wfdfrvuGnoDGQ5Al9L8/Ay
 kr2FMFqTxnYyarUTvdQL/41ctKsva/k4FOkvOEfGFNhIQqMSpE4isg2BB/YLmJfX2jyE
 Sl3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=T8QVF/rJ
Subject: Re: [Buildroot] [PATCH v12 10/16] board/ti/am62x-sk: move
 post-build.sh to board/ti/common/am6xx
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2024 12:35, Romain Naour wrote:
> From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> The patch makes it clear that the moved script can be used by the
> am6{2,4}x platforms.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> Changes in v11:
> - Remove board/ti/common/am6xx/post-image.sh since we use
>    BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS option instead.
> 
> Added in v8
> ---
>   board/ti/{am62x-sk => common/am6xx}/post-build.sh | 0
>   configs/ti_am62x_sk_defconfig                     | 2 +-
>   2 files changed, 1 insertion(+), 1 deletion(-)
>   rename board/ti/{am62x-sk => common/am6xx}/post-build.sh (100%)
> 
> diff --git a/board/ti/am62x-sk/post-build.sh b/board/ti/common/am6xx/post-build.sh
> similarity index 100%
> rename from board/ti/am62x-sk/post-build.sh
> rename to board/ti/common/am6xx/post-build.sh

  Oops, never mind my previous comment about moving it to common :-)

  Regards,
  Arnout

> diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
> index 1c7085d04d..b62f624d82 100644
> --- a/configs/ti_am62x_sk_defconfig
> +++ b/configs/ti_am62x_sk_defconfig
> @@ -2,7 +2,7 @@ BR2_aarch64=y
>   BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   BR2_GLOBAL_PATCH_DIR="board/ti/am62x-sk/patches"
>   BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> -BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am62x-sk/post-build.sh"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
>   BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
