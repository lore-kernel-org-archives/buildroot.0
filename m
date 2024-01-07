Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39114C47077
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 13:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C70C28140F;
	Sun,  7 Jan 2024 13:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C70C28140F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mymDYlwUfCWe; Sun,  7 Jan 2024 13:23:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CBDE813DB;
	Sun,  7 Jan 2024 13:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CBDE813DB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F2F871BF831
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 13:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBD5680E9B
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 13:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBD5680E9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qgu8put--Z2R for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 13:23:52 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC17280E89
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 13:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC17280E89
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e461c1f5cso2628105e9.3
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 05:23:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704633829; x=1705238629;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vkal+OJHSNljB76tJRDxLzZCRY/i2+ea1rXMhd9qZIk=;
 b=Mw/yeeQ2kNRvxCxOB6vwrjNVcq7eEIaxMOosm/+vKAbUvzgXon8M9PO0hKUTEVraRq
 CI2hvyHl9cCQlD2GqTeN+wrV1AINzUh5M4YgNwz1fChsIk+QX2ORW7aHG/yO8yeZrERL
 YEmOLJRIlIZ1BYYbsyoMiHI0tgp+M81Y8UfOdUbEjKqpITZeZZGffraqkV9NLpKtMTAn
 2YHgOUrfl2de70ICgvmaIw/sKze8GSe0LHRmkUW79o+DFM43hV2q35pXegvEBvRmjNZ3
 Z36w+mp8aFVn/VwGql07s2P5vhmnzuJqdq4JpJThwYOw4EM8vaZVxQnmV+TbeZNvAYcD
 AA8Q==
X-Gm-Message-State: AOJu0Yw/8229HMChahUnHXJU0BQSreSSFnUU1UmaObe0A3wM+8pg1RJj
 uOzP1MIM78U1PMQrC+dBlhvu7u3BLD4=
X-Google-Smtp-Source: AGHT+IE+XTPiATrDY6adKeE7AsprmnqjTwJbWaT0iDDQ9mVAL+0NhOsiaUAs5eucI9/NFPSYiWI5xQ==
X-Received: by 2002:a05:600c:ad6:b0:40d:c2b1:5e21 with SMTP id
 c22-20020a05600c0ad600b0040dc2b15e21mr795650wmr.224.1704633828634; 
 Sun, 07 Jan 2024 05:23:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o36-20020a05600c512400b0040c6d559490sm7693806wms.3.2024.01.07.05.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 05:23:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 14:23:45 +0100
Message-ID: <20240107132346.3161192-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704633829; x=1705238629; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vkal+OJHSNljB76tJRDxLzZCRY/i2+ea1rXMhd9qZIk=;
 b=nWNT5/m+DkrP7IozR4UxH9z3fr00Y1xHYfljoPy6hw/QKdFubVboir7HSjb8GL1E5R
 MTYulQ7zvF0+T0hCjZadQGOMcWDz+VaJP++GM/UUnK44qzPB+yT/wAA6WcMnQAiBnP6U
 n12hRxxnPISnmbAJlFMpTK8nudejl0g6hNjctgxZUC4LyZFLY7cccwFRcjvZeXyrb6a4
 m7R4C7n3flgBC8In6FI6sBW5iaIsn/AuAKBtR4oIoZDlk2jHmzn433X5MoBWUfNTuhHo
 7sWCqTQn4HH1ggqREvumEZrFkCaxOHCETFyHS00adHW2UK2P6DaMx3YRYrofpQSCXFDK
 zKdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nWNT5/m+
Subject: [Buildroot] [PATCH 1/1] package/liquid-dsp: fix build without neon
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without neon raised since bump to
version 1.4.0 in commit 2f7f8f381394207bfb029ec395f5ced5695a0a2e and
https://github.com/jgaeddert/liquid-dsp/commit/c821187dd9af2758c8e3c82e95eaf041b8ac81a0:

/home/peko/autobuild/instance-0/output-1/host/bin/arm-none-linux-gnueabi-gcc -std=gnu11 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0 -D_FORTIFY_SOURCE=2  -ffast-math -mcpu=cortex-a7 -mfloat-abi=hard -mfpu=neon-vfpv4  -Wall -fPIC -Wno-deprecated -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I. -Iinclude  -c -o src/audio/src/cvsd.o src/audio/src/cvsd.c
In file included from /home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/features.h:388:0,
                 from /home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/stdlib.h:24,
                 from src/libliquid.c:25:
/home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/gnu/stubs.h:10:29: fatal error: gnu/stubs-hard.h: No such file or directory
 # include <gnu/stubs-hard.h>
                             ^

Fixes:
 - http://autobuild.buildroot.org/results/36b3c2220c462e7a20262fd1b9064d9aeb6c9ec4
 - http://autobuild.buildroot.org/results/881826b4b6c141e59a0da2d7d1ad55d3709fdb95

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liquid-dsp/liquid-dsp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index e9788eb144..a96d4cab79 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -40,6 +40,10 @@ ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
 LIQUID_DSP_CONF_OPTS += --enable-simdoverride
 endif
 
+ifeq ($(BR2_arm):$(BR2_ARM_FPU_NEON),y:)
+LIQUID_DSP_CONF_OPTS += --enable-simdoverride
+endif
+
 LIQUID_DSP_CONF_OPTS += \
 	CFLAGS="$(LIQUID_DSP_CFLAGS)" \
 	LDFLAGS="$(LIQUID_DSP_LDFLAGS)"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
