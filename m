Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4501C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 11:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82B0142916;
	Sat, 28 May 2022 11:08:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n7wh2VbsW7Xi; Sat, 28 May 2022 11:08:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ADCC429C5;
	Sat, 28 May 2022 11:08:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 157E71BF95F
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 11:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAB52847B0
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 11:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xTm-DFHUBsPC for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 11:05:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A1C08482B
 for <buildroot@buildroot.org>; Sat, 28 May 2022 11:05:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A65A385EB2; Sat, 28 May 2022 10:53:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 13:00:36 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 22775927fc26dbe2c08adc8bca9b0e986de53c5e
X-Git-Newrev: 55c4364740e14cd7d31a11712e279fd10aada957
X-Patchwork-Hint: ignore
Message-Id: <20220528105354.A65A385EB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] support/testing:
 test_lxc: bump kernel version to 5.15.38 for complete pidfds support
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

commit: https://git.buildroot.net/buildroot/commit/?id=55c4364740e14cd7d31a11712e279fd10aada957
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

As reported by [1], the lxc test is broken since lxc >= 4.0.11.
A patch was added to lxc 4.0.11 to use the new mount api for devpts
setup [2] but the fall back code doesn't work when this new mount
API is not supported. This API was added in kernel 5.6.

(kernel 5.5)
DEBUG conf - conf.c:lxc_setup_devpts_child:1682 - No new devpts instance will be
mounted since no pts devices are required
lxc-start lxc_iperf3  DEBUG conf - conf.c:lxc_setup_dev_console:1966 - Cleared
all (0) mounts from "/dev/console"
lxc-start lxc_iperf3  ERROR mount_utils - mount_utils.c:mount_at:661 - No such
file or directory - Failed to mount "/proc/self/fd/44" to "/proc/self/fd/43"
lxc-start lxc_iperf3  ERROR conf - conf.c:lxc_setup_dev_console:1988 - No such
file or directory - Failed to mount "10(/dev/pts/0)" on "43"
lxc-start lxc_iperf3  ERROR conf - conf.c:lxc_setup_console:2143 - No such file
or directory - Failed to setup console

(kernel 5.6)
lxc-start lxc_iperf3  TRACE mount_utils - mount_utils.c:can_use_mount_api:582 -
Kernel supports mount api
lxc-start lxc_iperf3  TRACE mount_utils - mount_utils.c:move_detached_mount:328
- Attach detached mount 45 to filesystem at 43
lxc-start lxc_iperf3  TRACE conf - conf.c:lxc_setup_dev_console:1990 - Setup
console "/dev/pts/0"

Bump the kernel to the current LTS 5.15.38 version that fully support the
mount API needed by lxc.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2429013708

[1] http://lists.busybox.net/pipermail/buildroot/2022-January/635251.html
[2] https://github.com/lxc/lxc/commit/be606e16fd0fa967219d890745a425625eafe251

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ca135c99395b1046cce27bb10a8010791b893271)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_lxc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_lxc.py b/support/testing/tests/package/test_lxc.py
index d98bed8761..f66b31f3ba 100644
--- a/support/testing/tests/package/test_lxc.py
+++ b/support/testing/tests/package/test_lxc.py
@@ -12,7 +12,7 @@ class TestLxc(infra.basetest.BRTest):
             BR2_TOOLCHAIN_EXTERNAL=y
             BR2_LINUX_KERNEL=y
             BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-            BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+            BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.38"
             BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
             BR2_LINUX_KERNEL_DTS_SUPPORT=y
             BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
