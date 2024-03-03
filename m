Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D027C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F9148121E;
	Sun,  3 Mar 2024 16:55:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GAzkpgSwMj6n; Sun,  3 Mar 2024 16:55:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 091DB81298
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 091DB81298;
	Sun,  3 Mar 2024 16:55:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C42A71BF575
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF3B840797
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:55:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZVaLcTsHhbO for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:55:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7BE1440788
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BE1440788
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BE1440788
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:55:21 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d28051376eso49282281fa.0
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 08:55:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709484919; x=1710089719;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iGlgRb4k03QOm2Qmjs+d7zhGKEVLT4PSXZmVB7GeGtE=;
 b=wiccGCOwvKnR3Q7StKKE2RZdAAUNK1gWhrIfTK6IGexvoT+GVeSVaqA6aI9hRBCHx2
 W4k9jamJBCPZG4nItzc8Noht9hBA8Z5i+CoT+3HbJB+W5b8myKf4MTmP6DMoEtL0Bt7I
 y8e9+UFDjLAdGfmucJ46T62VQeAuuMS4jhMWEgI4O/GYhhhUIJGpmaZsC6KXjogkF15f
 7LBnD4T8HSHQ0ge+LjVKOvDb4kqmih2DzW69TN9dnlo2iBLyn11pQnLeJ0bOKYb5Vojn
 SvzEnhoBTkcLu5FyvooW7eYAd1kJNJ3VPJEQ4fTmjvw1P2828i/WeWcAJtULu2FSFh18
 GSFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlEdu5WZGBRzF0kCjGSYh1DpJsXZtU2y+qVKgqR9+DWTfzbb9m70cXQ2TbvrqzbLWorgnagpZVdkMHFoU2cmpIDXbY8G+yDg==
X-Gm-Message-State: AOJu0YwaMeG0XNngTLzw1VkNov0VbSCPDHhSqSyjU3b+luapdVmYDuEm
 so8dX4tl4dgNfWnF33pgKiexjOSPiC5/LAPurK09A8nlWKTDcZguthVbS/mV9wI=
X-Google-Smtp-Source: AGHT+IESeWew1QlUigys3wvQDY3KNMOKsBGuedqn/fFbh+mrYj2HKT8rvWjZyLFBujDaW/6EEWbV5A==
X-Received: by 2002:a19:e00e:0:b0:512:fe25:550b with SMTP id
 x14-20020a19e00e000000b00512fe25550bmr3674671lfg.47.1709484919188; 
 Sun, 03 Mar 2024 08:55:19 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a19f70b000000b005133e571cf1sm555806lfe.24.2024.03.03.08.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 08:55:18 -0800 (PST)
Message-ID: <bd9d78c1-b1a1-4d4e-9f3e-46b42164d579@mind.be>
Date: Sun, 3 Mar 2024 17:55:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240225171149.1447606-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240225171149.1447606-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709484919; x=1710089719; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iGlgRb4k03QOm2Qmjs+d7zhGKEVLT4PSXZmVB7GeGtE=;
 b=bUd9KOL2/3oUybndoq9OyEjpE1YDctWkOMFf/GXeIaMpzfx0C16UejYg0sjJ7w/Yid
 xtvHBdDOKTitNeSqWToYsFE3QONiyIpEvasWe5dk1Cl2zsE2NYML/GZvjBfdjl39+7Ok
 mKzlszjqkwE6enL/8jerSo1Ibfag2w8vVOqNEvWVEV4iSQBsk+SVUo4GxZjNoe5kZ9d9
 RSswmts3iHlK60ndHQRdIqDPIIXLpXKfYWXllaub0vZMyVX9pfTKVGIux2VqYGrxrylt
 d8FhyVn8oa8dqlQHreWul2mytOHnLZwRpC3ciCV6mKTqvxjA+9GYKAcLBrRlKXTgARO9
 WLKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bUd9KOL2
Subject: Re: [Buildroot] [PATCH 1/1] package/libtracefs: disable utest
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/02/2024 18:11, Fabrice Fontaine wrote:
> Disable utest to avoid the following build failure raised since the
> addition of the package in commit
> b1dbd3f679e6660325472e3fdca72127d74e6929 if cunit is found:
> 
> ../utest/tracefs-utest.c: In function 'test_uprobes_instance':
> ../utest/tracefs-utest.c:2492:19: error: 'PATH_MAX' undeclared (first use in this function)
>   2492 |         char self[PATH_MAX] = { 0 };
>        |                   ^~~~~~~~

  This issue was discussed on the mailing list [1] and apparently is fixed 
upstream. Could you cherry-pick the upstream fix instead?

  Marked as Changes Requested.

  Regards,
  Arnout

[1] 
https://lore.kernel.org/linux-trace-devel/CZBS6H2ZDU7T.1JYZ4DRUCZSJB@sakura.myxoz.lan/T/#u



> 
> Fixes: b1dbd3f679e6660325472e3fdca72127d74e6929
>   - http://autobuild.buildroot.org/results/1a01883231dbc8a7688de26db9a08751165fe8fe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   .../0002-meson-add-utest-option.patch         | 40 +++++++++++++++++++
>   package/libtracefs/libtracefs.mk              |  3 +-
>   2 files changed, 42 insertions(+), 1 deletion(-)
>   create mode 100644 package/libtracefs/0002-meson-add-utest-option.patch
> 
> diff --git a/package/libtracefs/0002-meson-add-utest-option.patch b/package/libtracefs/0002-meson-add-utest-option.patch
> new file mode 100644
> index 0000000000..90f73a7ea0
> --- /dev/null
> +++ b/package/libtracefs/0002-meson-add-utest-option.patch
> @@ -0,0 +1,40 @@
> +From 7a09e2d414959075e2177c50ef1d4bf606b9ccdc Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 15 Feb 2024 21:20:29 +0100
> +Subject: [PATCH] meson: add utest option
> +
> +Add utest option to allow the user to disable utest
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://github.com/rostedt/libtracefs/pull/2
> +---
> + meson.build       | 2 +-
> + meson_options.txt | 2 ++
> + 2 files changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 3156f1c..d4cfd53 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -35,7 +35,7 @@ incdir = include_directories(['include'])
> +
> + subdir('src')
> + subdir('include')
> +-if cunit_dep.found()
> ++if get_option('utest') and cunit_dep.found()
> +     subdir('utest')
> + endif
> + if get_option('samples')
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 8450992..a48efea 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -18,3 +18,5 @@ option('doc', type : 'boolean', value: true,
> +        description : 'produce documentation')
> + option('samples', type : 'boolean', value: true,
> +        description : 'build samples')
> ++option('utest', type : 'boolean', value: true,
> ++       description : 'build utest')
> +--
> +2.43.0
> +
> diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
> index ed45fcbc50..21cb8e84e3 100644
> --- a/package/libtracefs/libtracefs.mk
> +++ b/package/libtracefs/libtracefs.mk
> @@ -14,6 +14,7 @@ LIBTRACEFS_DEPENDENCIES = host-bison host-flex host-pkgconf libtraceevent
>   
>   LIBTRACEFS_CONF_OPTS = \
>   	-Ddoc=false \
> -	-Dsamples=false
> +	-Dsamples=false \
> +	-Dutest=false
>   
>   $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
