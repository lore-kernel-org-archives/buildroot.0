Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02ADCC3271F
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 09:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CC59409A0;
	Fri,  5 Jul 2024 09:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bm6-7XyrVisN; Fri,  5 Jul 2024 09:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2BB1408B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2BB1408B0;
	Fri,  5 Jul 2024 09:14:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABE061BF31D
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 09:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4111811A8
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 09:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9krvPAr35GYZ for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 09:14:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0249580F10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0249580F10
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0249580F10
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 09:14:28 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3679f806223so798728f8f.0
 for <buildroot@buildroot.org>; Fri, 05 Jul 2024 02:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720170866; x=1720775666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tMk6P80hzfK01PqrpZZRHJG8OQPa/fhdclssi9a7cGc=;
 b=Y6kBTEbVvdGrRGgCDNFiGmS3VSia3jqusMf4eJpNJvZxokI1GgO3udwHy/5P6nV+pQ
 XrURczdGnv/qQNmpJ+3qSyOjzhTzZk7r/7CvMgokIQARrqSt5e8fwk/B/LjIjmUXW08E
 rTvIBvlxtRoI5uRJq45kTDYjOEJj8Wsedof9UbCRRuiEMjCMZMeIrtJSv252z4irVnRU
 /8kCUsy2btv07Jcl9MVcma8yqaZYUsrlK2r3jGqiJbuxhPo8TjaerWEa4jI6xpE1ehKq
 plEccVKm04sy16bD3yeyvme6ZMkZO9Mep1rxrAtXuFLEhfOdDXmO5PtM3QUw+awzlm9l
 R4jA==
X-Gm-Message-State: AOJu0YxM/MFFAKXliNKPTijOGd0igcgLs3dSQ9QJy1Y90rKP+7otaS8X
 yQnZX8Di5+OlyiY9p9ULbqeRSFVXZKHJ3iKt5AjGotcxdUOqlHLD6+R8ZilAWwMDWa5x6xWJ+t1
 X8Ig=
X-Google-Smtp-Source: AGHT+IGt7sZ1BLREGeI5jDr6uhUHwjDNcL0P48wB6wBd3ATm3zyet6sYpN9hY4bn4aw4MA6Ydes22w==
X-Received: by 2002:a05:6000:12c3:b0:363:776:821b with SMTP id
 ffacd0b85a97d-3679f5f187cmr3551845f8f.0.1720170866513; 
 Fri, 05 Jul 2024 02:14:26 -0700 (PDT)
