Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A07C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 16:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38B4C40A88;
	Tue, 16 Aug 2022 16:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38B4C40A88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xXV0rVYagpdK; Tue, 16 Aug 2022 16:12:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DA8A4020B;
	Tue, 16 Aug 2022 16:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DA8A4020B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0CF81BF392
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 16:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C113941675
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 16:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C113941675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TuC5UYsmEJ-H for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 16:12:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7683F4160D
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 16:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7683F4160D
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8BE9A8783E; Tue, 16 Aug 2022 15:58:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 18:08:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd2e82b581f0926c3856d84df51ec52ddcc1277b
X-Git-Newrev: 0214ee94e072f0a0c57c63484e6d2b3f0157c5fb
X-Patchwork-Hint: ignore
Message-Id: <20220816155813.8BE9A8783E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/fs/test_f2fs: fix
 test after f2fs-tools bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=0214ee94e072f0a0c57c63484e6d2b3f0157c5fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit
9267b0f14d3d5f4715bad444f44eae47d9d5627c ("package/f2fs-tools: bump to
version 1.15.0"), f2fs-tools was bumped from 1.14.0 to 1.15.0.

It turns out that this version bump causes the output of dump.f2fs to
slightly change.

In version 1.14.0, it looked like this:

Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 262144 (128 MB)
Info: MKFS version
  "Linux version 5.4.0-124-generic (buildd@lcy02-amd64-089) (gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)) #140-Ubuntu SMP Thu Aug 4 02:23:37 UTC 2022"
Info: FSCK version
  from "Linux version 5.4.0-124-generic (buildd@lcy02-amd64-089) (gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)) #140-Ubuntu SMP Thu Aug 4 02:23:37 UTC 20
22"
    to "Linux version 5.4.0-124-generic (buildd@lcy02-amd64-089) (gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)) #140-Ubuntu SMP Thu Aug 4 02:23:37 UTC 20
22"
Info: superblock features = 0 :
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: total FS sectors = 262144 (128 MB)
Info: CKPT version = 70c101c3
Info: checkpoint state = 181 :  trimmed nat_bits unmount

In version 1.15.0, it looked like this:

Info: MKFS version
  "Linux version 5.4.0-124-generic (buildd@lcy02-amd64-089) (gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)) #140-Ubuntu SMP Thu Aug 4 02:23:37 UTC 2022"
Info: FSCK version
  from "Linux version 5.4.0-124-generic (buildd@lcy02-amd64-089) (gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)) #140-Ubuntu SMP Thu Aug 4 02:23:37 UTC 20
22"
    to "Linux version 5.4.0-124-generic (buildd@lcy02-amd64-089) (gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)) #140-Ubuntu SMP Thu Aug 4 02:23:37 UTC 20
22"
Info: superblock features = 0 :
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: Segments per section = 1
Info: Sections per zone = 1
Info: total FS sectors = 262144 (128 MB)
Info: CKPT version = b89f8bb
Info: checkpoint state = 181 :  trimmed nat_bits unmount

You will notice that the message "Info: total sectors = 262144 (128
MB)" is no longer present, and only "Info: total FS sectors =
262144 (128 MB)" is not present.

Except our test case was precisely looking for this "Info: total
sectors" string in the output, causing the test to fail.

We fix this by simply matching on "Info: total FS sectors" now.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/2884634814

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/fs/test_f2fs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_f2fs.py b/support/testing/tests/fs/test_f2fs.py
index 2d05a86418..425fbe31ca 100644
--- a/support/testing/tests/fs/test_f2fs.py
+++ b/support/testing/tests/fs/test_f2fs.py
@@ -30,7 +30,7 @@ class TestF2FS(infra.basetest.BRTest):
         img = os.path.join(self.builddir, "images", "rootfs.f2fs")
         out = infra.run_cmd_on_host(self.builddir, ["host/sbin/dump.f2fs", img])
         out = out.splitlines()
-        prop = dumpf2fs_getprop(out, "Info: total sectors")
+        prop = dumpf2fs_getprop(out, "Info: total FS sectors")
         self.assertEqual(prop, "262144 (128 MB)")
 
         kernel = os.path.join(self.builddir, "images", "zImage")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
