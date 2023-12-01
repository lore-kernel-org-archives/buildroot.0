Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9C1C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 21:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85F6584902;
	Fri,  1 Dec 2023 21:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85F6584902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efwkZzrb1i6F; Fri,  1 Dec 2023 21:23:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDF3D849B6;
	Fri,  1 Dec 2023 21:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDF3D849B6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A82381BF35F
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 21:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C107437AA
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 21:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C107437AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kvI0V9h3s7C2 for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 21:23:25 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 209574379B
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 21:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 209574379B
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32fdc5be26dso1831944f8f.2
 for <buildroot@buildroot.org>; Fri, 01 Dec 2023 13:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701465802; x=1702070602;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=spDsACRB1oEz9uOwrqfldg6MmT1Lh1omotcpNfpv4sI=;
 b=QXfZOs9Yl+3bAuV8XBpoVmpbuPT0896tIzcTdfzYzHSjm1c46BjwD7QcR5PF/VpTbv
 y/72MQ7Wq4V7Dt243YUkb91ZS5RGMufydOqKUU0EdH12g1ASLT5JgyVb9qYctI2/HIj2
 SorC4KymBiJ3xFPrk5+ZHIjHaPAcs3qQwG0uqj5YLsSqnuK7WgXSseq2lMzkspbVKTEm
 eByNiySOxx4XuKkh2ed7W5yEYNbIHh/wHhepssVB3ffQjBZZD2kQWKo9Hfw66jk6UCs7
 xQelSYajcNnieldaxpstOeCJ5KCzViI25OA+SkClXhwh6iq8ExKmQrnbm1fEqqB7HHpc
 8NrA==
X-Gm-Message-State: AOJu0YwDfejXiF1OXGaWLm8JL3AyZFRt3igdB2MtxdCrajQ5nwX0qO3A
 ohHqAeUo9se5yzEBCGfF08hfYtrviLs=
X-Google-Smtp-Source: AGHT+IEH6LNnR9o9K7uWZsHHfqBo+l/JW/4ueskd5nREkEd7NssjJAmWRv1tvx57ZZDE9x5raa668A==
X-Received: by 2002:a05:6000:136d:b0:333:3867:c5aa with SMTP id
 q13-20020a056000136d00b003333867c5aamr148415wrz.20.1701465802338; 
 Fri, 01 Dec 2023 13:23:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a15-20020adfeecf000000b0032f7fab0712sm2599889wrp.52.2023.12.01.13.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 13:23:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Dec 2023 22:23:18 +0100
Message-ID: <20231201212318.1091953-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701465802; x=1702070602; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=spDsACRB1oEz9uOwrqfldg6MmT1Lh1omotcpNfpv4sI=;
 b=R6k1UFu5TBGbQkiXpoiToZhT1wiu7M+Rm6/R+f2VTScZoyYRORKwdrWewiJsdGwjp+
 XLG++ot6V2SffVGnxO3+bkSBVumK5AYu3FFpZwBLmBPc7/7QKL76v30fB36koHHxSIYK
 4sUho1in1QoT76wETYrRcHJ3oOYNn0sBSnyNX5rrmb1yyR6Qyd8nDNgk7OAoHHmC4oiN
 wQULFrA7vyriD2WvhsdwC6J3P3oHZKNEbI3wORY+IXZgF45uECJRCeRzzm6HlKIwuzRH
 RMvM/3Sa4udZgFmj6lGLGr/zgyseXlQs4Z2NSlx95i+P5Ls+A452PymvEnLegmNoeHOZ
 4qHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R6k1UFu5
Subject: [Buildroot] [PATCH 1/1] package/libpjsip: security bump to version
 2.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4IENWRS0yMDIzLTM4NzAzOiBQSlNJUCBpcyBhIGZyZWUgYW5kIG9wZW4gc291cmNlIG11bHRp
