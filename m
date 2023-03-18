Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74ABC74A5B
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 21:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D1C381F27;
	Sat, 18 Mar 2023 21:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D1C381F27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ikZPXtzB46ak; Sat, 18 Mar 2023 21:17:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAB3E81F1B;
	Sat, 18 Mar 2023 21:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAB3E81F1B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6BB191BF378
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 21:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53CC14039D
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 21:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53CC14039D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q4rjF3AXOqo0 for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 21:17:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98528400B9
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 21:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98528400B9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84F1186A53; Sat, 18 Mar 2023 21:17:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Mar 2023 22:17:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3051892eba100441f6900b6b435ae935f103fff
X-Git-Newrev: 4a0301c1b95a751c331e738d6a392c1fd03d2393
X-Patchwork-Hint: ignore
Message-Id: <20230318211727.84F1186A53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shadow: fix libsemanage dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a0301c1b95a751c331e738d6a392c1fd03d2393
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit f78c5cb5cae93a9e63dad4361d78e1787759382f:

Makefile:576: *** libsemanage is in the dependency chain of shadow that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/e528e07874815d7f1cb951084ec985d76fe22d2e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shadow/shadow.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index d8f913a648..4bc3cce037 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -87,7 +87,7 @@ else
 SHADOW_CONF_OPTS += --without-libcrack
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+ifeq ($(BR2_PACKAGE_LIBSELINUX)$(BR2_PACKAGE_LIBSEMANAGE),yy)
 SHADOW_CONF_OPTS += --with-selinux
 SHADOW_DEPENDENCIES += libselinux libsemanage
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
