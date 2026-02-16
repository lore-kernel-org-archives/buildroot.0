Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D707E7BDA9
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 12:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C196160B56;
	Mon, 16 Feb 2026 12:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6PuKm-TCwvl; Mon, 16 Feb 2026 12:22:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E902260B5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771244570;
	bh=4PRHl1NZTEMjFRSS5mfHBa9Lt0Qfkl9orQ4Q18w8kTc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mING28GUbh/P6BJfS4p+f3Zelq6hOk1zaCRDJ3qdS+XOPLKfSL2zQynDTd4YZ2zHr
	 jiCYxI0A1EptuAjVeokbJ3buWeZbrM76fHfxvmhNN9S6yLCHwIQVwlXRT18aWXJxUP
	 rDLyJZgbxMbRdygpvpvHxcKZ9IDyT+T8z9RUhzT/R8QAxRYpuyN3IYLP7Pgtg0Uv3M
	 O5lpz+VPQtRpLay7Zep1tP7wClcu68O+dRs41HaXhONG08BBW8Wfhj2ZJFoHM/ciux
	 IHa77MJcIvQFPIjAAdtPxZf/+QDGUTJJ6sHJQOB8UwhKVYG/OQDqCxOUZSaT6an+Fk
	 QF+Pex+a3Q+9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E902260B5A;
	Mon, 16 Feb 2026 12:22:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 741171EB
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 12:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5792740378
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 12:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id arvU3O6DlNBf for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 12:22:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 45BFE40137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45BFE40137
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45BFE40137
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 12:22:47 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-482f2599980so34235685e9.0
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 04:22:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771244565; x=1771849365;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fFk5jCzXLmY/4Vr6HpYETWdPwkI9ClQEDCI3qTwCwaU=;
 b=RQMYPHTfbKrJSo5xjFJvORmilltm7KedE1Pu/QGe1Kju/f6PeiVKEDkRTGEAN0LZfx
 /EealE1CM1MPZMqSutjZgrWN46e0oL3eUAz2vUwa0ddbXIIsVcCsSgLxKF3XoF7Kdas9
 lMvTHiWjtjD//TBpeei0QR8/EoTNbHqHm0CjRQL+MGehB1p+m89iRaj8RxLX0ocfKxRf
 c3f4hLvLLoR2pLw9R27/RYWaHcbn+ldfqOFi2h+WbaM+uw/3fKcyJSo1LkSlnHkis3Wu
 Cp4Zy77GWC/v2XsJIxKuGOIGlcfzqlDpmJBr07ZMo/ZXfA/+PvqRXg19l1Qjxpirrr02
 zufg==
X-Gm-Message-State: AOJu0YzWh5TNiGM3ypWsQidchVk8Ygwk4L9ae06By0IiTu5mM+tKDElx
 47KhwcHAL1BGn01Ps6ZFKiBxGLdb2253vTlBnThrIDhOnY8peMS/MOO/V8HR
X-Gm-Gg: AZuq6aKZFqCDbq4irVq9l4+d1vmpdv396psCPrHlWPkxxby5PohajEVMhH9QstyVy4Z
 Cmsu+wU7FLE0ZhTB/pEDiBZsCdmF+wWWSXgSU9K3hBC64472anzZWgcCwPXBhEqmve/VCa/6z+A
 gb2cw4kxi1buNdkqQ2WY3U7m2HHiK1hQybkVULo+hVMjNYU3gAp8xZmPY72HtD/kdl7ak6JBT+T
 ABd3jKc5vTvPlblGYpSbNQpDSR7S0XqavMoXvvOI5oAxqlZh+j+DIT+tpbhnhZjmRpetKFTfAv7
 Bn8xtRhEtuEIBAZMMYxG4BGFtxnJS1UyXY6vVNLoF0NFv0ekkLuuoyCDEgDDt2c2wFiKBLqJFyf
 /tlRRt/azJWEMHLEtF/InkDIbGDC0TMiP6SMWUZkNEsbAC7UEqEyhxCXqD5IzZLRhecu/Tzw+IJ
 RPHehZQ8A9dP9mu2Fg24ymhwdrlaaJnGHFo6RyxA==
