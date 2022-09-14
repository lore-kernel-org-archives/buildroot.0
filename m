Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB02BECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 21:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5809D60C0A;
	Wed, 14 Sep 2022 21:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5809D60C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2eoT035h8XEu; Wed, 14 Sep 2022 21:12:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E07F60BB6;
	Wed, 14 Sep 2022 21:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E07F60BB6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4871C1BF5EA
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 21:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2403B82423
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 21:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2403B82423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FaFMdUBM7Bdz for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 21:11:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61F15823CF
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 21:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61F15823CF
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5211783A49; Wed, 14 Sep 2022 21:11:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 22:57:26 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ce9aa2d03f329ac31b4f493ab93057c7c01c6ec0
X-Git-Newrev: d45dbafc06d84d7ec9979df24a18ae83f822da38
X-Patchwork-Hint: ignore
Message-Id: <20220914211156.5211783A49@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/boost: fix silent
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=d45dbafc06d84d7ec9979df24a18ae83f822da38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

When doing a build with "make -s" (silent option), the build of Boost
fails. Indeed, in this case boost.mk is passing -d as a option to
Boost, but -d must be followed by a digit.

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14951

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7bd277572e695ce390b52d0dec03fa8ee5485f64)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/boost.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 032ba5c820..69ea0d4733 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -122,8 +122,8 @@ BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$
 BOOST_LAYOUT = $(call qstrip, $(BR2_PACKAGE_BOOST_LAYOUT))
 
 # how verbose should the build be?
-BOOST_OPTS += $(if $(QUIET),-d,-d+1)
-HOST_BOOST_OPTS += $(if $(QUIET),-d,-d+1)
+BOOST_OPTS += $(if $(QUIET),-d0,-d+1)
+HOST_BOOST_OPTS += $(if $(QUIET),-d0,-d+1)
 
 define BOOST_CONFIGURE_CMDS
 	(cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
