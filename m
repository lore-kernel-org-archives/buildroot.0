Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364C4C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 20:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E129980ABB;
	Mon,  3 Feb 2025 20:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ju7ZaaJo4Zv; Mon,  3 Feb 2025 20:08:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F3AB80CC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F3AB80CC3;
	Mon,  3 Feb 2025 20:08:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F0CB12F
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 20:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6EE76075E
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 20:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H5JLKDY1zsOp for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 20:08:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C60AC6076B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C60AC6076B
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C60AC6076B
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 20:08:41 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3eba7784112so2584719b6e.2
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 12:08:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738613320; x=1739218120;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ec8Caw/kawvd6EzW81205B8K8ezpcRakAp7k0hByn6c=;
 b=V0Dqaz+yVudsqjho7fh1+zXrQaHNzL04Fs3VcDgE2mRREmsRl7pc/3Ev+o8vLtD245
 r/vbGb46Voku4TM24DqbwQv6S2Cyqhz1EDla7p1C9IoNYl149E3YKMuVBQBGnEOlAHsD
 Kdm7q4M+pyh4eShwdBSANQoTttMOkaHHdKUSlBVBuNuP0HzYnALlzZIwOMVc4Qx37O/p
 BK5dWrfTEIVUdTXphEDPCQai2fbVNBLXGC4EECuK0q0/zZFXfOT2AftmNAvcqJeZ/sGv
 qgIJNU4sc5FNR9bQl3Vk/zf92/I7VSFu1hEL2fbJ7eXPDKkmWqgSCmmn5mNNNlPhbmtF
 jpoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTS4hbsW++6Xf+Uyq4UIpvu6LiLeT67Xxeuus1wjBlj4dIY5V2m9horM4husI6DXiaSU8TRKj8v+w=@buildroot.org
X-Gm-Message-State: AOJu0YxAqoeJZJs3GgGDLfkrWAfAaxg+9o3ltpcMXONbYwFC41XIyPAx
 MQe8h4L86iYVHXB3xNPyZsHlNgtUMu0MKEmGL5CxfRJRw1FMAa1zPB//wqBYyy7ByFp7W55w5sF
 7
X-Gm-Gg: ASbGnctFWeMibA87RoFEdu3R36V0mqog+XkGkmpSE4CaCSvj3uhElwlUNen2WiLHlqq
 /cK2+yDlmmF83AO9vH2s3IuDYdPHocZE14sTfgMEe9iVlY/CKajWjR2QQUf7JWAti73UYfPkJoV
 zw+LXicrLoNF3La8DnltmwkntA67rXPsmTJ3GheoGSUR+eQviMaHiT+YNk6K4QzD7Sn9++kNbfS
 72hSavAq3JpUA4i6w3DQk8qelrQ5WsUVk5AK+blzq+GTPNiZCTFciV0qPTB3BjxKa87adcNPW4l
 TVonIWlPL7zcsN2xM1Dxf96c02J6tfunGo94tiCRkgPIqFI6tDeYomU=
X-Google-Smtp-Source: AGHT+IHx/hNROAuMIP2OxKhU5KFH7BtqkEE+Ngdgu0atL+d0vnwnvWYA1U0ywXNypK71ko2MePaf6A==
X-Received: by 2002:a05:6808:3388:b0:3e7:c466:263 with SMTP id
 5614622812f47-3f323a0aef7mr16375186b6e.2.1738613320397; 
 Mon, 03 Feb 2025 12:08:40 -0800 (PST)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com.
 [209.85.161.54]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f33365bf3dsm2663867b6e.39.2025.02.03.12.08.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 12:08:39 -0800 (PST)
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-5fa3714d4bbso2178081eaf.1
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 12:08:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXQR93cxsHkjdchogc1sC71FKQ25mijMcgAxPnmMgYi8yAovxLTWyOHx4/zpjqYcXUo3BLSiLVcxvM=@buildroot.org
X-Received: by 2002:a05:6870:c1cd:b0:29e:34dc:b0 with SMTP id
 586e51a60fabf-2b32f284005mr13218712fac.25.1738613319501; Mon, 03 Feb 2025
 12:08:39 -0800 (PST)
