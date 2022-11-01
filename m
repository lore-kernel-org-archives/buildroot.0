Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4774C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 10:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47758408C5;
	Tue,  1 Nov 2022 10:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47758408C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LqtkyRQ8NgzF; Tue,  1 Nov 2022 10:00:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EC9E4049A;
	Tue,  1 Nov 2022 10:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EC9E4049A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABC401BF873
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 10:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 942D08124C
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 10:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 942D08124C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DJNVhXRJej3E for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 10:00:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B717F81270
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B717F81270
 for <buildroot@busybox.net>; Tue,  1 Nov 2022 10:00:06 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso1827147wme.5
 for <buildroot@busybox.net>; Tue, 01 Nov 2022 03:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MSR4P4hpxPs/xFZhdyc30iCA0X91DqyVGPBxzMWFJo4=;
 b=PheuF/tYDKnSo+XKLIIbLRwYMpcp6oePy/xAlBqeyz93Bu5gCqJQ3mkJ+PRc1qtci4
 Xbs1Wte3tMdPGQ3FC89hnWMDQ1z4k/TJ4qshED8Uv+yFchEMZKoH3K4s/zYj7JBA9t6l
 1fVxl0hsLt+t7i6PO81U8oTu+3LTDGzVwIy8wNs7kNMccuxm5ABffg+AurZBMQ38jxE/
 0jbSrzNr6Q26+iZLEv2Ss0MyFrG/OKu8IrYkhrEhXuCXGZSqCnVruDClYzEEGbZmo9jW
 ezq99XTk6XevRorRCfb1NZ/ssivydYd4svcfgAKfu+EDugzn8jL3TcW3oFEoF0QqHtUP
 N5yQ==
X-Gm-Message-State: ACrzQf2UagEDb2+gn60lJRG4pbGZAMYEVEbDdMtx1qj1MsjsXpYtU7ct
 aoFuvo6NiVrGTnvdXC/JUTDpYAzrtW4=
X-Google-Smtp-Source: AMsMyM4+N6vakVrzZKM/KvmBBilsNXrHauVQS68RyyJFjKV2/xQjsh22ctXJ+80TLPH/MWTKitx2mQ==
X-Received: by 2002:a05:600c:654f:b0:3c3:b5b7:43a9 with SMTP id
 dn15-20020a05600c654f00b003c3b5b743a9mr21710462wmb.201.1667296804500; 
 Tue, 01 Nov 2022 03:00:04 -0700 (PDT)
Received: from pc-140.home ([2a01:cb15:8043:4b00:ed03:af64:3498:bc20])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a05600c19c600b003c6f8d30e40sm10481952wmq.31.2022.11.01.03.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 03:00:04 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Tue,  1 Nov 2022 10:59:54 +0100
Message-Id: <20221101095954.10345-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MSR4P4hpxPs/xFZhdyc30iCA0X91DqyVGPBxzMWFJo4=;
 b=q1q8RW4Dc/DwhGmzvZb6vgI1qiM5yTI44E350GYt+ZegC6tCqmqdP486z+UhpHiGLN
 SakPygC4RnM+GPRNGg5AzDavO83vApEwhKQ4CuFDSoQE78eL/mApCdczuo3/wyTr4csg
 D3yWGdexUV+KduUMhCrXpZAv25+fUB9GwsIxK+rdVeraPdy/s27ntZ6ZtcW6LWnScsxh
 /8Tgpa4+u5lbfeg2hf99hBuu2KVt27hu80u1r0NmQ1oRTVK/vnDrC+UilUc97DMQ+aS+
 gbWFJmE54F2dT0rR0mhmFgCNbSFYwwJ2O0Vx7vqQOAEAdOFRGfPPpZXNE+F+Q3po2foP
 zXyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=q1q8RW4D
Subject: [Buildroot] [PATCH 1/1] package/libxcrypt: bump to version 4.4.29
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/libxcrypt/libxcrypt.hash | 2 +-
 package/libxcrypt/libxcrypt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index bdda6b47c0..e125072705 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  db7e37901969cb1d1e8020cb73a991ef81e48e31ea5b76a101862c806426b457  libxcrypt-4.4.28.tar.gz
+sha256  efb4e225c4e37658444ecdb4825883b70b744541b73022d91c4d12e0dd8e39a0  libxcrypt-4.4.29.tar.gz
 sha256  f9b48b0bc67a92b752780710aa774cf08b62ec2ebaa3f4aebd00069fba6effd2  LICENSING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index f7a0fd4308..18ea6e3c17 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCRYPT_VERSION = 4.4.28
+LIBXCRYPT_VERSION = 4.4.29
 LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
 LIBXCRYPT_LICENSE = LGPL-2.1+
 LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
