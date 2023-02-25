Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF185C6FA8E
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 17:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 536934189D;
	Sat, 25 Feb 2023 17:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 536934189D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ksx1bPCYYBa; Sat, 25 Feb 2023 17:02:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17779418A3;
	Sat, 25 Feb 2023 17:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17779418A3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4AE041BF3A4
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 17:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31B7160E13
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 17:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31B7160E13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZURNQbvopLhU for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 17:02:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B16DE60B04
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B16DE60B04
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 17:02:37 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id l1so2178501wry.10
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:02:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TEVNFhmzoUT/tgHhwJcgknhjD1fknk2nz7KFOY8tsc4=;
 b=BXqC2KNFI4DzMRlOLD568okNRuhmu2jwa+5y+mkidPu00XIMXwKOfCdtxAraUKNJn8
 ghHKqcwxuBC7nSDRMCS3NjzU9Cqjx/qb4WujiZIVBHVr6fD8oLXBfuIhdGUmpwgS2GVL
 B7sE28Nu3nZKr8fLmxKA7OM7aewscgAcbv5h36KUZC2N23Qo9iGGr6Mw4vPXiYVdG5YN
 brepzAA816cZS9NpNy+CtVMEFLVlRatfD2KdmQfSvo+xV/CZqWyoCFW7NljvnGxukSdf
 Abfwe/wv/XSb8BLbeR7UTQ7cMAhu/JXvvUVM35Bkd0x00LJXYZPXTlpmP64IuNEbSHjF
 PH6A==
X-Gm-Message-State: AO0yUKWV0c0MOdnHxGGBJ+/jhgRM+4ZEF4XytYz59qmTSvOLZ3eQiQqP
 emL+Q/E9cyjUCQ2iip6gzHmY0BNuEi4=
X-Google-Smtp-Source: AK7set9Vm5voHF2JRPJaQ89XQCuOp/UWOXBAHqoUh0LYxsJu+clwbtVgZc1r948i1eS6EMDQ/OTuow==
X-Received: by 2002:a05:6000:1049:b0:2c7:6bb:fb7a with SMTP id
 c9-20020a056000104900b002c706bbfb7amr13093009wrx.54.1677344554801; 
 Sat, 25 Feb 2023 09:02:34 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k24-20020a05600c0b5800b003e00c453447sm6542662wmr.48.2023.02.25.09.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 09:02:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 18:02:29 +0100
Message-Id: <20230225170229.358936-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TEVNFhmzoUT/tgHhwJcgknhjD1fknk2nz7KFOY8tsc4=;
 b=WwlS8SZDtUyR+E3geqqxC3uyl1NoMMxmkf13aOWFFoCVZ/Yavb6NoLYe/T8SH/1EPm
 ABnNRaojKD2u6imu0iJsoUZa/UsLtIHh+wV9wAomrmhQN9MB+/c9J9I6harNoQ3CtdyM
 mFs9HN1tLZO2JIH0hH5ex3jIN9sYVYw8U+hQ2NqYlMlHrSyEM/iuJgWsksIvJSF2RBCr
 otLiKSrRK6cy+Fr0+Tngwq+Otb2HcqkeLzy0evA6QsytGvBQVOL/g/XlyUjc0UpHfNwy
 goCFnTkc8JNH2f7VwQQ5Fwbhx/uJsrTBoiU6HcxqqrUMOhe3rSfOie5i9aBsmUDxeYHf
 dHbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WwlS8SZD
Subject: [Buildroot] [PATCH 1/1] linux: fix CIP RT kernel on microblaze
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

Fix the following build failure with CIP RT kernel on microblaze raised
since bump to version 5.10.83-cip1-rt1 in commit
b5778d7b76c098010a4abc339938f2694e8cf57f and
https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/commit/?id=32ac92b5a39e2ef91308929bf5ed0804094b4183:

arch/microblaze/mm/init.c:71:2: error: #endif without #if
   71 | #endif /* CONFIG_HIGHMEM */
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/27291870cf7539d26e45c45f34322d24a6dbca33

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-arch-microblaze-mm-init.c-fix-build.patch | 37 +++++++++++++++++++
 linux/linux.mk                                |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 linux/cip-rt/0001-arch-microblaze-mm-init.c-fix-build.patch

diff --git a/linux/cip-rt/0001-arch-microblaze-mm-init.c-fix-build.patch b/linux/cip-rt/0001-arch-microblaze-mm-init.c-fix-build.patch
new file mode 100644
index 0000000000..4760d9e4fb
--- /dev/null
+++ b/linux/cip-rt/0001-arch-microblaze-mm-init.c-fix-build.patch
@@ -0,0 +1,37 @@
+From 1fc03e1fdc8bb606d1c95e9fa557a9e5f6df17ec Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 25 Feb 2023 17:26:56 +0100
+Subject: [PATCH] arch/microblaze/mm/init.c: fix build
+
+Fix the following build failure on microblaze raised since
+https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/commit/arch/microblaze/mm/init.c?h=v5.10.168-cip27-rt11&id=32ac92b5a39e2ef91308929bf5ed0804094b4183:
+
+arch/microblaze/mm/init.c:71:2: error: #endif without #if
+   71 | #endif /* CONFIG_HIGHMEM */
+      |  ^~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/27291870cf7539d26e45c45f34322d24a6dbca33
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to
+Sebastian Andrzej Siewior <bigeasy@linutronix.de>]
+---
+ arch/microblaze/mm/init.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
+index 1f4b5b34e600..a444778e59de 100644
+--- a/arch/microblaze/mm/init.c
++++ b/arch/microblaze/mm/init.c
+@@ -49,6 +49,7 @@ unsigned long lowmem_size;
+ EXPORT_SYMBOL(min_low_pfn);
+ EXPORT_SYMBOL(max_low_pfn);
+ 
++#ifdef CONFIG_HIGHMEM
+ static void __init highmem_init(void)
+ {
+ 	pr_debug("%x\n", (u32)PKMAP_BASE);
+-- 
+2.39.1
+
diff --git a/linux/linux.mk b/linux/linux.mk
index 7645b5f507..f3fdc40328 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -33,6 +33,7 @@ LINUX_SITE_METHOD = svn
 else ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION)$(BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION),y)
 LINUX_SOURCE = linux-cip-$(LINUX_VERSION).tar.gz
 LINUX_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/snapshot
+LINUX_PATCHES += linux/cip-rt/0001-arch-microblaze-mm-init.c-fix-build.patch
 else ifneq ($(findstring -rc,$(LINUX_VERSION)),)
 # Since 4.12-rc1, -rc kernels are generated from cgit. This also works for
 # older -rc kernels.
@@ -50,7 +51,7 @@ ifeq ($(BR2_LINUX_KERNEL)$(BR2_LINUX_KERNEL_LATEST_VERSION),y)
 BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
 endif
 
-LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
+LINUX_PATCHES += $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
 # We have no way to know the hashes for user-supplied patches.
 BR_NO_CHECK_HASH_FOR += $(notdir $(LINUX_PATCHES))
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
