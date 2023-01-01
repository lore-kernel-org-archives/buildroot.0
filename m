Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182DBC4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9EC1405C1;
	Sun,  1 Jan 2023 23:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9EC1405C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ik6vXCeBmSoz; Sun,  1 Jan 2023 23:41:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0696F404C0;
	Sun,  1 Jan 2023 23:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0696F404C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CFD141BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB12E60E82
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB12E60E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dWgWpHwPUNba for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D91C60D51
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D91C60D51
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:33 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id r205so23815842oib.9
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M4iVsTNYvHqnLSvPoV0kelIpoU8sQYy1nSssq+v3cW8=;
 b=SROirAejBZ7V+6Z914KZheH5u4sqvkGax4Wm2qOSJAnMFEBKvQjdpBIUh6FjFOFrUU
 ilVJ+XHJyhwzjRIw1XpqfayLLjUJSpt2BESpEvCMogEfwEfq6mzWO5y1wrDZovDJQFAZ
 XGmhk5cJ5WbTy6tjAN830cNrVYlOCUjTZ61+xzuYd4Vby4bqcgfsEglKKnpaz8AYqQeM
 gRpJ75fzbIfyRvOaDL93XqQNkjm5PnzamTZMa2Ssnk+v31BEUHhdgkQFyPhQ2b8YK6hO
 f4lO5nLRVsGE1tKiG3a+wcOGk99X2AmYGxMhS0KhUyPkyQuyswps/downkH83d/qz4r8
 Qk/w==
X-Gm-Message-State: AFqh2kqGrwbqYk92BFjmyXqfgQgpLm/TLfWQT+ZQBNcclNbkH1rmfdt7
 pdUGZHt4JDUyedEApQ8DLmoBi4bd9aM=
X-Google-Smtp-Source: AMrXdXu7w/NdegtuKAtwShmz3gg/L+NZTDgVnQRJVMtYmYoeQqpKnNKbm11OIaQM/b5J0fDOkOImKA==
X-Received: by 2002:aca:ded7:0:b0:363:a6c6:771d with SMTP id
 v206-20020acaded7000000b00363a6c6771dmr4159227oig.28.1672616373092; 
 Sun, 01 Jan 2023 15:39:33 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:31 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:36 -0300
Message-Id: <20230101233653.487175-13-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M4iVsTNYvHqnLSvPoV0kelIpoU8sQYy1nSssq+v3cW8=;
 b=Z7TylPIYwDTsa+sFYlLoXkzIFE9QZ2Vi3rFQ9NSgHV2x8QJrdolgOSd9UG2KEYaRod
 rXTiJgkUHT2scq0n9Ggxv7kNQk54IqYwhgBD6zXYA6VKB4LVW3leoeSOoukKXtl44GDd
 8BVhnkCs1WdGmGkb+cagPOsy1nCSJWdqDE/Gis1d+sjObL2Ua/EtWqBju+Ce7hJ8i6qy
 LJ2KPYQq2Qbm7UBFRSKlG9/8wrb6sMJS2p2Qjgj2bL7LYh5bLeNqc41T5W+KTiJqz7g6
 5Wvmkp3pYs2nH+2ORaUGXCGLiP0WHgdL9NU2QyaM3hM7hMjtjvfWmXpD2RYL4C+0mqYG
 IKOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Z7TylPIY
Subject: [Buildroot] [PATCH 12/29] boot/ti-k3-r5-loader: drop bogus
 TI_K3_R5_LOADER_BOARD
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
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "0189bcb47c boot/ti-k3-r5-loader: new package" added an unused
define.
The define value is calculated from an inexistent option
BR2_TARGET_TI_K3_R5_LOADER_BOARD, so drop the line.

Cc: Anand Gadiyar <gadiyar@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 422ab20d71..afa309aa98 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -26,7 +26,6 @@ TI_K3_R5_LOADER_KCONFIG_DEPENDENCIES = \
 	$(BR2_BISON_HOST_DEPENDENCY) \
 	$(BR2_FLEX_HOST_DEPENDENCY)
 
-TI_K3_R5_LOADER_BOARD = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_BOARD))
 ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG),y)
 TI_K3_R5_LOADER_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG))_defconfig
 else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_CUSTOM_CONFIG),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
