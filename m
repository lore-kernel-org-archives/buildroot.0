Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6029BD49789
	for <buildroot@archiver.kernel.org>; Sun,  1 Dec 2024 19:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 247754ED47;
	Sun,  1 Dec 2024 19:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQv5oYBMhNEE; Sun,  1 Dec 2024 19:41:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3B544ED81
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3B544ED81;
	Sun,  1 Dec 2024 19:41:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A473F60
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 19:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 925794EC95
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 19:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oHEqbw1BtTKB for <buildroot@buildroot.org>;
 Sun,  1 Dec 2024 19:41:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 925F64ED47
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 925F64ED47
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 19:41:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C4E9866BF; Sun,  1 Dec 2024 19:41:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Dec 2024 20:34:29 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a210062ce2fd3c9c85cf21d0a8cd55da093fa816
X-Git-Newrev: 4088777f7b972305749192ccb451676b95e9874e
X-Patchwork-Hint: ignore
Message-Id: <20241201194137.7C4E9866BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/systemd: fix
 bcachefs magic patch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=4088777f7b972305749192ccb451676b95e9874e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit 29409c9d345a2536f6b72c605cda0d13f306200f ("package/systemd: fix
build with recent kernels") added a patch from upstream that adds the
BCACHEFS_SUPER_MAGIC definition if not provided by the kernel headers.

However, this commit from upstream was bogus: in the case
BCACHEFS_SUPER_MAGIC was defined, it does an assert_cc() to verify
that the value matches what we expect, but this assert_cc() statement
lacks the final semi-colon, causing build breakage on host systems
that do have BCACHEFS_SUPER_MAGIC defined in their kernel headers,
with a weird error occuring in another header file... because only the
next statement after assert_cc() was considered as having a syntax
error.

Fixes:

  http://autobuild.buildroot.net/results/9f99a97df2efd5e4ae4ad5cc5882607f0c8766bc/

This issue only exists in 2024.02.x at this point, because in master
we have moved to systemd 256.x, which has dropped entirely this piece
of code related to defining BCACHEFS_SUPER_MAGIC (and we wonder how
systemd can then build with slightly older kernel headers, as
BCACHEFS_SUPER_MAGIC is only in the public kernel headers since Linux
6.10).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/0002-basic-add-bcachefs-magic.patch | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/systemd/0002-basic-add-bcachefs-magic.patch b/package/systemd/0002-basic-add-bcachefs-magic.patch
index e7f4b1cbb7..372066ebef 100644
--- a/package/systemd/0002-basic-add-bcachefs-magic.patch
+++ b/package/systemd/0002-basic-add-bcachefs-magic.patch
@@ -1,4 +1,4 @@
-From e5ff9b585d7dc54f50085d518d7d588c250b0690 Mon Sep 17 00:00:00 2001
+From 48c1cd62de0339722fd3b72ef86aaaf1c38ff3dd Mon Sep 17 00:00:00 2001
 From: Chris Packham <chris.packham@alliedtelesis.co.nz>
 Date: Fri, 31 May 2024 09:51:38 +1200
 Subject: [PATCH] basic: Add BCACHEFS magic
@@ -34,7 +34,7 @@ index 1cd66b5a5f..c82fe98227 100644
  binder,          {BINDERFS_SUPER_MAGIC}
  binfmt_misc,     {BINFMTFS_MAGIC}
 diff --git a/src/basic/missing_magic.h b/src/basic/missing_magic.h
-index 82d71c8ad1..b3d2ee9f57 100644
+index 82d71c8ad1..c8ecf44357 100644
 --- a/src/basic/missing_magic.h
 +++ b/src/basic/missing_magic.h
 @@ -197,3 +197,10 @@
@@ -46,8 +46,8 @@ index 82d71c8ad1..b3d2ee9f57 100644
 +#ifndef BCACHEFS_SUPER_MAGIC
 +#  define BCACHEFS_SUPER_MAGIC 0xca451a4e
 +#else
-+assert_cc(BCACHEFS_SUPER_MAGIC == 0xca451a4e)
++assert_cc(BCACHEFS_SUPER_MAGIC == 0xca451a4e);
 +#endif
---
-2.45.1
+-- 
+2.47.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
