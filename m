Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90E0CD13CF
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 19:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8460A40124;
	Sun, 17 Sep 2023 19:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8460A40124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0PADf0VDkZq9; Sun, 17 Sep 2023 19:50:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 508F740463;
	Sun, 17 Sep 2023 19:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 508F740463
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62EE41BF2C6
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 19:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AF8C40463
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 19:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AF8C40463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id opLULFIt1I8H for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 19:50:07 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD32840124
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 19:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD32840124
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-52e5900cf77so4655859a12.2
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694980205; x=1695585005;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jXU0Jk3VkwVpRL/AiC61QouPHRxKqAtHFjT+mvbCjlc=;
 b=OQHDWS3CcDnWwyOetZt4eZeIwdt1sSDlugtSE9ZaAGe+jE3w5fImUX4+QIYNJcdVyF
 8ObyiYGyr5LHhE6RNSuBOQsG7TXWlhyx2bS2e8otoEtLXZgMyU6seAAw/qEydpyjDUzE
 uLxkVjBxdfrjsf60GRAZx9MTJudBivMdnOTjYDBd1pOJQDJu8bMbmzc3HwGJr8GCkPP1
 KPx8wwDMT+ri+urAJT1DHy+bCgzP1qTlkJ/givh18V/MgT3gI6s+fikyqOKBs897lONM
 7HwOHy+/PtghRp7SPPv4c7sVNGedzW0aSSVxr4h4hxQTwrQjCFUm7nh4VUQaLhIOXfaQ
 R3HA==
X-Gm-Message-State: AOJu0YzDNjNzm0/cyVh68lc0G41T9R7EpC+zrvDfMKuF/TWxNHDWgyy+
 J7jEb0scvjZXPWWWG8rNgzSi5w==
X-Google-Smtp-Source: AGHT+IFlDVkxQaxfPSYyHHO69kYrjBj8X5WocHOgiIeTORHBvsak2zQkTBgnMugkXgx3FGkiaF1YzA==
X-Received: by 2002:a05:6402:1a32:b0:525:6c9f:e1a3 with SMTP id
 be18-20020a0564021a3200b005256c9fe1a3mr6415445edb.20.1694980204713; 
 Sun, 17 Sep 2023 12:50:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 r25-20020aa7d599000000b0052a1c0c859asm5053224edq.59.2023.09.17.12.50.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Sep 2023 12:50:02 -0700 (PDT)
Message-ID: <8aa7890d-c570-4952-3f7d-4a4f992f6367@mind.be>
Date: Sun, 17 Sep 2023 21:49:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20230917143452.1374576-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20230917143452.1374576-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1694980205; x=1695585005; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jXU0Jk3VkwVpRL/AiC61QouPHRxKqAtHFjT+mvbCjlc=;
 b=QfajaLZGbL+AlLjRPizmtJS0wj7coxWCSzZ+yYYfHtl8Xa4zXxQkR1pz5r63oBsGBa
 nhjMZZpJy6A7E0QNRf5yssVuztqTi47A0zcxx/s9Zd5wKbrbvhVBLPZVqO7qHKflMsAs
 sSRD/sjNkZ0bt0qGPGp7sOmOFhcEyA2DZ4P17O16cCodbmuqRkX+RaRpWImgteuZ63Cw
 UBDMMQ05MYrJ0rKzYNt9rDdADepFvfix0kyHTwCyspq0Z7BFYx95sWsULH+/k744Rlox
 l3ee1JHF9aCvUDLLSDAAMsGd/0W6jiwQK3s2pgbQtCNJJ2VolItMOCLvM3zpPxgX72tF
 wvMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QfajaLZG
Subject: Re: [Buildroot] [PATCH 1/1] package/davinci-bootcount: rename as
 uboot-bootcount
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
Cc: linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dariobin@libero.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/09/2023 16:34, Dario Binacchi wrote:
> Born as a project to read/write the bootcount on the TI am3xx platform,
> over time it has introduced bootcount management on EEPROM and for the
> stm32mp1 platform. As a result, the project removed the 'davinci' tag
> from its name and GitHub link.
> The patch aligns the package name in Buildroot with the current one on
> GitHub.

  We try to avoid package renames unless it's really needed, because it causes 
