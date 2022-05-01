Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A477FC433EF
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 19:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B7BD60E25;
	Sun,  1 May 2022 19:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eWBctS5f0WRw; Sun,  1 May 2022 19:43:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 804A160E39;
	Sun,  1 May 2022 19:43:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FEC21BF3FB
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 19:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F26FC60E1E
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 19:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 264vaOuUfLsE for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 19:43:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B8F660E18
 for <buildroot@buildroot.org>; Sun,  1 May 2022 19:43:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 92C6984CA1; Sun,  1 May 2022 19:32:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 May 2022 21:42:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c05e5a069cf037a9ff314effd6415a433ac40cc
X-Git-Newrev: bc6eb862be6d9704376dc5951c521fe01e5c698c
X-Patchwork-Hint: ignore
Message-Id: <20220501193247.92C6984CA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tbb: always build Release
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc6eb862be6d9704376dc5951c521fe01e5c698c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When tbb is built in Debug mode, it installs libtbb_debug.so instead of
libtbb.so. This confuses downstream packages that want to link with it
(e.g. sysdig).

Always build in Release mode. This means that BR2_ENABLE_RUNTIME_DEBUG
has no effect for this package, but that shouldn't be a bi issue.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tbb/tbb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
index afe756a85a..fc720fd2f5 100644
--- a/package/tbb/tbb.mk
+++ b/package/tbb/tbb.mk
@@ -13,6 +13,7 @@ TBB_CPE_ID_VENDOR = intel
 TBB_CPE_ID_PRODUCT = threading_building_blocks
 
 TBB_CONF_OPTS = \
+	-DCMAKE_BUILD_TYPE=Release \
 	-DTBB_STRICT=OFF \
 	-DTBB_TEST=OFF
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
