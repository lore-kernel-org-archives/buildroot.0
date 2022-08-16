Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72042C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 20:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCD5C400C6;
	Tue, 16 Aug 2022 20:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCD5C400C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vOXOHCgEzWPw; Tue, 16 Aug 2022 20:46:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B9DF408F8;
	Tue, 16 Aug 2022 20:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B9DF408F8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26F091BF2A2
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01AD660B3D
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01AD660B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aR2yM-g7Eohf for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 20:46:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA0CD60B28
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA0CD60B28
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 20:46:44 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id kb8so21122334ejc.4
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 13:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=aoOy/JWeo5bXYmv4mjVlJTLwWDREpXQ0uimx/WFc/+I=;
 b=QexXiA8cjsPPhXQCxdWIsAbd0IOUtgDhtsq1pXhJ7Jf9whmrtlytBNMhubhJqixo+B
 Tdt4y2fO/8hBF8HfF3kdNL0V969U60pEQ23KEoQacoLsq3fSIHI9BBfOORHaBI5IdCu7
 PkMIL8iygwYbPhul4G8mEOise9YUITCogRDAf4rORXXXscCv6+b03MkKNih/tXFQXoFo
 NCKrPZO8lYHOtyDQJkLpL9k2owfh8tepYvpu/omxZb7LP1QyoOzdGdVYmxm6X+186U8c
 Ow1XZSRqqHN5RYgNKARboScGNl6uZ1kEZTZdUOUtxueCSqaa44g9amMCSXiterTKSItf
 AJjg==
X-Gm-Message-State: ACgBeo2B/q6UpZRo+s5IY5sW0k6hPzj/G+CjP+A+TDg5tKobCLFXo1KU
 ObSuGhO2gICB7oCWolDIVOiXtA==
X-Google-Smtp-Source: AA6agR5VjQvMVKPxJZ+HvP7B8D/ghZUsBYprufZ2h9Fo3v0l5LU6+sSaxSIBXej8ulQ9Zj2ndGM1pA==
X-Received: by 2002:a17:906:c154:b0:733:197:a8c with SMTP id
 dp20-20020a170906c15400b0073301970a8cmr14869911ejc.483.1660682803045; 
 Tue, 16 Aug 2022 13:46:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 10-20020a170906310a00b0073145afd156sm5742921ejx.80.2022.08.16.13.46.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 13:46:42 -0700 (PDT)
Message-ID: <00072104-98ca-a1ee-5963-c1a7e151722a@mind.be>
Date: Tue, 16 Aug 2022 22:46:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220815154854.17628-1-giulio.benetti@benettiengineering.com>
 <20220815154854.17628-2-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220815154854.17628-2-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc;
 bh=aoOy/JWeo5bXYmv4mjVlJTLwWDREpXQ0uimx/WFc/+I=;
 b=Z387DIrC/xW/RMxg+9GN0agi0n5lcKkYzBmzpe2BaH5tnCwvGJJ4OUGXiQyZBv/Iln
 zm44ruM75jbXIiCq4FHl8CQXYEIWIY9qjC9Voom0u+HLptQQANHir7077nfw/yHKNkRK
 v89TUDG14F23JSoLRm483wuPjgtNRq/AcHgRCkqXpJibfnCOnLKBe1ICgcL+jW/73SFl
 g539wuG/rlVH3mTkGWOveGAU8eTs0GAG+xR43dgt/M+I8rt1ea1vFQO40Z3C9Goy/7Ip
 BGwDZ1gwj3IGKTKzlc/ZC1KvGh/MNVAQeDJZeHolvRxZaxkn0vkD4IoVO0KV1xOj3svn
 s9DA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z387DIrC
Subject: Re: [Buildroot] [PATCH 1/4] Revert "configs/olimex_a33_olinuxino:
 use NEON+VFPv4 as FPU strategy"
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/08/2022 17:48, Giulio Benetti wrote:
> The gcc man page states that specifying Neon as part of the fpu setting
> has no effect, unless the -funsafe-math-optimizations is also specified,
> because Neon is not compliant with IEEE 754:
> ```
>      If the selected floating-point hardware includes the NEON extension
>      (e.g. -mfpu=neon), note that floating-point operations are not
>      generated by GCC's auto-vectorization pass unless
>      -funsafe-math-optimizations is also specified. This is because NEON
>      hardware does not fully implement the IEEE 754 standard for
>      floating-point arithmetic (in particular denormal values are treated
>      as zero), so the use of NEON instructions may lead to a loss of
>      precision.
> ```
> 
> -funsafe-math-optimizations must be explictly specified per package to
> really use NEON as FPU,

  That's not true. The statement above is just about auto-vectorization, but 
it's still possible to use intrinsics or inline assembly to use NEON in your 
code. I don't know what exactly happens with those if we specify 
-mfpu=vfpv4-d16, but I expect that it will not compile those. So packages will 
discover that neon is not supported on the target CPU, while actually it is.

  Note that that unsafe-math-optimizations thing was exactly the reason why we 
thought it was OK to allow -mfpu=neon-vfpv4 to begin with - GCC is not going to 
generate invalid code out of the box.

> but it's something that is left to the user as
> well as setting BR2_ARM_FPU_NEON_VFPV4. This way the default
> BR2_ARM_FPU_VFPV4D16 is used as previously. So let's revert the
> offending patch.

  I could be wrong, but doesn't the availability of SIMD imply that there are 32 
DP registers?

  Regards,
  Arnout

> 
> This reverts commit 23329364e206d5ca67a9eb9c733d3d556ccdbac4.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   configs/olimex_a33_olinuxino_defconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/configs/olimex_a33_olinuxino_defconfig b/configs/olimex_a33_olinuxino_defconfig
> index 27924b9e92..cdbc63efe1 100644
> --- a/configs/olimex_a33_olinuxino_defconfig
> +++ b/configs/olimex_a33_olinuxino_defconfig
> @@ -1,7 +1,6 @@
>   # Architecture
>   BR2_arm=y
>   BR2_cortex_a7=y
> -BR2_ARM_FPU_NEON_VFPV4=y
>   
>   # Linux headers same as kernel, a 5.14 series
>   BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
