Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8DFE77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 10:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A24860AF5;
	Mon, 30 Dec 2024 10:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2iAUEQ2DriJ; Mon, 30 Dec 2024 10:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA25A60B15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA25A60B15;
	Mon, 30 Dec 2024 10:36:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FE03CA
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD46D407D4
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUpYE5_dvY7C for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 10:36:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED40B407D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED40B407D1
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED40B407D1
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:36:14 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5ceb03aadb1so12913844a12.0
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 02:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735554972; x=1736159772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+UvUoW2IX0+GgjgCz+e1RDUpG6DRqP+hKiEKLheifsI=;
 b=qqHgdkZCkoYPhJ58zq/XtisC1aRZYALx6+mNDj4n9u2ROc/Hdlww3zcg+sO2CFXZpf
 Gu7jvIj77DSZ8bt7Ec4CrPbIiujvw2QGwf7HLMU+kJA6mfcJJKiHP+EdYJnlP3jFsUK2
 jLrTGnMplqsLVZsOnlZ4RzDP/uEny53IvZ4aeQHCQ/UfDLGintEonXDKJAwWO1cX0ID5
 bnRWvd2X0DBdT4CodSc/7MiklGUe2AxkjEF32J6kHAx+li1qgk66WmRTTGeOF0No/SZh
 fe0Eqz8X8Zulgm9yxcZN7teQ5o+cOeH5XJwL4f+ctABY58Twk+GR6BAE64omEJA1Oawk
 MmxQ==
X-Gm-Message-State: AOJu0YzmQ7VoKU/5gDGXadAEz0UweYszIkNr5yN3I8FzVlbVaVZcuLY9
 j2jsGLt08AlMuAtktxru6two5t5hA9YcOr9fXrC9eii3EjpFX3hy4tzd9Q==
X-Gm-Gg: ASbGncsE32tHlWcup864p5oCJvfJ1X0BlHfMbwwBgAob1Viudk3S0GJTDNrmWtvv+n9
 cJZuHESpQ4W2XXUSM/3eQPYZ8KNZMX3/Pzbgh+dAJVQkW/yTyUbGHRtgR+KTJ8aP/jn2HNvq5Qq
 vxRJ4viNJvoGq+yE0uNXaT0SlGCplCFxd5Ka2SGTGAx0IdKwCGA09pl3FlU3JFvYiQlybnKrE5E
 ff723fBuunKcmEDJxDJ/2VFnjL59/m2AF/fxuxsCIYmx9WwBPwlseO1bw7uwBL0tADVFlpG
X-Google-Smtp-Source: AGHT+IGG/7UJqSwbqmtip6z5b0p2e3nYr1l/OlKTFD5kcQLD+41Vrm6wtkVE/yntazH/FJnMvdRnmQ==
X-Received: by 2002:a17:906:478f:b0:aa6:6c46:7ca1 with SMTP id
 a640c23a62f3a-aac27038e93mr3088205466b.10.1735554972138; 
 Mon, 30 Dec 2024 02:36:12 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810b:5a04:dd00:18f9:775f:be73:a0e3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e89617bsm1437781766b.76.2024.12.30.02.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 02:36:11 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2024 11:35:38 +0100
Message-Id: <20241230103534.671602-7-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241230103534.671602-1-heiko.thiery@gmail.com>
References: <20241230103534.671602-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735554972; x=1736159772; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+UvUoW2IX0+GgjgCz+e1RDUpG6DRqP+hKiEKLheifsI=;
 b=jZ90bfTwR8Ek9pmouGTEcEN1txCbD8FlR8nr1i5ksjA4GBiYvC64NX77hj77n6OA0D
 8sUqvHzys4DVQp4E1GBqAxF/hPA9nXsLqXdXQ6ocYkkoTx2FgSvD1HI1iypqfVVxzOCq
 NjMjiMQUZhufPavay0QD1EVBUvDWyi9uQSLtl49QKkaCSyThI0YWDFtW8nIZDUAeEZI2
 be1oVBjkL7cnQhJSBd7DJ/bh0dulRxlIc6WAnuBecq5SAw+GCs/wMadkKvHNHVjzWh/p
 U5UYKu+wnuXaxA6udiUzE2UgToLech4XUG+9VJ2O5fvc06jfD+s6FcFcJKX+xdW74VVI
 3cXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jZ90bfTw
Subject: [Buildroot] [PATCH v2 6/6]
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
