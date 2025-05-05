Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F75C3ABB0
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 07:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAD24401B0;
	Mon,  5 May 2025 07:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYUQNY4fP6KM; Mon,  5 May 2025 07:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 238F3401CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 238F3401CF;
	Mon,  5 May 2025 07:51:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FC4116B
 for <buildroot@buildroot.org>; Mon,  5 May 2025 07:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EB7E60845
 for <buildroot@buildroot.org>; Mon,  5 May 2025 07:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQBcGGJqJ5Jx for <buildroot@buildroot.org>;
 Mon,  5 May 2025 07:51:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1399260825
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1399260825
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1399260825
 for <buildroot@buildroot.org>; Mon,  5 May 2025 07:51:41 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso37184295e9.1
 for <buildroot@buildroot.org>; Mon, 05 May 2025 00:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746431500; x=1747036300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cBTPgSXUPlMirwJkampM4xXcOGfNzmYvrINDpobenEc=;
 b=nC/CkaiRu+HLYUXU6wgY5C9TW6ANfEdJPHx/AqxwVv0uopPmlpoQnVeuF3JQ0WEAB/
 VvbCdQy4LA3Wsx+m/TP8iMiitYkd6YGEGvGKw0kIfTuk1J4TrwgeEvewU4OtsEHDmVIu
 xj43SnB3nk9DvLA1HDa+yd2fRu3GFLNcJTQpkTdCgVzX9z3jRrzLcCW2WFnjc3ZKKNEY
 su4FXP8Jv6AXIgUMh4J2q97Il3WoivjvrrzXTgL9ph7UNz6zTE1llHe1FkufO62l+kFG
 LiG9il0wISB1pWFWemWjNqQ8yNNU0PePfN/tMbJ4WS2PuQmogmjvEZVkyX4V10J8glgN
 0bMQ==
X-Gm-Message-State: AOJu0YxWSj7e+M7pIKLZuNd/31LeMv/gdZmQH1gqljuG/z8nEcV6zemM
 CdZZH2718ZwRURs/mLr+yvmNxnrdYU4H/bAtp2rjPtui4ijlvPwk8jYHbA==
X-Gm-Gg: ASbGncutm0SBlcLTH3QjzkFjSXnfRnEXNRZCfxmq2a0v6mdsQOty65TVhOD+J5i20Xa
 vSSBTu/c3NaGew7aj7Gh4dT5aQllIPbdSg+ozA9x7dtuvTrUGUtwARo07yDEiKagRRpplyx+Owf
 dNqogEcMzyAfEGzovtCPIwBJeqIYoCqOFbMhwue427E/OnZ+aQnNTw0jtzMiMIW7HrXBPbm9Ih5
 FEMFB0jsrPJ7p978t7BZ39pcqiK2Bs0t0i2DPdHaSr3IwlFxNM/rt6R2ElLSUK92m23JpjNG6SH
 shJphj3Hww5pL8xjKQZDi4jST8iToJypQLW14WiZf1mHG7a9OYtV5Hlm1LTD/PDvELaFKigreAX
 tQy/e0+l3q19DOLA=
X-Google-Smtp-Source: AGHT+IHaSp4e6jS6vEjHL6xWOBMa7HrZWjd6gWFRRJgbhyAAvVowujiNqVnN1OBo93eUQ28Vjd0c5A==
X-Received: by 2002:a05:600c:c07:b0:43c:fe9f:ab90 with SMTP id
 5b1f17b1804b1-441c4937630mr44869765e9.28.1746431499915; 
 Mon, 05 May 2025 00:51:39 -0700 (PDT)
Received: from cuervo.intranet.jlsalvador.online ([207.188.149.64])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441ad813a64sm171191775e9.0.2025.05.05.00.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 00:51:39 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>
Date: Mon,  5 May 2025 09:51:01 +0200
Message-ID: <20250505075105.848775-2-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505075105.848775-1-salvador.joseluis@gmail.com>
References: <20250505075105.848775-1-salvador.joseluis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746431500; x=1747036300; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cBTPgSXUPlMirwJkampM4xXcOGfNzmYvrINDpobenEc=;
 b=hbdk5QyDimk+UT/XKcOta79u0BCA8Z4FJ/xv59ti/qbk0D+f3GEewpQqoZZOhaevKq
 OTv8KFZWhx0E8TzBlX+ZDOOrubxt64RFN1fQuULuEftEDn/fd+LtXeAjh6AOMW6YI5a7
 k2pNTh1HP9l6wf3GjH2Af8W1OEtukx5bs6yU51h9f59mnRceEXlK9SHyTotlaqf1BCUE
 fJVmDPjyg098PlsMDHXOYAIt83nt2zMj2tNTCWxRSknS8E6kzyHLICRGlVcPaIvZ9deO
 +LZOl7qQs69aZhxd/kdr8/rv/EEG1J/cZWRrMfNGFbmuhEZAC22tp0CQWatWTdMDu8rg
 Cl1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hbdk5QyD
