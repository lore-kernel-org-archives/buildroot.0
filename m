Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEE2E7717F
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 13:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F3CF80EF4;
	Tue, 17 Dec 2024 13:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jeEYQSKGNOod; Tue, 17 Dec 2024 13:00:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CB8780F26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CB8780F26;
	Tue, 17 Dec 2024 13:00:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 772D5E3
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 13:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6537980EE3
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 13:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bz6IjmYONA87 for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 13:00:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B750E80EF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B750E80EF4
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B750E80EF4
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 13:00:49 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2164b1f05caso47847925ad.3
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 05:00:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734440449; x=1735045249;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=khTRdwF28b2d5hSCLQV0CRm7l+jB2u0y/LNolmF3Pq8=;
 b=tUx9I/DBbvHv3SoSYFnb+mzdeAdzxB11+U5YQgkFKN15go4AL71XQlD4iniAdNRVkc
 gnFoCdg6rWcsTkSe2B/sRVIkpMBr/ghnHrNZ4zXPEvbZu8RvvxxtLHB6ic4TFn0Mh5F8
 to7+DPb+qtmuuggLyRS7tZVrUK/ao9uELxC7n15dct/J0avV2vtq/VPTWuyIl5JDD3Mo
 2nyrIMxYwiXK++maEqVhvRMWN5uyPu5RxFIMxvzAsbjuL+ucAiwQYyjA5K01KvNghP0S
 qNZCXlkRUX2dSqXNE0oJTt/1yI2dAfqoTbbg4DPJ81RL8k8P9bHb9dx+oo5jhWrfgPW3
 JrRA==
X-Gm-Message-State: AOJu0YwxY+J84kogFHS4FAf//fgfsywkX+p9s4KW/9UXUX/KU6HES17S
 6+ffQnPXp+7mWBK/xNsGOEcssV5Pb8IvlzLUXVMDzid9uD/mhRJYdVHX1g==
X-Gm-Gg: ASbGncs1asnUlYscyfcJhmDZSkY3X0ObBc0Twj8mtoY6oCojjD6rbnonov+jGixPEeZ
 1dvcn/M8oQ9UL5sTYLqzqoOBujjEONFMbdvB7nSA/uftfw4TyjAP3eKWLxP/HEZqYX8LnQfDdy4
 zMNrQo4bdS1P9P7kHbZwnYM0hJcLZagmf2svmYyV4+3hHJ1mzquluAQr946voveHw1a3MzO7V9w
 BPMMN/dOu+oXW7O2vdEM6/WmMKgk0u+q0v2I5TRHnjDzitQVvPjwA==
X-Google-Smtp-Source: AGHT+IFhnH5Ao4SajftWDhHEtC5LvTyKp/rltHaCCAt3uEKSkubt3T4/maeSwlm3uq/+VWRjBx1mhg==
X-Received: by 2002:a17:902:cccc:b0:215:89a0:416f with SMTP id
 d9443c01a7336-218c8dd52b8mr50015535ad.30.1734440448475; 
 Tue, 17 Dec 2024 05:00:48 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-218a1e63896sm58782855ad.223.2024.12.17.05.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 05:00:47 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Tue, 17 Dec 2024 21:00:41 +0800
Message-ID: <20241217130042.1120454-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734440449; x=1735045249; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=khTRdwF28b2d5hSCLQV0CRm7l+jB2u0y/LNolmF3Pq8=;
 b=J3uSoXNiegh+yvBTqb6c8k70AXKxwZu/LomlUu+p9yzxdp2Sx0sLZpCFbNdN49NEVW
 t3kfq2NryghVi4ixNporsLQRu0Y2KWtIuCzGVP6Cp+O7Q5gsPWZIA3bsRfUoPXAEjkTJ
 YVUjDBta9ybnK0UW9myVTRrBDdIToDrHWsUXElc30n7lxLzlmEe1p3JnvZknST23R9gO
 1sMT62tSx5tGZecd08Sh7sjNe9Kwmf22FupUypDXrIRxQidDpcPa/CYfcFIb6XJoN9jL
 buXx5CYA+EIZ4j3XPwcN5mZUvbKow0/F+zsMC5YfUaLAKHydiV4aR5JUKbpHA49Qt4wX
 JANA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J3uSoXNi
Subject: [Buildroot] [PATCH] configs/cubieboard2_defconfig: bump Linux to
 6.12.5
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

Bump Linux kernel version to 6.12.5 and update the hash accordingly.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 board/cubietech/cubieboard2/patches/linux/linux.hash | 2 +-
 configs/cubieboard2_defconfig                        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/cubietech/cubieboard2/patches/linux/linux.hash b/board/cubietech/cubieboard2/patches/linux/linux.hash
index 4759f8354e..450cb12423 100644
--- a/board/cubietech/cubieboard2/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  62148e7e17f54c4a5ab5e75ad4882682c54bee818948be61a5963234fc0849fc  linux-6.11.11.tar.xz
+sha256  39207fce1ce42838e085261bae0af5ce4a0843aa777cfc0f5c49bc7729602bcd  linux-6.12.5.tar.xz
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index 9c0e51b37d..c24e7b3428 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/cubietech/cubieboard2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/cubietech/cubieboard2/rootfs_overlay"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard2/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.5"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-cubieboard2"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
