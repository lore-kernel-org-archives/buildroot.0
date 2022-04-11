Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515C5C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 13:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA0A660FE3;
	Mon, 11 Apr 2022 13:01:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8f7AoJR2pFxs; Mon, 11 Apr 2022 13:01:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A98B60FDB;
	Mon, 11 Apr 2022 13:01:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 113DC1BF591
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 13:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3908408C4
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 13:01:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RkdJwXFUCU7q for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 13:01:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2E0340607
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 13:01:20 +0000 (UTC)
Received: (Authenticated sender: theo.lebrun@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8C584C0007;
 Mon, 11 Apr 2022 13:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649682075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q+/DlproVBv1Y8pYUEiYvZXgWnybhtZ82Ua3lNzuG4o=;
 b=eXCBJsGd2ewXNgHKZls4+ljY94epr7rOspHzS66IV1wDEJTgZwW5WjKM5yizyZpFXBIxZo
 UnLRzrFYn6TaGHvlzTBu7emiu9PjqhZzPzd4BI54KaBF+5m3sJwTOt4nyhXtWyMmdn3Not
 ySLWd4CmbVd9cmSBXERpJQL7koi5pAl6490PNyEKkc4bcmVVbbv+rKwCedZHeDVIZxg2WI
 znnWSa4NWRSx1b3CGxl2RQTPWtr1J4q5yRgWJ6idQjMfqFANDzJ0dekZ0bo45CyLgNk6Cc
 A4kjq4Lr6xPRcJP6T6jdeAh0AAmmyp2iafHtboYq+gFhbWz/1YPdEDqpJoNOIg==
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 15:01:06 +0200
Message-Id: <20220411130106.468304-1-theo.lebrun@bootlin.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/wireplumber: make dbus optional
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
From: =?utf-8?q?Th=C3=A9o_Lebrun_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Cc: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4KLS0t
CiBwYWNrYWdlL3dpcmVwbHVtYmVyL3dpcmVwbHVtYmVyLm1rIHwgNiArKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNr
YWdlL3dpcmVwbHVtYmVyL3dpcmVwbHVtYmVyLm1rIGIvcGFja2FnZS93aXJlcGx1bWJlci93aXJl
cGx1bWJlci5tawppbmRleCAzMjcxMzgzOTFkLi43NjNlM2Q3NjM5IDEwMDY0NAotLS0gYS9wYWNr
YWdlL3dpcmVwbHVtYmVyL3dpcmVwbHVtYmVyLm1rCisrKyBiL3BhY2thZ2Uvd2lyZXBsdW1iZXIv
d2lyZXBsdW1iZXIubWsKQEAgLTksMTMgKzksMTcgQEAgV0lSRVBMVU1CRVJfU09VUkNFID0gd2ly
ZXBsdW1iZXItJChXSVJFUExVTUJFUl9WRVJTSU9OKS50YXIuYnoyCiBXSVJFUExVTUJFUl9TSVRF
ID0gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3BpcGV3aXJlL3dpcmVwbHVtYmVyLy0v
YXJjaGl2ZS8kKFdJUkVQTFVNQkVSX1ZFUlNJT04pCiBXSVJFUExVTUJFUl9MSUNFTlNFID0gTUlU
CiBXSVJFUExVTUJFUl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQotV0lSRVBMVU1CRVJfREVQRU5E
RU5DSUVTID0gaG9zdC1wa2djb25mIGRidXMgcGlwZXdpcmUgbGliZ2xpYjIgbHVhCitXSVJFUExV
TUJFUl9ERVBFTkRFTkNJRVMgPSBob3N0LXBrZ2NvbmYgcGlwZXdpcmUgbGliZ2xpYjIgbHVhCiAK
IFdJUkVQTFVNQkVSX0NPTkZfT1BUUyA9IFwKIAktRGRvYz1kaXNhYmxlZCBcCiAJLURzeXN0ZW0t
bHVhPXRydWUgXAogCS1Ec3lzdGVtLWx1YS12ZXJzaW9uPQogCitpZmVxICgkKEJSMl9QQUNLQUdF
X0RCVVMpLHkpCitXSVJFUExVTUJFUl9ERVBFTkRFTkNJRVMgKz0gZGJ1cworZW5kaWYKKwogaWZl
cSAoJChCUjJfUEFDS0FHRV9HT0JKRUNUX0lOVFJPU1BFQ1RJT04pLHkpCiBXSVJFUExVTUJFUl9E
RVBFTkRFTkNJRVMgKz0gaG9zdC1kb3h5Z2VuIGhvc3QtcHl0aG9uLWx4bWwgZ29iamVjdC1pbnRy
b3NwZWN0aW9uCiBXSVJFUExVTUJFUl9DT05GX09QVFMgKz0gLURpbnRyb3NwZWN0aW9uPWVuYWJs
ZWQKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
