Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377A5E668B3
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 17:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 086B060DDC;
	Sat, 20 Dec 2025 17:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19rsxQjadBBP; Sat, 20 Dec 2025 17:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6E2C60DB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766250427;
	bh=pZBiLCB1O6xpkSPrg5ry0g+qGr4WdUIRu05SqJFpMc4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=opNjzn9mk9Qikq3eygPBXzl3Ta+3WGXMYXX7OelmbIUHBRmjdmOXaxv2BGhl3ZZ7i
	 FWwHKieC6mZ019Whbj8kIt+wcwMpGIu/typPzw3NS3z8xQyMH3C7CWwjajBP8qFxpu
	 x1HKYKCd0wcKZQ2yXFDlRBuIxIeS13+H9VXngcATEy/qAhCFtWSHytnGVJKQJqAoFd
	 9lgdEgez3dNfCSWSlqx4i1GlR7U3f96RJOPeIeEZGCd+g6lZQTwaB5fzWfUBXPsxFi
	 12J3xezpc2L3Ro/FmRn8wwKON/EZfhN/JNl2S4DaoVP6UB8RH/4vBqRJQhyOHQqxAZ
	 UUTTyyVrIZsyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6E2C60DB7;
	Sat, 20 Dec 2025 17:07:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02E83119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD90E4062D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1hw8XSay-Ez for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 17:07:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D20114035D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D20114035D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D20114035D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:07:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0A44BA4C486F
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 18:07:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42440)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX0PP-000000004K3-3eON
 for buildroot@buildroot.org; Sat, 20 Dec 2025 17:06:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 18:06:23 +0100
Message-ID: <20251220170623.155785-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220170623.155785-1-bernd@kuhls.net>
References: <20251220170623.155785-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766250422;
 bh=aUAO3pB2MGSB30TBBoEkwg4lRyvcvrvs/uWDcBgNO2M=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=ZvheIv4a3ZowXrs62Oq2zJ1R1yxgXP1lwWjLY5jRrvILo2rMtVp3HeO7yQsTiqK5l
 gv5XtMze0Y+PaDcoyZahl6h0bcdeE3wPnWSFABTVDQC1f0V/qPYCraFynB72hW5ILl
 YpX1FiG8QSnzd7t5fiXYJR3cdWcptOQhfcsY5lfeKmny5D5glTwuPgwcrgwOgQi0e+
 /oq714XdsDQMirKhJCFPIYd1R77MLZpwSXHzk//Sgdt2/Fo/b/wPpqeekiee4F2rTG
 ohdwWSizIEW3/SEd1wj82T3xMxp4xBf+IZuoa1x+8m3GPrCaBe4FTfXEX9Hud5sIlD
 wRXQd4yJ+YGCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ZvheIv4a
Subject: [Buildroot] [PATCH 4/4] package/util-linux: bump version to 2.41.3
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

Release notes:
https://www.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.3-ReleaseNotes

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/util-linux/util-linux.hash | 2 +-
 package/util-linux/util-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index af850c03d6..eab8a0c3b5 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/sha256sums.asc
-sha256  6062a1d89b571a61932e6fc0211f36060c4183568b81ee866cf363bce9f6583e  util-linux-2.41.2.tar.xz
+sha256  3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b  util-linux-2.41.3.tar.xz
 # License files, locally calculated
 sha256  4c2db318192bda62f3f8fcf71488bb5e602ae4385eba281d711b46cc13a40bb3  README.licensing
 sha256  527f738966ca396cd5a68c1509390de2a780c6b614d9ee57f7544a6161938ed1  Documentation/licenses/COPYING.BSD-2-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 40d948ec97..14389254cb 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,7 +8,7 @@
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
 UTIL_LINUX_VERSION_MAJOR = 2.41
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).3
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
