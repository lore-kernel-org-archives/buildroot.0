Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1C8E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 11:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35A6B8101B;
	Mon, 30 Dec 2024 11:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rsE-Z9CfNGZ; Mon, 30 Dec 2024 11:38:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43CB7812D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43CB7812D2;
	Mon, 30 Dec 2024 11:38:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3506EC8
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DF68407D7
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7f1f6rp6JU_O for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 11:38:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5132940732
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5132940732
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5132940732
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:38:18 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aae81f4fdc4so1347857466b.0
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 03:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735558696; x=1736163496;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+UvUoW2IX0+GgjgCz+e1RDUpG6DRqP+hKiEKLheifsI=;
 b=PjnX8fs38ZCyR4iMQomQY+kkWnhv2BUBrTfLcV2IpZZ/1I0OmjTA6+unNIKXDLpvzR
 XEPUZDhCL/Q9+CY3I6NfNIc2FfBOagFyZt7alVVMr1+VhN724gNPHgPmy3SM4wkvhDGK
 8AD/ErtxI7n4S8pbOFaTsW1fNCoE2AjWesRbTU2qR43KlcvuncVHjH8bsv6q4wN5kcAy
 ayV6QFEF7XjqgLLysPMi1vS/uuMS172mV7lVEnstQus4cMuK8S3mqxjQTR2+YHK8pDLj
 b6fw25YHWPdof26ns4h7Hkx0VyEhhDJK0F69LkDbpanBI9M7w+ASF1s6zePb0263QA4D
 PZuA==
X-Gm-Message-State: AOJu0YwDQf6qiu0YQO1wK9QO3yHPTrl8BDnwxPURiFicVWiamOM/27u0
 JceqNIYUpX8eROB1jAbFOix4QLF8UgkluHsJWR6Hl7kB/hsIifWHJTt4Xg==
X-Gm-Gg: ASbGncua1bw/vPT/7VVr8yBRenAOcXHXFxaQnPUZw2M7X9FKsG1qIK7NUe41XDiu43H
 q87t5FZnF10LPOKDz1OHJdNO7baJ9UgFqOpEnxYhPTIztiiGQv6c2PWjO0tgKOgOOIcQwUYHFFl
 vKh5M8FYlpwePyIrZ3GH3OoKPw/GQV/vGBXjuuI9ukNpiC5AwGMur2Bs7CfLmo0nQMN5k2t7BMZ
 sYqaIbl8GsOg1xHOYisJPWhgmUO5iDTa3lBKVS5UzP281zKqO885kNNPpy+aMUGJYeU7u3T
X-Google-Smtp-Source: AGHT+IHcMTrWRzSryz7pJHLZUyPUm6Hy6ZSoes7/5mfcvKNNimrNUEXe1qlxu7FjpNgxhm51vMUl9A==
X-Received: by 2002:a17:907:2dab:b0:aa6:aa8e:c89c with SMTP id
 a640c23a62f3a-aac335626acmr2877131966b.39.1735558695760; 
 Mon, 30 Dec 2024 03:38:15 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810b:5a04:dd00:18f9:775f:be73:a0e3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe46d5sm1471216666b.103.2024.12.30.03.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 03:38:14 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2024 12:37:17 +0100
Message-Id: <20241230113710.679717-7-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241230113710.679717-1-heiko.thiery@gmail.com>
References: <20241230113710.679717-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735558696; x=1736163496; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+UvUoW2IX0+GgjgCz+e1RDUpG6DRqP+hKiEKLheifsI=;
 b=WrRJp+RDF6IJ0CBYfS05rmQCE+RX7+XdvxU37sAoPvxvsOexPVpu4yV5NC5gH45MPH
 1s71ZQEVwSjrrwJs4mT1eXB/VcqMQVyEUTBmpN6svfnKF+FQ1xhKGZQSsBdW4lK0TJ+C
 CLcpQwbDzpDSqBXhktX1801e4O1ATSU4TaaU/B74N65yEAb87y+KTwCDMkV5PMmGYRLP
 yABGYGtqumoVlDpGwA4UgNOHdtZB13Yfod23rvMprHHcHzmocA0XVXcCe9WozHtbwHhf
 zLW3TFvJhOm7ArXW8ndea4Hkt38yZs1hqAR+Geb43yRYGOD0WbH6WLWwWJf4TI+Q72TQ
 Q2Pg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WrRJp+RD
Subject: [Buildroot] [PATCH v3 6/6]
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
