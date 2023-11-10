Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D963C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 20:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC9D242858;
	Fri, 10 Nov 2023 20:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC9D242858
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cCGGjakhIvMT; Fri, 10 Nov 2023 20:59:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20E5742717;
	Fri, 10 Nov 2023 20:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20E5742717
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1869D1BF2B6
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 20:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0A6683B3E
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 20:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0A6683B3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tc0p3XGaBXaA for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 20:59:01 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C683F83AD2
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 20:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C683F83AD2
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c79d8b67f3so18015111fa.0
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 12:59:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699649938; x=1700254738;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yr3aJcyDh2pq0j70O2k5vniZe+Qbt7YO/AlZQ81v5zI=;
 b=HJ1OCK5mdBiAOWO5gubYP72wJpLznQLopFHBQdmeyBtZcVkJfOqtBxGSGBlziKSEsT
 fvZc2jpY12JEozqwfRCT4QRDs2zsNxj1pLD+XTrwfyDsXGx59jm9eOEcPILCMoJgrb/D
 Sa1dKsphDIBCCBPoJthD52MEKDHGCil/0gj0NLzUgs8MBlOv2bi4M+rdbpbGwjmXQpUe
 YbwHR+9IYfgWDomzHhkKE1UlNGrZ0tphrVg45KbN8hgxplJrGWW1gvVm2aYE2G5dFwNv
 SVbrxXy126SZ05ofD9Z0ZcMm1upogaoPcLh9x8fNZOLWCR70SjpFyh4CBgVtKtGLPZhY
 b0Dw==
X-Gm-Message-State: AOJu0YwKuIX9xfP9yV9UoO3Gxhxbhqrh1XyVajg2Ucx0r0BYZAwfqBsX
 lNvZATgbi33w4OPEyDq5Jw478g==
X-Google-Smtp-Source: AGHT+IHC5ROoTKg1SyrUfyuQYA/kwJISEKC+e96hAelE4946Rz+XRytNzifPxc0aUTh3EzS6It7rUg==
X-Received: by 2002:ac2:58f8:0:b0:509:cde:952b with SMTP id
 v24-20020ac258f8000000b005090cde952bmr157224lfo.10.1699649938503; 
 Fri, 10 Nov 2023 12:58:58 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 fi5-20020a170906da0500b009e5db336137sm74719ejb.196.2023.11.10.12.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 12:58:57 -0800 (PST)
Message-ID: <34732d2f-f136-4a6a-857f-16ddf05bb31a@mind.be>
Date: Fri, 10 Nov 2023 21:58:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
 <20231105202555.359391-18-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231105202555.359391-18-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699649938; x=1700254738; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yr3aJcyDh2pq0j70O2k5vniZe+Qbt7YO/AlZQ81v5zI=;
 b=RmepNroB0wku+jF/y0IH1c/0mV9+ZLs832GyU5Twlaz6sGKFgxaHTOJ4OaC78YuQRX
 FTSBV991kEgpLHN9kgDK+x2ZU7wClT/AKPvC/OG4TU9dx18AUNlGWvZDF726YM59gU9L
 gRo6a2z7Qo4X3BsgC/rrHLac/XtMjebAXgA2GL+87AZqsL7ZUPlgZhfo+O23OcfAc6EX
 +jes7WyPbBPPlXAA2FDWjWylnoI91qGyy2A3zrxeuIxocembZiLI51EGtpp5/iu4LF4H
 H5yBF3cZ+y8dBXX/g84bDR7sBVo1F2+bUGYTQo8O9AAx+wYV4OrzPIOt4246jW+agbss
 Iz4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RmepNroB
Subject: Re: [Buildroot] [PATCH v2 18/24] package/python-pyxb: Drop package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/11/2023 21:25, Adam Duskett wrote:
> The last time python-pyxb was updated according to pypi.org is in 2017.
> As there are no maintainers listed for the package, and the package uses
> distutils which has been removed in Python 3.12.0, remove the package.

  It seems there was a mistake here...

