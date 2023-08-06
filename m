Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B6CEC8733
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DB1383163;
	Thu,  7 Sep 2023 15:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DB1383163
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jb12kuLO0kZs; Thu,  7 Sep 2023 15:04:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D96E582E1A;
	Thu,  7 Sep 2023 15:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D96E582E1A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 094CE1BF3BB
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3924641D71
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3924641D71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bEXxX_CqnXJZ for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 286E441D8A
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 286E441D8A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2682286A20; Thu,  7 Sep 2023 14:51:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 16:41:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae0b6f43832b9f5ccc7da3480dcc1092740065b7
X-Git-Newrev: 8568bcd38a4e83ad1a2827b8362278ec73a4feb1
X-Patchwork-Hint: ignore
Message-Id: <20230907145126.2682286A20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: make version 12.x the default
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

commit: https://git.buildroot.net/buildroot/commit/?id=8568bcd38a4e83ad1a2827b8362278ec73a4feb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can remove the quirk around BR2_or1k: it was there to make sure
that 11.x was the default when no target gdb is selected for all
architectures except or1k, and that 12.x would be used by default on
or1k, as 11.x is not available/broken.

Now that 12.x is the default for everybody, this quirk is no longer
needed. 11.x was already no selectable for or1k, and remains not
selectable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 73aac0857e..14efb10c76 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -41,7 +41,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_11
+	default BR2_GDB_VERSION_12
 	depends on !BR2_arc
 	help
 	  Select the version of gdb you wish to use.
@@ -71,7 +71,7 @@ config BR2_GDB_VERSION
 	string
 	default "arc-2020.09-release-gdb" if BR2_arc
 	default "10.2"	   if BR2_GDB_VERSION_10
-	default "11.2"     if BR2_GDB_VERSION_11 || (!BR2_PACKAGE_HOST_GDB && !BR2_or1k)
-	default "12.1"     if BR2_GDB_VERSION_12 || (!BR2_PACKAGE_HOST_GDB && BR2_or1k)
+	default "11.2"     if BR2_GDB_VERSION_11
+	default "12.1"     if BR2_GDB_VERSION_12 || !BR2_PACKAGE_HOST_GDB
 	default "13.2"     if BR2_GDB_VERSION_13
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
