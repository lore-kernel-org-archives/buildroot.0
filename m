Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6751C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 20:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 974D741662;
	Thu, 17 Feb 2022 20:29:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uePd0n8z9VXm; Thu, 17 Feb 2022 20:29:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1AFB415BF;
	Thu, 17 Feb 2022 20:29:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 811501C113E
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E88A83F64
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:29:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bv_fjNqDkjqo for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 20:29:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EF0283F54
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 20:29:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9A04B83785; Thu, 17 Feb 2022 20:21:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 21:29:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc9470c2d8134106792a5a0179fbd0c6ca4d37af
X-Git-Newrev: 09a1511abd3ba0f3e20a1e93f36830d344dd1ce3
X-Patchwork-Hint: ignore
Message-Id: <20220217202156.9A04B83785@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglvnd: fix LIBGLVND_CONF_OPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=09a1511abd3ba0f3e20a1e93f36830d344dd1ce3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LIBGLVND_CONF_OPTS are wrongly overridden in conditionals since the
addition of the package in commit
0378e2e5d9ce9d5676975dfbff501360094fdc1a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libglvnd/libglvnd.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libglvnd/libglvnd.mk b/package/libglvnd/libglvnd.mk
index 3df609f6eb..3bac4b31e2 100644
--- a/package/libglvnd/libglvnd.mk
+++ b/package/libglvnd/libglvnd.mk
@@ -37,17 +37,17 @@ LIBGLVND_CONF_OPTS += -Dglx=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLVND_DISPATCH_EGL),y)
-LIBGLVND_CONF_OPTS = -Degl=true
+LIBGLVND_CONF_OPTS += -Degl=true
 LIBGLVND_PROVIDES += libegl
 else
-LIBGLVND_CONF_OPTS = -Degl=false
+LIBGLVND_CONF_OPTS += -Degl=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLVND_DISPATCH_GLES),y)
-LIBGLVND_CONF_OPTS = -Dgles1=true -Dgles2=true
+LIBGLVND_CONF_OPTS += -Dgles1=true -Dgles2=true
 LIBGLVND_PROVIDES += libgles
 else
-LIBGLVND_CONF_OPTS = -Dgles1=false -Dgles2=false
+LIBGLVND_CONF_OPTS += -Dgles1=false -Dgles2=false
 endif
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
