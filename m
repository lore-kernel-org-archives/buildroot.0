Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B76C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 12:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC36A417EC;
	Fri, 27 May 2022 12:44:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UUCTwDH7Oy7T; Fri, 27 May 2022 12:44:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B6AF4056C;
	Fri, 27 May 2022 12:44:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88E041BF3D1
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 12:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7788C428FB
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 12:44:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rx5aQlAwun8Z for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 12:43:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80C4C428EE
 for <buildroot@buildroot.org>; Fri, 27 May 2022 12:43:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 33AE386683; Fri, 27 May 2022 12:32:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 14:43:54 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 15e59056c47f0f587a5368541b4f2ceb9cc1cd02
X-Git-Newrev: 0c0d2be13c8a7849b3077250f527168cb57152f1
X-Patchwork-Hint: ignore
Message-Id: <20220527123233.33AE386683@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/python3: fix
 unsafe openssl header path
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c0d2be13c8a7849b3077250f527168cb57152f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Explicitely set the openssl path so that python3 doesn't search host
header paths for target openssl headers.

Fixes:
 - http://autobuild.buildroot.net/results/c27/c27fe795e079350dd1c9af45be417d41b55e57c3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit fbf78c2a738b1a0413c835201064abfa9a3a03f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index cffb34e264..6d03e2c6b1 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -103,6 +103,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_SSL),y)
 PYTHON3_DEPENDENCIES += openssl
+PYTHON3_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 else
 PYTHON3_CONF_OPTS += --disable-openssl
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
