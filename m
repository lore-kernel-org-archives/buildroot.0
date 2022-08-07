Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565CAC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 12:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF4A7401C9;
	Sun,  7 Aug 2022 12:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF4A7401C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nAsENt2df6Uo; Sun,  7 Aug 2022 12:42:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3E3A40119;
	Sun,  7 Aug 2022 12:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3E3A40119
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CBC41BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0838A8131A
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0838A8131A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5giFbRCdS7Ad for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 12:42:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 451A481300
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 12:42:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 451A481300
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0FF6C86F04; Sun,  7 Aug 2022 12:28:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 14:42:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59fdc58ef5b9e27a6124b3c86b18904c117644a9
X-Git-Newrev: d8f540bef04638f6b16cedc03a70f1bd98a0283c
X-Patchwork-Hint: ignore
Message-Id: <20220807122804.0FF6C86F04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lapack: fix build without
 BUILD_COMPLEX
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8f540bef04638f6b16cedc03a70f1bd98a0283c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without BUILD_COMPLEX raised since bump
to version 3.10.1 in commit b3e96b1fb0d0a7245cea6921fcdd7986762e5ec1 and
https://github.com/Reference-LAPACK/lapack/commit/bd1fba15d0d6f54891cb822f4ab2e8afd0a3ea4b:

CMake Error at LAPACKE/CMakeLists.txt:38 (message):
  LAPACKE_BUILD_COMPLEX requires BUILD_COMPLEX to be ON

CMake Error at LAPACKE/CMakeLists.txt:38 (message):
  LAPACKE_BUILD_COMPLEX16 requires BUILD_COMPLEX16 to be ON

Fixes:
 - http://autobuild.buildroot.org/results/418d15f734c87a70edf0d670c0548d550e6e70ba

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lapack/lapack.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index 2d069c1c93..3db2797202 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -14,9 +14,17 @@ LAPACK_SUPPORTS_IN_SOURCE_BUILD = NO
 LAPACK_CONF_OPTS = -DLAPACKE=ON -DCBLAS=ON
 
 ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
-LAPACK_CONF_OPTS += -DBUILD_COMPLEX=ON -DBUILD_COMPLEX16=ON
+LAPACK_CONF_OPTS += \
+	-DBUILD_COMPLEX=ON \
+	-DBUILD_COMPLEX16=ON \
+	-DLAPACKE_BUILD_COMPLEX=ON \
+	-DLAPACKE_BUILD_COMPLEX16=ON
 else
-LAPACK_CONF_OPTS += -DBUILD_COMPLEX=OFF -DBUILD_COMPLEX16=OFF
+LAPACK_CONF_OPTS += \
+	-DBUILD_COMPLEX=OFF \
+	-DBUILD_COMPLEX16=OFF \
+	-DLAPACKE_BUILD_COMPLEX=OFF \
+	-DLAPACKE_BUILD_COMPLEX16=OFF
 endif
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
