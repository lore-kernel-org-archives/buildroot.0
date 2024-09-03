Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6D5CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 18:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 346B340A97;
	Tue,  3 Sep 2024 18:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8n0xOrz-_-ds; Tue,  3 Sep 2024 18:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF5FF40A91
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF5FF40A91;
	Tue,  3 Sep 2024 18:38:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2AD8E1BF95D
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42D3E40A02
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aiEu6-IJIutL for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 18:38:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DE8440A1D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DE8440A1D
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 18:38:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A79E86AB8; Tue,  3 Sep 2024 18:38:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 20:22:01 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 11dda46ff2b76a1d9e2737dc598a2c74e328f7e8
X-Git-Newrev: e0fcc10522e9629260e6d58008170ca432b16396
X-Patchwork-Hint: ignore
Message-Id: <20240903183810.3A79E86AB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] support/testing: package:
 mariadb: fix test configuration
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0fcc10522e9629260e6d58008170ca432b16396
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

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
(cherry picked from commit 3da3361a1b9cafb274dac776693720fe20f6681b)
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
