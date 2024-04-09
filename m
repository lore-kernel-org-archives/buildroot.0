Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EDBC67861
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 11:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99CC5402E5;
	Tue,  9 Apr 2024 11:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3dZ3X2G9xMf; Tue,  9 Apr 2024 11:17:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA2EC4057C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA2EC4057C;
	Tue,  9 Apr 2024 11:17:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D1C0B1BF3BB
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 11:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBBF56073E
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 11:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mYpx45HyLUXh for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 11:17:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.30.130;
 helo=out30-130.freemail.mail.aliyun.com;
 envelope-from=cp0613@linux.alibaba.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B2FB60737
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B2FB60737
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B2FB60737
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 11:17:08 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=cp0613@linux.alibaba.com; NM=1; PH=DS; RN=2; SR=0;
 TI=SMTPD_---0W4EPb-W_1712661416; 
Received: from localhost.localdomain(mailfrom:cp0613@linux.alibaba.com
 fp:SMTPD_---0W4EPb-W_1712661416) by smtp.aliyun-inc.com;
 Tue, 09 Apr 2024 19:17:02 +0800
From: cp0613@linux.alibaba.com
To: buildroot@buildroot.org
Date: Tue,  9 Apr 2024 19:16:35 +0800
Message-Id: <20240409111635.5181-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1712661425; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=xmHq8Buujai14BCdtcqju+thle0gXeslw8FOc/3aVv0=;
 b=jX6dJgbmsd/XUXUNhihjKPgau92GEz+yrgZ3Rc/sy01uQmzcQicgGlSOqOKF0NdJDnZ+zl+3Adc2gcGZvdt4yMWagx2aYiQTEReiYXb4rm7RLj93jX3BarfIoYNwW2kWjps2/XM5Zu1RysQ92U/blaRaF8gFE7sl7s3vFfYqN4E=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=jX6dJgbm
Subject: [Buildroot] [PATCH] package/bpftool: fix riscv support
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
Cc: Chen Pei <cp0613@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Chen Pei <cp0613@linux.alibaba.com>

bpftool already supports riscv, including rv64 and rv32, so support is enabled.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 package/bpftool/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bpftool/Config.in b/package/bpftool/Config.in
index ef3a7a8a45..9d6d1163f0 100644
--- a/package/bpftool/Config.in
+++ b/package/bpftool/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_sparc || BR2_sparc64
 	default y if BR2_s390x
+	default y if BR2_riscv
 
 config BR2_PACKAGE_BPFTOOL
 	bool "bpftool"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
