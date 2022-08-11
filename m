Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75684C25B06
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 21:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1258560F69;
	Thu, 11 Aug 2022 21:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1258560F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CXv8tZWg17Il; Thu, 11 Aug 2022 21:02:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24D6E60B59;
	Thu, 11 Aug 2022 21:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24D6E60B59
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C59B1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 21:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27DDB812D6
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 21:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27DDB812D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ARy5rZprAAWP for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 21:01:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AC5F812D1
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 21:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AC5F812D1
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5F5EF8739B; Thu, 11 Aug 2022 20:47:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 23:01:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47354cfce67c1898813ce124decfa5b3fb76f46b
X-Git-Newrev: 726902e78c9645e19cbff28719f277bdbdf9526b
X-Patchwork-Hint: ignore
Message-Id: <20220811204733.5F5EF8739B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-server: fix memcached
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=726902e78c9645e19cbff28719f277bdbdf9526b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 736c4c1655d93652a9a7e79235bbe726b3d46176:

Makefile:575: *** mysql is in the dependency chain of freeradius-server that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/c3a9c3822b4599c1b16d27840b5663506e37a41f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freeradius-server/freeradius-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 65a72ab532..2f4c118da5 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -109,7 +109,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_MEMCACHED),y)
 FREERADIUS_SERVER_CONF_OPTS += --with-rlm_cache_memcached
-FREERADIUS_SERVER_DEPENDENCIES += mysql
+FREERADIUS_SERVER_DEPENDENCIES += memcached
 else
 FREERADIUS_SERVER_CONF_OPTS += --without-rlm_cache_memcached
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
