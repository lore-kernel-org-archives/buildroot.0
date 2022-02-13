Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06512C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 17:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B54D781769;
	Sun, 13 Feb 2022 17:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t1eIwM_M1aFE; Sun, 13 Feb 2022 17:00:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B786481656;
	Sun, 13 Feb 2022 17:00:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A931F1BF20B
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 16:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A655381443
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 16:59:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C1kiK6xp6Q4p for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 16:59:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 066B48143E
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 16:59:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6902282297; Sun, 13 Feb 2022 16:52:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 17:57:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10ac3455d364b5e1f87d8f2f111ef1a6952e426a
X-Git-Newrev: f93039e3a6f0177675a4f775d762d665204714c9
X-Patchwork-Hint: ignore
Message-Id: <20220213165213.6902282297@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/icu: don't disable renaming for
 host build
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

commit: https://git.buildroot.net/buildroot/commit/?id=f93039e3a6f0177675a4f775d762d665204714c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using a different renaming option for the icu host build can cause
issues for packages such as qt5webengine which expect target and
host packages to be built with the same options.

A package that needs both host and target to have the same options is most
probably doing somethig wrong, like linking a host program and taking the
result as valid for the target.

However, our adding the --disable-renaming in the first place in 3911e67151b
(icu: security bump to version 51.2) did not provide any explanations why it
was needed to begin with, so drop it.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Peter: extend commit message as suggested by Yann]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/icu/icu.mk       | 3 +--
 package/nodejs/nodejs.mk | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 7e0c96e43a..ebbb1968fc 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -45,8 +45,7 @@ HOST_ICU_CONF_OPTS = \
 	--disable-tests \
 	--disable-extras \
 	--disable-icuio \
-	--disable-layout \
-	--disable-renaming
+	--disable-layout
 ICU_SUBDIR = source
 HOST_ICU_SUBDIR = source
 
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 727af6dc50..2e41c11dbd 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -94,7 +94,7 @@ NODEJS_HOST_TOOLS_V8 = \
 NODEJS_HOST_TOOLS_NODE = mkcodecache
 NODEJS_HOST_TOOLS = $(NODEJS_HOST_TOOLS_V8) $(NODEJS_HOST_TOOLS_NODE)
 
-HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS) -DU_DISABLE_RENAMING=1
+HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS)
 
 define HOST_NODEJS_BUILD_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
