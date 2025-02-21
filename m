Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48929C021B3
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 22:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4788607FC;
	Fri, 21 Feb 2025 22:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YyexJC0arte; Fri, 21 Feb 2025 22:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF14B6083A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF14B6083A;
	Fri, 21 Feb 2025 22:55:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6255B194
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51E5781492
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qDeDY9wqERvJ for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 22:55:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C3C981479
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C3C981479
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C3C981479
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:55:34 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38f1e8efe84so924812f8f.1
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:55:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740178533; x=1740783333;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TR+lbOWbzEUlyIVaG3715ZddcW5OZPNdh/PXsxuO3d0=;
 b=VE2G6hIrLQmEy1yte7dd7S/ga06dPM8rNJ0nJbtgu9L2A4MfKK/2VD7Xx6PSHnOxB8
 9vE7X/2WYyloLuajRzmnw2Xmk9LkIlSfDIdadSszieK6Iwv2bvuoQFd/qHCyDvkvcgyn
 NEo1lKX1xfWzWpi73dkCyLOyV3iRN1+mntAZwkSheVSym8BDyeqgpx2jFAkgRpN3jZqd
 sfyFFG1nLNsxMuQbenzb4cE+gw+sPoOxd3CuWhRA7F+lHDB1RisHNrWNkN/u0BS0iVAL
 DThhkhhAHdi6N1WPs56Hk5NzWGVIM+7yvR0kl9CSSSyJZi+0JrHxdDW+cDnXMM5hml5m
 mSLQ==
X-Gm-Message-State: AOJu0YzatN3AVTcIrNQGalmMLb1baqvpO5Vy8YSpeiD0Fk6c0S/6XcAr
 ghwCqlAw2pfe99tuxhxat/V1TF5i9P8EwU54lW5Z11HVljnjee/kCt0aSlUbL30+nXCZ8mGSlDF
 T
X-Gm-Gg: ASbGncvKS2uEK4Yoy4zy+mlWKa9kEF2s8oounvaUFAQzhvDGHI9fiMXP8GzNbBZ652x
 BSekjr8vfTq/OYprhH+w583SKM4xhGtFRk9+xg3OWexqXt6+LSdWbp0/0hJdhgKnofnTEw3Geng
 TdCOUhunQqGy1XYZTUSopwLodps/MOYj2vmnkrj/JP7EBoIA7z2JiaoxM3AvL0JxMip8qJCPRDF
 ddvi7N1EP9OfhYlqu5W6bOolZQhcohpn3WuHx4vfQJuX+Mfb4qizJs/Z/TWFlvRKg9iMj6MolNQ
 MUoG8o2yhsWE8zpBsuiWPfpWlhQyXALYUguVOvobRFJ7eJGFVsTFvatM4I3nzDUQHGJhYg4LQqE
 vCTYyVhn24AzoKKDRsj9djpE=
X-Google-Smtp-Source: AGHT+IEU7tDbaYXIIEdX2AsxFbniLlgQSQqW8nYhCAdNjVQSRSS1GI2maSEL+/FyTWNCDzKqI+mH8g==
X-Received: by 2002:a05:6000:2c2:b0:38f:503c:ad80 with SMTP id
 ffacd0b85a97d-38f6e74f395mr4222361f8f.5.1740178532809; 
 Fri, 21 Feb 2025 14:55:32 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f8602sm25218585f8f.94.2025.02.21.14.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 14:55:32 -0800 (PST)
To: buildroot@buildroot.org
Cc: Michael Walle <michael@walle.cc>, Niklas Cassel <niklas.cassel@wdc.com>,
 Romain Naour <romain.naour@smile.fr>
Date: Fri, 21 Feb 2025 23:55:25 +0100
Message-ID: <20250221225529.441084-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1740178533; x=1740783333; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TR+lbOWbzEUlyIVaG3715ZddcW5OZPNdh/PXsxuO3d0=;
 b=3PGIZETy/LPmfffM6qPcVfqNsD14NasFRys+RACYJUUWlYSDjlvQUkEcLF6fQdrvdx
 ISszKjuZGPJE9Eo9EFkiplSZRGJHDOSXjAwRSZGHLPGvqXNx0fTl9ovERqUVadoIY4kO
 EO7DSHn0mdTU+4Xd2Ttl8aRcXNtProRibQmy4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=3PGIZETy
Subject: [Buildroot] [PATCH v6 1/5] linux: add support for device tree
 overlays
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Walle <michael@walle.cc>

The linux kernel can build device tree overlays (.dtbo) itself. Add
support to build and copy them along with the actual device trees.
These can either be in-tree device tree overlays
(BR2_LINUX_KERNEL_INTREE_DTSO_NAMES) or they can be provided outside of
the kernel (BR2_LINUX_KERNEL_CUSTOM_DTS_PATH). In the latter case, the
overlay source files will be copied into the kernel tree first.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2: https://lore.kernel.org/buildroot/20240902112735.728574-1-michael@walle.cc/
---
 linux/Config.in | 14 +++++++++++---
 linux/linux.mk  |  7 +++++--
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 238ef4aada..ee4809b91b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -426,12 +426,20 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
 	  the trailing .dts. You can provide a list of
 	  dts files to build, separated by spaces.
 
+config BR2_LINUX_KERNEL_INTREE_DTSO_NAMES
+	string "In-tree Device Tree Overlay file names"
+	help
+	  Names of in-tree device tree overlay, without the trailing
+	  .dtso which should be built and installed into the target
+	  system, separated by spaces.
+
 config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	string "Out-of-tree Device Tree Source file paths"
 	help
-	  Paths to out-of-tree Device Tree Source (.dts) and Device Tree
-	  Source Include (.dtsi) files, separated by spaces. These files
-	  will be copied to the kernel sources and the .dts files will
+	  Paths to out-of-tree Device Tree Source (.dts), Device Tree
+	  Source Include (.dtsi) and Device Tree Overlay Source (.dtso)
+	  files, separated by spaces. These files will be copied to the
+	  kernel sources and the .dts files will
 	  be compiled from there.
 
 config BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME
diff --git a/linux/linux.mk b/linux/linux.mk
index 12699b8ee4..9c621c18d5 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -203,14 +203,17 @@ endif
 LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
 
 LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
+LINUX_DTSO_NAMES += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTSO_NAMES))
 
 # We keep only the .dts files, so that the user can specify both .dts
 # and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
 # copied to arch/<arch>/boot/dts, but only the .dts files will
 # actually be generated as .dtb.
-LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
+LINUX_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))
+LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(LINUX_CUSTOM_DTS_PATH))))
+LINUX_DTSO_NAMES += $(basename $(filter %.dtso,$(notdir $(LINUX_CUSTOM_DTS_PATH))))
 
-LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME))
+LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME)) $(addsuffix .dtbo,$(LINUX_DTSO_NAMES))
 
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
