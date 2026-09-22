Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05276C982F1
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 09:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29B1980DBD;
	Tue, 22 Sep 2026 09:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZzWnFk8bTJRG; Tue, 22 Sep 2026 09:21:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9101380DD9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790068898;
	b=ilQivhTh7UR9lijDL7iCcGgj6OO5CF1XmfbB0eSsM/vZFJJH63iH16cYepg/x/UVDPSP
	 K1t1DueZWmc5wpC2va4DXg6QmdHv3WDBIibDdakHYhycmckc1eVsVjT2c3zMCEsNlfrwy
	 iskdhiDHhDYvncrisVbja2396foNdPt4gbpHxKT7YYc3uhxsTdunMt897caKUh7csODUQ
	 B6yhhwmFFgp7ZVSA5cui9Z8CeWYRc1kmKGgPbcNI4XiXky4QdYCwMld9GWnZ4YEWkru7G
	 hH4ZnFs0A3dtKjIxxkqRh6qLbZLJlLYK9ktBikUnccYdJ/zbx3QOi1hYJGi6B2WjPbg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790068898;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=jtIMeD8S4ZfHCkJ4kS+C5D0SzLEAyFPF1+SqAw+bibc=;
	b=b0cXYalBzcn/Al34hsyiqqDfTHoCEIKF++k7cD/jG8FJkRz6fyLGEkdojlNF2e1e/bro
	 tsS3On1qSmBLorDuxxIgHUQ9Y+Bns/WnKSvXOXDTkpEfiOUKrs67Y7D6Ii9dGoulB0Afp
	 kPSibNpD/X31yMll6y52v5fHNqteisqnzTXq16OaNmPXOwC+rAlwmdAI3KWzFf6aVyNPW
	 gqnWVOtQN613k1UtSVWVA9/+BRIDHQMsNAQ84sJD2HYAQF2oNvUGHdYbA3dYghHG1ZCqZ
	 MRWTDThIIrTQ7Qzd8IAyb0ZSOK/PboFOkck+cdeA72AiM3O05O2Q2BqkKJox563TJlQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790068898;
	bh=jtIMeD8S4ZfHCkJ4kS+C5D0SzLEAyFPF1+SqAw+bibc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TpUfk8sxlPz3QPvey+g+Iw9GTli2PHhMZM0ZqlySYX/KLSpZuBSTm4VtQ15zuqZEj
	 yesxO1Yr/X2izHN2GBj4oLGR2UC1OKuIdrhCuk7yYAMSO9tAquXveLaR2b/9l1T+xQ
	 USQJRrK0nFIZexHxp4jAYF2uy9HZHsXm7JqFlCOmEv+hyv2pBu6IMP9eEKVjwsfPQ1
	 45GtoaTd0qdGTcfl+bQisXqcoj5xhsUbsBJWkgbJFZnQylELd6/EOGlfUFQmHVnU0x
	 muumbqUxHXarY6HCLz+lebCEr7EdIC0PCzHDZXDwAteupo4e5ZLrhSwCBzsuoEwTRU
	 tZh6UjdfFF4Vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9101380DD9;
	Tue, 22 Sep 2026 09:21:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98EA9A20
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7ECD96071A
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1auJDBO5YGWZ for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 09:21:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2178F606EF
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.177
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790068896;
 b=rvtzo1MYQnnzm9UYTa/YixXWK6tURieZw8eJhL/tnIQ418E/1IaAunEdufglGsL7wHKD
 ZiSbd2RSDC05sld7cgnvq/+tqxQPS8MWmBIRngQxc3/vQkLDyouvrpE8pTnSfrJ3L1uuG
 Qvvy9TLK9Kvi+5u6E9ye0epd7KF2ADvTIfwkUD8oGH1fi1JaaLYAjh00NL4NO/9ihWCvs
 Zh0ornZBDLOq9Ygji3+kFCvIwGJEtl/ZziJHuOnKp0N08ASKkZ2EUoQCcebALfTXSiPAA
 U9v6z6Wh1CgPgxTsjniugND1FnT84nOOr2ULOByb0WSAxMq1LCuAD10RSpGGLreTSeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790068896;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=aoAM55++VzMnq3OkTDdqJTh0RcWMpDzQL940u7hoXno=;
 b=oGxzEEkL+capPbe7S3pSgWP1QrOU/INHYFydR3uzUW9x9IL1v4Wm7ohSSFHcFD7fp4Xd
 DD4ecvK7a38L0qCd5KU5cOwUpUlJR4OV57nX7cm8h7V0ztjCqk7KPrcBfswNEUFwX1Lwn
 YZkD+D2CTu1b+5laowttWtsThN4EmYISctbXnyZP4gfLNthRPjDDEZkwjaxdXA5ZnSin5
 PIJS6rgp4LhaMM6aH1dvMKfHFeBPL2ZRrmNw5yGSzRnTREg9C71aN4XAslq+xs2iGOLOl
 p5l/9Y0afA6J2srre5j3M1SqRTJMAWP/YfHfblU91Flnsfr2cpyNUKQJQ1WetR0XFkg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=benettiengineering.com; 
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=oFp6dmx6; 
 arc=none smtp.remote-ip=62.149.156.177
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.177;
 helo=smtpcmd15177.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=oFp6dmx6
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2178F606EF
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:21:32 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 8wgsxL0PwVLmf8wgsxpdmQ; Tue, 22 Sep 2026 11:21:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1790068890; bh=xHY9NVWMNlQAthbDm1mC++yREwbx13oJqH2VVgCdTb4=;
 h=From:To:Subject:Date:MIME-Version;
 b=oFp6dmx6Iac7KJUyEj5a5bizS0hVoCCtHaGKuLs0oM2/Y31tjQgl+yi2lC8HP0XHd
 Awjfbs79Q6AjJfcrAwnE7xqU6dNIffbMqwJsySMi9WB4fAO4wCIY2X5CgEDsfgjWLQ
 mK3j/DIhvC+Qca7M5rUxAwiXOoRc7AmVzLNM4purDN8k/RPEUjvy/CqGSDOOC6EXSm
 iQUkFqFDtlgs7CelmmASoo+o7+1xOLte9zVbmpAVnSuxHcTzy3OTebATqvx4CEliQJ
 KdB3cPXni1OkHw9/wuTCJTn/mbjUvx7ogSss3YM0Ii/XqHXR2RqLIdDU8RSKyeLX/C
 6SzR+ykUjT9ag==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 22 Sep 2026 11:21:29 +0200
Message-ID: <20260922092129.2540915-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPfLEZz/PlRAq0vPVmiy7pTgs3iMSVqiOyA/4irAL3Gzb/7j0ghiBnuLTIYDvQx39VEyXFCEe9OcC3qzZZ0n5ne2/jeYkoiiCr9GcwA8debnS1TotWOi
 y4m9hAEHzA297O9ky+mpHeX3L0ImZ+CHBHT3kuxlq56dh8nnYFxG47Jqd//reqpWBB54VLhamU8KG7z9UocJGGozA6lZWLCXXXkt1WXEP2NWpJq9y3IEXbmX
 JB+8Uir67diV0af0bocBNx/Bg9zmwb6jdd6pnSPAbPI=
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 14.5.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/harfbuzz/harfbuzz/blob/14.5.0/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index f8ee98e172..bd025fb515 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.4.0
-sha256  2357ed966c6ced7bfa720b0640c0231065af01158fbea215093ffa15aed44371  harfbuzz-14.4.0.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.5.0
+sha256  b7132e148358a45185c9feafd049dbaf243649d3c44414b3534d9c95d18592b9  harfbuzz-14.5.0.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 184253949e..71eee8f93f 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 14.4.0
+HARFBUZZ_VERSION = 14.5.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
