Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A39CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 02:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B80AB81298;
	Sat,  3 Oct 2026 02:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TytRaD5Uxxh5; Sat,  3 Oct 2026 02:27:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C840F8128D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790994421;
	b=j+f56WKq3OLdfK9qxFlmYT0ikrhcB1vpXhXVnvTbZemIrOKUc1V/clmrEf9eINu+T9rh
	 +3QoMU9ig6HlqgaArKQEZqGuo6m7uGpqa2fTaSXBJ4iCfP1t2zimzPSAY4TRDb3hkfdA9
	 vuHG0PicvQbhH5N/S2BhSJ9n8hWZXvqt6rpl3V0phOMQR76qYzrmNFUVzibuHYHcTJoBC
	 X1xwG+cFqoaXfzOyfjpUdYNR1GpO2qNZOkVsaUSCC/JeDvsrCk5pZNaHLCuanjtttUvJ3
	 LRlx3DZ1Q8mlQ30YzRGJiSKHsV2cvAEXzHMfePM354a0HMqu1TCL3VQS46pmQ/ni6Sg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790994421;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=W4sjzH5Wuwfs2NuHcOMUI7/Vaf7ZXjRy4vLSJs+WyIU=;
	b=PGk3wrTS0Jk4ZSg0V7+WwTHOaLq1Ef/TAluscZCWSXgM5mRWGyXrEVp2eEbEYH3tfqT2
	 AWJRJbbEkNbPLezhGjwep7kKQ8ldJ1xPPtWYtbfl03NByI8nnlsSPQCZaXil3f00bEGyZ
	 8Tqs/pzCi9yHOdUoWPY8Nvji4znjjfGcP9n79D5eW40g3rznxByqdOHQc0Yq0GHsMqr2D
	 FQwSECyA74hbe4n+XTLc/1SS/3klVS9rBOidySUyVVVg4ea2FtQjXd9cmjtM0Zol4zyqd
	 rVTtka5WbWKHOOKdytRG+XkyZ75jpZtWprJdAnBZCAV4Ed8PhhPp80Rlrbmkd5AwO5A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790994421;
	bh=W4sjzH5Wuwfs2NuHcOMUI7/Vaf7ZXjRy4vLSJs+WyIU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=s7M+sTQT+jA2X/H6PF5ZWYb1PlLu6rNDm3t5VVpw+nwSSyu+eyPtYi9MMNqe0eXxu
	 srvVeuCrUGduT4vMC+F4zHW8sZcUuNDrIrG2InNKfVNKjT4aS9iTN4JDnBIxlKhmG5
	 IugF3JMRBQDVtd8pE/6+QrJ6cBgbiajgXcelRi2XIrDE/gedw0tHuljTYpZDLCaZnl
	 2kDcfXBrB+JQzdGr8NL3XikrBxzytbnt2EpCPbp8Tp98FRKAHx/fVPS2pRWWZQlcBx
	 Ev124nwsUCMg+xjYwj4YeAftwcUtxmPBjGOTsAuKwH2XaTkHlYL6DJDuVmWOofOPA1
	 RNwOw6Nq1sikg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C840F8128D;
	Sat,  3 Oct 2026 02:27:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6E8834D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD1F160648
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8iuF2Xe2KWZG for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 02:27:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 026026063A
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::29"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790994420;
 b=aztrwH8Gx11edDv0r7ITurYBUzFPo9+3P1icg/zDX+VdEzdnr+ndP9tAfPguhwi9+am2
 nGsmeFSAAg/mI/XNraxKxNYcbX6D20Qg8LQz388jPqtwLDTLG4+7df5ErgL9imPj8gbsE
 8QuMWJZhJr1kH9t8j0dKv/h+EX/xayA71yLZYV30fBkG5hIvCO3ERwtgAv6U0xpRxNaZg
 R3u9arHpVzpnmcYNyq5i6GKLA2Bp/5p0XHiJw50sAVzJR98LxLjbxLcW4Gk6Nzuvw+QrP
 abTB051+L9DH7dfSKuwYuOZEfPHYmsducgVaZ55YBRmCaaTaSwLqIn5gmuwXrWsLC/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790994420;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=+dN9BONfgjv9Gy4re9buytuqCNu0aSxT4D3GX1ou2lY=;
 b=KNiPxq8GgnRTYpznvUalNCoSa25VhH+oQHi90A4VvmYrpqWGxFJLFJ+yT/AdMEixL1z2
 Xjn3UzLQzdiyssEvX00USZMkwOgm8ahvMqfwhjEHPI2fu1VgYzj5SMJsyWgl1j/m5f/Z6
 QW6FLoPnHHp6dx1Si2kzVOyL3uY9TAx3SFIAfKNRayDzY4sDPDdYefjzN2H+ieNa8TRYx
 EgQG4kmf4Z+EuzZyRQlqro3CqLGmXLtFopmgBTNbXrF1OGsnKVSM0/SGFw+Y/SMrzgKaV
 +LymU2/0KfrMpY65pAB7HcVNQem67ABv9S6cYF3O77FA3Yxo1c8mM/qnjMo0MP5b1gQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=WHHyLcr5; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::29"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::29; helo=mail-oo2-x29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=WHHyLcr5
