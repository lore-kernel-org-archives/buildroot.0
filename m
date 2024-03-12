Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB4EC54E5D
	for <buildroot@archiver.kernel.org>; Tue, 12 Mar 2024 19:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7FA560748;
	Tue, 12 Mar 2024 19:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gEUUGTX4i-pq; Tue, 12 Mar 2024 19:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDFBC608F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDFBC608F0;
	Tue, 12 Mar 2024 19:32:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3359E1BF32D
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 19:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D89381E52
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 19:32:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LPvsOR_Akogc for <buildroot@lists.busybox.net>;
 Tue, 12 Mar 2024 19:32:08 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=jeremy@jeremypeper.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4344E81E50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4344E81E50
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4344E81E50
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 19:32:07 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7c8b8618457so8597639f.3
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 12:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710271926; x=1710876726;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7zO+/T6QsbEgGknGu44kcR9HoofMf3ULRPIExXFBDmg=;
 b=a1Wuf2azgye+QFNpqNnyI/4cnWlBTl3CSNyWt9c9FWQiA5VCHTNN0AhbUgRxmprDPi
 kSMwwbbVlzGmEaZmKSvsDaP0wrPT2hjtS+8MJSH0fN6e4dsSRbnZQLP4MoSIAfu4f7ah
 WoBCzEn33CjKwqgHQr5F2eOEDZkEffH4pK/cWHfLoMEBc9VwbK90H3mIGLUGFBmsIdxD
 ScmnuG+hy6SakRVIsGfVh7AoDRocg8XFRGX+t+Z5WrEgdx+Q5oXvPMnONALvtd2IHUpV
 u280BT4Vj+E0thQNxt9lUYP/skAsQ5kLyDznTj3ILDJy1XIeRTo4TAZwMut/OGyH/Mzb
 Sxug==
X-Gm-Message-State: AOJu0YyQbP/3pehYfviY7HFg1Seqp5Kt9KBcBQziZFIF4Uk9IxqU5i9C
 F8hBC5eo8vKQTSbM8JB2/qP/4sqpP/gYx7Vm8Cd/DZ9q0iH3YL028xCHmxTVkN7leE92NxgwhO1
 c1A==
X-Google-Smtp-Source: AGHT+IEFro944aFGLwdOL+QnnJw4cvP6PxAVt00RCIrTkJufU2Przer7rex+MtYkH4yq+G1MbyTZgQ==
X-Received: by 2002:a05:6602:f12:b0:7c8:41c7:6ac5 with SMTP id
 hl18-20020a0566020f1200b007c841c76ac5mr1523195iob.6.1710271926490; 
 Tue, 12 Mar 2024 12:32:06 -0700 (PDT)
Received: from earth (97-127-36-49.mpls.qwest.net. [97.127.36.49])
 by smtp.gmail.com with ESMTPSA id
 fx22-20020a0566381e1600b00474895385c0sm2502031jab.109.2024.03.12.12.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 12:32:06 -0700 (PDT)
Received: by earth (Postfix, from userid 1000)
 id 3F4071060DED; Tue, 12 Mar 2024 14:32:05 -0500 (CDT)
From: "Jeremy J. Peper" <jeremy@jeremypeper.com>
To: buildroot@buildroot.org
Date: Tue, 12 Mar 2024 14:31:37 -0500
Message-Id: <20240312193140.663261-1-jeremy@jeremypeper.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jeremypeper-com.20230601.gappssmtp.com; s=20230601; t=1710271926;
 x=1710876726; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7zO+/T6QsbEgGknGu44kcR9HoofMf3ULRPIExXFBDmg=;
 b=WFkOgteX1yL+aNT1nj7B4wexOIJM9aEvQVwmo+oMgKP/zE1lNTCCkNUOzkfuSWjprN
 ToEXDVvoWUxS1wMhsGfy6tE8clyl/inF2AEDtNoWRC80iml4/E3tgYZ4ER+xZbnxRyI+
 jrYGFXsmFztvFoCZLmHEHk9F3twCcXX1AuKjGLBmRoNgtcAHAG24o4egiRcIZ1Igx4Hl
 shxbIWHSNV/JZzjd6Efq+WU2e1+pdmg7YWV4EqxUS0hXGjCskBrcpRlKXFiJ3WOeNzxZ
 tLTeHOnao1ZJlMv/Sc204Wund5keCSlvyVp3Tug/SDyuLvuFNGjTKVGQK/xLZnyv65SE
 jpJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jeremypeper.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jeremypeper-com.20230601.gappssmtp.com
 header.i=@jeremypeper-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=WFkOgteX
Subject: [Buildroot] [PATCH v2 1/3] package/targetcli-fb: needs
 python-gobject
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
