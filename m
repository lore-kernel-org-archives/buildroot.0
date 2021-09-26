Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB8FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:04:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B593960EB4
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B593960EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89BDE4035E;
	Sun, 26 Sep 2021 20:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IlLE59eHcpE4; Sun, 26 Sep 2021 20:04:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2DD14027A;
	Sun, 26 Sep 2021 20:04:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8DD0E1BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 20:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78C094027A
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 20:04:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fvJ1wSp6Jkcq for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 20:04:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09DE440241
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 20:04:39 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b26so11690257edt.0
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 13:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=niDSHf0xO0DOyJHJz8bKmJemj3vaJF+ptwCq9trH5nY=;
 b=Ni2xrfmiFxZm+W+1L+GeXggEr4/wYA6Sdv0/AeN41Je6oUM9MMZfbySTNEjJaWnSZV
 fLFhbHusw3Qc8l9NEir+I0WM2YjgWCW3t3Z9EaKOWzeSFSKh/ADVnoFmkCGoGgbY+X4g
 CZ/ES5JJ9buX6Lf7ibGFY5Yxhw6SxvO3nWFB/94YrGFccKVr6bEV5uGcpa66VA7RswdJ
 2zYRdN+Tv33oiM5YaUKiK7Jo07SH09TR2nf63KB5nD/oh/a7yfa5RayjT5xgFy/wTR6a
 HVeAYioKVka8CTYKBPw3qShsw9sUpAq5/Uyrlp0yw28JLIt2TH5gKFKX25A6Lo+68KKI
 jjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=niDSHf0xO0DOyJHJz8bKmJemj3vaJF+ptwCq9trH5nY=;
 b=D+BFHzsZt0E+Y083tAb4TTT7b/+63BUNvM5ST1TCgdBWsthQCaqDxOIZDRFl7OAHbm
 tQ646Y044VO37ugePcRa94zF2uBgL8X2gyGnZagHq6K2+II5Zc1mR3h3OKj6V3QL3Qxv
 39Q1yY1yymQuAfeqoRZH8huCmp/UDvtWEwO6mqChVtR1HDERFXmpjNd88zSoaYXAEjSK
 6/hlJgn/5T0vG5Fhl/pRMCVe0k49WWNhcPc8+yX8BxZmyoy5a2Z19LHBBxvrqquz7ybf
 kMhGp0cmYlPLT2nPkNQLlBb4wl7SoWP/zbSemads1muEhIkjPHE4imFWlPEIKb65uF09
 YZ3w==
X-Gm-Message-State: AOAM530wo97xdB3pSXCFNEi7faKiJCP+foN99dvMltm5iOuh408ybNbY
 EKXoRTQwUMBczIxs7sWxbDguSA==
X-Google-Smtp-Source: ABdhPJwz0aR0Q+0EhPNV53k5owgfxEIaf9aL0Djtu6fHoiRSl1M8WkYzGMHU3ODi4CfMWATVXd72Mw==
X-Received: by 2002:a50:da8e:: with SMTP id q14mr19610598edj.273.1632686677300; 
 Sun, 26 Sep 2021 13:04:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u14sm8971756edx.52.2021.09.26.13.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 13:04:36 -0700 (PDT)
Message-ID: <012455a3-4331-f4b8-1dca-741dc4aa8a35@mind.be>
Date: Sun, 26 Sep 2021 22:04:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
References: <20210920061125.221541-1-asafka7@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210920061125.221541-1-asafka7@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to
 version 0.3.2
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



On 20/09/2021 08:11, Asaf Kahlon wrote:
> Plus, add LICENSE_FILES and the corresponding hash.

  Good one!

  All your python package bump from September 20 applied to master, thanks.

  Regards,
  Arnout

> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>   package/python-aioconsole/python-aioconsole.hash | 6 ++++--
>   package/python-aioconsole/python-aioconsole.mk   | 5 +++--
>   2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
> index dea2216fcf..45139a6606 100644
> --- a/package/python-aioconsole/python-aioconsole.hash
> +++ b/package/python-aioconsole/python-aioconsole.hash
> @@ -1,3 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/aioconsole/json
> -md5  66d4b05e3bc75267daf0f773d839f62b  aioconsole-0.3.1.tar.gz
> -sha256  7c038bb40b7690bf5be6b17154830b7bff25e7be1c02d8420a346c3efbd5d8e5  aioconsole-0.3.1.tar.gz
> +md5  b8cbcb6e00d8e535256526dfe4f27db3  aioconsole-0.3.2.tar.gz
> +sha256  9355b36d41d5fbdd3dbb01510deb2b985b508b2ebcd5b8bd85af61a707e2f6c8  aioconsole-0.3.2.tar.gz
> +# Locally computed sha256 checksums
> +sha256  fe3eea6c599e23a00c08c5f5cb2320c30adc8f8687db5fcec9b79a662c53ff6b  LICENSE
> diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
> index b32d2bea0f..75ea3c2a2a 100644
> --- a/package/python-aioconsole/python-aioconsole.mk
> +++ b/package/python-aioconsole/python-aioconsole.mk
> @@ -4,10 +4,11 @@
>   #
>   ################################################################################
>   
> -PYTHON_AIOCONSOLE_VERSION = 0.3.1
> +PYTHON_AIOCONSOLE_VERSION = 0.3.2
>   PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
> -PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/5a/12/fce04ddc0a8ebd6482e5ec293d8bda47c9e05c82826b061f7b73523b8601
> +PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/7a/b2/747ab3cb965596cd84c5159941613d901d8771acad3c51c4f5da362aa9f0
>   PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
>   PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
> +PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
>   
>   $(eval $(python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
