Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53D8C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 08:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78828403CA;
	Mon, 22 Jul 2024 08:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEY7FWYUu3Cv; Mon, 22 Jul 2024 08:05:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0F8C403B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0F8C403B5;
	Mon, 22 Jul 2024 08:05:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 675A81BF291
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 156D740320
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCKZspSndXvM for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 08:05:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26E634033F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26E634033F
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 08:05:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 236E286FC0; Mon, 22 Jul 2024 08:05:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 09:49:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f807855b4d77cd277702e8764f8877d7643f87bf
X-Git-Newrev: 3d266f280b452ae9d2bd5e50d2b36849ff03dc7d
X-Patchwork-Hint: ignore
Message-Id: <20240722080537.236E286FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtd: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3d266f280b452ae9d2bd5e50d2b36849ff03dc7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mtd ubifs unconditionally calls the (deprecated) ENGINE_* logic in
libopenssl resulting in a build failure when
!BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
623d3bbe43e9193aa8e3395367d01af59071b859:

  CCLD     mkfs.ubifs
/home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/powerpc64-buildroot-linux-gnu/13.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: ubifs-utils/mkfs.ubifs/mkfs_ubifs-sign.o: in function `sign_superblock_node':
sign.c:(.text+0x328): undefined reference to `ENGINE_load_builtin_engines'

Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
 - http://autobuild.buildroot.org/results/1fd49b193a3623d244ace602c46f15914bfbcff4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/mtd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 57a562c108..0c95e3cc54 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_MTD_JFFS_UTILS
 
 config BR2_PACKAGE_MTD_UBIFS_UTILS
 	bool
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
