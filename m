Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD81BC021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 06:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B0EF80C0A;
	Wed, 26 Feb 2025 06:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31HYDrURAarb; Wed, 26 Feb 2025 06:35:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 786D180C84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 786D180C84;
	Wed, 26 Feb 2025 06:35:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B1632DE0
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 06:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F32CB60C06
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 06:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aeIixjBPobzO for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 06:35:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=kuzminov.sergey81@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 136BB60755
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 136BB60755
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 136BB60755
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 06:35:34 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-30a69c1a8d3so35783341fa.3
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 22:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740551732; x=1741156532;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xl71l/EhfJVaueIR36yb6Vt5Sl3XbHAaGP90XFTp9go=;
 b=knd/ajOfEk7CEXZ0rj3iQMDA1nNmg2iCz6MXv95X4BnEH6spcz9AeQHHIOmZmKgw5w
 DvvGDN/SJMAlCubPD1F7bL8qVEuUSsFg7Fj/3FbatNaNPrlo8psrnRD1s03lahv9ylGm
 eeeDoR60cJFaQ4BmQo9J02CxFBpszaHvbdeRrvxihGSarfQtncJvOf9sZIGAqnMW1Qq5
 y5BlXk5/x8fwmXxhAJ+s+ts/p+trLz/RL1Ro03MhcfPkqG+S2xalK1iIGHl6DQgMEdoK
 duhbm1AXuFrOm3gB/vdfqrjeMclNoNci3dcvlzdC+BawKDeGxuZGDxDuPXXOawWfyQvZ
 sIyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr6TCIqrE86xJPjPCpqfvwqQVWckM29g5TZgSGgYZVXcaXLVImkxRcmvYIsHFrvryDr3yTMHEsT7s=@buildroot.org
X-Gm-Message-State: AOJu0YwAbOCwhN1xPmo4lwjVOMB74gjaEcWGv8RRBTXys40OjPXWvAHA
 c8zNcC1QneI4w782o6af/NE2voJMwC+kmD0yX90MlX8s4++Xwrm/
X-Gm-Gg: ASbGnctK2GZskdwyWulGNVlf5u70I6HB/EF67b3p3yitMeBhZpqa+vLXOxTVI6DS7SB
 2S9n/G6UzAhPYWa1z/LFpVFd6oC2G3p87HNq5/E41qMh319aqcYCfTsERsoUPDx31rnbE8L55Ri
 VKvNrXO1J/0+4o5VD5hY16XEEkEqpJjs0V7MHLa5dnqrSKqF/cwciZA/kbjQKQU0wXG1ZZwXHK8
 iJXZG1BVnqu7aw+W2hZrjrJkiCV4TQ1tf55lNSiu+HY2VJgt3V9n3XAgup3Z8PxvKWUl67/NP9I
 hliHr5FXgPH8lPrJzkJVdDrhXaJ5Ri9BNFSgzwVn8Q+SusYKsK05
X-Google-Smtp-Source: AGHT+IFrUVukSBtSWcelq6ZqElY0v+wIr7dq6YbH/ErByXe1aParkgwV1synEXG+4BGvtHY2NscVHQ==
X-Received: by 2002:a2e:9590:0:b0:307:e498:1269 with SMTP id
 38308e7fff4ca-30a599a2963mr83250401fa.37.1740551732221; 
 Tue, 25 Feb 2025 22:35:32 -0800 (PST)
Received: from [192.168.188.32] ([62.141.72.206])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a819f523esm4292831fa.55.2025.02.25.22.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 22:35:31 -0800 (PST)
Message-ID: <d03af30f-4b07-41f0-b9de-478fae54b5fc@gmail.com>
Date: Wed, 26 Feb 2025 09:35:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Meri Jaan <merijaan328462@gmail.com>, buildroot@buildroot.org
References: <CAGmsXdzOtEvjSvCe63_B4FScwUO5GK-V+N2hQ1VB0je4-Z+T9g@mail.gmail.com>
Content-Language: ru
From: Kuzminov Sergey <kuzminov.sergey81@gmail.com>
In-Reply-To: <CAGmsXdzOtEvjSvCe63_B4FScwUO5GK-V+N2hQ1VB0je4-Z+T9g@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740551732; x=1741156532; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xl71l/EhfJVaueIR36yb6Vt5Sl3XbHAaGP90XFTp9go=;
 b=WfrpnPbaqqONObsjE9UJWnGPHjintqms4vdhxvcXAgAQUTDEZhQx+aD40V+pdHwDmu
 z9LR2M/cBz5z82cXkYTcwb/4GjDXKUGE2msoyA5LM266p2AwSOqKj+vYVPlqcgTftUV8
 Nim3LbQfSxGmdypwQaUqgiNFTDyhQ9z3KCVKPAFDzzOnruxyqBas1yGMk0ZoPqtIPEcm
 +xf2JlQ/PNQJ2RSktTWj/LhtLSDRSwpn7bMC0uiFbNgNKxm5WzYxm5l2/fp2wMZZ5QOR
 N4UcO4SlzF/0WS7YB3/l6XPBY50W181eNO7p2o1+N9mLffavJadllHyJZJefqAKBQSDI
 uN+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WfrpnPba
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
