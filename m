Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A322EC3DA7F
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 12:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7498D405E0;
	Wed, 31 Jul 2024 12:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vDDZA6h8Ybv4; Wed, 31 Jul 2024 12:04:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 316B540DCB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 316B540DCB;
	Wed, 31 Jul 2024 12:04:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 959001BF23C
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 12:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F9DD405A3
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 12:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id de0K5ojUKEUY for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 12:04:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 02EE540010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02EE540010
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02EE540010
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 12:04:34 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-428178fc07eso33634945e9.3
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 05:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722427472; x=1723032272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jgAS+p+KPFpSEv9GCii4qukmB8NDni+bJVkywlZ2rso=;
 b=wfzJuDZHx7+qMuG8fm1ZvsyElIPgk7OYPRHlhmuym8N0ll9ch4dxmp8J4swUzU9evm
 rrSojJKrVH27BcBOsYd9H0fD53viRzGaopRUdBYjC21CM7oHFLtG2KIKEyKC4xawFbnR
 b41leq64EtuAwSgJuP9CbUBGVn5/sPE8/XPUz/wvB1Pp5LOrrfMx7CqQFYvWMb+GV70l
 Zde437J82qC7m4uzkclv5mF3mME7jAEveMLQBj9ucOLyd3qO2I0LpWoulwwacRaq/WCR
 sDMI4vrZsnygLgRWUZ/5RLWaTiARQRM8hEKPqY0PkqXHGGhtObYqnuy/qtHpTNYduKya
 Nwcw==
X-Gm-Message-State: AOJu0YzWYyznJbAA+3Rb030XZd6WexST78tcr8Y5XP6ahZa4LCFjp3SK
 lXqoFkqCibJn3j6kIN7ySFdqboY2kiBZfl+p/bZ0eFTY+wyj8r7wUNWnGEDcczbvAw==
X-Google-Smtp-Source: AGHT+IHhawwxOsxtmPhHG4fMPWcRrjlaBHODlxtYP/2ta9W6seOefx+GSuxBPHgrWrFwdhXxBQDaPg==
X-Received: by 2002:a05:600c:3b19:b0:423:791:f446 with SMTP id
 5b1f17b1804b1-42811d73675mr87682655e9.7.1722427472009; 
 Wed, 31 Jul 2024 05:04:32 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:3a7c:76ff:fe01:6f05])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282bac614esm18467015e9.24.2024.07.31.05.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 05:04:31 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 14:04:25 +0200
Message-ID: <20240731120426.307069-2-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240731120426.307069-1-gael.portay@rtone.fr>
References: <20240731120426.307069-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722427472; x=1723032272; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jgAS+p+KPFpSEv9GCii4qukmB8NDni+bJVkywlZ2rso=;
 b=nHyWsOhn760pTQA+8Evu4cxlsd5LOsWeucUJjRjaNjuxC9V3Vx2QzSw4R9BK6LW3Vs
 tfO6D8YQJkbU2G/2ZZWonWWQ4dsm3XvMHkzt2g7qlLZxES23J46v1otQdYTDSvzHC0N2
 xTn5ViHnMO7+iw2baSXQ1ak/EjAbOBxcBpXpOWkXDZ+B4VO+3D9OI09xHBus86EnDL84
 bAUH6osM1c7593QiBmS2+udFG6xQgImysHnzJNC5oeEDmFF1JVLP+ZQc5Y8eGdDOmbQs
 Yznj5VUYQeavI4B47kFykdZqPbCMrYaTuryepaZBabK0m2BIodg2ueun4q4Wx2yOiAeZ
 g9Bg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nHyWsOhn