X-Received: by 2002:a05:600c:630a:b0:483:887:59b0 with SMTP id
 5b1f17b1804b1-48373a7b37amr161346365e9.35.1771244564622; 
 Mon, 16 Feb 2026 04:22:44 -0800 (PST)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8d82sm26623144f8f.31.2026.02.16.04.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 04:22:44 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Mon, 16 Feb 2026 13:21:54 +0100
Message-ID: <20260216122241.106079-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771244565; x=1771849365; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fFk5jCzXLmY/4Vr6HpYETWdPwkI9ClQEDCI3qTwCwaU=;
 b=UCx4LU/q5Dg+Qq4QSRnA+zooscRrTeD9r1h5x+sUQ4bmt+SI+0xPns0ReMM/CTprxi
 uxOeGMs2tLM8wdIGF9tnY/e7S9PW6GEBoRSLq96O2NU7lBt008W/GPsTLikfdpkqukR2
 8EzV2k+h1/eqgjLQodweffOwNYH0mxhA42nUhPBo19Ynk/KvSO+0A3uZerHCtOxS/mTu
 Jj4bOUCHyaktvZxekG1kY2Zz4kzeCIUZJxUPPwB6bsiKlo8CfQ1c5gmmPPrYAr/U8axS
 KJf1fBA426EifMKMPRGOWJVmlVtj6wReDuUseC7e1XWfF+5iFp+G3AlbCjhEvh628i2l
 1puQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UCx4LU/q
Subject: [Buildroot] [v1, 1/1] package/nnn: bump to version 5.2
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

