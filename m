Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C76E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 13:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B572A60757;
	Mon,  6 Jan 2025 13:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GzNpQFRRjxJg; Mon,  6 Jan 2025 13:43:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97A8960826
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97A8960826;
	Mon,  6 Jan 2025 13:43:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C9D31DB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAB8E402DE
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIOTg86YIp3P for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 13:42:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 92FE840216
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92FE840216
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92FE840216
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:55 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aabfb33aff8so2573478966b.0
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 05:42:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736170973; x=1736775773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+UvUoW2IX0+GgjgCz+e1RDUpG6DRqP+hKiEKLheifsI=;
 b=S63n5BGXEG0vpT23uLzDxLQekQgRTpbHfUnaHR81xpOYQLTHAMyP18CMoe1iR5k8PP
 9qM1gUORry48D9javicVxYlhDB2g18tnClnjvdRQBsEcpFFyBmk8Xq9YVh3DP6CgF+2L
 qPu+7NyMm6knPA0l76VGnI/CwNnhAnYZIs70Hkn64l6/QyKlJKZQNkbryZPp1I6fxqXZ
 CMVea37LZRlVy+RLzbvbkNTDe5LhvZQEu+1vwTR4XWI0qHOopdwkiEQp6xiskbm98h/r
 eYXTiZArOi1ExcMagFJcoNRfwqpm9D87tKsFSF1y8BmqqRNd/KSiFUJoWTn8LC3admxs
 q+vQ==
X-Gm-Message-State: AOJu0YzCwJmaUPbfRT1VldjvJi0+BejGf5met4LSvTsGPAMnomrRIsHT
 I4Mr+UETk4RW3xIhv5Y/53nQVZyV9Lwavvelv/C0HUzMqrbKZiJ1kLeg/w==
X-Gm-Gg: ASbGnctcas4xb8fPbGy8rbjELc3QPyATQfxTjemylXaF74ZgnHpQQTuxhk1+ATlgmWq
 Bk0QLqyGCSYTto7B6mrkyGAtCkk1Zk0nuvukzBUAGntQg/DRlttIMnzMH8GHABmUKWjCArIy+Mm
 4Jsz2llSwU6u2HyE5KEEpwwyNxqT7q/yw12n2FEd3+Pq5iB38i7uZTiv2xiIDm628sGS/xR/Ga2
 bafsbOopE9BWmxytHVNlJYI5R39QOONgjYlhdSLnIMxBQi3VBJ7eTlaXUq9cXgpRYdR8whKHA==
X-Google-Smtp-Source: AGHT+IFQyFh3cV/zIdpSUpH4IZUb7FpxM5lCibwtX+vEGAyyNKhDVDr/aSDjdJVyunaBT1PuUhmJqw==
X-Received: by 2002:a17:907:1c98:b0:aaf:afb9:887d with SMTP id
 a640c23a62f3a-aafafb9a436mr1066122466b.1.1736170973010; 
 Mon, 06 Jan 2025 05:42:53 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae74e4sm2243847766b.91.2025.01.06.05.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 05:42:51 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  6 Jan 2025 14:42:21 +0100
Message-Id: <20250106134219.1914954-10-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250106134219.1914954-1-heiko.thiery@gmail.com>
References: <20250106134219.1914954-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736170973; x=1736775773; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+UvUoW2IX0+GgjgCz+e1RDUpG6DRqP+hKiEKLheifsI=;
 b=k4FVQiUPRXwO3dF4AvpWQXGmtG8zDquz/zG6FwX8Og7OcPCZ4Ztu9pzH9OvHckztxT
 gmxBBmBNZ7LTtIF8ABvKxLI6eYg9UMvu+k4TZHZatyqL90TuyPTtp2gPq6JboRrFm0yZ
 bK0SBlTLj7tt4Tqio63ikq+qOJFmE6SiVUaavxdJSuDVMnSGuGKFrD6OmsU33ROWh4x1
 cobLYQBBCYR/oMtTbG4GEYYrN2J9kV2ATp7fSqE6jOUOMKqP4i9j0McRyhdbc3A/4Njd
 ia7kS17iW8yVDuckSBaSbzxxdAvLd8yweoJTIFQZSiGP52+MF34kW6vWGMSCYqtow2lx
 409Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=k4FVQiUP
Subject: [Buildroot] [PATCH v4 9/9]
 support/testing/tests/package/test_netopeer2.py: add new test
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

