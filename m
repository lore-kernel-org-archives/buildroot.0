Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C4EC531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 09:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5C00412ED;
	Fri, 23 Aug 2024 09:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQLDb8WR4fcu; Fri, 23 Aug 2024 09:03:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7720412E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7720412E4;
	Fri, 23 Aug 2024 09:03:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9CF7C1BF366
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 09:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8907081E7F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 09:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4B2ZEt9lOga for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 09:02:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA5DC81E80
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA5DC81E80
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 09:02:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1C6E86313; Fri, 23 Aug 2024 09:02:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 11:01:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 106a098b7bd5520385981366abf5ef423deb7517
X-Git-Newrev: 3da3361a1b9cafb274dac776693720fe20f6681b
X-Patchwork-Hint: ignore
Message-Id: <20240823090211.B1C6E86313@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: package: mariadb: fix
 test configuration
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3da3361a1b9cafb274dac776693720fe20f6681b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
