Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B91CCA480
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 15:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F07B041A2C;
	Wed, 20 Jul 2022 15:24:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F07B041A2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RiZaNVOoOEHh; Wed, 20 Jul 2022 15:24:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA75241A27;
	Wed, 20 Jul 2022 15:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA75241A27
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 088151BF593
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 15:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D564641A28
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 15:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D564641A28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RuZg_QhXf1bE for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 15:24:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE55C41A1E
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE55C41A1E
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 15:24:44 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h9so1538083wrm.0
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 08:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UIyXoeZ9qUY9eO8eRjCLhzTkKJM6NcQquXTx5J11+Y8=;
 b=MXcs8PDL+UQQt8pDJ0TNInuyKdtFb0pooAtHyujWGZmxH0wPxmHbKL79Al40oCsd/p
 K5K0VKJeA7onAYWCUmTJHibL/nahRTUC5J2Tk1gVF2WhDTP138k/9G2ueRgVhek6VhU6
 qh3Q7ofmK6W1YiihP/kHt+2oLo8jeNOMR3gzgNsan4lCg+ABBusS5OKfCdHNIooxWPCJ
 f3SxqGTZRHIyNFoe49Nt5tF1oiKhStKLycGGm+GH4bDNg5CBrba/Sp1xJCBdtiDVFCHg
 nQEJzpTx+l0sLAUvqrPjJofGxnPeWOM0kNEQ4jur1NWd/OWcRF7nHCz9MW9Brz060XJ3
 vKAw==
X-Gm-Message-State: AJIora99EDuqvR4w7sulK22WZylyfRY1kILKo8QaxQwGptH/9RDKKxjS
 lSPG7dQpYv3zhM8YFt/eP28ACr/9xEs=
X-Google-Smtp-Source: AGRyM1szU/UlrUXmqmAWA3I8BeBgOQFMUj6yAQzLDaEbSuHy7C8bQzL/mNn1xsTS8G2MYDnPLC7IcA==
X-Received: by 2002:adf:f98d:0:b0:21e:492a:8452 with SMTP id
 f13-20020adff98d000000b0021e492a8452mr2866066wrr.404.1658330682680; 
 Wed, 20 Jul 2022 08:24:42 -0700 (PDT)
Received: from m1champc.home.arpa
 (dslb-178-005-108-217.178.005.pools.vodafone-ip.de. [178.5.108.217])
 by smtp.gmail.com with ESMTPSA id
 b5-20020adff905000000b0021e45afa7b0sm3137221wrr.109.2022.07.20.08.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:24:42 -0700 (PDT)
From: Michael Zimmermann <sigmaepsilon92@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 17:24:40 +0200
Message-Id: <20220720152440.1568667-1-sigmaepsilon92@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UIyXoeZ9qUY9eO8eRjCLhzTkKJM6NcQquXTx5J11+Y8=;
 b=WbDfVDU49nIRMyzCm1EduV2d2agDzWPcDmMzO21fsItzBHF4t9MRTwGrFmNe82XxIF
 FRvgbXVcrkXv/zvfEQiU+47NPOndoQnccmrcE2zSdCuja/T4cxfbuQtRijscGNF9BRul
 B30WWu0lDkUHliFPNsOAAkGoU4rC0IUH/qQ/XFGYBeIKutuanyErP6qfU9eyJU6kIsVS
 J5AtQ3+pcpAmLrY3WGcOlyuk7DpKATnjLnpNdJDkjJV9gzEmJLCwgVbTTY4QuFAtzzNo
 6bQ5BCJpU8RF3QYjDwsBEFUz+zwrpFih7JrRgj5jQwDYlvqMZDYd71O9fEP9oJcRfAnw
 nfUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WbDfVDU4
Subject: [Buildroot] [PATCH 1/1] package/zfs: fix cross-compilation
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
Cc: Michael Zimmermann <sigmaepsilon92@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, the kernel module gets built using the host-compiler(from the
user distro, not from buildroot). That might work when target and host
arch are the same but during cross compilation that results in the
message `Unable to build an empty module.` because tests for compiling
modules fail due to missing headers.

Signed-off-by: Michael Zimmermann <sigmaepsilon92@gmail.com>
---
 package/zfs/zfs.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 07ce3295ec..30f966bdeb 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -57,6 +57,9 @@ else
 ZFS_CONF_OPTS += --disable-pam
 endif
 
+ZFS_CONF_ENV += $(LINUX_MAKE_FLAGS)
+ZFS_MAKE_ENV += $(LINUX_MAKE_FLAGS)
+
 # ZFS userland tools are unfunctional without the Linux kernel modules.
 ZFS_MODULE_SUBDIRS = \
 	module/avl \
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
