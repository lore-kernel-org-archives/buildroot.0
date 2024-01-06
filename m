Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67845C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 13:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4364420F4;
	Sat,  6 Jan 2024 13:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4364420F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D94DlXg3eds8; Sat,  6 Jan 2024 13:26:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40BB2420E7;
	Sat,  6 Jan 2024 13:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40BB2420E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02FD21BF322
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 13:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA93083D26
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 13:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA93083D26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HiHMl6KVqwFc for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 13:26:16 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D872583D0A
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 13:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D872583D0A
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40d2e56f3a6so2127885e9.1
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 05:26:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704547573; x=1705152373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4P08BceUpnWLplluDUDKP1TMD+riQ1SmFkFQZ1BnwUY=;
 b=Q4UyaoF53xOSqYxhrH4qzMocaGI8FOu4C/icO99M3Y8jFOkiN5L2lGqLbWpUt2YogC
 L8h+j1IwWFXrEet3SM4qAr5gzNva/HW2Q7wu8sgsKMdEUSJJYRaG2WM2lHUplnF3WTBj
 V4X12NVxAMus+hiYMW0D0XjWo5CO0slFy6VpAvAFs6kqUaE3cwKTgfTvqmhOyjP+mr1B
 2Md0JTWSZQGWukY+3iEZRTYOo/mgrVrKl+2gF0CnhnKhbmFtrNKco+ZbCWVqPjzaTud7
 B9lOqnFTk4ARBJcsVpokj85H9yQdEaqNJ1wgeZxGBpMF6Uo4HDxHzPoK2Lrphn3MBKID
 hqhQ==
X-Gm-Message-State: AOJu0Yy8MQGsRuuhqcI0fXygAMOWulTtmsPVGbJMrhAgc/1sxUnIlqKZ
 /9FN8tHsR4s2bjPFRuuBF4eyNjRLmbs=
X-Google-Smtp-Source: AGHT+IEt/mZAMXwEXxQbdgwTmuj2+cva2mZl9AAG7pvscgJYR7apIZx1vMAeZYR4oOXGLExIF9BXug==
X-Received: by 2002:a05:600c:5198:b0:40e:4016:d304 with SMTP id
 fa24-20020a05600c519800b0040e4016d304mr276790wmb.58.1704547572866; 
 Sat, 06 Jan 2024 05:26:12 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 iv14-20020a05600c548e00b0040e3733a32bsm4681538wmb.41.2024.01.06.05.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 05:26:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 14:26:08 +0100
Message-ID: <20240106132608.1264366-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704547573; x=1705152373; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4P08BceUpnWLplluDUDKP1TMD+riQ1SmFkFQZ1BnwUY=;
 b=AU0paQB7gZe9I5sRNJaF+92vlyxG3U0U9kDkWypOgB35VHhDL/qSzoB0MCqWviSmzH
 ROvo+QEv9qD4yIXuu504JIU2U/Ui5Xez/8LoGkd/REl2Id4R1icRpqmDHogL3sghukrO
 4KO+PC3Ot9/oP06Mj1fBSHq9ub1qNhmN9d0BKqqW3YW2v3Nyrtg0pbmSlwTGRmxpvblL
 v+2I/D7uuO4BY9i/7bX948mT1gCNdBoqxFzR7AWaHcf7lNfPfvJ0HJ45ftd9IPtSvUz9
 SkO9/5gC/5ja/lW5IuK+4LaADdbZESEXoVudRXV3jiiMb+NyR/djbLZtR4j7zAT9IltZ
 acOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AU0paQB7
Subject: [Buildroot] [PATCH 1/1] package/botan: disable neon with arm soft
 float
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

Disable neon with soft float to fix the following build failure raised
at least since version 2.19.1:

In file included from build/include/botan/internal/simd_32.h:27,
                 from src/lib/block/aes/aes_vperm/aes_vperm.cpp:15:
/home/thomas/autobuild/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/10.4.0/include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   31 | #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/6b311e97484db2b0f8adbda140320d696713b1e0
 - http://autobuild.buildroot.org/results/c309940ea6db0845d8221fb51611d0254222c644

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/botan/botan.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 74cf6175dd..9e92b38b6d 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -90,6 +90,10 @@ ifeq ($(BR2_ARM_CPU_HAS_NEON),)
 BOTAN_CONF_OPTS += --disable-neon
 endif
 
+ifeq ($(BR2_SOFT_FLOAT),y)
+BOTAN_CONF_OPTS += --disable-neon
+endif
+
 define BOTAN_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) ./configure.py $(BOTAN_CONF_OPTS))
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
