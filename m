Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE39C04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 14:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7994640A38;
	Sat, 30 Jul 2022 14:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7994640A38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uZRa6OFxVYFB; Sat, 30 Jul 2022 14:47:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A801340217;
	Sat, 30 Jul 2022 14:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A801340217
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A9FF1BF3D2
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 14:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 187E0418D9
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 14:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 187E0418D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ENBwlfviF_dy for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 14:47:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 669E141881
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 14:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 669E141881
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 32FD786987; Sat, 30 Jul 2022 14:33:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Jul 2022 16:46:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c54c3ef3db26d3630c79fc1bad10469b889d0dd
X-Git-Newrev: 991b7b990ad8cd4a37564cd91d5bb0ee7e1e9f11
X-Patchwork-Hint: ignore
Message-Id: <20220730143321.32FD786987@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: Enable OpenRISC GDB support
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

commit: https://git.buildroot.net/buildroot/commit/?id=991b7b990ad8cd4a37564cd91d5bb0ee7e1e9f11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The OpenRiSC gdb port has supported native debugging since version 8.3
and remote debugging since before that.  So it is now safe to enabled
this.

This patch removes the conditions blocking gdb from being built on or1k
architecture builds.

Signed-off-by: Stafford Horne <shorne@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gdb/Config.in      | 1 -
 package/gdb/Config.in.host | 1 -
 2 files changed, 2 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index cf5a2a892c..71fa6f6064 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	default y
 	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
 	depends on !BR2_microblaze
-	depends on !BR2_or1k
 
 comment "gdb/gdbserver needs a toolchain w/ threads, threads debug"
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 15d5f52a36..a294103ca3 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -3,7 +3,6 @@ config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
 	default y
 	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
 	depends on !BR2_microblaze
-	depends on !BR2_or1k
 
 comment "Host GDB Options"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