U2lnbmVkLW9mZi1ieTogSGVpa28gVGhpZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29tPgotLS0K
IERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIC4u
Li90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZXRvcGVlcjIucHkgICB8IDQwICsrKysrKysr
KysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbmV0b3BlZXIyLnB5
CgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggMzUzNDQ1OGE5Ni4u
MzczZTBlMWY3ZiAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0x
Mzg5LDYgKzEzODksNyBAQCBGOglwYWNrYWdlL3JhdWMvCiBGOglwYWNrYWdlL3N5c3JlcG8vCiBG
OglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3lhbWxsaW50LnB5
CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl95YW1sbGludC5w
eQorRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZXRvcGVlcjIucHkKIEY6
CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfc3lzcmVwby5weQogCiBOOglIZXJ2
w6kgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+CmRpZmYgLS1naXQgYS9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25ldG9wZWVyMi5weSBiL3N1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfbmV0b3BlZXIyLnB5Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLmNiY2FiYTA0OWUKLS0tIC9kZXYvbnVsbAorKysgYi9zdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25ldG9wZWVyMi5weQpAQCAtMCwwICsxLDQwIEBACitp
bXBvcnQgb3MKK2ltcG9ydCB0aW1lCisKK2ltcG9ydCBpbmZyYS5iYXNldGVzdAorCisKK2NsYXNz
IFRlc3ROZXRvcGVlcjIoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKKyAgICBjb25maWcgPSBpbmZy
YS5iYXNldGVzdC5CQVNJQ19UT09MQ0hBSU5fQ09ORklHICsgXAorICAgICAgICAiIiIKKyAgICAg
ICAgQlIyX1RBUkdFVF9ST09URlNfQ1BJTz15CisgICAgICAgIEJSMl9QQUNLQUdFX05FVE9QRUVS
Mj15CisgICAgICAgIEJSMl9QQUNLQUdFX05FVE9QRUVSMl9DTEk9eQorICAgICAgICAiIiIKKwor
ICAgIGRlZiBydW5fbmV0b3BlZXJfY2xpX2NtZChzZWxmLCBjbWRzKToKKyAgICAgICAgY21kID0g
Im5ldG9wZWVyMi1jbGkgPDxFT0ZcbiIKKyAgICAgICAgY21kICs9ICJcbiIuam9pbihjbWRzKQor
ICAgICAgICBjbWQgKz0gIlxuRU9GIgorICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKGNtZCkKKwor
ICAgIGRlZiB0ZXN0X3J1bihzZWxmKToKKyAgICAgICAgY3Bpb19maWxlID0gb3MucGF0aC5qb2lu
KHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAicm9vdGZzLmNwaW8iKQorICAgICAgICBzZWxmLmVt
dWxhdG9yLmJvb3QoYXJjaD0iYXJtdjUiLAorICAgICAgICAgICAgICAgICAgICAgICAgICAga2Vy
bmVsPSJidWlsdGluIiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIG9wdGlvbnM9WyItaW5p
dHJkIiwgY3Bpb19maWxlXSkKKyAgICAgICAgc2VsZi5lbXVsYXRvci5sb2dpbigpCisKKyAgICAg
ICAgIyBUaGUgZGFlbW9uIHRha2VzIHNvbWUgdGltZSB0byBzdGFydHVwCisgICAgICAgIHRpbWUu
c2xlZXAoMikKKworICAgICAgICAjIENoZWNrIGlmIHRoZSBEYWVtb24gaXMgcnVubmluZworICAg
ICAgICBzZWxmLmFzc2VydFJ1bk9rKCJscyAvdmFyL3J1bi9uZXRvcGVlcjItc2VydmVyLnBpZCIp
CisgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soInBzIGF1eCB8IGdyZXAgW25dZXRvcGVlcjItc2Vy
dmVyIikKKworICAgICAgICAjIFJ1biBDTEkKKyAgICAgICAgaGVscF9jb21tYW5kID0gWworICAg
ICAgICAgICAgImhlbHAiLAorICAgICAgICAgICAgInF1aXQiLAorICAgICAgICBdCisgICAgICAg
IHNlbGYucnVuX25ldG9wZWVyX2NsaV9jbWQoaGVscF9jb21tYW5kKQotLSAKMi4zOS4yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
