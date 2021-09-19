Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6031C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 00:52:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC6C360EE5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 00:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC6C360EE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B225606AF;
	Sun, 19 Sep 2021 00:52:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uaanllDK0bd5; Sun, 19 Sep 2021 00:52:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B917E60685;
	Sun, 19 Sep 2021 00:52:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3174A1BF966
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 00:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E0FD83FBB
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 00:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JM7d6WJl2Bxp for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 00:51:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E95883F7E
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 00:51:57 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.207.86])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Rl3imC22GXNB5Rl3jmPmWH; Sun, 19 Sep 2021 02:51:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632012715; bh=QmNRFT4JfBwQB7zjQ50Fpa/CgYMkmYY6hDNjixUFA4s=;
 h=From:To:Subject:Date:MIME-Version;
 b=oEfH5qcups5GVTrF6VTeJsTQPI96HfwS66P+8hCidZ7MRwF4Zwwr+j+eZOaB3c9BZ
 JYr8NlENumHpMCXn914MEcd2ABpFgLtBST46i89SBn9LsXmt4kxAsx1CZrp2aUQodU
 WIEn1nwNmQ/95o3VYB2wAMlFAiPq1qdaUkYjO31Dh5mvjUwLlYtvnXicRKAT71nY1i
 TnZUgqHKPUZzJtTTc4Uf9aPQKBIYNJxhg7RRd8mVqzXbKAagJ1aZtdwS0Mcz6lpl4N
 yPsrUQ+dqsbnvrIQRI4+h+jSCof95DjnMAH6IIlj77zfLwf3nysnYhnGHbearaeRz3
 va2YDR7Jz4Wrw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 02:51:54 +0200
Message-Id: <20210919005154.461600-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918124739.GN1053080@scaer>
References: <20210918124739.GN1053080@scaer>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDCWZZ3G998QAKsZ7NYmwbdqvOHt0+UK70bp2Ume40W/GDU6ykN95YOJJSYt8YlzrPNVx9ORkxeV2qEyj38GNMb9pvy1gTNz69ThiAAknhsKQQJ4BKSX
 qFVcAjpG92Ug01XbJhI5jnUP1a5jimRKtogZ0QxiKGwchj1UI+DRSXfPuLHvEftPA839//4uxnb75TuDT2VNQLJKX846u/oFT0I6Stm3JUw8Jmcg+rvTzEhD
 FZ14YRQb4pmuW/bVrtJ/W3THdoq0qS4sq6YzxPNmIo6zf4rVvW1kUuiz96y82eVzT6xxVIi7L2yoKEqxpTVdS6tpMJqDug8AFwAfXPOgCOxcUDVRJZOOWOeU
 gZB+jqNUTw3rn9wx45WcpbEOK6oU8nflW6ejwvCXUXlWSxScvxc=
Subject: [Buildroot] [PATCH v2] package/mesa3d: fix build on m68k
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

To build mesa3d for m68k we need to pass -mlong-jump-table-offsets CFLAG
since 'switch' blocks are pretty wide and lead to build failure. This way
'switch' blocks will have a 32-bit addressing by default instead of the
standard 16-bit. This can be done only with m68k gcc version >= 7.x
because gcc flag used to fix this(-mlong-jump-table-offsets) is
available only from that version on.

Fixes:
http://autobuild.buildroot.net/results/60c4653c2a93125edbdd0beb43cd47301643464a/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* add gcc >= 7.x dependency to Config.in as suggested by Yann Morin
* improve commit log according to Config.in change
---
 package/mesa3d/Config.in | 1 +
 package/mesa3d/mesa3d.mk | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index eb7c1eef46..e364f435c7 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -4,6 +4,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_m68k || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # m68k needs gcc >= 7.x
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1a9e355641..f1862aed69 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -259,4 +259,13 @@ else
 MESA3D_CONF_OPTS += -Dzstd=disabled
 endif
 
+MESA3D_CFLAGS = $(TARGET_CFLAGS)
+
+# m68k needs 32-bit offsets in switch tables to build
+ifeq ($(BR2_m68k),y)
+MESA3D_CFLAGS += -mlong-jump-table-offsets
+endif
+
+MESA3D_CONF_OPTS += -DCMAKE_C_FLAGS="$(MESA3D_CFLAGS)"
+
 $(eval $(meson-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
