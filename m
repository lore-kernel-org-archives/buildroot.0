Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589C9C61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 20:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE53940831;
	Tue,  1 Sep 2026 20:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJ6Bk1yoWh4B; Tue,  1 Sep 2026 20:33:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788294820;
	bh=I4m603bFKgMauYjK6k9qwzeQiRt4ZIh/HP2tTgWjErM=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TDRhX2iAhA6Qibj4Rb0pXBs4bXuXeuaFR5H/nC1MRW+Gr6AiYgqU/qk4R5ZBX1Rh8
	 lq5cJduyc6mN286tt2PIukEwvEXXQ3X9vM+2NshbTFn28NdOkeaUMFcUo1U5jSx36w
	 izoRz4YkuCi9nd791+aC5CQf8rdm79lM7M+OjCQkBF2L6O/SnIDz1+B6tMpAxVmogt
	 ZCgRVl8kKhswS9m/MuNds3aLWyh+eLBt/iwfLXgBQQ6AYc6B9aSPcpILDROEDdbHBz
	 3ODUFYU2BJBGGYkNhXUUhQJtK9atGBJ3ACnFymdTw6VbqpCmiCwayFcKiXNQXuXLzp
	 r5CjhMWnhOuKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 391DB40802;
	Tue,  1 Sep 2026 20:33:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98DE9334
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 20:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 845FB607C8
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 20:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ac4KVRWwwBxv for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 20:33:36 +0000 (UTC)
X-Greylist: delayed 17333 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 01 Sep 2026 20:33:33 UTC
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=PuQwzpJs
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.253.128;
 helo=13.mo550.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 13.mo550.mail-out.ovh.net (13.mo550.mail-out.ovh.net
 [178.33.253.128])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 086A2607C6
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 20:33:32 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.249.136])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4hZ9CS4m3Hz5xWK
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 15:44:36 +0000 (UTC)
Received: from ghost-submission-c7b579475-6bblp (unknown [10.110.178.240])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 83DA3C0F47;
 Tue,  1 Sep 2026 15:44:36 +0000 (UTC)
Received: from armadeus.com ([37.59.142.103])
 by ghost-submission-c7b579475-6bblp with ESMTPSA
 id B4G+GuTylmrYlB0ALvmVYQ
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 01 Sep 2026 15:44:36 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0052b2cc696-3b17-425d-931b-f3fbf321e76d,
 D60BF69B3836A42800A787C698D99D18B63D5F5F)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 92.148.202.169
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 01 Sep 2026 17:44:32 +0200
MIME-Version: 1.0
Message-Id: <20260901-newt-fix-site-v1-1-da060d60e30f@armadeus.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBCF4VeRWTuQRFDsq5QuvJzU6SJKJlVBf
 Hdju/w4nP8gRRQoPYqDIlZRmUOGLQsapi68wTJmkzOuNq2xHLAl9rKzSgI3NTx661tbOcqfJSJ
 vv97z9bd++w+GdEfoPC/dE5xpcQAAAA==
