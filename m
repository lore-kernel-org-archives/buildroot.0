Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D317EC47DD9
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 21:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 798468208F;
	Wed, 27 Mar 2024 21:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3vKXbCWOjXi0; Wed, 27 Mar 2024 21:59:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 819BE8109C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 819BE8109C;
	Wed, 27 Mar 2024 21:59:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 891011BF279
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 21:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75E39415B1
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 21:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGnIRSaY_fPm for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 21:59:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6182E40199
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6182E40199
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6182E40199
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 21:59:18 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41497adae1eso2027625e9.3
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 14:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711576756; x=1712181556;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iJ0VNsUd91U33WVpekHvAA0NTm2Lza9BZ2CMwpJ4rOo=;
 b=S+e+Hq88EnWKmbm1NR7eFNvhAHtpOjRrO9pQTHCBAZmkF/L9N5+xuIpfo+dQrS+0Qr
 Lk3a0Hvp23k+RLIBUUp5q+DV5OvRIBgUiP3zA2OzUiBvQaV2nJxnMVJYHMJ7YxmSyrHo
 hwHNdjvE5NoTsLO3r0+xIkgOhLEQ+UcPWWTWssYHx+bVlQNBznzPNShBwQUVaAV6T/1o
 kfWumjcfaakq50umxZR90nROq33HLU0N3bD/B/oS7j7gAKzIwr8QNKbky9HHeaHmaZDm
 4xpedIniy7ITm5eGEtTqC+oYOxL7XRz8SU4WYeC4xw7ID1jK4BtabynmTZD0c75dGLVH
 oyuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqre6LqA99cAWjNbfIix3Yk84wFAkQQhmRixorLYOWmnBrSnNHT4ltvi34RSQaSuqRAdP1BrouHphQsXh7QMragCLZ1bQtkA==
X-Gm-Message-State: AOJu0YwJUzCMJROeu6p0gwVK1jOUp17IwR3vz/eEMGDTOyf0qoMVewUD
 F/tAxaLiGy4ouNvM3R37XzVxv6snOSSnzBWRCOGLcUEOXxWMKlzcCJYbUu8aLoQ=
X-Google-Smtp-Source: AGHT+IG3DIxTmXnTYcBfy1++5qphYyxxvFdAYsNzSdMe/kwVHQd2PTmvsfzbKT5mdlHdeGBCiRfATg==
X-Received: by 2002:a05:600c:1912:b0:414:b14:5654 with SMTP id
 j18-20020a05600c191200b004140b145654mr1080202wmq.21.1711576756407; 
 Wed, 27 Mar 2024 14:59:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c204300b004148090cf86sm4805838wmg.0.2024.03.27.14.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 14:59:16 -0700 (PDT)
Message-ID: <005cda12-b6ce-4593-a10b-63dcba6e5b9a@mind.be>
Date: Wed, 27 Mar 2024 22:59:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
 <20240213211512.3918044-2-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240213211512.3918044-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711576756; x=1712181556; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iJ0VNsUd91U33WVpekHvAA0NTm2Lza9BZ2CMwpJ4rOo=;
 b=ZBQI4tbiMAjEi2MdQhJ2OMttEpyipg4nVKN1ueX5yOI3BlfvETMUb2oZUafgBOcL6r
 yC+ENDkYpZ+yfRsBn9MhjQ8OusAIDE60RbL9pWfFYxLU4+xm1VKbbFps6pl+hGijhMmr
 eO/zayTBpMvD/YjU4dXMYPh5MBJHVDN6Toh2FuasEJUXRFe3LHrSXV3++LoRoAOYtYhU
 yJ2svi8dviZrI99Ap8M4YktWpvtM3bhVlzofHuREGMC5RTSoBgKVo84QY2u+FgiZyue5
 O6LQG20yh7qZrxEweGZY5rOu6DBndDUwzYohDKkZMeASp69806uX+ghaKiwmGcSXNQK6
 5i3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZBQI4tbi
Subject: Re: [Buildroot] [PATCH v8 02/26] package/python-terminaltables: use
 correct pep517 build backend
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
> We need to migrate python-terminaltables to the pep517 poetry-core
> backend as setuptools is not supported when building with a pep517
> frontend.
> 
> This package currently builds using setuptools as we do not yet
> use setuptools with a pep517 build frontend. The package contains
> a setuptools fallback which only can be used when using setuptools
> without a pep517 frontend as the pep517 frontend will only use the
> build backend specified in the package pyproject.toml which is
> poetry-core and not setuptools.
> 
> Upstream has merged a patch replacing poetry with poetry-core, however
> we can not backport this using a patch file due to CRLF line ending
> issues so we will have to apply the change in the patch using sed
> instead.

  I was able to do it with a patch. I guess the problem was with git send-email, 
or maybe with patchwork.

  Applied to master with that changed, thanks.

  Regards,
  Arnout

> 
> See upstream commit:
> https://github.com/matthewdeanmartin/terminaltables/commit/9e3dda0efb54fee6934c744a13a7336d24c6e9e9
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>    - add more details regarding pep517 frontend compatibility
> ---
>   package/python-terminaltables/python-terminaltables.mk | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-terminaltables/python-terminaltables.mk b/package/python-terminaltables/python-terminaltables.mk
> index b31ed332b6..385c71ae2d 100644
> --- a/package/python-terminaltables/python-terminaltables.mk
> +++ b/package/python-terminaltables/python-terminaltables.mk
> @@ -7,8 +7,16 @@
>   PYTHON_TERMINALTABLES_VERSION = 3.1.10
>   PYTHON_TERMINALTABLES_SOURCE = terminaltables-$(PYTHON_TERMINALTABLES_VERSION).tar.gz
>   PYTHON_TERMINALTABLES_SITE = https://files.pythonhosted.org/packages/f5/fc/0b73d782f5ab7feba8d007573a3773c58255f223c5940a7b7085f02153c3
> -PYTHON_TERMINALTABLES_SETUP_TYPE = setuptools
> +PYTHON_TERMINALTABLES_SETUP_TYPE = pep517
>   PYTHON_TERMINALTABLES_LICENSE = MIT
>   PYTHON_TERMINALTABLES_LICENSE_FILES = LICENSE
> +PYTHON_TERMINALTABLES_DEPENDENCIES = host-python-poetry-core
> +
> +# we can't use a normal patch file due to different line endings
> +define PYTHON_TERMINALTABLES_USE_POETRY_CORE
> +	$(SED) 's/requires = \["poetry>=0.12"\]/requires = \["poetry-core>=1.0.0"\]/' $(@D)/pyproject.toml
> +	$(SED) 's/build-backend = "poetry.masonry.api"/build-backend = "poetry.core.masonry.api"/' $(@D)/pyproject.toml
> +endef
> +PYTHON_TERMINALTABLES_POST_PATCH_HOOKS += PYTHON_TERMINALTABLES_USE_POETRY_CORE
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
