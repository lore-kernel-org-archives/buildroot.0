Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09926C19F2E
	for <buildroot@archiver.kernel.org>; Thu, 27 Feb 2025 14:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE67F83FAB;
	Thu, 27 Feb 2025 14:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y20QiEEUQcey; Thu, 27 Feb 2025 14:44:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C103F83FB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C103F83FB2;
	Thu, 27 Feb 2025 14:44:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 833F9711
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 14:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72C3B416AB
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 14:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0mZwdCzR3Pg for <buildroot@buildroot.org>;
 Thu, 27 Feb 2025 14:44:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 679B5416AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 679B5416AA
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 679B5416AA
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 14:44:22 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38f325ddbc2so701640f8f.1
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 06:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740667460; x=1741272260;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mT1yTd1eMv/LTYuC7soyOQGwmsLV7Rm1dT+qjpRnJl8=;
 b=AZjxRiASLeIx7h6zWHsraqlMA6p3yYCZC3MgTUgLgt7DRd/8yA0hDMOZh75KBnTaeW
 R9GEhSwi3SUMYiz7XoZHhstFC26L/hKD96VfwuAT4cIp0rlqV2Acj5lIaIIvjOdmCqFh
 r8HhovbnB54rlJWgdnub57n9VExlvLR7xszRZZeP8KwUTI5I075fcNV2sxxF3eJ1puK0
 cvEHYy9m/vYitsKp3vI/NvuJ6+k7wk6L2kvO7n+uDcCnLYipA9eDriEO4EAGIP4xMBg4
 Erg76pEeBZIFl3xy6Ox8FzdlKRMWGfLQyU+OiQIwDWYBJyAaAoQT4N7QD3mxFuryZiNX
 MbCw==
X-Gm-Message-State: AOJu0YynXOshg8M/xRZ5jx9a+R7Kz2UmhHWDasoviYOp4kFPGP/RvyLA
 ly7J7svRdQThVPK1SqxSGVF7FF7guDV66uRa38c6/B5Z+f9IJuebMptjjoUg2+U=
X-Gm-Gg: ASbGncs9kjCI4DUVAJdkHdMS6ZhTlvVBDET1MUa4ZEiC99otQQ/f1XdmuxsLDI+JG8l
 zxjY2sAwDyHreAuVg4NRSvpg7IEghAIXx43B7n1O0mAgLGlC6+Bm8Sy+fWVtRTua1m4zRkCaVaU
 SjaWTO714iKkaZks9jEDwOcr8UuVj+4I5Yr04luB0+r3cO384vcRDrI4YhyViPxIyaPQv+qTdzB
 KdjZ7RcewJRWw/09Vyjsij+NAPFH9HgPyNsw/izy4Nne4FE1P5doi3EXrLJrZK88rsagm6PaDvn
 sOlQuXgPPfX1uIznFY1wiGur47xG
X-Google-Smtp-Source: AGHT+IFdzhEsW+4J+AC5zG8fxW0RBjSeXpjA7KnQjVire5CuV7UDgNohooZlORAs5BphmOhTUf6hbA==
X-Received: by 2002:a05:6000:2c2:b0:38f:2cec:f3df with SMTP id
 ffacd0b85a97d-38f707afc59mr18381351f8f.24.1740667460328; 
 Thu, 27 Feb 2025 06:44:20 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4796051sm2324503f8f.12.2025.02.27.06.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 06:44:19 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DB13A5F8AB;
 Thu, 27 Feb 2025 14:44:18 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Adam Duskett
 <adam.duskett@amarulasolutions.com>,  Daniel Lang <dalang@gmx.at>,  Eric
 Le Bihan <eric.le.bihan.dev@free.fr>,  Julien Olivain <ju.o@free.fr>,
 Romain Naour <romain.naour@gmail.com>,  Valentin Korenblit
 <valentinkorenblit@gmail.com>
In-Reply-To: <20250221164422.47060-5-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 21 Feb 2025 17:44:22 +0100")
References: <20250221164422.47060-1-bernd@kuhls.net>
 <20250221164422.47060-5-bernd@kuhls.net>
User-Agent: mu4e 1.12.9; emacs 29.4
Date: Thu, 27 Feb 2025 14:44:18 +0000
Message-ID: <87h64fwipp.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740667460; x=1741272260; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mT1yTd1eMv/LTYuC7soyOQGwmsLV7Rm1dT+qjpRnJl8=;
 b=L7IQk09YVJ7w46lVu2ceM7QDQmdmpC6c65Rh8sr2VvrZ1HQ1itEJTpiJ9HBve1721o
 Os0Zw/URcr1zZ0q2WrEVGyF1WbxJiQ8RWbyj4oEwGZY164h/kfpN5b7MM5ZQGPTpr6R3
 JF0Xn2+UmOC/r4PbII4iZ3fvMCDEGyc+g1gYrX9EWZsFwNG8CqIcDz9FBVXYUNKrUJuO
 YTL7GcyXPu6evV2KYxVRXNo0GYc99eCL/peQzTaYSh14o4bUfFRpRQ94rGE3Oa+mE2QY
 g9one7t9O3u7YdJR73vA1zPn2y8uVEA0wo+hT0I+CnZ+MfJUUT5DHWixR3wY7Phgi/nX
 PjdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=L7IQk09Y
Subject: Re: [Buildroot] [PATCH v8 5/5] package/{mesa3d,
 mesa3d-headers}: bump version to 25.0.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4gd3JpdGVzOgoKPiBSZWxlYXNlIG5vdGVzOgo8
c25pcD4KCkkndmUgcmUtYmFzZWQgbXkgdmttYXJrIHNlcmllcyBvbiB0aGlzIGFuZCBjYW4gY29u
ZmlybSBpdCB3b3Jrcywgc286CgpUZXN0ZWQtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVA
bGluYXJvLm9yZz4KCkFsc28ga21zY3ViZSBpcyB3b3JraW5nIG5vdy4KCi0tIApBbGV4IEJlbm7D
qWUKVmlydHVhbGlzYXRpb24gVGVjaCBMZWFkIEAgTGluYXJvCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
