Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1C6C369AB
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 02:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9817D607EA;
	Tue, 22 Apr 2025 02:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m02ivDEh5ym7; Tue, 22 Apr 2025 02:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C08F2608DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C08F2608DD;
	Tue, 22 Apr 2025 02:51:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 886B91A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 02:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A52A402A5
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 02:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cioniHQes8Xi for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 02:51:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BAF3B40287
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAF3B40287
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAF3B40287
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 02:51:45 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2254e0b4b79so68871575ad.2
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 19:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745290304; x=1745895104;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zvwAe9GnxznKVyZil7EyBuUeAHl2orm+2waaAD7hB/M=;
 b=N83nUyTUlcgrrZ3xfFIiS41CV2Mwe8FpKUdjrueOEfMGwaZYzCIhtNnUX4BCKSNWd5
 e0iqueb6EFBaGnaPiacEoKPNhWMb1My4q9sJarvvcYheXjUtj4BWVdy9WsDSWRbig8dn
 zH6FSAIR+2p7RCdsmIlgSDBr/gWFPFjbk3syqvSxnJRIZob8q1kCEpm1NthtVtslxP59
 yYzAEVaReCSTiC2JQSw2sCI4D5ZZBbCZgrpE+dh5IiRJ2EGUGBKshN3s00MiqGRGLsFn
 D+jxqkBGiRMMuxUail+4W6z8W03MmxcBuR+LYrnaazdwrNHHkJ2cwDfroh59JV9XgtL0
 ZqMw==
X-Gm-Message-State: AOJu0YyJ5VycPD/o1zVW/SK08ZLncb44+xDjdKLhvca4v5fddp51R/K3
 ExwqhHZ9mkxcDuykNjCgIkxS65WvwErZKgj47JszoKbzWRDUnskRBvBq9UNT
X-Gm-Gg: ASbGncsYfeyvPCMXQTd6chhFwwO3LPTl8ANNhZ4/HRORX1XytUZGqKUrvJO3MRDAvoo
 xX3n+chgvnwmmSmSLk787GqtdBMC93l4ODhLCI05W068UAY2oZpw3bPM3IQ4NtZgFWqy7ftsiF/
 yxRgoma5d3tfWNE1LI3an6XYSjqAPqLODOwVMRGD5UXRqSuBvXLlPZKagmwOTvcTTJ6GfLqoUrO
 jtRNhrjaQtECUUnmiYUiiOMYwYoUFb+Sw1lf13XB7AaTNNlh+4TZ8yGVQ1aod3P+61V90JYXCw/
 d1/R4WOFkiDgLoyY3akIhbMIvJmWx+AgRVZRgL2G93rFoHOl1T1pJUGYoPO5zKQ7MEUx4+VYNqZ
 elrYk3S5Yod4o0C3nVGE5Rs4vLbM=
X-Google-Smtp-Source: AGHT+IGNdnoyB4TFuB46sW4b2tqmKzRo9PrBqs2o/Lm5loHoXeuvsMV23FV5Qn5lGgz0AAZttVMHHw==
X-Received: by 2002:a17:902:e743:b0:225:ac99:ae0f with SMTP id
 d9443c01a7336-22c5356866cmr214079965ad.1.1745290303973; 
 Mon, 21 Apr 2025 19:51:43 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50bdaae7sm73022155ad.36.2025.04.21.19.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 19:51:43 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Mon, 21 Apr 2025 19:51:38 -0700
Message-Id: <20250422025138.781779-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745290304; x=1745895104; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zvwAe9GnxznKVyZil7EyBuUeAHl2orm+2waaAD7hB/M=;
 b=fs5B/h6jQMMMTORAySn0MCAMHCy0lvLq5Sha02yUBnDdT3pE8p6+5hf54tIy/uJ0o/
 JqWEYy4IfVM2YLhKagbBb8JmOTcfh8vvZ8GkvpWVEZ4Em/TTEqG77UyHRRlct5TGD+B5
 F4965vOrP0XEgHaMOKfsTtGJftatEmc6xR6c7C3GipputX9xBjk1t7BdWu3iIY1s5NQU
 yu7GKayIWcJuffDslBUZ/6E0vavhzkL1s2d9G6ysHqY/8v/+M1LLhfgw7Gfz0Wp70iiJ
 W4Aq3ZiRm4Em2Erx05te4ocjhbz1Gl11abuiWAhYGfiZK2RwRLK5DLNZl/Xf28aDjjTd
 6FWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fs5B/h6j
Subject: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.36
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

Changelog - https://github.com/pikvm/ustreamer/compare/v6.29...v6.36

Add host-pkgconf to dependencies.
https://github.com/pikvm/ustreamer/commit/4e3f873f0d8795eadbc70ff59933103b17fffbfd

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/ustreamer/ustreamer.hash | 2 +-
 package/ustreamer/ustreamer.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
index 02b317bc33..98d2d4b60a 100644
--- a/package/ustreamer/ustreamer.hash
+++ b/package/ustreamer/ustreamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  34572c241f65866caf458fa1526eaf9510656412f34d41a54bcd7aae0ba55630  ustreamer-6.29.tar.gz
+sha256  71aaba1427e8bb690500f1ae940aa64c3b3f7253750448c1331fad3b31500f3e  ustreamer-6.36.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
index 107f647f47..dd1369c121 100644
--- a/package/ustreamer/ustreamer.mk
+++ b/package/ustreamer/ustreamer.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-USTREAMER_VERSION = 6.29
+USTREAMER_VERSION = 6.36
 USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
 USTREAMER_LICENSE = GPL-3.0+
 USTREAMER_LICENSE_FILES = LICENSE
-USTREAMER_DEPENDENCIES = jpeg libevent libbsd
+USTREAMER_DEPENDENCIES = jpeg libevent libbsd host-pkgconf
 
 USTREAMER_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
