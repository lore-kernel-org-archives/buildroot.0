Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC2BC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 16:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4C5F415F5;
	Wed, 27 Jul 2022 16:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4C5F415F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YX-fkr2t-6NV; Wed, 27 Jul 2022 16:32:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A059D415AA;
	Wed, 27 Jul 2022 16:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A059D415AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F2321BF422
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 16:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18BF6415AA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 16:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18BF6415AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGt4vTrYiphr for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 16:31:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34353415A7
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 16:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34353415A7
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B84AE8670A; Wed, 27 Jul 2022 16:18:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 18:30:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8dce595a68bf86b351f2b990c5c489a21e1e5064
X-Git-Newrev: 86d32208b62ab42ae43f1f4cc36d5840036841ec
X-Patchwork-Hint: ignore
Message-Id: <20220727161803.B84AE8670A@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/init/test_systemd.py: use downloaded kernel
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

commit: https://git.buildroot.net/buildroot/commit/?id=86d32208b62ab42ae43f1f4cc36d5840036841ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since systemd requires a relatively new kernel, we switched to a
self-built 4.19.204 kernel. However, since then, the downloaded kernel
used by the tests has been updated to 5.10, which is certainly recent
enough to support systemd. Switch to this one. This reduces the test
time significantly.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/init/test_systemd.py | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 80c6776f59..be28209ba0 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -11,18 +11,11 @@ class InitSystemSystemdBase(InitSystemBase):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_INIT_SYSTEMD=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
-        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
-        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
-        BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
         # BR2_TARGET_ROOTFS_TAR is not set
-        """.format(infra.filepath("conf/binfmt-misc-kernel-fragment.config"))
+        """
 
     def check_systemd(self, fs):
-        self.start_emulator(fs, "zImage", "vexpress-v2p-ca9")
+        self.start_emulator(fs)
         self.check_init("/lib/systemd/systemd")
 
         # Test all units are OK
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
