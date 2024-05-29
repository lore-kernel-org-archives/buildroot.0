Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79071C25B7C
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 18:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24ED780BD9;
	Wed, 29 May 2024 18:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wuc893QE1SEs; Wed, 29 May 2024 18:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27AFC80BE8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27AFC80BE8;
	Wed, 29 May 2024 18:38:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9CB51BF4D7
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 18:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E9B580BD5
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 18:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DR5DzY1yBZxh for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 18:38:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 644EF80BBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 644EF80BBE
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 644EF80BBE
 for <buildroot@buildroot.org>; Wed, 29 May 2024 18:38:52 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-354e0cc9c5cso26845f8f.0
 for <buildroot@buildroot.org>; Wed, 29 May 2024 11:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717007930; x=1717612730;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fTq6FXauUM5BtaAEfmi7TUdAJ1Gig4NoxitCIcIZroQ=;
 b=F0UZ6pZ6O26YKg7bOmoUUk4w72m+WdNGjoFZf9N2CMcpENsTsMpQkh/2QopCCbdxH+
 5QhLa5gzJ+6zjcYDoctePO0Yc6QgLrxmM8CnAG9M3ab7Hy0411Le4nXbQPBjx0Z/w7nE
 BMdHyJvgJpzkc/py9NvMqpt3b8n00uuxSew7dWlbaMXfirmmfQMlRUsBfwGCgj4/HZKL
 yse+YhFQL0XX7yN0ZArJWXgByZSehKZ0CrAe+izqEZtj5TQMeiTMKmazHWYBrB6fbj/h
 vjDGRjqExy1AVpREyFLoEmsughkel6Vd/oTVF5mNAVXdd1pLOYEtwdauWmQeVjIlCwKq
 9cUA==
X-Gm-Message-State: AOJu0Yx05LXrkjVIFYaRbyRy/fp25j3rjlvK76npkkfV1B+If3QVRY8G
 uocwKtOB+ZxYLKy9YtWEVRmle4RHrjpR3is6JuDAq1iFwWpTrLXeFiPnYqMPc7RuY8n1U0Kj7KL
 2BLE=
X-Google-Smtp-Source: AGHT+IFP5ebCWtSFlUurCk0gEaKjO3SvInklHcFNzeLyYxgunSmthcr1p7pu2YCKbFeAiqTVzBmd0A==
X-Received: by 2002:a5d:50c2:0:b0:357:73ca:9c00 with SMTP id
 ffacd0b85a97d-35dc009a619mr31190f8f.32.1717007929966; 
 Wed, 29 May 2024 11:38:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557dcf0871sm15839260f8f.110.2024.05.29.11.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 11:38:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 29 May 2024 20:38:41 +0200
Message-ID: <20240529183842.1384707-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1717007930; x=1717612730;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fTq6FXauUM5BtaAEfmi7TUdAJ1Gig4NoxitCIcIZroQ=;
 b=eRAodtc3gbczj4v0tAwxiLaEloyFik59EqHly3k5FIOzZWcwLJEDMarpORVWiImMyS
 FyWn8wpaOL9mQgzXqEJDX1b0egesM15fTDwll8X3j7JBsyUwSRbKpWdFrx37ejDaF+0B
 PJW6VdWaBgpnbzaKBY9XBqGJ+IuOshALVjMFA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=eRAodtc3
Subject: [Buildroot] [PATCH v2 1/2] configs/lego_ev3_defconfig: bump Linux
 to 4.19.315 to fix compilation error
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 David Lechner <david@lechnology.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Linux kernel failed to build since commit e88225ed882 (package/binutils:
make 2.41 the default version). The new version contains the commit
790756c7e0229 ("ARM: 8933/1: replace Sun/Solaris style flag on section
directive") that fixes the issue.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
- Bump linux kernel to 4.19.315.
- Drop the patch to apply. It's contained in the new Linux version.

 configs/lego_ev3_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index 1ce2817d4243..86b2aea65611 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -13,7 +13,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.315"
 BR2_LINUX_KERNEL_DEFCONFIG="davinci_all"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/lego/ev3/linux.fragment"
 BR2_LINUX_KERNEL_UIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
