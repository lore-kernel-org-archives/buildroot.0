Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB1CCEE32A
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 16:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AC9F407A2;
	Wed,  9 Oct 2024 16:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCOTzNQw6rfR; Wed,  9 Oct 2024 16:04:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3F9840264
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3F9840264;
	Wed,  9 Oct 2024 16:04:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09E751BF3F0
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECAE4811E2
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSSBou0orS7t for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 16:04:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1002E80F84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1002E80F84
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1002E80F84
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 16:03:59 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-8323b555ae2so300284039f.2
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 09:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728489839; x=1729094639;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1kaMMw7Sa/8Di+I44k9yPeennWPqnL5rWsjIdnZ21Xc=;
 b=pfwoyjYZzuhFKRGl2CVp+jiSoyLUKetcuF4j6J8Dm5U1/rvhxMaoQoEhZw6MZJNELs
 pJXZj93bCmnG91DxGIPIkI9sFnTz67hS7PrqEwLAJ0MkBZyhmWTbcmpU2D/lGqYZNnsY
 aG04RYkmIaVyEq3e2AcuwLfhSXD90MnvqsNAEcdbZ1Aprh8A1PnjHil4uIhTpHbxEccS
 NCy1l2LTWuNNqwciNnCCTqCVODytgh0XXbRDeG2Z6YVrDwTmU/X9fXx/WjVc94Riu0Jk
 VhmN1M2g+5/ZclRoT1wd8w5hwzXB5Wk+HZ9WBh/nZWhsFL36NTKI2c63V2PmzhHYMzIv
 h7+A==
X-Gm-Message-State: AOJu0YzXL7xXunGGdhRyea4RplRwMpXSa52+pGG4Ts5bhI7TBOu2rYSW
 2ofGkHsOkejjOZRoo0jUi6Rvr+nlO8DLmOmZk1w7+V354Uj66cZ+vuc4uq2i
X-Google-Smtp-Source: AGHT+IGhoqRkTd32htI04CaXsnyjp84yPYk8uXw4tm2P1mnlQ1Zlmmoej7LMgF1C1CnMSYaGFv84EA==
X-Received: by 2002:a05:6602:2c10:b0:82a:48c5:4d04 with SMTP id
 ca18e2360f4ac-8353d48003fmr400716139f.6.1728489838583; 
 Wed, 09 Oct 2024 09:03:58 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db7a6c3c0fsm1830719173.160.2024.10.09.09.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 09:03:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 10:03:56 -0600
Message-Id: <20241009160356.3805718-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728489839; x=1729094639; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1kaMMw7Sa/8Di+I44k9yPeennWPqnL5rWsjIdnZ21Xc=;
 b=JevIrUIiHaJvW2sY2aI/rMdrHzlZ/dOb6SGCeO4f6LByvB1AJdQUiDjxb1vbDnTKGb
 vxM/R0CvDI+oySbuPJjLsC2qQysEUW2VTm2R3JKRlJLdeuPTiluz9AdJexZd1VSQO8ny
 3SWNHl13HT23TQOCrvIVv42ENGWGY+L0oCpj4GY/ja+5gu4iDg+MG11s1BRgFwJfNdxD
 vHTQlQhbF964NHcOlCU/0Py2AQGJw+izLGa853bU9HQeO1IhlQV26/vmGnJ6Aq/lh/BA
 mIXvxtEudK8qF31GDtMYiZA9CVC4hXc19Zd6hjUgA5oigUZWhOfhfclO49d9fGtnVgSy
 +wwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JevIrUIi
Subject: [Buildroot] [PATCH 1/1] package/python-dnspython: bump to version
 2.7.0
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dnspython/python-dnspython.hash | 4 ++--
 package/python-dnspython/python-dnspython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dnspython/python-dnspython.hash b/package/python-dnspython/python-dnspython.hash
index acab710d5a..4ed5a04270 100644
--- a/package/python-dnspython/python-dnspython.hash
+++ b/package/python-dnspython/python-dnspython.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dnspython/json
-md5  ad29d0392621fb107e0eac4beed79ce5  dnspython-2.6.1.tar.gz
-sha256  e8f0f9c23a7b7cb99ded64e6c3a6f3e701d78f50c55e002b839dea7225cff7cc  dnspython-2.6.1.tar.gz
+md5  7a8f6f15038a116598744517931420d0  dnspython-2.7.0.tar.gz
+sha256  ce9c432eda0dc91cf618a5cedf1a4e142651196bbcd2c80e89ed5a907e5cfaf1  dnspython-2.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c3ea3ff5654b329c19d3bc5f7481af623c3dded4a6145585499f843ad3d741cd  LICENSE
diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index 01fad58c1d..700c75de25 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DNSPYTHON_VERSION = 2.6.1
+PYTHON_DNSPYTHON_VERSION = 2.7.0
 PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).tar.gz
-PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/37/7d/c871f55054e403fdfd6b8f65fd6d1c4e147ed100d3e9f9ba1fe695403939
+PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/b5/4a/263763cb2ba3816dd94b08ad3a33d5fdae34ecb856678773cc40a3605829
 PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
 PYTHON_DNSPYTHON_SETUP_TYPE = pep517
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
