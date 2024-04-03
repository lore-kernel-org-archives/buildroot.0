Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E315CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E7CE60D53;
	Wed,  3 Apr 2024 19:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7PlI_4c_5in5; Wed,  3 Apr 2024 19:21:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46F0160D93
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46F0160D93;
	Wed,  3 Apr 2024 19:21:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4837E1BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4233241824
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swL_8k2KYHmw for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:21:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 225D141821
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 225D141821
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 225D141821
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:21:54 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7cc0b35b75bso7801539f.3
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712172114; x=1712776914;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L5xTbgh1KRqRfy/NvK6PU9+WcGcf4EWPv9gdyAqqiRg=;
 b=C+W04AEpPgD7mTeg5aSXTJyRgSwBJTvghTrCHC8adgG35KEswYJ0nql4TeKOd4kV66
 VhvAzkTMm0pk4e/6oniePRFmWf5MYuzVNF8V98NeLc11viwgZ4DtDJT3l28PyZ9rGc9Q
 EYr6NVOqJM37lEyRDOBqcAK6NRy4wWc+OQoPYD7JcL/YmO0epFqE3dUf59qbPISzvAtc
 xrDdbXik5d9dRNZXZDEJZSt08rIVqPo11Ah5bNfb7D/boZ7olgYGu8IgHss82/7NILZm
 OADjZy0HhNqndclPftLVCYy7h/lXiWnwAkVL+DbrQO5LEjfGKvHlXUesuvdJg678uZJi
 jdtw==
X-Gm-Message-State: AOJu0YwT2sxWh1ARtGWtDSYnlZfTevRwXwt9CnBXU780+tlLsrrlUVvG
 Nd122567aXl+t1p5L251VggEOXLWxVmeDt4bm8dbpcmsQJf8hSLNZJ3aqh4wCMg=
X-Google-Smtp-Source: AGHT+IESyWQcHeFx5dgcPvSGhB1zQxuh4Yjw30YB2qf/+DsbuKbVzJh9gi8GAmxDYEeJvbW6UhbHfg==
X-Received: by 2002:a5d:8897:0:b0:7d0:4c66:12e6 with SMTP id
 d23-20020a5d8897000000b007d04c6612e6mr571203ioo.21.1712172113650; 
 Wed, 03 Apr 2024 12:21:53 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 h8-20020a02c4c8000000b0047bee4d297asm3975562jaj.155.2024.04.03.12.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 12:21:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 13:21:50 -0600
Message-Id: <20240403192150.107906-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712172114; x=1712776914; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L5xTbgh1KRqRfy/NvK6PU9+WcGcf4EWPv9gdyAqqiRg=;
 b=Zi/1VIe/TEP+CsUr2z5xf8lVtVZfxitaK1GCaNJll4OHJHor1VRW3xV7asRbjNEU8y
 LhtoZ6+Tvwrxem2vHfkMKA8blgYGNoLGcgLQqjnOl5q0xzA+vdSXI+wlQuOscZd0Q6XP
 xN6DnDu6njivGXKmRKK1BfKdjcQ13mo+yVHWZwN0nB2qj+mAgXNqxYhs2hjq6CIRz5+H
 zShNZF4aqseNa3cuoRE5VDeMNTPJbx8Qc0Bgo5ekYddmTJMH8f3+CrfIS98jgpeqGX0C
 yQxz4YFY2EUKe2sXDZsT7Ft7KaYf17zpWXhtSX0y6nyWD3p2kuk1WTJxOZR/emNoLhMf
 nr/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Zi/1VIe/
Subject: [Buildroot] [PATCH 1/1] package/scons: bump to verion 4.7.0
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer needed HOST_SCONS_INSTALL_OPTS.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/scons/scons.hash | 6 ++++--
 package/scons/scons.mk   | 7 ++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/scons/scons.hash b/package/scons/scons.hash
index 48b5077b2e..8dca99830e 100644
--- a/package/scons/scons.hash
+++ b/package/scons/scons.hash
@@ -1,3 +1,5 @@
-# Locally computed:
-sha256  ce26aac95d350a79a4192196b0beac3cb24f4ccabce0123eb28d3370f576f072  SCons-4.5.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/scons/json
+md5  f5a740e94864408902c62bdb47687d9d  SCons-4.7.0.tar.gz
+sha256  d8b617f6610a73e46509de70dcf82f76861b79762ff602d546f4e80918ec81f3  SCons-4.7.0.tar.gz
+# Locally computed sha256 checksums
 sha256  2f6ac9a1fc98394d18b80dba9bedb9d5626006d44db3fecf7cf3e21cff7e8b1c  LICENSE
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index ffd6abf609..b6bfaa0237 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-SCONS_VERSION = 4.5.2
+SCONS_VERSION = 4.7.0
 SCONS_SOURCE = SCons-$(SCONS_VERSION).tar.gz
-SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
+SCONS_SITE = https://files.pythonhosted.org/packages/7b/68/6895065c86c65a9388eb760a43ea695ec5b9b1c98a9675a3bcd682dbe9c0
 SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE
 SCONS_SETUP_TYPE = setuptools
 
-HOST_SCONS_INSTALL_OPTS = \
-	--install-lib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
-
 $(eval $(host-python-package))
 
 # variables used by other packages
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
