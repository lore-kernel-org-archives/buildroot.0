Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AFDC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:36:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC2CB60F90
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC2CB60F90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88C6D4011F;
	Tue, 26 Oct 2021 19:36:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aylVbe-tWMXu; Tue, 26 Oct 2021 19:36:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A870140130;
	Tue, 26 Oct 2021 19:36:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16C051BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 061BC81764
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MHWI28QcQXNg for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:36:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F399181036
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:36:17 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id u13so811430edy.10
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xMdxMDfNy5kSC7qlSMBEVT0GBXhB5mBMnlb7JX/fZK0=;
 b=T+pT16Z6uAA0ft3Hdc6cLLBTFDn3il9unAOAy0GdzXY26v88p7zNOtmQYqMnFZTJ+V
 fDVaPQEAUgc7PC3V7CtB78TtsTB239KxFXqznAECPHcwXVxjg1NHlKLuAOsKVI/6jLoE
 say/sHh9Bn6m3Dh2GiHutJZfrEAj8tIovRs9ZP6N46ZVMuAW4xTZZ+7j6P7BpjBF+ljw
 mYNWDVq+/CH60APqC5tZSsSgoLaOi3dX4+MqJsoDZZSdQN+LLjQagHU/NShByUJiBrxE
 X/Rsib6OnbJX1vnWVC95iBrPbhzyNVDgeZf4cMrQ+WdV6i2JKA7bNUtseO8o0eppQQF+
 gYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xMdxMDfNy5kSC7qlSMBEVT0GBXhB5mBMnlb7JX/fZK0=;
 b=eVRl1FjO4CGeMQpKxW0drDyLwM/nIzmhCUEo3V8ZeCELLN0aLvMW4+kLx7r8dWnMvb
 fxxLuF/KRP3j7hWBmCz7MVRsnk1UTSI6HGgAY3nyubNVVkgAEen3qzTJ3CI9UGHzJmgA
 AHvwKL4WFCP1+tT/sLipmlRKVnMPjD7jMPYPMX8RC/N0eU9HYSGm+XP5zBH4JkyWF551
 MBvQ9tgG3i9YuOkVvo2y03F329RuiUh26BpHFIT9fJ/t/mwccocRy4sYo0kSg+W3KMri
 0Wdcb/PdwgahmFE7xPJYTfLJAO19MQsoTeBJkrer9vWPez9Pb7tfISWrbv7gvUchSFdU
 uJ1A==
X-Gm-Message-State: AOAM531adR74Ht7XxTIo5FoTT6zhfJjV6DEX3eHUlBjUKM19o1TlWd0p
 VwNiyGDFZCmzVqtC56BxNGSJaQ==
X-Google-Smtp-Source: ABdhPJzLGfQagH09Tskbj4LAvmp/nFvwf7ttku9RL9zTb3csaJWy/rc9M+R0lm3AhbOYYkCgsHweug==
X-Received: by 2002:a50:becf:: with SMTP id e15mr39761723edk.114.1635276976266; 
 Tue, 26 Oct 2021 12:36:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id jg36sm4074452ejc.30.2021.10.26.12.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 12:36:15 -0700 (PDT)
Message-ID: <4a3c73da-de00-b3d4-093f-3bee189f77d1@mind.be>
Date: Tue, 26 Oct 2021 21:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211024235523.2141274-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211024235523.2141274-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pycares: bump to version
 4.1.2
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



On 25/10/2021 01:55, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pycares/python-pycares.hash | 4 ++--
>   package/python-pycares/python-pycares.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
> index 7f749938a1..85e0848b96 100644
> --- a/package/python-pycares/python-pycares.hash
> +++ b/package/python-pycares/python-pycares.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pycares/json
> -md5  5908c5762f08d07310f081aa2d8397a2  pycares-4.0.0.tar.gz
> -sha256  d0154fc5753b088758fbec9bc137e1b24bb84fc0c6a09725c8bac25a342311cd  pycares-4.0.0.tar.gz
> +md5  9e66aa767a0afd681e2a797b835cad1d  pycares-4.1.2.tar.gz
> +sha256  03490be0e7b51a0c8073f877bec347eff31003f64f57d9518d419d9369452837  pycares-4.1.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
> diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
> index b0abb1a41a..9be295d900 100644
> --- a/package/python-pycares/python-pycares.mk
> +++ b/package/python-pycares/python-pycares.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYCARES_VERSION = 4.0.0
> +PYTHON_PYCARES_VERSION = 4.1.2
>   PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
> -PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/25/5a/ed8cc3340b7e83a5e572b5d27387a968a7e52b1e3c269442076ca902b7ba
> +PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/83/61/17bd0cfb9c4dc8c3738484d604b50d47c78fe4fcfe0ca2c58a61a106f578
>   PYTHON_PYCARES_SETUP_TYPE = setuptools
>   PYTHON_PYCARES_LICENSE = MIT
>   PYTHON_PYCARES_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
