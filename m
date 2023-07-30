Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89900C001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D97E660A9B;
	Sun, 30 Jul 2023 10:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D97E660A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dy3XcQTd68Bv; Sun, 30 Jul 2023 10:12:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CAB560AAE;
	Sun, 30 Jul 2023 10:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CAB560AAE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DD041BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17FB840193
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17FB840193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mB3GpwX8bKlP for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:11:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE0614010D
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE0614010D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C91F783867; Sun, 30 Jul 2023 10:11:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:10:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7205df8a4f3c729b11a5f0c34885e6cf592f24b9
X-Git-Newrev: f2040c09e6160407e66fa42a90be67a1b8b2baeb
X-Patchwork-Hint: ignore
Message-Id: <20230730101157.C91F783867@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestSELinuxSystemd{Ext4,
 Squashfs} add midding libelf kernel dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f2040c09e6160407e66fa42a90be67a1b8b2baeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

objtool built by the kernel requires libelf

ldd TestSELinuxSystemdExt4/build/linux-6.1.26/tools/objtool/objtool
  linux-vdso.so.1
  libelf.so.1 => TestSELinuxSystemdExt4/host/lib/libelf.so.1

While updating the kernel used in TestSELinuxSystemd [1] we
forgot to select BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF to provide
Buildroot's host-libelf. Using host-libelf avoid linking with
libelf installed on the host or failing to build objtool if
libelf is not installed.

[1] 60b84fb7ce4612b2b14a675e28331111468e1f2b

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186370 (TestSELinuxSystemdSquashfs)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186368 (TestSELinuxSystemdExt4)

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/init/test_systemd_selinux.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/init/test_systemd_selinux.py b/support/testing/tests/init/test_systemd_selinux.py
index 5f91243f37..fab23e3330 100644
--- a/support/testing/tests/init/test_systemd_selinux.py
+++ b/support/testing/tests/init/test_systemd_selinux.py
@@ -15,6 +15,7 @@ class TestSELinuxSystemd(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
         BR2_PACKAGE_LIBSELINUX=y
         BR2_PACKAGE_REFPOLICY=y
         """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