some annoyance when updating Buildroot.

  In this specific case, the package name (davinci-bootcount) was already not 
aligned with the (original) upstream name (uboot-davinci-bootcount).

  That said - if you don't have a davinci, then with the name "uboot-bootcount" 
the package is a lot more discoverable, so there is probably a good reason to 
update it.

  Still, I think it's worth to make two separate patches: one which updates the 
URL (both in the .mk and Config.in), and perhaps also updates the help text. 
This patch can be backported to the stable branches. And then a second patch 
that changes the package name.

> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>   DEVELOPERS                                        |  2 +-
>   package/Config.in                                 |  2 +-
>   package/davinci-bootcount/Config.in               | 11 -----------
>   package/davinci-bootcount/davinci-bootcount.mk    | 15 ---------------
>   package/uboot-bootcount/Config.in                 | 10 ++++++++++
>   .../uboot-bootcount.hash}                         |  2 +-
>   package/uboot-bootcount/uboot-bootcount.mk        | 15 +++++++++++++++

  You're missing legacy handling. The top of Config.in.legacy is hopefully 
sufficient documentation to know how to do it (if not, patches welcome :-).

[snip]
> diff --git a/package/uboot-bootcount/Config.in b/package/uboot-bootcount/Config.in
> new file mode 100644
> index 000000000000..0a18e5d1bbad
> --- /dev/null
> +++ b/package/uboot-bootcount/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_UBOOT_BOOTCOUNT
> +	bool "uboot-bootcount"
> +	depends on BR2_arm

  Below you write that it can also come from EEPROM, which means it's not 
limited to ARM.

  Regards,
  Arnout


> +	help
> +	  U-Boot implements a boot count scheme that can be used to
> +	  detect multiple failed attempts to boot Linux. This tool
> +	  allows to read and write bootcount from userspace for some
> +	  platforms (TI AM335X or STM32MP1) or from I2C EEPROM.
> +
> +	  https://github.com/VoltServer/uboot-bootcount
> diff --git a/package/davinci-bootcount/davinci-bootcount.hash b/package/uboot-bootcount/uboot-bootcount.hash
> similarity index 80%
> rename from package/davinci-bootcount/davinci-bootcount.hash
> rename to package/uboot-bootcount/uboot-bootcount.hash
> index 53435b1d1d6d..e1ebc442357e 100644
> --- a/package/davinci-bootcount/davinci-bootcount.hash
> +++ b/package/uboot-bootcount/uboot-bootcount.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  12b5aa83736efb2fefd22cd4d9f305a25c68dfaa10401d5efb17e55a5163934e  davinci-bootcount-2.0.0.tar.gz
> +sha256  12b5aa83736efb2fefd22cd4d9f305a25c68dfaa10401d5efb17e55a5163934e  uboot-bootcount-2.0.0.tar.gz
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/uboot-bootcount/uboot-bootcount.mk b/package/uboot-bootcount/uboot-bootcount.mk
> new file mode 100644
> index 000000000000..07b52ab89eb5
> --- /dev/null
> +++ b/package/uboot-bootcount/uboot-bootcount.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# uboot-bootcount
> +#
> +################################################################################
> +
> +UBOOT_BOOTCOUNT_VERSION = 2.0.0
> +UBOOT_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-bootcount,v$(UBOOT_BOOTCOUNT_VERSION))
> +UBOOT_BOOTCOUNT_LICENSE = GPL-3.0
> +UBOOT_BOOTCOUNT_LICENSE_FILES = COPYING
> +
> +# sources fetched from github, no configure script
> +UBOOT_BOOTCOUNT_AUTORECONF = YES
> +
> +$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