X-Change-ID: 20260901-newt-fix-site-76efeb1f9132
To: buildroot@buildroot.org
X-Mailer: b4 0.15.2
x-ovh-tracer-id: 17502114053401990861
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTEce/JGGo7/Gzgkn0HOtGoQl/t3FHAc26+u7zKyJVi+wTXLGb5s5/mbsBn1o+ofMNg8RHHALav4Oo4lmPFtNL3Y9/rmaCdIp1WrcO6luoocx/PMPRmbo3fjHoFGPi/kE6tfEGaXDdMlI5krlCmWiFMXhJ7hHfOOnjWaAJdOBRkS/h+C15hOyuar0XTVSgWnizzJVeaWoMJpgNSi6FDpEqqtZ8LVoQZ6h8YMDrKYsUYHG9fsM9ROX64h+VSzAYd+b1fMmid2ZAosTf5QRoHKj6Rj3tAFG8HDzsIzshlIuvDK9HxDWXP2aw2li3Za3ZY53GEyfjGfkp8iYPK5jaMS7P5MKtpZnUBE1oDMwcftpogzvkAmSzX7zC8PmuEpglW14BuIapyiLVRWf9gNxOeuOlYGOWGtyPqzHumvLIdzHyL222L6/LB8jCKgSvl7949QMiX4dLm7+UKCV1U7vpemMAZgMgx7NBAkpsMcYYwmoHleb7/tg4VSE4oJ+RihOuxqYl6yrQjB1xqfp4mj5kGDCO3YSohITlZI9Q+Oy9F6UKTNDf3f+X1NE9zbBfliJSUrE0H980dZEvO8pa4bvzQhMw6wdheKKSlMDjjCyMpgNQljlTfmzEPqz2YPw6YE0KMECYazXWRlJBkBNgTyGDW1EawMAmEiwDPq3N9whQY5Sbog1A
DKIM-Signature: a=rsa-sha256; bh=3OD/fWVm3MZkVKts9x7vDQbMhTL930yuN7/RvlElgSQ=; 
 c=relaxed/relaxed; d=armadeus.com; h=From;
 s=ovhmo103079-selector1; t=1788277476; v=1;
 b=PuQwzpJs4E3KcPmTWulPsmKn2NhIP0dkoIZV7dn43D3Mm0TGp9fKIgPkY6MfQuKHmYPn+YXP
 /Vg19j7EqTaLV7NccKolVvxgwDvUc+I5QL4pKUWbOXFtJl5NCUVMA9nVJhkVh6eCvCqkn5SwsZs
 aeFj2Yxe7xd4xLpow/AfNHLw1HjnZZtVIW0u0XHkuhEzOZq2LQ96jpaEi+0ihiydplZjaFcz5vr
 jE3LinEv2TThsGjRfrVCF5pdvcrMMxKxtXqRJsEYFk+QwC+BtzLMULelasIq3AslUUKIoNUMY3c
 qxTrqfMIFTjEXk3uXO8h7oWTUtvzYh0xocik0o/T/6s2A==
Subject: [Buildroot] [PATCH] package/newt: update _SITE
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

T2xkIFVSTCByZXR1cm5zIDQwNCwgdXBkYXRlIF9TSVRFIHRvIGh0dHBzOi8vcmVsZWFzZXMucGFn
dXJlLm9yZy9uZXd0CgpTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0
aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0tLQogcGFja2FnZS9uZXd0L25ld3QubWsgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9wYWNrYWdlL25ld3QvbmV3dC5tayBiL3BhY2thZ2UvbmV3dC9uZXd0Lm1rCmluZGV4
IDBkNzhmY2EzNDU4MC4uZTc0Zjg3ZDAxYzVlIDEwMDY0NAotLS0gYS9wYWNrYWdlL25ld3QvbmV3
dC5taworKysgYi9wYWNrYWdlL25ld3QvbmV3dC5tawpAQCAtNSw3ICs1LDcgQEAKICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCiAKIE5FV1RfVkVSU0lPTiA9IDAuNTIuMjUKLU5FV1RfU0lURSA9IGh0
dHBzOi8vcGFndXJlLmlvL3JlbGVhc2VzL25ld3QKK05FV1RfU0lURSA9IGh0dHBzOi8vcmVsZWFz
ZXMucGFndXJlLm9yZy9uZXd0CiBORVdUX0lOU1RBTExfU1RBR0lORyA9IFlFUwogTkVXVF9ERVBF
TkRFTkNJRVMgPSBwb3B0IHNsYW5nICQoVEFSR0VUX05MU19ERVBFTkRFTkNJRVMpCiAjIEZvcmNl
IHRvIHVzZSBsaWJpbnRsLCBvdGhlcndpc2UgaXQgZmluZHMgZ2V0dGV4dCBmdW5jdGlvbnMgaW4g
dGhlIEMKCi0tLQpiYXNlLWNvbW1pdDogNTVhN2VjZTllNTNmMmRlMGNkOTYyOTRlZmViMzgwNDVi
YmQ0MWJlZgpjaGFuZ2UtaWQ6IDIwMjYwOTAxLW5ld3QtZml4LXNpdGUtNzZlZmViMWY5MTMyCgpC
ZXN0IHJlZ2FyZHMsCi0tICAKU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5z
a2lAYXJtYWRldXMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
