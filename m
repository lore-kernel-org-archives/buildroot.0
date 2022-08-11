Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDF7C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2671E41748;
	Thu, 11 Aug 2022 20:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2671E41748
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Ltftj60c78p; Thu, 11 Aug 2022 20:44:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD48140341;
	Thu, 11 Aug 2022 20:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD48140341
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC5381BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4ED24013D
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4ED24013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PRwuAXg0TPFA for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:43:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 107AE400E2
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 107AE400E2
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0E67087353; Thu, 11 Aug 2022 20:29:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 22:43:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8d9609851552c7ed03fe1e70a2f44efb134253c
X-Git-Newrev: 9181bd3ce16429482ef13d97da47dbcd69a0d8e6
X-Patchwork-Hint: ignore
Message-Id: <20220811202928.0E67087353@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ljsyscall: fix build with
 aarch64_be
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9181bd3ce16429482ef13d97da47dbcd69a0d8e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

luajit supports aarch64_be since commit
28e5c2f2bdd147dbb9aefbc040fc618f46ee0663

However this raise a build failure with ljsyscall because aarch64_be
directory does not exist so use arm64 instead

/usr/bin/install: cannot stat '/home/buildroot/autobuild/instance-1/output-1/build/ljsyscall-0.12/syscall/linux/aarch64_be/*.lua': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/78397c83e84dbfc09990f92be93e0b8a10d014c5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ljsyscall/ljsyscall.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ljsyscall/ljsyscall.mk b/package/ljsyscall/ljsyscall.mk
index 12dfbcb4ae..b847739a08 100644
--- a/package/ljsyscall/ljsyscall.mk
+++ b/package/ljsyscall/ljsyscall.mk
@@ -18,7 +18,7 @@ else ifeq ($(BR2_powerpc),y)
 LJSYSCALL_ARCH = ppc
 else ifeq ($(BR2_arm)$(BR2_armeb),y)
 LJSYSCALL_ARCH = arm
-else ifeq ($(BR2_aarch64),y)
+else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 LJSYSCALL_ARCH = arm64
 else ifeq ($(BR2_mips)$(BR2_mipsel),y)
 LJSYSCALL_ARCH = mips
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
