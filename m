Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A65CC282D1
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 16:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3489C6060A;
	Mon,  3 Mar 2025 16:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aKZNpbgRtOjW; Mon,  3 Mar 2025 16:03:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB6EC608FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB6EC608FE;
	Mon,  3 Mar 2025 16:03:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52C3BB91
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4192682047
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id etpde4xtGa2U for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 16:03:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=mickael.tansorier@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 14EBB81E44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14EBB81E44
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14EBB81E44
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:03:32 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-390edaee0cfso2335369f8f.2
 for <buildroot@buildroot.org>; Mon, 03 Mar 2025 08:03:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741017811; x=1741622611;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/9hf66lRJpKMFVyT5s3maYxUjCkBd/CWr7dLTtQW1k=;
 b=ARJv55a8awFMGgantt7OG8Y+Eurq8xPem2gQ+d+nUyIzr7wn8vP5v1EyWBlVfhCeVw
 eD1eg3LQuRJfZ1fGL/xEEyRCUUfysKOC5FqMEfEBuBWlmHxs+t350PgrKZbTbw5rxKgz
 RCmqUIrwEF5XFp5lPzu/ZMSkqTXpW94KH7FlN/nWgvN2f46SnkSZ1d+eDuq8WqjXeBmw
 OKbS0qq5pDt277tm+RD6Lf4oNh3UXjnmp1cLNdfsMcesa/0n3uJ41DicVd9KsikI659C
 iFXnKwUxOqnjpAhkezjNCc2ib3JZFPBnIohluhbIP43geoJ1gvPzKfoBizJT4zAW/w3u
 bD1A==
X-Gm-Message-State: AOJu0YxuNViA91ZpcRkAIJ6q5y/wVUwviwmB/Ljv6y8btCiuf5z8cHf8
 1lJDHqKTMD53c/vWS2XRs4ytuN6HsgAEu7Z+ORJo2SPxTpjCpf5sdEeB20IsRDw3vVt3kUUkBBv
 i
X-Gm-Gg: ASbGncvNcvvtjy6ihSGIsiLbuCkDqBRr8IiD0tnnIiGMFG80hC5FuRA5Nygc9X0idyn
 dLWLTeWAPBeu9Gs7joPxS/X2vMxQKKDqsQCCGVYucjf1NrQbCNX5NZb8eJ14JvP9IJdSeQSPm0H
 SbAkKIaTJi0AfY5r0D248TAo0TuZKeDBVjoqM14bWzRP/D0eucak4uIkiRQdTvoGz+hxtBNWask
 dXtIEhHvsafQS+mroWtilKW7UZOZ16Agoz5UdGKeypDq4jn8fd3LUho+va8RvYgfjdsWZwVBtqH
 S7vhS0Yc/B3lpSEkN2tW8uWmycpFF+OmepWniyW1x23z72ullmTRsq/Z7GdPBeeQDGVZmR0wFgg
 eaKOI9IiMBU4BRqfZU2t2+zYaqu2IDXe6LVV+JCwaQLBW
X-Google-Smtp-Source: AGHT+IEMryLrandMyaKXyJLlFSHVdf2ZBe7YD/ljuSDGq0/u7YjaLYFYgle3JUUGJ9xkRtWO2H0jAQ==
X-Received: by 2002:a05:6000:1faa:b0:38d:d69e:1326 with SMTP id
 ffacd0b85a97d-390ec7c67cfmr9697716f8f.9.1741017810696; 
 Mon, 03 Mar 2025 08:03:30 -0800 (PST)
Received: from baku.localdomain
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b736f8034sm171018495e9.4.2025.03.03.08.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 08:03:30 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
Date: Mon,  3 Mar 2025 17:03:26 +0100
Message-ID: <20250303160326.122921-3-mickael.tansorier@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250303160326.122921-1-mickael.tansorier@smile.fr>
References: <20250303160326.122921-1-mickael.tansorier@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1741017811; x=1741622611; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/9hf66lRJpKMFVyT5s3maYxUjCkBd/CWr7dLTtQW1k=;
 b=Bcu+LTL7rFifF1jAfFi0+fl7orRW8acvXnjpIJmgzUsZszjCtVV1bEyfSImuA9jVI3
 IlFkQJKxgQGzRmvxanjJO9Dn1phNYlBBsSl+K5f5ErGOOpSbIfrtm5h1d6/KQ4v+V7ii
 lT//BbtUXkY0gpdYW7BxFiqpWthtm7DHje7lQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Bcu+LTL7
