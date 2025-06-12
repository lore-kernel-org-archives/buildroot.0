Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36835C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 09:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A38D818BE;
	Thu, 12 Jun 2025 09:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTtqPGV2AS3s; Thu, 12 Jun 2025 09:42:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08693814BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08693814BC;
	Thu, 12 Jun 2025 09:42:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 74A6E183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 09:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A931814BC
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 09:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 76y_qSRX2OtF for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 09:42:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::641; helo=mail-ej1-x641.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0881481455
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0881481455
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0881481455
 for <buildroot@uclibc.org>; Thu, 12 Jun 2025 09:42:15 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-ad88eb71eb5so94468366b.0
 for <buildroot@uclibc.org>; Thu, 12 Jun 2025 02:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749721333; x=1750326133;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=c23oXYzrv+CtXqRtXMKQ54lq28mhSupljLFr1o4WsOQ=;
 b=kBnu89a7LaevUGfoSB82hyy0zp06dxqgtSTmkm6+pFSDBKTBpu0yBRvifCW1PlX02l
 iCvye5K1mZ8GgmU0w5i+MwOCyuKiX+w+H+m6jMGhel4oaDuqEZyqATrierWE+XpU6Ofv
 Ud8do2Uq/SDBUCVK2gzH+IatWkgEfuJfx/MvtPSEdaJBVf3nzwlAlTSxXepOWzKF5sxA
 TqsOw9MBnPtDWPJVlBHANbkfYZTOwQOSSIJtmOVIsTnLQpCdY7BG78IoksFKuT+i0uiR
 ex+lMMcfNt+1AV+tJZZUzUhsEdMdsqM0gG7qWfU1l6zGMMT5xDezAhHiMM1wox7sQ5sG
 CiXw==
X-Gm-Message-State: AOJu0YyIWvAdHJAgAbo3NAo1Vyjw1VHJarxlJzvDq1y6NtH1AB00iF1H
 4ggoQukSvQ/ROAnkUdSs8TImyOl04HAg0bNBe8WOb24HyWwmdJDRaWBUDcr0NeXd/6c=
X-Gm-Gg: ASbGnct06uxF56j7rAJx95hKMJKS4gWd7vhHXHp/5yA/VaF7KXEUBs26c+RsKPqAUXH
 mLoSMxEd2kblJyTORphrXHwUSpBJ+X/tFBqNaxtpmhcXfzYreW+exXNnKR3xR78qP53C9Df9NNp
 jXRPVNQVAOHVix2QdHxqk+uKygdzEbCJ3LtTBjlyPvC8B3mNnZiKwWbDgCz8dUcsSRIickbZSn6
 K5e826P4NUuZl+knnh87eaDqtAWbGSH5TLBEGM3KhHAXn1vAJKa33bLDoJ8bmUAuN1mInOAODFh
 BGEd4I4PyRNSmZU/Lqr2oEk2zGXsEddbbURJPnitRYQgKuqZ1ikjQZKQ//Ewt/I=
X-Google-Smtp-Source: AGHT+IFvTcce+0ujvxMRCBthR0S4+BXtg+IVxzBOiiaqaRO1hLgmzyLc/mn2GPPkIemUivOfSv0P1Q==
X-Received: by 2002:a17:907:3e0a:b0:ad8:8efe:3201 with SMTP id
 a640c23a62f3a-ade89767028mr667756766b.43.1749721333421; 
 Thu, 12 Jun 2025 02:42:13 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adeadf4146esm103314466b.174.2025.06.12.02.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 02:42:12 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 156455F8AC;
 Thu, 12 Jun 2025 10:42:12 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@uclibc.org
