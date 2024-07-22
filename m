Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758BFC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 13:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2830840237;
	Mon, 22 Jul 2024 13:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Et4x-TsWXqlK; Mon, 22 Jul 2024 13:11:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D73244023D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D73244023D;
	Mon, 22 Jul 2024 13:11:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D022C1BF2A3;
 Mon, 22 Jul 2024 13:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD275400D2;
 Mon, 22 Jul 2024 13:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RvXPAu-jc0gy; Mon, 22 Jul 2024 13:11:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=git@douglass.dev;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 731DD400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 731DD400C6
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 731DD400C6
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 13:11:37 +0000 (UTC)
Feedback-ID: 3578:1022:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1050807383; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 22 Jul 2024 13:11:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 09:11:16 -0400
Message-Id: <20240722131117.273274-1-wdouglass@carnegierobotics.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=carnegierobotics.com
Subject: [Buildroot] [PATCH] package/chicken: move literals into text
 section for xtensa architecture
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
From: Woodrow Douglass via buildroot <buildroot@buildroot.org>
Reply-To: Woodrow Douglass <wdouglass@carnegierobotics.com>
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
---
 .../0001-xtensa-text-section-literals.patch   | 30 +++++++++++++++++++
 package/chicken/chicken.mk                    |  3 +-
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 package/chicken/0001-xtensa-text-section-literals.patch

diff --git a/package/chicken/0001-xtensa-text-section-literals.patch b/package/chicken/0001-xtensa-text-section-literals.patch
new file mode 100644
index 0000000000..b93aaf9e21
--- /dev/null
+++ b/package/chicken/0001-xtensa-text-section-literals.patch
@@ -0,0 +1,30 @@
+From e8d177f4d4e1c6bc41787ea1621e323ff4ad493e Mon Sep 17 00:00:00 2001
+From: Woodrow Douglass <wdouglass@carnegierobotics.com>
+Date: Mon, 22 Jul 2024 08:50:37 -0400
+Subject: [PATCH] Move literals into text section for xtensa architecture
+
+Upstream: https://bugs.call-cc.org/ticket/1840
+Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
+---
+ Makefile.linux | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/Makefile.linux b/Makefile.linux
+index b628cda4..e97c2b94 100644
+--- a/Makefile.linux
++++ b/Makefile.linux
+@@ -52,6 +52,11 @@ USES_SONAME = yes
+ 
+ # architectures
+ 
++ifeq ($(ARCH),xtensa)
++C_COMPILER_OPTIONS += -mtext-section-literals
++LINKER_OPTIONS += -mtext-section-literals
++endif
++
+ ifeq ($(ARCH),x32)
+ C_COMPILER_OPTIONS += -mx32
+ LINKER_OPTIONS += -mx32
+-- 
+2.39.2
+
diff --git a/package/chicken/chicken.mk b/package/chicken/chicken.mk
index 2667f7823d..8c7c1c4d8a 100644
--- a/package/chicken/chicken.mk
+++ b/package/chicken/chicken.mk
@@ -11,9 +11,8 @@ CHICKEN_LICENSE_FILES = LICENSE
 CHICKEN_CPE_ID_VENDOR = call-cc
 CHICKEN_INSTALL_STAGING = YES
 
-# If ARCH is not set, it attempts to autodiscover. But it is anyway not used.
 CHICKEN_MAKE_OPTS = \
-	ARCH=unused \
+	ARCH=$(BR2_NORMALIZED_ARCH) \
 	C_COMPILER="$(TARGET_CC)" \
 	CXX_COMPILER="$(TARGET_CXX)" \
 	PREFIX=/usr \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