VGhpcyBjb21taXQgdXBkYXRlcyB0aGUgcGFja2FnZSB2ZXJzaW9uIHRvIDUuMi4KCkFzIHRoZSBu
ZXcgdmVyc2lvbiB1dGlsaXplcyBhdG9taWNzIChzZWUgY29tbWl0CjdjZTQ5MTNiYzM5YmMzYjM0
YTBlMmMzZGU3MTUzZmIwOWQ0ODkxNTIpLCB0aGUgcGF0Y2ggYWxzbyB1cGRhdGVzIHRoZQpsaW5r
YWdlIGZsYWdzIHRvIGFkZCAnbGliYXRvbWljJy4KCkNoYW5nZWxvZzogaHR0cHM6Ly9naXRodWIu
Y29tL2phcnVuL25ubi9ibG9iL3Y1LjIvQ0hBTkdFTE9HCgpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5k
ZXIgU2hpcm9rb3YgPHNoaXJva292YWxleHNAZ21haWwuY29tPgotLS0KIHBhY2thZ2Uvbm5uL0Nv
bmZpZy5pbiB8IDEgKwogcGFja2FnZS9ubm4vbm5uLmhhc2ggIHwgNCArKy0tCiBwYWNrYWdlL25u
bi9ubm4ubWsgICAgfCA4ICsrKysrLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL25ubi9Db25maWcuaW4gYi9w
YWNrYWdlL25ubi9Db25maWcuaW4KaW5kZXggNjRjZmE4ZTBhNS4uYTFhM2JkNTA1YSAxMDA2NDQK
LS0tIGEvcGFja2FnZS9ubm4vQ29uZmlnLmluCisrKyBiL3BhY2thZ2Uvbm5uL0NvbmZpZy5pbgpA
QCAtMSw2ICsxLDcgQEAKIGNvbmZpZyBCUjJfUEFDS0FHRV9OTk4KIAlib29sICJubm4iCiAJZGVw
ZW5kcyBvbiBCUjJfVVNFX01NVSAjIGZvcmsKKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFT
X0FUT01JQwogCSMgQnVpbGRpbmcgbm5uIHdpdGhvdXQgd2lkZWNoYXIvVVRGIHN1cHBvcnQgaXMg
dGhlb3JldGljYWxseQogCSMgcG9zc2libGUsIGJ1dCBpbiBwcmFjdGljZSBpdCBsZWFkcyB0byB1
bnN0YWJsZSBidWlsZHMuCiAJIyBUaGF04oCZcyB3aHkgdGhlIFdDSEFSIGRlcGVuZGVuY3kgaXMg
aGVyZS4KZGlmZiAtLWdpdCBhL3BhY2thZ2Uvbm5uL25ubi5oYXNoIGIvcGFja2FnZS9ubm4vbm5u
Lmhhc2gKaW5kZXggNjcwYTU5MWFmYi4uMGQ2ZjE2MzViNiAxMDA2NDQKLS0tIGEvcGFja2FnZS9u
bm4vbm5uLmhhc2gKKysrIGIvcGFja2FnZS9ubm4vbm5uLmhhc2gKQEAgLTEsMyArMSwzIEBACiAj
IExvY2FsbHkgY29tcHV0ZWQKLXNoYTI1NiAgOWZhYWZmMWUzZjVhMmZkM2VkNTcwYTgzZjZmYjNi
YWYwYmZjNmViZDZhOWFiYWMxNjIwM2QwNTdhYzNmZmZlMyAgbm5uLTUuMS50YXIuZ3oKLXNoYTI1
NiAgODI5ZjQ4NWRjNGYyZjUxYzI0NzFiMzZhOTllMjJmMTVmZjIxNDk2NmUxNmI3MmNkNzk3Njhi
MjMzOGI0MTMyYiAgTElDRU5TRQorc2hhMjU2ICBmMTY2ZWRhNTA5M2FjOGRjZjhjYmJjNjIyNDEy
M2EzMmM1M2NmMzdiODJjNWMxY2I0OGUyZTIzMzUyNzU0MDMwICBubm4tNS4yLnRhci5negorc2hh
MjU2ICAyMDkyMzhlOWVmZjM5OTdhNGU0MzE3NmRhZGY3ZTQxZTcxZjA3Nzg0ZDFhNmM4ZDg5Mzgw
Nzc3OTc2ZjVlMmRjICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL25ubi9ubm4ubWsgYi9w
YWNrYWdlL25ubi9ubm4ubWsKaW5kZXggYWNiZDBjZTMxNC4uNzI5NDAwM2ZiZiAxMDA2NDQKLS0t
IGEvcGFja2FnZS9ubm4vbm5uLm1rCisrKyBiL3BhY2thZ2Uvbm5uL25ubi5tawpAQCAtNCw3ICs0
LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLU5OTl9WRVJTSU9OID0gNS4xCitO
Tk5fVkVSU0lPTiA9IDUuMgogTk5OX0xJQ0VOU0UgPSBCU0QtMi1DbGF1c2UKIE5OTl9MSUNFTlNF
X0ZJTEVTID0gTElDRU5TRQogTk5OX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGphcnVuLG5ubix2JChO
Tk5fVkVSU0lPTikpCkBAIC0xNSwxMCArMTUsMTIgQEAgTk5OX01BS0VfRkxBR1MgPSBcCiAJQ0ZM
QUdTX09QVElNSVpBVElPTj0gXAogCVBSRUZJWD0vdXNyCiAKKyMgTXVzdCBiZSBwYXNzZWQgaW4g
ZW52IHNvIGl0IGNhbiBiZSBhcHBlbmRlZCB0byBieSB0aGUgTWFrZWZpbGUKK05OTl9NQUtFX0VO
ViArPSBMRExJQlM9Ii1sYXRvbWljIgorCiBpZmVxICgkKEJSMl9UT09MQ0hBSU5fVVNFU19HTElC
QyksKQogTk5OX0RFUEVOREVOQ0lFUyArPSBtdXNsLWZ0cwotIyBNdXN0IGJlIHBhc3NlZCBpbiBl
bnYgc28gaXQgY2FuIGJlIGFwcGVuZGVkIHRvIGJ5IHRoZSBNYWtlZmlsZQotTk5OX01BS0VfRU5W
ICs9IExETElCUz0iLWxmdHMiCitOTk5fTUFLRV9FTlYgKz0gTERMSUJTPSItbGZ0cyAtbGF0b21p
YyIKIGVuZGlmCiAKIGlmZXEgKCQoQlIyX1BBQ0tBR0VfUkVBRExJTkUpLHkpCi0tIAoyLjUzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
