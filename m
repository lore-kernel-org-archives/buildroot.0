Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C04AC4167B
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 16:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBEF341934;
	Mon, 11 Dec 2023 16:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBEF341934
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dr9G0UdD65kE; Mon, 11 Dec 2023 16:00:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 021F841933;
	Mon, 11 Dec 2023 16:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 021F841933
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BDACA1BF336
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 16:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9651182238
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 16:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9651182238
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kCk_9ApaawYs for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 16:00:08 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46248821FD
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 16:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46248821FD
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33628562b88so517074f8f.1
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 08:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702310405; x=1702915205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yTu6od7/2YyCa0Us+hZWgEZLcovIhdtjoQreOrB9blc=;
 b=nk9rerFKeytskh7p9iWdr0AMVyhPHvdWIuNTZmVbjOTymkUh0Esc66iJXZng2IkdzP
 bC4AB4+b/nYiWdk8TyNOFcnznwF6W362yDkAQ//7bfWd8z9j1gu8wq37SHrBRp443aWY
 sSMoq2CJM0FVHcsQJeXHPXhUL2WUK2C03ZXOkkNfd6DPtgNUYH6zu48h2tJtkWz2FaBw
 JOSTAskF29QEgt68NOk58NWX2O9eR2ENZUMSmk7NC5zfToLJkwUw/p0zTZFBeQxNOUH1
 0Ijc0cP8zLNgmCHB+1bX5SeGFP9yJxupTXxTGZ+qOiISKFZcILkkRajdhpufMYdATYE6
 2SxA==
X-Gm-Message-State: AOJu0YzaqnbHaXxX2VZHLJUWXeBYeDfJBSCf4JUfY30S4bf30KRyVpxl
 IwFI/wrcWBkPcVOzGOUFkM5q5ZL2+4ndm1Bi7OY=
X-Google-Smtp-Source: AGHT+IElkhQkOTbEpFo6eytsEpAaNUfXlpGCEaI5I1s/wvNCq9pxsydPxPnexm26d6sAWaXaryhv/Q==
X-Received: by 2002:a5d:4a82:0:b0:334:b24b:7827 with SMTP id
 o2-20020a5d4a82000000b00334b24b7827mr2395788wrq.37.1702310405724; 
 Mon, 11 Dec 2023 08:00:05 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:3a7c:76ff:fe01:6f05])
 by smtp.gmail.com with ESMTPSA id
 d1-20020adfe881000000b003334926fb81sm3800972wrm.90.2023.12.11.08.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 08:00:05 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Mon, 11 Dec 2023 16:59:51 +0100
Message-ID: <20231211155951.4079886-3-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211155951.4079886-1-gael.portay@rtone.fr>
References: <20231211155951.4079886-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1702310405; x=1702915205; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yTu6od7/2YyCa0Us+hZWgEZLcovIhdtjoQreOrB9blc=;
 b=WVpNJM3isIMTbkHENNaJFe4QJ/gokFqzMyTxnIvB2HVZnkcYUFemr7iJj+8r9WutFn
 vNeUVhW9H7IWG98UyUH6c+xC+nl5R8v5mfjygHX5+3abNGwOBNVDK0DiF+c6kZHkmRFx
 sF1fEy6Q3IHv6mntrgL6rYiJwKD7CQRSBeDaE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=WVpNJM3i
