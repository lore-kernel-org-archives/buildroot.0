Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB93C3ABB0
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 07:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C91FC406ED;
	Mon,  5 May 2025 07:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUAXVkhi2m43; Mon,  5 May 2025 07:58:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0211E4073C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0211E4073C;
	Mon,  5 May 2025 07:58:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B3DEEA
 for <buildroot@buildroot.org>; Mon,  5 May 2025 07:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AD028128E
 for <buildroot@buildroot.org>; Mon,  5 May 2025 07:58:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOM1sxSBgBjU for <buildroot@buildroot.org>;
 Mon,  5 May 2025 07:58:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 87B5E812C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87B5E812C8
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87B5E812C8
 for <buildroot@buildroot.org>; Mon,  5 May 2025 07:58:25 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso24317965e9.1
 for <buildroot@buildroot.org>; Mon, 05 May 2025 00:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746431903; x=1747036703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CPNAo1sU/rYxxvhxJX32PeSek31dl/6v3LtA7irXKWc=;
 b=QhydrwhPJ5vFyl5aUBrPlVaUTiNbYv4iNHEJjBzbSdL83T2N42ENH+TpyAg2WcegKP
 rdsrX8LuJCBCD8qbx+SqA8DRLrV04WJJRCNK+Coio3n/LOWVRkVyGMIvWklVBzwLqSvb
 GCHi3PakxdiwvI+tN9Lr91lzE5pyQUWmLkB4ykbGW4l6MHDJeIGmKQB5uBNtEW3xyI//
 g+U1SYw4brpI0yl2m5qvDGJAduEuHJZDxyjiAWRsmNug1CHKL0pcIaJs/3y28GjT6p9z
 WcF/cgXII33cfkCuvCFKQB7qX2pQAIVTZOIGxBLBdMR5x3XAnpFnFVz0XkWDWh5j11d9
 BTOg==
X-Gm-Message-State: AOJu0YynOHnzyW2JUbJ3tMYA/7r5OHPTW2ZEjhgYWFjaSUmoBIGjninI
 eU3263gtZtB/qjLqfCkyMl6vVplbEHmS+fdTxyycEwf8EEV9kD2WicQbEg==
X-Gm-Gg: ASbGncsfYexpWE8HzsEhhIgUBNSOhvg69QzZucDxVVkSY/3UcXYaP5dH8akqurp5ijy
 0GsfVhuz0OS38aOfA6one1Bf9Ci/ZowfcAIn2EWD7CBflsqCeExEROQDUIdnF32lZ5K/qu7QSZd
 bQho9FffdqsoGlCA0bwihdN9RTqZFFKmCBiSe8ayHxY0Oxc6XaBqXI8iYB3MbdEk0pnSBHUuP2o
 j5aegWuMGJjCCki24qDbSVK1ZztM5ODC8rbUe1cA2E1VZ0Vol5ctHmVTHBlAAsFxhgpfrx4icqs
 2aEepC6X0Zsfa4kbCrl2OtAW8yEGf12fkaok6V0k5Ze360e/kV7A98pO+c06uCNRo7HEqpuz8mJ
 BXoqx
X-Google-Smtp-Source: AGHT+IEJTVc2wzuwEn0biOArvkjrZx17uDM63X3QX9SmMTp7ONWhXYcJ0JjI4YjHwtHv2i3oAjSx8A==
X-Received: by 2002:a05:600c:8519:b0:43c:fe15:41dd with SMTP id
 5b1f17b1804b1-441c48b0248mr49975815e9.6.1746431903150; 
 Mon, 05 May 2025 00:58:23 -0700 (PDT)
Received: from cuervo.intranet.jlsalvador.online ([207.188.149.64])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2ad762fsm171449135e9.5.2025.05.05.00.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 00:58:22 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>
Date: Mon,  5 May 2025 09:57:13 +0200
Message-ID: <20250505075712.851378-3-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505075712.851378-1-salvador.joseluis@gmail.com>
References: <20250505075712.851378-1-salvador.joseluis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746431903; x=1747036703; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CPNAo1sU/rYxxvhxJX32PeSek31dl/6v3LtA7irXKWc=;
 b=WukBC3JtqQJecbY1NpVeDiIB/GxB9lKU2R2E+RxyalVorGu1DLQvvr1pFxWeKClp2h
 DH3/1chWgAPkwVQYRf7J4m7AhmNphMt5SZ4wIxTk4t3SToTIw+P0lABHpE75KCQQ17eN
 XtAum4mbAL4KR/g63obdo2Mo739Z2wimPlVjwF5X7YFZ5yQhhNKFjImPYwssf2lPDEUc
 Oldk4Uc8OauK7IASLn9oIkg6qiH11Lq31iQJWaEsn5e3pOy0OrPDKYfxQXb9SLFlg3Uk
 wJigx7bOM6gCj5iNpn7P0VQ16SZV6C4biH9kCg+Mjsq6Z/2mYeoFNh1KvsqUgCspgV+J
 d8/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WukBC3Jt
