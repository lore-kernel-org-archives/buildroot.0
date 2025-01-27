Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104D3C02188
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 13:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B968080C4E;
	Mon, 27 Jan 2025 13:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xGEh0dUUinVk; Mon, 27 Jan 2025 13:24:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC1A380C06
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC1A380C06;
	Mon, 27 Jan 2025 13:24:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52BDF94A
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 13:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33464606A0
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 13:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pm4u9L6mRW-G for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 13:24:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=tobias@waldekranz.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B44926066C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B44926066C
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B44926066C
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 13:24:12 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa689a37dd4so894217866b.3
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 05:24:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737984250; x=1738589050;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DjDJpWy5afXfmtM4rlCxO8aipE6nGFguaKNrNRgo2Mg=;
 b=c1T0hFuVAvR0a5aRQcpfR5yXhlU/VVxhy/EFafp+ukLiDnPQCmXokRdfOBYEKGnSS0
 SLwqR8sKlWsP2Q4h6P6/+1DRHuZXmuMnQS3HGwBDNfgxW8dj9VviGrYpiGgWpVPVin7o
 aT7OaDuZvY0RhBQHcbPl7G/wPvlvSHTGSXIgCKtwpJeGisGAwgzB5VgoCGIlMsWNpBp1
 8ScSqrhNQN2z1C9/xzbYB59Hek1dNXB4MafCvphBFHA4gKDAJJn+FDq68EcTfxwGvXeX
 1vDmjcL++CSV5OEZUqooSkVqjmjxMXsw+UNMrGDR3osb9eUOqLRgGOA+8Pn8MpZlZbd2
 nZdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU99Fj2xZkPGBpvjilWgrlicw4AIdVYdlxHbe9TlrtfQnp5N0Dvut92mUfIf9F29CKHe3FlkolCls8=@buildroot.org
X-Gm-Message-State: AOJu0YwQxvcjCJm9a201TjTJSXRasc/huyuxWlzFnqSj3MDUnsp5BjAo
 zAIezO84UoxwgBM1eFabIba/Q0HeQ/45CO2+0jhln5fB5EwKN5k2pm4YNRAU1FT7CqGgUbnnGor
 I
X-Gm-Gg: ASbGncuWKWTNMNqMX8F6/xkwpOAo990b1OpecEO6FqjPWNSDj94T9sApGTm6J3TL0+g
 nuX3lCApqQhtgIflIb6VrZSo3v/gf+n7bFbOZXswQPWJXFcniZPFly++DcdvY79KWqnLK1hQQsQ
 hxqXxlUZVApbeBV1bWU9QOqyAnTfymdsboa5agS3Xcdva9jC7W/QY0YaCvRNHKYpuvJXdyTebe6
 ViS8GSVulwf7ttgMwXRG++OXamywNcqIV8RX3KcRimtAPwaTSjggKdGftMWe90iSU0mes8M4eut
 2pRvbT7K8loDsjjt4TgSa3tHPEbKPQT+ZWo=
X-Google-Smtp-Source: AGHT+IEBpXea3edcvfZiLxbrI1f1feE+8obLBEEb/vyDY7w+lB4HBrXP7MkJylp5Uzp1hj/+SOVRYA==
X-Received: by 2002:a17:906:7955:b0:ab2:f816:c5e1 with SMTP id
 a640c23a62f3a-ab38b1b4659mr4053673366b.1.1737984249828; 
 Mon, 27 Jan 2025 05:24:09 -0800 (PST)
Received: from wkz-x13 (h-79-136-22-50.NA.cust.bahnhof.se. [79.136.22.50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6aa032d26sm137752666b.80.2025.01.27.05.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 05:24:09 -0800 (PST)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: Lance Fredrickson <lancethepants@gmail.com>, buildroot@buildroot.org
In-Reply-To: <c76fd0e7-b375-43b5-813f-f7e78b180447@gmail.com>
References: <20250126225438.856283-1-tobias@waldekranz.com>
 <c76fd0e7-b375-43b5-813f-f7e78b180447@gmail.com>
Date: Mon, 27 Jan 2025 14:24:08 +0100
Message-ID: <87r04o5r0n.fsf@waldekranz.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waldekranz-com.20230601.gappssmtp.com; s=20230601; t=1737984250; x=1738589050;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DjDJpWy5afXfmtM4rlCxO8aipE6nGFguaKNrNRgo2Mg=;
 b=cShsje6fxY08Ci2766+HOTmzBZRKDsGJ/yE+Hlw0n7+cmzRylyV8/jygR91wfSGUPQ
 baHoNYwWNg8BlR9bnJzTz5NN8xkKHfUoLySMtcHNetm7rzYmKVVGaFQYffJxZJbdxHHC
 PUv+62jZlqzg9o9vwXyiVEwaFmpWYnDEy8S9CgSgQ4T6XkYD4ABHFEDcHkuFlh2wnlmT
 KIimkzR1oG8oycqQcw+qEm6aKBOxVIH1AAdZBSuNG0ZEpHmtMXrqw0tWC/gtnYeHKJ8u
 SOy/Wt0UpHA7spno9Di0LsABe3NbOjRc9HLZe+FDy5KN+rmdQlBGxNjVihwt5XgvSw6r
 HOEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=waldekranz.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=waldekranz-com.20230601.gappssmtp.com
 header.i=@waldekranz-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=cShsje6f
Subject: Re: [Buildroot] [PATCH] support/scripts/fix-rpath: Reduce overhead
 of parallelization
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

T24gc8O2biwgamFuIDI2LCAyMDI1IGF0IDE3OjEwLCBMYW5jZSBGcmVkcmlja3NvbiA8bGFuY2V0
aGVwYW50c0BnbWFpbC5jb20+IHdyb3RlOgo+IFRoaXMgbG9va3MgbmlmdHkuIFdhcyB0aGVyZSBh
IGNoYW5nZSBwcmVjZWRpbmcgdGhpcyB0aGF0IGNhdXNlZCBpdCB0byAKPiB0YWtlIGxvbmdlcj/C
oCBJIHdhcyBub3RpY2luZyB0aGlzIHBhcnQgb2YgdGhlIHByb2Nlc3MgdGFrZXMgYSBtaW51dGUg
b3IgCj4gdHdvIGZvciBteSBwcm9qZWN0LgoKVGhlIGltcGxlbWVudGF0aW9uIG9mIGZpeC1ycGF0
aCBpdHNlbGYgaGFzIG5vdCBjaGFuZ2VkIHJlY2VudGx5IEFGQUlLOwpidXQgc2luY2UuLi4KCjAx
OTk3OTZkYzkxNyAoIk1ha2VmaWxlOiBydW4gUFBEIGFuZCBSUEFUSCBmaXh1cCBpbiBob3N0LWZp
YWxpemUiKQoKLi4udGhlIG92ZXJoZWFkIG9mIHJ1bm5pbmcgaXQgaXMgbW9yZSB2aXNpYmxlIHNp
bmNlIHdlIG5vdyBoaXQgdGhpcyBvbgpldmVyeSBidWlsZCBhbmQgcmVidWlsZC4gQmVmb3JlIHRo
ZSByZWZlcmVuY2VkIGNvbW1pdCwgaXQgd2FzIG9ubHkgaGl0CndoZW4gbWFraW5nIHRoZSBwcmVw
YXJlLXNkayB0YXJnZXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
