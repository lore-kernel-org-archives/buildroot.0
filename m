Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68825CD4F54
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 19:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40BE5843F0;
	Wed, 27 May 2026 19:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6E4HNCjn9zAS; Wed, 27 May 2026 19:43:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 599FA843F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779911001;
	bh=BPkP0E7pIsrjfXialk0KMFP+g4irNu1zbFIXD+1Hbsg=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m9G+zYrXB16QgAeNJheRUc10CwOEWyRMonpmfTaQjKocMkdrYn/9+ZE39dTtEFq63
	 2lLt/ELWaMZYw5oaFXc+Jevs/sHQX8cjh6DPPyJumPfW55cWqyOvpPGBA1Nftql1t2
	 yX/KozTpqMKNO+JLFBhLJGQIb9EXoQ6+zG50obNteBm+EersbjQSW4+7y/lLgotcG0
	 LOevrYHPPQfZ5rAPrrJ7/RdU2HqtOP40DsDUbo8c2rkLSvpA+sXOCOM8iGON9HHs27
	 AmIUJuMxEoBuUCGJuFuvf8l9mlXaDw/P31ApJKgxj8K9BNx0RjAKpDmUWybL0QEsRN
	 si1ehJ3y3lSsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 599FA843F1;
	Wed, 27 May 2026 19:43:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F96C28A
 for <buildroot@buildroot.org>; Wed, 27 May 2026 19:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C935422E5
 for <buildroot@buildroot.org>; Wed, 27 May 2026 19:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1y9RfXTfSFRg for <buildroot@buildroot.org>;
 Wed, 27 May 2026 19:43:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 47B08422E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47B08422E4
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47B08422E4
 for <buildroot@buildroot.org>; Wed, 27 May 2026 19:43:19 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-44ce78ab5feso9559687f8f.0
 for <buildroot@buildroot.org>; Wed, 27 May 2026 12:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779910997; x=1780515797;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ZsSZeyGZt5t030ayZUlSdGO3jt40BbZduRPjieNV/k=;
 b=k9zZ+iGwbltBFlLhbQHuu7LNKl8CSBEDFsI4LJ1CkHcYdVTpRGAC8c9r2l6o4l23+d
 pmsPDkhyqDQV/ETumKqX12nKu+7Ytr95HOuVqCRJ/3s5EPmG2wU9qPoKBriaLOn1QTab
 TRIEKzrkZH5MNWfuquakCWWGaOlavWZYUF7YEJQO0Iwwr3EpkczZ7Z0jaP+YiWyD05PM
 sSsNOkVFyw4bRt1yF9szcXMYsfi3tKDy03DHO03feW6CDNRzGXjxbaK7V2XB01KsgHfk
 /RShEE8gJwK6bu6jF66aoZ5vr0XsARUf5Tb91QsM6QOhxMll5yQlbd+vS2pyAc9VRJIT
 ggCg==
X-Gm-Message-State: AOJu0Yzjt/YPUCIyzYHCUNsSbbVWK1FOImMF648cRG3qUhdipcRxMSWL
 AjJtkrhBP7cAazx7E6M0uQTYa/AUaagoSWm0ZWaOULmCwqh6zJj8Gd0e
X-Gm-Gg: Acq92OHuOYRKOh01Jo4hUl2sxrxfnpZfs7FcuRLyzEHzsfKSYGn0oRgPf2pfOYSUh5F
 ksSZgSuhbDqiSWyejmDqKloFlqEBoU95aqGiUINLsYOPLxKoptdOX+e4O956jyqaSIPWRhhd2GL
 EB3HVUV/FJu8M04/dSg6ffKR/h7/Q/XSu3Dv18uQQrlgNlSYFaVoO8zRFwhQKTZ6qiWvKcMMo+Z
 85i20k4c8VxImI/Q/T40SgmG92QPDsFhGl/S0Lj2u/hip3lk/sqZNLSTmIPrxIvXArzZapqxmrw
 k1d7cNL9EYH5VqUMU4rsxEuaJ/C6yfPMK0p38UUeGHfs3rnxSsu7FU3H9HwzAO26coT77Ein9I5
 pNMMwcEBWadWZ6DjBP/iqw66lndTPzsEu8xUJT7/twSxHHlyRyJhKYol4jfoLRTmey3zk99iL/o
 as4tR0fLxO2i26Ip+y3oAnHsrH6BOcLyv8Fk8=
