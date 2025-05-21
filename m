Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCBFC2D0CD
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 13:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D3B261321;
	Wed, 21 May 2025 13:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rM-i9xU1174N; Wed, 21 May 2025 13:13:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0B6760B6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0B6760B6B;
	Wed, 21 May 2025 13:13:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CE1741F3
 for <buildroot@buildroot.org>; Wed, 21 May 2025 13:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB4CF417A3
 for <buildroot@buildroot.org>; Wed, 21 May 2025 13:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bw4L9xUplqPi for <buildroot@buildroot.org>;
 Wed, 21 May 2025 13:13:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B412D409E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B412D409E7
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B412D409E7
 for <buildroot@buildroot.org>; Wed, 21 May 2025 13:13:07 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so48911545e9.1
 for <buildroot@buildroot.org>; Wed, 21 May 2025 06:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747833186; x=1748437986;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UwXynJmLoi9D/IzSzKpzWH2Niwt14mBE5PRg296Vtls=;
 b=RaTdbLXlTrN6Um90FuzM1AnaARAAHB1ZMOiS2L4blJrDLCicZj8bjyCDw8xe7ni/IN
 2muJ0PzIijOA6zx5iA2JXGlV/q44QyGfxkiLdW5ZNVdWvOxagEPD1nPEBBKZwanjfAxq
 dsMGJT2i624AxowA9P0sgcjWXA8P2qx6n3xpYR55SVwhZrxY08lGdLuFr6C34ii9Dq59
 hftsO19lhfBI3yfwS7eqzndtnrlGtewIZgd0z/kepAE7hF59kd4SC2aUapUEjvnZm7z1
 W5J4eXVpxMNz7lUFFY0lPrNlKds4ZUMIdj+Ht87GiY1W1fvqgYV32dod9KgJw46zzy79
 kRhA==
X-Gm-Message-State: AOJu0Yzh/zljElXvw6mJDRHapzUrjRN4FBFJdX6K5V3wXyTu14eXbd8j
 MljBjQDOztUXQEGBeTVYcL1YdrL13GK4tEbEG8YQZsW+ta51ks3Nul77827BANXLn7SO3urbwZa
 HoRyLQek=
X-Gm-Gg: ASbGnctfn/5QI/n6v9xSSpesOYHlOyvkgAZqInBDUZPlYczEaY7Aqejzed2KFwaB15H
 Xu3IRfJlJDyRAP5zpmO7tM677MBo6iVQv4CYYxWhl19B6b1vpjTZkNl8QMxGqtr9bA98/Z3aZm3
 rFqbc1jEf80QVP9dgF3plwHvezArffeXTjI9pdVlwDOqPIr0hPv+yBTv6Cb4c3zohBcEV7bmVSs
 IV2KHXLPp1pfuj+dNRcdNOAybZ4SG9xNAJ5c8QvB+B0awmzCHCeHT+FV4uLuW9yXpmAvoil4JYY
 J4AzUVV2Lk+yyb92mko38TsujeesrPMrL8EN4RsQc/aqkHbbJYiVCkVhr4a4O2blHlRCQ+y6p10
 XJcM0lEGsnLZ4FYQErQzgxWUBP+vbYTmrX2c=
X-Google-Smtp-Source: AGHT+IFuRniqpZxEGiEWzM9GtmBeFxaz3Sxtl621wTv6zwe1ybBSIROgK1946DJPy5KQXmeO686oHw==
X-Received: by 2002:a5d:64ee:0:b0:3a3:55e6:eaaf with SMTP id
 ffacd0b85a97d-3a35c8259a5mr18203124f8f.24.1747833185746; 
 Wed, 21 May 2025 06:13:05 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:639d:e501:5db7:a3a4:443e:4828?
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a361b04236sm18518865f8f.28.2025.05.21.06.13.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 06:13:05 -0700 (PDT)
Message-ID: <17796dd7-9f0d-40ac-8dbb-2a03b6e88f8d@mind.be>
Date: Wed, 21 May 2025 15:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20250514150446.968758-1-thomas.perale@mind.be>
 <20250520143947.h3j5i3nblgu4ielq@n621.de>
Content-Language: en-US
In-Reply-To: <20250520143947.h3j5i3nblgu4ielq@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1747833186; x=1748437986; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UwXynJmLoi9D/IzSzKpzWH2Niwt14mBE5PRg296Vtls=;
 b=F63coTTpd9hp2DuGG+jKL/HGoub0JV2qVGPVFv4m0M7Euu2EGFj4Q+1KT7HN828liR
 q3APtT+Mbu4Rlp4zxa0cL8CUeTHqCjL/rUXacwQngvyphNlx5QLMF6jkryxCoJPCVTiZ
 kJM1cQhv4YQkSCs0flhu/qPDi9HL5DttM1xsvAhnh19oCWydwJ0NF7Kn//IvY/vyR+Sl
 nWtdb4l4QKnS71XqYNw9mogV583M0BKJGbAisDKCcx7wqiXlz9zRzGnN+zRjX50rtC2D
 3yDmQKnI0Hq9EtOGOKQxDaPXNrSWYYsvvEG30LktK13MiTRLxDoUhm0f+7hJ35RoanSy
 ID6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=F63coTTp
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask: security bump to
 version 3.1.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Florian, Thomas and all,

