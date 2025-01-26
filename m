Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D068C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 11:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E837D81AAB;
	Sun, 26 Jan 2025 11:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0OpW2N8HgQY; Sun, 26 Jan 2025 11:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 241CE81CA7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 241CE81CA7;
	Sun, 26 Jan 2025 11:31:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62DAB941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42F3F81CA7
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6vi5i0OMFhv for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 11:31:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25CCD81AAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25CCD81AAB
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25CCD81AAB
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:31:50 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-305d840926fso29340641fa.2
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 03:31:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737891108; x=1738495908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cstWbne+Xmvnoh2jgd9/zY8v3nl9bSXSCBnG+OKPqz8=;
 b=ZLSS2rEo4C70APueDBAyHDIEsZJn+w/JnXBmq01SM5PXe9u9elx3EGlP86zIZ8luK0
 e7GTtER9T9toxtjI53x1QcGjkC+q5yFd8F0lIJxYgeGh43E75nK3L9IjP/YKptG8UoPv
 FpWkgZZzDU+LKdNLqRBBCIfO83dTtspd3Sz5T2paSArILHqnGJxxyf2rnF83tYEajCNw
 KcJmdahZXrtD+bgk8kA7pZqSXMsP97rMDdhz00IdqLt1Hhgt7ebtfcPsGJhaXY4GuBiC
 B2EJQkJkOksfBos5ewHhZ2rlcwVdbO773Mp6ShhTuQGghF9r+HZ9YUDi4WkGUxih6fLJ
 gOmw==
X-Gm-Message-State: AOJu0YyinDbw+IYoAB8+tmCRo2A+3J/qik0UrL2cP/0F1qAmEvK6NMTk
 VvekS/uJHeJPTeSqWWy1X+ty7Fr5FIRaauIljuBQiefI1ZLD11ywtZjGn6cu
X-Gm-Gg: ASbGnctkncD2VdBgdFVQF9GguNJHy2f4w+t7xq23DegdRIq+DL+wgXegXD2CGpwdtoL
 PjCudTRvReQnwuNLaEKgNZczpFOiua/p+zRpDWEeVYRLfF30cgXeFa+CFbLkwTrpxUSzskMt13W
 2qb3Gfj1BXM6GrC/iW6UKJLncJ8lDMdrl/DwJGlhsfAXN5yt7jYKTXpM/EwV5MS7T5vR3+/GnYv
 F+x9tPkBqye9nnmlB1li8THxJLBtj5k2XMWuzL1o7RaGGRI5axeH9yi/1mHbnQqb7WljpCs1db9
 a3fNMOymvnrp86JVMnxizg==
X-Google-Smtp-Source: AGHT+IFWPkD99fr8Oa5B1J2rrOjSPK//trvpu7wfEmLHIYkb1t7nDc2Tkuq7lxq4oJP2DZ5CEGS+cg==
X-Received: by 2002:a05:6512:e83:b0:53e:349c:45b6 with SMTP id
 2adb3069b0e04-5439c2214d1mr13004096e87.17.1737891108043; 
 Sun, 26 Jan 2025 03:31:48 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.4])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-543c822f9b5sm899176e87.93.2025.01.26.03.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 03:31:45 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 14:31:38 +0300
Message-ID: <20250126113141.3258643-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737891108; x=1738495908; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cstWbne+Xmvnoh2jgd9/zY8v3nl9bSXSCBnG+OKPqz8=;
 b=GF1m4GageX5HXLyGNEfUebZ9uANSyP+YiSmnujIO15bBps/GjBND6UGejiYrz8oDSO
 Dj2WB6rP4GdP/382i0NKRGRfi5RyNE4Gnqd7hXa1t8wzYQ26ElOqvKgpbdNpozPyPvN0
 eYYM1F3fZg3m/QpoQuGRE0PhMEMnGf12xV8ak3rsIPJGJ6o2AcBt/rz6f90AnofSZVip
 4uZsJbACIUY/ze3uog5unWcgZAKHXomKtYv8Fz/Kzfmuu1b7zV137L2BTdxy2Ta09mt1
 H2YL/v1lMkjYzJ0GDJDorrku3huGPYx5NsrNvkAXcQ1NJ3Y08/n8mrvtpbm8ku7xe7Nz
 r0Wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GF1m4Gag
Subject: [Buildroot] [PATCH 1/1] board/orangepi/orangepi-5-plus: fix
 genimage.cfg
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
Cc: Julien Olivain <ju.o@free.fr>, Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

At the moment, Buildroot provides genimage v18. However that version
does not yet include the GUID shortcut for 'u-boot-env' partition type.
This convenient change is relatively new (see [1]) and can be expected
in v19. For now, use the GUID value directly.

[1] https://github.com/pengutronix/genimage/commit/3e0a2aea8d10431f8c8f652129f73544cfa16af2

Fixes: 057012eb2c2c ("configs/orangepi_5_plus: new board")

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/orangepi/orangepi-5-plus/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/orangepi/orangepi-5-plus/genimage.cfg b/board/orangepi/orangepi-5-plus/genimage.cfg
index 5da0b4a2cf..1f3ff3ec25 100644
--- a/board/orangepi/orangepi-5-plus/genimage.cfg
+++ b/board/orangepi/orangepi-5-plus/genimage.cfg
@@ -10,7 +10,7 @@ image sdcard.img {
 	}
 
 	partition uboot-env {
-		partition-type-uuid = u-boot-env
+		partition-type-uuid = 3de21764-95bd-54bd-a5c3-4abe786f38a8
 		offset = 16M
 		size = 64K
 	}
-- 
2.48.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
