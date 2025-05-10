Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECE8C3ABC3
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 20:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8052B40624;
	Sat, 10 May 2025 20:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dyQXHGMf4fp; Sat, 10 May 2025 20:31:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A08E4403D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A08E4403D3;
	Sat, 10 May 2025 20:31:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ECCEE0
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54C3F80F87
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:31:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRNhlWZXOkyK for <buildroot@buildroot.org>;
 Sat, 10 May 2025 20:31:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B1D280F74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B1D280F74
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B1D280F74
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:31:44 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-54d6f93316dso4045275e87.2
 for <buildroot@buildroot.org>; Sat, 10 May 2025 13:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746909102; x=1747513902;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lz7ztin3EafTxR5SDlsrwRKdvpKX2IE4HbQwyXWDGCQ=;
 b=Rtai4F0xmbR2vcQex0Fx9EaQBQsiVaNq+Bvb7c69V0z3pTgvN/t1DubYTh5IOxLvTd
 KgxjrZWKY1Lkp3VL8fhMpSGdaWIJxzToMdkURdvgvu91+0gpb4Cm6NkHPKV3CfDsR2mi
 Mp3goqOEI8TrDX4vEx4N5ipLKMivff3BMTlABrCO7ZizBJVtuJ/JfCFzrE4Gp7Jwy+p4
 ealEfd4cSauGArmF4e8n63uIn2in0kHuv1npfqkxA5/Oa0J7yFDe52ltv9bxgsuBV7gA
 M0bPUJn+zyczwTN2VEw06q47FhAtWCSkImnjV30IK3/cQsEQqTWE2eIxkA66AWb9U/8f
 legg==
X-Gm-Message-State: AOJu0YxYhLuNNpKm1to3hhosgSle/w/T5Q5pNT1KEy/vcwx6Ow3/0jtJ
 iQflkS/Rhdb6svyzMOnZvRI17TXWuxSZF5vuB28+NmvYkiIF3UD9o6XQwNHh
X-Gm-Gg: ASbGncsywJXvCD7aI+3nngu8HsDEBAZ/8J3F1VgXiZV52W0P5VTpSRwz28h7z6iM/WL
 LVafmMF4XatbbqsB5SrtAfrIiZF2+PCJpDVuUQlsVkIczqBEAU+LZRfXWkBbT136bgHsH6DFWTS
 EEbZSurer9qt3kqeuKZlhCJA6hOz6zZxCzILcufhJPDWnyPck6WOESlujl73H/0MuxLWGhxaBsv
 Pn71UsS925UTSKPsSGE7tTqXbzQzqdyBs6b9xw7DvNjdgRYiMBdsv/zX8MQ9RX6wTCVc48W3iMS
 eB9VhziMXQwaEJZsoW/qu7GZZZee4VhHjSpdYAstxBdh5CYexDbzp4sl2Tb2Y2+teScV4+DVA+Y
 =
X-Google-Smtp-Source: AGHT+IEepXiYVq4WYRLQXQEyhYpxM5+cQ0uLppPavLrYu9Oi800nhjvcMAyCcfDWG1CS8c/tYxzi6Q==
X-Received: by 2002:a2e:a542:0:b0:30b:f15f:1c02 with SMTP id
 38308e7fff4ca-326c45a7873mr31534291fa.18.1746909101952; 
 Sat, 10 May 2025 13:31:41 -0700 (PDT)
Received: from tollan.lan (b106.broadband9.quicknet.se. [194.132.233.106])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645cf27sm810561e87.88.2025.05.10.13.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 May 2025 13:31:41 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Sat, 10 May 2025 22:31:17 +0200
Message-ID: <20250510203122.1916485-2-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510203122.1916485-1-lazzer@gmail.com>
References: <20250510203122.1916485-1-lazzer@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746909102; x=1747513902; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lz7ztin3EafTxR5SDlsrwRKdvpKX2IE4HbQwyXWDGCQ=;
 b=PjpaaPnjvS9WiER9qbR1Ee/hU6KPH6j77ttZ+ZtkNaSKei86ukpa43UZqpfbQzj48F
 EAo6hwIefddQPHqv9EkSDH7jVbFtWOaMtuWBqI02B/ILn4EBlfwLw9RDSRGM6llIlpI8
 G+Txet65LapJ9TCoqUiw2EgTcj+eZu4qZt5vI4RDIGNqGOfrDX95p3laGpilbzhjj8Z/
 BmvMNVpciQzCURwizjBmF/Y06TCQiMgDNFTolezGHnh7wJAw+FzG1jqy3WqWeTG6pW9r
 q9daI0lRj7GsDFTuUIEXciEjL5227sZmw3GDC+Nt3vdkfZwR5zaJiic3np7w/T5VD7R/
 D3ZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PjpaaPnj