bWVkaWEKY29tbXVuaWNhdGlvbiBsaWJyYXJ5IHdyaXR0ZW4gaW4gQyB3aXRoIGhpZ2ggbGV2ZWwg
QVBJIGluIEMsIEMrKywgSmF2YSwKQyMsIGFuZCBQeXRob24gbGFuZ3VhZ2VzLiBTUlRQIGlzIGEg
aGlnaGVyIGxldmVsIG1lZGlhIHRyYW5zcG9ydCB3aGljaAppcyBzdGFja2VkIHVwb24gYSBsb3dl
ciBsZXZlbCBtZWRpYSB0cmFuc3BvcnQgc3VjaCBhcyBVRFAgYW5kIElDRS4KQ3VycmVudGx5IGEg
aGlnaGVyIGxldmVsIHRyYW5zcG9ydCBpcyBub3Qgc3luY2hyb25pemVkIHdpdGggaXRzIGxvd2Vy
CmxldmVsIHRyYW5zcG9ydCB0aGF0IG1heSBpbnRyb2R1Y2UgdXNlLWFmdGVyLWZyZWUgaXNzdWUu
IFRoaXMKdnVsbmVyYWJpbGl0eSBhZmZlY3RzIGFwcGxpY2F0aW9ucyB0aGF0IGhhdmUgU1JUUCBj
YXBhYmlsaXR5CihgUEpNRURJQV9IQVNfU1JUUGAgaXMgc2V0KSBhbmQgdXNlIHVuZGVybHlpbmcg
bWVkaWEgdHJhbnNwb3J0IG90aGVyCnRoYW4gVURQLiBUaGlzIHZ1bG5lcmFiaWxpdHnigJlzIGlt
cGFjdCBtYXkgcmFuZ2UgZnJvbSB1bmV4cGVjdGVkCmFwcGxpY2F0aW9uIHRlcm1pbmF0aW9uIHRv
IGNvbnRyb2wgZmxvdyBoaWphY2svbWVtb3J5IGNvcnJ1cHRpb24uIFRoZQpwYXRjaCBpcyBhdmFp
bGFibGUgYXMgYSBjb21taXQgaW4gdGhlIG1hc3RlciBicmFuY2guCgpodHRwczovL2dpdGh1Yi5j
b20vcGpzaXAvcGpwcm9qZWN0L3NlY3VyaXR5L2Fkdmlzb3JpZXMvR0hTQS1mNzZ3LWZoN2MtcGM2
NgpodHRwczovL2dpdGh1Yi5jb20vcGpzaXAvcGpwcm9qZWN0L3JlbGVhc2VzL3RhZy8yLjE0CgpT
aWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNv
bT4KLS0tCiBwYWNrYWdlL2xpYnBqc2lwL2xpYnBqc2lwLmhhc2ggfCAyICstCiBwYWNrYWdlL2xp
YnBqc2lwL2xpYnBqc2lwLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnBqc2lwL2xpYnBq
c2lwLmhhc2ggYi9wYWNrYWdlL2xpYnBqc2lwL2xpYnBqc2lwLmhhc2gKaW5kZXggMmVkZDk3YmVk
NC4uZDcyZTEwOTBlMyAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJwanNpcC9saWJwanNpcC5oYXNo
CisrKyBiL3BhY2thZ2UvbGlicGpzaXAvbGlicGpzaXAuaGFzaApAQCAtMSwzICsxLDMgQEAKICMg
TG9jYWxseSBjb21wdXRlZAotc2hhMjU2ICAzMmE1YWI1YmZiYjk3NTJjYjZhNDY2MjdlNGM0MTBl
NjE5MzljOGRiYmQ4MzNhYzg1ODQ3M2NmYmQ5ZmI5ZDdkICBwanByb2plY3QtMi4xMy4xLnRhci5n
egorc2hhMjU2ICA1ODA1YzExNzFhY2FiNGFmOTY4NGQ3YWQwOTZkY2I5MmY3MWZjNDI4MDk4NTIx
NDRlOTdlMTQxMzQ2OGM5OTgxICBwanByb2plY3QtMi4xNC50YXIuZ3oKIHNoYTI1NiAgODE3N2Y5
NzUxMzIxMzUyNmRmMmNmNjE4NGQ4ZmY5ODZjNjc1YWZiNTE0ZDRlNjhhNDA0MDEwNTIxYjg4MDY0
MyAgQ09QWUlORwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJwanNpcC9saWJwanNpcC5tayBiL3Bh
Y2thZ2UvbGlicGpzaXAvbGlicGpzaXAubWsKaW5kZXggZjk3ZDU0N2ZkNy4uODE2OWUwZGNlZSAx
MDA2NDQKLS0tIGEvcGFja2FnZS9saWJwanNpcC9saWJwanNpcC5taworKysgYi9wYWNrYWdlL2xp
YnBqc2lwL2xpYnBqc2lwLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKIAotTElCUEpTSVBfVkVSU0lPTiA9IDIuMTMuMQorTElCUEpTSVBfVkVSU0lPTiA9IDIu
MTQKIExJQlBKU0lQX1NPVVJDRSA9IHBqcHJvamVjdC0kKExJQlBKU0lQX1ZFUlNJT04pLnRhci5n
egogTElCUEpTSVBfU0lURSA9ICQoY2FsbCBnaXRodWIscGpzaXAscGpwcm9qZWN0LCQoTElCUEpT
SVBfVkVSU0lPTikpCiAKLS0gCjIuNDIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
