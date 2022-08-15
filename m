Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D74C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 20:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0B594032A;
	Mon, 15 Aug 2022 20:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0B594032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s499JEI442z5; Mon, 15 Aug 2022 20:47:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B49F5402BC;
	Mon, 15 Aug 2022 20:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B49F5402BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 97A441BF33F
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AC13402BC
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AC13402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WpTBlHYojBBE for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 20:47:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A243640298
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A243640298
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 20:47:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 8326F240005;
 Mon, 15 Aug 2022 20:47:37 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Mon, 15 Aug 2022 22:47:31 +0200
Message-Id: <20220815204732.2220880-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660596457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2COklEkGKIWS2pfTCeQdZ+jfnzRqc6dmpDLlaZHLoro=;
 b=n2FiufnSqP3Pyisjk71FPEoGEeZ1rrXT4qQb7XOC+8YQQfLfDlO/u1m7u7fFxoLlk5mmhS
 MgqjveIQlewJouhmtEY9VRLdUXaStKa8FZ3+vWjecpImxNLbREI9p/KvMQl8RwLvC4TrAZ
 TmrQyHlaP9evDLkTRFbhdeo64FrATcgTQ6tYRJQ9VXAsUwu+eM4gabhf1/4i/b9iPIs+Aw
 meJAcPV3Zy71ELQkMIT3OZ+2osaeOs4GVZz0VmI44+cvxAVH3ib0/XUottHbrM4h/7SF57
 ZqNGabrCCFLHo+9kNmxomu9YQxOamV1U8Qjii0r6qgsjoOv7hycsgp3JzaBbPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n2FiufnS
Subject: [Buildroot] [PATCH] support/testing/tests/fs/test_f2fs: fix test
 after f2fs-tools bump
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
