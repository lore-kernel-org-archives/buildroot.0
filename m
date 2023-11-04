Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2BEC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 07:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2098682884;
	Sat,  4 Nov 2023 07:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2098682884
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gbg29ECWP-_o; Sat,  4 Nov 2023 07:26:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 758B1822D2;
	Sat,  4 Nov 2023 07:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 758B1822D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A03991BF397
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 07:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 785AD4010F
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 07:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 785AD4010F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qsmd4Rh5iHIY for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 07:25:17 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 891A0400C1
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 07:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 891A0400C1
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32f7bd27c2aso1914740f8f.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 00:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699082715; x=1699687515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VuAQcWCC1ZU+aJohobEd2Y6awBwFTNxRKuyRdhEXf9Y=;
 b=gLVhi2NXgSV2NGnZ6YSBfeyAMd/PpmApU7BmGsbecgqcpg3hZ+jYOoNIaDIrliuDwd
 QE74i/jGA66KwzIb06dGm4WSJgXYJ6RAhHgzKX/xFVjebkN3ZqCH34rYlraUy4NV/tDP
 azSUZ+qmPWRfB8rcfQnhKU39dm7e0VJcCxtK9q8nNBJvq9T035NPNoXZzVtyKVbH9FsC
 lE8Brt4/1SrLkh48lvNrZ79O9aiByB8AXVRpjrzxg8Vd7KSh+6yl/+h77yRlhAzl/bQf
 3EjdbZSwYpjW6bKHgCmLB3tF8ciXbFVhiHL4tz1IyMrVS2oRo22HofZ0GNz9SQLemNgO
 zlDQ==
X-Gm-Message-State: AOJu0YwL1CS5v5a8Vs4ob25qGg/t6hQQz4yiMzj00GbnRY9Vfq7b1HNy
 VcX3NmB/CJeDZBH/8LD4qYxqSewRDsvEYD0ZysZ1pA==
X-Google-Smtp-Source: AGHT+IGHZlm0n9b5l0Noi8b9IvLB1P8UZCUP4sxiXddMKtPZ0WnLgp0Z7TBEwoXdg3BB13BSgkmDdA==
X-Received: by 2002:adf:ecc9:0:b0:31f:ffd1:6cf4 with SMTP id
 s9-20020adfecc9000000b0031fffd16cf4mr17800417wro.12.1699082714809; 
 Sat, 04 Nov 2023 00:25:14 -0700 (PDT)
Received: from jpl.. ([151.238.102.70]) by smtp.gmail.com with ESMTPSA id
 c18-20020a5d5292000000b0032da87e32e2sm3686742wrv.4.2023.11.04.00.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 00:25:14 -0700 (PDT)
From: Javad Rahimipetroudi <javad321javad@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 10:54:58 +0330
Message-Id: <20231104072458.7369-7-javad321javad@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231104072458.7369-1-javad321javad@gmail.com>
References: <20231104072458.7369-1-javad321javad@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699082715; x=1699687515; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VuAQcWCC1ZU+aJohobEd2Y6awBwFTNxRKuyRdhEXf9Y=;
 b=l5FCvamgXsTTVWG41stxRpJZCTk+4b/0yTs3CiTNOaOBPq2EfzPNvgGQpCRGl2n/lr
 VJrOwzt674lwlewkApjr/SLxu/xrxYTJutMqn/0v5xpR7Z++dxd0L84Hy0WPqeMivJ07
 gG7g4s6hqacYAVZ4HhVQN4bRzEfS157WVxfIW56584cCdA6ZtJsIFLffdKSgu7IYLa29
 B488Qpgg7YM+4X7va2c0ObfWnvevDuvG7IQCDVEg8rPdOJzOowBEThmqw/t2n0HI+qcY
 8OlvWnV6goexX48SFARmWmBimfDl4D0RRzLHsro7mn0X5HsbiBIkbMy3vcYGsleD6KQG
 LwRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l5FCvamg
Subject: [Buildroot] [PATCH 7/7] board/pine64/genimage.cfg: remove
 unnecessary partition for itb For minimal booting,
 uboot.itf is no longer required, so the correspondig partition deleted.
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
Cc: Javad Rahimipetroudi <javad321javad@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Javad Rahimipetroudi <javad321javad@gmail.com>
---
 board/pine64/pine64/genimage.cfg | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/board/pine64/pine64/genimage.cfg b/board/pine64/pine64/genimage.cfg
index 37ebe5ea6e..23b02973dd 100644
--- a/board/pine64/pine64/genimage.cfg
+++ b/board/pine64/pine64/genimage.cfg
@@ -20,13 +20,6 @@ image sdcard.img {
 		offset = 8K
 	}
 
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot.itb"
-		offset = 40K
-		size = 1M # 1MB - 40KB
-	}
-
 	partition boot {
 		partition-type = 0xC
 		bootable = "true"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