X-Received: by 2002:a5d:64c2:0:b0:45e:b2b9:705a with SMTP id
 ffacd0b85a97d-45eb38baf74mr38790399f8f.23.1779910996991; 
 Wed, 27 May 2026 12:43:16 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb5c27e7sm8188686f8f.35.2026.05.27.12.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 12:43:16 -0700 (PDT)
From: =?utf-8?q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
Date: Wed, 27 May 2026 21:42:42 +0200
MIME-Version: 1.0
Message-Id: <20260527-master-v1-1-5ed351103b87@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQ6CMBBFr0JmbQ1tLKgr72FYlGGAMUJJWxsN6
 d2luHT5kvffX8GTY/JwLVZwFNmznTeQhwJwNPNAgruNQZWqKrWqxWR8ICf0xVR9d9JamxY2eXH
 U83sP3Zsf+1f7IAx5nY2RfbDusz9Fmb2/aJRCirZEQzWqc490GybDzyPaCZqU0heWzhzLrgAAA
 A==
X-Change-ID: 20260527-master-59a6fd4555ab
To: buildroot@buildroot.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Romain Naour <romain.naour@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2776; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=ZqPLoSR4jc79Hi0ihYb+7neXsJTWBPBprMdKcV9aOMw=; 
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBqF0kzuG4izIwaHexJBpg/J30pgKqoCpIiPicy3
 0CFa4yl8SyJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCahdJMwAKCRDnIYpo1BLC
 td78D/4n74BpS/kx/WjgWZo0uHTm7tzvh3YwUEEivjZq8AA/1yNyl4d+a37RWbr+jdMwX3KdyNC
 7vtsYWfOKX5Z/upWvfYKgJLeZMnipqnCq1iH9UEbs4QC1e64/XLzYhupIEacVKocAmoPqmE2Xls
 RS8Fxm033sxqYSHUq14ltsUxh9ev6gfE734DzW8ro20qRrvDSWcmGV7jU/PyERF4IYBV7dY1FbY
 xiaBwIQMprNnBS3lOxl8w0dAe1R0udbPzJNTi8tppqqV2HWG5kM69FijWtb2Pvvc7DdQHsg/xST
 tLBuIhn04jzi7hHj7s+Gz04wuAv36tBclXR3R6QLldrvf6KXx2MzSH0BePiSCx7opnAk2OclemT
 9t+Y9s6QIdXUWSDfXVLbTI5pxaVvByoVuwdzgBAu7uKFD8QMu6kuxDzuLEIXPXCPvJ8i89LYn/d
 SqjhyHhi7rC0iNhCRCv0Ec1ryjoYURZQg/4QhqWCUG5d8tSn8naKAbiTZX6iY6q9zMzQVSTYdVL
 AjPpgol7VHvrFWNaxd1r4MQW+lE1hoIAyxhEvl2jrNSNqjNV7LoqKb/9xtPFCaRU7w6CmIuDofO
 TOLr/ybjE3ht1xHKBiCbdbUi9FXeLrjeHW27vwX3sDtdcL/StKeQiX6xosBeX+OKBF5dXo9gMFj
 nEX4mORs8ZoN4Yg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779910997; x=1780515797; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/ZsSZeyGZt5t030ayZUlSdGO3jt40BbZduRPjieNV/k=;
 b=P4sncFiaabK/8Dvx9423W/MDgrJt+Z74ID/h0Jh7RtS5FEsNIgRgWnh4sumaQaSmfF
 gc4FEvLJ1zliuMPdtPTd487JCUyaB95K4o3a0RmpJS/H7cYRxVyr/JHGrenL79wgirx+
 buLotWeDLnuOplx3WUma8yjWs83rHD5i6ye86f4Gy0OsokIdR/FMaznjrRvcRx2+wm+n
 mXaxRHqh1JhvkhWm5mwFNlGPo/DoaSXRrfVaVKrq3I4EHwYtTBoDcHoOOs2MtyF6/hUP
 Una0MY4fCNYkbYbeIJPN95MB4Z8hNyHnr5VlDTd5ufAT4sw5IFABcJnKm0eVb4lVbXtl
 o9Ig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=P4sncFia
