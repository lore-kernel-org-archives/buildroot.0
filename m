Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC53C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:19:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4798D60F92
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4798D60F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5E3681D11;
	Tue, 12 Oct 2021 20:19:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MK1IOCl7ZXwj; Tue, 12 Oct 2021 20:19:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4195381D0B;
	Tue, 12 Oct 2021 20:19:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E8781BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D6CE40242
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLY52jYez5sn for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:19:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1146840104
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:19:49 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id i20so858240edj.10
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 13:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dzR5bndRTmoY9ps+kQzIKGphhRkC/8sU4cEnWHcOBPw=;
 b=SR7EIpcBGUPxJf0hLqKz0owXimJOCdbGKDhJ3GZDAR02AlNsw/cVx6RyliaKlFGDjf
 DZovo/32V9Cqwe2V9G3d1awSjGniLf4e05oSZPeoalQSt4uyxFt8jsSMg6jSiheNTK/H
 VPtm8sK8jWHeY+x9BPkLXW+7Uwx/89FVyZ0KawfRvVIaCt4RqS2AxRD1Rt1jBuhc7bMy
 BrZERNIAoyfXUdLkuhPOpjm7NalNQqoBCM4de8QvKGK+h4+YUNRMQhi742nkDrdDPcN5
 cX+pmdcqV6W/DnqpRy7koH9C5qVb/83iORrF5+wgGEDo0IWGNGfAXMQnk1Ap9bEucmLk
 MaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dzR5bndRTmoY9ps+kQzIKGphhRkC/8sU4cEnWHcOBPw=;
 b=XSyFYSHW2saYyQOES2unnxOOTozzMsN639PnfjJFsMTLEuaT0SepyUq1RdgIWQRJnU
 bYTfE78r6Lf988stocZ8Uf4I1th35WxFyyImlfzRHjA+HX9cu352HeIVjS8fV3MucMDB
 rvDddsIcIGmdSQn9vWmrhhmtI90Z9lpOafK2vOBTgatLfpg9LS2VnecYLX1kXXUVVzs4
 cKE7V8Z5ECrccBD4Y91OSH67/pjq2d+B1DWSqatE1N7HdTkR3wspISPiDZZDkvCylyvj
 U9Y79zVhptq9fLEwJ+s30RTb4dudEOEYcL+zJEV0LqjFK7SLjWUk7LFskxSO5DDTNXMf
 6ubQ==
X-Gm-Message-State: AOAM531EzbdVq2nl5F+Cp+TwIjz3Q6xqOuw9Y6F01VL+dcFb8qlMJa4N
 HQG5wkYNhxc6P7wjjopW5u+yng==
X-Google-Smtp-Source: ABdhPJxx0DDJJ0AnQzTQ43Lz2DOk29St+O+m6mlhoMQ9HbtzB7pniXZbCoKi7ReiAB+GuqaDsj2wDg==
X-Received: by 2002:a50:d948:: with SMTP id u8mr2854975edj.306.1634069988214; 
 Tue, 12 Oct 2021 13:19:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u2sm6412285eda.32.2021.10.12.13.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 13:19:47 -0700 (PDT)
Message-ID: <90108cb8-f2fb-7784-69a0-76bce4063b24@mind.be>
Date: Tue, 12 Oct 2021 22:19:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211003203523.1726540-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211003203523.1726540-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-multidict: bump to
 version 5.2.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/10/2021 22:35, James Hilliard wrote:
> License hash changed due to removal of full text copy:
> https://github.com/aio-libs/multidict/commit/5ea0e62dd848b147251dbdc6bbe4a10644cb2d88
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-multidict/python-multidict.hash | 6 +++---
>   package/python-multidict/python-multidict.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
> index 65af9a58e5..2d9943fc0d 100644
> --- a/package/python-multidict/python-multidict.hash
> +++ b/package/python-multidict/python-multidict.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/multidict/json
> -md5  df8b37f069809779214d6b80b250e45b  multidict-5.1.0.tar.gz
> -sha256  25b4e5f22d3a37ddf3effc0710ba692cfc792c2b9edfb9c05aefe823256e84d5  multidict-5.1.0.tar.gz
> +md5  e28b9592289597b232f09e5cc3857f32  multidict-5.2.0.tar.gz
> +sha256  0dd1c93edb444b33ba2274b66f63def8a327d607c6c790772f448a53b6ea59ce  multidict-5.2.0.tar.gz
>   # Locally computed sha256 checksums
> -sha256  a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
> +sha256  06a240ea10ba868fda2de58df859886961df873aa74bbab1e0f13eaf99f92b7b  LICENSE
> diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
> index edf9656043..2619cad2ee 100644
> --- a/package/python-multidict/python-multidict.mk
> +++ b/package/python-multidict/python-multidict.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_MULTIDICT_VERSION = 5.1.0
> +PYTHON_MULTIDICT_VERSION = 5.2.0
>   PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
> -PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/1c/74/e8b46156f37ca56d10d895d4e8595aa2b344cff3c1fb3629ec97a8656ccb
> +PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/8e/7c/e12a69795b7b7d5071614af2c691c97fbf16a2a513c66ec52dd7d0a115bb
>   PYTHON_MULTIDICT_SETUP_TYPE = setuptools
>   PYTHON_MULTIDICT_LICENSE = Apache-2.0
>   PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
