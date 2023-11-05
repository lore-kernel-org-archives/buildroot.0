Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A207C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07E2340A74;
	Sun,  5 Nov 2023 20:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07E2340A74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O-bACfycDzDm; Sun,  5 Nov 2023 20:53:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6B5740A5F;
	Sun,  5 Nov 2023 20:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6B5740A5F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44B911BF5A3
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D49960AE7
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D49960AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Ea3zi5vOvhS for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:53:44 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7E1860ABA
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7E1860ABA
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53e70b0a218so6501074a12.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:53:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699217622; x=1699822422;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MixV39f62boZOJWiVgSq1hi5xr4P39NFETKsuCIXTMI=;
 b=Qk8AXUS64AVIOYranJiG79MCEq2l7A2c5dSlWiX+anYzlNBcBVyTmspGI6Kcj4wVSH
 jTT34zxrvXWzX+nSlMPWoJ1YOThqiMQtFiKG5OmDqQGeDqJEod8UrHyLNWfKfwDf8QGn
 3YOKONXI3AbGceeSFFe8QqAfESOk+41wn5R0yCBTF3mdSGrGx7Soh1GglmdgLC40oMGL
 Of/ZAT2Hc7BQGhx3COVmsqtPNiOh9EgEguhA//fQ6bLOEB4Dlcjq3HYzFa7BYtLR5XoH
 i9K4MuM6P9dkB8iOK6rZCgC7MS3OfXse2YM8TDnyAAf7lPyDExDt7lZlmya7aF+H2aXA
 5udA==
X-Gm-Message-State: AOJu0Yx50uzXdJf7aWUwx+OFEfoOmr00iksLRLdNi8Vywtf1P2ia+8Md
 q9Cit4khtM4y86KKqmr1pIB2Nni+PX7xoY7vVrY=
X-Google-Smtp-Source: AGHT+IEYYG9Ec6MWlKkmsn59woC1tljLakIrxRwnViH+TGRNXJYun0EvkXgMJmM5+x/Z9MXJ/Gd29w==
X-Received: by 2002:a17:907:7e85:b0:9c3:b3cb:29ae with SMTP id
 qb5-20020a1709077e8500b009c3b3cb29aemr11540091ejc.47.1699217621909; 
 Sun, 05 Nov 2023 12:53:41 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 vh8-20020a170907d38800b009dd678d7d3fsm2856065ejc.211.2023.11.05.12.53.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 12:53:41 -0800 (PST)
Message-ID: <298fd763-7bcd-4325-9c7e-75d900c0143f@mind.be>
Date: Sun, 5 Nov 2023 21:53:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Alessandro Partesotti <a.partesotti@gmail.com>, buildroot@buildroot.org
References: <20230128094119.10660-1-a.partesotti@gmail.com>
 <20230129225000.336472-1-a.partesotti@gmail.com>
In-Reply-To: <20230129225000.336472-1-a.partesotti@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699217622; x=1699822422; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MixV39f62boZOJWiVgSq1hi5xr4P39NFETKsuCIXTMI=;
 b=hwoF+PYgtI3aSe/xF41IB6PPD6ka+mvfBrrvpTmiWJQUcyjOSfoRwnOyYjKyk8kHDV
 Yn1XF8h3xow1CSC6fRMZouGyEw+xBBeLiO08QIkseuiq9lbeWNmb+lVeu0H+uZFcrfRn
 sg8VPGuf9ObZywJ7D7W7ff4dkBOokFK/KQd0uJZjxVF5O6bUuscdGkpSJV9BNkIn6xTt
 PhdEavRa/IafhuR/b1WRO/1fSqsAo3Al4hqNh38SWbiXibuKvpgLiwIawKNQTY/noWkL
 eJPVnqmsqZVtrE43O/6U29roKTKHFXgjyP8MGow9uFCvTxEuASY3hBPxUMb+2E7NV3OO
 HNEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hwoF+PYg
Subject: Re: [Buildroot] [PATCH v2 1/1] package/oatpp:: new package
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
Cc: "YANN E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Alessandro,

  I (finally) applied your patch to master, with a whole lot of changes, see below.

On 29/01/2023 23:50, Alessandro Partesotti wrote:
> This package introduce oatpp in BR buildsystem.

  This sentence is redundant.

