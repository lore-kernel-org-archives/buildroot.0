Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3C0EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 19:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3C0A40022;
	Mon, 19 Jun 2023 19:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3C0A40022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LND-sm-lSo85; Mon, 19 Jun 2023 19:34:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3B7141557;
	Mon, 19 Jun 2023 19:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3B7141557
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D52FF1BF2E4
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9D1461274
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9D1461274
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qk5yKM170BpM for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 19:34:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D63F6070A
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D63F6070A
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 19:34:11 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-988b204ce5fso172828966b.3
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 12:34:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687203249; x=1689795249;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SKwcNTcQYV+2UsQchPM4rhoP5GXbhv8iuDKsualQqyo=;
 b=lWc+iLdBXPvEJHRGWhk7EONPo3jRynbpSfadGfTeDvd7V5dLmh8WS2oRclYgOcIE8b
 QANfZkwZTy+qBGhf4hIZDCfzV/bMbNaHsTY+Gn+bgTnFxDTdSuAPXVoKx7o4tG589UGh
 9CXpadsVx7m4ooStyQR/mEV72s7jFOCQVNWW2ot902xummDNRHwWU4RD3YegonWAR8Kz
 srgHg+dJTpdgSwD/+Xa+PaCNTq90eO4E6MSw7zS1fsNj7LGjyCEwCJ94urdqoTdYtTGZ
 QWtGItq1AEf255Peo9XORwZ1y2oB1JUhGTQPz0bENzJVDRTe+NAOC3u/qsXqSydFhqt3
 89Lg==
X-Gm-Message-State: AC+VfDw/sqCWtNabgkd2ZymE5COf+nZhTVqLg3THepwpBTiUiufszJ4u
 17BxaMbJGrHDaOVDN/1npMS/gw==
X-Google-Smtp-Source: ACHHUZ7vESoUrxVKuXzrPfQWWaP5TlPMAur/vYy2t7zIKkrVprS5s/8/aR1buGNX53IKUQadVfpyYA==
X-Received: by 2002:a17:907:6e2a:b0:988:8786:f558 with SMTP id
 sd42-20020a1709076e2a00b009888786f558mr3906033ejc.63.1687203248571; 
 Mon, 19 Jun 2023 12:34:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a1709064e0e00b00987ac9cfb8esm109498eju.67.2023.06.19.12.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 12:34:07 -0700 (PDT)
Message-ID: <78e7387a-0021-655d-0704-0c0986ce74e3@mind.be>
Date: Mon, 19 Jun 2023 21:34:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20230619144727.365683-1-peter@korsgaard.com>
In-Reply-To: <20230619144727.365683-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687203249; x=1689795249;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SKwcNTcQYV+2UsQchPM4rhoP5GXbhv8iuDKsualQqyo=;
 b=eMz7F07CRjJPubORXgjFYqTE7gDoOptOfS8+HGCkVhLH0Qxg3kYXgvIZpugAa2XwKg
 LY1kecr0K/1YO7H8+4fW6bL+QsPIczn60ZrZJYLaH1Q2vuqO8j/swj2dF9CFt5yRUqmA
 M6LGOXmEK2d2Sg0o95Mt1P1l3AhnZqfmYBrO2i2q3a4YDnixjapATUKJ1W3R8FxZikSf
 Zc1tSZsdy2Z+atvYrfv79ZJZYV/1jG6tsSKdv4y3p84lqr6OA2fTMundFVn+G31xRWUq
 F2mScGYzjuFNo5IZrXiHG4iprdTg9PR0vPBWjhusf4EBxtjxGePteijtunONn5d4vxbU
 3e9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eMz7F07C
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 version 4.1.9
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
Cc: Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/06/2023 16:47, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> - CVE-2023-31047: Potential bypass of validation when uploading multiple
>    files using one form field
> 
> https://www.djangoproject.com/weblog/2023/may/03/security-releases/
> 
> In addition, 4.1.8 fixed a bug related to secrets rotation:
> https://docs.djangoproject.com/en/4.2/releases/4.1.8/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-django/python-django.hash | 4 ++--
>   package/python-django/python-django.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index cb03b33bfe..922f468a67 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  626f96c63ddfab24bab90d80c87a7aad  Django-4.1.7.tar.gz
> -sha256  44f714b81c5f190d9d2ddad01a532fe502fa01c4cb8faf1d081f4264ed15dcd8  Django-4.1.7.tar.gz
> +md5  1a6f4e5318e3272deaa9cfd61e252fab  Django-4.1.9.tar.gz
> +sha256  e9f074a84930662104871bfcea55c3c180c50a0a47739db82435deae6cbaf032  Django-4.1.9.tar.gz
>   # Locally computed sha256 checksums
>   sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index e8c91cf51f..fa58f65797 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>   #
>   ################################################################################
>   
> -PYTHON_DJANGO_VERSION = 4.1.7
> +PYTHON_DJANGO_VERSION = 4.1.9
>   PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
>   # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/9f/a7/07939866241b7e8f8d3bf164b7d6ad428163723e29dd472700f8ab0e5fd5
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/11/ea/8b514434c57c3bef89a475b75f74d768471d8e1bc61f4e5c79daeae9b5ef
>   
>   PYTHON_DJANGO_LICENSE = BSD-3-Clause
>   PYTHON_DJANGO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
