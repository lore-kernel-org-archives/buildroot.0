Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7C0C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B560480B96;
	Fri, 12 Jul 2024 19:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhgJ1BvePCJq; Fri, 12 Jul 2024 19:47:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8DC2810D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8DC2810D4;
	Fri, 12 Jul 2024 19:47:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBCC41BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C41B3413C3
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BaaaVae_FAn for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:47:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B405B410A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B405B410A7
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B405B410A7
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:47:19 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4279c924ca7so11806735e9.2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720813638; x=1721418438;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=coNa+8nqdGo04lRhYUgdx1OVzeXHxeazrPQo/IhqAc0=;
 b=GIvx7ObR6GHj5K4XAi+5vgaKJXxfITTDodBPfnXRCS3LYI2t/Yd5BO8vxPZfp5MW1v
 mISvg02SsEuBF233GqDDcBV8My/0i3fcA6mhmZXjyqapfySbja+ZtbciX+sS+Ka/FHni
 zgySgINDgiXuUASMhyFZLrJyEVoSvFBe83O47eKHThkoalVv1H4Nv3wmWguCXfZpbS3V
 GXTbT0vbctd13zDwQmsdBCMLu6cdc/mKug/U68IYB5BNVZ2hOES+i6xgYd/H3Z5HPtt+
 jT6JRA9Bl0K6Iu9AmfITKGLFFsLQzlEA6jaFxDLn/Es7a5fNk6uCYRlFovvO0FbIZYZz
 aJBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHgffSnq0zw2v2AqeDZ6AQGQiqlRlr/kdPEt5FvBAJHvmfnVhQp0o+2vInRY/3Zdbqqn6Nimckj2eZ2Ex+PNKW1lkSPXpqGQ==
X-Gm-Message-State: AOJu0YzgCmE0ab2x1nMMCTMZSN8H0ic6cHmgBXgv6sJqTkuc7JDbe7W3
 e3tF5yUZswHmfr/6fQrpv26VhLvC8Z7uKSXiOXV6pGYzPh8wqSUS1HfRvDNWu2AL9efU3wfB0yR
 6twU=
X-Google-Smtp-Source: AGHT+IF+qizHvNQxKTR9bdw0mZjxcjpp9QoyF6dw8UZ2E8k/wj1N308W6R+yDZXFGmIKufXS4x6ZdA==
X-Received: by 2002:adf:fdc3:0:b0:367:4337:4065 with SMTP id
 ffacd0b85a97d-367cead1e76mr7807760f8f.51.1720813637723; 
 Fri, 12 Jul 2024 12:47:17 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab141sm10900845f8f.96.2024.07.12.12.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 12:47:17 -0700 (PDT)
Message-ID: <09cd6cff-4562-4998-adfb-e2aacea9c713@mind.be>
Date: Fri, 12 Jul 2024 21:47:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230818151608.988723-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20230818151608.988723-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720813638; x=1721418438; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=coNa+8nqdGo04lRhYUgdx1OVzeXHxeazrPQo/IhqAc0=;
 b=YhItxrLEkWv7VSF7jIOSukFnjYjM/vsegfHW77jQg8I7DyZD5CUkkOXq15INoIdttX
 LUjQoK6475htFS7KF3vz/4RP4ew+merP8ZXt3Ikp4TqMLzJKJd8ihrwBNR+n1QJAaEG+
 9Lco33i08VFGmcWo9V3IuXM4Ywv3FoyAn1rV0nHZT/wRQ1UqteKgzwMQe7LIEQ2YeyEg
 SaM1PXs0aos6fMYyjpDBXeP2pn3/MY7ExyHHLEui4CyW43cWJPPdn1qTZBKvq0nI7E74
 f9YOSgJJRT7riW86x8NADJk0Sq3UguE/8xvby5kBvExufQS+QlO+QbMoINjwL+r/ycra
 eH3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YhItxrLE
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix typo in
 make target .stamp_built
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/08/2023 17:16, Bernd Kuhls wrote:
> This fix can be backported because the offending line was added in 2009.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master with a slightly more extended commit message, thanks.

  Regards,
  Arnout

> ---
>   package/pkg-generic.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 5d1c1da128..9d40754939 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -286,7 +286,7 @@ $(BUILD_DIR)/%/.stamp_configured:
>   	$(Q)touch $@
>   
>   # Build
> -$(BUILD_DIR)/%/.stamp_built::
> +$(BUILD_DIR)/%/.stamp_built:
>   	@$(call step_start,build)
>   	@$(call MESSAGE,"Building")
>   	$(foreach hook,$($(PKG)_PRE_BUILD_HOOKS),$(call $(hook))$(sep))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