Subject: [Buildroot] [PATCH v2 1/5] package/sysrepo: bump to version 3.6.11
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

Q2hhbmdlbG9nOgogc2V2ZXJhbCBtb2RlcmF0ZSBvcHRpbWl6YXRpb25zIChAaXJmYW5IYXNsYW5k
ZWQpCiBzZXNzaW9uIHB1c2ggb3BlciBkYXRhIGNhY2hlCiBsb3RzIG9mIG1pbm9yIGJ1Z2ZpeGVz
IGFuZCBpbXByb3ZlbWVudHMKCkRlcGVuZHMgb24gbGlieWFuZyB2My4xMi4yIGh0dHBzOi8vZ2l0
aHViLmNvbS9DRVNORVQvbGlieWFuZy9yZWxlYXNlcy90YWcvdjMuMTIuMgoKU2lnbmVkLW9mZi1i
eTogTWF0dGlhcyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+Ci0tLQogcGFja2FnZS9zeXNy
ZXBvL3N5c3JlcG8uaGFzaCB8IDIgKy0KIHBhY2thZ2Uvc3lzcmVwby9zeXNyZXBvLm1rICAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL3N5c3JlcG8vc3lzcmVwby5oYXNoIGIvcGFja2FnZS9zeXNyZXBv
L3N5c3JlcG8uaGFzaAppbmRleCAwNTZmNzA3ODdkLi42NjM3NjllMDhkIDEwMDY0NAotLS0gYS9w
YWNrYWdlL3N5c3JlcG8vc3lzcmVwby5oYXNoCisrKyBiL3BhY2thZ2Uvc3lzcmVwby9zeXNyZXBv
Lmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICA0Njdl
ZmVkOGQwZjYyYzI2YTBkMjAwNjAyYjkxMTA5NmViMmQ2Nzg1OGU2MjA5MzdhYjY4Zjk2YjMxNmZh
OWI3ICBzeXNyZXBvLTIuMi4xNTAudGFyLmd6CitzaGEyNTYgIDA3ZmFhMjIwZGQ0MDkzODJhOGE0
ZTJmZDQxMWY5NjFlZjZjMDVjYzFiYjdmNjE2NTc5MDEzODM2NzM0MDMzYzQgIHN5c3JlcG8tMy42
LjExLnRhci5negogc2hhMjU2ICA4OGYxYjdlNWM2NGQyYzExM2UwNzEwNWFhOWMwZmI4MDYzOWI0
MDI4NzU2NWJlMWMyYWZkMDk0OWRmODNkODI2ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdl
L3N5c3JlcG8vc3lzcmVwby5tayBiL3BhY2thZ2Uvc3lzcmVwby9zeXNyZXBvLm1rCmluZGV4IDdm
MjU3MGJkN2QuLmRlNTQ0MWYwMWMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvc3lzcmVwby9zeXNyZXBv
Lm1rCisrKyBiL3BhY2thZ2Uvc3lzcmVwby9zeXNyZXBvLm1rCkBAIC00LDcgKzQsNyBAQAogIwog
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotU1lTUkVQT19WRVJTSU9OID0gMi4yLjE1MAorU1lT
UkVQT19WRVJTSU9OID0gMy42LjExCiBTWVNSRVBPX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHN5c3Jl
cG8sc3lzcmVwbyx2JChTWVNSRVBPX1ZFUlNJT04pKQogU1lTUkVQT19JTlNUQUxMX1NUQUdJTkcg
PSBZRVMKIFNZU1JFUE9fTElDRU5TRSA9IEJTRC0zLUNsYXVzZQotLSAKMi40My4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
