Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8336CA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 14:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AFC584542;
	Sun, 24 Aug 2025 14:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LV1jQorxzzhm; Sun, 24 Aug 2025 14:27:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD48F84531
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD48F84531;
	Sun, 24 Aug 2025 14:27:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B6DE1D9
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C838405C4
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mYx8iM59xnwk for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 14:27:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEC2840319
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEC2840319
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:27:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A08687A39; Sun, 24 Aug 2025 14:27:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 16:26:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c627ac6b3f76e268515c045f8f912ad966382e6
X-Git-Newrev: 8d6f9393ec2ad039554b32b8c7da192559c7887a
X-Patchwork-Hint: ignore
Message-Id: <20250824142740.8A08687A39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_systemd_selinux: fix
 test after bootlin toolchains update
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8d6f9393ec2ad039554b32b8c7da192559c7887a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
the tests.init.test_systemd_selinux fails when building its
Kernel 6.1.26 with gcc 15.1.0.

This commit fixes the issue by updating the test Kernel to the
latest 6.1.y version (6.1.148 at the time of this commit) which
includes several fixes for gcc-15 like this one [2].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/10984685949
https://gitlab.com/buildroot.org/buildroot/-/jobs/10984685950

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=0f82f6f1556389d6489795f03ac3f68cde99d5ad

Signed-off-by: Julien Olivain <ju.o@free.fr>
[Romain: Add a link to one of the kernel commit related to gcc-15]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/init/test_systemd_selinux.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/init/test_systemd_selinux.py b/support/testing/tests/init/test_systemd_selinux.py
index e9bb3405cd..398cfbaa82 100644
--- a/support/testing/tests/init/test_systemd_selinux.py
+++ b/support/testing/tests/init/test_systemd_selinux.py
@@ -12,7 +12,7 @@ class TestSELinuxSystemd(infra.basetest.BRTest):
         BR2_INIT_SYSTEMD=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.148"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
