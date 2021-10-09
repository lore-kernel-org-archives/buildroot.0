Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC79C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 09:41:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A6AD60F9C
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 09:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A6AD60F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F8D840669;
	Sat,  9 Oct 2021 09:41:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j5SSe96PP1_c; Sat,  9 Oct 2021 09:41:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 677F540659;
	Sat,  9 Oct 2021 09:41:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9C4A1BF27A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 09:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B946D838C9
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 09:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C0iJdq8XWaCL for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 09:41:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD5A5838C0
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 09:41:53 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id y15so49413541lfk.7
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 02:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VSoOkTXaNHqnge2FdC99F6q0i//gGJFmVmyohXQbHOQ=;
 b=nN8qvBsAHbVtFxtVQ2NTdsxbTl4AYAiJHaQwRnEeKATITj2ITuLJLYFU6jaqJeTzpl
 FuEnxr+C1JcmHfyBJ8GHU8wxChtl5nafFGsczQIRX20Fyshx1tJ/VS28BeZK/7UBE2Ni
 C9EsePTVc9vFTk5eD63UhoocKMSY6brta3/y03XIvgmEr4QCX7FmMbySC8Y9aEj7/S2J
 zsZ2tsLtuhhmM/1EDTXZBoJmZ6U01BGkhk8h+IfL2MM3QkR/3kCj2Sxvk0UwMdLxe+NP
 ZsBjO19NhONo6cw5DmfMgBd9JmVD2mpYqfviClIQ8W8NanMAmpGiULnRppR9eBeANd7W
 s/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VSoOkTXaNHqnge2FdC99F6q0i//gGJFmVmyohXQbHOQ=;
 b=RthvA8mu16bZBIOa/VfWw2jfEM7Ip3nlGWODRJMFLtfjfEYTYXTJ2MYIiUFa8GEXdL
 3Wp2G6XLflYkYo+hYDNaEe6Pf5SqUJwmhjAesKCxUNkaKG5Hb2EG091XjSsGhcLPi0MS
 ZwMa2uPbCLD0bqfTKghKiZEuxpzNc9LCXuAZGrM/fSu6xKXn5v3xRDSxFnyN+xP0UBcQ
 QfqAYtcNHn/odMyFHOUbZKUtu0Ts9sjfFygkyM2GTOVrIG+qZ4VShMsNvcmGafl0FhlP
 EpUoKNLdgB9IvQIOLxQm1mogLDWX62h0/wbDvq4iAVsY9NFoW+wQ3n5Boxk/iV1y2Fiz
 cDEQ==
X-Gm-Message-State: AOAM531CJYuIC4MrWdZAGd/2WGReLhj3Uxlq9l6lcEjka93OVlmn5M/H
 GD5EFry4YKPXH9HrP0QNukbuaMlqKU4=
X-Google-Smtp-Source: ABdhPJyJG1DIccn6VYN+Z3krYjBqkRQbJZpO5FbBHwMNOY6834NHEKQFq1xkIwMseX/27rWfeFGZNg==
X-Received: by 2002:a05:6512:6d6:: with SMTP id
 u22mr15499412lff.624.1633772511310; 
 Sat, 09 Oct 2021 02:41:51 -0700 (PDT)
Received: from localhost.localdomain ([94.254.51.197])
 by smtp.gmail.com with ESMTPSA id e4sm166904lft.32.2021.10.09.02.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 02:41:50 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 11:41:44 +0200
Message-Id: <20211009094144.130161-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libuev: bump version to v2.4.0
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This update is critical for linking against GLIBC v2.34, due to the
changes related to 64-bit time_t on 32-bit systems.  See ChangeLog
for details:

  https://github.com/troglobit/libuev/releases/tag/v2.4.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/libuev/libuev.hash | 4 ++--
 package/libuev/libuev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libuev/libuev.hash b/package/libuev/libuev.hash
index d52d210d10..e5c9660a02 100644
--- a/package/libuev/libuev.hash
+++ b/package/libuev/libuev.hash
@@ -1,4 +1,4 @@
-# From https://github.com/troglobit/libuev/releases/download/v2.3.2/libuev-2.3.2.tar.xz.sha256
-sha256  af31ffe1058a2ff6c56fee26ec8749688704d297189b6a898380a601efefbec9  libuev-2.3.2.tar.xz
+# From https://github.com/troglobit/libuev/releases/download/v2.4.0/libuev-2.4.0.tar.xz.sha256
+sha256  31f1aa4f492ba4f6a5dd6b19968ae6a732968dc05cae6575930560b6cee1f5ef  libuev-2.4.0.tar.xz
 # License files
 sha256  694a734d9c1b46ae203314ed1c744a1acebd4fe5fc964b761703772546f0d3ab  LICENSE
diff --git a/package/libuev/libuev.mk b/package/libuev/libuev.mk
index 8a6759a2d7..a32381dcc5 100644
--- a/package/libuev/libuev.mk
+++ b/package/libuev/libuev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUEV_VERSION = 2.3.2
+LIBUEV_VERSION = 2.4.0
 LIBUEV_SOURCE = libuev-$(LIBUEV_VERSION).tar.xz
 LIBUEV_SITE = https://github.com/troglobit/libuev/releases/download/v$(LIBUEV_VERSION)
 LIBUEV_LICENSE = MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
