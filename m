Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454C5C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A9BE60B27;
	Fri, 13 May 2022 22:18:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BgWPzcneX-yT; Fri, 13 May 2022 22:18:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 307D760B79;
	Fri, 13 May 2022 22:18:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 144261BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 847EA40936
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Pe2WvRKIYoR for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B157419A5
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1C90385E2B; Fri, 13 May 2022 22:00:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:54:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62044e8675daf271a2d435edbadbd6d0540c1816
X-Git-Newrev: cd4b55dca0f9fe32e82c412ae6cb9976b864f3d0
X-Patchwork-Hint: ignore
Message-Id: <20220513220046.1C90385E2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/git: fix build with iconv
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd4b55dca0f9fe32e82c412ae6cb9976b864f3d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our libiconv shouldn't need the ICONV_OMITS_BOM workaround.

We also need to correctly set the iconv path so that we don't use the
host iconv path.

Fixes:
 - http://autobuild.buildroot.net/results/027/027602a750fd0989f9861773a2c4672667590acc

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
