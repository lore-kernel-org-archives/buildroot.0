Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD60C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 19:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 387CC610CF;
	Sat, 28 May 2022 19:28:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uydzQKs55iE6; Sat, 28 May 2022 19:28:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B19360AAA;
	Sat, 28 May 2022 19:28:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 392AC1BF867
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22F65837C9
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aAGxbg8BbCYC for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 19:27:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DF3483C28
 for <buildroot@buildroot.org>; Sat, 28 May 2022 19:27:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 585EE85E04; Sat, 28 May 2022 19:16:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 21:26:51 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f12c3cc3a856ff3aa866f8e638db787f5deb3f94
X-Git-Newrev: 7561c24377ab58b2949e2c997c31430e275dfb41
X-Patchwork-Hint: ignore
Message-Id: <20220528191613.585EE85E04@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/git: fix build
 with iconv
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

commit: https://git.buildroot.net/buildroot/commit/?id=7561c24377ab58b2949e2c997c31430e275dfb41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Our libiconv shouldn't need the ICONV_OMITS_BOM workaround.

We also need to correctly set the iconv path so that we don't use the
host iconv path.

Fixes:
 - http://autobuild.buildroot.net/results/027/027602a750fd0989f9861773a2c4672667590acc

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit cd4b55dca0f9fe32e82c412ae6cb9976b864f3d0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 0127ba5129..981a238acb 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -49,7 +49,8 @@ endif
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 GIT_DEPENDENCIES += libiconv
 GIT_CONF_ENV_LIBS += -liconv
-GIT_CONF_OPTS += --with-iconv=/usr/lib
+GIT_CONF_OPTS += --with-iconv=$(STAGING_DIR)/usr
+GIT_CONF_ENV += ac_cv_iconv_omits_bom=no
 else
 GIT_CONF_OPTS += --without-iconv
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
