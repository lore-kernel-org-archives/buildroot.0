Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DDECA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 00:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 635CE83759;
	Sat, 16 Aug 2025 00:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCiRhQhcnSZr; Sat, 16 Aug 2025 00:11:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 994518376B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 994518376B;
	Sat, 16 Aug 2025 00:11:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 645E9959
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 00:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A07740C80
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 00:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aCTdaL3pQ2Up for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 00:11:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 65EE140C82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65EE140C82
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65EE140C82
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 00:11:52 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2001:18c0:a22:bf00:5c2b:f296:f108:6612])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id F236578035E;
 Sat, 16 Aug 2025 02:11:48 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat, 16 Aug 2025 02:11:17 +0200
Message-ID: <20250816001117.246947-1-ju.o@free.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755303110;
 bh=NoZAjIPNy1L2SFa3QwbvWv8cQDgjDubYZqI2U5mj06w=;
 h=From:To:Cc:Subject:Date:From;
 b=oBxIfkJeiBsvggA00vXY3ADzZ6+xeclPkGMBM4NQT7II7YL3JKhL/z2AK83hph5CI
 vD8m0NHyeJRmdQyP5ljjo78hDRzWEfUad26Et8ztZoSiICScsHybZJjPdpbWswgBNS
 T1dH07RKc6q3+uWUXWesjIaoY3BUHJFMbDJct+mKhXaP9Azg/w3VfXLyQzzTLZuMwj
 v3ZNJZqSZgP1I3RzfsDcm1Dq3NtvT4R5agfrmSZroBpLkrWKXl6utR+HZxC5lgXkOE
 tgE/B/FPi10tCQROX52ZRYtyqkl/ipGDmhETKJTVRnRK0Qz2oSTr/IIWY8SKhKup5B
 /RKEBC4D7HkLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=oBxIfkJe
Subject: [Buildroot] [PATCH 1/1] support/testing: test_dpdk: fix test after
 bootlin toolchains update
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
the tests.package.test_dpdk fails to build its Kernel 6.6.58 with
gcc 15.1.0.

This commit fixes the issue by updating the test Kernel version to
the latest 6.6.y version (6.6.102 at the time of this commit) which
includes the fix for gcc-15.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/10984686010

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_dpdk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_dpdk.py b/support/testing/tests/package/test_dpdk.py
index de2828298a..6f55cddee8 100644
--- a/support/testing/tests/package/test_dpdk.py
+++ b/support/testing/tests/package/test_dpdk.py
@@ -11,7 +11,7 @@ class TestDPDK(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.58"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.102"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
