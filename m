Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD66C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 21:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09D87411DF;
	Thu, 21 Apr 2022 21:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SuBZfK5bk5Lc; Thu, 21 Apr 2022 21:05:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E60164118B;
	Thu, 21 Apr 2022 21:05:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AD091C1189
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5FA082FF9
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vg3dQNQ9OpaE for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 21:02:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE782832DB
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 21:02:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8375C84104; Thu, 21 Apr 2022 20:52:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 22:32:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 845f963842766019d3c83a6ab7ea592bc3017f75
X-Git-Newrev: 338009c7ba33fb718d5d0256f6049d9e593f9464
X-Patchwork-Hint: ignore
Message-Id: <20220421205206.8375C84104@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/quazip: doesn't build with zlib-ng
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

commit: https://git.buildroot.net/buildroot/commit/?id=338009c7ba33fb718d5d0256f6049d9e593f9464
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

quazip doesn't build with zlib-ng since bump to version 1.9.9-b1 in
commit 1f7b12a0b4572d7e763c431a63c22cfb912b8b14 and the removal of
z_crc_t and FAR:
https://github.com/zlib-ng/zlib-ng/commit/4db4cfdb5badc8860f7410732b12c45216d709b3
https://github.com/zlib-ng/zlib-ng/commit/0db1040667b13c0f9405af810f669857a487b08e:

/nvmedata/autobuild/instance-16/output-1/build/quazip-1.2/quazip/unzip.c:196:11: error: unknown type name 'z_crc_t'
  196 |     const z_crc_t FAR * pcrc_32_tab;
      |           ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/02272c154ce58bacf0518dab5fc1ef0084121e1a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/quazip/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/quazip/Config.in b/package/quazip/Config.in
index e980297558..a670ed458c 100644
--- a/package/quazip/Config.in
+++ b/package/quazip/Config.in
@@ -1,10 +1,13 @@
 config BR2_PACKAGE_QUAZIP
 	bool "quazip"
+	depends on BR2_PACKAGE_LIBZLIB
 	depends on BR2_PACKAGE_QT5
-	select BR2_PACKAGE_ZLIB
 	help
 	  QuaZIP is a simple C++ wrapper over Gilles Vollant's
 	  ZIP/UNZIP package that can be used to access ZIP
 	  archives. It uses the Qt toolkit.
 
 	  http://quazip.sourceforge.net
+
+comment "quazip needs libzlib"
+	depends on !BR2_PACKAGE_LIBZLIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
