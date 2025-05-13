Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085B4C3ABC9
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 21:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 901E160FF9;
	Tue, 13 May 2025 21:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J2xY8IHg1RkV; Tue, 13 May 2025 21:42:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B328860C31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B328860C31;
	Tue, 13 May 2025 21:42:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C39712A
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E629540386
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_8NGcCy2oUs for <buildroot@buildroot.org>;
 Tue, 13 May 2025 21:42:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=johan.patrik.olsson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C86CF40135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C86CF40135
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C86CF40135
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:42:37 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-54298ec925bso8923825e87.3
 for <buildroot@buildroot.org>; Tue, 13 May 2025 14:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747172555; x=1747777355;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7lEmMnRfV+ZC9M8s+0s8CzIJ+w+ORtgN01c5ZOvjVZw=;
 b=nkhCWCIdKH4TUu2efA4HXOJm3+xPqCZvjSZhtgUV/sFT+C6F/z/qjsm/pOyPWm9Frj
 ykq5hII1qS/VCkc9PS5aaiDfjXjD44NanWV4DnuKNKEyQl9P5Yf84t7KKo2TyaZ/OvZ1
 HDQPwx0icgyh5TxlZW3wx2DfUXENQN7WN+pG+4BslecQbhVFMzwzhcNNwH3H2VdWNqKX
 6ahLSbXaMt6TvjjFpqfXUskvy+tw7dnGqA5kUaZLwZDJepNvL/eJOtptgJzIdZOFQ/Qn
 uND7JDdeHSdpYwKwZzDbtASIFmFX5nLZF6zGYtMKcGho8sZ7bklRu5e8QeE/egOQG2Py
 NE4w==
X-Gm-Message-State: AOJu0Yy1wfwQfuyq2XC1HHgBS+MDlcnJutOxLhf0/btMUIJxrDv4aPt0
 zTq0k5cRBVgTlZP92aYDdijm2epoQxBINEGELve9RR4Lvd87tHXdcfQ2UtzR
X-Gm-Gg: ASbGnctojFXvtcG4og8u6BEAkH4pI1U0DiPo8UdOIAMWJr7vqeN4e6VrkZjp0zBmjPA
 X5J7vHBivKqVMvTTDW8cJ0MVF7EwsTPALcIVXJC+IdX97RMm6f2G7Y3XMfMlUMe4hUkvvZkjDb7
 WImR+MeYUtDDzPkKuNVGuVb8Q9vbcEjfTjrl5G+wfVnnaL8YOYlws2s9Mchil5k51ReMb7019mv
 IfJOXuJl8LUyHogsbkXosLmRNPF5vGE22DN/nNgxwI8zpIhN8tlu1L0N9JZ2uELhr7aGatEcsyC
 JhqqxtjuASj5iOCSpeC2wm8/SzkssoeUK+SHpHE8lM4lZJrXoC4LBL4oMAPegLYphn41q0WaaPI
 JCJrlOpdI68nCRRNEtwHYcPir3AfjG+P0
X-Google-Smtp-Source: AGHT+IF5UoVaXU1rUGEUiBVOJM7ZdcndwL5PlEuZccGrbbE+SCk9liluoIZcsZKhLiAnwAwWtbW/8g==
X-Received: by 2002:a05:6512:438c:b0:54e:8222:730e with SMTP id
 2adb3069b0e04-550d5fdbebemr292057e87.37.1747172555044; 
 Tue, 13 May 2025 14:42:35 -0700 (PDT)
Received: from DESKTOP.localdomain (94-255-243-81.cust.bredband2.com.
 [94.255.243.81]) by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-54fc645cecasm2021635e87.62.2025.05.13.14.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 14:42:34 -0700 (PDT)
From: Patrik Olsson <johan.patrik.olsson@gmail.com>
To: buildroot@buildroot.org
Cc: kuzminov.sergey81@gmail.com,
	johan.patrik.olsson@gmail.com
Date: Tue, 13 May 2025 23:42:25 +0200
Message-ID: <20250513214226.1119477-1-johan.patrik.olsson@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747172555; x=1747777355; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7lEmMnRfV+ZC9M8s+0s8CzIJ+w+ORtgN01c5ZOvjVZw=;
 b=WrKn3dZTHVqnI3G5Y9L8yz2Kgq50PtBLornU2o3zDgmsKMzTDTIqxH4j8cuMZNZOlj
 LF66cb3S9EAJLxjHBCkSHsARZLBkohtmiLIiczz0ysT0E7nMmZz6C5qTyYr0KdO7qCin
 EjAjdDqM2IKq7/TjLKHHy6+EirTz4xmbF0UHJOp0MqKa6Qruhz2woGrBXSHZYHOIfg55
 /iEbzl7Wro4tfGaibxM2n7PEAmH6zSmI+5XgAmDX5iuUqFpT2G/EITccPZqwHgMatz4/
 EOqB0ELW018MyZmaiuqBZQuwaR/wCi0ozUh7pAEmtyAuCpiVxXk+UnyN4/52VLz19bTq
 iUTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WrKn3dZT
Subject: [Buildroot] [PATCH 1/2] configs: friendlyarm_nanopi_r3s: use
 Bootlin toolchain
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

This moves the defconfig to the Bootlin glibc stable external toolchain
as per[1].

[1]: https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Patrik Olsson <johan.patrik.olsson@gmail.com>
---
 configs/friendlyarm_nanopi_r3s_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/friendlyarm_nanopi_r3s_defconfig b/configs/friendlyarm_nanopi_r3s_defconfig
index 4219147033..5844c5bb4c 100644
--- a/configs/friendlyarm_nanopi_r3s_defconfig
+++ b/configs/friendlyarm_nanopi_r3s_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a55=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_13=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-r3s/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="nanopi r3s"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
