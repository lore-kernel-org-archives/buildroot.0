Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC9AC47DDF
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 17:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8075F60DF9;
	Fri, 26 Jan 2024 17:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8075F60DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XZ0g4GcgL6cn; Fri, 26 Jan 2024 17:32:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFFB060E4A;
	Fri, 26 Jan 2024 17:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFFB060E4A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B9A81BF38C
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 17:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3130342107
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 17:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3130342107
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s2ND0OIm3NsY for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 17:32:21 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF5FB410EA
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 17:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF5FB410EA
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40eb033c192so4164135e9.0
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 09:32:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706290338; x=1706895138;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h/bcQUXiop6+JfJEd5DVsmc9JZBio7brkWtIt3okrFI=;
 b=N5a5/TIG8+1PGF9jR9523nQCnmLnEaTAv3s8gyF/OcERFFGZQxw2Lu6Q2aaH485Oms
 8FRro9/kdbJkdxtz66G3eCoqOhTc0Ej/nGlHIPxeTuR4f5pM8/3Ung7pH6qICPaNhOxL
 wkAqAXiZ/1cQ3QR8RSzxZIywBFqVwCytUQ1mbbgZteuWHRpJcaPu8BE69FpvG2xi7Foh
 TGCsVcoxDyICVDySSOLlxNJQiL+jbVjicsw+8nWA6XfNV+wpGkAPccqlZPv4yenliGhO
 zsH/VXPXbqx3m3skWImuvktERlF2FPh3vVZOmdCPvI7BsV2XSOs1N/Bb/HR+PPD1zD/h
 e2vQ==
X-Gm-Message-State: AOJu0YyXxi3NgvRG/UbwIuTjI1PHapzSE9t7DZ1d6psyXSu2hu8MVxbU
 kBKC9oR9JqJY+WlU+P+lVKhAQxvDXJB9qCWKhf7+erXFUFaY/vihwdvN2zhIw64=
X-Google-Smtp-Source: AGHT+IHAtAn2QfSMKkIf9OC2/iscajy0hCsudQSAcuTw/enQ4x282fBxiOnDrKyKJWMZwSfrHC+LVA==
X-Received: by 2002:a05:600c:11cf:b0:40e:ccfb:1c82 with SMTP id
 b15-20020a05600c11cf00b0040eccfb1c82mr116895wmi.48.1706290338008; 
 Fri, 26 Jan 2024 09:32:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l1-20020a05600c4f0100b0040e549c77a1sm6460332wmq.32.2024.01.26.09.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 09:32:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 18:32:15 +0100
Message-ID: <20240126173215.1630553-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706290338; x=1706895138; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h/bcQUXiop6+JfJEd5DVsmc9JZBio7brkWtIt3okrFI=;
 b=dLdHcBm1PFXfl0/Lm1D3fbJiT0hrh3Wxj1jFsBGgCLvg7xXS7Lem9dNIk8gYYNxBpy
 k3ljipUUMVfYhXhikkelC3sPDwInHMb7wE9bulJjvToo1mP5eluFENmrzdYzlpANKuwS
 SAvcIwfW2Pl/vQuu8FDH4KeMd+sp0lubic9VxPTPd+XMHIxkP1PEhkV/uwzmRkJyrvsk
 PY73FWXVJOUD7wWLHqs26MGx9R4wDWnBz7wWQbxCiMvFRkPgFAmzwj/GCDfHWzLo3uvj
 XvGOs+R1dx8O7Zj0wMog6/MK6uMOGOmG/j7kw8zaZW7SSQWhTl1ivZDg3aT9nWyLmTys
 H3CQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dLdHcBm1
Subject: [Buildroot] [PATCH 1/1] package/faad2: force arm mode instead of
 Thumb mode
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure in Thumb mode:

/tmp/ccfzn6FH.s:36: Error: selected processor does not support `smull r2,r3,r1,r0' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/838808b4751244ee01cde6b8261212b49e511a32

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/faad2/faad2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index 686e5045c0..0e66ebc8e1 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -12,4 +12,11 @@ FAAD2_CPE_ID_VENDOR = audiocoding
 FAAD2_CPE_ID_PRODUCT = freeware_advanced_audio_decoder_2
 FAAD2_INSTALL_STAGING = YES
 
+# faad2 has some assembly function that are not present in thumb1 mode:
+# Error: selected processor does not support `smull r2,r3,r1,r0' in Thumb mode
+# so, we desactivate thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+FAAD2_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
