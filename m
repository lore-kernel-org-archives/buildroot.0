Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9174D5E379
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 18:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5F8280C25;
	Sat,  9 Nov 2024 18:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYqqPRNog2D4; Sat,  9 Nov 2024 18:49:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C279480C2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C279480C2B;
	Sat,  9 Nov 2024 18:49:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90BA8D8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7110340662
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjEGYwrok8Px for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 18:49:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 70ED340659
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70ED340659
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70ED340659
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:49:51 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-83abe4524ccso125650139f.1
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 10:49:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731178190; x=1731782990;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BoWt+Hmq9gwjl1fF2UdDIWVuASDk3srflWWopE1LTII=;
 b=pCuuFrXazQINZCA+MbEZwJw2UTIV5fEMdHB+0l0nx0DpaI/4gw0GUO1YUKgzTJvhtB
 lswaMaSCQ9Bz/W4E1j0ST/YFFRrRtKAPUyHRSVFmxRj637m7Kzfz2cNhwuoWLtqJYcj/
 Fn7dazwYRu7/hZG4Vzbu3MDI/sYIvsB26UYw57D5J2x1tKjPjyxUO9E32g3poyDP5sIZ
 BgQLPTNB55cfJDny51/pUYiwOq4peRSPqqG0MWD4pDJ7t69eHe7f5bJdO3NIIq4X2i8C
 985BMbCMTJs0lyVtEATeUI3RdWL0agvNyV5Fs1VszxsExB4heQKcgORhUzdy2SBmdXSQ
 RTpQ==
X-Gm-Message-State: AOJu0YzTowrSCPsPAlrVBdA4MIjiqlulxu2ojqOjMwTjzo7yLpQF+JEk
 5h4MT/O0yW48HcrtFoilGZIpd3zT49o0K4a1y95vFLu7ZwhNp/j4A6TTbQ==
X-Google-Smtp-Source: AGHT+IEUVreVr2BBorUFwxCYrEZREXSOE+WXA2Ggbh3GOjbFu+ZZsxwUPMixqTukjLk2hVapttm1JQ==
X-Received: by 2002:a05:6602:6405:b0:82c:e4e1:2e99 with SMTP id
 ca18e2360f4ac-83e0336a50amr744484639f.11.1731178190267; 
 Sat, 09 Nov 2024 10:49:50 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de7876e6c6sm437000173.76.2024.11.09.10.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 10:49:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 11:49:47 -0700
Message-Id: <20241109184947.759043-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731178190; x=1731782990; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BoWt+Hmq9gwjl1fF2UdDIWVuASDk3srflWWopE1LTII=;
 b=aH0mI7+mjWNZP/y7Rpxdzu/sRZLrrRWEbMSai6R71kiyIjbmlIzghXxy4NCCw6K6XN
 T0rrJ/2Pytkep5F1n4ZHLEMyz4psLHkeBn/ODJWyKP2XB+GGAfNlGliVmQ3wGor2IpqB
 u/8lHcAPFBowW63jSCE0VF+mtQSxCcYxEdcKDWHmKtj31ceL2DyHPnLVsY0w4x81wWkk
 UGwsaz2QfTwykjmPV0Q/eyh5Ey3eC0LJyPJ2djuFdlPadjr83nu5/FIqBsrjl63GSVJE
 F8dTJyftLwantJSSATvS//R2I0KKIdcHUoeP3pwPlkhdj48n7BvYRkODPSjJLkUH2Ueh
 2HrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aH0mI7+m
Subject: [Buildroot] [PATCH 1/1] package/python-pip: bump to version 24.3.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index d29765def7..9ecdcbace4 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  a00c83f8b89decad22d4ad9cd32f1da1  pip-24.2.tar.gz
-sha256  5b5e490b5e9cb275c879595064adce9ebd31b854e3e803740b72f9ccf34a45b8  pip-24.2.tar.gz
+md5  ddc01fbcc66b449a9c8dc78d9c13e4df  pip-24.3.1.tar.gz
+sha256  ebcb60557f2aefabc2e0f918751cd24ea0d56d8ec5445fe1807f1d2109660b99  pip-24.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 9af3ba22b0..7fe70c9bc1 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 24.2
+PYTHON_PIP_VERSION = 24.3.1
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/4d/87/fb90046e096a03aeab235e139436b3fe804cdd447ed2093b0d70eba3f7f8
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/f4/b1/b422acd212ad7eedddaf7981eee6e5de085154ff726459cf2da7c5a184c1
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