Received: from junian.fritz.box (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367963fa692sm5486844f8f.85.2024.07.05.02.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:14:25 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  5 Jul 2024 11:14:06 +0200
Message-Id: <20240705091409.3370272-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240701145708.2886402-1-raphael.melotte@mind.be>
References: <20240701145708.2886402-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720170866; x=1720775666; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tMk6P80hzfK01PqrpZZRHJG8OQPa/fhdclssi9a7cGc=;
 b=DSY0VwlfIxMk6L6nGBbgnD0D55xbjR6Xn1wCuANH34uHO26nZmftPYZsO0yH63D3Pw
 AGsm4RyOJ8FAzHZVoIMilElHaOFWfie+0IEm+mx607/Y2rkt/fFG/taGe+cmYvO4QUfn
 C1zyiBvqHOLOjZCXUxX1pHrnTJIUH85lK82E9MggfSjOWnHEcUhu2o8d8e5uC0/cDeMa
 qlsnDQkU5qexwdarucK6c2iTLxKGa5oG5a/++9I4xfMFDMP/UwiXhZdg1Kx28Q/jfbKi
 q0SX/ckh4yYIonBvaTHjB2CrEvVUurDggTzk7pKAH5z2KnIO/NkPXS1//gDZDdd/t3aG
 GqEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DSY0Vwlf
Subject: [Buildroot] [PATCH v2 1/4] package/python-sdbus: new package
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KQ2hhbmdlcyB2MSAtPiB2MjoKICAtIEZpeCBsaWNlbnNlLgogIC0gQWRkIGNvbW1lbnQg
d2hlbiBzeXN0ZW1kIGlzIG5vdCBhdmFpbGFibGUuCgogREVWRUxPUEVSUyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAg
ICAgICB8ICAxICsKIHBhY2thZ2UvcHl0aG9uLXNkYnVzL0NvbmZpZy5pbiAgICAgICAgIHwgMTEg
KysrKysrKysrKysKIHBhY2thZ2UvcHl0aG9uLXNkYnVzL3B5dGhvbi1zZGJ1cy5oYXNoIHwgIDUg
KysrKysKIHBhY2thZ2UvcHl0aG9uLXNkYnVzL3B5dGhvbi1zZGJ1cy5tayAgIHwgMTkgKysrKysr
KysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tc2RidXMvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9weXRob24tc2RidXMvcHl0aG9uLXNkYnVzLmhhc2gKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1zZGJ1cy9weXRob24tc2RidXMubWsKCmRpZmYgLS1naXQg
YS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCA4YTVjY2ViYTc4Li4wZDU4ZGY3ZDUwIDEw
MDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTI2NjgsNiArMjY2OCw3
IEBAIEY6CXBhY2thZ2UvcHl0aG9uLWptZXNwYXRoLwogRjoJcGFja2FnZS9weXRob24tcHltdXBk
Zi8KIEY6CXBhY2thZ2UvcHl0aG9uLXJzYS8KIEY6CXBhY2thZ2UvcHl0aG9uLXMzdHJhbnNmZXIv
CitGOglwYWNrYWdlL3B5dGhvbi1zZGJ1cy8KIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3NhbXBsZV9weXRob25fam1lc3BhdGgucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3NhbXBsZV9weXRob25fcnNhLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS9zYW1wbGVfcHl0aG9uX3MzdHJhbnNmZXIucHkKZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29u
ZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5kZXggNTUwZmRjMWY0MS4uNDVkOGE4YzdlYyAx
MDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9Db25maWcuaW4KQEAg
LTEzMzQsNiArMTMzNCw3IEBAIG1lbnUgIkV4dGVybmFsIHB5dGhvbiBtb2R1bGVzIgogCXNvdXJj
ZSAicGFja2FnZS9weXRob24tc2NhcHkvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRo
b24tc2NoZWR1bGUvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRob24tc2NpcHkvQ29u
ZmlnLmluIgorCXNvdXJjZSAicGFja2FnZS9weXRob24tc2RidXMvQ29uZmlnLmluIgogCXNvdXJj
ZSAicGFja2FnZS9weXRob24tc2Rub3RpZnkvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9w
eXRob24tc2VjcmV0c3RvcmFnZS9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1z
ZWUvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc2RidXMvQ29uZmlnLmlu
IGIvcGFja2FnZS9weXRob24tc2RidXMvQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLmIyZDM5OTBhYjQKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3B5
dGhvbi1zZGJ1cy9Db25maWcuaW4KQEAgLTAsMCArMSwxMSBAQAorY29uZmlnIEJSMl9QQUNLQUdF
X1BZVEhPTl9TREJVUworCWJvb2wgInB5dGhvbi1zZGJ1cyIKKwlkZXBlbmRzIG9uIEJSMl9QQUNL
QUdFX1NZU1RFTUQgIyByZXF1aXJlZCB0byBnZXQgc2QtYnVzCisJaGVscAorCSAgTW9kZXJuIFB5
dGhvbiBELUJ1cyBsaWJyYXJ5LiBCYXNlZCBvbiBzZC1idXMgZnJvbQorCSAgbGlic3lzdGVtZC4K
KworCSAgaHR0cHM6Ly9naXRodWIuY29tL2lnbzk1ODYyL3B5dGhvbi1zZGJ1cworCitjb21tZW50
ICJweXRob24tc2RidXMgbmVlZHMgc3lzdGVtZCIKKwlkZXBlbmRzIG9uICFCUjJfUEFDS0FHRV9T
WVNURU1ECmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zZGJ1cy9weXRob24tc2RidXMuaGFz
aCBiL3BhY2thZ2UvcHl0aG9uLXNkYnVzL3B5dGhvbi1zZGJ1cy5oYXNoCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjEzYzhjMmJiNWYKLS0tIC9kZXYvbnVsbAorKysgYi9w
YWNrYWdlL3B5dGhvbi1zZGJ1cy9weXRob24tc2RidXMuaGFzaApAQCAtMCwwICsxLDUgQEAKKyMg
bWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvc2RidXMvanNvbgorbWQ1ICA0
NmQzZWEwMGE0OTFjMmVlYzJhMjVjY2Y2MWI4YTc3YSAgc2RidXMtMC4xMi4wLnRhci5negorc2hh
MjU2ICBjMzY5MmQ3NTcwNDQzOGE3OGFkYzE0MzkzNTBiYzMyZjMwZDZiMzhhZDM0NGNmYzk0Nzcz
ZGI4OWM2Y2U0YTg5ICBzZGJ1cy0wLjEyLjAudGFyLmd6CisjIExvY2FsbHkgY29tcHV0ZWQgc2hh
MjU2IGNoZWNrc3Vtcworc2hhMjU2ICA4MTc3Zjk3NTEzMjEzNTI2ZGYyY2Y2MTg0ZDhmZjk4NmM2
NzVhZmI1MTRkNGU2OGE0MDQwMTA1MjFiODgwNjQzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNr
YWdlL3B5dGhvbi1zZGJ1cy9weXRob24tc2RidXMubWsgYi9wYWNrYWdlL3B5dGhvbi1zZGJ1cy9w
eXRob24tc2RidXMubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMGIz
ZWEzN2IzMAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLXNkYnVzL3B5dGhvbi1z
ZGJ1cy5tawpAQCAtMCwwICsxLDE5IEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyBw
eXRob24tc2RidXMKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK1BZVEhPTl9TREJVU19W
RVJTSU9OID0gMC4xMi4wCitQWVRIT05fU0RCVVNfU09VUkNFID0gc2RidXMtJChQWVRIT05fU0RC
VVNfVkVSU0lPTikudGFyLmd6CitQWVRIT05fU0RCVVNfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0
aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy84ZS8zOS8zZDQ5ZjBkMThkY2JhMzM0NGFmNzU2ZjMxZTQ0
MDhlN2RlNTBiM2RmODZmYTNmM2VhNmY2MDQ0MDJmMTYKK1BZVEhPTl9TREJVU19TRVRVUF9UWVBF
ID0gc2V0dXB0b29scworUFlUSE9OX1NEQlVTX0xJQ0VOU0UgPSBMR1BMLTIuMSsKK1BZVEhPTl9T
REJVU19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORworUFlUSE9OX1NEQlVTX0RFUEVOREVOQ0lFUyA9
IHN5c3RlbWQKKworaWZlcSAoJChCUjJfU1RBVElDX0xJQlMpLHkpCitQWVRIT05fU0RCVVNfRU5W
ICs9IFBZVEhPTl9TREJVU19VU0VfU1RBVElDX0xJTks9MQorZW5kaWYKKworJChldmFsICQocHl0
aG9uLXBhY2thZ2UpKQotLSAKMi4zNy4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