Subject: [Buildroot] [PATCH 3/3] package/mineclonia: new patckage of
 minetest game
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
From: =?utf-8?q?Micka=C3=ABl_Tansorier_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWluZWNsb25pYSBpcyBhIG1pbmV0ZXN0IGdhbWUgaW5zcGlyZWQgYnkgTWluZWNyYWZ0IFsxXQpU
aGlzIGlzIGxhdGVzdCByZWxlYXNlIGF2YWlsYWJsZSBbMl0KClsxXSBodHRwczovL2NvbnRlbnQu
bHVhbnRpLm9yZy9wYWNrYWdlcy9yeXZuZi9taW5lY2xvbmlhLwpbMl0gaHR0cHM6Ly9jb2RlYmVy
Zy5vcmcvbWluZWNsb25pYS9taW5lY2xvbmlhL3JlbGVhc2VzL3RhZy8wLjExMS4xCgpTaWduZWQt
b2ZmLWJ5OiBNaWNrYcOrbCBUYW5zb3JpZXIgPG1pY2thZWwudGFuc29yaWVyQHNtaWxlLmZyPgot
LS0KIHBhY2thZ2UvbWluZWNsb25pYS9Db25maWcuaW4gICAgICAgfCAgNyArKysrCiBwYWNrYWdl
L21pbmVjbG9uaWEvbWluZWNsb25pYS5oYXNoIHwgMTggKysrKysrKysrKysKIHBhY2thZ2UvbWlu
ZWNsb25pYS9taW5lY2xvbmlhLm1rICAgfCA1MiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKIDMgZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvbWluZWNsb25pYS9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L21pbmVjbG9uaWEvbWluZWNsb25pYS5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9t
aW5lY2xvbmlhL21pbmVjbG9uaWEubWsKCmRpZmYgLS1naXQgYS9wYWNrYWdlL21pbmVjbG9uaWEv
Q29uZmlnLmluIGIvcGFja2FnZS9taW5lY2xvbmlhL0NvbmZpZy5pbgpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi4wM2NhMTE3YTgyCi0tLSAvZGV2L251bGwKKysrIGIvcGFj
a2FnZS9taW5lY2xvbmlhL0NvbmZpZy5pbgpAQCAtMCwwICsxLDcgQEAKK2NvbmZpZyBCUjJfUEFD
S0FHRV9NSU5FQ0xPTklBCisJYm9vbCAibWluZWNsb25pYSIKKwlkZXBlbmRzIG9uIEJSMl9QQUNL
QUdFX01JTkVURVNUCisJaGVscAorCSAgVGhlIG1haW4gc3ViZ2FtZSBmb3IgdGhlIE1pbmV0ZXN0
IGVuZ2luZS4KKworCSAgaHR0cHM6Ly9jb2RlYmVyZy5vcmcvbWluZWNsb25pYS9taW5lY2xvbmlh
CmRpZmYgLS1naXQgYS9wYWNrYWdlL21pbmVjbG9uaWEvbWluZWNsb25pYS5oYXNoIGIvcGFja2Fn
ZS9taW5lY2xvbmlhL21pbmVjbG9uaWEuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwLi5hZWEzODA3ZTczCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9taW5lY2xv
bmlhL21pbmVjbG9uaWEuaGFzaApAQCAtMCwwICsxLDE4IEBACisjIExvY2FsbHkgY2FsY3VsYXRl
ZAorc2hhMjU2ICBiMDlkMWFmOTRjMzU3NmZjODlhMTJjMjNlYTJjZDZlODRkMTE0ZmIwNGEzODlm
MTc0NmYxMzk5NzIxY2QzYWU0ICAwLjExMS4xLnRhci5negorCitzaGEyNTYgIDFiMzc4MmNjYWQ3
Yjg2MTQxMDBjZGEzMGQzZmFmNDJmYzM5ZjJlOTc5MzI5MDhjNTQzMDA1MDUzYjY1NGNhNjggIExJ
Q0VOU0UudHh0CitzaGEyNTYgIDViNjY4NDEwNzA4MjQ5MDBlZWZhOWQzM2Q3YzM4ODdmMmRmYzQz
MzQ3MTdiNDYwYWE3YzhiOGFlMjNkYWY3ZDQgIG1vZHMvRU5USVRJRVMvbWNsX2NoYXJnZXMvdGV4
dHVyZV9saWNlbnNlLnR4dAorc2hhMjU2ICAxZDk3NzYyYzhlNzBlYzEyYzM1YWM5MTU2NjNiZWUw
M2I4YzYwNDJkYzZmOThhZWMxNjdlY2FmZmYzYWYyYmEwICBtb2RzL0hFTFAvbWNsX2NyYWZ0Z3Vp
ZGUvbGljZW5zZS50eHQKK3NoYTI1NiAgYjVmZTAwZjBmYzNlN2U5ZjIyMDViNWNiMGJkYTk1MzJj
ZjZlMTIxYTg1YzZjZGU0ZDFhZDA3MTBhY2NhNjVjMSAgbW9kcy9JVEVNUy9SRURTVE9ORS9MSUNF
TlNFLnR4dAorc2hhMjU2ICBjYTVmNTliNDZmY2ViZDE5NDk4MWM2ZjZiYTFlNzMwZDZhOTU0OGQ5
NDllZjc2ZjczNmFmYzA0MzEwNTQ3YmJhICBtb2RzL0lURU1TL21jbF9hbWV0aHlzdC90ZXh0dXJl
cy9MSUNFTlNFLnR4dAorc2hhMjU2ICA2OTdiNmY1YzE5MDgxOTkwMWRiNGQ5YzBlZmU0NzMwOTFk
MzU3ZjdlNTRmMjIxNTEwZmYzOWQzNGYwMzMzMTBjICBtb2RzL0lURU1TL21jbF9hcm1vcl9zdGFu
ZC9MSUNFTlNFLnR4dAorc2hhMjU2ICAzMzgyZjNiZjk5NTY2MDg5NTQzNjIxZWUzMjU2ZjdmOThi
ZjkzNjRkM2I4NTJjNWVkMDgyMDJkNDM1MjE1ZDdkICBtb2RzL0lURU1TL21jbF9iZWRzL2xpY2Vu
c2UudHh0CitzaGEyNTYgIDRjMTc2ZmU4Njk4MzQwMzdlMzVkNTM5NDYwNTI3NDJhYTM4NzU5ZDNl
NmEyMzQxZGVkNGRlYjM0MzJkZDhhNWEgIG1vZHMvSVRFTVMvbWNsX2Zsb3dlcnBvdHMvbGljZW5z
ZS50eHQKK3NoYTI1NiAgOTZmMTc4NTdmM2ViMjhhN2Q5M2RhZDkzMGJjMDk5YTNjYjY1YTlhMmFm
YjM3MDY5YmZkMWJhNWVjNTk2NDM4OSAgbW9kcy9JVEVNUy9tY2xfaG9wcGVycy9MaWNlbnNlLnR4
dAorc2hhMjU2ICBhODJkZmRhMWM5ZmViNzA0OTk3ZWE0MjExNmViNmExNWExZjNmOTllZThjNDky
MTVmYmJkMzJkNTE5ZThhZDc0ICBtb2RzL0lURU1TL21jbF9zdGFpcnMvbGljZW5zZS50eHQKK3No
YTI1NiAgZGM2MjY1MjBkY2Q1M2EyMmY3MjdhZjNlZTQyYzc3MGU1NmM5N2E2NGZlM2FkYjA2Mzc5
OWQ4YWIwMzJmZTU1MSAgbW9kcy9JVEVNUy9tY2xfdG9yY2hlcy9MSUNFTlNFLnR4dAorc2hhMjU2
ICAwMDY2ZTYzZDY4MmQ1NGEwMTRhZDMzNTk3OTQzNjVhMWFiYjg3NTYyZDJiMWU1ZTMyMDkzOTc2
ZDg4YzI5NWI0ICBtb2RzL0lURU1TL3NjcmV3ZHJpdmVyL2xpY2Vuc2UudHh0CitzaGEyNTYgIGUz
NjFmYzkwMGQ5MjAzODU5MzkxZDM1YzM4YzMyODRjOTE2MDBkMjNjMTYxNzA3NmM2NDFmZjdlOWZl
MTBiMTUgIG1vZHMvTUlTQy9maW5kYmlvbWUvbGljZW5zZS50eHQKK3NoYTI1NiAgZDc0OTE3MmJm
YTk0MmU4N2EwZGJiOTcwZWFmY2MwNjdkNWRmZmE3M2JiNTY4ZTk4ZmVkNDc2ZmZhZDRlYWE1OSAg
bW9kcy9QTEFZRVIvbWNsX3NraW5zL0xJQ0VOU0UudHh0CitzaGEyNTYgIDg0OTUyYmViYTU5OTQx
YmIzODc2OTdhYzU4YzQ3OGM2YTQ5NjZiNjlmNGU5ZGU0NmJlZmIxZjhmMjVlMTk1ZWMgIG1vZHMv
UExBWUVSL21jbF93aWVsZHZpZXcvTElDRU5TRS50eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWlu
ZWNsb25pYS9taW5lY2xvbmlhLm1rIGIvcGFja2FnZS9taW5lY2xvbmlhL21pbmVjbG9uaWEubWsK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZWEzY2M5OTZkMAotLS0gL2Rl
di9udWxsCisrKyBiL3BhY2thZ2UvbWluZWNsb25pYS9taW5lY2xvbmlhLm1rCkBAIC0wLDAgKzEs
NTIgQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIG1pbmVjbG9uaWEKKyMKKyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCisKK01JTkVDTE9OSUFfVkVSU0lPTiA9IDAuMTExLjEKK01JTkVD
TE9OSUFfU09VUkNFID0gJChNSU5FQ0xPTklBX1ZFUlNJT04pLnRhci5negorTUlORUNMT05JQV9T
SVRFID0gaHR0cHM6Ly9jb2RlYmVyZy5vcmcvbWluZWNsb25pYS9taW5lY2xvbmlhL2FyY2hpdmUK
K01JTkVDTE9OSUFfTElDRU5TRSA9IEdQTHYzLCBNSVQgKG1vZHMpCitNSU5FQ0xPTklBX0xJQ0VO
U0VfRklMRVMgPSBMSUNFTlNFLnR4dCBcCisJbW9kcy9iZWRzL2xpY2Vuc2UudHh0IFwKKwltb2Rz
L2Jpbm9jdWxhcnMvbGljZW5zZS50eHQgXAorCW1vZHMvYm9hdHMvbGljZW5zZS50eHQgXAorCW1v
ZHMvYm9uZXMvbGljZW5zZS50eHQgXAorCW1vZHMvYnVja2V0L2xpY2Vuc2UudHh0IFwKKwltb2Rz
L2J1dHRlcmZsaWVzL2xpY2Vuc2UudHh0IFwKKwltb2RzL2NhcnRzL2xpY2Vuc2UudHh0IFwKKwlt
b2RzL2NyZWF0aXZlL2xpY2Vuc2UudHh0IFwKKwltb2RzL2RlZmF1bHQvbGljZW5zZS50eHQgXAor
CW1vZHMvZG9vcnMvbGljZW5zZS50eHQgXAorCW1vZHMvZHVuZ2Vvbl9sb290L2xpY2Vuc2UudHh0
IFwKKwltb2RzL2R5ZS9saWNlbnNlLnR4dCBcCisJbW9kcy9lbnZfc291bmRzL2xpY2Vuc2UudHh0
IFwKKwltb2RzL2Zhcm1pbmcvbGljZW5zZS50eHQgXAorCW1vZHMvZmlyZS9saWNlbnNlLnR4dCBc
CisJbW9kcy9maXJlZmxpZXMvbGljZW5zZS50eHQgXAorCW1vZHMvZmxvd2Vycy9saWNlbnNlLnR4
dCBcCisJbW9kcy9nYW1lX2NvbW1hbmRzL2xpY2Vuc2UudHh0IFwKKwltb2RzL2dpdmVfaW5pdGlh
bF9zdHVmZi9saWNlbnNlLnR4dCBcCisJbW9kcy9rZXlzL2xpY2Vuc2UudHh0IFwKKwltb2RzL21h
cC9saWNlbnNlLnR4dCBcCisJbW9kcy9tdGdfY3JhZnRndWlkZS9saWNlbnNlLnR4dCBcCisJbW9k
cy9wbGF5ZXJfYXBpL2xpY2Vuc2UudHh0IFwKKwltb2RzL3NjcmV3ZHJpdmVyL2xpY2Vuc2UudHh0
IFwKKwltb2RzL3NldGhvbWUvbGljZW5zZS50eHQgXAorCW1vZHMvc2ZpbnYvbGljZW5zZS50eHQg
XAorCW1vZHMvc3Bhd24vbGljZW5zZS50eHQgXAorCW1vZHMvc3RhaXJzL2xpY2Vuc2UudHh0IFwK
Kwltb2RzL3RudC9saWNlbnNlLnR4dCBcCisJbW9kcy92ZXNzZWxzL2xpY2Vuc2UudHh0IFwKKwlt
b2RzL3dhbGxzL2xpY2Vuc2UudHh0IFwKKwltb2RzL3dlYXRoZXIvbGljZW5zZS50eHQgXAorCW1v
ZHMvd29vbC9saWNlbnNlLnR4dCBcCisJbW9kcy94cGFuZXMvbGljZW5zZS50eHQKKworZGVmaW5l
IE1JTkVDTE9OSUFfSU5TVEFMTF9UQVJHRVRfQ01EUworCW1rZGlyIC1wICQoVEFSR0VUX0RJUikv
dXNyL3NoYXJlL21pbmV0ZXN0L2dhbWVzL21pbmVjbG9uaWEKKwljcCAtZHBmciAkKEBEKS8qICQo
VEFSR0VUX0RJUikvdXNyL3NoYXJlL21pbmV0ZXN0L2dhbWVzL21pbmVjbG9uaWEKK2VuZGVmCisK
KyQoZXZhbCAkKGdlbmVyaWMtcGFja2FnZSkpCi0tIAoyLjQ4LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
