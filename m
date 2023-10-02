Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA95E748F8
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 16:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB85A403AC;
	Mon,  2 Oct 2023 16:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB85A403AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dEDOcFFKU4gd; Mon,  2 Oct 2023 16:52:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F29364031B;
	Mon,  2 Oct 2023 16:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F29364031B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EFEB1BF2B7
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 16:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76C2D4031B
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 16:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76C2D4031B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V9DAQUffOuc8 for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 16:52:42 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E64BF40315
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 16:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E64BF40315
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-406618d0991so29536855e9.2
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 09:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696265559; x=1696870359;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MKisSA3EWuBbamPGBcCjZHF4oVMojmxklR46e8ERhik=;
 b=BAKgz+nwHsuEPXI+nRlOthhXaBsXPJjYGU2O8m+uisZnJg30YXVtXlBWJ1T3JejzyA
 pzlWSqKFm+4kkJKSbqSIMkuLTbxdWdyiCla3h+9bSnMLfakM7Czwc5vsZqNn/UyKmuv0
 jSCbtcdXGoOvTTOTdy/VdteE8LRptq7FW4bY6sS+RVIDj3l4kxGYU0OxtO/FwcztfJYn
 Owfa0ks0w/o+sl7EU/hqWsr08GbyGEgCoE9U4Ku4YRkscsepfRMO1OJZHXjblWiTnAG+
 9EZ4OQzGyw0hoq4EMdI2mRY4PO9ZwHSmGKqL1J60jUUbHdlU7IH772YWl59yGIaNHgp1
 x78w==
X-Gm-Message-State: AOJu0YwngG+ugw1MZitoM8kD3UNV7c/6sQGHPaYCQ5hez09rRKAHhVpV
 19s2NfbCZxUpHvV64HYHsxC0Ce2GmSw=
X-Google-Smtp-Source: AGHT+IFLzec4dva8tzDDi33wmhRnrJ799whpJ89Hc17kJDpR/yqP2cphQh5aq6NJQgpKB7PT258yQA==
X-Received: by 2002:a05:600c:b49:b0:405:3e5e:6694 with SMTP id
 k9-20020a05600c0b4900b004053e5e6694mr10297256wmr.36.1696265559043; 
 Mon, 02 Oct 2023 09:52:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 w11-20020adff9cb000000b00326c952716esm6312841wrr.61.2023.10.02.09.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 09:52:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 18:52:35 +0200
Message-Id: <20231002165235.346092-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696265559; x=1696870359; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MKisSA3EWuBbamPGBcCjZHF4oVMojmxklR46e8ERhik=;
 b=CELPcTYdyNvpWRoc6B/qhSQPHzhVNfWr+brLReBKtRmEtHV2c8aFNA3wMxvIAX23By
 uRRiGHX4kzZpWxZMGKFj2ei+5w0/ftymFlR/u/RbJ58EXkD+i3JcmvlwGD1tnab5ug/3
 zZRjLjUcx3drtN9vlJHGTlgQKYkLIVlYF1nnO1NKY5o0/NrxS+ZwXMA4dmDc3er/Eacm
 +17BVrkUk4GY9bVLZezvtKbKDutDPHQHI2J/cuwOpRDLJN1jhOmq4YZNSXp1HDy6bbCt
 LcNX0BmsJFsaP9rGlarhn+sSQzoPgQS0YSS0Gm5c1CHLaJ8ozcTwaO6FhDIwgur9CBcb
 cTTg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CELPcTYd
Subject: [Buildroot] [PATCH 1/1] package/sunxi-tools: sunxi-fel needs
 dynamic library
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version
1.4.2-168-ged3039c in commit 2e330dff6a7ce7965ceb0dccdc9dcbcb329167bb:

/home/buildroot/autobuild/run/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/12.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: attempted static link of dynamic object `libfdt/libfdt-1.6.1.so'

Fixes:
 - http://autobuild.buildroot.org/results/6788d86c10d551b3d617e33c85083b817eb5d0b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sunxi-tools/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-tools/Config.in b/package/sunxi-tools/Config.in
index 14f7da5bf2..16550f4e55 100644
--- a/package/sunxi-tools/Config.in
+++ b/package/sunxi-tools/Config.in
@@ -23,6 +23,7 @@ config BR2_PACKAGE_SUNXI_TOOLS_BOOTINFO
 
 config BR2_PACKAGE_SUNXI_TOOLS_FEL
 	bool "sunxi-fel"
+	depends on !BR2_STATIC_LIBS # dtc
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_DTC
@@ -33,8 +34,8 @@ config BR2_PACKAGE_SUNXI_TOOLS_FEL
 	  fel mode. This allows do download code to memory and execute
 	  it.
 
-comment "sunxi-fel needs a toolchain w/ threads, gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+comment "sunxi-fel needs a toolchain w/ dynamic library, threads, gcc >= 4.9"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_SUNXI_TOOLS_NAND_PART
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
