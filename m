Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFB2CD1288
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 08:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 219116060B;
	Sun, 31 Mar 2024 08:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r5oZxp9DP1eW; Sun, 31 Mar 2024 08:03:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24EEF60687
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24EEF60687;
	Sun, 31 Mar 2024 08:03:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A66C1BF28D
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 08:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27CB060687
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 08:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJW7N1c0Srq5 for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 08:03:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E0106060B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E0106060B
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E0106060B
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 08:03:05 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1df01161b39so27876855ad.3
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 01:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711872185; x=1712476985;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8d7G+fC6yXOF4OF+BOmSIc5qzY1KzKlIULfvg4FPkKI=;
 b=ZfZsuTYn3uSGT0mdDle7xFCljTNO/1fZ8ZK2iJOU2SvDnGEs3dAeMH2nfdC8WDtDKT
 lyPf1pQ1ar2uUo8OX3P3N/yhOTzNIFu6pZfUwzZ3oY9BeEJZJCJgAjCWFRmIgZc/jOLC
 0jWfQKWSxOlfwwlIvNzlExPBdFIDHG2Db3cSwwct0ysx7eB+yLGsUa5zuC9QXgiR7Du7
 560UTumTtjCJ+YjeQOJzSkf2sHdWBF7EktewyXV2kyjsFoCDI8asB47eoGgZNpMl/v3y
 2BiUJ/qMlf/Bv2YnmzYXJuoBDmAkREZTG9j3JnVPLuXEg1WaJXd54jMUBUzaLeRF/xXe
 85XA==
X-Gm-Message-State: AOJu0Yx+EjXvRUh0mKe3r+hvthVZmdsR3H5+PlQF4Wg4DXTKY04fDsc6
 pw3nodr24FATqFh6/zPrBQ/N+44sbIBhhub9CSE61Tac35uIOSxvNe1zdf6pChR853z2jlSRINH
 jt5k=
X-Google-Smtp-Source: AGHT+IGvTtdaIKsQ2RaWUsrjrPIEr6zXXB9fcCkf/daVi/n0vPV+UXk9klORSncXw9zTAeKg12KLVg==
X-Received: by 2002:a17:903:1c8:b0:1e0:b60e:2cd9 with SMTP id
 e8-20020a17090301c800b001e0b60e2cd9mr8669362plh.30.1711872184954; 
 Sun, 31 Mar 2024 01:03:04 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 p2-20020a170902780200b001e00e17c6e2sm6509555pll.138.2024.03.31.01.03.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 31 Mar 2024 01:03:04 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 31 Mar 2024 01:03:02 -0700
Message-ID: <20240331080302.19519-1-christian@aperture.us>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1711872185; x=1712476985; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8d7G+fC6yXOF4OF+BOmSIc5qzY1KzKlIULfvg4FPkKI=;
 b=uonNmssM2K4TpbePt5MxwlODtW3wt4BtqaUzlk512L4GZ2Gzz4xitfr0qf2soh0APV
 TclYBHGy7xrU7yXAl2nlVN0IUsx0UfgSoPZAHLa8XSj9gacqLLXFRNTl4XbGh4e91DTd
 FbB1sBnLjNB4GPmpC2zxDd1DxFUv/FGqNyCx0SESypPhiLQCi7VPYHxSYzJ4RR5xxm/l
 7EJFf0NSgU6M6iCcFShrtjzeIeDYXw9qmKy7nKH4aYpuH90l1OO3Yt5wPsGyXak1308u
 VI/ujlk8YTaH8cyobWm7yw7C+2EJf5DOCMYL9e1pbj3GeCMNn5bhDJVOeVvOLEn2DMuS
 bfaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=uonNmssM
Subject: [Buildroot] [PATCH v1 1/1] package/delve: bump version to v1.22.1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/go-delve/delve/releases/tag/v1.22.1

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/delve/delve.hash | 2 +-
 package/delve/delve.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/delve/delve.hash b/package/delve/delve.hash
index 105249f7f9..3b0798e77c 100644
--- a/package/delve/delve.hash
+++ b/package/delve/delve.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  58ad7a7fb42ae2ddd33e7d52dad688b249ca8a358eb73b9e48f91eda79e862a8  delve-1.20.2.tar.gz
+sha256  fe6f0d97c233d4f0f1ed422c11508cc57c14e9e0915f9a258f1912c46824cbfb  delve-1.22.1.tar.gz
 sha256  778864b990007e8cef6633f8c372dd05bac1fada6cf67b008afb1483f83b38f5  LICENSE
diff --git a/package/delve/delve.mk b/package/delve/delve.mk
index f261d240b2..408286e3b4 100644
--- a/package/delve/delve.mk
+++ b/package/delve/delve.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DELVE_VERSION = 1.20.2
+DELVE_VERSION = 1.22.1
 DELVE_SITE = $(call github,go-delve,delve,v$(DELVE_VERSION))
 DELVE_LICENSE = MIT
 DELVE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
