Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B270C433EF
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 11:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 130C261170;
	Thu, 31 Mar 2022 11:34:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfPcyFYQsehC; Thu, 31 Mar 2022 11:34:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E1D160E37;
	Thu, 31 Mar 2022 11:34:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D97AD1BF3D2
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 11:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C703240176
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 11:34:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7triqRnvBSU4 for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 11:34:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0473D400E4
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 11:34:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1003285FC3; Thu, 31 Mar 2022 11:25:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 13:20:43 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6439b8dbe01b2a80f8cd7202277b8ccd822cc7e9
X-Git-Newrev: f976d735e96a2b82542d3eddd599b6ed5a36e393
X-Patchwork-Hint: ignore
Message-Id: <20220331112525.1003285FC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gdk-pixbuf: fix
 target loaders.cache
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

commit: https://git.buildroot.net/buildroot/commit/?id=f976d735e96a2b82542d3eddd599b6ed5a36e393
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

As reported by Rutger Sassen in
https://lists.buildroot.org/pipermail/buildroot/2022-March/638895.html,
target loaders.cache is broken since commit
75361a9aba042799040591fb84192802b137fc3a so fix it by prepending /usr/
to relative host paths

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 39ceb94fdb96da47a350b92e86513ddc57a657eb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
