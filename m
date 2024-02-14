Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E15AC48BEB
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 09:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEF6541773;
	Wed, 14 Feb 2024 09:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xkz7e-zDRFmv; Wed, 14 Feb 2024 09:06:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7C5441694
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7C5441694;
	Wed, 14 Feb 2024 09:06:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 671B81BF398
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 09:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53AE54050C
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 09:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N3H_zmrz3kRq for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 09:06:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 14B4B404BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14B4B404BC
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14B4B404BC
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 09:06:00 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4108cbd92b9so29649495e9.1
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 01:06:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707901559; x=1708506359;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nP5YIRDZuBQqTk6fPmtG+Amix0WauxFrH8jj8UJq6EQ=;
 b=GyVDzTRtNPxc8weSDTJvDCEDeJUQXFpm986SJK/GF+CLW8dacudnY5R93Nz7K6B+vC
 OmrRwImJJpr+eTQgRzZHxRzh+K2iUc3ncUgyNp2K0MztY6pK/eUwztT20QslFB1Uj6qC
 mUaGp9s/GDcNaUbm+Kpq+zc9yykGakKXZcp0S+WuIzTiBKGqxzSk5x0ZaffOXrAMNN0C
 xyFpQlYnbn2ZPCCgRmFlCnPj8TEV9wZS5meAiwYn84q/41baxKGmgPLcVVweXMFU6ViY
 48XbZnf3FZlJFAOVvTiUkZYAJzW5Pj8XwucKWujEpYaOmgVjS/L/STvD1+uQLaLe8j06
 qFAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUonYNlADjjAE9RlSH18T3HjvTlf9flUaC65i6N5h6sjEPYAt6Mu5kiXu/0Qy2eWPGv7cG1Pl9bcSGHtrOgH/yJkqrJAZPVvw==
X-Gm-Message-State: AOJu0Yznf2fgZsWJC569ysQFVq4aQv/7NYBWVMUuhFnBn/kjQ0B1VJi1
 ymfz+5AVzM7o7o4LV3OHoMISqEn+9q4eVfEa8tTy3jOaL/sbGgaGplBvQNNuhYs=
X-Google-Smtp-Source: AGHT+IG2XZOClNYXAOLl6ZFU9r6wZORNpy9E7CU0Ownp2Kc4HVOWGXuPgA/ZUvvv0dMJpkCdRyRy3A==
X-Received: by 2002:a05:600c:a018:b0:410:6d23:dd6e with SMTP id
 jg24-20020a05600ca01800b004106d23dd6emr1777678wmb.13.1707901559028; 
 Wed, 14 Feb 2024 01:05:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXpuq8PMppwwHj62OB98gFLwVsALha1Z7eD7IpovKbLQDBUD0deJDqWItLII2zv+DhI2QY86vtKDldlb8/uv+RMuX1F55/rnRYtVafrMEnBiwknToiwx1MzMimoytAFkFJTh55UMsy8tvw=
Received: from [192.168.43.18] ([109.139.41.245])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a05600c474f00b004117e45f12esm1321063wmo.22.2024.02.14.01.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 01:05:58 -0800 (PST)
Message-ID: <c84373f6-68fb-4e80-b21f-21a270cd9703@mind.be>
Date: Wed, 14 Feb 2024 10:05:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org,
 =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
References: <20240213130444.12586-1-ju.o@free.fr>
In-Reply-To: <20240213130444.12586-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707901559; x=1708506359; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nP5YIRDZuBQqTk6fPmtG+Amix0WauxFrH8jj8UJq6EQ=;
 b=C2HQeeeVs3VoKPvCVAAlXho2OMuhWLdXKbnN4NZj+FNfMgarT6LQVCfmf5aIWDd6on
 f/P1Ukvk5YPLgPh/pKAGCqgROysvTXCILdTDO0GPUj9MgkN/tIJbQKh9TXgoS5mBtrW6
 LAxRg/ux3mZByB30zeEf5GuAsI5T07j8Fob5bC9MvF03u5cdwixVetKBSaCfNU8nyKgU
 LcUOXgsOSLt+2KNPb2J8QY5LiGA42QkqFRWWkNJOLx6q+YikCNp3Kn/YwodLF4+0gaP2
 JZhWdLaisx5BNZHBK0IcwCCffeGw94e+P/lB4wLJRYy5QNoFKedc3/ne5eMSmNuxKkmd
 8okQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=C2HQeeeV
Subject: Re: [Buildroot] [PATCH 1/1] board/freescale:
 imx9-bootloader-prepare.sh: fix script
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2024 14:04, Julien Olivain wrote:
> Commit c05f27c "configs/freescale_imx93evk: new defconfig", when
> applied, added few ShellCheck fixups on top of the orginial
> submission. During those changes, one extra backslash was added,
> making the imx9-bootloader-prepare.sh fail.
> 
> This commit fixes the issue by removing this extra backslash.
> 
> Fixes:
> 
>      dd: failed to open '/buildroot/output/images/u-boot-atf-container.img': No such file or directory
>      make: *** [Makefile:820: target-post-image] Error 1
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Thank you for fixing my mistakes!

  Regards,
  Arnout

> ---
>   board/freescale/common/imx/imx9-bootloader-prepare.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/freescale/common/imx/imx9-bootloader-prepare.sh b/board/freescale/common/imx/imx9-bootloader-prepare.sh
> index a9611a81bd..8ab5a241b0 100755
> --- a/board/freescale/common/imx/imx9-bootloader-prepare.sh
> +++ b/board/freescale/common/imx/imx9-bootloader-prepare.sh
> @@ -21,7 +21,7 @@ main ()
>   			-ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} \
>   			-ap "${BINARIES_DIR}/u-boot-hash.bin" a35 0x80200000 \
>   			-ap "${BINARIES_DIR}/tee.bin" a35 0x96000000 \
> -			-out "${BINARIES_DIR}/u-boot-atf-container.img" \
> +			-out "${BINARIES_DIR}/u-boot-atf-container.img"
>   	else
>   		"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -c \
>   			-ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
