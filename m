Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE68FC25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 09:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72A7A4167E;
	Wed,  5 Jun 2024 09:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NB8X_yIzODif; Wed,  5 Jun 2024 09:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0853841697
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0853841697;
	Wed,  5 Jun 2024 09:07:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 633D11BF5E0
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 09:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A35884264
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 09:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZeq48b-Coj1 for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 09:07:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C92E8425E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C92E8425E
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C92E8425E
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 09:07:04 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2e95a75a90eso70497131fa.2
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 02:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717578422; x=1718183222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XRi7lfXZC/Djpq4ZbNDc3PLaBf88Cyzo+GxidFfMnJc=;
 b=DiOAooo9q0m8I6ApS5l4pNOYz2p+04FTL9mh8q0uevN6XD4p8R3FqwkjhVGKmYPbxf
 NwAEQAcVz6oQvskBpN3K1iXIRbNQjyGxS6XA1jdapKScYqvKQT2ycc8KSiU1dEnQWa9G
 JoLq6LqsggwPFADEtK0W2Yh88En54AihgVm5rMYG2wj2WUlAHIpiwhlnHYbkZX28H7WH
 JUiW0qLcvdG4W6QWxmE9E5Sq1ThrO24TEh5+qd1CgC8drXFlnQ9nTua6fwbvbVNkDukf
 x2A0WkakVDKoOclVh+bOaOuutvQab2XSLtzUGOz5us7gtYIfKYdfDkmy5I0S2qhdGUfE
 0tLA==
X-Gm-Message-State: AOJu0YzbLpq0xvAaD+Yu6bGyu6YqlecgKR0OddNGj38fV6eeOjOBuFSq
 Mz6Q8kJCIwrUF+h8FSU230AVs+wiDbv5LDc7XG36tJs41C7i0So167kHhw==
X-Google-Smtp-Source: AGHT+IHUaJlMv4unQSOe6GLymhHGqHXgyM5V33Q4Ei/f41ZN4orbJXuPu7qlV9yiMSsWsg9JDg3QJQ==
X-Received: by 2002:a2e:9546:0:b0:2ea:7ccd:10a7 with SMTP id
 38308e7fff4ca-2eac7a99034mr8580101fa.45.1717578422082; 
 Wed, 05 Jun 2024 02:07:02 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea93d41326sm17279721fa.111.2024.06.05.02.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 02:07:01 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 11:06:51 +0200
Message-ID: <20240605090652.3156836-1-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240605084827.3155371-1-roy.kollen.svendsen@akersolutions.com>
References: <20240605084827.3155371-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717578422; x=1718183222; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XRi7lfXZC/Djpq4ZbNDc3PLaBf88Cyzo+GxidFfMnJc=;
 b=aUOS1zMdHYh0Rq3u+JV7OxVgCzPNMAEbhPE81jtdXGKyuOZ9dZql0mIlZC6hXNTuPB
 qjQMEWrdyWGfLaHcIUu2uENXqhtWSK9NIRWzt8yDIjSMi33hXroiozOGRmDyZtp4W8u4
 Y48LT3tRerjMGlDvmDfWqDS7f9OHnpsidFiXruN6N66WF8Rh7t0GtdqIhru1a/RR4K/B
 +6aNiPwxQ6x9xTTnjlaeX2/owqRKSvt9caFDcufQPiEDQRx3mJ8DlfH+YsZLRnTa1JHT
 fAMq7e4Mfk80j5bcI0QEMQNpjCb9I9S2lTvqUxYiEGmHnkH6i98amzJTYXB2gI0OBU+Q
 1+cg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aUOS1zMd