Subject: [Buildroot] [PATCH v2 2/2] configs: add raspberrypi 5 defconfig
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
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBjb25maWd1cmF0aW9uIGJ1aWxkcyBhbiBpbWFnZSBmb3IgdGhlIFJhc3BiZXJyeVBpIDUu
CgpTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgotLS0K
IGJvYXJkL3Jhc3BiZXJyeXBpL2NtZGxpbmVfNS50eHQgfCAgMSArCiBib2FyZC9yYXNwYmVycnlw
aS9jb25maWdfNS50eHQgIHwgMTQgKysrKysrKysrKysrCiBib2FyZC9yYXNwYmVycnlwaS9yZWFk
bWUudHh0ICAgIHwgIDYgKysrKysKIGJvYXJkL3Jhc3BiZXJyeXBpNSAgICAgICAgICAgICAgfCAg
MSArCiBjb25maWdzL3Jhc3BiZXJyeXBpNV9kZWZjb25maWcgIHwgNDAgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9yYXNwYmVycnlwaS9jbWRsaW5lXzUudHh0CiBjcmVhdGUg
bW9kZSAxMDA2NDQgYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzUudHh0CiBjcmVhdGUgbW9kZSAx
MjAwMDAgYm9hcmQvcmFzcGJlcnJ5cGk1CiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9yYXNw
YmVycnlwaTVfZGVmY29uZmlnCgpkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvY21kbGlu
ZV81LnR4dCBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NtZGxpbmVfNS50eHQKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYWM0NTczNTNlMgotLS0gL2Rldi9udWxsCisrKyBiL2Jv
YXJkL3Jhc3BiZXJyeXBpL2NtZGxpbmVfNS50eHQKQEAgLTAsMCArMSBAQAorcm9vdD0vZGV2L21t
Y2JsazBwMiByb290d2FpdCBjb25zb2xlPXR0eTEgY29uc29sZT10dHlBTUExMCwxMTUyMDAKZGlm
ZiAtLWdpdCBhL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ181LnR4dCBiL2JvYXJkL3Jhc3BiZXJy
eXBpL2NvbmZpZ181LnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5i
YmVkMTlmZTQ2Ci0tLSAvZGV2L251bGwKKysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzUu
dHh0CkBAIC0wLDAgKzEsMTQgQEAKKyMgUGxlYXNlIG5vdGUgdGhhdCB0aGlzIGlzIG9ubHkgYSBz
YW1wbGUsIHdlIHJlY29tbWVuZCB5b3UgdG8gY2hhbmdlIGl0IHRvIGZpdAorIyB5b3VyIG5lZWRz
LgorIyBZb3Ugc2hvdWxkIG92ZXJyaWRlIHRoaXMgZmlsZSB1c2luZyBCUjJfUEFDS0FHRV9SUElf
RklSTVdBUkVfQ09ORklHX0ZJTEUuCisjIFNlZSBodHRwOi8vYnVpbGRyb290Lm9yZy9tYW51YWwu
aHRtbCNyb290ZnMtY3VzdG9tCisjIGFuZCBodHRwOi8vZWxpbnV4Lm9yZy9SUGljb25maWcgZm9y
IGEgZGVzY3JpcHRpb24gb2YgY29uZmlnLnR4dCBzeW50YXgKKwora2VybmVsPUltYWdlCisKKyMg
VG8gdXNlIGFuIGV4dGVybmFsIGluaXRyYW1mcyBmaWxlCisjaW5pdHJhbWZzIHJvb3Rmcy5jcGlv
Lmd6CisKKyMgRGlzYWJsZSBvdmVyc2NhbiBhc3N1bWluZyB0aGUgZGlzcGxheSBzdXBwb3J0cyBk
aXNwbGF5aW5nIHRoZSBmdWxsIHJlc29sdXRpb24KKyMgSWYgdGhlIHRleHQgc2hvd24gb24gdGhl
IHNjcmVlbiBkaXNhcHBlYXJzIG9mZiB0aGUgZWRnZSwgY29tbWVudCB0aGlzIG91dAorZGlzYWJs
ZV9vdmVyc2Nhbj0xCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0IGIv
Ym9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dAppbmRleCA5MjAyYjVmZjM3Li5hYTY0MjFlYTAx
IDEwMDY0NAotLS0gYS9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0CisrKyBiL2JvYXJkL3Jh
c3BiZXJyeXBpL3JlYWRtZS50eHQKQEAgLTEwLDYgKzEwLDcgQEAgVGhlc2UgaW5zdHJ1Y3Rpb25z
IGFwcGx5IHRvIGFsbCBtb2RlbHMgb2YgdGhlIFJhc3BiZXJyeSBQaToKICAgLSB0aGUgbW9kZWwg
QjMgKGFrYSBSYXNwYmVycnkgUGkgMykuCiAgIC0gdGhlIG1vZGVsIEI0IChha2EgUmFzcGJlcnJ5
IFBpIDQpLgogICAtIHRoZSBtb2RlbCBDTTQgKGFrYSBSYXNwYmVycnkgUGkgQ29tcHV0ZSBNb2R1
bGUgNCBhbmQgSU8gQm9hcmQpLgorICAtIHRoZSBtb2RlbCBCNSAoYWthIFJhc3BiZXJyeSBQaSA1
KS4KIAogSG93IHRvIGJ1aWxkIGl0CiA9PT09PT09PT09PT09PT0KQEAgLTY0LDYgKzY1LDEwIEBA
IG9yIGZvciBDTTQgKG9uIElPIEJvYXJkIC0gNjQgYml0KToKIAogICAkIG1ha2UgcmFzcGJlcnJ5
cGljbTRpb182NF9kZWZjb25maWcKIAorRm9yIG1vZGVsIDUgQjoKKworICAkIG1ha2UgcmFzcGJl
cnJ5cGk1X2RlZmNvbmZpZworCiBCdWlsZCB0aGUgcm9vdGZzCiAtLS0tLS0tLS0tLS0tLS0tCiAK
QEAgLTk0LDYgKzk5LDcgQEAgQWZ0ZXIgYnVpbGRpbmcsIHlvdSBzaG91bGQgb2J0YWluIHRoaXMg
dHJlZToKICAgICArLS0gYmNtMjcxMC1ycGktY20zLmR0YiAgICAgICAgIFsxXQogICAgICstLSBi
Y20yNzExLXJwaS00LWIuZHRiICAgICAgICAgWzFdCiAgICAgKy0tIGJjbTI3MTEtcnBpLWNtNC5k
dGIgICAgICAgICBbMV0KKyAgICArLS0gYmNtMjcxMi1ycGktNS1iLmR0YiAgICAgICAgIFsxXQog
ICAgICstLSBiY20yODM3LXJwaS0zLWIuZHRiICAgICAgICAgWzFdCiAgICAgKy0tIGJvb3QudmZh
dAogICAgICstLSByb290ZnMuZXh0NApkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGk1IGIv
Ym9hcmQvcmFzcGJlcnJ5cGk1Cm5ldyBmaWxlIG1vZGUgMTIwMDAwCmluZGV4IDAwMDAwMDAwMDAu
LmZjZGFmYzgxZWQKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC9yYXNwYmVycnlwaTUKQEAgLTAs
MCArMSBAQAorcmFzcGJlcnJ5cGkKXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlCmRpZmYgLS1n
aXQgYS9jb25maWdzL3Jhc3BiZXJyeXBpNV9kZWZjb25maWcgYi9jb25maWdzL3Jhc3BiZXJyeXBp
NV9kZWZjb25maWcKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYjhjYzY4
NmVmMwotLS0gL2Rldi9udWxsCisrKyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGk1X2RlZmNvbmZpZwpA
QCAtMCwwICsxLDQwIEBACitCUjJfYWFyY2g2ND15CitCUjJfY29ydGV4X2E3Nl9hNTU9eQorQlIy
X0FSTV9GUFVfVkZQVjQ9eQorQlIyX0FSTTY0X1BBR0VfU0laRV8xNks9eQorCitCUjJfVE9PTENI
QUlOX0JVSUxEUk9PVF9DWFg9eQorCitCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCisKKyMgTGludXgg
aGVhZGVycyBzYW1lIGFzIGtlcm5lbCwgYSA2LjEgc2VyaWVzCitCUjJfUEFDS0FHRV9IT1NUX0xJ
TlVYX0hFQURFUlNfQ1VTVE9NXzZfMT15CisKK0JSMl9MSU5VWF9LRVJORUw9eQorQlIyX0xJTlVY
X0tFUk5FTF9DVVNUT01fVEFSQkFMTD15CitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9UQVJCQUxM
X0xPQ0FUSU9OPSIkKGNhbGwgZ2l0aHViLHJhc3BiZXJyeXBpLGxpbnV4LDE3ZjEzNWI3NDJjNGVk
YjM0MGFmYjM2NTg3M2MzYTU3NGY3ZTE2Y2IpL2xpbnV4LTE3ZjEzNWI3NDJjNGVkYjM0MGFmYjM2
NTg3M2MzYTU3NGY3ZTE2Y2IudGFyLmd6IgorQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9ImJj
bTI3MTIiCisKKyMgQnVpbGQgdGhlIERUQiBmcm9tIHRoZSBrZXJuZWwgc291cmNlcworQlIyX0xJ
TlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15CitCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFN
RT0iYnJvYWRjb20vYmNtMjcxMi1ycGktNS1iIgorCitCUjJfTElOVVhfS0VSTkVMX05FRURTX0hP
U1RfT1BFTlNTTD15CisKK0JSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRT15CitCUjJfUEFDS0FHRV9S
UElfRklSTVdBUkVfQ09ORklHX0ZJTEU9ImJvYXJkL3Jhc3BiZXJyeXBpNS9jb25maWdfNS50eHQi
CitCUjJfUEFDS0FHRV9SUElfRklSTVdBUkVfQ01ETElORV9GSUxFPSJib2FyZC9yYXNwYmVycnlw
aTUvY21kbGluZV81LnR4dCIKKyMgQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX0lOU1RBTExfRFRC
X09WRVJMQVlTIGlzIG5vdCBzZXQKKworIyBSZXF1aXJlZCB0b29scyB0byBjcmVhdGUgdGhlIFNE
IGltYWdlCitCUjJfUEFDS0FHRV9IT1NUX0RPU0ZTVE9PTFM9eQorQlIyX1BBQ0tBR0VfSE9TVF9H
RU5JTUFHRT15CitCUjJfUEFDS0FHRV9IT1NUX01UT09MUz15CisKKyMgRmlsZXN5c3RlbSAvIGlt
YWdlCitCUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15
CitCUjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9IjEyME0iCisjIEJSMl9UQVJHRVRfUk9PVEZT
X1RBUiBpcyBub3Qgc2V0CitCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2FyZC9yYXNw
YmVycnlwaTUvcG9zdC1idWlsZC5zaCIKK0JSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJv
YXJkL3Jhc3BiZXJyeXBpNS9wb3N0LWltYWdlLnNoIgotLSAKMi40My4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
