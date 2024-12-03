Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8ACEE6C604
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 05:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 624BF607E4;
	Tue,  3 Dec 2024 05:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i623wcjolGYy; Tue,  3 Dec 2024 05:07:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F6BD60820
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F6BD60820;
	Tue,  3 Dec 2024 05:07:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E21F60
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 05:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BDD44092B
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 05:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DFCPc-r8Ogg for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 05:07:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=becher.jannik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D58C40929
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D58C40929
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D58C40929
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 05:07:15 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa5500f7a75so799485766b.0
 for <buildroot@buildroot.org>; Mon, 02 Dec 2024 21:07:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733202434; x=1733807234;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EMqPmiN/0nTZvxSFG6+KBFaheH4b42Aipr5qwKACWBY=;
 b=NiJLEarOTgfxwVzVruUR0MBW4Er13eKPxi/UFB2iQnBKiSXsOJI0hJCsIWj4ZR+JBD
 O1KDQSoFGhcwb3vqZJkkIalnje2HI0ny8Jkx10BYVX8MZ4v3eMzbncZ0fSCNXTpLawUW
 Vr7+bSmByBFuH4BWFRrohZyLgcnMhPHVM7qphDICscArzqvmk979YKLQTuIesgcTGw7b
 63DPUB/0NXHO44dhwB+r6vjSOsVkbzAF0SRzOMtmt8cCqOQUSnECQFNt5hMUt64nlF9K
 nzBRRxU7oNYfEFKvmQbvqr6PVsOzywMXL9QMxRbEthEnvprjUiRFs+UDoXx70hE2c0Z5
 0Nmw==
X-Gm-Message-State: AOJu0Yz0ZiCRVXQocJmANuqnsDKz+UQnevf/qMZBlLbEl81JImoGHVpn
 A4TF1Vn3+F0eNbba3+biQv9EbHiG+QHPaZGxdminOtRIuHE9r3dEwRVyPXDm
X-Gm-Gg: ASbGncsnpcqAVE9DcOvftkail6CtbOKIraZb4l4oJWwlOrU8yIDJWVRpc0H6bOKe/2u
 X23HmZ1EG0A7YNdkoICKdy9Hl8X8gLUmux1CkzsNUlsVXy50RzpyAo5c8W1Z8VBhVWjlT3VMy/Q
 uCZkYGdTSCmQr5VnDiVu21AxrJSe18JB0x57mBFdZY+et6AmFRxeVVSgGTz2TXYpMVJklEX3/59
 ZYd2XgmCQe8QbcKJRP65QTOn1wr2+1yc+zsTDFGLxV4ZeSdRoOmkiN0wkGljrp4ORBUkKOjvCKx
 OK4lptOVvwBnCyXY
X-Google-Smtp-Source: AGHT+IG9cdYGs5fE/z3VX6SnHiJ9kgzOiKuTqNqV4/2+svz3yTmrKSj80+8WrPoJSaSExPo3H54giA==
X-Received: by 2002:a17:906:9d2:b0:a9e:b5d0:4ab7 with SMTP id
 a640c23a62f3a-aa5f7f4690amr66252966b.52.1733202433561; 
 Mon, 02 Dec 2024 21:07:13 -0800 (PST)
