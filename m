Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A14BC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 07:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D4E7412BE;
	Fri, 12 Jul 2024 07:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yrG_CYhGnc-G; Fri, 12 Jul 2024 07:06:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2315412C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2315412C8;
	Fri, 12 Jul 2024 07:06:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF6CF1BF48C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBF3C413BC
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aRpWcMy1bXGS for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 07:06:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9A334413E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A334413E5
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A334413E5
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:06:55 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ee91d9cb71so17969071fa.0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 00:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720768013; x=1721372813;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1OgUnD+I7ig07WAPfal0UsR2tI0qaYUXUC9AtAiITNs=;
 b=WUhLEkLMsFsLDqQWJOoYScoI4xLTrfgGHZWGhPPMcDrGoUGZpECgdkw+B+F/RjWBtR
 tg6vlo84uGTkQkKgqYzVRGi9x/ZPrD8RNZvsa9sqMWxbcQV7Qe85XJHJ5TTq5yyXt1cz
 LpFJYafPXNxpXa8ipdrD+PFkGX5+CUUrkajHvFuZhRsISxmfMY7cXzuTfiSj0ImznaLK
 uKxVP/j9hGS5x5ZfKUUy7tkgcnEslJY72EiZVh1qMcqC+1UumBHmJg8Df69aoeDXgeEb
 nXLMzcT/ZDNjl5F/ivwz5Ql6DBeOCSR42SYosOqCKVPST9ZEl0UYW8Cm0YGh6uau1KcW
 5vmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX17BG8cRiwuOFoqc7rLrYSV/uCCCFMuk5/kFz/vxHUePkaNbQ5hwLsO4By/Lo3UISgEWloPCtYwKQUEjqjgBkoJ4mKYsPzMw==
X-Gm-Message-State: AOJu0YwOZZM4naeA7p3xsWcnuDm+KiYdSeB68jx9+KJZdoGy78SbyglX
 A+YwZ534/YlqKhJCla+pUc4bndm4hJXgFoTukDTpwoRhzQtnBmB+V3a+dvYwblE=
X-Google-Smtp-Source: AGHT+IG3j3HY90GecWTiqRth61O5kb13PY2VFsamH5SJEDvxB70TsjdbeD3LnOri1xjNWiYGEl0wag==
X-Received: by 2002:a05:651c:1a0f:b0:2ec:5ff1:2274 with SMTP id
 38308e7fff4ca-2eeb31027acmr98112481fa.25.1720768013134; 
 Fri, 12 Jul 2024 00:06:53 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f23a000sm12491785e9.5.2024.07.12.00.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 00:06:52 -0700 (PDT)
Message-ID: <d3c5ae50-fa66-45d2-90b4-d6ffdd46511c@mind.be>
Date: Fri, 12 Jul 2024 00:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chris Dimich <cdimich2188@gmail.com>, buildroot@buildroot.org
References: <20240611180007.2127244-1-cdimich2188@gmail.com>
 <20240611180007.2127244-13-cdimich2188@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240611180007.2127244-13-cdimich2188@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720768013; x=1721372813; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1OgUnD+I7ig07WAPfal0UsR2tI0qaYUXUC9AtAiITNs=;
 b=W7Ky2qGEvbKLiFpKf9TqyYIVZcZJplkUx3uIN7d6MBIVP5sgP3s96C2a6sSDm0kYKJ
 JFWzFuDrrnGw+YLJbTy6jVxWCLgyjxyzTEcrIgC8R9FRM2tpNT4kjFq/R8RtmGDnSmMY
 4vxdXn2UOcOr6YT/WUm+OLSYIAU5n3mIyaUWRqeCSiLSHscymmgNE91aRckkxGsvvjgP
 kgXPsjQ186Y/8CkTb5DIdJ4RFFs56AgNA1De0EMQIE8Wv8VbIuSZe0OpOU1O/ZzjgR5r
 x2I0HS62n2Au6ESHAXPdrreOFcJFqOd1h/Txw4LWeWR00/KdNnsBweQYS5/otI5W9UJP
 aG4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=W7Ky2qGE
