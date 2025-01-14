Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4860FC02183
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 07:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BDA64122E;
	Tue, 14 Jan 2025 07:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wk3F_i6U6pva; Tue, 14 Jan 2025 07:30:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF40C41259
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF40C41259;
	Tue, 14 Jan 2025 07:30:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B4C0B8C
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8758C40A1D
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0QCxmBrkUbz for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 07:30:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B94840A50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B94840A50
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B94840A50
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:48 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3d14336f0so8842051a12.3
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 23:30:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736839846; x=1737444646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+UvUoW2IX0+GgjgCz+e1RDUpG6DRqP+hKiEKLheifsI=;
 b=YOe1hDXXD6+1gB/M9Lc+8PUordBSgZ01Z/z8HPpgX9gPBMyTR0vl1KkIlYj2N+ZnsL
 yeBbVguV71qyQXCLTpGsO6lXg0T85/LqHYQ7rC7Xg9/b9OWLlvRR+stCI3vJYc4BY3fM
 lxxMqwwwgjV/bQVoE7oHPrfPlEE9kjXdR6MSVJCoqifL5Pv18yEZkXFaNymGGJOIW3aE
 1lsfQ+74zqUXfDwU6fftUnS5N4wrT0ygPmnzibs/YVLTNVKIuys5bqOhyGzDHyWusXFr
 YyEInIErY/CGeXzwumjTMvsNia/WuGLT9I676qkPTAncbRN8S3wDv6E6ujaOLFBBouns
 FgxA==
X-Gm-Message-State: AOJu0YyZcliqVbv0aC53p6/BaiWtO9afmMXnFlyH5B9IJ6wHEGEZGidV
 D5dr2BnxRytLfXcUEg6feTGvs2zHvvg4K4NcDvVbU+dtEaAZsk5ZTpuT/w==
X-Gm-Gg: ASbGncvO0obG90ebOp4kTlSR5r8mvXGGyFVSOsBfmMFT3chARKAKlEACgrV9L4KqhMM
 JueeFyFYYfJrc8UTO+rc8Dv8t6iDvQD9imocLkHx8TnpHTwiJ08A70Ur5pefmWt2Xgup85PnY+h
 CrvHAI4TrJG0nmqq13RF58ojBbAVCEVVZv4Sq+803nxskrGpe7SqhOJ0gJnCYr7TJjKrehCuBEv
 v42Hk1WaMqjRbZnqENb8v2z/XSWi8Ll12v7ssEP1VTwEDHUAHEJdy73x3liVq1x7JkED8YtHw==
X-Google-Smtp-Source: AGHT+IEj3K7pTbcEtkvkbjP5mpFQpWEeqEcqmTpxZ1uSVwt4dUjX25eTvOLSib4OU8aJky7bNvTiIQ==
X-Received: by 2002:a05:6402:3226:b0:5cf:d078:c9dc with SMTP id
 4fb4d7f45d1cf-5d972e647c5mr20859673a12.22.1736839845955; 
 Mon, 13 Jan 2025 23:30:45 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99046d822sm5618777a12.56.2025.01.13.23.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 23:30:45 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2025 08:29:56 +0100
Message-Id: <20250114072947.284965-9-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250114072947.284965-1-heiko.thiery@gmail.com>
References: <20250114072947.284965-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736839846; x=1737444646; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+UvUoW2IX0+GgjgCz+e1RDUpG6DRqP+hKiEKLheifsI=;
 b=INP5BOTkWS0qX/lfL0GyIJ5o6cv6947dgxTSSIC2EMZak5Se09OzkiEkW4xZykI+k2
 yXZxSuQhQ24lgw2LaFwx8MjFz1omnaw0lHg0N4W4GocXAD+cW82J+UZtrbmb67+ar7n7
 /QyozMrxtwb5NGNeY4gOYIrE+eaU9fFjpqs5+tKZodvPDkR1SxCJwJfdIu23eM8OznbW
 4vxVnwQarQljm5eKO4jyqT5fomvlOAhaHY2KgtLNUeFqsxKlm4AWLuMDlviltQxLeLJ8
 VhoqX5hPYcdLD9N+BiYTo1J5PfGNk2AL5CB6TdYGD8dBDjFE6jBwJ/RDauj5hf8qDseT
 2Kdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=INP5BOTk
Subject: [Buildroot] [PATCH v5 8/9]
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