Subject: [Buildroot] [PATCH v3 1/2] package/rpi-utils: new package
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
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHBhY2thZ2UgcnBpLXVzZXJsYW5kIGhhcyBiZWVuIG1hcmtlZCBhcyBhbmNpZW50IGFuZCBk
ZXByZWNhdGVkWzFdLgoKVGhlIHVzZWZ1bCB0b29scyAoZHRvdmVybGF5LCBkdG1lcmdlLCB2Y21h
aWxib3gsIHZjZ2VuY21kKSB3ZXJlIG1vdmVkIHRvCnRoZSByZXBvc2l0b3J5IHJwaS11dGlscyBz
aW5jZSB0aGVuLgoKVGhpcyBhZGRzIHRoZSBuZXcgcGFja2FnZSBycGktdXRpbHMgYXQgbGF0ZXN0
IGNvbW1pdCBhcyB0aGVyZSBpcyBubwp0YWdnZWQgY29tbWl0LgoKWzFdOiBodHRwczovL2dpdGh1
Yi5jb20vcmFzcGJlcnJ5cGkvdXNlcmxhbmQvY29tbWl0Lzk2YTczMzRhZTlkNWZjOWRiN2FjOTJl
NTk4NTIzNzdkZjYzZjE4NDgKClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0
YXlAcnRvbmUuZnI+Ci0tLQogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgfCAgMyAr
KysKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9ycGkt
dXRpbHMvQ29uZmlnLmluICAgICAgfCAxMiArKysrKysrKysrKysKIHBhY2thZ2UvcnBpLXV0aWxz
L3JwaS11dGlscy5oYXNoIHwgIDMgKysrCiBwYWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMubWsg
ICB8IDE4ICsrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25z
KCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ycGktdXRpbHMvQ29uZmlnLmluCiBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLmhhc2gKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMubWsKCmRpZmYgLS1naXQgYS9E
RVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCA5YThjOTJmMTIyLi45OTA1OTMxNzQ0IDEwMDY0
NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTEyMDUsNiArMTIwNSw5IEBA
IE46CUZyYW5rIFZhbmJldmVyIDxmcmFuay52YW5iZXZlckBtaW5kLmJlPgogRjoJcGFja2FnZS9s
aWJtb2RzZWN1cml0eS8KIEY6CXBhY2thZ2UvbmdpbngtbW9kc2VjdXJpdHkvCiAKK046CUdhw6ts
IFBPUlRBWSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+CitGOglwYWNrYWdlL3JwaS11dGlscy8KKwog
TjoJR2FvIFhpYW5nIDxoc2lhbmdrYW9AYW9sLmNvbT4KIEY6CXBhY2thZ2UvZXJvZnMtdXRpbHMv
CiAKZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5k
ZXggOTBmMWVjYzg3Ny4uMWQ5YzA0MjU5YyAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4K
KysrIGIvcGFja2FnZS9Db25maWcuaW4KQEAgLTQ1Nyw2ICs0NTcsNyBAQCBtZW51ICJGaXJtd2Fy
ZSIKIAlzb3VyY2UgInBhY2thZ2UvcW9yaXEtZm0tdWNvZGUvQ29uZmlnLmluIgogCXNvdXJjZSAi
cGFja2FnZS9yY3ctc21hcmMtc2FsMjgvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9ycGkt
ZmlybXdhcmUvQ29uZmlnLmluIgorCXNvdXJjZSAicGFja2FnZS9ycGktdXRpbHMvQ29uZmlnLmlu
IgogCXNvdXJjZSAicGFja2FnZS9zdW54aS1ib2FyZHMvQ29uZmlnLmluIgogCXNvdXJjZSAicGFj
a2FnZS90czQ5MDAtZnBnYS9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3V4NTAwLWZpcm13
YXJlL0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnBpLXV0aWxzL0NvbmZpZy5pbiBi
L3BhY2thZ2UvcnBpLXV0aWxzL0NvbmZpZy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwLi5hMjcyOTE2N2FhCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9ycGktdXRp
bHMvQ29uZmlnLmluCkBAIC0wLDAgKzEsMTIgQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9SUElfVVRJ
TFMKKwlib29sICJycGktdXRpbHMiCisJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTICMgZHRj
CisJc2VsZWN0IEJSMl9QQUNLQUdFX0RUQworCWhlbHAKKwkgIEEgY29sbGVjdGlvbiBvZiBzY3Jp
cHRzIGFuZCBzaW1wbGUgYXBwbGljYXRpb25zIGZvciB0aGUKKwkgIFJhc3BiZXJyeSBQaS4KKwor
CSAgaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL3V0aWxzLworCitjb21tZW50ICJycGkt
dXRpbHMgbmVlZHMgYSB0b29sY2hhaW4gdy8gZHluYW1pYyBsaWJyYXJ5IgorCWRlcGVuZHMgb24g
QlIyX1NUQVRJQ19MSUJTCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMu
aGFzaCBiL3BhY2thZ2UvcnBpLXV0aWxzL3JwaS11dGlscy5oYXNoCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAuLmE2NjEyMzczYjAKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNr
YWdlL3JwaS11dGlscy9ycGktdXRpbHMuaGFzaApAQCAtMCwwICsxLDMgQEAKKyMgTG9jYWxseSBj
b21wdXRlZAorc2hhMjU2ICBjMzU5MzJlNTAxYjQzZTVmYjQ4Y2ZjNDg4YWFkYzRhOGJiY2ViMGU5
ZTZkYWZkZjZjN2NkMjA2NmI1OGFjZDYxICBycGktdXRpbHMtYTFkNTIyZjBmMWI1MDg1OGE0NGZh
YzgwNTIzYTJiZDgwMDk4ZTc4OS50YXIuZ3oKK3NoYTI1NiAgNzMxZGE5NTY0MzFkMWE3YzUwNzNl
N2VlNWViZTAxZjU0ZTM1OWM1MzM5MzEwYjMyZjA4OTNjNmZlNjUwN2Q1YSAgTElDRU5DRQpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLm1rIGIvcGFja2FnZS9ycGktdXRp
bHMvcnBpLXV0aWxzLm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjQ5
ZGIzYWVmOWYKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMu
bWsKQEAgLTAsMCArMSwxOCBAQAorIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgcnBpLXV0
aWxzCisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitSUElfVVRJTFNfVkVSU0lPTiA9IGEx
ZDUyMmYwZjFiNTA4NThhNDRmYWM4MDUyM2EyYmQ4MDA5OGU3ODkKK1JQSV9VVElMU19TSVRFID0g
JChjYWxsIGdpdGh1YixyYXNwYmVycnlwaSx1dGlscywkKFJQSV9VVElMU19WRVJTSU9OKSkKK1JQ
SV9VVElMU19MSUNFTlNFID0gQlNELTMtQ2xhdXNlCitSUElfVVRJTFNfTElDRU5TRV9GSUxFUyA9
IExJQ0VOQ0UKK1JQSV9VVElMU19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKK1JQSV9VVElMU19ERVBF
TkRFTkNJRVMgPSBkdGMKKworIyBFbnN1cmUgdGhlIGludGVybmFsIGR0b3ZsIHJlbWFpbnMgYW4g
YXJjaGl2ZSBvYmplY3QgYW5kIGl0IGlzIG5vdCBidWlsdCBhcyBhCisjIGR5bmFtaWMgbGlicmFy
eSB0aGF0IGlzIGxpbmtlZCBieSBvdGhlciB1dGlsaXRpZXM7IGFzIGl0IGlzIG5vdCBpbnN0YWxs
ZWQuCitSUElfVVRJTFNfQ09ORl9PUFRTID0gLURTVEFUSUM9U1RBVElDCisKKyQoZXZhbCAkKGNt
YWtlLXBhY2thZ2UpKQotLSAKMi40Ni4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