Subject: Re: [Buildroot] [PATCH 12/12] board/freescale/common/imx: add
 support for i.MX 8ULP
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/06/2024 20:00, Chris Dimich wrote:
> Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
> ---
>   .../common/imx/imx8-bootloader-prepare.sh     | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
> index b353d506fe..807e56d35d 100755
> --- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
> +++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
> @@ -58,6 +58,25 @@ main ()
>   		rm -f ${BINARIES_DIR}/u-boot.its
>   
>   		${HOST_DIR}/bin/mkimage_imx8 -v v2 -fit -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x920000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
> +	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP=y$" ${BR2_CONFIG}; then

  This introduced a new shellcheck error (missing "" around ${BR2_CONFIG}", so I 
fixed that.

> +		SPL_LOAD_ADDR=0x22020000
> +		ATF_LOAD_ADDR=0x20040000
> +		"${HOST_DIR}/bin/mkimage_imx8" -commit > "${BINARIES_DIR}/mkimg.commit"
> +		cat "${BINARIES_DIR}/u-boot.bin" "${BINARIES_DIR}/mkimg.commit" > "${BINARIES_DIR}/u-boot-hash.bin"
> +		rm -f "${BINARIES_DIR}/mkimg.commit"
> +		if grep -Eq "^BR2_TARGET_OPTEE_OS=y$" ${BR2_CONFIG}; then
> +			"${HOST_DIR}/bin/mkimage_imx8" -soc ULP -c -ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} -ap "${BINARIES_DIR}/u-boot-hash.bin" a35 0x80200000 -ap "${BINARIES_DIR}/tee.bin" a35 0xa6000000 -out "${BINARIES_DIR}/u-boot-atf-container.img"
> +		else
> +			"${HOST_DIR}/bin/mkimage_imx8" -soc ULP -c -ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} -ap "${BINARIES_DIR}/u-boot-hash.bin" a35 0x80200000 -out "${BINARIES_DIR}/u-boot-atf-container.img"

  I applied as-is, however I feel that this script could benefit from a bit of 
refactoring to have a single mkimage_imx8 call and chip-specific argumens added 
through a helper variable (using bash arrays). So again, if you feel up to some 
refactoring work...

  Regards,
  Arnout


> +		fi
> +		if [ -e "${BINARIES_DIR}/m33_image.bin" ]; then
> +			"${HOST_DIR}/bin/mkimage_imx8" -soc ULP -append "${BINARIES_DIR}/ahab-container.img" -c -upower "${BINARIES_DIR}/upower.bin" -m4 "${BINARIES_DIR}/m33_image.bin" 0 0x1ffc2000 -ap "${BINARIES_DIR}/u-boot-spl.bin" a35 ${SPL_LOAD_ADDR} -out "${BINARIES_DIR}/imx8-boot-sd.bin"
> +		else
> +			"${HOST_DIR}/bin/mkimage_imx8" -soc ULP -append "${BINARIES_DIR}/ahab-container.img" -c -upower "${BINARIES_DIR}/upower.bin" 0 0x1ffc2000 -ap "${BINARIES_DIR}/u-boot-spl.bin" a35 ${SPL_LOAD_ADDR} -out "${BINARIES_DIR}/imx8-boot-sd.bin"
> +		fi
> +		flashbin_size="$(wc -c "${BINARIES_DIR}/imx8-boot-sd.bin" | awk '{print $1}')"
> +		pad_cnt=$(($((flashbin_size + 0x400 - 1)) / 0x400))
> +		dd if="${BINARIES_DIR}/u-boot-atf-container.img" of="${BINARIES_DIR}/imx8-boot-sd.bin" bs=1K seek=${pad_cnt}
>   	else
>   		${HOST_DIR}/bin/mkimage_imx8 -commit > ${BINARIES_DIR}/mkimg.commit
>   		cat ${BINARIES_DIR}/u-boot.bin ${BINARIES_DIR}/mkimg.commit > ${BINARIES_DIR}/u-boot-hash.bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
