Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E94C432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 19:28:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C14F61057
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 19:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C14F61057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F8C980D60;
	Tue, 31 Aug 2021 19:28:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lLYx3kbm0V7T; Tue, 31 Aug 2021 19:28:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A27E8101B;
	Tue, 31 Aug 2021 19:28:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 302661BF362
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 19:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FA4260655
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 19:27:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nLohL4yKhuaU for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 19:27:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F22E46060C
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 19:27:51 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so259038wms.2
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 12:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=prUfEkY504Vr8F2Xhts4Ka+BvRjc9Xg7aT7af/gk0ZM=;
 b=bVYCow8BRy0UIj1xj2tex3c8DW+T3iCQBkaVePsiqCL987TaLz8xem16oOGsgfb5JL
 nMyMnzKeHJd4pirytMBR0vOL64DdOBQaAQHDJseAuwhQOGgsmYCsWSYpPBiB9w9zjfFI
 83Bm7LzLY/2HYnfj1k5rAlCewy/mp/rxEpgJq5i8rBmqrQ102UXR5UGsCMS/wCS34FXz
 mmKFQD3Noy+Giyx7mc3TSAPmOzyXP+LhoGdztIKIuYkIhNXjxsa5HCVzqnD9C9KOUcQv
 AwLc4a6VTt/gX//D1bL763Ia5wkYXYlChaP3LYX2UPNeF+nE9ghQIDJVwjhpf7az6dAi
 N0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=prUfEkY504Vr8F2Xhts4Ka+BvRjc9Xg7aT7af/gk0ZM=;
 b=Y4ZJUrwG0vpgpeiVSoiL/VvtYTqMoJ6Wpg3oIMa7l2HSeFL62cKuAyIZ/xfzuKo3KZ
 Qr4Q8bLWU5luzGjpCLp0dymdEQWobR4J3DG4GFcKjIM6BDNKrpgKafTwLrL8SDdni/X1
 YSSt20nAgGVcPDPApMOojYO1BqAFsWpmoGMDlFB1rJfcSpJ9qXQpssCKjivSKOv+vC4N
 HcJIAKecKv8MdcpcXAV3MGUGKaXi/mkbe4F4tMbmuMDLtJpC8aTN8eXshdycDHSZaDnN
 bWAost7TMWualHHyL9SL61/fMchXu5FVKmJfkEPDOC+QoixnPRhEo7YK6Hs4ai59u8aG
 CsqQ==
X-Gm-Message-State: AOAM531sYuNT8hIpSTIwuLVJYap283UNvHlGN7JbiK/kqvY+bvyTYpNj
 ues5Ue/xax/LjFYaiZL9A8ptjNQxpSo=
X-Google-Smtp-Source: ABdhPJyOl4hGv/95g9Dz+glwKFXbkyFqs55K9Jmn5kBzxYx9MOV/w4HBmK351nbjBa1GzlJD/TO+jw==
X-Received: by 2002:a1c:730a:: with SMTP id d10mr5950502wmb.59.1630438070343; 
 Tue, 31 Aug 2021 12:27:50 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id o12sm3274929wmr.2.2021.08.31.12.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 12:27:50 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Aug 2021 21:27:28 +0200
Message-Id: <20210831192729.407412-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210831192729.407412-1-romain.naour@gmail.com>
References: <20210831192729.407412-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [for-next 2/3] toolchain/toolchain-external: update Arm
 AArch64 toolchain 10.3-2021.07
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Update to gcc 10.3, gdb 10.2, binutils 2.36.1, glibc 2.33.

Remove BR2_TOOLCHAIN_HAS_NATIVE_RPC since the support for obsolete
RPC was finally dropped in glibc in 2.32 (2020-08-04).

See "Release Note":
https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads#

Tested with qemu_aarch64_virt_defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-arm-aarch64/Config.in                | 3 +--
 .../toolchain-external-arm-aarch64.hash                     | 6 +++---
 .../toolchain-external-arm-aarch64.mk                       | 6 +++---
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index b6062846a4..4557debe5d 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -1,12 +1,11 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
-	bool "Arm AArch64 2020.11"
+	bool "Arm AArch64 2021.07"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HAS_FORTRAN
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
index 90abe56d64..ca1ea48bcb 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-2020.11/binrel/gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu.tar.xz.asc
-md5  d6e6676d31c51405ae0fc7687ef0a224  gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz.asc
+md5  07bbe2b5277b75ba36a924e9136366a4  gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz
 # locally calculated
-sha256  fe7f72330216612de44891ebe5e228eed7c0c051ac090c395b2b33115c6f5408  gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu.tar.xz
+sha256  1e33d53dea59c8de823bbdfe0798280bdcd138636c7060da9d77a97ded095a84  gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
index 583e4a763d..356e0810b3 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2020.11
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2021.07
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-10.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
 
 $(eval $(toolchain-external-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
