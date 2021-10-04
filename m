Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2F4C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:10:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A340A6137C
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A340A6137C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FC264060C;
	Mon,  4 Oct 2021 20:10:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6xhXPAVKgXhm; Mon,  4 Oct 2021 20:10:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D234F40524;
	Mon,  4 Oct 2021 20:10:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0288D1BF97D
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37856833C6
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WuJ9g8_NpER4 for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 20:09:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75EC3833CA
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 20:09:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 86DE38E6D9; Mon,  4 Oct 2021 20:07:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 21:16:43 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 29d2920dd9c463a253c732f45b2ad84ba34fe425
X-Git-Newrev: 6a2d6ade137046ad4c1018a9ee4773b1263c980b
X-Patchwork-Hint: ignore
Message-Id: <20211004200711.86DE38E6D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] support/testing:
 test_iso9660: bump to kernel 4.19.204
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a2d6ade137046ad4c1018a9ee4773b1263c980b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The kernel 4.11 curently used by the test doesn't build with host
gcc >= 10 due the gcc default -fno-common. See GCC 10 porting guide [1].

/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x20): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

Update to the latest 4.19 LTS version but doing so requires to
disable CONFIG_RETPOLINE since the toolchain is not retpoline
capable [2].

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1564202078

[1] https://gcc.gnu.org/gcc-10/porting_to.html
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=8c4ad5d39144776c2987e81609204e1766ed4190

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 23a8baa779825554105c6b002d4acbe4e9bbe340)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/conf/minimal-x86-qemu-kernel.config | 1 +
 support/testing/tests/fs/test_iso9660.py            | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/conf/minimal-x86-qemu-kernel.config b/support/testing/conf/minimal-x86-qemu-kernel.config
index cc8ee6a713..45994f804d 100644
--- a/support/testing/conf/minimal-x86-qemu-kernel.config
+++ b/support/testing/conf/minimal-x86-qemu-kernel.config
@@ -2,6 +2,7 @@ CONFIG_SYSVIPC=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_SMP=y
+# CONFIG_RETPOLINE is not set
 CONFIG_HYPERVISOR_GUEST=y
 CONFIG_PARAVIRT=y
 CONFIG_NET=y
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 68f4840852..412430318b 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -18,7 +18,7 @@ BASIC_CONFIG = \
     BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
     BR2_LINUX_KERNEL=y
     BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-    BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
+    BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
     BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
     BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="{}"
     # BR2_TARGET_ROOTFS_TAR is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
