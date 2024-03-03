Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1586C54E41
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 08:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B679F40BBB;
	Mon,  4 Mar 2024 08:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UuO_GVpCdJ-1; Mon,  4 Mar 2024 08:51:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96DA740BB8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96DA740BB8;
	Mon,  4 Mar 2024 08:51:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 553F41BF580
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 08:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4352B81EB6
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 08:51:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WKapiKMl5z4H for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 08:51:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5637F81EB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5637F81EB4
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5637F81EB4
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 08:51:30 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a44db6c5144so185716566b.3
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 00:51:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709542288; x=1710147088;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yHor5aozbpvrgSGnR67SolanJmmAVREwFcj+9QeqV0w=;
 b=qSBz1yEOiB1MNbZYJ5TE+d7efUst7MCWfyg5Ku/ae9gMjGIIkYbIl7br8FlT831Lz0
 p2hX58hgmHkLhGvziyBlG3WAom0OIIQyJBEtgb8lxuTaZSKDDcsJ4C4VyPGrHbg3R9Tu
 UpsHjjtvFhZ/Tii1PVsNf4XUvAtzkHGknEyaQlFTmQFDJHj8qA+DQraRS59UBqvVJif6
 1ykBZh9ZQP7bfd6Mb3CYRDghFqlyIuh8fnq3Wo3GhK2Nz7x0K+wDXNbm4Lcj+siea/fx
 9yvM7DfD2MyAVljdEqqWAbYPo7jGUqNE/JIDUSrW3ciFVR4YDWvrUsSIKOA6UDOw0Wjf
 8qAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0EZqu4NItchacqtnxhsRaLqI8IzPdf96/LzPFCw8ToaIUKu10MZzvhpf69ZHcwsV6jCQfsXaCuxi76uev59UntXzJH6wCog==
X-Gm-Message-State: AOJu0YzK/pdc19TPc4b2PzW/HiaRElcuDMBsrKo9WanXY85qnXmDOZkp
 LasGAeBNRsGCbW7fLLeq31rWZ/1OqlHJXV8mI9Vg9nyrlspgjHA1Df1a+PjY5rY=
X-Google-Smtp-Source: AGHT+IH5v1KbmhIsZ57/GPYTQ06OiQ7RbMeqqFI4GWAnzqDmfw2cvNGz6ULErMshV97Wgb9DwWl6zQ==
X-Received: by 2002:a17:906:fb84:b0:a44:2634:abfe with SMTP id
 lr4-20020a170906fb8400b00a442634abfemr5864432ejb.18.1709542288198; 
 Mon, 04 Mar 2024 00:51:28 -0800 (PST)
Received: from [10.1.0.191] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 mb17-20020a170906eb1100b00a4490267ecfsm3393779ejb.221.2024.03.04.00.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 00:51:27 -0800 (PST)
Message-ID: <787e9753-4093-45d8-b781-595e76430344@mind.be>
Date: Sun, 3 Mar 2024 21:34:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
References: <20240213021745.1350798-1-kadambini.nema@gmail.com>
In-Reply-To: <20240213021745.1350798-1-kadambini.nema@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709542288; x=1710147088; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yHor5aozbpvrgSGnR67SolanJmmAVREwFcj+9QeqV0w=;
 b=O/o5yalaFDtdUlmhwHqOCBg4M8O5HeKAiF9let2zKcLZr0+Y6HN00FXK7pXhx/nHpk
 OmMOWyvjXGgTsWbh6YYWTuDKPcxcra52JQDfDEBAB4qkeJSdJ7V1qXefJWkD1Hxh8s8T
 QPGoLTq9fEzIfX8aWGZ4WWOWTmCm0VFYQSdKfB2J1gEnhqvJwqu8SIJPBxWFZvf/6QxK
 1eHQNw519w4rm1HCrT0/+LPgmfHhSarbX8OmK+OTwPxz5hkP9wTox5FOKY4YmVJ6fEL7
 0mc1zBeFEtxVRhOvtBplG21UlCf2fYrXeg6uhJ5Aoyx7H9FGCQoeTRXgG3W5LM9KNOag
 O9GQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=O/o5yala
Subject: Re: [Buildroot] [PATCH 1/1] package/zlib-ng: bump version to 2.1.6
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



On 13/02/2024 03:17, Kadambini Nema wrote:
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

  Applied to next, thanks.

  Regards,
  Arnout

> ---
>   package/zlib-ng/zlib-ng.hash | 2 +-
>   package/zlib-ng/zlib-ng.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/zlib-ng/zlib-ng.hash b/package/zlib-ng/zlib-ng.hash
> index a2fe98435c..908164aa60 100644
> --- a/package/zlib-ng/zlib-ng.hash
> +++ b/package/zlib-ng/zlib-ng.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  d20e55f89d71991c59f1c5ad1ef944815e5850526c0d9cd8e504eaed5b24491a  zlib-ng-2.1.3.tar.gz
> +sha256  a5d504c0d52e2e2721e7e7d86988dec2e290d723ced2307145dedd06aeb6fef2  zlib-ng-2.1.6.tar.gz
>   sha256  d3c80be055d94d798eaa786116e84fa0b010bc11420b5d2060d978ea77845436  LICENSE.md
> diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
> index fbb906503a..2fb6ea763f 100644
> --- a/package/zlib-ng/zlib-ng.mk
> +++ b/package/zlib-ng/zlib-ng.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ZLIB_NG_VERSION = 2.1.3
> +ZLIB_NG_VERSION = 2.1.6
>   ZLIB_NG_SITE = $(call github,zlib-ng,zlib-ng,$(ZLIB_NG_VERSION))
>   ZLIB_NG_LICENSE = Zlib
>   ZLIB_NG_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
