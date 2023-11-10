Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EE9C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B072940281;
	Fri, 10 Nov 2023 21:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B072940281
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pYf0EJQn30Po; Fri, 10 Nov 2023 21:04:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1910426AA;
	Fri, 10 Nov 2023 21:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1910426AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E11751BF41B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA1046F6F3
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA1046F6F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MUCaMwl36yGO for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:04:47 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2FE16101F
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2FE16101F
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9c41e95efcbso398521366b.3
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 13:04:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699650285; x=1700255085;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NAVoJkgCcvWcwZI1UGOusc8RHpLAIS2BuhS/Q3YyhfU=;
 b=dn7SErHhQ7kJjIAzD0DhKtSS/lSqOOmj6bZ4IO3olEcf4qxJiUOXRrAmWXMdaeDu5R
 jzlT7/ZxsFA1qt5k++TlK5Jp5WFHT6K+HH7bk1N9OAc3orp2KmllB4m0LGTON2aEnYN8
 a5wpvMQrmp/MCHxmsWdR24PulqidpHKmKgKSbotfwMtvvKV8of5kSgcxujunTBAaiYKP
 jI0oUmw5kIHMlB3Dl//lBcJ7FnYbs3PQMuBcd/cZEk4QgfQ8q0PIuLMdvM90SWR1TO6j
 /+SGdS5xZqFiBHzQaYLlO201jy0rd2D8A72h9zqFbsLWaJJ2LEetL5m16TTOvYSfivK9
 275g==
X-Gm-Message-State: AOJu0YyTDdii3Wk7qpFQ2xUe9QlrDb8IwM0y+uj9f2VciYlqYbIKPk9s
 7HPXZCIkN1yoikcAmbdQMfM5Lbl99S8RxZQ0l2I=
X-Google-Smtp-Source: AGHT+IGH8Uri5WY9SbtdVpUBDHmJsSwJXz49d365jMAnUkInh4MXHVhUEWLws8e0lc0DvSPvHumgdA==
X-Received: by 2002:a17:906:48d4:b0:9e7:3af8:1fcb with SMTP id
 d20-20020a17090648d400b009e73af81fcbmr100861ejt.58.1699650284881; 
 Fri, 10 Nov 2023 13:04:44 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 dv22-20020a170906b81600b009e5f2e02e68sm79795ejb.222.2023.11.10.13.04.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 13:04:44 -0800 (PST)
Message-ID: <fbaa63c5-b2fd-4282-8289-1204c11c9033@mind.be>
Date: Fri, 10 Nov 2023 22:04:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231105091040.2924287-1-james.hilliard1@gmail.com>
In-Reply-To: <20231105091040.2924287-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699650285; x=1700255085; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NAVoJkgCcvWcwZI1UGOusc8RHpLAIS2BuhS/Q3YyhfU=;
 b=AGT33VBW+duaa263KunmhA7w9occufHxv4yzzQYHcFvw43mYxjFpz8QEwKEn9RP3Wq
 n3RTruD6SitjJhzb7s1vbllFTAZIdVFQRSZiW1vCp4ytNLopbxbVV6xDDC6NKbwYuzfU
 LbBhfdMaMJ6y6vFZ431zjAqZYhzXkAcMAdlbO/WjFAV+P4Dk2D26GpkdhxIDa9j4r5K8
 kSDDg5YxD3LYzmqZvVHnJzumzlSU8c+M2bl0ltn4P4u/BRk17k397BdgekcNsySN2SSi
 EVqTRTmP1590xF/3D1teap1Ou2dckfP909sL0emkSTErXWWOj/Si3CEd/cEDwykVSwF9
 O8Cg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AGT33VBW
Subject: Re: [Buildroot] [PATCH 1/2] package/python-jeepney: new package
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/11/2023 10:10, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied series to master, thanks.

  Regards,
  Arnout

> ---
>   package/Config.in                          |  1 +
>   package/python-jeepney/Config.in           |  6 ++++++
>   package/python-jeepney/python-jeepney.hash |  5 +++++
>   package/python-jeepney/python-jeepney.mk   | 14 ++++++++++++++
>   4 files changed, 26 insertions(+)
>   create mode 100644 package/python-jeepney/Config.in
>   create mode 100644 package/python-jeepney/python-jeepney.hash
>   create mode 100644 package/python-jeepney/python-jeepney.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index a0d5339b0a..d3f8b3c914 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1128,6 +1128,7 @@ menu "External python modules"
>   	source "package/python-jaraco-classes/Config.in"
>   	source "package/python-jaraco-functools/Config.in"
>   	source "package/python-jedi/Config.in"
> +	source "package/python-jeepney/Config.in"
>   	source "package/python-jinja2/Config.in"
>   	source "package/python-jmespath/Config.in"
>   	source "package/python-json-schema-validator/Config.in"
> diff --git a/package/python-jeepney/Config.in b/package/python-jeepney/Config.in
> new file mode 100644
> index 0000000000..700176e12f
> --- /dev/null
> +++ b/package/python-jeepney/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_JEEPNEY
> +	bool "python-jeepney"
> +	help
> +	  Low-level, pure Python DBus protocol wrapper.
> +
> +	  https://gitlab.com/takluyver/jeepney
> diff --git a/package/python-jeepney/python-jeepney.hash b/package/python-jeepney/python-jeepney.hash
> new file mode 100644
> index 0000000000..31a5bac183
> --- /dev/null
> +++ b/package/python-jeepney/python-jeepney.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/jeepney/json
> +md5  7e2151e9197c751ceca6550bc6b3294c  jeepney-0.8.0.tar.gz
> +sha256  5efe48d255973902f6badc3ce55e2aa6c5c3b3bc642059ef3a91247bcfcc5806  jeepney-0.8.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
> diff --git a/package/python-jeepney/python-jeepney.mk b/package/python-jeepney/python-jeepney.mk
> new file mode 100644
> index 0000000000..ac4c0283a8
> --- /dev/null
> +++ b/package/python-jeepney/python-jeepney.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-jeepney
> +#
> +################################################################################
> +
> +PYTHON_JEEPNEY_VERSION = 0.8.0
> +PYTHON_JEEPNEY_SOURCE = jeepney-$(PYTHON_JEEPNEY_VERSION).tar.gz
> +PYTHON_JEEPNEY_SITE = https://files.pythonhosted.org/packages/d6/f4/154cf374c2daf2020e05c3c6a03c91348d59b23c5366e968feb198306fdf
> +PYTHON_JEEPNEY_SETUP_TYPE = flit
> +PYTHON_JEEPNEY_LICENSE = MIT
> +PYTHON_JEEPNEY_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
