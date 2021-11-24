Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28291C433F5
	for <buildroot@archiver.kernel.org>; Wed, 24 Nov 2021 18:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAD2661BB9;
	Wed, 24 Nov 2021 18:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ECjbgz1Rsei0; Wed, 24 Nov 2021 18:05:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1868C61BB3;
	Wed, 24 Nov 2021 18:05:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 739051BF286
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 18:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62E64402F2
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 18:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VbNoEO_kFLej for <buildroot@lists.busybox.net>;
 Wed, 24 Nov 2021 18:05:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD857402BE
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 18:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1637777111;
 bh=eMNhZTznzv+Db9Drmb2RYOYVCHbi2Blc7k6Wii5TPjU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=NaBs/p5PmUxt8xnpiN1Gx7BHkwz7OQJIqqOy7DW9Xl6ODU3oEngsJTuaO8b1+qpOR
 jFuNnp3/IWi7an+eHC7xQxEsmAAR6JKJOLwl7WlK1WDhZnV7qg16M3/p+MH+RJX9LQ
 7X8BUwSBy/haBW0gPWOMBD8fokoXD7XIxkcnkrY4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.142]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mr9Bk-1mJZlg3RME-00oGfj; Wed, 24 Nov 2021 19:05:10 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 24 Nov 2021 19:05:09 +0100
Message-Id: <20211124180509.20403-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:fArofVwGMbh3+XKzNgM9lWjhdPgEmatwaRcqazesbJl1AGU26OE
 FR985BA/hfHh4Z9ef+Z2l+UYUog81iBjfGNBM+Od7/1BOGXTFUr4z4z6weH8aKt16+hrJhA
 Kn9ZsyUYEQmdwOJr5qMylqDcQV6OUOoOMXOp1CDuztNpZ6b9CU45g0HKTgW1BBKmIRxRktY
 Vbh9tdaPcPedkMUQzYHsw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YX5vm257FY4=:Pfvt0sGqx5UTRuPDogtGK3
 Bls1GEHt5i47BoRuRfBdZvpL/i9Z6f2Qmpw15z7itMccrUjasgjDM6R8pAzk4mjL/tCSt35pu
 EYKmjKL1ELdvgFVg3XGFbj2sBClowZDODjL8CTpjQdoyp7sIYAfjJW+QVFEq7zD3IF0CqHoMO
 2FxJ96qpulKZvK+XRo8KCRKd+vizbi9htOOSyAvjKyj1YVQFqeAEPBE7c3vkIJDFQTPt9kebw
 mER9R7eFXL/YQdh9GgbmlQKM10Fo6TA9reNaW76IxobtyFn8jXxwkJXzrAGXocDzUI7nZnXWh
 QbBsSHTFyZMTx9MX0NDKJDfiBd5H5Shhc1BIh0Yvw0+BY0kbyBusZes7FpJelBRgb2OFBtpHv
 W1gj8x+k2YHixX+RlT6v2imUaveI14tAFaF4/vpQLsGtbyd5d8pI/Q5qC/e+oolfw0x6F8SZO
 rHLluz4dj/XptY6tOJ0YZJSH0vP+rW6jNJklCJrYu0+76h3k+OSG8OwWMzyfetZF5ib1fhvoc
 y96kz4Akn/NY98drST2EJSNaaq3RSsEyCk5OIw8Cpj8A1kviKelmpQJPE4X5hbKbrm3vVK0wc
 vtIzrt/1aSlhj3E6QLfoRWQwGcyCLahztE15fno3mUAbrVX0vXNKimSHJoszGktYxZ55mWkpJ
 XnZbiarBxQeH7N7SqItLuNaRuKoyIGdS9NOkNspZOlpwsHGfe7h3f6adxfcND94Tw3bkhaYJ7
 A8+Lmq2D+/qWcTEDfaFCVEq6MhKM5pGZWkjPCj8i+hor6+TPJY3SrUf4mW2F/UzRdFJiY+Tcr
 pkobM57iu+tg6uMyIK0AxsjAbal00u/5xLtoU1sdgyR7vHdu+Y26VOfEtcwTn1On6RbYGEe9o
 RiUqAdgmMpgr6r/qCQM5o604JUrkQhnsWuMDFLUu3WPZj7X3poAwMuUNNBUn2nTUHQBJhEDZg
 NEWh+apZKWGUOMx+X3GXSa/JQ81YGpGafSsnE5qLN6VfyUPVp/ra924bszkt0zx3H0CA6+/jF
 2NcqRuduNnC4BfA81g9B9eg8dcWYGaHy37NJkDTy4bZOfjkRqzr0bPa61NGn8J4lwKxw0hca7
 kGCOMccOfrEb2o=
Subject: [Buildroot] [PATCH/next v1] package/rpi-userland: fix download hash
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 'package/rpi-userland: bump version to bab9bf8'
(76875989326d9122db272c1a0f49b92961c3f2af) forgot to adjust the
download hash.

Fixes:

  - http://autobuild.buildroot.net/results/49a27362e36bad6076a727877bccb6e28edb06bd

  ERROR: rpi-userland-bab9bf8790cd69660d443ce43b4e372999f3f7ac.tar.gz has wrong sha256 hash:
  ERROR: expected: e1ac871911e52b9fe07b3daa080b21bcdec3f1d2926cc98c934794780a4bf8d8
  ERROR: got     : 16c01befff64ebc11a0554e487b00939ed7a716f68dc795db4880b35bb25fa41
  ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-userland/rpi-userland.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index da573f3eae..8ea184a4f6 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e1ac871911e52b9fe07b3daa080b21bcdec3f1d2926cc98c934794780a4bf8d8  rpi-userland-bab9bf8790cd69660d443ce43b4e372999f3f7ac.tar.gz
+sha256  16c01befff64ebc11a0554e487b00939ed7a716f68dc795db4880b35bb25fa41  rpi-userland-bab9bf8790cd69660d443ce43b4e372999f3f7ac.tar.gz
 sha256  bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5  LICENCE
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
