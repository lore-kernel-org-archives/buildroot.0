Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B40C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AF1482980;
	Sun, 27 Mar 2022 16:10:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nlHm5B22KHMa; Sun, 27 Mar 2022 16:10:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CC0C81D65;
	Sun, 27 Mar 2022 16:10:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F0531BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A87304029D
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D87f2bwsSvBz for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:09:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEFFD402F7
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 92C4685E0A; Sun, 27 Mar 2022 16:00:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 17:59:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a324bbcf7e44d819fce8584595ca49bde7077e33
X-Git-Newrev: 39ceb94fdb96da47a350b92e86513ddc57a657eb
X-Patchwork-Hint: ignore
Message-Id: <20220327160039.92C4685E0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdk-pixbuf: fix target
 loaders.cache
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

commit: https://git.buildroot.net/buildroot/commit/?id=39ceb94fdb96da47a350b92e86513ddc57a657eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Rutger Sassen in
https://lists.buildroot.org/pipermail/buildroot/2022-March/638895.html,
target loaders.cache is broken since commit
75361a9aba042799040591fb84192802b137fc3a so fix it by prepending /usr/
to relative host paths

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index b22e9568c9..329c05520e 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -70,14 +70,14 @@ endif
 # gdk-pixbuf requires the loaders.cache file populated to work properly
 # Rather than doing so at runtime, since the fs can be read-only, do so
 # here after building and installing to target.
-# And since the cache file will contain absolute host directory names we
-# need to sanitize (strip) them.
+# And since the cache file will contain relative host directory names we
+# need to prepend them with /usr/.
 ifeq ($(BR2_STATIC_LIBS),)
 define GDK_PIXBUF_UPDATE_CACHE
 	GDK_PIXBUF_MODULEDIR=$(HOST_DIR)/lib/gdk-pixbuf-2.0/2.10.0/loaders \
 		$(HOST_DIR)/bin/gdk-pixbuf-query-loaders \
 		> $(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
-	$(SED) "s,$(HOST_DIR)/lib,/usr/lib,g" \
+	$(SED) 's,^"lib,"/usr/lib,g' \
 		$(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
 endef
 GDK_PIXBUF_POST_INSTALL_TARGET_HOOKS += GDK_PIXBUF_UPDATE_CACHE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
