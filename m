Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE06AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7962661AD2;
	Sat, 23 Jul 2022 15:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7962661AD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 67NUHuKbCKLi; Sat, 23 Jul 2022 15:02:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AC8E61AC5;
	Sat, 23 Jul 2022 15:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AC8E61AC5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22E9A1BF859
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B58861AC5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B58861AC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MFuSWE1S1lVE for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:02:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04D8E60D58
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04D8E60D58
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:02:39 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d8so10068957wrp.6
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eejixLiHhT7pBJlO5LmFrIEU/RlVv/vISQPWrDbvogA=;
 b=65xYW3/t/4xt+PhN+Bt+qalDDqwbpUP/yoPg31JbxQGsSQtkjq4wMHs+QTrXxMQC9y
 FweEOpOMGhR+kOkLIez1e+jeTMvRs3+ANCJ0bkiWbOoKvb34z2LtotpHlRrV4VkO5v9j
 Ci2k+er1v7+AYJkBau5/onBo2sILECEC7CtHqkBCIJKhqH3ETMS/6Fs5/M/Q8xsvIcW4
 hQ7NICagg3WFU4cTd34gP7vmn5Ko3VJfDGXaeAwcfqHMGOpaiLFVQghuLmcTKlXphsYs
 3IiaKAsweGYWXV37G63vNTMhK3DZUlOKp98ZxpMVQfdxTFDvojTmAPT+kAkdQcSC0obN
 U0Eg==
X-Gm-Message-State: AJIora+m62Hbo8YfcVfD5wk7yjCWESrGiVY/g5diaTXVO0PAWf/LWmSI
 L5cryWZRknmRnezoDnYq2rhE0Q==
X-Google-Smtp-Source: AGRyM1tSp49VFWiMSVXHKNn+YDuk4KCWHlS3mMXC5JHKlhzzkUQ0f0fgHpkzAZpN69iX5/fI/KZluw==
X-Received: by 2002:a05:6000:1acb:b0:21d:ad71:3585 with SMTP id
 i11-20020a0560001acb00b0021dad713585mr2876301wry.156.1658588558186; 
 Sat, 23 Jul 2022 08:02:38 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 e10-20020adfe7ca000000b0021dbaa4f38dsm8701935wrn.18.2022.07.23.08.02.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 08:02:37 -0700 (PDT)
Message-ID: <b72e4878-9526-3847-629d-81621a3616a1@mind.be>
Date: Sat, 23 Jul 2022 17:02:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220718221102.3034495-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220718221102.3034495-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eejixLiHhT7pBJlO5LmFrIEU/RlVv/vISQPWrDbvogA=;
 b=GVsYT+X3PnezJpEKxGEPRwgdgXJ1uO1hQdo4rH1D1kBO04lx8HNCSxJvY/UryYY/Sj
 6IErxfwT6kY2rEweAQfGwcwm5gxNJ4Uytk3aVNLagH/edL6vsj/Ifrk5FaCYsXK+c9Bw
 Sz3kel2nmkAfMo6ckxsbfTDvgDykRYf6KfTfu+4cjEh981Yz7Abo/Uq2F79niHIJBryo
 1uDvdm0zmT2d8Pne9chSw8yxRyE/7+NkKy5xMJBbd7/nBoXmCWGDY+1EvGUkUdMeWUr5
 dQhiskbjN0G6gG1HCExvWeF2RYBlY8uW67SLL5gBTnv27ZDDmgrciZtlPSxLPOg3OMWz
 KowA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GVsYT+X3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-django: security bump to
 version 4.0.6
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
Cc: Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/07/2022 00:11, Fabrice Fontaine wrote:
> Fix CVE-2022-34265: An issue was discovered in Django 3.2 before 3.2.14
> and 4.0 before 4.0.6. The Trunc() and Extract() database functions are
> subject to SQL injection if untrusted data is used as a kind/lookup_name
> value. Applications that constrain the lookup name and kind choice to a
> known safe list are unaffected.
> 
> https://www.djangoproject.com/weblog/2022/jul/04/security-releases
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-django/python-django.hash | 4 ++--
>   package/python-django/python-django.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 8d9f0aafdb..bfc9219c7e 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  153fcb5dd7360b7ad219d65cb53e2d57  Django-4.0.4.tar.gz
> -sha256  4e8177858524417563cc0430f29ea249946d831eacb0068a1455686587df40b5  Django-4.0.4.tar.gz
> +md5  ad4e850c7110a45a6c7778d5bd01b85e  Django-4.0.6.tar.gz
> +sha256  a67a793ff6827fd373555537dca0da293a63a316fe34cb7f367f898ccca3c3ae  Django-4.0.6.tar.gz
>   # Locally computed sha256 checksums
>   sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index b4d6ec21c9..d49c845d54 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>   #
>   ################################################################################
>   
> -PYTHON_DJANGO_VERSION = 4.0.4
> +PYTHON_DJANGO_VERSION = 4.0.6
>   PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
>   # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/d2/95/93d1f75da95624bf89e373d079fa72debf77f9b10acc31998cc52a5ff3f9
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/a4/17/b10aa26d7a566a3c19e9d29fac39c8643cbceb6cd7649a378d676839b5db
>   
>   PYTHON_DJANGO_LICENSE = BSD-3-Clause
>   PYTHON_DJANGO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