In-Reply-To: <pan$97079$1dcb0ba7$e499ebdb$a7f8e94b@ID-313208.user.individual.net>
 (Bernd Kuhls's message of "Wed, 11 Jun 2025 23:38:19 +0200")
References: <20250611111640.702572-1-alex.bennee@linaro.org>
 <20250611111640.702572-2-alex.bennee__11620.3121536941$1749640635$gmane$org@linaro.org>
 <pan$97079$1dcb0ba7$e499ebdb$a7f8e94b@ID-313208.user.individual.net>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Thu, 12 Jun 2025 10:42:12 +0100
Message-ID: <87o6uti9e3.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749721333; x=1750326133; darn=uclibc.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c23oXYzrv+CtXqRtXMKQ54lq28mhSupljLFr1o4WsOQ=;
 b=IHxQJCXWpwXvnz6SZjzir/fOD3LsHuI21lVUURYbSOecMyPHNiGPISZ1TITXRbEzyD
 XAcG7kGL6hq4+LGYNr+yQakICPXuN927ptmsO/1CzANsGggW3y9zmAXZ+8BB69kAahWO
 h8d6GFS590ZgN1JPe3SaCWwgGHrXeOKADkeX5Pny3oGLQUY/OWSM23UG11UOIvOWWJan
 VJVoxDmgvdtJ70GATb+9nQJ+T5jCZHL7mbjKLB0FTw7/TeDEBoYoyTiPiOYUEx0gTw9N
 QU7k3JgAjlXhk8KOJAB4Iul+6NLwwI0hNt35jYy23LPxTmPlzLIoEoo+UENuWXaZWEYN
 dEXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IHxQJCXW
Subject: Re: [Buildroot] [PATCH v6 1/5] package/{mesa3d,
 mesa3d-headers}: bump version to 25.1.3
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

QmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4gd3JpdGVzOgoKPiBBbSBXZWQsIDExIEp1biAy
MDI1IDEyOjE2OjM0ICswMTAwIHNjaHJpZWIgQWxleCBCZW5uw6llOgo+Cj4+IC1NRVNBM0RfVkVS
U0lPTiA9IDI1LjAuNgo+PiArTUVTQTNEX1ZFUlNJT04gPSAyNS4xLjMKPgo+IEhpIEFsZXgsCj4K
PiB0aGUgLW5leHQgYnJhbmNoLCB0byBiZSBtZXJnZWQgd2l0aCBtYXN0ZXIsIGFscmVhZHkgY29u
dGFpbnMgMjUuMS4xOgo+IGh0dHBzOi8vZ2l0LmJ1c3lib3gubmV0L2J1aWxkcm9vdC9jb21taXQv
P2g9bmV4dCZpZD0yZjdiY2M3ZGZjNTIxNzcyYTM5NWFiYTA4NGViYTMxZTY2MjJlOTRkCgpJIHdh
cyBkZWJ1Z2dpbmcgYW5vdGhlciBmYWlsdXJlIHNvIHdhbnRlZCB0byBtYWtlIHN1cmUgSSB3YXMg
dXAgdG8gZGF0ZS4KSXQgdHVybmVkIG91dCB0aGF0IHRoZSBwcm9ibGVtIHdhcyBlbHNld2hlcmUu
IFdpdGggdGhhdCBzYWlkIGl0IGxvb2tzCmxpa2UgMjUuMS4yIGhhcyBhIGZhaXIgbnVtYmVyIG9m
IFZpcnRJTyBhbmQgVnVsa2FuIGZpeGVzIGluIGl0IGFuZAoyNS4xLjMgd2FzIGEgaG90Zml4IGZv
ciAyNS4xLjIuCgogIGh0dHBzOi8vZG9jcy5tZXNhM2Qub3JnL3JlbG5vdGVzLzI1LjEuMi5odG1s
CiAgaHR0cHM6Ly9kb2NzLm1lc2EzZC5vcmcvcmVsbm90ZXMvMjUuMS4zLmh0bWwKCkl0J3MgZWFz
eSBlbm91Z2ggdG8gdXBkYXRlIGxhdGVyIHRob3VnaC4gSWRlYWxseSB3ZSBjYW4gZ2V0IHRoZQpj
cm9zcy1jb21waWxlIGZpeGVzIGZvciB2a21hcmsgdXBzdHJlYW0gYW5kIHRoZW4gcmUtc3VibWl0
LgoKLS0gCkFsZXggQmVubsOpZQpWaXJ0dWFsaXNhdGlvbiBUZWNoIExlYWQgQCBMaW5hcm8KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
