Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB8FC87FCF
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 18:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EE4C8235A;
	Mon,  4 Aug 2025 18:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l__LYqrlwj9V; Mon,  4 Aug 2025 18:53:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA12E8234D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA12E8234D;
	Mon,  4 Aug 2025 18:53:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 849951A2
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BA1260AD4
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TOukEXBZ2tT9 for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 18:53:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3C56960745
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C56960745
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C56960745
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:53:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf8c.dip0.t-ipconnect.de [84.161.191.140])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6080DA4C2EF8
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:53:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52874)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uj0JT-000000001Hr-2XnZ
 for buildroot@buildroot.org; Mon, 04 Aug 2025 18:53:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Aug 2025 20:53:35 +0200
Message-Id: <20250804185335.3345211-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1754333616;
 bh=ik1tjUxoWGVB/JOSPmzW2zAcysYap4yuhkTL8pYdGCM=;
 h=From:To:Subject:Date:From;
 b=njgctggZX2cIodA0WvfRz1nuVsCYcvlJdiI4X/TT+72FIZF4t0hrzpkO7F4Qx3ruu
 umjb+xufERwXxtWNUX4vThVaM9yHkHWLzytoU4vnYKufL8vxDK9aCgg9k4R+rtlBiy
 vPtKCyzMnMtGpNlA3IedBtXGWkjFWpJCz4geUAPT5V6sDampqM8pORyYjeihOiD0/j
 EqedGvx/ki+H8MaOl0HhRGWavGOuaQqFIVc5lqR7qLD3pA5Qll7Ya+yCeP1NaBbRkD
 t51dit6/iMoVZ1pFxK/f5ufUloijb8mLUSXsSjckXLhSzRpb2YHt4YSh7UOj2bFqqZ
 3ZmarfNOeP8Wg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=njgctggZ
Subject: [Buildroot] [PATCH 1/1] package/glm: bump version to 1.0.1
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

Release notes: https://github.com/g-truc/glm/releases/tag/1.0.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/glm/glm.hash | 2 +-
 package/glm/glm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glm/glm.hash b/package/glm/glm.hash
index 0084bd0930..a9f4c9ee7f 100644
--- a/package/glm/glm.hash
+++ b/package/glm/glm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e51f6c89ff33b7cfb19daafb215f293d106cd900f8d681b9b1295312ccadbd23  glm-1.0.0.tar.gz
+sha256  9f3174561fd26904b23f0db5e560971cbf9b3cbda0b280f04d5c379d03bf234c  glm-1.0.1.tar.gz
 sha256  62d2d642c7d054d4fb4c9b42faad617d6c88fcd91e317f8035aa9f277cc159c3  copying.txt
diff --git a/package/glm/glm.mk b/package/glm/glm.mk
index ce8efc11a7..b2e13f09bb 100644
--- a/package/glm/glm.mk
+++ b/package/glm/glm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLM_VERSION = 1.0.0
+GLM_VERSION = 1.0.1
 GLM_SITE = $(call github,g-truc,glm,$(GLM_VERSION))
 GLM_LICENSE = MIT
 GLM_LICENSE_FILES = copying.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
