Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE95CFD376
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 11:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C617740A9E;
	Sun, 30 Nov 2025 11:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PLvP2Sv6_40; Sun, 30 Nov 2025 11:50:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E983640A9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E983640A9F;
	Sun, 30 Nov 2025 11:50:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 22BC2351
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 11:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05EDA82312
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 11:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rEeX7S8Qoc2C for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 11:50:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D4FF08230F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4FF08230F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4FF08230F
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 11:50:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b593.dip0.t-ipconnect.de [84.161.181.147])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1482BA4C76C8;
 Sun, 30 Nov 2025 12:50:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51846)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vPfx6-0000000031o-31JD;
 Sun, 30 Nov 2025 11:50:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Nov 2025 12:50:52 +0100
Message-ID: <20251130115052.3005204-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764503453;
 bh=gtyJ9YbmHPibfNSn61QHZSj0hCfjyznZdmKzRQs8L2E=;
 h=From:To:Cc:Subject:Date:From;
 b=qjo8mr7jPjXAfLfZHCSeAp61fx/kvxhSt5CBmLLXbQ3HBG5Pu5L4gbHbW+GzO7vK8
 rvDrDMekF8PXzwMoapfpVUKiOu+CvvTx/4zA5SVU87X4FOXXMuLzTNlW3YhZvb14cH
 4ICR+d2v+uJaXR9YG46QrlX8a+V6Jrz/9IguaTx16sLFDcHik+E3qGDZBIvIHS2LZa
 UWtqaiJFHuGg8CfY45ymSlPPIBc4LSi+fDu1x5vuE9esHcAXAhzkySIE16jiyzRR66
 uhpMbSz4RwYQUMaNeob3uJ7fbI0CfYRK0cFNwaEIrJ13d2YD/AmNgfcbZa/eO0X3lR
 NPRKgvTGxQK1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=qjo8mr7j
Subject: [Buildroot] [PATCH 1/1] package/18xx-ti-utils: switch to git repo
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

Downloading the snapshot tarball has been unstable in the past so we
switch to git for fetching the source code.

Fixes:
https://autobuild.buildroot.net/results/8b9/8b9b15e578ee13c47bdfe77f8bd79cd34c49de91/
https://autobuild.buildroot.net/results/bfc/bfcfb6e5014e017334604ba8fdcfac2acc65d161/
https://autobuild.buildroot.net/results/6c6/6c69077ea076c3c28d0e8599913cde31ee27b0c5/
https://autobuild.buildroot.net/results/b43/b431fabedd709f660f556a7a6539a0b1e28aeb49/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/18xx-ti-utils/18xx-ti-utils.hash | 2 +-
 package/18xx-ti-utils/18xx-ti-utils.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/18xx-ti-utils/18xx-ti-utils.hash b/package/18xx-ti-utils/18xx-ti-utils.hash
index 7ecca54b9b..116d05e8e9 100644
--- a/package/18xx-ti-utils/18xx-ti-utils.hash
+++ b/package/18xx-ti-utils/18xx-ti-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ce0185ba8a9bf456cc94a798bf66903775065e337e53ff812f18a6d88f5bac13  18xx-ti-utils-R8.8.tar.xz
+sha256  33be3c90719bf36d5da76c6faaefb07bf3697635f81b86e28b92307d7825483e  18xx-ti-utils-R8.8-git4.tar.gz
 sha256  363cef40b276a7a91ebcff3f78626d9cfe5e5a51927c725236007259403d5fc4  COPYING
diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk b/package/18xx-ti-utils/18xx-ti-utils.mk
index 5d45191cde..3e6f715730 100644
--- a/package/18xx-ti-utils/18xx-ti-utils.mk
+++ b/package/18xx-ti-utils/18xx-ti-utils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-18XX_TI_UTILS_VERSION = 8.8
-18XX_TI_UTILS_SITE = https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils/snapshot
-18XX_TI_UTILS_SOURCE = 18xx-ti-utils-R$(18XX_TI_UTILS_VERSION).tar.xz
+18XX_TI_UTILS_VERSION = R8.8
+18XX_TI_UTILS_SITE = https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils
+18XX_TI_UTILS_SITE_METHOD = git
 18XX_TI_UTILS_DEPENDENCIES = libnl
 18XX_TI_UTILS_LICENSE = BSD-3-Clause
 18XX_TI_UTILS_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
