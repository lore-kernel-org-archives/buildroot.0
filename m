Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47956C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E095940A59;
	Sat, 23 Jul 2022 16:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E095940A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 686MPQ7IBk1Y; Sat, 23 Jul 2022 16:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4E5F404DF;
	Sat, 23 Jul 2022 16:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4E5F404DF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 157891BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2E8484B81
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2E8484B81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SZ_PsomYf2ei for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:55:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFB1184BAE
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFB1184BAE
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:55:21 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u5so10355958wrm.4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 09:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0leitY2TvmzBEGgi65P9SC/YLoofgn0IEwCrNUVggHI=;
 b=RMFq0pwsMV4dcpug7gHjanklw+zcD3+ojD1Prm96OIMpeKwnVCDC9LneaBiF475tcz
 /tzAqEIDNR2J4YWq4l4LDJXtd1IP0Hw2LNMrDJTBruRdZx+HWQa/Z6xjXsg82ONkb9gN
 UKVHTSDAiKPEtga1YFN7HDMlC/u3WDwIRdjIgs4nn/L3U+951LzRmPdm7RDPKv5+jT3B
 ypu3lkjp5yq2ynpPWtsNJKw4x95fuRe8luK9G97Nl5e1CeXFiELQWSiDhPSQXaqdCsat
 8qls/oAu0DGwIfAqY6YOYuqCGJyN5OZJ6sc8WPHOe7bk3YiOs3AEBtl3yd71iu29Mg+s
 4e6Q==
X-Gm-Message-State: AJIora8aYpDLphjpstmWLSQisoC0WSlIQTd4yZc+sbwnHcgI6F8OmyXj
 tNxgu75XtnbLSM0a40Asmv0Uig16oyPPKQ==
X-Google-Smtp-Source: AGRyM1vQaWmXEJrFTbf+m2V4K56mMsap/oZhyhD6qN14v4yec5YxtC0frdg6Vzk14hyT4/gu0o85Sw==
X-Received: by 2002:a5d:6d0c:0:b0:21e:5391:7a64 with SMTP id
 e12-20020a5d6d0c000000b0021e53917a64mr3333010wrq.498.1658595320207; 
 Sat, 23 Jul 2022 09:55:20 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c378800b003a2e7c13a3asm8272469wmr.42.2022.07.23.09.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 09:55:19 -0700 (PDT)
Message-ID: <3221002f-e70c-830f-092b-5976bd1ac84e@mind.be>
Date: Sat, 23 Jul 2022 18:55:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220607172643.910948-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220607172643.910948-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0leitY2TvmzBEGgi65P9SC/YLoofgn0IEwCrNUVggHI=;
 b=UghwVLbiCinsUFzp1rceZMvq8F1joo7SVS4zNe5f3Xh6c4q5CvIzObcKpD6B+WiXGG
 xQM2g6oYklAh/0DLxDqH2p0jpRS0pKmrn5HamTtE6dWTsfj19lX4ryeovx4ah/rsauGF
 UxF6FITEbAtCvdGxsQwP0aaD3DGUEpP/xPvtpfmb4vsgEzbvAtKBLPmeMOPMKFMOAb0Y
 VH/iJkJa8TGxgg6zYY9Bb6DYLclD2o1TKy7lAPHS4H7vLiIiSPc+KG3XzJ7e8qztuMJS
 rHfkMs3k3wD20oxCLDmvy7ThJB71NsQ3+GOjYH5jdCG5h5xKy5R1tKmCeM3s1aL1MKs3
 YBqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UghwVLbi
Subject: Re: [Buildroot] [PATCH 1/1] package/pimd: fix static build with
 uclibc
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/06/2022 19:26, Fabrice Fontaine wrote:
> Pass LDFLAGS (which will contain -static) to fix the following static
> build failure with uclibc:
> 
> /nvmedata/autobuild/instance-15/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-15/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/libgcc.a(unwind-dw2-fde-dip.o): in function `_Unwind_Find_FDE':
> /nvmedata/autobuild/instance-15/output-1/build/host-gcc-final-10.3.0/build/sparc-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde-dip.c:469: undefined reference to `dl_iterate_phdr'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/168202f65d168acc55b4d946c2e2416bf890c32c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pimd/pimd.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pimd/pimd.mk b/package/pimd/pimd.mk
> index 7a12f8fe0d..8abfbd5644 100644
> --- a/package/pimd/pimd.mk
> +++ b/package/pimd/pimd.mk
> @@ -26,7 +26,7 @@ endef
>   
>   define PIMD_BUILD_CMDS
>   	$(TARGET_MAKE_ENV) $(MAKE) CROSS=$(TARGET_CROSS) \
> -		CC=$(TARGET_CC) -C $(@D)
> +		CC=$(TARGET_CC) LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
>   endef
>   
>   define PIMD_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
