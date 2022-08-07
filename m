Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB85C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 12:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7EEB41625;
	Sun,  7 Aug 2022 12:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7EEB41625
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WMDpnGvokxvM; Sun,  7 Aug 2022 12:30:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 930914161F;
	Sun,  7 Aug 2022 12:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 930914161F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67D1E1BF96B
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 397414161E
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 397414161E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z1gSBJUciUms for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 12:30:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 073924161D
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 12:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 073924161D
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C39F686ECE; Sun,  7 Aug 2022 12:15:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 14:30:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b4db6b70ff599bcf79fdef642fc93fd96c5bddc
X-Git-Newrev: 7bd277572e695ce390b52d0dec03fa8ee5485f64
X-Patchwork-Hint: ignore
Message-Id: <20220807121554.C39F686ECE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: fix silent build
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

commit: https://git.buildroot.net/buildroot/commit/?id=7bd277572e695ce390b52d0dec03fa8ee5485f64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When doing a build with "make -s" (silent option), the build of Boost
fails. Indeed, in this case boost.mk is passing -d as a option to
Boost, but -d must be followed by a digit.

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14951

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/boost.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index f6e9a03220..557c260693 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -128,8 +128,8 @@ BOOST_WITHOUT_FLAGS_COMMASEPARATED += $(subst $(space),$(comma),$(strip $(BOOST_
 BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$(BOOST_WITHOUT_FLAGS_COMMASEPARATED))
 
 # how verbose should the build be?
-BOOST_OPTS += $(if $(QUIET),-d,-d+1)
-HOST_BOOST_OPTS += $(if $(QUIET),-d,-d+1)
+BOOST_OPTS += $(if $(QUIET),-d0,-d+1)
+HOST_BOOST_OPTS += $(if $(QUIET),-d0,-d+1)
 
 define BOOST_CONFIGURE_CMDS
 	cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
