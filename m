Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE162D12D66
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 12:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F47C606EC;
	Tue, 12 Nov 2024 12:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0UVNWjLi3ut3; Tue, 12 Nov 2024 12:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 822096074D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 822096074D;
	Tue, 12 Nov 2024 12:38:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44D80DB1
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 12:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31E96404C6
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 12:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nNwUw7Wm8BQ2 for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 12:38:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6EAC14067B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EAC14067B
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EAC14067B
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 12:38:53 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-723f37dd76cso5727603b3a.0
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 04:38:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731415132; x=1732019932;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BQ+0JqfsfwiirCOfoKxt8vuZIo3ODiyvIkfqt9KGGGU=;
 b=pRwiRRxd9SnN/tvoAkJsXLoLsm7d337n60H8hY2LwQPqcJq8F0bvCE4GXRqhepjxl5
 4ez0T8NKpOf654XiW8MVxj8ZrsTk1EYbkxqq7mQmHXi2I11NaQoghHArrQqe4nVrKfIj
 gFCoSO7lb1tivDYxOU4UmyQcURZeXX4YSGanp61mkAzbSAz/0o1b2VJh1tCu6zZ4ltRQ
 iFZa2zdIiSzLutt82elRweYK8ESCwsx6H0pFcxJ1LRwO3SYX65MBxNxKuQxlSew7DrZm
 chFFnnl3CV9KWSwhDopfOJtlMzrtz4ruMr2WcNN4uFRxDIPZE46V9dlsNVl/lbI6Q53F
 sKPA==
X-Gm-Message-State: AOJu0YwVe0IyFwRvz0B1/JJvjHbylVm7hv4gOtZZC/0hB//bqi06XSlW
 QL3aC2nsHZkgr8ofck9r5aBvZ/8Vn21uwd7eiVo6ILGBwkuCJGYV50tvpg==
X-Google-Smtp-Source: AGHT+IHLtjq1XBnaR8CkboDemVRYIY2LPB1MF8TSO3Di5FHG96GOjDUp9loQIdqhONkClTRvsHMU0w==
X-Received: by 2002:a05:6a00:4099:b0:724:46eb:c38f with SMTP id
 d2e1a72fcca58-72446ebc554mr4685697b3a.25.1731415131893; 
 Tue, 12 Nov 2024 04:38:51 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72407860a97sm11408453b3a.27.2024.11.12.04.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 04:38:51 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>
Date: Tue, 12 Nov 2024 20:38:44 +0800
Message-ID: <20241112123845.7120-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731415132; x=1732019932; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BQ+0JqfsfwiirCOfoKxt8vuZIo3ODiyvIkfqt9KGGGU=;
 b=dvUE/eN87CM/UOI8eFjyY9Tsp6Ac1XCQK6f3Y1KyjLFEwO4ZotBk+6vKCOuzYxmgaQ
 M+3HiZdkK0hxp5qxPTemoY+3+iZgcyHcT1ltYnd85+NWV4f0KIwWikmr7z1/cIP97zNF
 VSgiWRoR/nf/s6NeDchONn9CXc5Ol99nq7ef6cQ9p8BHLKjCQDryeU1r8RRC4GnviiSl
 gleuuGq+m0wruEGvNmwwU+8tMrQEr+Pq+RBqS3kmQIASeIvgjC6T216NvEZv7dvIImc1
 TkP0Pq1FS4gw8VMQKpXKKe5HIt0XdkYjx2Sbh1uTZuFPSlER76KU1iXkSqta6TknWTuQ
 f+sw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dvUE/eN8
Subject: [Buildroot] [PATCH 1/2] configs/cubieboard1: bump Linux vesion to
 6.11.7
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

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 board/cubietech/cubieboard1/patches/linux/linux.hash | 2 +-
 configs/cubieboard1_defconfig                        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/cubietech/cubieboard1/patches/linux/linux.hash b/board/cubietech/cubieboard1/patches/linux/linux.hash
index 42d02c9f78..f97a04ac84 100644
--- a/board/cubietech/cubieboard1/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard1/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c954f60197008f1e1f32a1e77293903cf3801d2543ec4bf521f5651eb7f133ce  linux-6.11.6.tar.xz
+sha256  0bf5ec644817d7928920f763581311f5bf258a92759cf2f30985da743af3ebb2  linux-6.11.7.tar.xz
diff --git a/configs/cubieboard1_defconfig b/configs/cubieboard1_defconfig
index c3dede47b8..308de10823 100644
--- a/configs/cubieboard1_defconfig
+++ b/configs/cubieboard1_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard1/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.7"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-cubieboard"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
