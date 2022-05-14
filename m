Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE454C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7516741751;
	Sat, 14 May 2022 09:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eb3LSyaRqVE9; Sat, 14 May 2022 09:54:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0661A416D0;
	Sat, 14 May 2022 09:54:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EB411BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AFB383FB4
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kf_7nEgHg5rg for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBF6283FBB
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 790358376C; Sat, 14 May 2022 09:39:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 11:44:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e66cac7631dd6c9e83c82af3f19b9cc0d3f15ab7
X-Git-Newrev: 447e6f08115f646242b5f5bd8fa7e51c5e96ab5b
X-Patchwork-Hint: ignore
Message-Id: <20220514093944.790358376C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_zfs: add missing
 libelf dependency
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
Content-Type: multipart/mixed; boundary="===============6589606296532262149=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6589606296532262149==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=447e6f08115f646242b5f5bd8fa7e51c5e96ab5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While building the kernel tools, libelf header is missing:

output/TestZfsGlibc/build/linux-5.15.35/tools/objtool/include/objtool/elf.h:10:10: fatal error: gelf.h: No such file or directory
   10 | #include <gelf.h>

Select BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF to build host-libelf.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2429014008

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/test_zfs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
index e3784f7d7d..688b60d7c4 100644
--- a/support/testing/tests/package/test_zfs.py
+++ b/support/testing/tests/package/test_zfs.py
@@ -15,6 +15,7 @@ class TestZfsBase(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.35"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
         BR2_PACKAGE_ZFS=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_CFFI=y

--===============6589606296532262149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6589606296532262149==--
