Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFE1C6FD1F
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 14:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12D19606EA;
	Sat, 30 Mar 2024 14:16:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A92W9-MLR3Si; Sat, 30 Mar 2024 14:16:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25043606F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25043606F3;
	Sat, 30 Mar 2024 14:16:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2442B1BF29F
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 14:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DB74821FC
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 14:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDPLdWS1kt9S for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 14:16:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.116;
 helo=smtpcmd03116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 68C97821DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68C97821DD
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68C97821DD
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 14:16:30 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id qZVTr6SHC4yJYqZVTrs3XU; Sat, 30 Mar 2024 15:16:27 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 15:16:25 +0100
Message-Id: <20240330141625.1304798-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIr4dRdzDMGoz1jFHG3bxAC1ZmnDnZLrrzAIwxIQmW/CR2QuumV8K4ijDIuUzA/plvvw/MbvKaeH3OCH3bWHL1IrLrF/9b/ry09Fqw+p07lHQ2VkdlU6
 DJMHWq+DShcA68uVMp69kERZ0mf4niMwXfApVNZiBLLVqWgKbv/ZlJG8j9YhtW5Yy8U18b9jaUMigvtgN8dIrNOzUS9BcCKhcSG8f6h+LlJqR8c3aBzo53Bc
 peBaA1tSq/qy8/J9k/JjknUQBnpLlCzyXrlebl/6KY8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1711808187; bh=h05nFgjOismcSI6+36OPIT9Tl10/f6uTTfNCMgmxDLg=;
 h=From:To:Subject:Date:MIME-Version;
 b=e2+sDd3kcOq8vG9iNg3wHHO/+KeMMgEBwdSYgFXnuZxcReJKBtTpDmcBo+2LREX+F
 iVHVVQpyy/pWDhFP9ApkesONLG2tdawx7hk1ESmgBUFirHtU+rSb8ZM0PI5pbWv75L
 XE+3qExhHGzs44z0ZKOFA6cvYhUfDSkh2+dU7w9u1K9sQoQkqAi7ZOYzdGZ9ZEFHGx
 jCUvdxpNcNwMH2TmM9d6bbPEliJLiQc0rUyyAkJPK7gCcBcl1P5eG17g2Pw/88bfWH
 fbu0gOi3pe6oEF6ArRvr9Sbx6HG1wOBUtgFb3ab4pBXBqfrYIO2o+510DiAXOWu3mC
 0//Khd4RYs9cw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=e2+sDd3k
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 8.4.0
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
index f107aee8c2..1ea54e8ee9 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f73e1eacd7e2ffae687bc3f056bb0c705b7a05aee86337686e09da8fc1c2030c  harfbuzz-8.3.1.tar.xz
+sha256  af4ea73e25ab748c8c063b78c2f88e48833db9b2ac369e29bd115702e789755e  harfbuzz-8.4.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index e3da4add43..848fac4dd6 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 8.3.1
+HARFBUZZ_VERSION = 8.4.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
