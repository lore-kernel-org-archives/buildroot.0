Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C977AC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73A0940168;
	Mon,  5 Feb 2024 10:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73A0940168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v_kj1i-1Iund; Mon,  5 Feb 2024 10:48:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4377340A5D;
	Mon,  5 Feb 2024 10:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4377340A5D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBE2B1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B06B64055D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B06B64055D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WxrGZnK3Ho32 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:48:21 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76E8540541
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76E8540541
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40fdcae97e7so4415245e9.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:48:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707130099; x=1707734899;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8TDhMg1zefseSJ5L9QPeBLHdWE/LgfEOAkEnQnjr05I=;
 b=due8xIVq6XSalQSW4z0YDNvCSV9ELjevu8BWGfODxCSCB0T4Eesp6jLr7dd9xW5e/Q
 9859/eiUJRqtBPYLB1Nq5zhG6qMJmtrcE1J9slA+3DI2APh8KYq1CVDB6t2uRf2LNcWj
 A98oqlsIKnBmhyrBF6nG7DfCYlNQPkyXOFA+I9ozLwx9Llcpd4UBxZG588tfgwZ/ovXZ
 5dnRoR9XdEl+Q0fcdkw9U8nO4V19vTDEHDKfpSA7viATlDp/4ErHA92zv3E6pblcTyl3
 MPxk8TvlXiWM44D5CkXZuNT0yj8vxoePeP9aPf7dSVzL6PboMNArlZykG+PlHUc/obcA
 nOng==
X-Gm-Message-State: AOJu0Yy3tUE6mDYAu8Cl1so+YC9IfHLMQhpupRpKMevp35qGv2bnFRL6
 dKUEdzG5fDBPPO3Hc5lDX8haY8OwD1wGTA3m5zpWCSnbISUQViFRjbHwG5ztrK0=
X-Google-Smtp-Source: AGHT+IFmKlfLVYuNEyMv+1hm5zxvj9HHNjHD9scYc7fnjX8/rzKaAVuY4E5HVgnEkLfVjj+bNveSNw==
X-Received: by 2002:a05:600c:4511:b0:40e:e834:3d86 with SMTP id
 t17-20020a05600c451100b0040ee8343d86mr4105471wmo.37.1707130099595; 
 Mon, 05 Feb 2024 02:48:19 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUt02Wpj5uYqzXQmVWLDV4dnfoRELOw5+8lPzUPBj91KAcUIRWcWOgWsXZtf/Wd8pBUmoMxLXWgLHyZv3L3GnVkSx8SeiHbZGUL14HstBcI9kgXjbukcrALPbZp2q4ZIs67P2FQig==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c044a00b0040efc268713sm8101947wmb.26.2024.02.05.02.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:48:19 -0800 (PST)
Message-ID: <2b4b608b-1525-42ef-961f-a73354327ff8@mind.be>
Date: Mon, 5 Feb 2024 11:48:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111044530.2889558-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111044530.2889558-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707130099; x=1707734899; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8TDhMg1zefseSJ5L9QPeBLHdWE/LgfEOAkEnQnjr05I=;
 b=TbS0iLvNuYTQjRTkGsO05AcUNi2ZN8BTXi3ZFfvmHzsM5AgOOoru7YzH7OGACQUAqG
 8YE12ZUYO4GRgJqDE6nalEY+aVebKD7v19Vm+HIhnD+qLwzyRoodM4YKd3dOLkrtJlgD
 w5Y8L0yVH9ZXFsLnY25uZIb2mQAspvJ3UbVDZQNsO7zhPmKhHIOb5AIs0/JXXsiriVGN
 JuoY0JMNlqAwCUygcQ4rfMct83eYkhNCwWRkk2IiZTwf3V1cocBRQZa1pmaKdyBqzFMH
 qZu2RCd2yFbiHRVmIbF2n1vqttUdzCo8IVB9ZIfxbQdZrrUrZlWQgsQBEo4wJ1N7jpuy
 meew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TbS0iLvN
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pypng: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/01/2024 05:45, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/Config.in                      |  1 +
>   package/python-pypng/Config.in         |  6 ++++++
>   package/python-pypng/python-pypng.hash |  5 +++++
>   package/python-pypng/python-pypng.mk   | 14 ++++++++++++++
>   4 files changed, 26 insertions(+)
>   create mode 100644 package/python-pypng/Config.in
>   create mode 100644 package/python-pypng/python-pypng.hash
>   create mode 100644 package/python-pypng/python-pypng.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 5b8b15fa54..1375d28116 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1276,6 +1276,7 @@ menu "External python modules"
>   	source "package/python-pyparsing/Config.in"
>   	source "package/python-pyparted/Config.in"
>   	source "package/python-pyphen/Config.in"
> +	source "package/python-pypng/Config.in"
>   	source "package/python-pyqrcode/Config.in"
>   	source "package/python-pyqt5/Config.in"
>   	source "package/python-pyratemp/Config.in"
> diff --git a/package/python-pypng/Config.in b/package/python-pypng/Config.in
> new file mode 100644
> index 0000000000..c1ed405615
> --- /dev/null
> +++ b/package/python-pypng/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_PYPNG
> +	bool "python-pypng"
> +	help
> +	  Pure Python library for saving and loading PNG images.
> +
> +	  https://gitlab.com/drj11/pypng
> diff --git a/package/python-pypng/python-pypng.hash b/package/python-pypng/python-pypng.hash
> new file mode 100644
> index 0000000000..0f55eef702
> --- /dev/null
> +++ b/package/python-pypng/python-pypng.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/pypng/json
> +md5  7d9cce86ceb19524784ade86fb13a063  pypng-0.20220715.0.tar.gz
> +sha256  739c433ba96f078315de54c0db975aee537cbc3e1d0ae4ed9aab0ca1e427e2c1  pypng-0.20220715.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  8dd127d87bb901ab9c8f584e98b7c7aa8539db27fe62ff01b1ee4be93b6a513a  LICENCE
> diff --git a/package/python-pypng/python-pypng.mk b/package/python-pypng/python-pypng.mk
> new file mode 100644
> index 0000000000..07ad16b67b
> --- /dev/null
> +++ b/package/python-pypng/python-pypng.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-pypng
> +#
> +################################################################################
> +
> +PYTHON_PYPNG_VERSION = 0.20220715.0
> +PYTHON_PYPNG_SOURCE = pypng-$(PYTHON_PYPNG_VERSION).tar.gz
> +PYTHON_PYPNG_SITE = https://files.pythonhosted.org/packages/93/cd/112f092ec27cca83e0516de0a3368dbd9128c187fb6b52aaaa7cde39c96d
> +PYTHON_PYPNG_SETUP_TYPE = setuptools
> +PYTHON_PYPNG_LICENSE = MIT
> +PYTHON_PYPNG_LICENSE_FILES = LICENCE
> +
> +$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
