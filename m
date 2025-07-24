Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD5BC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 10:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D62A41256;
	Thu, 24 Jul 2025 10:32:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uApXie9S2Yci; Thu, 24 Jul 2025 10:32:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2DEA41257
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2DEA41257;
	Thu, 24 Jul 2025 10:32:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B771115
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 10:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 722916117B
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 10:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9HYQYmruu0k for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 10:32:36 +0000 (UTC)
X-Greylist: delayed 431 seconds by postgrey-1.37 at util1-new.osuosl.org;
 Thu, 24 Jul 2025 10:32:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7427D60E74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7427D60E74
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.248.49.38;
 helo=mx.socionext.com; envelope-from=hayashi.kunihiko@socionext.com;
 receiver=<UNKNOWN> 
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7427D60E74
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 10:32:36 +0000 (UTC)
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
 by mx.socionext.com with ESMTP; 24 Jul 2025 19:25:22 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
 by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id A2FCE2069FF1
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:25:22 +0900 (JST)
Received: from kinkan3.css.socionext.com ([172.31.9.51]) by m-FILTER with
 ESMTP; Thu, 24 Jul 2025 19:25:22 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
 by kinkan3.css.socionext.com (Postfix) with ESMTP id 44BF41C5A;
 Thu, 24 Jul 2025 19:25:22 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: buildroot@buildroot.org
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Date: Thu, 24 Jul 2025 19:25:14 +0900
Message-Id: <20250724102514.2188530-1-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=socionext.com
Subject: [Buildroot] [PATCH] package/qemu: add zstd support
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

Add optional zstd compression type support for QEMU.

In order to a file compressed with zstd on host to be applied to
target QEMU, zstd on both host and target should be enabled.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 package/qemu/qemu.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index fdc8591e546a..a1a4b60855d7 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -271,6 +271,13 @@ else
 QEMU_OPTS += --disable-install-blobs
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+QEMU_OPTS += --enable-zstd
+QEMU_DEPENDENCIES += zstd
+else
+QEMU_OPTS += --disable-zstd
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define QEMU_CONFIGURE_CMDS
@@ -460,6 +467,13 @@ else
 HOST_QEMU_OPTS += --disable-libusb
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_ZSTD),y)
+HOST_QEMU_OPTS += --enable-zstd
+HOST_QEMU_DEPENDENCIES += host-zstd
+else
+HOST_QEMU_OPTS += --disable-zstd
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define HOST_QEMU_CONFIGURE_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
