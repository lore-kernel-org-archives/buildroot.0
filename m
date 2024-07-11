Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCA2C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 07:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B83E2411F7;
	Fri, 12 Jul 2024 07:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4KU5oMfb0jVU; Fri, 12 Jul 2024 07:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EE9E4143D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EE9E4143D;
	Fri, 12 Jul 2024 07:07:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18E931BF48C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CA2D412C1
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCuYgByWZn3p for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 07:07:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5ECF541203
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ECF541203
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5ECF541203
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:07:00 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4272738eb9eso12208265e9.3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 00:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720768018; x=1721372818;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zpevz9Sq5PtUqm41I7U3VZ7y4Epb5fS4gKjnfOQ9va8=;
 b=sbtjN8pepljfD5gbdWebdiU6X0l+Fq9MXsSzDB6CVXbZCSg0z+DcfWY8Cwk/NDAQNu
 j9m6clUOAGAWpC0ClJEa7SEqdFU2rzJYBMOnucj+eRODtEAMJfIYeBrZmXwAIbYLJ1ap
 eDyfbngELr73tROXXkdebOeN99CaWYlWtiU+Ut5+063Cl0kMODWXnj1uoWm6chaYx5zu
 rW9X8V+9yzFg+a2xdlJy8Fk3DlEZsAO5jw3m/hGvwwha0qZHJz10SIXwwrPhL9D0TSov
 bS9omBjeas3msaih76kojwYfCsJ6Jk00XpihAFo7RtkOo8dCkicuScdSqiFEZYoOiIxb
 vATA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRS+YK4wWzDViTvpMDkt5ol3cks783jxeGxbLLLRye3dDhR40Oc0ITHfA0w4aUduCeld+eYXrmnwNv1RilwPKtq+oi3fwYvg==
X-Gm-Message-State: AOJu0YymxGWlmsdc+dtAQvJgoJ/QCKUubapdPCaNR/jb4G0/WU4lupDh
 XyZsqwvvmMuMnWLoMm4YX92TGhuOe0SFdB5T3+OqPurQRW4XXwE/R2fdQB76VP0=
X-Google-Smtp-Source: AGHT+IHlvkrJRovxCdpb2JyaW/pcnwpGK2t7PrWAhKylsZRa0slVQwx+/a3rTGkwcnQaTj5sIIu+Hg==
X-Received: by 2002:a05:600c:21a:b0:426:59fe:ac2e with SMTP id
 5b1f17b1804b1-426707f812dmr71482745e9.29.1720768018344; 
 Fri, 12 Jul 2024 00:06:58 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f23a000sm12491785e9.5.2024.07.12.00.06.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 00:06:57 -0700 (PDT)
Message-ID: <ca91604e-2c16-4239-a08f-626ec0b9f1f0@mind.be>
Date: Fri, 12 Jul 2024 00:48:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chris Dimich <cdimich2188@gmail.com>, buildroot@buildroot.org
References: <20240611180207.2138847-1-cdimich2188@gmail.com>
 <20240611180207.2138847-3-cdimich2188@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240611180207.2138847-3-cdimich2188@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720768018; x=1721372818; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zpevz9Sq5PtUqm41I7U3VZ7y4Epb5fS4gKjnfOQ9va8=;
 b=Mws2OVuChrx12GcDvcYLCcMk3uwch0gP//FiLyCqDqWDKNAEt+osTLLFZQgPFBTln7
 kUJOkUNTwKrB+5UMYAMIWPtxBwRuE6O2y2qJPkjBG2Dw0OiycE3hN2oJMPk7oWouZRJt
 27pCPbFCH0X5aV/vsszGfMbO0tUGAeOaaIUnmk+5NhtxSPyC3Bfqj6LYIQdfk1KNppTX
 INDNMBkrubF0HpWA2EGBIMGloxpeLCsEstUMl5Fl8A5+xP6gr6J+/vGSsvfcNoMbLass
 Jj7Z4u710fRf9gSm3CBHclHW5bpejLL5v5RzNhzT49FJQwPMIofrv3QODRx9iOtO+CGx
 fmmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Mws2OVuC
Subject: Re: [Buildroot] [PATCH 2/8] board/boundarydevices: add i.MX 93
 support to post-build.sh
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



On 11/06/2024 20:02, Chris Dimich wrote:
> Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
> ---
>   board/boundarydevices/common/post-build.sh | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/board/boundarydevices/common/post-build.sh b/board/boundarydevices/common/post-build.sh
> index 161ec0643f..12341ae75f 100755
> --- a/board/boundarydevices/common/post-build.sh
> +++ b/board/boundarydevices/common/post-build.sh
> @@ -10,7 +10,11 @@ UBOOT_DEFCONFIG="$(grep BR2_TARGET_UBOOT_BOARD_DEFCONFIG ${BR2_CONFIG} | sed 's/
>   
>   if grep -Eq "^BR2_aarch64=y$" ${BR2_CONFIG}; then
>   	MKIMAGE_ARCH=arm64
> -	UBOOT_BINARY=imx8-boot-sd.bin
> +	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93=y$" ${BR2_CONFIG}; then
> +		UBOOT_BINARY=imx9-boot-sd.bin
> +	else
> +		UBOOT_BINARY=imx8-boot-sd.bin
> +	fi
>   else
>   	MKIMAGE_ARCH=arm
>   	UBOOT_BINARY=u-boot.imx

  I wonder if it wouldn't be better to reuse the board/freescale/imx scripts for 
the boundary devices as well? There shouldn't be a reason why they are 
different, right?

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
