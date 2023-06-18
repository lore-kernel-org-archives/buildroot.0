Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B451EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D765560FB1;
	Sun, 18 Jun 2023 13:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D765560FB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hGTy-0bDQMYc; Sun, 18 Jun 2023 13:12:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A8606070A;
	Sun, 18 Jun 2023 13:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A8606070A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 65FD71BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AE254149F
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AE254149F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vTKPk6TAaV6V for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:12:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04BAC41299
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04BAC41299
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:12:47 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-519f6e1a16cso2943077a12.2
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687093966; x=1689685966;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ViQ7FuWpuOa1oaztY3Cjdck5eC40eufR5sBBCnJYy04=;
 b=D+BWcqQz/7V8MlA9fQJcHiC7TuyBgQ6xF/okIMCHfvHfxUgib8//+qb7VToD+ArtEC
 UTNjcduAYyy7/B8VnyS8ZcGwsO0j3BeRNdmyej1AKnfR6oOk4zy8Hy2Cx3XiE5weyTbv
 1AUALbSzQljpqMTJfDbY4+67IzjTrQrMvGMCfdG4JcwP0jtyzKhvk4f7zo+RpzRx4RM8
 ch8nZ1Cj6uz9hpvMngMA/iDM54AIChLbzEn5pGoe+d0780hdKL6PCQCULE/kJE3j9eXh
 KG8o4EOY7cw86ML4k621B0+xgLiXshh9CK3KGQPrccE2NaMtfBrwmPDtG6iZ67CWOfH7
 xq9w==
X-Gm-Message-State: AC+VfDypUvD7TxJlmMW7LTVFE8gdsMjWWK9C5O1dfZ7OetiYP+mkJuax
 9johbeHVvkEFdSbEcioiGWjSMg==
X-Google-Smtp-Source: ACHHUZ7BTbWgziVux1gN7wVBZugzC+9MFMEQtw8QLHgs3RdpP4mWDq2Ua7Qr9eML6Fl4eT+p/XoGGA==
X-Received: by 2002:a05:6402:1604:b0:514:8fdb:855e with SMTP id
 f4-20020a056402160400b005148fdb855emr4638373edv.22.1687093966147; 
 Sun, 18 Jun 2023 06:12:46 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a05640212d100b0051a4049b96csm2257279edx.76.2023.06.18.06.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:12:45 -0700 (PDT)
Message-ID: <4f1819f9-ecef-2c51-1c8b-62644a94ef97@mind.be>
Date: Sun, 18 Jun 2023 15:12:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605074123.1895333-1-james.hilliard1@gmail.com>
In-Reply-To: <20230605074123.1895333-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687093966; x=1689685966;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ViQ7FuWpuOa1oaztY3Cjdck5eC40eufR5sBBCnJYy04=;
 b=DgqgdhVG+4ootsqlj0nKiHN5GSYdoi6ClHRPvuiklyVikmujgVRL/IYtMWSC4JfO1r
 D1JB8Ul2+1fe7+hgW4E9JFRleuMtEq8AzI5eIDI8hJEC4F5NX8Z5wvtYKn9O0XcATPur
 ViFQrIl5FrR9Q24hgaw5nfEGX6h77bQgxwHpOZC/vRiIRjeHGuuX5qorhTnapC3yt/tL
 4qNN2fKu7akuS3AFtHEu5WMvC+HiDaUi53W3lCVhOGPYqH37OSnc2R9SdmHA+qbgYYb9
 OWhoNzic+uD8X5/uXq+AwutVjtq3/s36jQgLiiHHgiR0UpRCeOkagIroD/cR8R+Rujhq
 uo4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DgqgdhVG
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pygments: bump to
 version 2.15.1
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2023 09:41, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pygments/python-pygments.hash | 4 ++--
>   package/python-pygments/python-pygments.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
> index f7396cb3d6..9714fd2ea0 100644
> --- a/package/python-pygments/python-pygments.hash
> +++ b/package/python-pygments/python-pygments.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pygments/json
> -md5  447be4afb076c8325a7dc659aff5b931  Pygments-2.14.0.tar.gz
> -sha256  b3ed06a9e8ac9a9aae5a6f5dbe78a8a58655d17b43b93c078f094ddc476ae297  Pygments-2.14.0.tar.gz
> +md5  e40631bb812bbd15954027c23b23013a  Pygments-2.15.1.tar.gz
> +sha256  8ace4d3c1dd481894b2005f560ead0f9f19ee64fe983366be1a21e171d12775c  Pygments-2.15.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  a9d66f1d526df02e29dce73436d34e56e8632f46c275bbdffc70569e882f9f17  LICENSE
> diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
> index 9c4f0be6c8..f151f0061b 100644
> --- a/package/python-pygments/python-pygments.mk
> +++ b/package/python-pygments/python-pygments.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYGMENTS_VERSION = 2.14.0
> +PYTHON_PYGMENTS_VERSION = 2.15.1
>   PYTHON_PYGMENTS_SOURCE = Pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
> -PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/da/6a/c427c06913204e24de28de5300d3f0e809933f376e0b7df95194b2bb3f71
> +PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/89/6b/2114e54b290824197006e41be3f9bbe1a26e9c39d1f5fa20a6d62945a0b3
>   PYTHON_PYGMENTS_LICENSE = BSD-2-Clause
>   PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
>   PYTHON_PYGMENTS_CPE_ID_VENDOR = pygments
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