Subject: [Buildroot] [PATCH 2/2] package/zfs: add upstream patch to fix musl
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
Y2Agd2hlbiBtdXNsCmlzIHVzZWQuCi0tLQogLi4uMDAxLWZpeC1TX0lGTVQtdW5kZWNsYXJlZC1h
dC1zdGF0eF9jLnBhdGNoIHwgMzUgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDM1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3pmcy8wMDAxLWZp
eC1TX0lGTVQtdW5kZWNsYXJlZC1hdC1zdGF0eF9jLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS96ZnMvMDAwMS1maXgtU19JRk1ULXVuZGVjbGFyZWQtYXQtc3RhdHhfYy5wYXRjaCBiL3BhY2th
Z2UvemZzLzAwMDEtZml4LVNfSUZNVC11bmRlY2xhcmVkLWF0LXN0YXR4X2MucGF0Y2gKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNTEzNzRhOWUzYgotLS0gL2Rldi9udWxs
CisrKyBiL3BhY2thZ2UvemZzLzAwMDEtZml4LVNfSUZNVC11bmRlY2xhcmVkLWF0LXN0YXR4X2Mu
cGF0Y2gKQEAgLTAsMCArMSwzNSBAQAorRnJvbSA4ZTlmY2RhYzZmN2JiYzRlYzkyZTg5YjhjZGNl
MWRjYzQwNGYxOTk5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogPT9VVEYtOD9xP0pv
cz1DMz1BOT0yMEx1aXM9MjBTYWx2YWRvcj0yMFJ1Zm8/PQorIDxzYWx2YWRvci5qb3NlbHVpc0Bn
bWFpbC5jb20+CitEYXRlOiBGcmksIDIgTWF5IDIwMjUgMDg6MTA6MDggKzAyMDAKK1N1YmplY3Q6
IFtQQVRDSF0gdGVzdHM6IGZpeCBgU19JRk1UYCB1bmRlY2xhcmVkIGF0IGBzdGF0eC5jYAorTUlN
RS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAor
Q29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitgU19JRk1UYCBpcyBkZWNsYXJlZCBp
biBgc3lzL3N0YXQuaGAsIGJ1dCB3ZSBjYW5ub3QgaW5jbHVkZSB0aGlzIGhlYWRlcgorYmVjYXVz
ZSBpdCByZWRlY2xhcmVzIHRoZSBgc3RhdHhgIGZ1bmN0aW9uIHdpdGggZGlmZmVyZW50IGFyZ3Vt
ZW50Cit0eXBlcy4gVGhlcmVmb3JlLCB3ZSBkZWZpbmUgYFNfSUZNVGAgb3Vyc2VsdmVzLCBpbiB0
aGUgc2FtZSB3YXkgYXMgdGhlCitvdGhlciBkZWZpbml0aW9ucy4KKworQ2xvc2VzOiAjMTcyOTMK
KworU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3Nl
bHVpc0BnbWFpbC5jb20+CistLS0KKyB0ZXN0cy96ZnMtdGVzdHMvY21kL3N0YXR4LmMgfCAzICsr
KworIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKKworZGlmZiAtLWdpdCBhL3Rlc3Rz
L3pmcy10ZXN0cy9jbWQvc3RhdHguYyBiL3Rlc3RzL3pmcy10ZXN0cy9jbWQvc3RhdHguYworaW5k
ZXggODk5MzlmNmVmYjQwLi4xYWNjN2U1OGM1Y2UgMTAwNjQ0CistLS0gYS90ZXN0cy96ZnMtdGVz
dHMvY21kL3N0YXR4LmMKKysrKyBiL3Rlc3RzL3pmcy10ZXN0cy9jbWQvc3RhdHguYworQEAgLTEw
OSw2ICsxMDksOSBAQCBfc3RhdHgoaW50IGZkLCBjb25zdCBjaGFyICpwYXRoLCBpbnQgZmxhZ3Ms
IHVuc2lnbmVkIGludCBtYXNrLCB2b2lkICpzdHgpCisgI2lmbmRlZiBTVEFUWF9ESU9BTElHTgor
ICNkZWZpbmUJU1RBVFhfRElPQUxJR04JKDE8PDEzKQorICNlbmRpZgorKyNpZm5kZWYgU19JRk1U
CisrI2RlZmluZQlTX0lGTVQgMDE3MDAwMAorKyNlbmRpZgorIAorIHR5cGVkZWYgc3RydWN0IHsK
KyAJaW50NjRfdAkJdHZfc2VjOwotLSAKMi40OS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
