Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555F4C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 22:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14D31811AA;
	Wed, 27 Mar 2024 22:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7A8ZO4GP3B5; Wed, 27 Mar 2024 22:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33C1F820B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33C1F820B2;
	Wed, 27 Mar 2024 22:01:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9EAF71BF300
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98A4D60BD4
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qItUhY-WPJH for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 22:01:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8CB6360BD7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CB6360BD7
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CB6360BD7
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 22:01:06 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-415446af364so81415e9.0
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 15:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711576864; x=1712181664;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IoGkAcsV825RbecKV1736jr/AF4ML/+eDMPkBq8jepk=;
 b=bVeob4Rr5NiCnF99xDckLnq+/JddUZDReNwjpfDIB8t8YlommTFIJJutKOe0wLAALb
 Aix7L4iheYrRhgt1NxJ1LbtyY/enXf8BEnImEPUERzN5uKwUZCpoZEs0sscvgoBtDCqp
 VMElGzI63xOV3fCeEwpiMfTcZ4UEOi1y1wbq0X4TlN2FPWIYY0PYgE3x0+z9hp24DYYX
 wOVxGOohsqcc1upoIgjnVHIvjfQ2eFj4E0jE3ejfhlYxZqoCqZ3xubikoBppBD+0ig0E
 E0WXgNPQaohXxp/NqvD97xwvuhmGNS/pECyrVwugfZGYOJ53kzrRj4oitEHZMr5/6a69
 sTTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDwmVJG0+V+aw2SMgU21LEG2d1LbFJ+wgurXBr6dhnjVtMovjz0M5jHpckHONu4GA8R0kElVwhDzA18ci3KYvucZFU3N0CQQ==
X-Gm-Message-State: AOJu0YwuYrBCNDEhXgjLl/k299J0fHJUTyY4TJO/K/tNw0jL7PQCZHlC
 mCXF+4s9tPiIU9mmY8KwayXfBOAuCw532bDYwXzhgMGcgdvQOZ2w0K3w79wbaMrKK/rvaxF5RdL
 f
X-Google-Smtp-Source: AGHT+IEcvTNatAKTwnu0Tf06Gd06Ujj9XZAfQcHbCI1OdslaWvYd3jqkrj6dz8iluEI86RNwEpNwFQ==
X-Received: by 2002:a5d:6905:0:b0:33e:ce08:79b5 with SMTP id
 t5-20020a5d6905000000b0033ece0879b5mr349527wru.9.1711576864447; 
 Wed, 27 Mar 2024 15:01:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 dn13-20020a0560000c0d00b00341b7d5054bsm75710wrb.72.2024.03.27.15.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 15:01:04 -0700 (PDT)
Message-ID: <a6ae99b9-c377-425f-9699-b87dc9355784@mind.be>
Date: Wed, 27 Mar 2024 23:01:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
 <20240213211512.3918044-8-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240213211512.3918044-8-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711576864; x=1712181664; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IoGkAcsV825RbecKV1736jr/AF4ML/+eDMPkBq8jepk=;
 b=CIgKqysRjDvRVC9ETpojV9P8HKt5etAf15YHubCgRmDNLlYAADYXjqJJVuiQHlElHI
 RPIZVQyOR+n5tyVjd0G5fNj/hfYmbf68qAVUDRWSYpjioYc5jJkL6BBmTNu7+WBNvSUv
 Yt4etRq5k0CesehK3fJU6h1i5388pFl2kvKvK2MkX2EfI1xlx2EasUVFyh4ennYsy/tq
 v1xFXEWHMzNgFS9PI5WhQqM9XD4B70YVMJxKNeunjL2amuS5BAo9UAm1mON/aI1vRvnX
 mTW9UjHyvGm5SzuXzT/PckK9m7yZtZ0WAGwrKbS2XrDkD3YobeNg6+ODq0Ly9JxTNyju
 s8zA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CIgKqysR
Subject: Re: [Buildroot] [PATCH v8 08/26] package/python-bleak: use correct
 pep517 build backend
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Louis Aussedat <aussedat.louis@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2024 22:14, James Hilliard wrote:
> We need to migrate python-bleak to the pep517 poetry-core backend
> as setuptools is not supported when building with a pep517 frontend.
> 
> This package currently builds using setuptools as we do not yet
> use setuptools with a pep517 build frontend. The package contains
> a setuptools fallback which only can be used when using setuptools
> without a pep517 frontend as the pep517 frontend will only use the
> build backend specified in the package pyproject.toml which is
> poetry-core and not setuptools.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-bleak/python-bleak.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
> index ed3c3f2f93..716b6327ed 100644
> --- a/package/python-bleak/python-bleak.mk
> +++ b/package/python-bleak/python-bleak.mk
> @@ -7,8 +7,9 @@
>   PYTHON_BLEAK_VERSION = 0.21.1
>   PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
>   PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/6a/c0/3aca655fa43b8ff5340d99fac4e67061f53f42f092fc847bdd0559d67846
> -PYTHON_BLEAK_SETUP_TYPE = setuptools
> +PYTHON_BLEAK_SETUP_TYPE = pep517
>   PYTHON_BLEAK_LICENSE = MIT
>   PYTHON_BLEAK_LICENSE_FILES = LICENSE
> +PYTHON_BLEAK_DEPENDENCIES = host-python-poetry-core
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