Received: from [192.168.19.181] (p5492bafd.dip0.t-ipconnect.de.
 [84.146.186.253]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e6defsm571650766b.99.2024.12.02.21.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 21:07:12 -0800 (PST)
Message-ID: <e1f1a937-1679-4c79-98ea-3ce33836b92f@gmail.com>
Date: Tue, 3 Dec 2024 06:07:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jannik Becher <becher.jannik@gmail.com>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733202434; x=1733807234; darn=buildroot.org;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EMqPmiN/0nTZvxSFG6+KBFaheH4b42Aipr5qwKACWBY=;
 b=IuH0zpjjMxaZuFvzBeeuacB5emljL7AiSL8Q2RyM2L4IcPfQeF572Pkx2KxbL1r3KP
 ZU6zWsZ7wlliR/3CpIl6XDnVeS11HnWquU3K6dd47BLhb30eWEWOdXDDozDYCrQzsVRa
 cbLtnw8RisB3WxAZgoZoFBnESUNQ5dwAxzXbAfkv66PCyrZtp298DYxw/bducEiiGfTn
 /4kWvniWU0+FyZfDH0OcdVjw/9AZFOmRr0Pu1hmNvDDTLnKtSWzTMRXHJ4vAflzbeTvZ
 Y73TNqa9husydOTI5hMBRbo2SokWi6V6Iodt4Ryyl0cCZQuU6p0OnpLPRX8FQJh3X8I+
 iaJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IuH0zpjj
Subject: [Buildroot] [PATCH 1/2] package/igh-ethercat: bump version to 1.6.2
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

IEZyb20gYjAxZjBlMmMwY2YxOGQyNWZiNDllYjI5MzRiMjVhNWU4NjU4MTBmZSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogSmFubmlrIEJlY2hlciA8YmVjaGVyLmphbm5pa0BnbWFpbC5j
b20+CkRhdGU6TW9uLCAyIERlYyAyMDI0IDE5OjUwOjA5ICswMTAwClN1YmplY3Q6IFtQQVRDSCAx
LzJdIHBhY2thZ2UvaWdoLWV0aGVyY2F0OiBidW1wIHZlcnNpb24gdG8gMS42LjIKClNpZ25lZC1v
ZmYtYnk6IEphbm5payBCZWNoZXIgPGJlY2hlci5qYW5uaWtAZ21haWwuY29tPgotLS0KcGFja2Fn
ZS9pZ2gtZXRoZXJjYXQvaWdoLWV0aGVyY2F0Lmhhc2ggfCAyICstCnBhY2thZ2UvaWdoLWV0aGVy
Y2F0L2lnaC1ldGhlcmNhdC5tayDCoMKgfCAxICsKMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2lnaC1ldGhlcmNhdC9p
Z2gtZXRoZXJjYXQuaGFzaCAKYi9wYWNrYWdlL2lnaC1ldGhlcmNhdC9pZ2gtZXRoZXJjYXQuaGFz
aAppbmRleCA2N2ExNTJjNmFlLi4xYTc3MmQ3ZWE2IDEwMDY0NAotLS0gYS9wYWNrYWdlL2lnaC1l
dGhlcmNhdC9pZ2gtZXRoZXJjYXQuaGFzaAorKysgYi9wYWNrYWdlL2lnaC1ldGhlcmNhdC9pZ2gt
ZXRoZXJjYXQuaGFzaApAQCAtMSw0ICsxLDQgQEAKIyBMb2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYg
CiDCoDdlNGQ4ZjM0OTdjMGJjMGI2NGExNTFjMGQwNzQzNDlmZTc2MTQ3Njc1NjM2NDJkNmZlZGIx
OTU2N2VhZmExZTEgCiDCoGlnaC1ldGhlcmNhdC1mNWRjMTA5MTc2NDAwZjU0MGE4NjgyYTJjOWVl
MjBkNDExZDE0ZDYxLnRhcgouZ3oKK3NoYTI1NiAKIMKgM2RkZDE2ODczMjdjOWM1ODllM2I1M2Rj
NmZkZTJlNjBkNzZhYmEwN2U4NjYyYmY0NmU1MTgwN2ZmNzgxNTIxNCAKIMKgaWdoLWV0aGVyY2F0
LWNhNjZjZDZhZTliODIxYmZiZWM2ZDY4ZWUxYjQzZGEzNTljNTg5NGMudGFyCi5negpzaGEyNTYg
wqAyMzFmN2VkY2M3MzUyZDc3MzRhOTZlZWYwYjgwMzBmNzc5ODI2NzhjNTE2ODc2ZmNiODFlMjVi
MzJkNjg1NjRjIAogwqBDT1BZSU5HCnNoYTI1NiDCoGRjNjI2NTIwZGNkNTNhMjJmNzI3YWYzZWU0
MmM3NzBlNTZjOTdhNjRmZTNhZGIwNjM3OTlkOGFiMDMyZmU1NTEgCiDCoENPUFlJTkcuTEVTU0VS
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2lnaC1ldGhlcmNhdC9pZ2gtZXRoZXJjYXQubWsgCmIvcGFj
a2FnZS9pZ2gtZXRoZXJjYXQvaWdoLWV0aGVyY2F0Lm1rCmluZGV4IDViNjE4YWI1NGEuLjBkMzZi
NmQ3MjUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvaWdoLWV0aGVyY2F0L2lnaC1ldGhlcmNhdC5tawor
KysgYi9wYWNrYWdlL2lnaC1ldGhlcmNhdC9pZ2gtZXRoZXJjYXQubWsKQEAgLTUsNiArNSw3IEBA
CiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIAoKCklHSF9FVEhFUkNBVF9WRVJTSU9OID0gZjVkYzEw
OTE3NjQwMGY1NDBhODY4MmEyYzllZTIwZDQxMWQxNGQ2MQorSUdIX0VUSEVSQ0FUX1ZFUlNJT04g
PSBjYTY2Y2Q2YWU5YjgyMWJmYmVjNmQ2OGVlMWI0M2RhMzU5YzU4OTRjCklHSF9FVEhFUkNBVF9T
SVRFID0gJChjYWxsIApnaXRsYWIsZXRoZXJsYWIub3JnLGV0aGVyY2F0LCQoSUdIX0VUSEVSQ0FU
X1ZFUlNJT04pKQpJR0hfRVRIRVJDQVRfTElDRU5TRSA9IEdQTC0yLjAgKElnSCBFdGhlckNBVCBt
YXN0ZXIpLCBMR1BMLTIuMSAobGlicmFyaWVzKQpJR0hfRVRIRVJDQVRfTElDRU5TRV9GSUxFUyA9
IENPUFlJTkcgQ09QWUlORy5MRVNTRVIKCi0tIAoyLjQ3LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
