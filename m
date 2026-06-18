Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4082ECD98F0
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 07:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC02A40556;
	Thu, 18 Jun 2026 07:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSeg9Re78J-T; Thu, 18 Jun 2026 07:54:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C27E34053F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781769264;
	bh=nxvCTOCqmjhbIxcGffGZ4e1MorcCmAq4vaFVTzW0AeY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TxwHy1flJ0m66zSH9UHsROsiyVAldUMgkgzeSUNUT9Kp/c9S2EqMPViQJS8Wqe0w1
	 jY4/SpOOv5OdwsqPlrTwFg9U9/K++W4vQeov75Uo0LVBcyNKokiorKEx7dXBrh5JOw
	 qF2XXdbY+7QYm8tbfk8FrZrmIkREYMxk5LPaIb/GuZHgd9ytjnJsQZWRRd9ZNjJ3P3
	 Ya4Eoq2/1RKAT3rkWQurZYjjyb6BavLj7cmskO3Q37jiLv9GT0DClUezfWWuaoxc7n
	 nMR2nByZ944M0HYLV1ZbjwRyZUMFP1sEfALU2WfeE9C2+DBUmRo5htvdC3XLFyqHTC
	 a+tsyq8Ief8RA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C27E34053F;
	Thu, 18 Jun 2026 07:54:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD4C0131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 07:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A385360F80
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 07:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5HBQowarYnZt for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 07:54:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.101;
 helo=smtpcmd02101.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9A1DD605FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A1DD605FC
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A1DD605FC
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 07:54:19 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id a7ZowXLmQxFXLa7ZowrBUI; Thu, 18 Jun 2026 09:54:16 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 18 Jun 2026 09:54:11 +0200
Message-ID: <20260618075411.969878-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOk9CK0Jbf+uDHWxtkSdn+TO35n7BxGEs+Nwqr3sHifF2IxE5xeKTXfuZxfwW1eBKTka801Rm2C1JQwjJpO1okQtCRDvl4Sor/rTQgjDlTqaNiNFy8JR
 wjDhgEBX1oh/u3vhSAeqt123mp1783xukVzyHR6yyiGn4tc1Cq3cDLOeMqYKOLtTzOZhQDV99U/Y0b2Po9LzWYIfVWt/5T8i+5VG6o6dgi9AClk7trzJOwwq
 8rO/f27wa9Ld28cI9NHy4iyheyMN5/ggAU0aCcgtOts=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1781769256; bh=4MOSiN86+/pYYu9FMV03XdSMAtFsnXFL0vW5Q0w7X4g=;
 h=From:To:Subject:Date:MIME-Version;
 b=ga4gq7pbQ8YlPNL+pO4d/AlHQ3nhqAjZoCReR9MUR3T44jw17Ztr28Hk5q4/Q1e5j
 PH3m1NAQwW6IPpzqglt+TbjMhmqajHDJ8zrE8my3f7IzqZHZ5d2EkmPulsI5e+0zjO
 IWqE6rlGcNBXqfJxME0MyKtdLnTulo5lyzvBG/BAqe4+2UALT0d2iHUw0ih7p6epai
 vnR4m8yzpB7eyxWakIwx15FWJZXo1QzABEx0nMnUvNqS332hxIZqpA0GliJKSxGgnF
 7c+BC/U/Od6i+WbtXaO7+NBKS+DB36R8wLPB7uLCB0tDUBZtmcn0CFqDSL8GAivhkP
 tFkt42xnTctYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ga4gq7pb
Subject: [Buildroot] [PATCH] package/util-linux: security bump to 2.41.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Security fixes:

 CVE-2026-53613 - mount(8) TOCTOU race on target path.
   The SUID mount does not pin the mount target directory, allowing a
   race between path resolution and the actual mount syscall.  A local
   attacker can swap an ancestor directory component between these
   steps to redirect a mount to an arbitrary location.
   Reported-by: Xinyao Hu

 CVE-2026-53612 - mount(8) TOCTOU race on post-mount owner/mode change.
   The X-mount.owner, X-mount.group, and X-mount.mode options use
   path-based lchown()/chmod() after mounting.  An attacker can swap
   the target between mount and the ownership/mode change to gain
   control of arbitrary files.
   Reported-by: Xinyao Hu

 CVE-2026-53614 - mount(8) SUID bypass via LIBMOUNT_FORCE_MOUNT2.
   The environment variable LIBMOUNT_FORCE_MOUNT2 is not filtered
   via safe_getenv() in SUID context.  A local attacker can force
   the legacy mount(2) code path, which uses a two-step bind+remount
   or propagation sequence with a window where security flags (nosuid,
   noexec, ...) are not yet applied.
   Reported-by: Xinyao Hu

Full release notes: https://www.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.5-ReleaseNotes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/util-linux/util-linux.hash | 2 +-
 package/util-linux/util-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 5a5656212c..b6393d6ec0 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/sha256sums.asc
-sha256  a8c213cc06048862602a42b2d299b340001f6d05c4407b549f3e03521df83688  util-linux-2.41.4.tar.xz
+sha256  f586e35d320ff537aab3ffeca37e9ecd482ccbe013590db4429a414d8aa6a728  util-linux-2.41.5.tar.xz
 # License files, locally calculated
 sha256  4c2db318192bda62f3f8fcf71488bb5e602ae4385eba281d711b46cc13a40bb3  README.licensing
 sha256  527f738966ca396cd5a68c1509390de2a780c6b614d9ee57f7544a6161938ed1  Documentation/licenses/COPYING.BSD-2-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index fcce9a7dc8..20bdcc5c3f 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,7 +8,7 @@
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
 UTIL_LINUX_VERSION_MAJOR = 2.41
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).4
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).5
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
