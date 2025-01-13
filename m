Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8141AC02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 22:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3616B80BAB;
	Mon, 13 Jan 2025 22:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pWck8QwqOLW; Mon, 13 Jan 2025 22:25:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47BC980BD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47BC980BD0;
	Mon, 13 Jan 2025 22:25:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF778940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 22:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA76E404DA
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 22:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZqSZ81SEQ_D for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 22:25:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1EFBC404D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EFBC404D5
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1EFBC404D5
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 22:25:20 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so34632855e9.3
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 14:25:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736807119; x=1737411919;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GzHTxHbgAAJTccUQMB9ORiP3nRGH1SdSUlSs2Z57Cow=;
 b=rJYr/7lBiqeMnNyrK1cUZc4JpRqE0k3wqmBf0rH0Z8NV+5oxjS95rjb8+MM5Xm2OuM
 tdV5hwOmRipFkTMCTZe7VP7IlMevZLLO3T+o445idTI8NV1eLirL/8jlzZVZ4xvV0CEh
 VNfcpfjGyq3gCoJv/MZ32GsnxrQjYVn5fVH3aTu7GEAaEQjzNMO1rNXkLSkTpaom0JQF
 T65iHHYEYau98mtrM7fcHKoA08YNDNbub6M4+4mJqrX7v9Jx6GMLdPPSUjibEAVlamWD
 357xdlWtlvaIyWl4W+9ZzJUfAmK5+qT7MypSCPJXbc6Ykg4f9CUKQ1vEJyP6g8o/BV77
 yi3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqMSyeZ84dEBow0PUlq/4inpZ49nfOItVfKxy5G8YV0n8crxKWEBDuQL3dXowQUFdHjt1uGNlUUQ0=@buildroot.org
X-Gm-Message-State: AOJu0Yx1nXQGwtlHYhI8AB99NHmyoB5Z4RCyiIrWuvlvATcvqrA6Y0DK
 czlKOnWN7lZRHEQO29KLayHkTn1uyMEGXXZJYkVsFKlkPr7nMcX3u84Io+vf8BDWkYOOycxZgnG
 1
X-Gm-Gg: ASbGnctoICyl2jkPTqOYFIsBJnDlrJcTa9zORhcHZwY2PoVsT+5t/dVvZAyEG4t5me6
 kFV71Zk03ferOtb/ioLaTOlLaiSpHEhgftPvhV1SmW37+nLwQ+BB2Klv3Lb8FCrKf23c055Xx1K
 aO2cqRW3AOLFdg9Cr8SccAOZOy9HEkSHj+Pu/zb+8WkMmZreWMsZQpIhDLLaez24yZbcn1s9ADP
 kjgBS3TJLokpSfXH8UDKyICDLggIkCoLML0l/mj0kZrzJvAuuv3tVKWeuvNQmmV8PpFO46SIyL1
 fpwAK0iio/UqAbetUq8J0BynWeSTzDwOzlkPL1Hvh7+MyNtCjh0s1qvEiZP/Wm8nR5ACmKP8xZN
 nerrP7Ghl/VOeKeOA
X-Google-Smtp-Source: AGHT+IF3LdtHac/yS/ZNtS8Stu7DRJeR2a+SoOHOH84E95o7nzLJMIMgdwEt4+s9qBV/ndddwslH6g==
X-Received: by 2002:a05:600c:1d10:b0:434:a59c:43c6 with SMTP id
 5b1f17b1804b1-436e26f508amr181468795e9.26.1736807118873; 
 Mon, 13 Jan 2025 14:25:18 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436f67192a1sm87091335e9.27.2025.01.13.14.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 14:25:18 -0800 (PST)
Message-ID: <ec879fb6-8063-4eed-be5f-bc2bf6545847@smile.fr>
Date: Mon, 13 Jan 2025 23:25:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Buildroot Notifications <buildroot.notifications@gmail.com>,
 buildroot@buildroot.org, alistair.francis@wdc.com
References: <67849675.500a0220.4e520.1738@mx.google.com>
Content-Language: fr, en-US
In-Reply-To: <67849675.500a0220.4e520.1738@mx.google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736807119; x=1737411919; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GzHTxHbgAAJTccUQMB9ORiP3nRGH1SdSUlSs2Z57Cow=;
 b=d7lyV5ZMUMgDIXIpJYKf+jpFgncDkfBalgIELrwsAmEm3eMI/Q/pw0jGJpbLjBBMD3
 yQnVQPm5yk8w7XX07oREqZUK21RjaSgctJ+xAE3bLmJ2QHd6mY4sHVxmxNmlnwm+Jvx3
 JdjnwMO6CZ/H356YgmE36JLgma7Hu+qzi7nqs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=d7lyV5ZM
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2025-01-12
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxpc3RhaXIsIEFsbCwKCkxlIDEzLzAxLzIwMjUgw6AgMDU6MjgsIEJ1aWxkcm9vdCBO
b3RpZmljYXRpb25zIGEgw6ljcml0wqA6Cj4gSGVsbG8sCj4gCj4gQ2xhc3NpZmljYXRpb24gb2Yg
ZmFpbHVyZXMgYnkgcmVhc29uIGZvciBtYXN0ZXIKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IAo+ICAgICAgICAgICAgICAgICAgICAgcWVtdS05LjIu
MCB8IDEgCj4gCj4gRGV0YWlsIG9mIGZhaWx1cmVzIGZvciBtYXN0ZXIKPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+IAo+ICAgICBhcmNoICAgICB8ICAgICAgICAgICAgIHJlYXNvbiAg
ICAgICAgICAgICB8IE9LPyB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dXJsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBvcnBoPwo+IC0tLS0t
LS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0rLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0KPiAgIHJpc2N2MzIgICAgfCAgICAgICAgICAgcWVtdS05
LjIuMCAgICAgICAgICAgfCBOT0sgfCBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jl
c3VsdHMvMWIyMjZiY2U2MTg4MzNmOWFjMDQ0M2I5ODM5NGJjNjYzMDc4ZDJjZCB8ICAgICAKClFl
bXUgZG9lc24ndCBidWlsZCBmb3IgcmlzY3YzMiB0YXJnZXQgc2luY2UgcWVtdS05LjEuMC4KCjIw
MjQtMTEtMjQgMjE6NTk6NTUKaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRz
Lzk4My85ODMyOTk0YTBjOTYyN2ExMjI3ZWJkODM5OTJlYWZlZTc0YTVmODUyL2J1aWxkLWVuZC5s
b2cKClRoZSBpc3N1ZSBjb21lIGZyb20gdGhlIGZ1dGV4IHN5c2NhbGwgd3JhcHBlciBwcm92aWRl
ZCBieSBRZW11OgoKI2RlZmluZSBxZW11X2Z1dGV4KC4uLikgICAgICAgICAgICAgIHN5c2NhbGwo
X19OUl9mdXRleCwgX19WQV9BUkdTX18pCgpJbmRlZWQsIG5ld2VyIDMyYml0IGFyY2hlcyBsaWtl
IFJJU0NWMzIgYW5kIEFSQyBhcmUgb25seSB1c2luZyA2NGJpdCB0aW1lX3QuClNlZSBhIGZpeCBm
b3IgTFRQIHByb2plY3Q6Cmh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10ZXN0LXByb2plY3QvbHRw
L2NvbW1pdC9kOGM1ZTBiZWI5ODIyYzQxNmE0NGQ0YTgyZjEyZWZiMTYzZDMwNWVmCgpDYW4geW91
IGhhdmUgYSBsb29rPwoKQmVzdCByZWdhcmRzLApSb21haW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
