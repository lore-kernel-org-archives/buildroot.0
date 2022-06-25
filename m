Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5158C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 17:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1385D60F53;
	Sat, 25 Jun 2022 17:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1385D60F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JhhtfPO61nET; Sat, 25 Jun 2022 17:24:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2075460F3C;
	Sat, 25 Jun 2022 17:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2075460F3C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 213461BF389
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 17:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF51D60F3C
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 17:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF51D60F3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEI_OTIRyZCW for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 17:24:40 +0000 (UTC)
X-Greylist: delayed 00:05:43 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74ACD60C20
Received: from forward104o.mail.yandex.net (forward104o.mail.yandex.net
 [37.140.190.179])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74ACD60C20
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 17:24:37 +0000 (UTC)
Received: from forward103q.mail.yandex.net (forward103q.mail.yandex.net
 [IPv6:2a02:6b8:c0e:50:0:640:b21c:d009])
 by forward104o.mail.yandex.net (Yandex) with ESMTP id 1764165D7DB8
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 20:18:48 +0300 (MSK)
Received: from vla1-2e2fe8fd096a.qloud-c.yandex.net
 (vla1-2e2fe8fd096a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3495:0:640:2e2f:e8fd])
 by forward103q.mail.yandex.net (Yandex) with ESMTP id 1336C56A0B8A
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 20:18:48 +0300 (MSK)
Received: from vla3-3dd1bd6927b2.qloud-c.yandex.net
 (vla3-3dd1bd6927b2.qloud-c.yandex.net [2a02:6b8:c15:350f:0:640:3dd1:bd69])
 by vla1-2e2fe8fd096a.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 BZu5jZY1WO-IlgSj4lD; Sat, 25 Jun 2022 20:18:48 +0300
X-Yandex-Fwd: 2
Received: by vla3-3dd1bd6927b2.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id X5UxHRnqrV-IlN8nUa5; Sat, 25 Jun 2022 20:18:47 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Date: Sat, 25 Jun 2022 20:18:29 +0300
Message-Id: <20220625171830.4009753-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; t=1656177528; 
 bh=ArFCoYywSVbUj6uNTXCwrvV8lQO/DJO2pMB7yFdxFbc=;
 h=Date:Subject:Cc:To:From:Message-Id;
 b=SdV7IX/1RqGEilD6XnpxwRcVn26lUoxOqDHZsx6uQf88d7MDLjp2oqzBKk9/OJA4v
 KEi/F4KTDOeEOU0lth/wo89MEGKIFhyfC7cI0OQSkE7vtP/E2U55Y5dO8UKFqFwiE5
 Xj8t5I7tmQ9S6tJ4ZV8a2IJHI5vMsVziK8hrAhFg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=yuriev.ru header.i=@yuriev.ru
 header.a=rsa-sha256 header.s=mail header.b=SdV7IX/1
X-Mailman-Original-Authentication-Results: vla1-2e2fe8fd096a.qloud-c.yandex.net; dkim=pass header.i=@yuriev.ru
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.11.8
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
Cc: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C?=
 =?UTF-8?q?=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?= <leo@yuriev.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBpcyBzdGFibGUgYnVnZml4IHJlbGVhc2Ugb2YgbGlibWRieC4KVGhlIHByb2plY3QncyB3
