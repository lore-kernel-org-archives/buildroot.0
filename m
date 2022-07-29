Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895C9C00140
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 00:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDC7C60D5E;
	Fri, 29 Jul 2022 00:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDC7C60D5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DA1Z8Fp0Nugn; Fri, 29 Jul 2022 00:47:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE2ED60D67;
	Fri, 29 Jul 2022 00:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE2ED60D67
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4F3C1C11A5
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A789660BC3
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A789660BC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pdhA2Onz1TcS for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 00:47:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A491160B5B
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A491160B5B
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 00:47:15 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 12so2829926pga.1
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 17:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xyvOQG6EQlw1qFQxwnsiB6CkYB9owLfjdwGLLRINwMI=;
 b=uQ7eUYRGgTfQMn3xMHNKC8HmGWJUzwqo/U0mwtzLca2jOrZY+YBK/ZwnDCaH3LigJy
 vmdVGVVTJ98q6CUnCZdzlltePOvD0P3WgQvOOquEK+Ea0feJ3tzXQXpUYzTRZSWmLre6
 S2rSeAb2y/Pk3UBKXYb053fVVBAZusvUiClGo5wO5NnKgK+/RysdJL251YqzjbW05PnA
 rNO4BD48yMSHs7ogLQVe+UvjTSjoVUElJKZh+uqIlsIh47TC3NDeWStlis4rRnd+NHR5
 V51FP1mniW9RuswTAE18fiViAAMak4LQSfM/7XccEO0nK6pClA09tLWF1qcMA9u148zl
 WWoQ==
X-Gm-Message-State: AJIora8p580/2Iz8B9Y5lvfdVoWfYaR+PHP5hJ0/8cWx/SsvM83RHQzH
 TE1aui6/h40/xQCdmpt+DpYwtEA9Tf4=
X-Google-Smtp-Source: AGRyM1tV2CFjqkr3wiyYbem/q9UAzwKkgww8L34kia1vxqkEipX6UcjBp5lWQR/c6e+yVeD6cQoG8Q==
X-Received: by 2002:a63:4664:0:b0:416:3564:2a94 with SMTP id
 v36-20020a634664000000b0041635642a94mr1055981pgk.112.1659055634153; 
 Thu, 28 Jul 2022 17:47:14 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a63c10b000000b0040d1eb90d67sm1453568pgf.93.2022.07.28.17.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 17:47:12 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 10:16:58 +0930
Message-Id: <20220729004658.1298414-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xyvOQG6EQlw1qFQxwnsiB6CkYB9owLfjdwGLLRINwMI=;
 b=lNEb1BC1UeRAhcU6/WaMqbtAuYgMVb+wmy8rM6KfdPBA0lfesH9YXP+OYPHim4Ygp5
 A21l0d8SmkafPlemgFU8IQS5BbonYa3OyQ+OGgPDaftx3JWL81BZkegWsFYB37tJzCpU
 UGTG3CUce7TQY+0ZkO9HpROc07VoOLPGZE3yrRzEa9TU2dSHJravHyJnQSaS/2+JC0F8
 +MGQqt7T5UyVlB6PLFVZ14rTPh167zUwrhqfFre+XyI4EqH+fak5P3boQIuLdhw11Ibt
 pMizWQVvY97mQLe2u5AG4vGbrxhsn7NDViis4iMcCJM9fJsf/VLBxiViqCLSyTh/8rAn
 o78A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lNEb1BC1
Subject: [Buildroot] [PATCH] board/powerpc/pseries: Set x-vof on qemu
 command line
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This uses a newer firmware implementation that is much faster at booting.
It is supported as of Qemu 7.0.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 board/qemu/ppc64le-pseries/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/ppc64le-pseries/readme.txt b/board/qemu/ppc64le-pseries/readme.txt
index 8ee72ea6cf..3d5577aa32 100644
--- a/board/qemu/ppc64le-pseries/readme.txt
+++ b/board/qemu/ppc64le-pseries/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
-qemu-system-ppc64 -M pseries -cpu POWER8 -m 256 -kernel output/images/vmlinux -append "console=hvc0 rootwait root=/dev/sda" -drive file=output/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses # qemu_ppc64le_pseries_defconfig
+qemu-system-ppc64 -M pseries,x-vof=on -cpu POWER8 -m 256 -kernel output/images/vmlinux -append "console=hvc0 rootwait root=/dev/sda" -drive file=output/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses # qemu_ppc64le_pseries_defconfig
 
 The login prompt will appear in the terminal window.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