Subject: [Buildroot] [PATCH] package/supertuxkart: remove obsolete
 dependencies
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

IC0gWG9yZyAvIFhMSUIgbm8gbW9yZSByZXF1aXJlZAogLSBBbGxvdyBidWlsZCBmb3Igb3RoZXIg
YXJjaCB0aGFuIGkzODYveDg2XzY0CiAtIExJQkdMIGFsc28gcmVtb3ZlZCBzaW5jZSBidWlsdCBv
biB0b3Agb2YKICAgU0RMMiAod2hpY2ggY2FuIHByb3ZpZGUgRUdML0dMRVMgYmFja2VuZCkKClNp
Z25lZC1vZmYtYnk6IFJhcGhhw6tsIEdhbGxhaXMtUG91IDxyZ2FsbGFpc3BvdUBnbWFpbC5jb20+
Ci0tLQogcGFja2FnZS9zdXBlcnR1eGthcnQvQ29uZmlnLmluICAgICAgIHwgOSAtLS0tLS0tLS0K
IHBhY2thZ2Uvc3VwZXJ0dXhrYXJ0L3N1cGVydHV4a2FydC5tayB8IDIgLS0KIDIgZmlsZXMgY2hh
bmdlZCwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9zdXBlcnR1eGthcnQv
Q29uZmlnLmluIGIvcGFja2FnZS9zdXBlcnR1eGthcnQvQ29uZmlnLmluCmluZGV4IDBmNmMyNDQw
NTgxOS4uODQwNjFmZDRkN2QwIDEwMDY0NAotLS0gYS9wYWNrYWdlL3N1cGVydHV4a2FydC9Db25m
aWcuaW4KKysrIGIvcGFja2FnZS9zdXBlcnR1eGthcnQvQ29uZmlnLmluCkBAIC0xLDE0ICsxLDEw
IEBACiBjb25maWcgQlIyX1BBQ0tBR0VfU1VQRVJUVVhLQVJUCiAJYm9vbCAic3VwZXJ0dXhrYXJ0
IgotCWRlcGVuZHMgb24gQlIyX0hPU1RBUkNIID0gIng4Nl82NCIgfHwgQlIyX0hPU1RBUkNIID0g
Ing4NiIKLQlkZXBlbmRzIG9uIEJSMl9pMzg2IHx8IEJSMl94ODZfNjQKIAlkZXBlbmRzIG9uIEJS
Ml9VU0VfTU1VICMgZm9yaygpCiAJZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJTVERDUFAgIyBv
cGVuYWwKIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzkgIyBvcGVuYWwK
IAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFNfTlBUTCAjIG9wZW5hbAogCWRl
cGVuZHMgb24gQlIyX1BBQ0tBR0VfT1BFTkFMX0FSQ0hfU1VQUE9SVFMgIyBvcGVuYWwKLQlkZXBl
bmRzIG9uIEJSMl9QQUNLQUdFX0hBU19MSUJHTAotCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfWE9S
RzcKIAlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX1VTRVNfTVVTTAogCXNlbGVjdCBCUjJfUEFD
S0FHRV9GUkVFVFlQRQogCXNlbGVjdCBCUjJfUEFDS0FHRV9FTkVUCkBAIC0yMiw3ICsxOCw2IEBA
IGNvbmZpZyBCUjJfUEFDS0FHRV9TVVBFUlRVWEtBUlQKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfT1BF
TlNTTCBpZiAhQlIyX1BBQ0tBR0VfTUJFRFRMUwogCXNlbGVjdCBCUjJfUEFDS0FHRV9PUEVOQUwK
IAlzZWxlY3QgQlIyX1BBQ0tBR0VfU0RMMgotCXNlbGVjdCBCUjJfUEFDS0FHRV9YTElCX0xJQlhS
QU5EUgogCXNlbGVjdCBCUjJfUEFDS0FHRV9aTElCCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0JMVUVa
NV9VVElMU19QTFVHSU5TX0hJRCBpZiBCUjJfUEFDS0FHRV9CTFVFWjVfVVRJTFMgJiYgQlIyX1RP
T0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzNfMTggIyBydW50aW1lCiAJaGVscApAQCAtMzQsMTMg
KzI5LDkgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1NVUEVSVFVYS0FSVAogCSAgaHR0cDovL3N1cGVy
dHV4a2FydC5zb3VyY2Vmb3JnZS5uZXQvTWFpbl9QYWdlCiAKIGNvbW1lbnQgInN1cGVydHV4a2Fy
dCBuZWVkcyBhbiBPcGVuR0wgYmFja2VuZCwgYSB1Q2xpYmMgb3IgZ2xpYmMgdG9vbGNoYWluIHcv
IE5QVEwsIEMrKywgZ2NjID49IDkiCi0JZGVwZW5kcyBvbiBCUjJfSE9TVEFSQ0ggPSAieDg2XzY0
IiB8fCBCUjJfSE9TVEFSQ0ggPSAieDg2IgotCWRlcGVuZHMgb24gQlIyX2kzODYgfHwgQlIyX3g4
Nl82NAogCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUKIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX09Q
RU5BTF9BUkNIX1NVUFBPUlRTCi0JZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9YT1JHNwogCWRlcGVu
ZHMgb24gIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFNfTlBUTCBcCiAJCXx8ICFCUjJfSU5TVEFM
TF9MSUJTVERDUFAgXAogCQl8fCAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfOSBcCi0JCXx8
ICFCUjJfUEFDS0FHRV9IQVNfTElCR0wgXAogCQl8fCBCUjJfVE9PTENIQUlOX1VTRVNfTVVTTApk
aWZmIC0tZ2l0IGEvcGFja2FnZS9zdXBlcnR1eGthcnQvc3VwZXJ0dXhrYXJ0Lm1rIGIvcGFja2Fn
ZS9zdXBlcnR1eGthcnQvc3VwZXJ0dXhrYXJ0Lm1rCmluZGV4IDM3N2I5NjY4YTFiNS4uNWYxMjIw
OTJiMzIyIDEwMDY0NAotLS0gYS9wYWNrYWdlL3N1cGVydHV4a2FydC9zdXBlcnR1eGthcnQubWsK
KysrIGIvcGFja2FnZS9zdXBlcnR1eGthcnQvc3VwZXJ0dXhrYXJ0Lm1rCkBAIC0yMywxNCArMjMs
MTIgQEAgU1VQRVJUVVhLQVJUX0RFUEVOREVOQ0lFUyA9IFwKIAloYXJmYnV6eiBcCiAJanBlZyBc
CiAJbGliY3VybCBcCi0JbGliZ2wgXAogCWxpYm9nZyBcCiAJbGlicG5nIFwKIAlsaWJzcXVpc2gg
XAogCWxpYnZvcmJpcyBcCiAJb3BlbmFsIFwKIAlzZGwyIFwKLQl4bGliX2xpYlhyYW5kciBcCiAJ
emxpYgogCiAjIFNpbmNlIHN1cGVydHV4a2FydCBpcyBub3QgaW5zdGFsbGluZyBsaWJzdGtpcnJs
aWNodC5zbywgYW5kIHNpbmNlIGl0IGlzCgotLS0KYmFzZS1jb21taXQ6IDA4ZjM3NTdiMGYyMTMz
YjBlZDUwZTFlZjNkN2E1YTFkOWM4MGRlMWMKY2hhbmdlLWlkOiAyMDI2MDUyNy1tYXN0ZXItNTlh
NmZkNDU1NWFiCgpCZXN0IHJlZ2FyZHMsCi0tICAKUmFwaGHDq2wgR2FsbGFpcy1Qb3UgPHJnYWxs
YWlzcG91QGdtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
