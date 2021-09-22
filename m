Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF18C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 20:35:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABB0A611C9
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 20:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABB0A611C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67C9D83F3B;
	Wed, 22 Sep 2021 20:35:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWxavnt3PKNP; Wed, 22 Sep 2021 20:35:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53C6883EBC;
	Wed, 22 Sep 2021 20:35:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F5F91BF37F
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 20:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E43841587
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 20:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R__xsV59_0XJ for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 20:35:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D661414C8
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 20:35:00 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id v10so10078793edj.10
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 13:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=guJ8EdagEKfP6pgSoNvTFsIx8V5DDvaiYsrVFHI26yE=;
 b=NMdq/D8SQUV3k3lx81rLctnk8+O3WnivWBQ2hFYaNkeuPz/NupMjqpYjflTgA/VlVT
 wtxr7aGRtzhItuQWE54ACmzBdG/BfbY0jYWNy5fs7IIBx1kgTIyR7UEq5NFugPnwiEez
 dZBGge+mTYKW63zD+j0JLZwEyXIPCHCBiIrrv24cr75b9pLh2U8FCYjii/0lshUAal2q
 17XDIDRV+p5Q56Ev/6/3f3w5p7vTHj/Rvfy3a2GTWACdOSOEVn7Pg+mWJkd3mLHLusLK
 bUoqwvHbO7r4EYL+o13DWr9sFzjXL1Qxmmhl4xJdASzHvomRXVH1kUiz8N7ZxFy0GUbz
 tWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=guJ8EdagEKfP6pgSoNvTFsIx8V5DDvaiYsrVFHI26yE=;
 b=HM8vf687GerAd8VxjHlYytMCRrYlzO1RIZJp1iGbPoyfCuSkFwAG4t8eUEVNuJc334
 BkMDBcQdOuenGrIpuzwbu2E/D34teEP80B0sRHY2u7IDmwfyChobei2TyHuLzzniA2mK
 jgab3sOp5ezBc70IiMVFuAelu0EqgK3gg/HKUaCwxIuFpDk/NyjVN2hkgcQKbqbkXvXr
 2Fw2qk93KLyeUN7GeDFgjdCZXWrm1yxJbxFDRlpvmfaorWcgOoA7DmpdWmsJd9m0A/VM
 Gvne7WhEjqK+QXGkf7Ug0wXtbTkGY5yGMti1lmDGeTlh+X49E7lWFhf2y+lGWme1c0Zd
 wkBA==
X-Gm-Message-State: AOAM530VdK59+G/XQ8Lm9Ru64qWFzdwiWMwLkLKNHJhxaSdBJvyK+Tal
 OojxELPBPWGCVgYWpZSTVC6pQJwDxhz92Q==
X-Google-Smtp-Source: ABdhPJzqi65t5HHqlr1wAj3UsRJhkU/eJd0YOIBiCnnD0zqmeFUOT49msxffQ8q/ZevUvTzK5UTPOg==
X-Received: by 2002:aa7:d814:: with SMTP id v20mr1506234edq.169.1632342899048; 
 Wed, 22 Sep 2021 13:34:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y5sm1733724edt.21.2021.09.22.13.34.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 13:34:58 -0700 (PDT)
Message-ID: <acc54600-0ace-c758-ae9e-afc04f30977b@mind.be>
Date: Wed, 22 Sep 2021 22:34:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210913204551.2328033-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210913204551.2328033-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/ffmpeg: fix build on mips_32
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 13/09/2021 22:45, Giulio Benetti wrote:
> mips_32 is not supported by ffmpeg and it tries to build with loongson3
> SIMD support that leads to build failure due to:
> /tmp/ccFO2LRa.s: Assembler messages:
> /tmp/ccFO2LRa.s:15314: Error: opcode not supported on this processor: mips32 (mips32) `dmult $2,$6'
> /tmp/ccFO2LRa.s:15316: Error: opcode not supported on this processor: mips32 (mips32) `dsrl $2,$2,32'

  I don't think *any* of the archs we define in Config.in.mips supports these 
instructions... It's just that these are the only ones we test in the autobuilders.

> 
> So let's --disable-asm to prevent using those unsupported opcodes.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f01/f01d9cedec8e1b371308d0f7af561a75883fa27c/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/ffmpeg/ffmpeg.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 8ff8ea8c6c..5e405d0f60 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -508,7 +508,7 @@ FFMPEG_CONF_OPTS += --enable-mipsfpu
>   endif
>   
>   # Fix build failure on "addi opcode not supported"
> -ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
> +ifeq ($(BR2_mips_32)$(BR2_mips_32r6)$(BR2_mips_64r6),y)
>   FFMPEG_CONF_OPTS += --disable-asm

  Given that mips seems so problematic, I think it's best to disable asm on mips 
in general, not even for specific subarches.

  If someone needs some specific subarch to be optimized, they can give us a 
(tested!) patch that enables asm again for that specific subarch.

  Regards,
  Arnout

>   endif
>   endif # MIPS
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
