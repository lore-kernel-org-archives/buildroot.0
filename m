Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CB6C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:42:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB8DF60F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB8DF60F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CF234045A;
	Tue,  3 Aug 2021 21:42:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jnuBjc0u2yw5; Tue,  3 Aug 2021 21:42:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D564B403CC;
	Tue,  3 Aug 2021 21:42:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B1B31BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DA2F8398E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SPeUwt_b4S4y for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BA6A835C9
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D64F3860D3; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 26 Jun 2021 22:16:40 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 37a1af7a74e57e42ff6beefb8a7fdcae01a00ff7
X-Git-Newrev: abe32cfdf0dda17af10d290fe1cb33c0fc60a076
X-Patchwork-Hint: ignore
Message-Id: <20210803210956.D64F3860D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing/tests: fix
 tests to use infra.img_round_power2()
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=abe32cfdf0dda17af10d290fe1cb33c0fc60a076
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

All the tests that are using if=sd as a Qemu options are changed to
use infra.img_round_power2() instead of simply extending the size of
the image to the next MB boundary, which is not longer sufficient with
Qemu >= 5.1.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: drop now-useless imports]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/core/test_file_capabilities.py | 3 +--
 support/testing/tests/fs/test_squashfs.py            | 3 +--
 support/testing/tests/init/base.py                   | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/core/test_file_capabilities.py b/support/testing/tests/core/test_file_capabilities.py
index b9ece18d7b..d797769ddd 100644
--- a/support/testing/tests/core/test_file_capabilities.py
+++ b/support/testing/tests/core/test_file_capabilities.py
@@ -1,5 +1,4 @@
 import os
-import subprocess
 
 import infra.basetest
 
@@ -28,7 +27,7 @@ class TestFileCapabilities(infra.basetest.BRTest):
 
     def test_run(self):
         img = os.path.join(self.builddir, "images", "rootfs.squashfs")
-        subprocess.call(["truncate", "-s", "%1M", img])
+        infra.img_round_power2(img)
 
         self.emulator.boot(arch="armv7",
                            kernel=os.path.join(self.builddir, "images", "zImage"),
diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
index 3e58a12ab7..745f93ee55 100644
--- a/support/testing/tests/fs/test_squashfs.py
+++ b/support/testing/tests/fs/test_squashfs.py
@@ -1,5 +1,4 @@
 import os
-import subprocess
 
 import infra.basetest
 
@@ -22,7 +21,7 @@ class TestSquashfs(infra.basetest.BRTest):
         self.assertEqual(out[3], "Compression lz4")
 
         img = os.path.join(self.builddir, "images", "rootfs.squashfs")
-        subprocess.call(["truncate", "-s", "%1M", img])
+        infra.img_round_power2(img)
 
         self.emulator.boot(arch="armv7",
                            kernel="builtin",
diff --git a/support/testing/tests/init/base.py b/support/testing/tests/init/base.py
index 80f7731ba3..6a85b87783 100644
--- a/support/testing/tests/init/base.py
+++ b/support/testing/tests/init/base.py
@@ -1,5 +1,4 @@
 import os
-import subprocess
 import infra.basetest
 
 
@@ -7,7 +6,7 @@ class InitSystemBase(infra.basetest.BRTest):
 
     def start_emulator(self, fs_type, kernel=None, dtb=None, init=None):
         img = os.path.join(self.builddir, "images", "rootfs.{}".format(fs_type))
-        subprocess.call(["truncate", "-s", "%1M", img])
+        infra.img_round_power2(img)
 
         options = ["-drive",
                    "file={},if=sd,format=raw".format(img),
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
