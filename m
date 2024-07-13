Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CD2C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BD6181DD8;
	Sat, 13 Jul 2024 20:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AyzUCWRLYGaa; Sat, 13 Jul 2024 20:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 235ED81E0B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 235ED81E0B;
	Sat, 13 Jul 2024 20:23:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5385B1BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B6A1403D0
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 236QsakX65g9 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:23:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1C54E4031B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C54E4031B
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C54E4031B
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:23:36 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2eede876fcbso10185581fa.2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 13:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720902214; x=1721507014;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iUzf9Xtk/HN9833N45PY0ZVxe8OJPXbOz5jiwy7T5h4=;
 b=Pw0fX+VDAlO7P0SNdJKN0gLYbVCLaqS/QL0YzjOOFWT1Y25MW5CzXGvVNedAv9jDAT
 mnRwdhCu0RNeIvoEooFk+K4mLjncV+4XIx3Ml0gYm7tlJVs+SX620QBu/KeAjyzxT5mr
 3xHXSmBcCPejG3XZzBMHTo3zTnAzsAV0caRlwPAeQheZcTCVdCnEZxkByJQDqjyroJli
 vHOOqGKLQjz90Tygmjcq/q0EBdUHR1rVSJg/n8Sveq+Bq7u0ehGn6aI/OVAZGipKeDhR
 /jZ0bFohlmp3VCwyh8BmOdVBN/CqEYMQg6l6NMA872ua6WHLJFMy27+sDcvaUpIww0OA
 Dobg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM861qgLI3MegBTLgqgsGcN68WoOSXVQchuTFsXHjbMyAgciIMVpsZDI67VE3ur/BxOxSooJJcM52nhAmr52CtgmXjSUtn/A==
X-Gm-Message-State: AOJu0YyICa+ePrzFYIYXay073z3UN1gD/Cg2m60xjrfCAc+At4U6eqjP
 93Ke5kVfeDQkR7wa7GuqI/BTDPpyBSJkq4C3C4Uov6zqSD1dRVGzwKIBpIulXGo=
X-Google-Smtp-Source: AGHT+IFzu1V9pn236n5EL8/JyvEtzeVHx1KfF/Qj8wnZiKRzc6j/xyt2W8yoXdqNNMkS2RwigUy8Lg==
X-Received: by 2002:a2e:9c8b:0:b0:2eb:f472:e7d3 with SMTP id
 38308e7fff4ca-2eeb30ba1a2mr95714501fa.6.1720902214647; 
 Sat, 13 Jul 2024 13:23:34 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b255275bcsm1144556a12.48.2024.07.13.13.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 13:23:34 -0700 (PDT)
Message-ID: <6ca2c42d-e78c-401e-89bf-d4e9ab562bc0@mind.be>
Date: Sat, 13 Jul 2024 22:23:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
References: <20240713054213.228070-1-heiko.thiery@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240713054213.228070-1-heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720902214; x=1721507014; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iUzf9Xtk/HN9833N45PY0ZVxe8OJPXbOz5jiwy7T5h4=;
 b=Ed7a9TKhkcODJAVG+gqRxzT/Q7O8pAFt8fkwdXLKEWYWSTEN8LJIm3VFzF4DWFbAsW
 vmfvjcwdTW59RYjXKYkS4AHKsm6tY2l1CJc3xxjIIzZ3mV6g7gNELglz0hVmOd2ytDqX
 AzzqV0Kuqadx3jZq1oLYlbAD4WkmPhQuqV2037dWF8O3gg8Ah40NZSONge6zoDVy75ir
 8RJ4YKJaVg8qVMcRWvrq9JEOwUgOjU852ldBx0uDfwTKbct3GNlW1cJeXTmnX/Mqg04m
 2mttuWGKamevCp0IwfI2IsglkoTSDU7b3zowD+P2FK8P/HzI8UgjAAZbnJF5bWt6/3RN
 i+nQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ed7a9TKh
Subject: Re: [Buildroot] [PATCH 0/2] pkg-cmake CMAKE_ASM_COMPILER override
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Samuel Martin <s.martin49@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/07/2024 07:42, Heiko Thiery wrote:
> While I was adding a new host package (blake3) I got an error
> with the selection of the ASM compiler. The error could be fixed
> by using -DCMAKE_ASM_COMPILER="$(CMAKE_HOST_C_COMPILER). During
> the review it was noticed that the value DCMAKE_ASM_COMPILER was
> incorrectly set in the pkg-cmake infra. After this was fixed,
> the workaround for this could be removed in the blake3 package.
> 
> This workaround is also present in the llvm package and now
> can also be removed.

  Applied both to master, thanks, after extending the commit message a little 
like you asked.

  Regards,
  Arnout

> 
> Heiko Thiery (2):
>    package/pkg-cmake: remove override of CMAKE_ASM_COMPILER
>    package/llvm-project/llvm: remove overriding the ASM compiler
> 
>   package/llvm-project/llvm/llvm.mk | 6 +++---
>   package/pkg-cmake.mk              | 1 -
>   2 files changed, 3 insertions(+), 4 deletions(-)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