> Oatpp must be used as static library as upstreaam suggest.
> 
> Signed-off-by: Alessandro Partesotti <a.partesotti@gmail.com>
> ---
> Changes v1 -> v2
> - indentation and spaces (suggested by Yann E. MORIN)
> - generic macro changes (suggested by Yann E. MORIN)
> 
> Signed-off-by: Alessandro Partesotti <a.partesotti@gmail.com>
> ---
>   DEVELOPERS               |  3 +++
>   package/Config.in        |  1 +
>   package/oatpp/Config.in  | 13 +++++++++++++
>   package/oatpp/oatpp.hash |  2 ++
>   package/oatpp/oatpp.mk   | 16 ++++++++++++++++
>   5 files changed, 35 insertions(+)
>   create mode 100644 package/oatpp/Config.in
>   create mode 100644 package/oatpp/oatpp.hash
>   create mode 100644 package/oatpp/oatpp.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e8e0dffcd3..b2d173dc2e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3149,3 +3149,6 @@ F:	package/quazip/
>   F:	package/shapelib/
>   F:	package/simple-mail/
>   F:	package/tinc/
> +
> +N:      Alessandro Partesotti <a.partesotti@gmail.com>

  DEVELOPERS should be alphabetic by name, so I moved this up.

> +F:      package/oatpp/
> diff --git a/package/Config.in b/package/Config.in
> index 995dae2c57..c7394ae53d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1941,6 +1941,7 @@ menu "Networking"
>   	source "package/nss-mdns/Config.in"
>   	source "package/nss-myhostname/Config.in"
>   	source "package/nss-pam-ldapd/Config.in"
> +	source "package/oatpp/Config.in"
>   	source "package/omniorb/Config.in"
>   	source "package/open-isns/Config.in"
>   	source "package/open62541/Config.in"
> diff --git a/package/oatpp/Config.in b/package/oatpp/Config.in
> new file mode 100644
> index 0000000000..44f0fabed8
> --- /dev/null
> +++ b/package/oatpp/Config.in
> @@ -0,0 +1,13 @@
> +comment "Oat++ needs a toolchain w/ C++"

  This was missing threads.

> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +config BR2_PACKAGE_OATPP
> +	bool "Oat++"

  We always use lowercase for the prompts. We also use the package name, unless 
there is a _very_ good reason to not use it. In this case, upstream seems to use 
both oat++ and oatpp, so I changed this to oatpp.

> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  Oat++ is an open-source C++ web framework for highly

  Now it was wrapped to short :-)

> +	  scalable and resource-efficient web applications.
> +	  It provides all the necessary components for
> +	  production-grade development.
> +	  See https://oatpp.io/docs/start

  The upstream URL should be on a separate line.

> diff --git a/package/oatpp/oatpp.hash b/package/oatpp/oatpp.hash
> new file mode 100644
> index 0000000000..fadea2a05f
> --- /dev/null
> +++ b/package/oatpp/oatpp.hash
> @@ -0,0 +1,2 @@
> +# Hash from: https://github.com/oatpp/oatpp/archive/1.3.0/oatpp-1.3.0.tar.gz

  That's not a hash, that's the tarball itself. There's no upstream hash AFAICS. 
So I changed this to Locally calculated.

> +sha512  4fe8587efe1b4ecae14554ec8edb209e5558a3e4a4e6ff49bbfaaf06d2cc12f2cc306c5edc43b8dafc465aff53098ad4bebb9971694761b91a553730d5acb59a  oatpp-1.3.0.tar.gz

  We use sha256 for locally calculated.

  There should also be a hash for the license file.

> diff --git a/package/oatpp/oatpp.mk b/package/oatpp/oatpp.mk
> new file mode 100644
> index 0000000000..f949a5cbc9
> --- /dev/null
> +++ b/package/oatpp/oatpp.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# oatpp
> +#
> +################################################################################
> +
> +OATPP_VERSION = 1.3.0
> +OATPP_LICENSE = Apache-2.0
> +OATPP_LICENSE_FILES = LICENSE
> +OATPP_SITE = $(call github,oatpp,oatpp,$(OATPP_VERSION))
> +OATPP_CMAKE_OPTS = -DBUILD_SHARED_LIBS=OFF

  This should be OATPP_CONF_OPTS, otherwise it isn't used and it does install 
shared libs...

  Regards,
  Arnout

> +OATPP_INSTALL_STAGING = YES
> +# Only builds a static lib and copy headers:
> +OATPP_INSTALL_TARGET = NO
> +
> +$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
