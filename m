Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E18BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 09:55:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CABA260FDC
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 09:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CABA260FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FB0C80DAB;
	Mon, 25 Oct 2021 09:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lB146kjppScr; Mon, 25 Oct 2021 09:55:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 091BE80DA5;
	Mon, 25 Oct 2021 09:55:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C00181BF3D6
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 09:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBCD040001
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 09:55:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hb3LVnyvSww2 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 09:55:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA6544026F
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 09:55:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2B66C886EF; Mon, 25 Oct 2021 09:51:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 10:48:32 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: fa110027d06cb3f0f4758931fc34b075fa8665b2
X-Git-Newrev: 6dd39d5fd1247e38d4a5108f603b210fde543917
X-Patchwork-Hint: ignore
Message-Id: <20211025095155.2B66C886EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] support/testing:
 test_ubi: reduce the rootfs.ubi size to 64M to match the Qemu emulated
 flash device
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

commit: https://git.buildroot.net/buildroot/commit/?id=6dd39d5fd1247e38d4a5108f603b210fde543917
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The size of the cfi flash device emulated by Qemu is 64M not 128M [1].
Since Qemu >= 4.0, the size of the device must match the size of the block backend [2].

Fixes:

  qemu-system-arm: device requires 67108864 bytes, block backend provides 134217728 bytes

[1] https://git.qemu.org/?p=qemu.git;a=blob;f=hw/arm/vexpress.c;h=58481c07629aedb09864dcc72757ff7947e733bb;hb=f9baca549e44791be0dd98de15add3d8452a8af0#l50
[2] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=06f1521795207359a395996c253c306f4ab7586e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6f9e83f5f74da4c8f9a210fb586542eba08c4080)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/fs/test_ubi.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
index 7321f83da9..8148e5f336 100644
--- a/support/testing/tests/fs/test_ubi.py
+++ b/support/testing/tests/fs/test_ubi.py
@@ -25,7 +25,7 @@ class TestUbi(infra.basetest.BRTest):
         out = out.splitlines()
         self.assertIn("UBI image, version 1", out[0])
 
-        subprocess.call(["truncate", "-s 128M", img])
+        subprocess.call(["truncate", "-s 64M", img])
 
         self.emulator.boot(arch="armv7",
                            kernel="builtin",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