- James is listed as a developer (with wildcard).
- James submitted a patch on Oct 1 (long before the first attempt to bump to 
3.12.0) to switch to setuptools [1].

  That said, I don't think anyone will actually miss pyxb...

  Regards,
  Arnout

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20231001091943.1772441-1-james.hilliard1@gmail.com/



> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v1 -> v2: Drop the Config option for python-pyxb in this patch.
> 
>   Config.in.legacy                     |  7 +++++++
>   package/Config.in                    |  1 -
>   package/python-pyxb/Config.in        |  8 --------
>   package/python-pyxb/python-pyxb.hash |  4 ----
>   package/python-pyxb/python-pyxb.mk   | 14 --------------
>   5 files changed, 7 insertions(+), 27 deletions(-)
>   delete mode 100644 package/python-pyxb/Config.in
>   delete mode 100644 package/python-pyxb/python-pyxb.hash
>   delete mode 100644 package/python-pyxb/python-pyxb.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 6fef2318b0..312d53943c 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>   
>   comment "Legacy options removed in 2023.11"
>   
> +config BR2_PACKAGE_PYTHON_PYXB
> +	bool "python-pyxb removed"
> +	select BR2_LEGACY
> +	help
> +	  python-pyxb has been removed due to being abandoned and
> +	  distutils no longer being supported in python 3.12.0.
> +
>   config BR2_PACKAGE_OPENJDK_VERSION_11
>   	bool "openjdk 11 has been removed"
>   	select BR2_LEGACY
> diff --git a/package/Config.in b/package/Config.in
> index a0d5339b0a..32347fe4e8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1268,7 +1268,6 @@ menu "External python modules"
>   	source "package/python-pytz/Config.in"
>   	source "package/python-pyudev/Config.in"
>   	source "package/python-pyusb/Config.in"
> -	source "package/python-pyxb/Config.in"
>   	source "package/python-pyyaml/Config.in"
>   	source "package/python-pyzmq/Config.in"
>   	source "package/python-qrcode/Config.in"
> diff --git a/package/python-pyxb/Config.in b/package/python-pyxb/Config.in
> deleted file mode 100644
> index 6555ed80b6..0000000000
> --- a/package/python-pyxb/Config.in
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -config BR2_PACKAGE_PYTHON_PYXB
> -	bool "python-pyxb"
> -	help
> -	  PyXB is a pure Python package that generates Python code for
> -	  classes that correspond to data structures defined by
> -	  XMLSchema.
> -
> -	  http://pyxb.sourceforge.net/
> diff --git a/package/python-pyxb/python-pyxb.hash b/package/python-pyxb/python-pyxb.hash
> deleted file mode 100644
> index f24cd42e5a..0000000000
> --- a/package/python-pyxb/python-pyxb.hash
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# md5 from https://pypi.python.org/pypi/PyXB/json, sha256 locally computed
> -md5  4303573fc7094ce4664c5b71cd4bdb48  PyXB-1.2.6.tar.gz
> -sha256  2a00f38dd1d87b88f92d79bc5a09718d730419b88e814545f472bbd5a3bf27b4  PyXB-1.2.6.tar.gz
> -sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/python-pyxb/python-pyxb.mk b/package/python-pyxb/python-pyxb.mk
> deleted file mode 100644
> index 6af10b51e7..0000000000
> --- a/package/python-pyxb/python-pyxb.mk
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -################################################################################
> -#
> -# python-pyxb
> -#
> -################################################################################
> -
> -PYTHON_PYXB_VERSION = 1.2.6
> -PYTHON_PYXB_SOURCE = PyXB-$(PYTHON_PYXB_VERSION).tar.gz
> -PYTHON_PYXB_SITE = https://pypi.python.org/packages/e3/09/4fdb190ea2b7cb43d6d3e745276ee69f4d6181be70fcbfda7df3c5f72f0e
> -PYTHON_PYXB_LICENSE = Apache-2.0
> -PYTHON_PYXB_LICENSE_FILES = LICENSE
> -PYTHON_PYXB_SETUP_TYPE = distutils
> -
> -$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
