Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8876C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 22:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89A20811AA;
	Wed, 27 Mar 2024 22:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kEQfcM8oFkUx; Wed, 27 Mar 2024 22:00:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DE2B820B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DE2B820B4;
	Wed, 27 Mar 2024 22:00:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 328191BF300
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FE8B820B4
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JoW-KL4THiOH for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 22:00:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C872F811AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C872F811AA
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C872F811AA
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 22:00:39 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-341b9f6fb2eso163347f8f.2
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 15:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711576837; x=1712181637;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yx3Rhe0gJMbGwx++LYoT4+Wex2o5+IZgXPbX7X6sQsQ=;
 b=Lh9XHPMI9IuG/BXfM2YQWkbtDD6AzAKBqqfnRQjpFOHbh4WsijHDCWsbqeZ+JOrS+v
 8ovbPBmHpdBfIIlDtseiFIJtoMsH5pRyM0kH8vrf6U4BZ3Uo6k04n+egdwYfWg7h3wFd
 av/zNO/740w3cu/uSGbMF+6MwNuNkUamnuYu0fLq4bS6R59JppDgd7E+zyiORxmBc8Hc
 1sVzR/vu2OYMqOZgqY4Isf2yDY0uh6OdINxm0yG13k8kP5P/eytcYTC0og6ZOxkt77iO
 HO2uGiPOHmkfnthsXyCLwyWXjLDWgw/gY55bJh5ypjJYSaWHGHgQuURAi4+Sf0z7XCO9
 8LIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGzBgHXFoKTwQbFcywHD7NkZjNOR+T9O7na/wcfDjhwCL/ypfMDn+1FUogn9HyhXs4YQo1/bj938EluBxrGQcymzltR2ynQg==
X-Gm-Message-State: AOJu0YzXBLaBz0VW6Nyn2g2iI3MBiCqkjPS9MgBBJGB6FKeQJl9tRH7z
 ADF4hUxDQs7V11IelMENg0jDedUKex/N+DDJy6Q+tHInwWBuhjJB/r8RVnyi0SE=
X-Google-Smtp-Source: AGHT+IF5VqieI4LxYTIREKssbtOjUSx//hHrHmOruaYxltrfku+e/AUVZ39AOxV699Rhz4ldIcqAew==
X-Received: by 2002:a05:6000:188a:b0:33e:7650:1297 with SMTP id
 a10-20020a056000188a00b0033e76501297mr1094202wri.6.1711576837417; 
 Wed, 27 Mar 2024 15:00:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0a5500b004140c161e8dsm3360267wmq.43.2024.03.27.15.00.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 15:00:37 -0700 (PDT)
Message-ID: <49b107c7-2b01-4570-a3c1-0bf0e23c7a5d@mind.be>
Date: Wed, 27 Mar 2024 23:00:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
 <20240213211512.3918044-6-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240213211512.3918044-6-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711576837; x=1712181637; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yx3Rhe0gJMbGwx++LYoT4+Wex2o5+IZgXPbX7X6sQsQ=;
 b=QrMZFiscx9GAB8m6QGqL6YkQARXpiCMD9ed47ZHzOQSVLC0/eZYByPRpo78OCWUwUe
 phtomUJs8nl5D7M8yPJx6bHSP/X8rKt3RjJ7ae2nADtHuzS46f2L6AaZJWtTYdjV2zcv
 /LvSFepIeA5qZZDUQHhG5pyWpWMFNyhE9bFo3eMYcgRtCk9DLzKhQ/R4xrMYZxI//DjI
 iZAJBZZvZyxgwajGjNF5LW6RtBfuJBqK82d898mglYL3x4gCHkDkAjvXmPyRytoYTPvM
 RgkYn26NktG+28/4kxsNoAhaSsOqaeTi4+5DTLQqgU6OSqIVEmpvecOwZusd7ck3qb69
 2gpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QrMZFisc
Subject: Re: [Buildroot] [PATCH v8 06/26] package/python-aiofiles: migrate
 to hatching pep517 build backend
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
> When building with a pep517 frontend we need to use the specified
> build backend as opposed to the fallback setuptools build which
> only works when not building with a pep517 frontend.
> 
> Fixes:
> ERROR Backend 'hatchling.build' is not available.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aiofiles/python-aiofiles.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-aiofiles/python-aiofiles.mk b/package/python-aiofiles/python-aiofiles.mk
> index 582f7908cd..954647bf76 100644
> --- a/package/python-aiofiles/python-aiofiles.mk
> +++ b/package/python-aiofiles/python-aiofiles.mk
> @@ -7,8 +7,9 @@
>   PYTHON_AIOFILES_VERSION = 23.2.1
>   PYTHON_AIOFILES_SOURCE = aiofiles-$(PYTHON_AIOFILES_VERSION).tar.gz
>   PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/af/41/cfed10bc64d774f497a86e5ede9248e1d062db675504b41c320954d99641
> -PYTHON_AIOFILES_SETUP_TYPE = setuptools
> +PYTHON_AIOFILES_SETUP_TYPE = pep517
>   PYTHON_AIOFILES_LICENSE = Apache-2.0
>   PYTHON_AIOFILES_LICENSE_FILES = LICENSE
> +PYTHON_AIOFILES_DEPENDENCIES = host-python-hatchling
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
