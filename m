Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6B2CDD0FF
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 22:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D5BC401E0;
	Tue, 22 Oct 2024 22:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MWDS0h5cRkHo; Tue, 22 Oct 2024 22:55:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5932540299
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5932540299;
	Tue, 22 Oct 2024 22:55:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 660BA4C2A
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 22:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30A8A605FA
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 22:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rerRCg5HsLgz for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 22:55:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.166.175;
 helo=mail-il1-f175.google.com; envelope-from=bryce.d.johnson@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E51B9605D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E51B9605D0
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E51B9605D0
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 22:55:09 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3a3f8b5fc45so1032345ab.1
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 15:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729637709; x=1730242509;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vwrVfg7p0GNRxU2SdYelrX4s8eZy+rShFps5JkoubDg=;
 b=De2y0nrOZTcVw+U/EmOt40e1lUyWtXsvW2kL6x424FMZxOvrAQKLjftIHSXtoGgagG
 hcfwcyTiQnoEIIlkwXd8wUXirrwUKSScdzn2N3Sui9cOMnI58hy34RsGlye0qMokXZuJ
 SRoc6DXnwFsu8/AB0vecI3F7Mgy0qmNoZGF3eOjHpgqPFMsoUslurBG1yMYEYLTi/XQB
 lbCL3wPr1lhmlF50bE+xrUs7piNZhUSdQawZaZiWPUy49D6EXothVTNjBl/U9cgSu7yl
 11aQ+MTcyJR37g1kF89YqvP28hNuB2qVPn0ShQFWtsTR+Q0R+P6/n5o/u3R7pLEUWqUx
 HElg==
X-Gm-Message-State: AOJu0Ywp28Dq8aAvbGIqfD3gVUS38AJZwSsLBPOp8rSeaeZF6/PQSDrx
 XUbdoy7MkmVoBjlHqp/9svK6wv9U8OsMy1d6HB3OIxtV7kuMMgrICofR+A==
X-Google-Smtp-Source: AGHT+IFVBCQmsvLAQ8BC3+8/2DtWox8tayZYkhGG2/I22dYd+COACLcS209dGw816SIFX1eQxaZ1nw==
X-Received: by 2002:a05:6e02:2194:b0:3a3:a053:a1c0 with SMTP id
 e9e14a558f8ab-3a4cc03eea6mr35077005ab.7.1729637708682; 
 Tue, 22 Oct 2024 15:55:08 -0700 (PDT)
Received: from USATL1PC00222.am.bm.net ([149.106.100.80])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a63063fsm1785186173.124.2024.10.22.15.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 15:55:08 -0700 (PDT)
From: Bryce Johnson <bryce@redpinelabs.com>
To: buildroot@buildroot.org
Cc: Bryce Johnson <bryce@redpinelabs.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>
Date: Tue, 22 Oct 2024 16:54:54 -0600
Message-Id: <20241022225457.568323-1-bryce@redpinelabs.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=redpinelabs.com
Subject: [Buildroot] [PATCH 1/3] package/arm-gnu-toolchain: Add support
 check for x86_64 and aarch64
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

Signed-off-by: Bryce Johnson <bryce@redpinelabs.com>
---
 package/Config.in.host                   | 1 +
 package/arm-gnu-toolchain/Config.in.host | 4 ++++
 2 files changed, 5 insertions(+)
 create mode 100644 package/arm-gnu-toolchain/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index e4fbee4f2a..360ba9dad6 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -5,6 +5,7 @@ menu "Host utilities"
 	source "package/agent-proxy/Config.in.host"
 	source "package/amlogic-boot-fip/Config.in.host"
 	source "package/android-tools/Config.in.host"
+	source "package/arm-gnu-toolchain/Config.in.host"
 	source "package/asn1c/Config.in.host"
 	source "package/babeltrace2/Config.in.host"
 	source "package/bmap-tools/Config.in.host"
diff --git a/package/arm-gnu-toolchain/Config.in.host b/package/arm-gnu-toolchain/Config.in.host
new file mode 100644
index 0000000000..dfd30e5223
--- /dev/null
+++ b/package/arm-gnu-toolchain/Config.in.host
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_SUPPORTS
+	bool "host arm-gnu-toolchain"
+	default y if BR2_HOSTARCH = "aarch64"
+	default y if BR2_HOSTARCH = "x86_64"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
