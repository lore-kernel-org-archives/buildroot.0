Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4BECA5FE9
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5373D60DA5;
	Sat,  3 Oct 2026 01:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZEt2XOWL0Ny9; Sat,  3 Oct 2026 01:33:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 59BE460B2B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991201;
	b=QvlnxXrtkWFVjHfCD6Y1Wwnv9NrYX05Y2o0OyS6dounAeKiahfdUIQjZTjqO1O2JfF+K
	 OeYlUm3fabtFq7J93kbwsmB9i3a+to+RPZcMtj6DTsNnHsXlwL5oe2Y1lnDoVcWsEQTWw
	 dygVOq4rxygk04f0UFnXOWXvj7N2X/Wc/DUzcNfvVkwylQfOV/yUNr83MY9HS2GgG2JqP
	 FeOiHJVbBEE5fheMPSHLVav7iZlqSf6XACH9fYkOuBOT/trFPujYmuwwzad1lBqJ16za/
	 TALny9CXcUiJ5FN0Rp9HtR3uXDxSVJPxRl2pAdI53+Jwu7D4rM4w8tQZFQ3/1Q4YLOA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991201;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=F/GlVYR0aawQGJftN2reb8BUg/9epyB0imSk2tO4nlI=;
	b=si9nfbGJEQtSBj4ErvzdKkNgBAQJueOdUkCtzkY0dpneLpaXoBnD7gl81UJkAHsnd9N3
	 UKSENnX2bc5ECEkydXCg5RO9oxFfdL6BuykfJw1GJN15AL2/kIdwrAR/8FkpuIMZu7Utd
	 vOOfjswGNsCVMSPD4fm+0qUxGKcGmkEhzusp5dTjgiGCrIcBczyrCSLqyTjPKqHEfU74h
	 5lhGSGyIOQmi+278SortRUsBXvPWAuQyi4tHUqoNlvyKAepawKbKU+A028y/03muWovH/
	 4h5VOkXfEsNd6kuNeeBxXQPKD28RziXtVSxTE6zgIZt7HncSewSf2hvV+CAAyckrtzQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MslJwveK;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991201;
	bh=F/GlVYR0aawQGJftN2reb8BUg/9epyB0imSk2tO4nlI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=JGn3lCRfI9DhyhYw4UFYpR8+wTTLiqKhMDf8Ai12tS/1/PkFeKux//O9v/55ab1RL
	 HwRLoCV2NqY0S+1B90ly+dVgBfW1ZRCdkuRhtGai+ktrWygXSnPq+5OxzJ4IZZos9X
	 l6oTxPTLnKLiepeiDAehdfpBbXE6Q+jzKWh0+owif7L8mtnTBmzxULWj1wixCG0Qlx
	 JxLsiBj7Ii/MoLx7PyMSRcTpSD+BEq0JKFfxT7WGO5btf489EcJoZRCrCEa3yiIOIz
	 a4R6xmJANK1B0gb2+gsRsLCAEjpCtdVW+OIxfY8UutCsjvrp+l4XtkTY9xrXy1pNlt
	 tjf/isFnzNJMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59BE460B2B;
	Sat,  3 Oct 2026 01:33:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BCA87435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACB4560659
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OFWmOzm1ugzY for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8CE1B60D6B
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::28"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991197;
 b=owXU/BBmCCsFvcgxAKT9eN7kaWxUmukAJpKlLTaMyD1DGT7zACtO8O6LPsLfI9utl68K
 w5nU4nGzgSqinZyfaWH6e3fr/edtq9oRk3GxeV9lfwaKqCDyq9QDqC9GX5HtgRDv882O6
 bAZQI8+nakgVZdYgU7ktRHvhPKv50bChmlty8y0MmBBBO2j1I6VKcP0tv1J+SXPYW5AeV
 2GMhLDVoNFep7h+nnWAiZO0tQC12ERdS7UClTdY05cFUidc/rESu2H3YGGqyzfIR5Yx87
 N2pA+eOBIU39snBgKDCbIRSOlLEVRiVaaBfgmKmCdoHEPLPOW7vHn3cdWjoFiCPDQjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991197;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=mhM7wTK6Md8YGWeL1vx5PRP4gxayu1FYt3MlsEPQPbM=;
 b=U0QcZsbOKOczUWInohML507GFdAuBSiOmjnyzA55P6ukeq7XYrajf9+XIrqq2Cn+JGix
 AD1bbt8bTnUI96omDhNem4w9ZkfEOQdWDPSW301GbPbUrh1fWLAMDMqz5HSdpEht4xH/I
 pA2pkpfDRGlHhnm3q59mf3qdVbCHXU2jtayAuB2Bf0ViuExFflyWPau+yhUJfhCHPe21l
 vo4/CKeoY9MTbxHZionzVQaZdK1d8O9f1zV00+PE6I30R2Z2RsTK5VDkYTC60EsYZAD2e
 lZqxYqu3muPVPRaQQlYVRB9Ege6nF30rEAT2ziuCeH4vNVCHvtu6gaZWaoQkx+DdIjw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=MslJwveK; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::28"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::28; helo=mail-oo2-x28.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=MslJwveK
