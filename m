Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57874C433FE
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 21:15:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC17F61151
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 21:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC17F61151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72878400FA;
	Fri, 15 Oct 2021 21:15:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pqRfxE7asXuK; Fri, 15 Oct 2021 21:15:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CE8D40107;
	Fri, 15 Oct 2021 21:15:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F1E981BF417
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 21:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEA4B60EF6
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 21:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6f-8TBElw_K for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 21:15:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D494A60661
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 21:15:53 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id d3so42735713edp.3
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 14:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LN+rwDEvFVN2sN97ap1xJeXzSgUWQCbHvyx0+aa3ZIw=;
 b=bxQyKKioNF3XBQM41b7eNPdvK5Y9w0clFM//PsS2aJsuHfzWniWF90UFHCIbF7FN7C
 70d+KO/8ejdfUKtqW5UXdfCzVlJVsK5BapdczJtqPkYxWnRQjK0g/rjuQa1ZkKJcDIrw
 BAXVmg0ovkefh1cw/GPWJXz809Cs8IXsJSOmfwBqZQMoMlzAcF8b7m+DI815aSMskEUG
 McmsEHx/ibJAUOpMhTkFXGRCxQpSGhMfSMx+ggGxzxozelwA3G0xyXMR8yfMwBQ3kOFL
 mHHFI+MF5KsqH1bVDWL0Pi32OdxvUZ8MzT/tAtgnlUAIJSJy/HRAh0W8Sx4V4h8pINLc
 9+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LN+rwDEvFVN2sN97ap1xJeXzSgUWQCbHvyx0+aa3ZIw=;
 b=yTqkZbvPPE/7ytaL0AEmXWZDL6Cf0jeTYkAZ5wGbIygauKbvnB+4xtgNCFs06GptwZ
 RnqDgV/uoq5fKgVoHRMZANwaGLYhhDSgANVe1mMKE/R5UOQpBF0joYqKMrPPhhw1W+tq
 a+kGGRKODll8BY0tXy/OWWbGVDMOpL1QWLEs95ekbb6eVAhlAzOZCgYHKgQLMPRv75hb
 5efI4hU2yPAt0NVVAiO60REjf1fOsSN2cySNOpeopBVFC2vxYE+fR3gbbpEOcq2Amy67
 nodGKHU9UBCQdAbCokEFveDa+CjgLzl1Es2aAM2ewoS+P88QJ9oBvVuanbWxAI0QXWr+
 fozw==
X-Gm-Message-State: AOAM532+QUGQvTVqs4hQHr7U7dRi0cCnYrmf/xKMVVUSmxR0YWKfVb5h
 LdPnpex/Npd1GY0TWj1mzYiyP9T+6Bc70juT
X-Google-Smtp-Source: ABdhPJxCk+ouZtYyN0yIhc8QNs6Jxl1tYHXQlsQu/dvsmzHFbTw3cW/F+54YU6sup5UVBy4SQJTTbw==
X-Received: by 2002:a17:906:3956:: with SMTP id
 g22mr9856521eje.572.1634332551855; 
 Fri, 15 Oct 2021 14:15:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v23sm4867895ejf.68.2021.10.15.14.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 14:15:51 -0700 (PDT)
Message-ID: <b78d2eca-efa7-9f34-cdbe-dd27cc001fdb@mind.be>
Date: Fri, 15 Oct 2021 23:15:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Grzegorz Blach <grzegorz@blach.pl>, buildroot@buildroot.org
References: <20211011110913.406680-1-grzegorz@blach.pl>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211011110913.406680-1-grzegorz@blach.pl>
Subject: Re: [Buildroot] [PATCH] package/python-pyjwt: bump to version 2.2.0
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



On 11/10/2021 13:09, Grzegorz Blach wrote:
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pyjwt/python-pyjwt.hash | 4 ++--
>   package/python-pyjwt/python-pyjwt.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
> index f3bc5d4814..6bfbe05bf9 100644
> --- a/package/python-pyjwt/python-pyjwt.hash
> +++ b/package/python-pyjwt/python-pyjwt.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/PyJWT/json
> -md5  34c235e02746683bfc81a61f9ec4dc85  PyJWT-2.1.0.tar.gz
> -sha256  fba44e7898bbca160a2b2b501f492824fc8382485d3a6f11ba5d0c1937ce6130  PyJWT-2.1.0.tar.gz
> +md5  c7c5b05a1dcee1fac0dc13fea892ed86  PyJWT-2.2.0.tar.gz
> +sha256  a0b9a3b4e5ca5517cac9f1a6e9cd30bf1aa80be74fcdf4e28eded582ecfcfbae  PyJWT-2.2.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  ec82af815b5f9da8685afb300cc5beb7949e1c22b79b6c1c054796cefdf6cac6  LICENSE
> diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
> index 5600459c65..123f12ef69 100644
> --- a/package/python-pyjwt/python-pyjwt.mk
> +++ b/package/python-pyjwt/python-pyjwt.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYJWT_VERSION = 2.1.0
> +PYTHON_PYJWT_VERSION = 2.2.0
>   PYTHON_PYJWT_SOURCE = PyJWT-$(PYTHON_PYJWT_VERSION).tar.gz
> -PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/0c/c6/3cdc7cb1289b35186fd7fd61836b6d83632ca0f7eee552516777361667b1
> +PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/b9/6d/e5ac4eb80724cb4201de6dcbc1e8a9f5cb65a0424b30c4c69e49bc1363d1
>   PYTHON_PYJWT_SETUP_TYPE = setuptools
>   PYTHON_PYJWT_LICENSE = MIT
>   PYTHON_PYJWT_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
