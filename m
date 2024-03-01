Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780CCC5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 09:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 261CD600D1;
	Fri,  1 Mar 2024 09:50:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EfIObUxazNJL; Fri,  1 Mar 2024 09:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 396B2605FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 396B2605FB;
	Fri,  1 Mar 2024 09:50:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D43C1BF83B
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 09:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5957E405C4
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 09:49:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tydfJIoUwpM4 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 09:49:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B066B400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B066B400A4
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B066B400A4
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 09:49:57 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-563c595f968so3095215a12.0
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 01:49:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709286596; x=1709891396;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jg4QDZjlV3iT7L8dUg5sts8FHnqxMCmlAH2+yCd+mKU=;
 b=YWNT6De8HiYCscaS3th5p9zN9Ce1ntgGhIGCTiGbYDXujKeMsGmEoQZ911nPuHiNA6
 0ovmJQJrGT1by6R3WWmU28kCrxGSdGU+VN5Osm6bR6A0Fcyh13rhWzaCn7maZRsfktta
 KRVYB1G4Rh+NOfhKcwxZMlFxTdJP+veyT/MtJdwalTAAN8vhW82sP5Ymw19Aq6178c+c
 /hMJkgOonO+noBVFvRTTFSlNfYKDnhmANuPdq/457sELyo27woRuvv1mMOphDtnuP+m4
 R2ZlzkTEQZyzV7hrrbIb9vea+wvQGEHEEyp/mWAPboXgR7Vzb41UOvgRS6MJ6KiSv7P/
 eNjQ==
X-Gm-Message-State: AOJu0YylOTG1UxnkuYqotB/j7Xgab8FhFWIfuxKM/lPNi8177SIYUTC2
 C+GedaB+d0Hn+SDdqy1svfAQStGtLtLT4PU0C/MTdwX3HZUuncDjqkaNZ060FVz27Qf4ff96D+O
 bfIw=
X-Google-Smtp-Source: AGHT+IF8pVs0SKT0Q1KjiP6iS2nvsExgPjNYgnmdDkOg4C5HCSN364Cmh9Hr6f+hcif0KQqLGGxIow==
X-Received: by 2002:aa7:c48d:0:b0:566:6899:d52 with SMTP id
 m13-20020aa7c48d000000b0056668990d52mr817628edq.41.1709286595693; 
 Fri, 01 Mar 2024 01:49:55 -0800 (PST)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a056402194c00b0056661ec3f24sm1412268edz.81.2024.03.01.01.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 01:49:55 -0800 (PST)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 10:49:48 +0100
Message-Id: <20240301094949.175637-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1709286596; x=1709891396; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jg4QDZjlV3iT7L8dUg5sts8FHnqxMCmlAH2+yCd+mKU=;
 b=ePoDgtxrNbCTseegj91l6tCx4sm6u0qRtiPfpmujbr5EqwLuN4V2+0WfRrURBnlwMx
 KzLWcXBeToHrYtH/QgM919QOzKLWUr5tjqVG0abysFctjO4vPzVrBtVDrD8rHQtuuGxX
 SQU8Mtw0PVhpLmrHJvukO9AUphvjYixNkeHDWugSLRBWP9eeDOqE3S4JwiHrvum1KfN7
 zkL9x+kV6LaWDFWjrt5w3yORXRdXTfBe6yrZwOPiR+Z1OusjWoIM4eXne4+tO1uviufq
 dl3uOOO+yiHOM0+myuNGs5GfW1K3GmvW/choBGYh34YzmokcbeEwFqjXMDJfNE/nCBD9
 hBXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=ePoDgtxr
Subject: [Buildroot] [PATCH v2] linux-firmware: add options for missing
 Intel b/g/n cards
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
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
 Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGZpcm13YXJlIGZpbGVzIGZvciBtaXNzaW5nIGNhcmRzIGZyb20gdGhlIDgwMi4xMWJnbiBw
