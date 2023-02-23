Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EEAC6379F
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 16:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C01F76F96D;
	Thu, 23 Feb 2023 16:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C01F76F96D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnQKOt0OOoNo; Thu, 23 Feb 2023 16:28:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7B2961B27;
	Thu, 23 Feb 2023 16:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7B2961B27
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3101B1BF397
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 16:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B808404A6
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 16:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B808404A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id opD0YeGb6MuJ for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 16:28:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6EBE402B1
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6EBE402B1
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 16:28:53 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id p16so7189476wmq.5
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 08:28:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wzoJc6N8n+IYllBjH6EbINeULwjYZjJljaO15ru/Gus=;
 b=aDPaxxcxAqOTzUA5aUTBRJdhU8/t9wJp0XzizxA6NrKtHZBGgbBDpICXQhsgTMk2LE
 v0aXiYu4O6FuUDA5894LxbS4OAcK6E5rvrFoCv8WuR0cOesjazwpJfSn5L3vlvPB1z3V
 zni1QjtvK4UEKxqnC5vhQ4r0wfKIuik/JCbBnoBvZMlY9IOpUFyECVaD0isWMt/jjYVJ
 ZuF0BzXXfBr9TSZDu0uPvdVzTJL6YMiJFuHYScUcrpjvbIm6D+cyZtckbOKIiT0NUeyV
 si+C/srzr36mjQe2giGklGku7WzXrV1NC22u7bqIDab7pRl3NpmR23s3yHxBI1Mypp5+
 BQCw==
X-Gm-Message-State: AO0yUKXKKi3sgySGzCXrtE7Img8XLqeZpXURSYGYVby6N8c6uCoa6scr
 kU7XNcy/aDvWx5Ik9RYq9hYos6ZjyIg=
X-Google-Smtp-Source: AK7set/h7GGZsy+EG+FD2df9gVGgzdElfuMaFOSTgrwD7mbSP+K47y75kWWIpUwXiXl0Y8N13IElpA==
X-Received: by 2002:a05:600c:2ed3:b0:3df:7948:886b with SMTP id
 q19-20020a05600c2ed300b003df7948886bmr4043874wmn.31.1677169731488; 
 Thu, 23 Feb 2023 08:28:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ja13-20020a05600c556d00b003e4326a6d53sm13905372wmb.35.2023.02.23.08.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 08:28:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 17:28:47 +0100
Message-Id: <20230223162847.9247-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wzoJc6N8n+IYllBjH6EbINeULwjYZjJljaO15ru/Gus=;
 b=f5VvkOyKSmal5qgJdHWCQpKmDLK3yxfkACOXNfZab98eRZecXmzIG8Rk14wyDXbeWw
 VIiQxCfENrol9kDxJkfJ+oDwvJQBv60eCg5YdS3NtyXbluJV4P6Gx9Mx38/XRKHjgWcV
 DoRja9uq0rd7KMmEt6bypVtWP9pjhsAWQE9ftoUlkUPoiqabkd/ISbuz9sXA9NIv+gAg
 nqkko2o/yTD9wAXNubvAyunw24LlwCfDRSo2A2H/IlLh//vqjObDzeFp360uO3Rr8CBd
 BCLQ9Zi2bWCaYL4jcGa19YquDYYOrMseozE1gkJ2jTc1eFwhl1WMBHLk7PUmtQPs1Grh
 Zz5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=f5VvkOyK
Subject: [Buildroot] [PATCH v2,1/1] package/efivar: needs threads
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a thread dependency as Upstream quickly closed
https://github.com/rhboot/efivar/pull/238 to fix the following build
failure without threads raised since bump to version 38 in commit
f24029b561fbda0953c7dbd93d2485b03873996d and
https://github.com/rhboot/efivar/commit/cff88dd96b9d43e2c5875a24ba6180b196890ded:

thread-test.c:14:10: fatal error: pthread.h: No such file or directory
   14 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/f2da14f91dc602a32dd5b2b7bdf3d3aa43afa7f4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Add a thread dependency

 package/efibootmgr/Config.in | 5 +++--
 package/efivar/Config.in     | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
index 98ff71c996..5800e6c143 100644
--- a/package/efibootmgr/Config.in
+++ b/package/efibootmgr/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_EFIBOOTMGR
 	bool "efibootmgr"
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS # efivar
 	depends on !BR2_STATIC_LIBS # efivar
+	depends on BR2_TOOLCHAIN_HAS_THREADS # efivar
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # efivar
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # efivar
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
@@ -15,9 +16,9 @@ config BR2_PACKAGE_EFIBOOTMGR
 
 	  https://github.com/rhboot/efibootmgr
 
-comment "efibootmgr needs a toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
+comment "efibootmgr needs a toolchain w/ dynamic library, threads, headers >= 3.12, gcc >= 4.9"
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS || \
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
diff --git a/package/efivar/Config.in b/package/efivar/Config.in
index 74f2bb5abb..d4402dbcf7 100644
--- a/package/efivar/Config.in
+++ b/package/efivar/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_EFIVAR
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # linux/nvme.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# linux/nvme.h has been renamed to linux/nvme_ioctl.h since 4.4,
 	# and the efivar source handles that situation. However, some
 	# Sourcery CodeBench toolchains use 4.4 kernel headers but they
@@ -22,9 +23,9 @@ config BR2_PACKAGE_EFIVAR
 
 	  https://github.com/rhboot/efivar
 
-comment "efivar needs a toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
+comment "efivar needs a toolchain w/ dynamic library, threads, headers >= 3.12, gcc >= 4.9"
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS || \
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