MIME-Version: 1.0
References: <20250203120130.2332720-1-fiona.klute@gmx.de>
 <3dfa6faa-9307-4091-9a8b-f327a0be19be@mind.be>
 <434ed0ef-17b5-48af-9c93-1c7bb75c857f@gmx.de>
 <087a8c52-81f6-4031-b0ce-712fc8857034@mind.be>
 <bf504c35-cbe4-40dd-b56d-bfa3b62e552c@gmx.de>
In-Reply-To: <bf504c35-cbe4-40dd-b56d-bfa3b62e552c@gmx.de>
Date: Mon, 3 Feb 2025 12:08:27 -0800
X-Gmail-Original-Message-ID: <CA+h8R2qSoHp-YPNDAtNiCMrsEEULhYZGZa_EveNnUuPHkeucMQ@mail.gmail.com>
X-Gm-Features: AWEUYZnXJ5aYhHJfNNBN2HJlIuGzRRPZUPx-OY-6zu0NhccbRCoeNIJFij-6ZQs
Message-ID: <CA+h8R2qSoHp-YPNDAtNiCMrsEEULhYZGZa_EveNnUuPHkeucMQ@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738613320; x=1739218120; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ec8Caw/kawvd6EzW81205B8K8ezpcRakAp7k0hByn6c=;
 b=DmmsVfGwDlwL6WKPZmnsTgdSFiaFz+IZCwoz05s5M3avS9gqAvFa7NqbYawAlXjnDz
 RClJ2/sAojqx8lUVwGuqenasmgBcQv4fLweiis9lfqaomWW+1M7FAP9F22gIF3mA4ZfV
 PfSZAJZUQ5TPWfLCAEvtQGTeuPywI3L7CCyGlbQyRVphrwP9vT0bS9Az2Nm9s/2jkeFf
 D2yjDywUrew8e9xhQo3hqvHuilErco7zgcGbn4pik96bTpw5EvzbU15QKG5PSXZ03Kkx
 VKh6TJ8hMmcECX550Fluzig63yYPSzOs4v8mtIYlUS53PsZEfpfrJu6FE1OX2x3VKNoo
 actw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=DmmsVfGw
Subject: Re: [Buildroot] [PATCH 1/1] package/go/go-src: stop forcing
 binutils-gold dependency on aarch64
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gTW9uLCBGZWIgMywgMjAyNSBhdCA3OjE34oCvQU0gRmlvbmEgS2x1dGUgPGZp
b25hLmtsdXRlQGdteC5kZT4gd3JvdGU6Cj4gSWYgd2UgbmVlZCBhIHdvcmthcm91bmQgZW5hYmxp
bmcgR29sZCBpbiB0aGUgQmludXRpbHMgYnVpbGQgZm9yIHRoZQo+IGNyb3NzIHRvb2xjaGFpbiBt
aWdodCBhbHNvIGJlIGFuIG9wdGlvbiwgYnV0IGhhcyB0d28gZGlzYWR2YW50YWdlczoKPgo+IGEp
IEl0J3Mgbm90IGdvaW5nIHRvIGhlbHAgcGVvcGxlIHVzaW5nIGEgcHJlLWJ1aWx0IHRvb2xjaGFp
bi4KPiBiKSBUaGUgQmludXRpbHMgZGV2ZWxvcGVycyBzZWVtIHRvIGJlIHBsYW5uaW5nIHRvIGRl
cHJlY2F0ZSBHb2xkOgo+IGh0dHBzOi8vc291cmNld2FyZS5vcmcvcGlwZXJtYWlsL2JpbnV0aWxz
LzIwMjQtT2N0b2Jlci8xMzczMTkuaHRtbCAoVGhlCj4gRGViaWFuIHBhY2thZ2UgY2hhbmdlbG9n
IGlzIGEgbG90IG1vcmUgZGlyZWN0IGFib3V0IHRoYXQuKQo+Cj4gSSBob3BlIHRoYXQgcG9pbnQg
YikgaHVycmllcyB0aGluZ3MgYWxvbmcgb24gdGhlIEdvIHNpZGUsIHNvIEkgbWVudGlvbmVkCj4g
aXQgaW4gdGhlIGlzc3VlIFsxXS4KCkNhbid0IHdlIGp1c3QgcHV0IGEgZmFrZSBsZC5nb2xkIGJp
bmFyeSBpbiB0aGUgUEFUSCBmb3IgR28/CgpCZXN0IHJlZ2FyZHMsCkNocmlzdGlhbiBTdGV3YXJ0
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
