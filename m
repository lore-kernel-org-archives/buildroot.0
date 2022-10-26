Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C010C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 02:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6484402EB;
	Wed, 26 Oct 2022 02:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6484402EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iFQZNF7J8Bnq; Wed, 26 Oct 2022 02:35:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C333740260;
	Wed, 26 Oct 2022 02:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C333740260
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDA601BF2CF
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 02:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5D9660BAB
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 02:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5D9660BAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AceyYpt1R7c9 for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 02:35:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B18C060BAA
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B18C060BAA
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 02:35:38 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id r1so1767592ilg.6
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 19:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oJdF9ofci+8CoiifBi1xVAwlLA/1hK5wLeede6Rq+Ps=;
 b=o9Fnr7uhQjrsodSowbnzBGKvyH4qwbi6U9+/m216hMNyuLH9g6qsoK//Osbb3FVPi3
 GkvkXnNemQeYnII2sLuSpcSUnvwSziYdwgV/FHS/kDlVIa0Y0C/B7iJrDbq/lR4vmICc
 rBYdj6yj0xPE+bpgeoypXi7Y2BMIup3VNcS8wWFItM8WyGLokfpQaUd5wy2HlA3SzDVl
 W3UxaNl2u7leJ/9YgEv0kgwXbhzPCjf7JaqX8G/1Kz38Ci/DitxoN0QsOIEBQVu9KX52
 UIyFlsS6/nz+Rp7c8D6WFVQWbRZl5erU0hPy8/YeWcgwu7eziiS+dZfuY7FEWtF6lsbg
 FAEg==
X-Gm-Message-State: ACrzQf07RLv0VZyaGnkW0KenhixAiE71KtdGGPc121ZuAOKngAdgb/Pu
 QBRH9CfbCQjA27LOdCYnnKn6DXN78uzfKg==
X-Google-Smtp-Source: AMsMyM7THlIbrd7uP+wvaQJPxGBRNeBwgQ2hitQBQgBuZM01GGus/2IE7hDrCdlzYxtOtMu4Px/xDw==
X-Received: by 2002:a92:d685:0:b0:2ff:9abf:de49 with SMTP id
 p5-20020a92d685000000b002ff9abfde49mr11742595iln.42.1666751737402; 
 Tue, 25 Oct 2022 19:35:37 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 18-20020a92c652000000b002f66aacb98asm1594151ill.70.2022.10.25.19.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:35:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 20:35:05 -0600
Message-Id: <20221026023505.616591-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oJdF9ofci+8CoiifBi1xVAwlLA/1hK5wLeede6Rq+Ps=;
 b=GU75GQKbZy0EhUsJICb0W8dh+psBFMZcaxPJc6xwsNvgAnylTiMscl+j84nJytTxKT
 ZbXwGGgt0Zl2JLOk1qXMCm2TV87Hv2GO6RQACa/Si2H11MNlq8kuQCgo5Cc2MwNNBHmT
 1rpjsYbTeA29nWB4nIprC3wdUZ+nyVOVxCHWJ3293pkMYzyL6R6NM7AQYlY2spu0jLCW
 uxY77/RzMXBa+R9QCPVZwRS7kopdQ7AsgAhY2GoP8K8dCN7fL0siQaWPbNVelYLzqSpF
 aQh+ajOZ3yuOETlzdfuMofsKf2JPPdyPie5ogrw24zmgtgzjaEqKUThDftt7JXO8V6oN
 PxqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GU75GQKb
Subject: [Buildroot] [PATCH 1/1] package/python-numpy: bump to version 1.23.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date update:
https://github.com/numpy/numpy/commit/4fc42f99b7f96b1000c777a478f58e2744bb3656

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-numpy/python-numpy.hash | 8 ++++----
 package/python-numpy/python-numpy.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index c0dcc5d27f..2a2dec44da 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,8 +1,8 @@
-# Copied from https://github.com/numpy/numpy/releases/tag/v1.21.2
-sha256  76af194fbc117934ec5bbe2ff15177adbd05aeed23f18ee209ed88edcd777e05  numpy-1.21.2.tar.gz
+# Copied from https://github.com/numpy/numpy/releases/tag/v1.23.4
+sha256  ed2cc92af0efad20198638c69bb0fc2870a58dabfba6eb722c933b48556c686c  numpy-1.23.4.tar.gz
 # License files, locally calculated
-sha256  bc1b0af15cdc9415ea26c5f1df352c226ac86425ec0fb9ab38d111018bf1c6f2  LICENSE.txt
-sha256  2be6947e0432ecf7950ee8fe38681316749dd06d1de17c9ec4de6d2f55adb3a1  numpy/core/src/multiarray/dragon4.c
+sha256  0f88787955e7131224f53a8c3f3e859dc502408e3a539a4dcf61fb7888b5b984  LICENSE.txt
+sha256  c27d0a8026bdb8876562b720ab24d1688e3827a89f6083cd6e7e8caa9584aba3  numpy/core/src/multiarray/dragon4.c
 sha256  fbc539f47d0cf83bc61378080fb873d5c14630126cacbfe754035c3926daa5ec  numpy/core/include/numpy/libdivide/LICENSE.txt
 sha256  a14cc25e10d40a3aa705b7de2fb764a6535d8ee9b2db4e1724900585457dfd55  numpy/linalg/lapack_lite/LICENSE.txt
 sha256  badf51c7e3e7de9c7630bd069780f5c197b846ef7660b342a1e58d5553592d8e  tools/npy_tempita/license.txt
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 417fe81f57..4f4848c4ba 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_NUMPY_VERSION = 1.21.2
+PYTHON_NUMPY_VERSION = 1.23.4
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
 PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
 PYTHON_NUMPY_LICENSE = BSD-3-Clause, MIT, Zlib
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
