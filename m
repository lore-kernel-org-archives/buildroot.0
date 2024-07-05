Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4820CC3271F
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 09:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B972340BB7;
	Fri,  5 Jul 2024 09:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtEc_TwND-hJ; Fri,  5 Jul 2024 09:14:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52A6040B7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52A6040B7B;
	Fri,  5 Jul 2024 09:14:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BDF651BF31D
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 09:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABA476066D
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 09:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0fr75s7cMDC for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 09:14:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A99660668
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A99660668
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A99660668
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 09:14:31 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ee794ec046so15424461fa.2
 for <buildroot@buildroot.org>; Fri, 05 Jul 2024 02:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720170870; x=1720775670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+clVaaIKu6hvvJQGzKQeo6b2ATmPI9ey9es9kAYARcA=;
 b=OhXt07lkQJv/PvE+t1B3E3qAmHyBuZOMPq6q5OG0cpVY7zgceOfYhl0sE/YGGhwM1z
 DTFJ2jWQCYmqwIzCgRisekdRDJUm4fJQzykswkBXdX/vyN86O7PaYy6NcgUor1Fl+nJm
 WXYT0omZ4/Bo/f6Pl9jVAeDR664Pz5/TwfxutbdxTKMAIfPsqPbH9azNMolzjNU7uc07
 Gm3lnG7Q8NGDs4K+dii9SqUwsxWy7jgCM7ahhqa7jcdsc/okx8McGVupiaiWb4y8B+JR
 O9egdkLWWeXOxngbFgjXEaBYDUZFuRmGf0jPOVaOpGnIF+rStCpDbp8KW1t1f+q6aCqV
 5KgA==
X-Gm-Message-State: AOJu0YwexlIhK/50ubUzI/lOoc7+caIVtN9iSWfTbCMZvsPXNZFwynaX
 ivfwWgbD5TxNVFStZOTxj3UbWGn+lVSH1iq5JsStla97cMOqewGvyXW9KNwg56cZrDAj2PgZtbh
 KO50=
X-Google-Smtp-Source: AGHT+IFaRhNopXdlT57Vzcvwl58Qjdp99ujm+XF97X20UrHx1uN9+JQU9dIN6RiRDAyrUu7yd4oM/Q==
X-Received: by 2002:a2e:8193:0:b0:2ee:7a54:3b08 with SMTP id
 38308e7fff4ca-2ee8ed62d3emr28444071fa.3.1720170869870; 
 Fri, 05 Jul 2024 02:14:29 -0700 (PDT)