On 20/05/25 16:39, Florian Larysch wrote:
> Hi Thomas,
>
> alas, this release changed more than just fixing that security issue. In
> particular, the changes in [1] are breaking the build of 2025.02.x for
> me:
>
>    * Getting build dependencies for wheel...

--- SNIP ---

>    ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
>    make: *** [package/pkg-generic.mk:273: /home/flarysch/br-test-pkg/bootlin-armv5-uclibc/build/python-flask-3.1.1/.stamp_built] Error 1
>
> This can be reproduced with test-pkg using
>
>    BR2_PACKAGE_PYTHON3=y
>    BR2_PACKAGE_PYTHON_FLASK=y
>
> As I understand it, this is happening because flask moved its
> pyproject.toml to PEP 639 license expressions but flit only introduced
> support for those in [2], which is part of 3.11.0, which wasn't included
> in 2025.02.2/.3, while the flask bump was.
>
> The flit 3.10.1..3.11.0 diff doesn't look to bad, so maybe 2025.02.x
> could pick up the flip bump too?

I agree with you, bumping flit doesn't look that bad. Also, other packages than Flask could have the "good idea" of changing their build requirement in patchlevel version bumps that also include some security fixes. Thus, I think that having flit>=3.11 in 2025.02.x LTS is better in the long run, as it reduces the patch maintenance burden on the Buildroot "staff"

I therefore suggest to apply https://gitlab.com/buildroot.org/buildroot/-/commit/c5659cebb7b54e2522601824a10c47c0ef73a09f on 2025.02.x. To make sure this wouldn't hurt elsewhere, I applied the commit locally, and then I successfully built all target packages that rely on flit, ie:

BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_APISPEC=y
BR2_PACKAGE_PYTHON_WEASYPRINT=y
BR2_PACKAGE_PYTHON_CLICK=y
BR2_PACKAGE_PYTHON_MARSHMALLOW_SQLALCHEMY=y
BR2_PACKAGE_PYTHON_PACKAGING=y
BR2_PACKAGE_PYTHON_MORE_ITERTOOLS=y
BR2_PACKAGE_PYTHON_FLASK=y
BR2_PACKAGE_PYTHON_IDNA=y
BR2_PACKAGE_PYTHON_FLASK_SMOREST=y
BR2_PACKAGE_PYTHON_DOCUTILS=y
BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS=y
BR2_PACKAGE_PYTHON_TOMLI=y
BR2_PACKAGE_PYTHON_CSSSELECT2=y
BR2_PACKAGE_PYTHON_TINYHTML5=y
BR2_PACKAGE_PYTHON_ITSDANGEROUS=y
BR2_PACKAGE_PYTHON_BLINKER=y
BR2_PACKAGE_PYTHON_ENTRYPOINTS=y
BR2_PACKAGE_PYTHON_AIOHTTP_REMOTES=y
BR2_PACKAGE_PYTHON_WERKZEUG=y
BR2_PACKAGE_PYTHON_MARSHMALLOW=y
BR2_PACKAGE_PYTHON_WEBARGS=y
BR2_PACKAGE_PYTHON_TOMLI_W=y
BR2_PACKAGE_PYTHON_PYPHEN=y
BR2_PACKAGE_PYTHON_PYDYF=y
BR2_PACKAGE_PYTHON_TINYCSS2=y
BR2_PACKAGE_PYTHON_PYPARSING=y
BR2_PACKAGE_PYTHON_JEEPNEY=y
BR2_PACKAGE_PYTHON_AIOPROCESSING=y
BR2_PACKAGE_PYTHON_PATHSPEC=y
BR2_PACKAGE_PYTHON_AIOLOGSTASH=y
BR2_PACKAGE_PYTHON_ASYNCCLICK=y
BR2_PACKAGE_PYTHON_JINJA2=y
BR2_PACKAGE_PYTHON_ARGH=y
BR2_PACKAGE_PYTHON_AIOSQLITE=y
BR2_PACKAGE_PYTHON_SEGNO=y

Kind regards,
Titouan

> Alternatively, we could revert the
> flask bump and just import the security patch (just [3], if I'm not
> mistaken).
>
> Florian
>
> [1] https://github.com/pallets/flask/commit/0109e496f6ca68de29480fe6413e81b1d3f86aa9
> [2] https://github.com/pypa/flit/commit/640b6ad973e406b352649d36eb35dc208ecbb0ca
> [3] https://github.com/pallets/flask/commit/fb54159861708558b5f5658ebdc14709d984361c
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
