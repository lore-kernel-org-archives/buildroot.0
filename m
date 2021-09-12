Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B992DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:12:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6005A60FED
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6005A60FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1602460BE9;
	Sun, 12 Sep 2021 14:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4RnZIrvA-BtX; Sun, 12 Sep 2021 14:12:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 702D360BE6;
	Sun, 12 Sep 2021 14:12:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 142E91BF471
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 043A7404C2
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8X3--hckCuIB for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 14:11:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54FDB404CF
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 14:11:51 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t8so5367724wrq.4
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gsbj0V7aS9ImVjhF25ny6hyTN3iUu40Z0xDOmPz3cog=;
 b=OuHcVUPaete25mJBU+VJ32Je9BoPmw/+P4XWN27XggYVIOyvF8ogz3szYqcQj8g64+
 YX9BtfkdRV5Al2SDMSt22VEkv1/OG1JWCkULTnnf/j4NrodReyLlwC/8XABQLWGjLtlN
 tkjw2C+F66yQZSSo7gK5MuCozP7pMCZStTEQCohLC19WXeC8e8WyAtNA0hxIyZXBptFp
 +Fptd8/c8l9k9nlJYAc5IVEyoOPhT10+DcSvMHb1G1+2NXX7FVaK5ZUsLFXxzwBULO7Q
 PnQiuy2HPos1HUWc1EW0Zze4zqxmonpQ3oa489KaKR+eWY+HKjdfSqaUbCmIikU8CzJq
 D4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gsbj0V7aS9ImVjhF25ny6hyTN3iUu40Z0xDOmPz3cog=;
 b=IL7aHPxJBcu7s/LlFuk2N0pyTN21nB/7sPb88JC69WUDwUsDtL9gFFXNZgJIFrgAiN
 pMtip37KgVhgH2+fKjxaZ0+d0j7rWlAFOHBWABfkHSqGts+7IQPaG0DT10NLLLZ1ZXan
 oRqlpHq7OWIPc1vD9LN6opAQCg6y3XpA0wnEwyUq6Iee1ux7sNfjBzmGRYFQwOVHMH/c
 Uarg6ABLhfGfz4CtUchYkvgj3yLeRs18wOWcIrth0oCaQ/TTHnrxhHF6dH32kQ8JlptN
 qSMGOoirbA6yqhLlfL6J6UxpjbfXwM2lnZIST5khB3keFHFCaXH1Q4s0dq9DBEKBJgyk
 5klg==
X-Gm-Message-State: AOAM532RxJXnke6KAi6jvAVOt5bRh3pASROk4B00f7wn5OqT/YEl7W+q
 K6qUmIW8CBhu9jGrXs4S7tR/hgCpmxA=
X-Google-Smtp-Source: ABdhPJxOs97UtAMSOdIl1axUarlaJ981vrIsL4Vt5RdCR/gjHpdNd+vhEHaRjMk0rw0SDwR+nIlcdA==
X-Received: by 2002:adf:f101:: with SMTP id r1mr7429528wro.355.1631455909676; 
 Sun, 12 Sep 2021 07:11:49 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id i5sm4570062wrc.86.2021.09.12.07.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 07:11:49 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 16:11:32 +0200
Message-Id: <20210912141140.253778-6-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912141140.253778-1-romain.naour@gmail.com>
References: <20210912141140.253778-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 08/16] support/testing: test_rust: remove kernel
 build
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

This test already use builtin kernel provided by the testsuite infra:

    self.emulator.boot(arch="armv7",
                       kernel="builtin",
                       options=["-initrd", img])

But a second kernel is build from the its defconfig. This second kernel
is not used by the test.

The TestRust (using BR2_PACKAGE_HOST_RUST=y) is really long to build,
same some cpu time by removing the kernel build.

This unused kernel (based on 4.11.3 release) don't even build with host
gcc >= 10.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/package/test_rust.py | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index cd5dccf8e1..884b40a4a3 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -65,12 +65,6 @@ class TestRustBin(TestRustBase):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_SYSTEM_DHCP="eth0"
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
-        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
-        BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_PACKAGE_HOST_RUSTC=y
@@ -92,12 +86,6 @@ class TestRust(TestRustBase):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_SYSTEM_DHCP="eth0"
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
-        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
-        BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_PACKAGE_HOST_RUSTC=y
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