Subject: [Buildroot] [PATCH v2 2/2] package/zfs: add upstream patch to fix
 musl
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

VGhpcyBwYXRjaCBmaXhlcyB0aGUgYFNfSUZNVGAgdW5kZWNsYXJlZCBlcnJvciBpbiBgc3RhdHgu
Y2Agd2hlbiBtdXNsCmlzIHVzZWQuCgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9y
IFJ1Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4KLS0tCkNoYW5nZXMgdjEgLT4gdjI6
CiAgLSBBZGQgVXBzdHJlYW0gVVJMIHRvIHBhdGNoCgoKLi4uMDAxLWZpeC1TX0lGTVQtdW5kZWNs
YXJlZC1hdC1zdGF0eF9jLnBhdGNoIHwgMzYgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDM2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3pmcy8w
MDAxLWZpeC1TX0lGTVQtdW5kZWNsYXJlZC1hdC1zdGF0eF9jLnBhdGNoCgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS96ZnMvMDAwMS1maXgtU19JRk1ULXVuZGVjbGFyZWQtYXQtc3RhdHhfYy5wYXRjaCBi
L3BhY2thZ2UvemZzLzAwMDEtZml4LVNfSUZNVC11bmRlY2xhcmVkLWF0LXN0YXR4X2MucGF0Y2gK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMjMzMTE4ZjdmNgotLS0gL2Rl
di9udWxsCisrKyBiL3BhY2thZ2UvemZzLzAwMDEtZml4LVNfSUZNVC11bmRlY2xhcmVkLWF0LXN0
YXR4X2MucGF0Y2gKQEAgLTAsMCArMSwzNiBAQAorRnJvbSA4ZTlmY2RhYzZmN2JiYzRlYzkyZTg5
YjhjZGNlMWRjYzQwNGYxOTk5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogPT9VVEYt
OD9xP0pvcz1DMz1BOT0yMEx1aXM9MjBTYWx2YWRvcj0yMFJ1Zm8/PQorIDxzYWx2YWRvci5qb3Nl
bHVpc0BnbWFpbC5jb20+CitEYXRlOiBGcmksIDIgTWF5IDIwMjUgMDg6MTA6MDggKzAyMDAKK1N1
YmplY3Q6IFtQQVRDSF0gdGVzdHM6IGZpeCBgU19JRk1UYCB1bmRlY2xhcmVkIGF0IGBzdGF0eC5j
YAorTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1V
VEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitgU19JRk1UYCBpcyBkZWNs
YXJlZCBpbiBgc3lzL3N0YXQuaGAsIGJ1dCB3ZSBjYW5ub3QgaW5jbHVkZSB0aGlzIGhlYWRlcgor
YmVjYXVzZSBpdCByZWRlY2xhcmVzIHRoZSBgc3RhdHhgIGZ1bmN0aW9uIHdpdGggZGlmZmVyZW50
IGFyZ3VtZW50Cit0eXBlcy4gVGhlcmVmb3JlLCB3ZSBkZWZpbmUgYFNfSUZNVGAgb3Vyc2VsdmVz
LCBpbiB0aGUgc2FtZSB3YXkgYXMgdGhlCitvdGhlciBkZWZpbml0aW9ucy4KKworQ2xvc2VzOiAj
MTcyOTMKKworVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9jb21taXQv
NjM0YzE3MmVlODlmNTMwMzQ5M2E3NWRjN2ZmNTVlMGEzNTViNTAzYQorU2lnbmVkLW9mZi1ieTog
Sm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+Cist
LS0KKyB0ZXN0cy96ZnMtdGVzdHMvY21kL3N0YXR4LmMgfCAzICsrKworIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKKworZGlmZiAtLWdpdCBhL3Rlc3RzL3pmcy10ZXN0cy9jbWQvc3Rh
dHguYyBiL3Rlc3RzL3pmcy10ZXN0cy9jbWQvc3RhdHguYworaW5kZXggODk5MzlmNmVmYjQwLi4x
YWNjN2U1OGM1Y2UgMTAwNjQ0CistLS0gYS90ZXN0cy96ZnMtdGVzdHMvY21kL3N0YXR4LmMKKysr
KyBiL3Rlc3RzL3pmcy10ZXN0cy9jbWQvc3RhdHguYworQEAgLTEwOSw2ICsxMDksOSBAQCBfc3Rh
dHgoaW50IGZkLCBjb25zdCBjaGFyICpwYXRoLCBpbnQgZmxhZ3MsIHVuc2lnbmVkIGludCBtYXNr
LCB2b2lkICpzdHgpCisgI2lmbmRlZiBTVEFUWF9ESU9BTElHTgorICNkZWZpbmUJU1RBVFhfRElP
QUxJR04JKDE8PDEzKQorICNlbmRpZgorKyNpZm5kZWYgU19JRk1UCisrI2RlZmluZQlTX0lGTVQg
MDE3MDAwMAorKyNlbmRpZgorIAorIHR5cGVkZWYgc3RydWN0IHsKKyAJaW50NjRfdAkJdHZfc2Vj
OwotLSAKMi40OS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
