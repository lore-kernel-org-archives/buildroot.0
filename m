Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B14C47DA9
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 13:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D17AA82779;
	Sun, 28 Jan 2024 13:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D17AA82779
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2fzJ3Dc9STmq; Sun, 28 Jan 2024 13:21:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 079A682AC6;
	Sun, 28 Jan 2024 13:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 079A682AC6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E24D1BF2C7
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4D41400C8
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4D41400C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x27nbR3MQqmZ for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 13:21:04 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA84C40179
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 13:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA84C40179
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40ed356a6ecso16325765e9.2
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 05:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706448061; x=1707052861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1NKH6oodC2m80sSY3Sm2IWnwx8JgqZShGZVNKUO2zRg=;
 b=lt+/PpZZzHssRYb3W+AoZ8fTclYnzf3haUuqxmi60C2asYrQ+pRTzyrgjGyg1xSW+B
 3WFRmqrwe4Eb6l9oVUY0wiugpVKiRUyKNh2k3NQWCRCYe4KIgerAwuVRX3d3vl0UJO7g
 NXosAcZFaHlomB+1u4Oq0dAHEdJCxA9vojAPLybqQJ2YPrRrSjcjzFV+UyBSXVLVW+Sw
 zaqS2TLc8RchlkqnVR+7uj5JXSABg+zq+sUmh5a7yAiAiZl5I60PqwFRnuzJQeCtQqWJ
 hpGbfolPd7NUN7uiLX6US3DiOPZ6e/dx/FnkkKCTfos6KVhhzoqD9299wi22FejcSJzA
 3w3w==
X-Gm-Message-State: AOJu0Yy79v1xewYJ2yGBz8Yt0PSzvmtVAOeAg0cWdWwShSdueqz5mhTw
 FTeA5c/YN4XJswxNC++8dhqiIeP0JuGchW1mmaf2Zof+rFh0dbJshPQ8XWrp
X-Google-Smtp-Source: AGHT+IGfVPGombwchFcfFJdDlB+phNdwjtdm9qmv6OciPOBjCnAKVD95LtIfRxBJZZQ7atVP7dCTGA==
X-Received: by 2002:a5d:5647:0:b0:337:bc1f:28f4 with SMTP id
 j7-20020a5d5647000000b00337bc1f28f4mr3382916wrw.12.1706448061683; 
 Sun, 28 Jan 2024 05:21:01 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 bv25-20020a0560001f1900b0033aec64ba7dsm747778wrb.78.2024.01.28.05.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jan 2024 05:21:01 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Jan 2024 14:20:54 +0100
Message-ID: <eae889ce783ef15ffa62e2af3f2d2ef0e8e079dd.1706448055.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706448061; x=1707052861; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1NKH6oodC2m80sSY3Sm2IWnwx8JgqZShGZVNKUO2zRg=;
 b=G/mdLy9L0Rc80nLnsJXjoaxuJ5pjoBQUlFCXA/hT1GLPr9vjt4hrZXWTBws38rJ+SN
 5qOFFhusXZ8GJAX4lBJrP9ZMtLaaSJsJMeP9b6ZdPvl648b+B8ZOz2UF9tD+Bw0X+fc3
 5Pleilyv+AMyYzQFb4miiVlj0l+lViYoZ0l406nZqUnIteELEV1xIhooBy9jJ1ytdZJM
 9/GELgHZJZm9DCqlCq8Ylcb9d5H+2hLkPBTHDxJgE6zwTF0JWe+0FBs0IQd93357YsBZ
 btDAzI7WjOgMc717ZA+k7PLC5zfvnBo5O50TBwm2y+HMZuiFMAPjoZTinmKMCmZH9Czt
 /rkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G/mdLy9L
Subject: [Buildroot] [PATCH 05/10] package/petitboot: fix ordering of
 comments and sub-options
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, the comment about availability is between the package main
symbol and its suboptions, breaking the threading in menuconfig.

Invert the order, and move the comment last. Also enclose the suboptions
between an if-block, as it is more customary.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/petitboot/Config.in | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index 93ed3642c3..f931ab91cd 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -19,17 +19,20 @@ config BR2_PACKAGE_PETITBOOT
 
 	  http://www.kernel.org/pub/linux/kernel/people/geoff/petitboot/petitboot.html
 
+if BR2_PACKAGE_PETITBOOT
+
+config BR2_PACKAGE_PETITBOOT_GETTY_PORT
+	string "TTY port(s)"
+	default "console"
+	help
+	  Specify a space-separated list of ports to run the petitboot
+	  UI on. Wildcards are allowed. Example: "hvc* ttys0 ttyS*"
+
+endif # BR2_PACKAGE_PETITBOOT
+
 comment "petitboot needs a toolchain w/ wchar, dynamic library, threads, udev /dev management"
 	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_PACKAGE_HAS_UDEV
-
-config BR2_PACKAGE_PETITBOOT_GETTY_PORT
-	string "TTY port(s)"
-	default "console"
-	depends on BR2_PACKAGE_PETITBOOT
-	help
-	  Specify a space-separated list of ports to run the petitboot
-	  UI on. Wildcards are allowed. Example: "hvc* ttys0 ttyS*"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