Received: from junian.fritz.box (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367963fa692sm5486844f8f.85.2024.07.05.02.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:14:29 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  5 Jul 2024 11:14:08 +0200
Message-Id: <20240705091409.3370272-3-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240705091409.3370272-1-raphael.melotte@mind.be>
References: <20240701145708.2886402-1-raphael.melotte@mind.be>
 <20240705091409.3370272-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720170870; x=1720775670; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+clVaaIKu6hvvJQGzKQeo6b2ATmPI9ey9es9kAYARcA=;
 b=g8vKVo5sAUisyD3UKQqtcfu/K8Bym61MUoeEQ6iuRdfuMZ06oB8GSlQ+xuZ5gKAq2c
 sbYx5N047idoQM6e97OnzLFTB+3edZnHdtAtgVOsokvX3VcVL8W3vHnrGKLehG4mQI0Z
 eUg9JxNEMdOmVtW+XeEMd6f6jeVm1D7FLi7sEmpptOdfjFTusC0CTs+gwGoaB/wbmtCQ
 4rca+hs8Qs51a7Rq9g0EVv2cgjhtsciUqzTKuKKvFVunxj67dSZkTH6/7/t66YZ/9dti
 G7uIee4KGD7VgcatEIGJ1/xC24bgMAIPXAw6q6jRDpI3ePIkEewlOMZV9IZ5BFF/m2mw
 qdnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=g8vKVo5s
Subject: [Buildroot] [PATCH v2 3/4] package/python-sdbus-networkmanager: new
 package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KQ2hhbmdlcyB2MSAtPiB2MjoKICAtIEZpeCBsaWNlbnNlLgogIC0gQWRkIGNvbW1lbnQg
d2hlbiBuZXR3b3JrLW1hbmFnZXIgaXMgbm90IGF2YWlsYWJsZS4KCiBERVZFTE9QRVJTICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvQ29uZmln
LmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9weXRo
b24tc2RidXMtbmV0d29ya21hbmFnZXIvQ29uZmlnLmluICAgICAgfCAxMSArKysrKysrKysrKwog
Li4uL3B5dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlci5oYXNoICAgICAgICAgICAgICAgfCAgNSAr
KysrKwogLi4uL3B5dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlci5tayAgICAgICAgICAgICAgICAg
fCAxNCArKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCiBj
cmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tc2RidXMtbmV0d29ya21hbmFnZXIvQ29u
ZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tc2RidXMtbmV0d29ya21h
bmFnZXIvcHl0aG9uLXNkYnVzLW5ldHdvcmttYW5hZ2VyLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3B5dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlci9weXRob24tc2RidXMtbmV0d29y
a21hbmFnZXIubWsKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCAx
NDZjNmZmZWE1Li45YWJmMmQ0OTBiIDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVM
T1BFUlMKQEAgLTI2NjksNiArMjY2OSw3IEBAIEY6CXBhY2thZ2UvcHl0aG9uLXB5bXVwZGYvCiBG
OglwYWNrYWdlL3B5dGhvbi1yc2EvCiBGOglwYWNrYWdlL3B5dGhvbi1zM3RyYW5zZmVyLwogRjoJ
cGFja2FnZS9weXRob24tc2RidXMvCitGOglwYWNrYWdlL3B5dGhvbi1zZGJ1cy1uZXR3b3JrbWFu
YWdlci8KIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fam1l
c3BhdGgucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25f
cnNhLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3Mz
dHJhbnNmZXIucHkKZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25m
aWcuaW4KaW5kZXggNDVkOGE4YzdlYy4uMTZhMDg3NDVjZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9D
b25maWcuaW4KKysrIGIvcGFja2FnZS9Db25maWcuaW4KQEAgLTEzMzUsNiArMTMzNSw3IEBAIG1l
bnUgIkV4dGVybmFsIHB5dGhvbiBtb2R1bGVzIgogCXNvdXJjZSAicGFja2FnZS9weXRob24tc2No
ZWR1bGUvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRob24tc2NpcHkvQ29uZmlnLmlu
IgogCXNvdXJjZSAicGFja2FnZS9weXRob24tc2RidXMvQ29uZmlnLmluIgorCXNvdXJjZSAicGFj
a2FnZS9weXRob24tc2RidXMtbmV0d29ya21hbmFnZXIvQ29uZmlnLmluIgogCXNvdXJjZSAicGFj
a2FnZS9weXRob24tc2Rub3RpZnkvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRob24t
c2VjcmV0c3RvcmFnZS9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1zZWUvQ29u
ZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc2RidXMtbmV0d29ya21hbmFnZXIv
Q29uZmlnLmluIGIvcGFja2FnZS9weXRob24tc2RidXMtbmV0d29ya21hbmFnZXIvQ29uZmlnLmlu
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjcwZWMxMTQxNGMKLS0tIC9k
ZXYvbnVsbAorKysgYi9wYWNrYWdlL3B5dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlci9Db25maWcu
aW4KQEAgLTAsMCArMSwxMSBAQAorY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9TREJVU19ORVRX
T1JLTUFOQUdFUgorCWJvb2wgInB5dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlciIKKwlkZXBlbmRz
IG9uIEJSMl9QQUNLQUdFX05FVFdPUktfTUFOQUdFUiAjIHJ1bnRpbWUKKwlzZWxlY3QgQlIyX1BB
Q0tBR0VfUFlUSE9OX1NEQlVTICMgcnVudGltZQorCWhlbHAKKwkgIE5ldHdvcmtNYW5hZ2VyIGJp
bmRzIGZvciBzZGJ1cy4KKworCSAgaHR0cHM6Ly9naXRodWIuY29tL2lnbzk1ODYyL3B5dGhvbi1z
ZGJ1cworCitjb21tZW50ICJweXRob24tc2RidXMtbmV0d29ya21hbmFnZXIgbmVlZHMgbmV0d29y
ay1tYW5hZ2VyIgorCWRlcGVuZHMgb24gIUJSMl9QQUNLQUdFX05FVFdPUktfTUFOQUdFUgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9weXRob24tc2RidXMtbmV0d29ya21hbmFnZXIvcHl0aG9uLXNkYnVz
LW5ldHdvcmttYW5hZ2VyLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdl
ci9weXRob24tc2RidXMtbmV0d29ya21hbmFnZXIuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwLi5kYTY1ZTNjZGE0Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9w
eXRob24tc2RidXMtbmV0d29ya21hbmFnZXIvcHl0aG9uLXNkYnVzLW5ldHdvcmttYW5hZ2VyLmhh
c2gKQEAgLTAsMCArMSw1IEBACisjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9w
eXBpL3NkYnVzLW5ldHdvcmttYW5hZ2VyL2pzb24KK21kNSAgY2UyNzkwODU1OWYyMDAyMTlhMDkw
YjYxNTAzYzJlZjYgIHNkYnVzLW5ldHdvcmttYW5hZ2VyLTIuMC4wLnRhci5negorc2hhMjU2ICAz
NTcyYWMzYTgxODljNjgzZWMwNDE2YWNiMTQ4NzYxNzczYThmMDg4MWFkM2Q3OGI2ZDZmNjg2NGVm
ZjljNTBiICBzZGJ1cy1uZXR3b3JrbWFuYWdlci0yLjAuMC50YXIuZ3oKKyMgTG9jYWxseSBjb21w
dXRlZCBzaGEyNTYgY2hlY2tzdW1zCitzaGEyNTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRk
OGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUyMWI4ODA2NDMgIENPUFlJTkcKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcHl0aG9uLXNkYnVzLW5ldHdvcmttYW5hZ2VyL3B5dGhvbi1zZGJ1cy1uZXR3
b3JrbWFuYWdlci5tayBiL3BhY2thZ2UvcHl0aG9uLXNkYnVzLW5ldHdvcmttYW5hZ2VyL3B5dGhv
bi1zZGJ1cy1uZXR3b3JrbWFuYWdlci5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwLi4yYWQ5Mzg1MmZjCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9weXRob24tc2Ri
dXMtbmV0d29ya21hbmFnZXIvcHl0aG9uLXNkYnVzLW5ldHdvcmttYW5hZ2VyLm1rCkBAIC0wLDAg
KzEsMTQgQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHB5dGhvbi1zZGJ1cy1uZXR3
b3JrbWFuYWdlcgorIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworUFlUSE9OX1NEQlVTX05F
VFdPUktNQU5BR0VSX1ZFUlNJT04gPSAyLjAuMAorUFlUSE9OX1NEQlVTX05FVFdPUktNQU5BR0VS
X1NPVVJDRSA9IHNkYnVzLW5ldHdvcmttYW5hZ2VyLSQoUFlUSE9OX1NEQlVTX05FVFdPUktNQU5B
R0VSX1ZFUlNJT04pLnRhci5negorUFlUSE9OX1NEQlVTX05FVFdPUktNQU5BR0VSX1NJVEUgPSBo
dHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMzEvYWIvZTg2NGM2YzJlYjc3
OGMxOTRjZmI1NmNkOWQ5OGI1NTk0ZGMwMDU3MzIxMGZkZjZiNDQ5MDQ3NDVhMGJmCitQWVRIT05f
U0RCVVNfTkVUV09SS01BTkFHRVJfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKK1BZVEhPTl9TREJV
U19ORVRXT1JLTUFOQUdFUl9MSUNFTlNFID0gTEdQTC0yLjErCitQWVRIT05fU0RCVVNfTkVUV09S
S01BTkFHRVJfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKKworJChldmFsICQocHl0aG9uLXBhY2th
Z2UpKQotLSAKMi4zNy4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
