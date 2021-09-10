Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417E2C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 16:22:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5A5461167
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 16:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5A5461167
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96ED1407B6;
	Fri, 10 Sep 2021 16:22:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q4SUMFcT7RHB; Fri, 10 Sep 2021 16:22:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F115640673;
	Fri, 10 Sep 2021 16:22:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F23301BF2C7
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 16:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED7954023F
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 16:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VJO4j8EQ9MXn for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 16:22:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBFE2400F5
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 16:22:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C9D6188DAA; Fri, 10 Sep 2021 16:20:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 18:22:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 280719ba7f10a43ee7a59c4ad89746841fb39ca1
X-Git-Newrev: 4ad23552c62a7b5fd198be1f382ffd35a90efc64
X-Patchwork-Hint: ignore
Message-Id: <20210910162046.C9D6188DAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/e2fsprogs: bump version to fix
 regression
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4ad23552c62a7b5fd198be1f382ffd35a90efc64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 1.46.3 had a regression, which meant the file that would store
the filesystem image had to pre-exist, or mkfs.ext2 would fail to
generate the filesystem:

    mkfs.ext4: No such file or directory while trying to determine
    filesystem size

The regression was fixed upstream, and is now part of the 1.46.4
release, so bump to that release.

Fixes: #14196

Additionally, as noticed by Romain, the defaults settings for generating
"small" filesystems have changed: the inode size has been increased fom
128 to 256 bytes in 1.46.4 [0]. This causes the number of inodes to
diverge slightly from the requested number; instead of 8 more inodes,
there are now 8 fewer than requested.

Adapt our test accordingly.

[0] https://github.com/tytso/e2fsprogs/commit/a23b50cdb55cb826b8745cbc37429c93f7b60c66

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Reported-by: Kevin Tomary <kevin.tomary@hotmail.com>
Reported-by: Leon de Rooij <leon@exquisip.nl>
Reported-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Michael Walle <michael@walle.cc>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/e2fsprogs/e2fsprogs.hash     | 2 +-
 package/e2fsprogs/e2fsprogs.mk       | 2 +-
 support/testing/tests/fs/test_ext.py | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 3661801199..63c7c9929f 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.46.3/sha256sums.asc
-sha256  86d1580facdd49f2e0e6b027e26b1e6c48af538762dc40aeed2a87153c1f11b7  e2fsprogs-1.46.3.tar.xz
+sha256  b11042533c1b1dcf17512f0da48e05b0c573dada1dd8b762864d10f4dc399713  e2fsprogs-1.46.4.tar.xz
 # Locally calculated
 sha256  5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
 sha256  032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 5528ecbc34..ca891066a2 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.46.3
+E2FSPROGS_VERSION = 1.46.4
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
index 2a6e0c4274..699f3ed932 100644
--- a/support/testing/tests/fs/test_ext.py
+++ b/support/testing/tests/fs/test_ext.py
@@ -113,8 +113,8 @@ class TestExt4(infra.basetest.BRTest):
         out = dumpe2fs_run(self.builddir, "rootfs.ext4")
         self.assertEqual(dumpe2fs_getprop(out, REVISION_PROP), "1 (dynamic)")
         self.assertEqual(dumpe2fs_getprop(out, BLOCKCNT_PROP), "16384")
-        # Yes there are 8 more inodes than requested
-        self.assertEqual(dumpe2fs_getprop(out, INODECNT_PROP), "3008")
+        # Yes there are 8 fewer inodes than requested
+        self.assertEqual(dumpe2fs_getprop(out, INODECNT_PROP), "2992")
         self.assertEqual(dumpe2fs_getprop(out, RESBLKCNT_PROP), "1638")
         self.assertIn("has_journal", dumpe2fs_getprop(out, FEATURES_PROP))
         self.assertIn("extent", dumpe2fs_getprop(out, FEATURES_PROP))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
