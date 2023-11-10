Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82192C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 20:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 385B540287;
	Fri, 10 Nov 2023 20:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 385B540287
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7rM5-WQHCCaI; Fri, 10 Nov 2023 20:59:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D17B40260;
	Fri, 10 Nov 2023 20:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D17B40260
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ABC3F1BF2B6
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 20:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 829254055F
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 20:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 829254055F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GsiZkb9hJjsr for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 20:59:51 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F20DD400F2
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 20:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F20DD400F2
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-507973f3b65so3464246e87.3
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 12:59:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699649989; x=1700254789;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JJ0Fe1sImnCFoIa9F3ulcRot4VS9pxAPvVeLzwPhC/Y=;
 b=qMAV6+aP4K/qIw7u1+EbtFqEYw+P1EgWbGudp57CdXUySt5msn5L9BqyDYOSaGPxPE
 ox1GTp3E2BqVqX+I0AeItHFt0II06/Ho4UyQLLJrBRBwFQ7wTWW8sH5/X3uCnNYlOCVM
 tWw0pCsUg/VnQwdhckowi9D3/Ioao94AalGdSZEZsv83fY7mwHZX6qia0rDhAqM4tNvC
 EU/fcgco+mnpj3eztGDna2yWzmQbodrlh/HfECvTxInajYITpqsL22GXYWOFpHKUCiWX
 rZbXotFYhwR3bFJ53XS22+HnZkV27WBGKoVhbOLHgZIkDbhVSyylM9ocjmDkP1vj9nj/
 zYyQ==
X-Gm-Message-State: AOJu0YyRnKmG3pq9SJx+zqNQKyNruM1x0hdLuxrnOJXUKbTyC6BVAF/6
 2YfhEJXuZNr75N69KfA6n5olUA==
X-Google-Smtp-Source: AGHT+IEjpFFnIQY8cmz/ulBf8YfhnW/IMpUDvz5b6bR2GgHgrMCuhxu1vFCCnFRg0N74MMiPo6Junw==
X-Received: by 2002:ac2:4857:0:b0:50a:711d:23f5 with SMTP id
 23-20020ac24857000000b0050a711d23f5mr188090lfy.28.1699649988591; 
 Fri, 10 Nov 2023 12:59:48 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 fi5-20020a170906da0500b009e5db336137sm74719ejb.196.2023.11.10.12.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 12:59:48 -0800 (PST)
Message-ID: <16a066b4-7fe0-4893-b31e-779cf65f4ba5@mind.be>
Date: Fri, 10 Nov 2023 21:59:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231001091943.1772441-1-james.hilliard1@gmail.com>
In-Reply-To: <20231001091943.1772441-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699649989; x=1700254789; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JJ0Fe1sImnCFoIa9F3ulcRot4VS9pxAPvVeLzwPhC/Y=;
 b=Vg/yOvn32FufDF2Fx1KfHgGSntR9pXrOF/UZb0bndUPSxVdEB93sKYh/BGne9mbqWj
 WopjKm9qj3LI8XMSvpaLJTGO+nFg4oNLkLqUZP2bse1DFCzehZ3XNxyKKPOuaddbHdXf
 Nl+OhlBLC24uOD0AlM/68V2qPvWM/3z3BDopqnR2KrvJHj59l3GsrclvuthlY87mlQzV
 wwUb04W0gHVdZuGsRKLv9iKVzgAoGvpKPZhdLiqjK4pYW8RwQbAB1cXtQKZu0O2irAow
 qn+QKt1QOniMeR3EtWBIqF+TQevtcti3i5aa4j92mh8rJ375poNqG4GLhAoUExRAOJwv
 nhOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Vg/yOvn3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyxb: switch from
 distutils to setuptools
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/10/2023 11:19, James Hilliard wrote:
> distutils will be dropped with python 3.12.

  Given that pyxb has been removed now, I marked this patch as superseded.

  If you do still care about pyxb, please submit a revert of Adam's patch and 
resubmit this one as well.

  Regards,
  Arnout

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-pyxb/python-pyxb.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-pyxb/python-pyxb.mk b/package/python-pyxb/python-pyxb.mk
> index 6af10b51e7..8015bc874a 100644
> --- a/package/python-pyxb/python-pyxb.mk
> +++ b/package/python-pyxb/python-pyxb.mk
> @@ -9,6 +9,6 @@ PYTHON_PYXB_SOURCE = PyXB-$(PYTHON_PYXB_VERSION).tar.gz
>   PYTHON_PYXB_SITE = https://pypi.python.org/packages/e3/09/4fdb190ea2b7cb43d6d3e745276ee69f4d6181be70fcbfda7df3c5f72f0e
>   PYTHON_PYXB_LICENSE = Apache-2.0
>   PYTHON_PYXB_LICENSE_FILES = LICENSE
> -PYTHON_PYXB_SETUP_TYPE = distutils
> +PYTHON_PYXB_SETUP_TYPE = setuptools
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
