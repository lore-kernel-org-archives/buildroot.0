Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE556C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B51984183C;
	Fri, 12 Jul 2024 20:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56PAphVk_0t7; Fri, 12 Jul 2024 20:20:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8669441972
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8669441972;
	Fri, 12 Jul 2024 20:20:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C8671BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16A4C4015E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_gc3cPm_z28 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:20:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 323B7400B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 323B7400B8
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:20:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CE8C8618B; Fri, 12 Jul 2024 20:20:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 22:19:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d10bee42012103fe7974c5e20be3af81e3c1c250
X-Git-Newrev: 9ef51ec2cabff9fed9a3acc96d39cb1be456a11a
X-Patchwork-Hint: ignore
Message-Id: <20240712202047.2CE8C8618B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/check: disable static
 build"
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ef51ec2cabff9fed9a3acc96d39cb1be456a11a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 77e945b003e1b401c0def36db403c937e4d604bb.

The static linking issue was fixed by commit
526b89b981cb3fa3da7644482d1f140f1fb25e27 ("package/check: don't build
shared lib when disabled")

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/check/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/check/Config.in b/package/check/Config.in
index a3a7ff1f11..2312fbf81c 100644
--- a/package/check/Config.in
+++ b/package/check/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_CHECK
 	bool "check"
-	depends on !BR2_STATIC_LIBS
 	help
 	  Check is a unit testing framework for C.
 
 	  https://libcheck.github.io/check/
-
-comment "check needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
