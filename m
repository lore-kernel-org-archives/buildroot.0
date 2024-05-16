Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507E5C25B78
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 19:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0622F400A6;
	Thu, 16 May 2024 19:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTDY64yncnMX; Thu, 16 May 2024 19:33:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E388400BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E388400BA;
	Thu, 16 May 2024 19:33:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FB981BF2EF
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 19:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 298BA60E43
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 19:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HY6dkWdT8FUA for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 19:33:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.56;
 helo=smtpcmd0756.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4443360C17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4443360C17
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4443360C17
 for <buildroot@buildroot.org>; Thu, 16 May 2024 19:33:10 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 7gqisajN96epj7gqisc7OP; Thu, 16 May 2024 21:33:08 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 16 May 2024 21:33:07 +0200
Message-Id: <20240516193307.465413-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFVAQORRHpbAFR3j4cE2/l7eSYG3vcLtjWl3U5UQYIjp4Afk9/Pnllh0HzZCKssLVZFr2Bu2M4a1QCg93RUWUViVqY6SZT/9R0wKUpQEaQ2aBchthFVo
 yQKuvVGg6xLAKMeXKkDAZBUX9Pc7jW+HCMSSr/VvGnyhuw2RxF4AOge9fWqs8tSN6znyzuPue2938dkmjpar1Off6lELvWRs/tvmVxubVUKX42NTGS8hib0n
 zzL1kpM+yLeCwzaPCwv7c5YTZsvSWbC1RqdGqsX0NxQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1715887988; bh=7gYJk0auqoEiLrj+yO7sv38F+3RMIIIaUuGjYJrbaWw=;
 h=From:To:Subject:Date:MIME-Version;
 b=Rh8FA2o0IdVcH/w19lM08F4Nk67xxogj+SopWqTKX7k1k2M050ppMTCe+bH7ADEdM
 QBepRkotlgZq/gHb6fR7iFUrfsmCq5oYLcQKbNB1PsTb7LYBqEHxTGpBShl+cPihu6
 kErnm2SpEc5zyVInH++MkRqNvDFC3rzVP+9dMbuNJ1xAhV3xJj1ZR6eDtnASqdMFD0
 M+hRfXGCLLsyMpAwksel/DejHEAMrkWmH45zwj/GYqVFV1wMw62ECpFQIwNomXJyHN
 caHQUqhkLa+/sZAjyn2bxAnN+N722OV3sYIHyhQi2Gf3NntfdqLiaAFK+KBkNAlB7q
 qLlY6H7z5FpVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Rh8FA2o0
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 8.5.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 1ea54e8ee9..d5fc1ae096 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  af4ea73e25ab748c8c063b78c2f88e48833db9b2ac369e29bd115702e789755e  harfbuzz-8.4.0.tar.xz
+sha256  77e4f7f98f3d86bf8788b53e6832fb96279956e1c3961988ea3d4b7ca41ddc27  harfbuzz-8.5.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 848fac4dd6..3beac5e836 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 8.4.0
+HARFBUZZ_VERSION = 8.5.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
