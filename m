Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7DCD66BBB
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 22:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FCB760659;
	Wed, 17 Dec 2025 22:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQLqI_J6YUJ9; Wed, 17 Dec 2025 22:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D6156068B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766010352;
	bh=V2XSWZvYLYZ6r6tlCCxrdnwMGFYX+ktjM5zWZOcCYIo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jLIy9XToBwmKIegTJNn3iuTNcA6zQnx85kWdZc7+ZVVJl2120/pBXCZML4/QO98Ag
	 DUyNZSyzyloMpuThi4ogozKr3cp+mTOM6/bgtKdCGWg85MVz9dQS0CLA6l32FZ4TzL
	 zH4mpkbthJjhb3ic2ZkFR8A2CwbIa6A8Wf6dfDqWixsKvPm1c3LogYGiH8kfd1kDlG
	 3OXAGuAN5iE8D8U17cIWZcoqmLTQ9ksc/ZS8pvG6mnAGQIid9HmLFxKSw+ZezxF/LX
	 ftGwWe8BE0RjnXuKSqVib57DKlZqyvzphUthZGApeviIGwov9p8SGV+QZViNoZ7h/3
	 Qo7sfAndoJ+Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D6156068B;
	Wed, 17 Dec 2025 22:25:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E78C035B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9C93403C8
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENvzgP_00Phr for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 22:25:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7FC7403A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7FC7403A7
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7FC7403A7
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:25:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 58C421A229B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:25:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2F0E56072F
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:25:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8C60C102F0AE0; Wed, 17 Dec 2025 23:25:46 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Dec 2025 23:25:37 +0100
Message-ID: <20251217222539.1989993-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217222539.1989993-1-thomas.petazzoni@bootlin.com>
References: <20251217222539.1989993-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766010346; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=f3LziC6rRTImURD3wlBumiODlCajLcIk5qtrhJyKCrU=;
 b=bZj7PB4EZCgVRoFs/zDh4alnfOsaEeW5YTVa2OQkF1PKJRUsDS7RlvLH1fBy8R6VAW0/Ge
 /Ga5KuFpUX1aPXMOg7sgKucjhXj/86Lbe7iNUNLl3+HcDnSAUmo0kJm7NXsjmDOXCiLLcT
 PuLi9HhpHNHsVLDPtHzDtfwRQ6DTIRZqc8tYQ1IbOB6PCQTfctUyBZPyFjCY1I9yHcVHVy
 rfViji8/pj5KoOTVLoGNHsi+KVrn3P/nCpjY+affbUT4SKOQ4BKSm9s+SKWwigAON4Mnn5
 xnqsoOmRLL3SF6nWqApQdkpFgZb6yAvfUmKhDie5B6+zXCXy/yicG6EgcMO8xg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=bZj7PB4E
Subject: [Buildroot] [PATCH 2/3] package/cppcms: fix build with recent
 versions of ICU
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

Since Buildroot commit dcee99507c6767230fd1faeeefe95f5662eb03a3 that
bumped package/icu to version 77-1, the build of cppcms with ICU
support enabled fails.

Indeed, ICU now requires C++17, and while cppcms.mk has some logic to
get C++ flags using icu-config, the -std=c++17 gets ultimately
overridden by the built-in -std=c++11 flag encoded in cppcms
CMakeLists.txt.

To fix this, we have submitted a patch upstream that ensures the
CMAKE_CXX_FLAGS passed on the command line take precedence over the
built-in flags defined in cppcms CMakeLists.txt.

Fixes:

  https://autobuild.buildroot.net/results/9c34a08ea02499b28093ad3fa184cee10b2883ac/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...llow-flags-passed-on-the-command-lin.patch | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 package/cppcms/0002-CMakeLists.txt-allow-flags-passed-on-the-command-lin.patch

diff --git a/package/cppcms/0002-CMakeLists.txt-allow-flags-passed-on-the-command-lin.patch b/package/cppcms/0002-CMakeLists.txt-allow-flags-passed-on-the-command-lin.patch
new file mode 100644
index 0000000000..a6b9526e88
--- /dev/null
+++ b/package/cppcms/0002-CMakeLists.txt-allow-flags-passed-on-the-command-lin.patch
@@ -0,0 +1,58 @@
+From 58faaa72919076e2c847b595a739469243ac9706 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 16 Dec 2025 16:02:41 +0100
+Subject: [PATCH] CMakeLists.txt: allow flags passed on the command line to win
+ over built-in flags
+
+CMakeLists.txt and booster/CMakeLists.txt define some flags in
+CXX_FLAGS, and then set CMAKE_CXX_FLAGS in a way that causes the flags
+in CXX_FLAGS to override the ones passed (for example on the command
+line through CMAKE_CXX_FLAGS). This prevents the user from overriding
+those compiler flags in CXX_FLAGS.
+
+A specific example is that CXX_FLAGS sets -std=c++11, but with recent
+version of ICU (such as >= 77-1), -std=c++11 is not enough, passing
+-std=c++17 is needed. Unfortunately, it cannot be passed through
+CMAKE_CXX_FLAGS due to the aforementioned problem.
+
+This commit allows to resolve this by ensuring that CMAKE_CXX_FLAGS
+and CMAKE_C_FLAGS win over CXX_FLAGS/C_FLAGS.
+
+Upstream: https://github.com/artyom-beilis/cppcms/pull/107
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ CMakeLists.txt         | 4 ++--
+ booster/CMakeLists.txt | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 826e87f..86693e2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -141,8 +141,8 @@ elseif(MSVC)
+ 	set(C_FLAGS "/W3")
+ endif()
+ 
+-set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CXX_FLAGS}")
+-set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${C_FLAGS}")
++set(CMAKE_CXX_FLAGS "${CXX_FLAGS} ${CMAKE_CXX_FLAGS}")
++set(CMAKE_C_FLAGS "${C_FLAGS} ${CMAKE_C_FLAGS} ")
+ 
+ #############################################################################
+ #
+diff --git a/booster/CMakeLists.txt b/booster/CMakeLists.txt
+index 8f63254..4638f76 100644
+--- a/booster/CMakeLists.txt
++++ b/booster/CMakeLists.txt
+@@ -223,7 +223,7 @@ if(NOT IS_WINDOWS)
+ 	endif()
+ endif()
+ 
+-set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CXX_FLAGS}")
++set(CMAKE_CXX_FLAGS "${CXX_FLAGS} ${CMAKE_CXX_FLAGS}")
+ 
+ #############################################################################
+ #
+-- 
+2.52.0
+
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