ZWJzaXRlIG5vdyBpcyBvbiBodHRwczovL2xpYm1kYnguZHFka2ZhLnJ1LwoKUmVsZWFzZSBub3Rl
cyBmb3IgdjAuMTEuOCBodHRwczovL2dpdGZsaWMucnUvcHJvamVjdC9lcnRoaW5rL2xpYm1kYngv
cmVsZWFzZS8wNjI2ODAzOC0zOWZmLTQyNzAtOWJlOC05ZjI2ZDU1NDMwMTUKClRoZSBjb21wbGV0
ZSBDaGFuZ2VMb2c6IGh0dHBzOi8vZ2l0ZmxpYy5ydS9wcm9qZWN0L2VydGhpbmsvbGlibWRieC9i
bG9iP2ZpbGU9Q2hhbmdlTG9nLm1kCgpTaWduZWQtb2ZmLWJ5OiDQm9C10L7QvdC40LQg0K7RgNGM
0LXQsiAoTGVvbmlkIFl1cmlldikgPGxlb0B5dXJpZXYucnU+Ci0tLQogcGFja2FnZS9saWJtZGJ4
L0NvbmZpZy5pbiAgICB8IDIgKy0KIHBhY2thZ2UvbGlibWRieC9saWJtZGJ4Lmhhc2ggfCAzICsr
LQogcGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWsgICB8IDQgKystLQogMyBmaWxlcyBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9s
aWJtZGJ4L0NvbmZpZy5pbiBiL3BhY2thZ2UvbGlibWRieC9Db25maWcuaW4KaW5kZXggNDg0OWQ2
MGI5Mi4uYTlhNGFjNDVjNSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJtZGJ4L0NvbmZpZy5pbgor
KysgYi9wYWNrYWdlL2xpYm1kYngvQ29uZmlnLmluCkBAIC0xMyw3ICsxMyw3IEBAIGNvbmZpZyBC
UjJfUEFDS0FHRV9MSUJNREJYCiAJICBsaWJtZGJ4IHN1cnBhc3NlcyB0aGUgbGVnZW5kYXJ5IExN
REIgaW4gdGVybXMgb2YKIAkgIHJlbGlhYmlsaXR5LCBmZWF0dXJlcyBhbmQgcGVyZm9ybWFuY2Uu
CiAKLQkgIGh0dHBzOi8vbGlibWRieC53ZWJzaXRlLnlhbmRleGNsb3VkLm5ldC8KKwkgIGh0dHBz
Oi8vbGlibWRieC5kcWRrZmEucnUKIAogaWYgQlIyX1BBQ0tBR0VfTElCTURCWAogCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNoIGIvcGFja2FnZS9saWJtZGJ4L2xpYm1k
YnguaGFzaAppbmRleCA3ZDY2M2IzZGEwLi4zZjJiZTEzNGMzIDEwMDY0NAotLS0gYS9wYWNrYWdl
L2xpYm1kYngvbGlibWRieC5oYXNoCisrKyBiL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lmhhc2gK
QEAgLTEsNCArMSw1IEBACi0jIEhhc2hlcyBmcm9tOiBodHRwczovL2xpYm1kYngud2Vic2l0ZS55
YW5kZXhjbG91ZC5uZXQvcmVsZWFzZS9TSEEyNTZTVU1TCisjIEhhc2hlcyBmcm9tOiBodHRwczov
L2xpYm1kYnguZHFka2ZhLnJ1L3JlbGVhc2UvU0hBMjU2U1VNUworc2hhMjU2ICAwNjAxMWYzNjE0
ODFlZTdhZGMyMTExZTQ4YjdiMTIxMzg0Mjk0ZTBiNmI4ZjEwYzc1ZTc4ODY2MjkyOTdiMjc5ICBs
aWJtZGJ4LWFtYWxnYW1hdGVkLTAuMTEuOC50YXIueHoKIHNoYTI1NiAgM2E5ZmI2YTRjZDk0MWU2
NDY1OTcyMzU1MTg3MTQzNzNmZGExY2E2ZDRjNWUyMzY2OWFmZTcwZWE4N2MyMDk0MCAgbGlibWRi
eC1hbWFsZ2FtYXRlZC0wLjExLjcudGFyLnh6CiAKICMgTG9jYWxseSBjYWxjdWxhdGVkCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5tayBiL3BhY2thZ2UvbGlibWRieC9saWJt
ZGJ4Lm1rCmluZGV4IGE3MDU2YjI4NTAuLjEzMGZlOTY3OTMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
bGlibWRieC9saWJtZGJ4Lm1rCisrKyBiL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rCkBAIC00
LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotTElCTURCWF9WRVJTSU9O
ID0gMC4xMS43CitMSUJNREJYX1ZFUlNJT04gPSAwLjExLjgKIExJQk1EQlhfU09VUkNFID0gbGli
bWRieC1hbWFsZ2FtYXRlZC0kKExJQk1EQlhfVkVSU0lPTikudGFyLnh6Ci1MSUJNREJYX1NJVEUg
PSBodHRwczovL2xpYm1kYngud2Vic2l0ZS55YW5kZXhjbG91ZC5uZXQvcmVsZWFzZQorTElCTURC
WF9TSVRFID0gaHR0cHM6Ly9saWJtZGJ4LmRxZGtmYS5ydS9yZWxlYXNlCiBMSUJNREJYX1NVUFBP
UlRTX0lOX1NPVVJDRV9CVUlMRCA9IE5PCiBMSUJNREJYX0xJQ0VOU0UgPSBPTERBUC0yLjgKIExJ
Qk1EQlhfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
