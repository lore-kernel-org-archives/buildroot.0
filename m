Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B86BCD11BF
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 08:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00428605BD;
	Sun, 24 Mar 2024 08:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZO9gIytswxEb; Sun, 24 Mar 2024 08:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11C7B605CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11C7B605CC;
	Sun, 24 Mar 2024 08:58:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E59E1BF5A4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 08:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27EFA403C5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 08:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AEteJeFqTgRy for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 08:58:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D525240372
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D525240372
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D525240372
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 08:58:46 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33ed4d8e9edso2486476f8f.2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 01:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711270723; x=1711875523;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lKHGCo/IBRwaClgmg/HsQvyuGearP6DShC3dA/p1rvk=;
 b=JRQIATfq5Y8suoNYSG1bjaEVoLrX7Sg7yjC4ur4BJgu2cxC7q4Bb6OU5kgTdUtx0HC
 cxIreB0XKLKKN++e43s2WULxvsMVa20e4dkpkSYXcEgvOJPq3CEpD3usldl7YvKhCXI/
 9GGCZvUqT0cbqCB+KDzYWleSZTP3HMkSiCJA27jOPUVAMILYoDv5wjaEFMiNXrDLTaJa
 ZSyXNlnSuhLaC2REPyQlaJ8IXF13FWspEijwLd1NYa/6OqiAp4dLjeerVNDrA6FwYjhg
 m7ifJeONgFqDasPcy5L+BRKhYxo4HFpfe7cpwNB5/g9SWW39Xmi1G+VubPZx/RjpVSrI
 nsKQ==
X-Gm-Message-State: AOJu0Yw1wUTgvqsI4i75E3jyXoHGuBlwnxiwcRzjTcv7lHgCZeqxt3F6
 FRZif7SDyVN6/6+m2RM/t1/+pmIffAORpNzpRjx9qXmYhS6THHfUb/PHTO3y
X-Google-Smtp-Source: AGHT+IFjxpRBzmv1111lw0aQLs6+OGjwbXX7S838LCPcAleoOue+N3yXIva9MzI4alvR4zg3PnI6kg==
X-Received: by 2002:a05:600c:358d:b0:414:729:1189 with SMTP id
 p13-20020a05600c358d00b0041407291189mr2877113wmq.21.1711270723124; 
 Sun, 24 Mar 2024 01:58:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b0041488af9f47sm596591wmq.41.2024.03.24.01.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 01:58:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 09:58:36 +0100
Message-ID: <20240324085836.240068-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711270723; x=1711875523; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lKHGCo/IBRwaClgmg/HsQvyuGearP6DShC3dA/p1rvk=;
 b=Cit65Kqo1G/20i5ns0JQVNLo6tdxEKKeFh6J/j7PZFhsNGudFn08q2X7PvlnxkmFlC
 YihOwn1jYRmr7hubv7wup8j57S92ZbRClyFfZNWS+jGysojtYejDZXO6GTN/GUmxhwcw
 8lNbpANtiJH3CwFfYtJxDFAjMl+tDAgh9trAdz71U7i97OxyYQhY/LvsnVo8JmEA0oVQ
 imUU9gR/KyXRmP/GJjhS88nbS3Zgs/1xjVDVnRuX856I9Gw2meTAu/NmQ+mHPdLcjFi0
 MRHa2VcSVJYgdmYA+aTXyF9UqexiqkS7OLQP0QHeqkLjxOSB7wmsr918CPNYr7Dvx8w6
 W0UQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Cit65Kqo
Subject: [Buildroot] [PATCH 1/1] package/libtorrent-rasterbar: bump to
 version 1.2.19
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
Cc: Philipp Richter <richterphilipp.pops@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/arvidn/libtorrent/releases/tag/v1.2.19
https://github.com/arvidn/libtorrent/releases/tag/v1.2.18
https://github.com/arvidn/libtorrent/releases/tag/v1.2.17
https://github.com/arvidn/libtorrent/releases/tag/v1.2.16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libtorrent-rasterbar/libtorrent-rasterbar.hash | 2 +-
 package/libtorrent-rasterbar/libtorrent-rasterbar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
index 3f59642b72..b1abe85d84 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c8ad8638684c0a903ebabc30490079e31b1a6a638da2adec5a8bef6a0e62214b  libtorrent-rasterbar-1.2.15.tar.gz
+sha256  eee8e99548dc5eb5e643e49db9202f4f97112c032dba883dfdc8144af5b6e40e  libtorrent-rasterbar-1.2.19.tar.gz
 sha256  f3a5dd1558cce616b12edad521427ec8976ce2bb0af33f7f359cfa648bf55ad8  COPYING
diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
index 5eb80f0bd1..81247c63db 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTORRENT_RASTERBAR_VERSION = 1.2.15
+LIBTORRENT_RASTERBAR_VERSION = 1.2.19
 LIBTORRENT_RASTERBAR_SITE = \
 	https://github.com/arvidn/libtorrent/releases/download/v$(LIBTORRENT_RASTERBAR_VERSION)
 LIBTORRENT_RASTERBAR_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
