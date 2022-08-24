Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC8FC04AA5
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 20:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BB2D417C9;
	Wed, 24 Aug 2022 20:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BB2D417C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQ5zVqACg93P; Wed, 24 Aug 2022 20:07:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32CA8417C1;
	Wed, 24 Aug 2022 20:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32CA8417C1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E45D61BF831
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 20:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEF73404C2
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 20:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEF73404C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XYusnthKEDrb for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 20:07:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFD0D401C2
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFD0D401C2
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 20:07:29 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id kk26so5914313ejc.11
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 13:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=BiXWV5uW/z+t7fLapm7bje8wJl6zzMxaNahg4D+ahEM=;
 b=dXGQ6OZUTqzRMbKBsOLgAiySvLGpeJg/gnDlyRWu/YehJ1Nlk4m04Ah38KCFloclT/
 yVzHw/Ro9LdZtY86s0FS3ehmVRUfggLIAzLueJ2h6fvL0sg5MGuQ8Pp6PTznuLzWQoUW
 VQIF1rbPjp1gK075MlViXEYz3c91vBrN+60ZQnlQTIymHyHheL6AgMx/vavRV6dA0JSI
 NghLNAP/xx5B+bIa7gpePGXyBo8QJlxK7u8vOEE+PU1OsPYiGCYr+is0eVTKu27p9lnj
 FzsOABKnfV3ZlJojplWLv9a8ziAHf5K1fYHQw2bEFvjOFwOuJc0nmDFfBHroNoXH8+w+
 Kpdw==
X-Gm-Message-State: ACgBeo3boi1oYw7k78Di4z6lF3FZ2QuR/tSAMBVu02zJhbc4OvrcyYoY
 8OS+P/bY7yObPsvbVK9yErkIaQ==
X-Google-Smtp-Source: AA6agR6zHz7Mc7wqdoW9pcA2Uqycy9C2IJcTrsD9LpsXzuDeRYpAznIf8a6NQb6zxGzGgIqQN+r9qQ==
X-Received: by 2002:a17:907:72cc:b0:73d:72c1:cc19 with SMTP id
 du12-20020a17090772cc00b0073d72c1cc19mr359266ejc.130.1661371647938; 
 Wed, 24 Aug 2022 13:07:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a1709063f8900b0072aa009aa68sm1547286ejj.36.2022.08.24.13.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 13:07:27 -0700 (PDT)
Message-ID: <01301eae-7061-d7ff-3512-287813dc3f74@mind.be>
Date: Wed, 24 Aug 2022 22:07:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>, buildroot@buildroot.org
References: <20220815.100252.228788492467122600.atsushi.nemoto@sord.co.jp>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220815.100252.228788492467122600.atsushi.nemoto@sord.co.jp>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=BiXWV5uW/z+t7fLapm7bje8wJl6zzMxaNahg4D+ahEM=;
 b=hiAMnye6yu1Roz1L5UzOFFv+Jz5gUxzfS+FYLX3gcyGAeeV9cQonw/C4CLEkv42h80
 3Cq3RbbFxFYFDSiYpizAaeHZcdCZRfu8611F1xrMXzMOOK6/x9ygyARzvpqprPbZ8169
 emHLk/OCYqddurfVLafDFQBnria7ZR0CQlr27dMDjZMpmMje1qQp3UV3PruSN4POQtV+
 orZaBRzq2avuFHwyl5luFmMMjJ0hmQg3DS355jjIISoZhiqnP3YyIEXqPH5jn235YXxW
 88bGXhNoan3Clg5YTxwdf0k8hZvuOGEkWWPj9l68vf/ZP3eEogGFQRD+bB2vo5GiMO+C
 uGCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hiAMnye6
Subject: Re: [Buildroot] [PATCH v2] package/uboot-tools: fix dumpimage for
 FIT image
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/08/2022 03:02, Atsushi Nemoto wrote:
> The upstream commit 7a01882eb37e7504e2450f474d0cc8db60ed26c2
> ("common: Kconfig.boot: Add FIT_PRINT config option") introduce
> CONFIG_FIT_PRINT and make fit_print_contents() empty if it was
> not enabled.
> 
> Adding CONFIG_FIT_PRINT=y to UBOOT_TOOLS_MAKE_OPTS does not help
> while CONFIG_FIT_PRINT=y affects Makefiles only, not C sources.
> 
> Add "#define CONFIG_FIT_PRINT 1" to autoconf.h if FIT_SUPPORT enabled.

  This is getting quicky kludgy. It would be better to convert the package to 
kconfig-package infra so we can use KCONFIG_ENABLE_OPT for this.

  However, that's a much bigger change, which would not be suitable for 
backporting to the stable branches. Therefore, applied to master, thanks.

  If you could look into converting uboot-tools to kconfig infra, that would be 
nice. It's going to be tricky, though. I don't think we have any example at the 
moment where we don't have a user-provided config or defconfig to start from. In 
addition, we currently don't have host-kconfig-package.

  Regards,
  Arnout

> 
> Signed-off-by: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
> ---
> Backport to: 2022.02.x, 2022.05.x
> Change from v1: Describe why not add CONFIG_FIT_PRINT=y
> ---
>   package/uboot-tools/uboot-tools.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index 7cd527ad12..d884a010fb 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -22,6 +22,7 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
>   	touch $(@D)/include/config/auto.conf
>   	mkdir -p $(@D)/include/generated
>   	touch $(@D)/include/generated/autoconf.h
> +	echo $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),'#define CONFIG_FIT_PRINT 1') >> $(@D)/include/generated/autoconf.h
>   	mkdir -p $(@D)/include/asm
>   	touch $(@D)/include/asm/linkage.h
>   endef
> @@ -111,6 +112,7 @@ define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
>   	touch $(@D)/include/config/auto.conf
>   	mkdir -p $(@D)/include/generated
>   	touch $(@D)/include/generated/autoconf.h
> +	echo $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),'#define CONFIG_FIT_PRINT 1') >> $(@D)/include/generated/autoconf.h
>   	mkdir -p $(@D)/include/asm
>   	touch $(@D)/include/asm/linkage.h
>   endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
