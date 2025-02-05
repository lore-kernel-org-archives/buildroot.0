Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BCEC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D73F8838AF;
	Wed,  5 Feb 2025 11:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mlU7t2axi1vi; Wed,  5 Feb 2025 11:07:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2830838D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2830838D3;
	Wed,  5 Feb 2025 11:07:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EFC7CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F28E60749
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ln6wuN-OZvN2 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:07:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0AE77605C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AE77605C9
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AE77605C9
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:07:11 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-385dece873cso3095905f8f.0
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 03:07:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738753630; x=1739358430;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=quACrSsQo5h7eQJVZiDHqVSYqoH1Id0TlPcrNvicwFA=;
 b=FC8AJWovbK9r9LqKoE9innuyxD/bQ4PIV0QmWsQJVd7iIjPlQw2KW8ggrcSlNqq1UO
 1Rg/zeDb6h6nBYGCe2RjACUf1f2xU732dVRiFHmuZIxHo4DttnkFxH84h2S+wLb8WJsO
 LLGBxzjGpM/gQIrplFtlJRjA7I0NTJEW9eD9TcdtpcPXEaz+qq+2dLlcUe3roT/WR4R4
 /UjqQ0l+wZuIiNi2BfIGkpFQXmWxacO5NNsO9W2fKJIEEXJSzRSdAcAZxMCCEe783Mrg
 7PlskVEaUdpkoqa3kOAjz7vJxXctdgMZ4H42AEGTk8oMonDP5KeKqoNj9U4v1JXBWLLq
 FuNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT3kCGZOpEYfQBIQNoc4xiGNlIxspQZ9/YeqlwSGm9SoODkq9Ci+v+TyirlHqPHpRzGFO/4HdyrCo=@buildroot.org
X-Gm-Message-State: AOJu0YznxvxwvT61xhEjCSsL1xiQYjrdxtbsZcnaGwIX7cwUIZ8sGxtW
 2WbxY4IDqnC60WbE7Da4SdW9OISlZW+3Nw02qBr2ZjR3Uz4oyi6wdOV3B4lfKW4=
X-Gm-Gg: ASbGnct0umlNc7EsmypINDLgSi9PoW+lB5CanImuWWXvsuqzv8Oppbhqr1xEY55UEvn
 7OA5OpMFoazZwUYGwISsCoOBFB186llI64JeewP6P1CVf/+TMFfYbmbicGa94PiaH2xrX1Oha9r
 Yab1wZ4I/I5jcrcAp8wd4ESZj70H7NfNjegQHNmaLrhFZ1OIVwMwDbbTgPgtjYyLC4HnyWkEqsn
 vTb+cY9AQNC1BtR1yBkTjWBDnKJDQ/zTNqiXCF5fyDb1KoQ6PWW+8LSdvDDh+Cq/SLIa1cxILyc
 j0b+W/4pMtHKvKXnsHhNvMzjVcAQngBKSE0imiF0262ADDY=
X-Google-Smtp-Source: AGHT+IF77CBrVgLdy0LSxe1DtauZcb9pBX8kIoJy+uq58XIsFmKlca/J3KzHF/n3REqF8tX2R6115w==
X-Received: by 2002:a5d:5f56:0:b0:385:f847:aa40 with SMTP id
 ffacd0b85a97d-38db491f258mr1949667f8f.38.1738753629799; 
 Wed, 05 Feb 2025 03:07:09 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38da59470b2sm4944685f8f.40.2025.02.05.03.07.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 03:07:09 -0800 (PST)
Message-ID: <39c88dda-8862-4fa9-a7b2-62b29342acb3@mind.be>
Date: Wed, 5 Feb 2025 12:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sergio Lindo Mansilla <sergiolindo.empresa@gmail.com>,
 buildroot@buildroot.org
References: <20241223130856.74283-1-sergiolindo.empresa@gmail.com>
Content-Language: en-GB
In-Reply-To: <20241223130856.74283-1-sergiolindo.empresa@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738753630; x=1739358430; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=quACrSsQo5h7eQJVZiDHqVSYqoH1Id0TlPcrNvicwFA=;
 b=RdXrnjpxgsSJQIeyXFJzEPF5f1DIHS+4iQkk7hIagTS8F6bQJ2YYRZ+GD6VpFyCkND
 5E6ahE4MltJfOE7Bd46WcQfMDUZU/2y6YejDuTyqk4pV6QgSIycYTg8It6WILfKYB//A
 6vZh2T6rv1Hq/43fgbopYyH7sX753T/HjGI872kWhNgKplFpI0XCuIzbtNjhIQiJDURO
 3qbT6x48qkALcwLD+9XOowdx0Xn54pseCTl5J2/Qss/OGYpHJkBbvOYF/0WUDPtC5j1L
 yBJ8oSDGytlHL74GS7gw86vTKYwOnr1RtwnT8563DTLs2nUfV0cFepAZAvZaVticfLuk
 7sGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=RdXrnjpx
Subject: Re: [Buildroot] [PATCH 1/1] .gitignore: ignore vscode and mac
 finder files
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Sergio,

  Thank you for your patch!

On 23/12/2024 14:08, Sergio Lindo Mansilla wrote:
> This helps having a cleaner git status/diff list when developing on MacOS.
> 
> Signed-off-by: Sergio Lindo Mansilla <sergiolindo.empresa@gmail.com>
> ---
>   .gitignore | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/.gitignore b/.gitignore
> index ec5768d053..f023d4769f 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -13,3 +13,5 @@
>   *.rej
>   *~
>   *.pyc
> +.DS_Store
> +.vscode

  These files are not files that are created by Buildroot, but files that are 
created by your local environment. Therefore, the proper place to ignore them is 
not in the project's gitignore, but rather in the user's ignore file (normally 
~/.config/git/ignore). Cfr. the gitignore man page [1]

  Therefore, I've marked this patch as Rejected in patchwork.

  Still, thank you for your contribution!

  Regards,
  Arnout

[1] https://git-scm.com/docs/gitignore

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
