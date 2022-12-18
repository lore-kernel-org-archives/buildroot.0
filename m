Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A00EC4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 13:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2182E408B0;
	Sun, 18 Dec 2022 13:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2182E408B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3aA-13jkYh0d; Sun, 18 Dec 2022 13:55:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D78D4086E;
	Sun, 18 Dec 2022 13:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D78D4086E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E43A41BF5A7
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C02DC813A3
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C02DC813A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dp9PzvsGv2UN for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 13:55:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED96F8089E
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 13:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED96F8089E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DACC58689F; Sun, 18 Dec 2022 13:55:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 14:54:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4c41ac00c7d144f8aed1644a1b80eca8470d01d
X-Git-Newrev: af9454f8c1ca7f9dd02daaeb81a52690fac79a22
X-Patchwork-Hint: ignore
Message-Id: <20221218135549.DACC58689F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/davfs2: needs glibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=af9454f8c1ca7f9dd02daaeb81a52690fac79a22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

davfs2 unconditionally uses fstab.h since
https://git.savannah.nongnu.org/cgit/davfs2.git/commit/?id=6e2053cd7f44b0ca58af09905c044c178df34497
resulting in the following build failure since bump to version 1.7.0 in
commit 76423bd3a657f0ca197e2301bbb21e4fc9eee992:

mount_davfs.c:78:10: fatal error: fstab.h: No such file or directory
   78 | #include <fstab.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/793c71e4f731a18e203d6eaa3ac8b6e2a9620c27

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/davfs2/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/davfs2/Config.in b/package/davfs2/Config.in
index 162753be3e..31a680563c 100644
--- a/package/davfs2/Config.in
+++ b/package/davfs2/Config.in
@@ -1,10 +1,10 @@
-comment "davfs2 needs a glibc or uClibc toolchain"
+comment "davfs2 needs a glibc toolchain"
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_DAVFS2
 	bool "davfs2"
-	depends on !BR2_TOOLCHAIN_USES_MUSL # error.h
+	depends on BR2_TOOLCHAIN_USES_GLIBC # fstab.h
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NEON
 	select BR2_PACKAGE_NEON_XML
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