Received: from mail-oo2-x28.google.com (mail-oo2-x28.google.com
 [IPv6:2607:f8b0:4864:31::28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CE1B60D6B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:17 +0000 (UTC)
Received: by mail-oo2-x28.google.com with SMTP id
 006d021491bc7-6dcf2ba1fa0so275936eaf.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991196; x=1791595996; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=mhM7wTK6Md8YGWeL1vx5PRP4gxayu1FYt3MlsEPQPbM=;
 b=MslJwveKs72AyFu3J2cCoDt3SOEthF/dDqlP8imgJRriYKcE2C6pPvZ9zqTMVcIDYE
 v529t0LCV65NmBSgpS0c+gYQmjh5B+SxGzO2H94pbrdfxcYxbMpDqRZay4NxMrn02S3v
 BZ/QoHeg3oEHFsQ7W1PXLexCsbnZi6vKGQnVYk8A65orv276f1tFCDiOFzweRbEMAsi2
 4vny/SKRtCmWsHhi5b1Jqs/tAextOslaKSSHecBMcOzC+bK/uPR2OhKeF86rbvDS90xw
 5hA42DLBjGuGKtbEIvcNmZ/HCjDM82xBg5oCzW94vLhPADn/mI5O5ZxLlJ7Q6U+2YgTS
 hqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991196; x=1791595996;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mhM7wTK6Md8YGWeL1vx5PRP4gxayu1FYt3MlsEPQPbM=;
 b=qQFFgLJI5KXtvAJp2KCsHLp5YAEkzc5L5tJRt1uI6Ve+av8Vrsbq3OV3DgkMmNuet1
 mXWFWoAcXvcABXa+rkBdAnaUACtUqBqOetAQv10tapiaG9pc4Cw/cs9M9xSMDub9iu87
 zCzsWrDHmdlxWZU7mqaAvn3JNrfYuJ19fX/qbglXJbvuN9kxG7s2oGmG7vHDb5HEFWxG
 bw9wMUHzMMR4fNr8sX91G7fhGjTSPdJQFkgjhM2imq4RgPek1CEew6DaMQTQfUPCM2lS
 rzDF7kvKM+kWs1LZywCwCJp6qHEh3UcD/JPMUK4yw1hg2OpxuW/VwMc1Wx/Xn++0FuPH
 C3RQ==
X-Gm-Message-State: AFuF++lZelI+9UCYPiXLjislMNfJpNuVDj9u5CRfZEUp76iw+bmLGGc6
 F6X5vS2R5L0uRy+kPOgTM7aLZS7uA8gWZFy2FPhEJmSl1t0tYOWl/Yldl54N0Q==
X-Gm-Gg: AYBFou3eF5Qzf7aONPvuGImgym7IPGWSKtv2rhOhue5LGDxLg2K6jq1PtF36hNzxSLt
 amU0SLRCR3Amc1BN7md8QQ+8iQSPHDt8pikMqftGmb5iwJw0zC3KOEs/oCXbGrnAM40UbRXQTJX
 P/keBvO2dQmPw1RvA0cViUGtV8W3k4Nl99BaJ5N6CneiYY2me7qnZR5VIIoq/vjZwSi66LNTBX9
 +/9FhFHM2e/mAkc9pxq1sMBJ/TYIbDtsK0aymjxty/ycMlIwVY4qlLz3X92GkFcSCep6/oBbnCo
 JVX0hnxdvmrP6vavaee84QFBwnWQMDdVu9i5zT69PNlarEUOBG0b+yW4NwZQe5yd0pgIn/PTaHD
 OZt4nuctSj1Sw7hpDi3E8zQS5G9q+CjEjaP6171PXCRvFGHN78vBIGBrTIULIK/6aLsqwb7PnAk
 z8lwl8Mb3WHfmQoYNxl4ThBYN4XcQfynQBCsLGL86dLgiAkbb0l6MLXy0rsxY/5K9+6k6/AgoyF
 hJY/f9rwrBugvkEEMFjKxyuSkqSc3efFsrp94sCZxzPgu8mLTH/ZZEhAT8zXgLTV6BAUSSZjB9T
 BTCXwTW/IOQB98P3StQfszA+hRNCllwtXc3dbxPKn7jkgFftU+WgydYwQC61jBa+GSiBOnRoVog
 wLgpxe1FcCU6e6ZuBek85ViK6TgWppND7PkLn70hLbA==
X-Received: by 2002:a05:6820:824:b0:6ca:7a04:ee31 with SMTP id
 006d021491bc7-6df35c399a8mr3641050eaf.64.1790991196237; 
 Fri, 02 Oct 2026 18:33:16 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:07 -0600
Message-ID: <20261003013304.400979-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-click: bump to version 8.5.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-click/python-click.hash | 4 ++--
 package/python-click/python-click.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index 81fcefa4a9..dc080ea79c 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/click/json
-md5  e35da284dc6420c59c1885ccb22d9879  click-8.4.2.tar.gz
-sha256  9a6cea6e60b17ebe0a44c5cc636d94f09bd66142c1cd7d8b4cd731c4917a15f6  click-8.4.2.tar.gz
+md5  39f57e4f423de0d075dd968c29b01539  click-8.5.0.tar.gz
+sha256  ba0d2089de75ea0310e2dde03160e6ca10009947fb95a182f9b54021bb272e34  click-8.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 88fc66bc6c..8dd3d25f3f 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 8.4.2
+PYTHON_CLICK_VERSION = 8.5.0
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/76/d4/81420972a676e8ffea40450d8c8c92943e7218a78fe9b64359836cc9876b
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/c7/0e/7fa0ef50764b67090eca4114772a2abf8b6148198475e54c660b97caeee6
 PYTHON_CLICK_SETUP_TYPE = flit
 PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