Received: from mail-oo2-x29.google.com (mail-oo2-x29.google.com
 [IPv6:2607:f8b0:4864:31::29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 026026063A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:26:59 +0000 (UTC)
Received: by mail-oo2-x29.google.com with SMTP id
 46e09a7af769-7fcb425fc2bso365480a34.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 19:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790994418; x=1791599218; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+dN9BONfgjv9Gy4re9buytuqCNu0aSxT4D3GX1ou2lY=;
 b=WHHyLcr5UTjyZewHIRXb1tEnxn9opog0h+p0eVCg7v/DQsWrOA2+rqxdcUgdQTUcyH
 22gGpMi0ivcRLPxJ7PjWHS+hwhbRvX1f7LRk2Xe9sGW4vtBP8tuZrgGpD+StxDkJTDd9
 rVw5kTlDlf6K9AcCIAyDU4vbvAR2rt798ZopAvHGUxv/wxB/9/i6lqL8xCs0iRnawY2N
 eZnjGq1tsInkQCw2D3ONDUky21RQfMKU3hrdYxYjQvGChYPtE7gFTdaswOwRgbdjct8i
 P+O47p/EXXsrVuEhgSn9Hh0IUDr1CCLBT/OBkDsQjm79yy6Z8jpAkivjTO8uwQmnoWEt
 klxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790994418; x=1791599218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+dN9BONfgjv9Gy4re9buytuqCNu0aSxT4D3GX1ou2lY=;
 b=FwC2Vth+u4jGl21+LEYElvnSmUNCHaWywLvThJCiOHzutQ6dYS+Bg/mUhcN+ztJi6h
 JnHlyrSiOoQxn0kBJKCoLUsCWpMR67I5U54ItHwcUEKnCh+6RemYZXfN2sUwIiyLd4b0
 vPCpQuzyKVL5lFcCuLmGJJvITVF7aAPyN5R+aJcuLdrCz4wzVZNaQoVIAMzBJ32NGHM1
 tlD/O25qYashaokxDLgH1Sas3x1+ooVmgO+1VZFBb9qD4MBKXguMpEtgAMA6u+7BL8HZ
 ex6r/7IBkUZ0MO3xSW1NJrB0Ax18hbwFRXEFZrzPdXQIws57YW3nfgVzjLCfQWdHEDFh
 VzVg==
X-Gm-Message-State: AFuF++mOrkDSWoeDA+Y1yhrkvrg+sVIIyOMmHXIntt8gcyYoV+bsywue
 ImipCxncCFb0lCobX96nDe61O4fNQPCrU8WWMv2oWk9YM8HsyZtxhnkuyBXtTw==
X-Gm-Gg: AYBFou21tSqIUPdI4bcz4hX4jPy9N/FX+vza4PjxlO1+rv7QMekltpsMt52X+ZrGTxF
 P1VeCR9n4/Vg0XS2hvMyar5f46Rx1+pL/P4yNsXnHgtFFw2wJTB4MOxyc8vJRxx9zyTy5jSNcul
 9USko8dqhSA6aCeCOuLi4zoSicPFOBAV/syN4T2esEI/DqkYRcYsqN2ZN1yGQ4PCZNcgjg/UWk+
 s3nJI60oQ0Yoogtb9TWvU6zlQ7FEo2RDqUQOHN/tTTv5tMOTiS0KP+kXUWRqBATX3eLl/p0+DAJ
 CCfjkGH+lz9M64shI39lvdsMMFMk1RqfIFb3yhiVldMyVKzYl9Mn2uSTGwUFhCJ7iTa+xUqV2cP
 tHpE9hy4R9PTqxn68txE3jkZhzRxBWrvdkk/STdbg2u6WTw5cEZFaRKmHhUROGw8NLcahqxNqxE
 f58iC6oVDFRAtyzPDMaq1l2+YUj5Wv5B8wzjlUuV3WsSQx1rtGqrHMpvyQPVje1aF4+qPnlLpEH
 R40CNGCfJrawIH4uBLTYOw8Wj4d6rsSQeJ167cRNE7yntDGZ1Gv1r5VYUzIIrUB9CCYFI2eWQv0
 jhMLlBSSw6OQQsEyadHm9Qt2XrUFXkSkCwVeTCUoNx/W9eT1csAqAzZdFbKQwqGWSBzpqUXGn59
 VGUgt1egsKWXgbhY1N1LzweU6M/0s93QHslF5xV3yraiesKUDX/hI
X-Received: by 2002:a05:6830:67d8:b0:81e:bb4b:2324 with SMTP id
 46e09a7af769-82285c55c03mr4461595a34.26.1790994418410; 
 Fri, 02 Oct 2026 19:26:58 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-822793967f7sm4572502a34.8.2026.10.02.19.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 19:26:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 20:26:54 -0600
Message-ID: <20261003022654.418138-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003022654.418138-1-james.hilliard1@gmail.com>
References: <20261003022654.418138-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-anyio: bump to version 4.15.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-anyio/Config.in         | 1 +
 package/python-anyio/python-anyio.hash | 4 ++--
 package/python-anyio/python-anyio.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-anyio/Config.in b/package/python-anyio/Config.in
index e06dc8fc4f..b8b1fed07c 100644
--- a/package/python-anyio/Config.in
+++ b/package/python-anyio/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_ANYIO
 	bool "python-anyio"
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  High level compatibility layer for multiple asynchronous
 	  event loop implementations.
diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
index 8bd80e86fb..eea1d553fb 100644
--- a/package/python-anyio/python-anyio.hash
+++ b/package/python-anyio/python-anyio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/anyio/json
-md5  790c9bef76fdeac4c2e4e4ea757e14ab  anyio-4.13.0.tar.gz
-sha256  334b70e641fd2221c1505b3890c69882fe4a2df910cba14d97019b90b24439dc  anyio-4.13.0.tar.gz
+md5  81aa5fa618b7f6db96d719b81a1a67f7  anyio-4.15.1.tar.gz
+sha256  9f28306018cbd6d329e64a36d58256edff76dd996fe423bc957326e578b82a94  anyio-4.15.1.tar.gz
 # Locally computed sha256 checksums
 sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index 4cd435e265..b9c744583f 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANYIO_VERSION = 4.13.0
+PYTHON_ANYIO_VERSION = 4.15.1
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/19/14/2c5dd9f512b66549ae92767a9c7b330ae88e1932ca57876909410251fe13
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/a9/d2/f4d173e22df740bc37b1db102b386ba719b66e95b0f0d751f556b387e6d2
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
