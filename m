Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6C0C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 07:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CE5741506;
	Sun,  6 Aug 2023 07:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CE5741506
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rAkxuxjkYXQ4; Sun,  6 Aug 2023 07:06:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F03D7415EF;
	Sun,  6 Aug 2023 07:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F03D7415EF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA1511BF909
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 07:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B73F415ED
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 07:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B73F415ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zfM8ZEpSuCQw for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 07:05:27 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E315240050
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 07:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E315240050
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fe61ae020bso1689091e87.2
 for <buildroot@buildroot.org>; Sun, 06 Aug 2023 00:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691305524; x=1691910324;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xm78eWQHTWJCgOBt4Dosi1b1ujwg7xGc/K4eLjeB4bE=;
 b=YHcvbvMIJm+/u9p+kiJbAaAkVg/ytr34ibrCOTOzyfTKO+h0b6diVsrJ52bzYh8JaZ
 Kk5HRm9MWj/VMAqeuOK/Zu0Chw7Cw3A05xEPlRaWZPedVxa3sfZdHp8buwCKR3RilQG7
 hh9MzprIa45J0Y878QZETME06MyJcaGIcYosrFV85SZWnNBqEJAqTR+43NCiPuLKv1Le
 nAdw8mWr7yf3On/Tgn09JmEjvx42GbHmiDcabMHA60LASAViMlJsKBhIy51Kku5ggF7h
 9Hof1G+cOf0wiL+vcj+gwGgGoB0jFo9gVrmEGEhDPocIyPyRMy/0ki6KxuGvkcCJD2ox
 YZ1g==
X-Gm-Message-State: AOJu0Yzy1pNatSpiXNXOVS+QMtC5KgybXguYV2xiHvQqbCz0nn8rrHGv
 Yx7Ouo9E473Ad8M4mworlK1PDHCARQI=
X-Google-Smtp-Source: AGHT+IGF90NkVfZqqgrabTNqRnkYJUfh7AnJdmw2XmoPI/DzQC4B6JSQYJg9o/UINCNEZgQpkJeMDg==
X-Received: by 2002:a05:6512:32cb:b0:4f8:6dfd:faa0 with SMTP id
 f11-20020a05651232cb00b004f86dfdfaa0mr4484114lfg.2.1691305524262; 
 Sun, 06 Aug 2023 00:05:24 -0700 (PDT)
Received: from curiosity ([80.211.22.60]) by smtp.gmail.com with ESMTPSA id
 a11-20020a056512020b00b004fe4ba4cdc2sm1010731lfo.87.2023.08.06.00.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Aug 2023 00:05:23 -0700 (PDT)
Date: Sun, 6 Aug 2023 10:05:19 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Christian Stewart <christian@aperture.us>
Message-ID: <ZM9GL54wnPY803DH@curiosity>
References: <20230726202838.1931660-1-christian@aperture.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230726202838.1931660-1-christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691305524; x=1691910324;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xm78eWQHTWJCgOBt4Dosi1b1ujwg7xGc/K4eLjeB4bE=;
 b=UtuYBUcpTU8GKDmtmOA3cg3GKlq87xjzLT0h5e9YQIXm39lBqE+hCNTW3cad3f8A31
 0NfuS/FUcdbqouuWjpnbr2vmy4m6NPXPOKSoKJmZyvbxXSr9C+FRx/QGVe9j0B5RG8jZ
 63C8ohAF2xwe11Hbuv2OecXhCVu3GKppSZyKHd6AdCzh71sZDUh0jsHNXAxJoAdL6ALq
 Yn+N/b5OHr+aTtevaW2fIrqLmaL2FIy8Sti14wrS0iYP+KmPgdzjE4WyPD1WfxvuWcXL
 05B+pbFIIsLXJ8VA4i8MQ1tC1J6u5WKpv2HKc/8OUo0rXyyxSIxkX8E69eZMcvhATv/u
 Cl5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=UtuYBUcp
Subject: Re: [Buildroot] [PATCH v1 1/3] package/python-pylibfdt: bump
 version to 1.7.0.post1
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Christian,

> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/python-pylibfdt/python-pylibfdt.hash | 4 ++--
>  package/python-pylibfdt/python-pylibfdt.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-pylibfdt/python-pylibfdt.hash b/package/python-pylibfdt/python-pylibfdt.hash
> index 056fd3a62e..82527e727e 100644
> --- a/package/python-pylibfdt/python-pylibfdt.hash
> +++ b/package/python-pylibfdt/python-pylibfdt.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.python.org/pypi/pylibfdt/json
> -md5  5765c20ac6cde517d5b7218503ab707b  pylibfdt-1.6.1.tar.gz
> -sha256  90c667c5adf44c6ab2f13bdc566598897784c7b781bed91064e7373bd270b778  pylibfdt-1.6.1.tar.gz
> +md5  353ee3063d0b10e94d165e032897d34e  pylibfdt-1.7.0.post1.tar.gz
> +sha256  2d048f9f8ce9a0527d497f423dea1f1135f9811c05b009cc5d5753771c1f9ba1  pylibfdt-1.7.0.post1.tar.gz
>  # Locally computed
>  sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  BSD-2-Clause
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL
> diff --git a/package/python-pylibfdt/python-pylibfdt.mk b/package/python-pylibfdt/python-pylibfdt.mk
> index dc68de83b3..5511bd12b3 100644
> --- a/package/python-pylibfdt/python-pylibfdt.mk
> +++ b/package/python-pylibfdt/python-pylibfdt.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_PYLIBFDT_VERSION = 1.6.1
> +PYTHON_PYLIBFDT_VERSION = 1.7.0.post1
>  PYTHON_PYLIBFDT_SOURCE = pylibfdt-$(PYTHON_PYLIBFDT_VERSION).tar.gz
> -PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/15/3c/40b1d6a1df9dbc9d9ba5700a47ad95ca1e984f18daf25ede0da5f67d0cf7
> -PYTHON_PYLIBFDT_SETUP_TYPE = setuptools
> +PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/96/5c/77ef0f0459e0b13f39ecc22e21ad4ac9fbe741e8a7cd70702ac8165f80e2
> +PYTHON_PYLIBFDT_SETUP_TYPE = pep517
>  PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause or GPL-2.0+
>  PYTHON_PYLIBFDT_LICENSE_FILES = BSD-2-Clause GPL
>  PYTHON_PYLIBFDT_DEPENDENCIES = host-python-setuptools-scm host-swig


This patch series fixes the following recent build failures:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556137
- https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556224
- https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556227
- https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556229
- https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556230

Tested-by: Sergey Matyukevich <geomatsi@gmail.com>

Thanks,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
