Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0233CC021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 16:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D07840A03;
	Wed, 26 Feb 2025 16:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gl-JgjrBF0Jx; Wed, 26 Feb 2025 16:45:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C4AB40920
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C4AB40920;
	Wed, 26 Feb 2025 16:45:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3A391ED4
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 16:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F2D54064D
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 16:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bz4U-l2NSBT4 for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 16:45:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=kuzminov.sergey81@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F132403A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F132403A4
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F132403A4
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 16:45:03 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-30737db1aa9so235951fa.1
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 08:45:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740588301; x=1741193101;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zpxzgBmAoxjXO+Ce1bUIjYlZNLJB/VwstC2ZvKKwBJ4=;
 b=lkESZDkVZPlfQgDpP4xakQwibCHY/Frsj9YFy88HpOR1bRKKpbKOv0wl6rtlaKzMIM
 /uT2i6N7uM+ipHj1WTby2oh20aVoNacKET+UlQ1d+QjcGF9IOd7IUlnjDJsYLV9ivRFu
 jRqXyTFaElXMwnpURIOl/5U7ZUT+Ik5EkflGT9gua+B46Pzmaca0I5xImW5AeBCoNUn6
 JdI9owb4uOaT9wmizn5EkNw3AQ/RHqWVPhoAJgTRpmk2Gt3I+jLBIRYWJzjlSXBg9o74
 /DS3O0LZicNumIfzdihAyZtXALrsILOtYxB2J/glqepnc5wtlmAE1KuxhFlx+Cz6uXdF
 bnwg==
X-Gm-Message-State: AOJu0YwlWGdxkCwZKSMZzeBZZMGlbfVIEXzY6jp8kriReFD/5QMv9HEv
 pUeoY8yyaMtEsqWUK9QFqxjgvcHilBVrWiWhrmUwWrYDSVHM0AUSpFo96w==
X-Gm-Gg: ASbGncvhIWtaFMJUgFbT8LC1T/sDHqEi2mxsonYXJxEJLR6f+yPWSBk3Hw6B4cbRpM1
 Yj/+ELjx6jf7uyW3N/UmT+wCqUqh8Rl47P1U2uBoxG/7MBS6Fmq0US+Qsg6WpsZJfJktSKcFxY1
 DSx+l0HInQThEImJ/ji/z54nei3GZXD6hlpFo0FVM0/iuMNGsDQOvehCxAwKbEaRj6GOug6Bnzx
 PVPTsAgW0aAgwJZmriuYN5nfpdBd3JTrKbqZhSf7uEbxEcjKFLyWVW8JJriNdaa4ONRjdN4AfCZ
 TZu2LS9Gh+AlatUNHX8zSGbsDgoPRt7i7dEq0EOn
X-Google-Smtp-Source: AGHT+IG2oSTa8ZiNSNf7wfbuzQWEH4I2K714bGEoxxvLvRVG18LrC7HJ/MAsHeIq6O3T8kdl0zv6eQ==
X-Received: by 2002:a2e:8055:0:b0:308:fd11:771c with SMTP id
 38308e7fff4ca-30b79163c06mr24875841fa.9.1740588300753; 
 Wed, 26 Feb 2025 08:45:00 -0800 (PST)
Received: from [192.168.10.7] ([188.191.244.248])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a819ebfbasm5963081fa.40.2025.02.26.08.45.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 08:45:00 -0800 (PST)
Message-ID: <71a320d0-d36c-41d0-85e1-332f69836207@gmail.com>
Date: Wed, 26 Feb 2025 19:44:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <CAGmsXdzOtEvjSvCe63_B4FScwUO5GK-V+N2hQ1VB0je4-Z+T9g@mail.gmail.com>
Content-Language: ru-RU
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
In-Reply-To: <CAGmsXdzOtEvjSvCe63_B4FScwUO5GK-V+N2hQ1VB0je4-Z+T9g@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740588301; x=1741193101; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zpxzgBmAoxjXO+Ce1bUIjYlZNLJB/VwstC2ZvKKwBJ4=;
 b=RLEZPH5zWakkdPGMfdzTShIEZHvRlHgwWY2JmDrkNeiel8TuLLgLUWeOvtPesS7hYh
 lEUDp2mwGnae8T4ZpLBVDUrtwjM9EULsmvlQmQcP2lsYMN9nVQzHcsD65p5DuPkAZJd6
 HoOADOHabHRRdnxOn7xQKjPXeY5OF8opRBySPWA1gdjqFZi1mUKe7TNLRZPVr2unuFlF
 RquJsBGKtXXTAVCEdvFqesjZZ2WKf2vDK4hzCbkBLanSjO9YXDfSh/bLOlslVvESQ11G
 +M9AVBPUH9QiEtp2WuZMwUmIKw0e9hMVtkx+OlmNt3UIC4eTYI49uT0x9pj741GEHFm/
 ljiw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RLEZPH5z
Subject: Re: [Buildroot] [PATCH] board/friendlyarm/nanopi-r3s:
 rk3566-nanopi-r3s.dts: enable hw random
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi, Baruch
For some reason, the email from you turned out to be empty, so I 
inserted the text from patchwork in the response.


 >Hi Sergey,
 >> +Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
 >> +Upstream: Not applicable, Buildroot specific.

 >What makes this patch Buildroot specific?

 >baruch

Without this comment, the verification script (utils/docker-run make 
check-package) reports an error. I took this comment from some similar 
buildroot patch.

For some reason, my emails are not getting through.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
