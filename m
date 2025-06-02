Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7714FC5B555
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 17:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 285CC81AC4;
	Mon,  2 Jun 2025 17:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VrhxWNXWrrS; Mon,  2 Jun 2025 17:29:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C5FE81BF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C5FE81BF4;
	Mon,  2 Jun 2025 17:29:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA8E415F
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 17:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C109081AC4
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 17:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsx_dA-nMhAY for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 17:29:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 27681819D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27681819D2
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27681819D2
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 17:29:15 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a3771c0f8cso2864277f8f.3
 for <buildroot@buildroot.org>; Mon, 02 Jun 2025 10:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748885353; x=1749490153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tn9OopSHguCMaav/o1CMY0dkMnpUd8u9qgHwBt+59OY=;
 b=oqR4Ou3bJGsN+Akl5ldtTvOrle/c4wdr2Bfg8RGc4rHHe15BXQ4GpnmRFJ0qgrdC4Y
 gx+M99sv7qftQyiUKkXhW46LKz3i0TKCow7VA+pjQjdO5Ojju07sV0KoMz/YE7V8v5x+
 k2xhBoSGG2/1fVFVI8IeS1j9Htnnd9JyYuNxMvxgZPNfKXbn5ksheNxvHqddoeSe5iR+
 8F2Z8ausuSS/tY3lCDM4nK8uPbORk/ZzBwbC3Hpf4L9C/AOMTVPTCHOfRJ65uimmzyvf
 t2Npn3q7WgWQVj0Xt50mLZ5gqk8kD9Wk5/2kQ4PvJ91z0EybiMVg+dkW5ccvEpfms/xk
 flSQ==
X-Gm-Message-State: AOJu0YxAELm8ySN+rxSQyXsgCVW5VZfbad3G6CLvchsSFsh82azP+MGi
 ztQm8duZknFcY/r2LJQ19/OBFfA7Y8AOPcNxW849EXlk+kf6Hdeqg/GDfXk7Bg==
X-Gm-Gg: ASbGncsfaBlExl4+1icLEEbWZjM5h4nduPIuSnzBrSAg9pUav6kuIy0UhY/v75sMUfl
 9QLMfjx24K+mHbFUaGKJcV3/T4LfQc/SH4teP8S1Kcoqey69QJGpOupb2HQ26oYDJkVNEn7/FAN
 MvgxJeMA+tE3n9j6fsjDVIDxRKqKERlYQwlDyTBvW5hBRZOftmdpu4DrkuyqO7v7B4VEFWtiHO5
 UzpJZC9cSSC3iuyjH3+rX56a4HPy1esHn+HK5DM6od6nDEtWjq+IPcjuDKzvf7ymfgF8h+eB6Bg
 nI5Qe+xm453XLJ5umPH1efkFGMhuGtVJ0UH0Dj9xaYooU+cNo5TJqHDX0GrcYVJ8uw==
X-Google-Smtp-Source: AGHT+IFtXgeOvntMYGdyt2iRr54TLf+/1BVcAXFnxDvosDa2spK9303hCf21iduV2JymoWt7RtSf9A==
X-Received: by 2002:a05:6000:1a8a:b0:3a4:eac6:e320 with SMTP id
 ffacd0b85a97d-3a4f89a5ab7mr10591744f8f.3.1748885352794; 
 Mon, 02 Jun 2025 10:29:12 -0700 (PDT)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe740bbsm15635915f8f.54.2025.06.02.10.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 10:29:12 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Mon,  2 Jun 2025 19:29:07 +0200
Message-ID: <20250602172908.515944-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748885353; x=1749490153; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tn9OopSHguCMaav/o1CMY0dkMnpUd8u9qgHwBt+59OY=;
 b=dSQSm1FqRn2MyndmQaM7ROeehgOtsmBoOYY/K+w+aF2LMOYsyx3SRN/PyjdThwuXA0
 nGXFGkYVaa+Wzg92EaNiZilNfyMsyaOmVrGBq0QD8glg88f8Jit6J9qaA+3Jz3QkR0Ju
 ojRRXRtj6HUXbvtTxYhg5DI+gi2sHy7+QEHkl4oafQ0xRQhkV4wn9ukBzV9aX2Fza1T5
 FAKTOOKTVT6xxq9SFtAZF7sT+A3N7/11lIsFKK6w7KHE3LP+5myStrRXaVKQWBsdAlaF
 EcbkhJ+MCpUBixbrAPXyoWECG0EKpcJARUOiVxmtXtxjKyxejAiP1tTOI4/u/tQc31Bp
 7b1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dSQSm1Fq
Subject: [Buildroot] [PATCH 1/2] package/ltp-testsuite: keep
 rt_tgsigqueueinfo01.c for musl
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

rt_tgsigqueueinfo01.c compilation has been fixed in 20250130, don't
needed to be removed any more.

Fixes: 2bbcda7c0e ("package/ltp-testsuite: bump version to 20250130")
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index f6098037c0..f5d577e444 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -77,7 +77,6 @@ LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_$(BR2_TOOLCHAIN_USES_UCLIBC) += \
 
 LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_$(BR2_TOOLCHAIN_USES_MUSL) += \
 	testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
-	testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
 	testcases/kernel/syscalls/timer_create/timer_create01.c \
 	testcases/kernel/syscalls/timer_create/timer_create03.c
 
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
