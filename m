Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B0CC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 21:59:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B23E6108E
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 21:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B23E6108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5698660890;
	Mon,  6 Sep 2021 21:59:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2WGA_tA2x6b7; Mon,  6 Sep 2021 21:59:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B370C6070F;
	Mon,  6 Sep 2021 21:59:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94F4C1BF291
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 21:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EADC6070F
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 21:59:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l7swSekq1-r3 for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 21:59:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB40D60705
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 21:59:43 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so782960wml.3
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 14:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gsbj0V7aS9ImVjhF25ny6hyTN3iUu40Z0xDOmPz3cog=;
 b=Aj4H7WmMeCuDvu/m0lGQ5HZG4iDgzamj0VKhT8GwGI3v3958by6D2Q0RfJMvrur3g5
 quJljlx+YhW4oYp+Xz6fqULGIkOsC23FjCFL38COPNLt/yeEWPEYqy0Yd0sH667469aa
 PptLtnSw5FsLjMduZdCNmW57o2G7DNWxiR8VPu6LuifrR0YD/VmzXZkZ0ATL/Es4XICC
 VV08CelT0KHpc10NzxoEMaT2tOERj8k85M50BaPzGjjk6PL2YYefqxy1QMsRNVh332Kw
 pvOm+65Yxqtv4SNbYyOpJES7oTUH7tLwHcuulO/ra/soJ/YEzwij+tWCxBpIdIofa0bf
 0Grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gsbj0V7aS9ImVjhF25ny6hyTN3iUu40Z0xDOmPz3cog=;
 b=oyat5E1YX7flxHWv6CMgaaHxZYi14/zP3QOOD6SdwG/J08Eso7o8QbSvc2qzEKhzYO
 A7vSotdDz+gTOs67HJQz0Iey4GUR5+uznElxwqYA0vMtnnQIC/o4NSnoCyBI8B0QNDX9
 bTUa9f+J6Nu588cTsliwf/L4COob2HqTYKkucLCyq57EEqBSGhk2TOkDl7Xm/QMl/itl
 5pPX76ZVnY6HZMh6mTZXpv7swXWKppNl/UQPQZnyWI3XoRA93rv3bIdVIvEikgKCqO42
 84n/lC18KbAO+n8pF41116W09UCC4NAmaFXWgUOZq6I/lsV74nJ5xZZT22DVaf1l3FmH
 qbHg==
X-Gm-Message-State: AOAM5335MQXUZTbQK5+jHNBp4e8vwnaz3ku7538TLCkvpLT70o9Vr5Pr
 RnlqaCDe61mv5nsyCHR4YfxqozUw8sY=
X-Google-Smtp-Source: ABdhPJy2jWx7+KYBZWP1aa86SKa4PcGS0BqWq7Eu3LhgtrPGUhochSjXbAyu7lUP1DEhlpZ4U3KJuw==
X-Received: by 2002:a05:600c:a49:: with SMTP id
 c9mr926070wmq.159.1630965581900; 
 Mon, 06 Sep 2021 14:59:41 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id w1sm643631wmc.19.2021.09.06.14.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 14:59:41 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Sep 2021 23:59:28 +0200
Message-Id: <20210906215928.2904480-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/testing: test_rust: remove kernel build
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
