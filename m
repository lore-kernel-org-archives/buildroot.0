Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39556C3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 10:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D986981EF9;
	Sat, 10 Aug 2024 10:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0lXPdOfN5n_K; Sat, 10 Aug 2024 10:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8FB081EFB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8FB081EFB;
	Sat, 10 Aug 2024 10:56:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6ED2B1BF4E5
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 10:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C84B401DF
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 10:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dSxjgbX36P-j for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 10:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B89E140141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B89E140141
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B89E140141
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 10:56:17 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0B2E4B0053D;
 Sat, 10 Aug 2024 12:56:12 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 12:56:06 +0200
Message-ID: <20240810105606.415339-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723287374;
 bh=aNVOkL4E7IqdUwFPjDOXysDLhFRe+HFiIPiJqabiShs=;
 h=From:To:Cc:Subject:Date:From;
 b=RWIm3xZ+S4WoP0vDDr0LoLYq4+Ivd9Zoed9muLNW4iRBWosjriRPwb0TzfA786uPo
 KEBfPBSb6HvD0edW4/TJMqOhmItgki2aTBllyfyweZ1M53G3XmNwiuPS4Ig8ZDgThT
 Hfcdq4OAsLx9j29BeWpGyMwyr05lhkFIZ796KgU2+908Xz8mdOYuMZki2ER2KOK9RQ
 bzAXAp4Bkki8jbi8FyH7Ron7I8ujEB69tO1p0qGv2FCKTUjpRPJSsAtUSQklFbtJiC
 PHJL1OhqSacnoWRwKyTuqqDOjepnVfTvQf/iAiA4e50MSdMFrXcJBLOcC4XXm4QYid
 u76S3JwAU9bRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RWIm3xZ+
Subject: [Buildroot] [PATCH 1/1] support/testing: package: mariadb: fix test
 configuration
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The mysql virtual package was removed in commit 8708f3a23a
"package/mysql: drop virtual package".

The mariadb runtime test was authored before this mysql virtual
package removal, but was merged after it, in commit 5356754d1e
"support/testing: add mariadb runtime test". Due to this, this test
always failed with the error:

    Makefile.legacy:9: *** "You have legacy configuration in your .config! Please check your configuration.".  Stop.

This commit fixes the issue by removing the legacy
BR2_PACKAGE_MYSQL=y configuration directive.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7540345406

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Note: this patch is not sufficient to run this runtime test
successfully. The mariadb package has other unrelated build issues.
See for example:
http://autobuild.buildroot.org/results/3106928a2d6b32acfb075a2840cf549a81784270/
---
 support/testing/tests/package/test_mariadb.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/tests/package/test_mariadb.py b/support/testing/tests/package/test_mariadb.py
index 523f075db1..d40ffdba96 100644
--- a/support/testing/tests/package/test_mariadb.py
+++ b/support/testing/tests/package/test_mariadb.py
@@ -19,7 +19,6 @@ class TestMariaDB(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.78"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
-        BR2_PACKAGE_MYSQL=y
         BR2_PACKAGE_MARIADB=y
         BR2_PACKAGE_MARIADB_SERVER=y
         BR2_TARGET_ROOTFS_EXT2=y
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
