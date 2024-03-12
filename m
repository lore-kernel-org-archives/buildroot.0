Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E582C54E5D
	for <buildroot@archiver.kernel.org>; Tue, 12 Mar 2024 19:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D01760748;
	Tue, 12 Mar 2024 19:14:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xkx98f6TKbrF; Tue, 12 Mar 2024 19:14:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42B8A608C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42B8A608C8;
	Tue, 12 Mar 2024 19:14:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D9B1C1BF32D
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 19:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C49E0405D9
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 19:14:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d90fGUJNC8V1 for <buildroot@lists.busybox.net>;
 Tue, 12 Mar 2024 19:14:15 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=jeremy@jeremypeper.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 12411405B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12411405B1
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12411405B1
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 19:14:14 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3666dc3d1fbso4717505ab.1
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 12:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710270854; x=1710875654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7zO+/T6QsbEgGknGu44kcR9HoofMf3ULRPIExXFBDmg=;
 b=ATRyGwu9DSIvEs4hUIrQKUkj0B1VpbYMyEbPY6NB8ityKrABeva7ue4oqO4+gj9Dd1
 OOVOnCzU0Hu1wPREcCVw6I1Ry+oEJ49Bgf1ikCbfnpYjlDtYu33kPnsGZcyVhWI7aM2L
 auxRbJuYc7WuaJzBOvCNmti0lS6YZiSv+a6PdTF3GEw6lh7h4vxH4eJWnFBeviszzwDC
 WGUMw34e1/Rl3HjSAQI+hiV+rs7tFUJyrxw9Ihm9xW89SpqRZYGaVAJoPDnlBf55YFUk
 8ltWFTbCPpbHVcWzb657AZXkGw2JGc4ktgfW3pi9wlMM0kQ/K6sydejpj+61ORCrceb7
 H/lQ==
X-Gm-Message-State: AOJu0Yw6iKjkxF/ioW9n0mjSSqtVBzwAOnWFGjPQsZhAYMwGiu1mlbql
 z15cC+1R4WNHk03xM26WeGpxIn5lqD8O1xuSZJwDYQQVlumrhQfVpEVJxQ67xoUZ1hPLCHkjtmI
 Lxw==
X-Google-Smtp-Source: AGHT+IEopq/C7Or/xPanRrPPxJRq+krvRq0GIz7LjpBLPReR3T4SqMomk4r9/xkZ43sQ2kStgyGtNA==
X-Received: by 2002:a05:6e02:1988:b0:365:1611:5d75 with SMTP id
 g8-20020a056e02198800b0036516115d75mr13295118ilf.24.1710270853739; 
 Tue, 12 Mar 2024 12:14:13 -0700 (PDT)
Received: from earth (97-127-36-49.mpls.qwest.net. [97.127.36.49])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a920b0a000000b003662e1427e9sm2485286ilf.60.2024.03.12.12.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 12:14:13 -0700 (PDT)
Received: by earth (Postfix, from userid 1000)
 id 20C8F1060DED; Tue, 12 Mar 2024 14:14:12 -0500 (CDT)
From: "Jeremy J. Peper" <jeremy@jeremypeper.com>
To: buildroot@buildroot.org
Date: Tue, 12 Mar 2024 14:11:49 -0500
Message-Id: <20240312191148.656980-1-jeremy@jeremypeper.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jeremypeper-com.20230601.gappssmtp.com; s=20230601; t=1710270853;
 x=1710875653; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7zO+/T6QsbEgGknGu44kcR9HoofMf3ULRPIExXFBDmg=;
 b=JgiXVLYVqNoxo/ldmhtTrMFF/QxWhqHEve6vP1wW2Pn/lQNcngF89kO9xpV0g0nn5j
 5SoASHUqv51SBpZF6pQavUSExWTvqFND3y0G3mCDeqDna1vTC1B42CCG4MEygbtdhRZ2
 7MD68RGPcONxWfqlOfkiicS267AU3HM/DsiOB9uoz6sGWu48g6WihcGQwh8W9rC9GWYy
 Bf5xhBsA4illx1kf/JvbfWgYZhNGT9P/tTU7lCm7Lzo8xib9kAabr9DQ/tkyFrBhQDfX
 /dkgYppFZjTuZECeZySQxFSDPCNrNcEu8btD982dKhyhbNU6jZ76/7KPhDl1+gAnd5yw
 lxjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jeremypeper.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jeremypeper-com.20230601.gappssmtp.com
 header.i=@jeremypeper-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=JgiXVLYV
Subject: [Buildroot] [PATCH v2] package/targetcli-fb: needs python-gobject
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
Cc: "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

add python-gobject to resolve "ModuleNotFoundError: No module named 'gi'" error encountered if built without it.
add python-gobject's dependencies as well

Signed-off-by: Jeremy J. Peper <jeremy@jeremypeper.com>
---
 package/targetcli-fb/Config.in       | 1 +
 package/targetcli-fb/targetcli-fb.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/targetcli-fb/Config.in b/package/targetcli-fb/Config.in
index 04c6a1ac..722b9400 100644
--- a/package/targetcli-fb/Config.in
+++ b/package/targetcli-fb/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_TARGETCLI_FB
 	select BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	select BR2_PACKAGE_PYTHON_RTSLIB_FB
 	select BR2_PACKAGE_PYTHON_SIX
+	select BR2_PACKAGE_PYTHON_GOBJECT
 	help
 	  targetcli-fb is a command-line interface for configuring the
 	  LIO generic SCSI target, present in 3.x Linux kernel
diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index d2cbf79e..2d375417 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -12,7 +12,7 @@ TARGETCLI_FB_LICENSE = Apache-2.0
 TARGETCLI_FB_LICENSE_FILES = COPYING
 TARGETCLI_FB_CPE_ID_VALID = YES
 TARGETCLI_FB_SETUP_TYPE = setuptools
-TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb python-six
+TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb python-six python-gobject $(PYTHON_GOBJECT_DEPENDENCIES)
 
 define TARGETCLI_FB_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/targetcli-fb/S50target \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
