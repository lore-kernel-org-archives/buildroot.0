Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24991C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 12:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8C5F400F4;
	Mon, 12 Aug 2024 12:43:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ClvbCrHxJITx; Mon, 12 Aug 2024 12:43:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94E29400FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94E29400FF;
	Mon, 12 Aug 2024 12:43:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FA921BF301;
 Mon, 12 Aug 2024 12:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AEE4606DC;
 Mon, 12 Aug 2024 12:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lyMtpCxWipgp; Mon, 12 Aug 2024 12:43:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=git@douglass.dev;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 814EC605D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 814EC605D0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 814EC605D0
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 12:43:33 +0000 (UTC)
Feedback-ID: 3578:1022:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1262073858; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 12 Aug 2024 12:43:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 08:43:18 -0400
Message-Id: <20240812124319.12094-1-wdouglass@carnegierobotics.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <878qx93exs.fsf@tarshish>
References: <878qx93exs.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=carnegierobotics.com
Subject: [Buildroot] [PATCH] Revert "package/chicken: move literals into
 text section for xtensa architecture"
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

From: Max Filippov <jcmvbkbc@gmail.com>

This reverts commit 86e51fd5fe2810bbf833b48c4914dcd2de01bdbe.
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 .../0001-xtensa-text-section-literals.patch   | 30 -------------------
 package/chicken/chicken.mk                    | 14 ++-------
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 package/chicken/0001-xtensa-text-section-literals.patch

diff --git a/package/chicken/0001-xtensa-text-section-literals.patch b/package/chicken/0001-xtensa-text-section-literals.patch
deleted file mode 100644
index b93aaf9e21..0000000000
--- a/package/chicken/0001-xtensa-text-section-literals.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From e8d177f4d4e1c6bc41787ea1621e323ff4ad493e Mon Sep 17 00:00:00 2001
-From: Woodrow Douglass <wdouglass@carnegierobotics.com>
-Date: Mon, 22 Jul 2024 08:50:37 -0400
-Subject: [PATCH] Move literals into text section for xtensa architecture
-
-Upstream: https://bugs.call-cc.org/ticket/1840
-Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
----
- Makefile.linux | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/Makefile.linux b/Makefile.linux
-index b628cda4..e97c2b94 100644
---- a/Makefile.linux
-+++ b/Makefile.linux
-@@ -52,6 +52,11 @@ USES_SONAME = yes
- 
- # architectures
- 
-+ifeq ($(ARCH),xtensa)
-+C_COMPILER_OPTIONS += -mtext-section-literals
-+LINKER_OPTIONS += -mtext-section-literals
-+endif
-+
- ifeq ($(ARCH),x32)
- C_COMPILER_OPTIONS += -mx32
- LINKER_OPTIONS += -mx32
--- 
-2.39.2
-
diff --git a/package/chicken/chicken.mk b/package/chicken/chicken.mk
index 0520280134..2667f7823d 100644
--- a/package/chicken/chicken.mk
+++ b/package/chicken/chicken.mk
@@ -11,19 +11,9 @@ CHICKEN_LICENSE_FILES = LICENSE
 CHICKEN_CPE_ID_VENDOR = call-cc
 CHICKEN_INSTALL_STAGING = YES
 
-# Chicken only uses the "arch" variable for some special-case compile
-# arguments If it's empty, it tries to detect the arch host Filter out
-# values that have an effect, or pass "unused" here
-ifeq ($(NORMALIZED_ARCH),x86_64)
-CHICKEN_ARCH = x86-64
-else ifeq ($(NORMALIZED_ARCH),xtensa)
-CHICKEN_ARCH = xtensa
-else
-CHICKEN_ARCH = unused
-endif
-
+# If ARCH is not set, it attempts to autodiscover. But it is anyway not used.
 CHICKEN_MAKE_OPTS = \
-	ARCH="$(CHICKEN_ARCH)" \
+	ARCH=unused \
 	C_COMPILER="$(TARGET_CC)" \
 	CXX_COMPILER="$(TARGET_CXX)" \
 	PREFIX=/usr \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
