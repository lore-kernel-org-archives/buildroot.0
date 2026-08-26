Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE48C5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 16:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6628B405CC;
	Wed, 26 Aug 2026 16:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0ret4TUn41M; Wed, 26 Aug 2026 16:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787762406;
	bh=nWmIS9alvuw1ZWQt5vkZKKBBU2ysBvi9g87LJKNgkKQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=WafEJgnmY+tJNFx6w2ZClKfS+rmTGiStoVmT5Fn024MxMKi6q0Hodg3th2uXGLf7r
	 VqIBXuVYZrJtsHV+0qqadgwfTBaoOZZNrUmk5XRZ6bA2HF77ssITKNWUiUR6BLyZF0
	 Gq2L2s4q9Q/+O2eG8cZYfrsikhoaC9mkh1asNObhYuS31FS/OQwZ+uLJK0fgrlVtZl
	 vLg9p8iAW1tG6Ylhigw2bBT8Vpjijd+DjxvLinOvG4Qysbh3Bdq4kG6yngYtchXhgB
	 25fbubNMzK0sZNrpacBz5y0rdz1TT0ZZf+r5yGdRmJVCRiqiZBXHs/Kfy+8O9fVum6
	 B0SHjI+5ONdTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DCF440564;
	Wed, 26 Aug 2026 16:40:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EDFB23874
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 16:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2BDE60758
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 16:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qPTKaY98bDlo for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 16:40:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8B5E6073D
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 16:40:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2CCD54E413C8
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 16:40:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EFFFD604EC
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 16:40:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2B60511C78186; 
 Wed, 26 Aug 2026 18:39:59 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Aug 2026 18:39:54 +0200
Message-ID: <20260826163955.37127-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/olsr: fix build with GCC >= 15
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit introduces a patch, submitted upstream, that fixes the
build of OLSR with GCC >= 15.

Fixes:

  https://autobuild.buildroot.net/results/650edf74dec513ad540f80f4d3ef8c8222dfd711/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...es.h-fix-boolean-type-check-with-C23.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/olsr/0007-src-olsr_types.h-fix-boolean-type-check-with-C23.patch

diff --git a/package/olsr/0007-src-olsr_types.h-fix-boolean-type-check-with-C23.patch b/package/olsr/0007-src-olsr_types.h-fix-boolean-type-check-with-C23.patch
new file mode 100644
index 0000000000..dbb167fe96
--- /dev/null
+++ b/package/olsr/0007-src-olsr_types.h-fix-boolean-type-check-with-C23.patch
@@ -0,0 +1,35 @@
+From 6d7aab6d01ffa68f79b0b238d812a074051d94c4 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Wed, 26 Aug 2026 00:00:00 +0000
+Subject: [PATCH] src/olsr_types.h: fix boolean type check with C23
+
+GCC 15 defaults to GNU C23. In C23, bool, true and false are keywords,
+and <stdbool.h> no longer defines __bool_true_false_are_defined. Therefore
+the existing preprocessor check incorrectly rejects a valid C23 environment.
+
+Keep the check for older C standards, where these identifiers must be
+provided as macros by <stdbool.h> or by the GNU C fallback.
+
+Upstream: https://github.com/OLSR/olsrd/pull/139
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/olsr_types.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/olsr_types.h b/src/olsr_types.h
+index 36d2b723..ce2a0559 100644
+--- a/src/olsr_types.h
++++ b/src/olsr_types.h
+@@ -82,7 +82,8 @@ typedef signed int int32_t;
+ 
+ /* add some safe-gaurds */
+ #ifndef _MSC_VER
+-#if !defined bool || !defined true || !defined false || !defined __bool_true_false_are_defined
++#if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 202311L) && \
++    (!defined bool || !defined true || !defined false || !defined __bool_true_false_are_defined)
+ #error You have no C99-like boolean types. Please extend src/olsr_type.h!
+ #endif /* !defined bool || !defined true || !defined false || !defined __bool_true_false_are_defined */
+ #endif /* _MSC_VER */
+-- 
+2.55.0
+
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
