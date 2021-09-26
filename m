Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9E6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:48:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46FAF60F94
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46FAF60F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22E2E80C93;
	Sun, 26 Sep 2021 19:48:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8xxC_jx7dF5l; Sun, 26 Sep 2021 19:48:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BF3081A30;
	Sun, 26 Sep 2021 19:48:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52E181BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4318D60712
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8re_xpt4oKFr for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:48:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6237A605A2
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:48:38 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id b26so11577510edt.0
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 12:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=G+7IY0NJLAi/Y+s6BGFC4mii0F0dgFryk+7xt5kPb/o=;
 b=LJFCYe+VjYbeSlvyjzQoCKLLSRu85CmDDgke/OarWF8Dt8m71i1ZX7SaC8jS5octqX
 TI2NzHHxhdiMe/h+vOsga1wDbU310P/AZKWX5qV5rOvI9NU7H03MKS8zzREW7nkWH7YI
 0B9Lb/z+/UgiMgVk5kTXT0daE2Uiosx6KkJKt/zCVTCPcXni3vEz1XbAaKMjMVgB7+Fj
 QfF6LHINsxSKMjWr8SEBTuQVgS9biWQdc6MF7yi1J3rnFaJcLZOV88XFWDGq/8YFrFaO
 UVvN892c5bYUEhMSxEZVhP666YDhm4G8ZUJk75eqTy4vqk+mMPPr5zsQU4OAxQ+ZJZsM
 bl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=G+7IY0NJLAi/Y+s6BGFC4mii0F0dgFryk+7xt5kPb/o=;
 b=aSpA8jAdQGeIgzLVcI1Bzaw4nTN+wrJz0vCqK+lKJUke6OHT56kssnpf6wn925JehE
 xuBttdahGttScdLVZuGqKjB/ShgrJQfHX7ae0L5nCKm6DtgXD9YgoTRKBGyMmiRg02B8
 L/1fhjP0iWPy4cXzDb3qa5xMlGTAI1KJPyxuAdXLIcNcgRJfdnfAXHy9VIQG4aQB8zem
 1mIJmj2RIiMB8MbchAoirpgnMgp/RW2qCEm/kuzviqCENMPpJSM84nrIo9FpOqAU8un/
 Ivw2vd/FxFHYasnkWjoL2ICMQA6u3cNozFEr4tDunExDYCCKeiNJRu6fckLZTFQ2XjZl
 Antw==
X-Gm-Message-State: AOAM532Kn5ln6ZQcpolOp06kiJAfPI1yju4+cnzFwXlYqKW8uz1yAr4+
 I9XReVf2ljHtGto7FZ4gW3ds9g==
X-Google-Smtp-Source: ABdhPJyCs8QP5fPeleY4p6g145lz2fUJBrcKQR24Uicfx8FR2nscWKqfkaw5opnn+ns5Lixkyki0Ig==
X-Received: by 2002:a17:906:25db:: with SMTP id
 n27mr23549716ejb.108.1632685716594; 
 Sun, 26 Sep 2021 12:48:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l13sm2830889eja.102.2021.09.26.12.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:48:36 -0700 (PDT)
Message-ID: <6275c9e2-7c22-48f0-4397-0cd1e12bb03e@mind.be>
Date: Sun, 26 Sep 2021 21:48:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
References: <20210925094626.365400-1-asafka7@gmail.com>
 <20210925094626.365400-6-asafka7@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210925094626.365400-6-asafka7@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sh: bump to version
 1.14.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/09/2021 11:46, Asaf Kahlon wrote:
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-sh/python-sh.hash | 4 ++--
>   package/python-sh/python-sh.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
> index fffdd20c15..13a0207de9 100644
> --- a/package/python-sh/python-sh.hash
> +++ b/package/python-sh/python-sh.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/sh/json
> -md5  7e3dd3a6b49c06db93746994a68cb8cf  sh-1.13.1.tar.gz
> -sha256  97a3d2205e3c6a842d87ebbc9ae93acae5a352b1bc4609b428d0fd5bb9e286a3  sh-1.13.1.tar.gz
> +md5  33becadcb5214afd00b9eec05fa98c06  sh-1.14.2.tar.gz
> +sha256  9d7bd0334d494b2a4609fe521b2107438cdb21c0e469ffeeb191489883d6fe0d  sh-1.14.2.tar.gz
>   # Locally computed
>   sha256  d8491c6e236568d04f7c8c07f2f1b8f5d142706dab6ab88f6e0d2dd476b6c706  LICENSE.txt
> diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
> index 21c0fb3d77..d2d8b14c8b 100644
> --- a/package/python-sh/python-sh.mk
> +++ b/package/python-sh/python-sh.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SH_VERSION = 1.13.1
> +PYTHON_SH_VERSION = 1.14.2
>   PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
> -PYTHON_SH_SITE = https://files.pythonhosted.org/packages/c9/3b/2c9a22bf1c48ced7ff3a11d4a862682c21d825c35f9d025811ad9808d263
> +PYTHON_SH_SITE = https://files.pythonhosted.org/packages/80/39/ed280d183c322453e276a518605b2435f682342f2c3bcf63228404d36375
>   PYTHON_SH_SETUP_TYPE = setuptools
>   PYTHON_SH_LICENSE = MIT
>   PYTHON_SH_LICENSE_FILES = LICENSE.txt
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
