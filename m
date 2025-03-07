Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888E7C19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 13:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B8C541245;
	Fri,  7 Mar 2025 13:15:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eT4-Jw__fDjH; Fri,  7 Mar 2025 13:15:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7B5541256
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7B5541256;
	Fri,  7 Mar 2025 13:15:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 098F51C9
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 13:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED0C041256
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 13:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGvUMUFt1Htk for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 13:15:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E122441245
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E122441245
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E122441245
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 13:15:41 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5e5deb6482cso2251146a12.1
 for <buildroot@buildroot.org>; Fri, 07 Mar 2025 05:15:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741353340; x=1741958140;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s8nR41+ORd81jqOJ2M4guIhQKaXJY3LK6yrK9l/ohiQ=;
 b=tqHYNM9ou0CqZVOG7uRyWLe2m6aGHtBQ9p5Z/RG/aAVtKUmx2cxY+YwAq2lmPg/vI+
 BNoa2uvvUGly4dc/8iptkJbyWF1AZtmsfXI6we2ACJNem3CU3bMnnZX5++mBZFpMPgVf
 +LHVER/Z6FWPsRPa0IgDiXs6IxiIJLuQP1im9mHJSwFx/SzWkpTXjLTRKKuggN/cd/7O
 Yo1ZoaD+nCHuUUSBuXwH6B0d9ggxrdpIA4H+Urn5HuaM72oaT7izNzb/IbSvjgF15d9K
 Lxuf/HTnmai8KHFDfDerqVXx4Gzjmnu2gzgIU5pfxK6pNKDRHxVQBR4ZOZtKBkjY0FfM
 zW0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxgR13usTMsAvqx46pjcppNw6EJtvpbcixhlRb91UG9OfZSQVCpdWV+vgdMgx2Z1W0qcui5W+o0Ww=@buildroot.org
X-Gm-Message-State: AOJu0Yz9AinY8OVbjeR7Wwmu08hjNd0MOk88ABB66K19L+q0Rrv2ksNA
 EC0hjCpiluGikigZKY6zSq0/zFzqfs4l77P/etXXTIr6HOISMuX6
X-Gm-Gg: ASbGnctfq53+bkGvL6kX579Wv5n8vRVZy19+ScRaLaKMdmkrVgXTpZjkF1/1A06YhVQ
 cjbJb3o9YOx3+rlOn5cvYofKvRBog8sZSoAcGHho2MtUbCrsU/12chsnmhFOJxA3OLTYWrMXW/+
 69e+cEVuXjB7Vp7z0z/tWTrOGO5o9AUTlahSGKJ66rbuEttW4f2R90H7BeLTRhwucYaepB6Mr5o
 rZ+MHbplj9I/ayxzSLfXRVZH5o+6XnRwJYP+zshUTFQM1GjTdjNuh91Kl9b5inPD0iBJ1j1klS2
 JCytt0O4oc+rdmb3LOO75yLUtU7zKCWg+66yCz39KqVhAE3aKRprzd0CY/XtaLeN9AI=
X-Google-Smtp-Source: AGHT+IHTHyuxbrbx+g88sXDH1JubsRYo7/nQJYRf19ugca9B836gEcK60G0FhxdLpZ8juJPK6C//eQ==
X-Received: by 2002:a17:907:7293:b0:ac1:ecb0:ca98 with SMTP id
 a640c23a62f3a-ac22cd6e4ecmr861953866b.26.1741353339522; 
 Fri, 07 Mar 2025 05:15:39 -0800 (PST)
Received: from ?IPV6:2a02:8070:2483:7e00::f0b8? ([2a02:8070:2483:7e00::f0b8])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac239439840sm276434266b.16.2025.03.07.05.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 05:15:39 -0800 (PST)
Message-ID: <cb52a887-1139-4f30-b364-df98c03e7fbd@gmail.com>
Date: Fri, 7 Mar 2025 14:15:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1740841539.git.yann.morin.1998@free.fr>
 <57a570cc2ba3d56346a32f2f6a3e4758ca3b2c3a.1740841539.git.yann.morin.1998@free.fr>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <57a570cc2ba3d56346a32f2f6a3e4758ca3b2c3a.1740841539.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741353340; x=1741958140; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=s8nR41+ORd81jqOJ2M4guIhQKaXJY3LK6yrK9l/ohiQ=;
 b=mOi/08ynhvQ2t/kaXTPscW5I5rVSx+CNpxQmr4fpnEQMRTXfL/YzmjwRicoHRQjKXv
 yIqWqGbL4nrbooh7OrV9Df2wxAp4JyH3mL1p3r0XFwdYy7WeIEh2KoktuNNggxdAB0y7
 EamziOvaJm82hrBfXW39XhHXQlN/9t3SeXFyoCMdsgWhGDLHRD6xgMX8PFc1ZwkHgmZq
 07xRRrx0Vc2LjkKRtV4AboKNE0/ZTYFIoodwf9Mik8QuvlLh32nY8P5kFduQEVE7dEaH
 9e/ECer6sdV8GxGpUcE88agHGSl5tUaBpAdFOeUYhqcBDJWBLpVgt9Kp2o9ZKhIGniIk
 htIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mOi/08yn
Subject: Re: [Buildroot] [PATCH 2/9 v3] package/shadow: install to staging
 for subids
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,
the changes looks good.

Thanks you.

Regards,
Raphael


On 3/1/25 16:05, Yann E. MORIN wrote:
> When the subids feature is enabled, shadow will install a library and a
> header:
> 
>      $ sort output/build/shadow-4.16.0/.files-list.txt
>      [...]
>      shadow,./lib/libsubid.la
>      shadow,./lib/libsubid.so
>      shadow,./lib/libsubid.so.5
>      shadow,./lib/libsubid.so.5.0.0
>      [...]
>      shadow,./usr/include/shadow/subid.h
>      [...]
> 
> Install to staging in that case.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> ---
>   package/shadow/shadow.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
> index cea984012d..c598ad88fd 100644
> --- a/package/shadow/shadow.mk
> +++ b/package/shadow/shadow.mk
> @@ -46,6 +46,7 @@ SHADOW_CONF_OPTS += --disable-account-tools-setuid
>   endif
>   
>   ifeq ($(BR2_PACKAGE_SHADOW_SUBORDINATE_IDS),y)
> +SHADOW_INSTALL_STAGING = YES
>   SHADOW_CONF_OPTS += --enable-subordinate-ids
>   define SHADOW_SUBORDINATE_IDS_PERMISSIONS
>   	/usr/bin/newuidmap f 4755 0 0 - - - - -

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