cm9kdWN0IGxpc3QKaW4gdGhlIExpbnV4IEZpcm13YXJlIFdpa2kgWzFdLgoKU28gZmFyIG9ubHkg
V2lyZWxlc3MtTiAxMzAgYW5kIDEwMzAgd2VyZSBzdXBwb3J0ZWQsIHdoaWNoIHVzZSB0aGUKNjAw
MEcyQiBtaWNyb2NvZGUuCgpbMV0gaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4v
dXNlcnMvZHJpdmVycy9pd2x3aWZpI3N1cHBvcnRlZF9kZXZpY2VzCgpTaWduZWQtb2ZmLWJ5OiBK
YW4gxIxlcm3DoWsgPHNhaXJvbkBzYWlyb24uY3o+Ci0tLQogcGFja2FnZS9saW51eC1maXJtd2Fy
ZS9Db25maWcuaW4gICAgICAgICB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKwogcGFja2Fn
ZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tayB8IDMwICsrKysrKysrKysrKysrKysr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNr
YWdlL2xpbnV4LWZpcm13YXJlL0NvbmZpZy5pbiBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvQ29u
ZmlnLmluCmluZGV4IDkyMGMwYTJlZjEuLjZmYjg5NTNjMWMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
bGludXgtZmlybXdhcmUvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvQ29u
ZmlnLmluCkBAIC0xOTUsNiArMTk1LDQyIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9GSVJN
V0FSRV9DWVBSRVNTX0NZVzU0WFhYCiAJaGVscAogCSAgRmlybXdhcmUgZmlsZXMgZm9yIHRoZSBD
eXByZXNzIGN5dzU0eHh4IEZ1bGxNQUMuCiAKK2NvbmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9GSVJN
V0FSRV9JV0xXSUZJXzEwMAorCWJvb2wgIkludGVsIGl3bHdpZmkgMTAwIgorCWhlbHAKKwkgIEZp
cm13YXJlIGZpbGVzIGZvciB0aGUgSW50ZWwgV2lmaSAxMDAgZGV2aWNlcyBzdXBwb3J0ZWQgYnkK
KwkgIHRoZSBpd2x3aWZpIGtlcm5lbCBkcml2ZXIuCisKK2NvbmZpZyBCUjJfUEFDS0FHRV9MSU5V
WF9GSVJNV0FSRV9JV0xXSUZJXzEwNQorCWJvb2wgIkludGVsIGl3bHdpZmkgMTA1IgorCWhlbHAK
KwkgIEZpcm13YXJlIGZpbGVzIGZvciB0aGUgSW50ZWwgV2lmaSAxMDUgZGV2aWNlcyBzdXBwb3J0
ZWQgYnkKKwkgIHRoZSBpd2x3aWZpIGtlcm5lbCBkcml2ZXIuCisKK2NvbmZpZyBCUjJfUEFDS0FH
RV9MSU5VWF9GSVJNV0FSRV9JV0xXSUZJXzEzNQorCWJvb2wgIkludGVsIGl3bHdpZmkgMTM1Igor
CWhlbHAKKwkgIEZpcm13YXJlIGZpbGVzIGZvciB0aGUgSW50ZWwgV2lmaSAxMzUgZGV2aWNlcyBz
dXBwb3J0ZWQgYnkKKwkgIHRoZSBpd2x3aWZpIGtlcm5lbCBkcml2ZXIuCisKK2NvbmZpZyBCUjJf
UEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9JV0xXSUZJXzEwMDAKKwlib29sICJJbnRlbCBpd2x3aWZp
IDEwMDAiCisJaGVscAorCSAgRmlybXdhcmUgZmlsZXMgZm9yIHRoZSBJbnRlbCBXaWZpIDEwMDAg
ZGV2aWNlcyBzdXBwb3J0ZWQgYnkKKwkgIHRoZSBpd2x3aWZpIGtlcm5lbCBkcml2ZXIuCisKK2Nv
bmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9JV0xXSUZJXzIwMDAKKwlib29sICJJbnRl
bCBpd2x3aWZpIDIwMDAiCisJaGVscAorCSAgRmlybXdhcmUgZmlsZXMgZm9yIHRoZSBJbnRlbCBX
aWZpIDIwMDAgZGV2aWNlcyBzdXBwb3J0ZWQgYnkKKwkgIHRoZSBpd2x3aWZpIGtlcm5lbCBkcml2
ZXIuCisKK2NvbmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9JV0xXSUZJXzIwMzAKKwli
b29sICJJbnRlbCBpd2x3aWZpIDIwMzAiCisJaGVscAorCSAgRmlybXdhcmUgZmlsZXMgZm9yIHRo
ZSBJbnRlbCBXaWZpIDIwMzAgZGV2aWNlcyBzdXBwb3J0ZWQgYnkKKwkgIHRoZSBpd2x3aWZpIGtl
cm5lbCBkcml2ZXIuCisKIGNvbmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9JV0xXSUZJ
XzIyMDAwCiAJYm9vbCAiSW50ZWwgaXdsd2lmaSAyMjAwMCIKIAloZWxwCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rIGIvcGFja2FnZS9saW51eC1m
aXJtd2FyZS9saW51eC1maXJtd2FyZS5tawppbmRleCA2MGU4ODYxYWJlLi5iMjVjOTcyNjM0IDEw
MDY0NAotLS0gYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rCisrKyBi
L3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsKQEAgLTQ4Niw2ICs0ODYs
MzYgQEAgTElOVVhfRklSTVdBUkVfRklMRVMgKz0gd2lsNjIxMC4qCiBMSU5VWF9GSVJNV0FSRV9B
TExfTElDRU5TRV9GSUxFUyArPSBMSUNFTlNFLlF1YWxjb21tQXRoZXJvc19hdGgxMGsKIGVuZGlm
CiAKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfSVdMV0lGSV8xMDApLHkpCitM
SU5VWF9GSVJNV0FSRV9GSUxFUyArPSBpd2x3aWZpLTEwMC0qLnVjb2RlCitMSU5VWF9GSVJNV0FS
RV9BTExfTElDRU5TRV9GSUxFUyArPSBMSUNFTkNFLml3bHdpZmlfZmlybXdhcmUKK2VuZGlmCisK
K2lmZXEgKCQoQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfSVdMV0lGSV8xMDUpLHkpCitMSU5V
WF9GSVJNV0FSRV9GSUxFUyArPSBpd2x3aWZpLTEwNS0qLnVjb2RlCitMSU5VWF9GSVJNV0FSRV9B
TExfTElDRU5TRV9GSUxFUyArPSBMSUNFTkNFLml3bHdpZmlfZmlybXdhcmUKK2VuZGlmCisKK2lm
ZXEgKCQoQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfSVdMV0lGSV8xMzUpLHkpCitMSU5VWF9G
SVJNV0FSRV9GSUxFUyArPSBpd2x3aWZpLTEzNS0qLnVjb2RlCitMSU5VWF9GSVJNV0FSRV9BTExf
TElDRU5TRV9GSUxFUyArPSBMSUNFTkNFLml3bHdpZmlfZmlybXdhcmUKK2VuZGlmCisKK2lmZXEg
KCQoQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfSVdMV0lGSV8xMDAwKSx5KQorTElOVVhfRklS
TVdBUkVfRklMRVMgKz0gaXdsd2lmaS0xMDAwLSoudWNvZGUKK0xJTlVYX0ZJUk1XQVJFX0FMTF9M
SUNFTlNFX0ZJTEVTICs9IExJQ0VOQ0UuaXdsd2lmaV9maXJtd2FyZQorZW5kaWYKKworaWZlcSAo
JChCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9JV0xXSUZJXzIwMDApLHkpCitMSU5VWF9GSVJN
V0FSRV9GSUxFUyArPSBpd2x3aWZpLTIwMDAtKi51Y29kZQorTElOVVhfRklSTVdBUkVfQUxMX0xJ
Q0VOU0VfRklMRVMgKz0gTElDRU5DRS5pd2x3aWZpX2Zpcm13YXJlCitlbmRpZgorCitpZmVxICgk
KEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX0lXTFdJRklfMjAzMCkseSkKK0xJTlVYX0ZJUk1X
QVJFX0ZJTEVTICs9IGl3bHdpZmktMjAzMC0qLnVjb2RlCitMSU5VWF9GSVJNV0FSRV9BTExfTElD
RU5TRV9GSUxFUyArPSBMSUNFTkNFLml3bHdpZmlfZmlybXdhcmUKK2VuZGlmCisKIGlmZXEgKCQo
QlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfSVdMV0lGSV8yMjAwMCkseSkKIExJTlVYX0ZJUk1X
QVJFX0ZJTEVTICs9IGl3bHdpZmktUXVaLSoudWNvZGUgaXdsd2lmaS1RdS0qLnVjb2RlCiBMSU5V
WF9GSVJNV0FSRV9BTExfTElDRU5TRV9GSUxFUyArPSBMSUNFTkNFLml3bHdpZmlfZmlybXdhcmUK
LS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