Subject: [Buildroot] [PATCH 2024.02.x v2] package/libffi: fix host build
 failure
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SG9zdCBidWlsZCBmYWlscyBvbiB1cGRhdGVkIEFyY2ggTGludXggZGVza3RvcC4KCk15IGN1cnJl
bnQgL3Vzci9iaW4vZ2NjIHZlcnNpb24gaXMgMTQuMS4xIDIwMjQwNTIyLCB3aGVyZQppbXBsaWNp
dC1mdW5jdGlvbi1kZWNsYXJhdGlvbiBjYXVzZSBidWlsZCB0byBmYWlsOgoKMjAyNC0wNi0wNVQw
NzowMzoyMCBsaWJ0b29sOiBjb21waWxlOiAgL2hvbWUvcm95L2h5bWF0ZWsvY29ubmV4aS10b3Vj
aHBhbmVsLWZpcm13YXJlL214eGYxL291dHB1dC9ob3N0L2Jpbi9jY2FjaGUgL3Vzci9iaW4vZ2Nj
IC1ESEFWRV9DT05GSUdfSCAtSS4gLUkuLiAtSS4gLUkuLi9pbmNsdWRlIC1JaW5jbHVkZSAtSS4u
L3NyYyAtSS9ob21lL3JveS9oeW1hdGVrL2Nvbm5leGktdG91Y2hwYW5lbC1maXJtd2FyZS9teHhm
MS9vdXRwdXQvaG9zdC9pbmNsdWRlIC1XYWxsIC1PMiAtSS9ob21lL3JveS9oeW1hdGVrL2Nvbm5l
eGktdG91Y2hwYW5lbC1maXJtd2FyZS9teHhmMS9vdXRwdXQvaG9zdC9pbmNsdWRlIC1mZXhjZXB0
aW9ucyAtYyAuLi9zcmMvdHJhbXAuYyAgLWZQSUMgLURQSUMgLW8gc3JjLy5saWJzL3RyYW1wLm8K
MjAyNC0wNi0wNVQwNzowMzoyMCAuLi9zcmMvdHJhbXAuYzogSW4gZnVuY3Rpb24g4oCYZmZpX3Ry
YW1wX2dldF90ZW1wX2ZpbGXigJk6CjIwMjQtMDYtMDVUMDc6MDM6MjAgLi4vc3JjL3RyYW1wLmM6
MjYyOjIyOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYb3Blbl90
ZW1wX2V4ZWNfZmlsZeKAmSBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KMjAyNC0w
Ni0wNVQwNzowMzoyMCAyNjIgfCAgIHRyYW1wX2dsb2JhbHMuZmQgPSBvcGVuX3RlbXBfZXhlY19m
aWxlICgpOwoyMDI0LTA2LTA1VDA3OjAzOjIwIHwgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+fgoKUGF0Y2ggZnJvbSBtYXN0ZXIgd2FzIGFkZGVkIHRvIGZpeCBidWlsZC4K
ClNpZ25lZC1vZmYtYnk6IFJveSBLb2xsZW4gU3ZlbmRzZW4gPHJveS5rb2xsZW4uc3ZlbmRzZW5A
YWtlcnNvbHV0aW9ucy5jb20+Ci0tLQptYXN0ZXIgYW5kIG5leHQgYXJlIG5vdCBhZmZlY3RlZCBh
cyB0aGUgdmVyc2lvbiB3YXMgYnVtcGVkCgpDaGFuZ2VzIHYxIC0+IHYyOgogIC0gVXNlIGxvd2Vy
Y2FzZSBsZXR0ZXIgYXQgc3RhcnQgb2YgY29tbWl0IG1lc3NhZ2UKCiAuLi53YXJkLWRlY2xhcmUt
b3Blbl90ZW1wX2V4ZWNfZmlsZS03NjQucGF0Y2ggfCA0OSArKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvbGliZmZpLzAwMDQtRm9yd2FyZC1kZWNsYXJlLW9wZW5fdGVtcF9leGVjX2ZpbGUtNzY0LnBh
dGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJmZmkvMDAwNC1Gb3J3YXJkLWRlY2xhcmUtb3Bl
bl90ZW1wX2V4ZWNfZmlsZS03NjQucGF0Y2ggYi9wYWNrYWdlL2xpYmZmaS8wMDA0LUZvcndhcmQt
ZGVjbGFyZS1vcGVuX3RlbXBfZXhlY19maWxlLTc2NC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwLi4zNDFhMmU0ZTQzCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2Fn
ZS9saWJmZmkvMDAwNC1Gb3J3YXJkLWRlY2xhcmUtb3Blbl90ZW1wX2V4ZWNfZmlsZS03NjQucGF0
Y2gKQEAgLTAsMCArMSw0OSBAQAorRnJvbSBjZTA3N2U1NTY1MzY2MTcxYWExYjQ0Mzg3NDliMDky
MmZjZTg4N2E0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogc2VyZ2Utc2Fucy1wYWls
bGUgPHNlcmdlLmd1ZWx0b25AdGVsZWNvbS1icmV0YWduZS5ldT4KK0RhdGU6IFRodSwgMiBGZWIg
MjAyMyAxNDo0NjoyOSArMDAwMAorU3ViamVjdDogW1BBVENIXSBGb3J3YXJkIGRlY2xhcmUgb3Bl
bl90ZW1wX2V4ZWNfZmlsZSAoIzc2NCkKKworSXQncyBkZWZpbmVkIGluIGNsb3N1cmVzLmMgYW5k
IHVzZWQgaW4gdHJhbXAuYy4KK0Fsc28gZGVjbGFyZSBpdCBhcyBhbiBoaWRkZW4gc3ltYm9sLCBh
cyBpdCBzaG91bGQgYmUuCisKK0NvLWF1dGhvcmVkLWJ5OiBzZXJnZS1zYW5zLXBhaWxsZSA8c2d1
ZWx0b25AbW96aWxsYS5jb20+CitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2xpYmZmaS9s
aWJmZmkvcHVsbC83NjQKK1NpZ25lZC1vZmYtYnk6IFJveSBLb2xsZW4gU3ZlbmRzZW4gPHJveS5r
b2xsZW4uc3ZlbmRzZW5AYWtlcnNvbHV0aW9ucy5jb20+CistLS0KKyBpbmNsdWRlL2ZmaV9jb21t
b24uaCB8IDQgKysrKworIHNyYy90cmFtcC5jICAgICAgICAgIHwgNCArKysrCisgMiBmaWxlcyBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKykKKworZGlmZiAtLWdpdCBhL2luY2x1ZGUvZmZpX2NvbW1v
bi5oIGIvaW5jbHVkZS9mZmlfY29tbW9uLmgKK2luZGV4IDJiZDMxYjAuLmM1M2E3OTQgMTAwNjQ0
CistLS0gYS9pbmNsdWRlL2ZmaV9jb21tb24uaAorKysrIGIvaW5jbHVkZS9mZmlfY29tbW9uLmgK
K0BAIC0xMjgsNiArMTI4LDEwIEBAIHZvaWQgKmZmaV9kYXRhX3RvX2NvZGVfcG9pbnRlciAodm9p
ZCAqZGF0YSkgRkZJX0hJRERFTjsKKyAgICBzdGF0aWMgdHJhbXBvbGluZS4gKi8KKyBpbnQgZmZp
X3RyYW1wX2lzX3ByZXNlbnQgKHZvaWQgKmNsb3N1cmUpIEZGSV9ISURERU47CisgCisrLyogUmV0
dXJuIGEgZmlsZSBkZXNjcmlwdG9yIG9mIGEgdGVtcG9yYXJ5IHplcm8tc2l6ZWQgZmlsZSBpbiBh
CisrICAgd3JpdGFibGUgYW5kIGV4ZWN1dGFibGUgZmlsZXN5c3RlbS4gKi8KKytpbnQgb3Blbl90
ZW1wX2V4ZWNfZmlsZSh2b2lkKSBGRklfSElEREVOOworKworIC8qIEV4dGVuZGVkIGNpZiwgdXNl
ZCBpbiBjYWxsYmFjayBmcm9tIGFzc2VtYmx5IHJvdXRpbmUgKi8KKyB0eXBlZGVmIHN0cnVjdAor
IHsKK2RpZmYgLS1naXQgYS9zcmMvdHJhbXAuYyBiL3NyYy90cmFtcC5jCitpbmRleCA3ZTAwNWIw
Li41ZjE5YjU1IDEwMDY0NAorLS0tIGEvc3JjL3RyYW1wLmMKKysrKyBiL3NyYy90cmFtcC5jCitA
QCAtMzksNiArMzksMTAgQEAKKyAjaWZkZWYgX19saW51eF9fCisgI2RlZmluZSBfR05VX1NPVVJD
RSAxCisgI2VuZGlmCisrCisrI2luY2x1ZGUgPGZmaS5oPgorKyNpbmNsdWRlIDxmZmlfY29tbW9u
Lmg+CisrCisgI2luY2x1ZGUgPHN0ZGlvLmg+CisgI2luY2x1ZGUgPHVuaXN0ZC5oPgorICNpbmNs
dWRlIDxzdGRsaWIuaD4KKy0tIAorMi40NS4xCisKLS0gCjIuNDUuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
