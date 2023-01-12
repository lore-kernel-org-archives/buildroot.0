Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513EFC61DB3
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 07:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6D2B4026A;
	Thu, 12 Jan 2023 07:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6D2B4026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3APH9yK3C7p7; Thu, 12 Jan 2023 07:56:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 990F44056E;
	Thu, 12 Jan 2023 07:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 990F44056E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C7A11BF396
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 07:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76F7E415EC
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 07:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76F7E415EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RiMcYXes0f_j for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 07:56:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FBC1415D9
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FBC1415D9
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 07:56:00 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id x10so22804568edd.10
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 23:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=awWXZtfcdVuJG4w/rIEs8BzGDo/iBZcxzc8wxpR0YAQ=;
 b=iPpcydUi79br5pxvZabIwNDwOplRs66pGDVIlaNBPYxHu3RIf1ChHEe/o5/UAgmRx4
 cRL9MW+3THmnuBm2L2JvcYF119QctIlzyXXnub/Z9jYJUzHMq82BTLGqmENvexshLk+m
 GK8h3f9JCa1WlDo3/Bs9J38jDHTIWatJJpORVw7zvnsFcuEkl2jS3u61gSBAS9EOPwlG
 a+Th1n0+TVY0gYE7q+IMyXgEfL4M/YkPImW3Pzf6AY/ZHb6k5aoPqKk04n1UISk3GMRf
 Vkkd1ZTzZLWrnF/xk0wTmncXB6I2vIfGTO8Fv3O/K2iXtn1BdO25L4lxrx69QO0z357r
 fkGQ==
X-Gm-Message-State: AFqh2krY3N/X6JFAEL2DLljXL0qp+4JLJ+jhd8mUwOdCQaxPkNPOHV8T
 JMfEX9OFeD2F8qu65kQSOIjnDw+pUy8=
X-Google-Smtp-Source: AMrXdXsslBI/wviExc1JoSdc9OhPCH0qsAkI5ASzQJonYyXKhbMbzurmhii8f4c+qIjRygbmblUxtw==
X-Received: by 2002:aa7:d914:0:b0:49b:6449:1d4c with SMTP id
 a20-20020aa7d914000000b0049b64491d4cmr762429edr.23.1673510158086; 
 Wed, 11 Jan 2023 23:55:58 -0800 (PST)
Received: from localhost.. (ip4d16145b.dynamic.kabel-deutschland.de.
 [77.22.20.91]) by smtp.gmail.com with ESMTPSA id
 x22-20020aa7dad6000000b0048789661fa2sm6793714eds.66.2023.01.11.23.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 23:55:57 -0800 (PST)
From: Joseph Burt <caseorum@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 07:55:08 +0000
Message-Id: <20230112075509.2200-1-caseorum@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=awWXZtfcdVuJG4w/rIEs8BzGDo/iBZcxzc8wxpR0YAQ=;
 b=mRy+QVoFYXR83zi65FvQC5xg1GiQwZeoMHtsQR9Sa9ZVtEJG72uE5inuR636qkxcAH
 AC48BwkcjqSUwozME9JdT2d9lmaALHkjuXXoqh/LcmEdR/jOtyDqQNWfuUmFY6au3uyF
 cUVhhrFwyvnM9VK3/Fa0PcF/nMIV8PO5+lYC+HDGlHpJ09qRoqIlrEYpmrzQh4b0NcG1
 +3dj4IL2URQjpEzDwk/EBoydMVlpAA1Oj1FqoM862Rme+xi967pjIKvnR8XT4ytSAuP7
 2RYwlALUPTvnYNaTYXbczyHjg2NzO1yIlnE0TMPUIqkpAJ5SgwNl71pwbScYX41shl3N
 IM9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mRy+QVoF
Subject: [Buildroot] [PATCH 1/1] package/qemu: reenable Qemu user-land
 emulation for musl toolchains
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Compatible "struct sigevent" added upstream in musl 1.2.2 [1].

[1] https://git.musl-libc.org/cgit/musl/commit/?id=7c71792e87691451f2a6b76348e83ad1889f1dcb

Signed-off-by: Joseph Burt <caseorum@gmail.com>
---
 package/qemu/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 154b98a541..d818bebb34 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -102,16 +102,11 @@ comment "systems emulation needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_QEMU_LINUX_USER
 	bool "Enable Linux user-land emulation"
-	# Incompatible "struct sigevent" definition on musl
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  Say 'y' to build Linux user-land emulators.
 
 # Note: bsd-user can not be build on Linux
 
-comment "Linux user-land emulation needs a glibc or uClibc toolchain"
-	depends on BR2_TOOLCHAIN_USES_MUSL
-
 config BR2_PACKAGE_QEMU_CHOOSE_TARGETS
 	bool "Select individual emulator targets"
 	depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
