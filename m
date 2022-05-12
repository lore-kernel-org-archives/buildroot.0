Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD44C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A1D2403AE;
	Thu, 12 May 2022 20:17:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vgb_I858N-As; Thu, 12 May 2022 20:17:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 814DC40359;
	Thu, 12 May 2022 20:17:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 593371BF398
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46158605AC
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uT-pRomoy-GF for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:16:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9072E60B31
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:16:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C61DD85D5E; Thu, 12 May 2022 20:06:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 22:16:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb5aad3024a1f592867068ff22962cf3d576ff19
X-Git-Newrev: fa56c5f4a2fff2a0363c6dfad7f0f6f74bb3e299
X-Patchwork-Hint: ignore
Message-Id: <20220512200605.C61DD85D5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: use ninja for build
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa56c5f4a2fff2a0363c6dfad7f0f6f74bb3e299
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Not only is ninja much faster, it also avoids the following build
failure:
make[3]: printf: Argument list too long

This failure happens when the output directory is about 6 levels deep.
It's due to the make generator of gyp that uses some crazy shell
processing for splitting up paths on /. The ninja generator does no such
thing.

While we're at it, remove redundant parenthesis in
HOST_NODEJS_CONFIGURE_CMDS.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nodejs/nodejs.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 708d5ac411..cfd9295d4e 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -9,6 +9,7 @@ NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = \
 	host-nodejs \
+	host-ninja \
 	host-pkgconf \
 	host-python3 \
 	host-qemu \
@@ -20,6 +21,7 @@ NODEJS_DEPENDENCIES = \
 HOST_NODEJS_DEPENDENCIES = \
 	host-icu \
 	host-libopenssl \
+	host-ninja \
 	host-pkgconf \
 	host-python3 \
 	host-zlib
@@ -37,7 +39,8 @@ NODEJS_CONF_OPTS = \
 	--without-dtrace \
 	--without-etw \
 	--cross-compiling \
-	--dest-os=linux
+	--dest-os=linux \
+	--ninja
 
 HOST_NODEJS_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
@@ -82,7 +85,7 @@ NODEJS_CONF_OPTS += --without-npm
 endif
 
 define HOST_NODEJS_CONFIGURE_CMDS
-	(cd $(@D); \
+	cd $(@D); \
 		$(HOST_CONFIGURE_OPTS) \
 		PATH=$(@D)/bin:$(BR_PATH) \
 		PYTHON=$(HOST_DIR)/bin/python3 \
@@ -96,7 +99,7 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		--shared-zlib \
 		--no-cross-compiling \
 		--with-intl=system-icu \
-	)
+		--ninja
 endef
 
 NODEJS_HOST_TOOLS_V8 = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
