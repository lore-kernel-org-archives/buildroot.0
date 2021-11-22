Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871DDC433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 23:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D5C74040D;
	Mon, 22 Nov 2021 23:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xO1rAVe6BqKI; Mon, 22 Nov 2021 23:07:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A5C5403EF;
	Mon, 22 Nov 2021 23:07:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D375A1BF3E9
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 23:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0BE0402AA
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 23:07:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wXqteUtFHl5D for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 23:07:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63CCC40299
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 23:07:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BD5D28F011; Mon, 22 Nov 2021 23:02:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 23 Nov 2021 00:06:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6379da58bf74612822c2e8c505cbe7402ba458b7
X-Git-Newrev: b134c8a2409aca6921a94e2e12c8062ad483c08e
X-Patchwork-Hint: ignore
Message-Id: <20211122230235.BD5D28F011@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/webkitgtk: add
 gobject-introspection optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=b134c8a2409aca6921a94e2e12c8062ad483c08e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enable introspection when GObject Introspection is enabled.
Midori 9.0 requires webkitgtk built with gobject-introspection
support.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/webkitgtk/webkitgtk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index a3db249ae6..4d5d0b89e2 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -21,7 +21,6 @@ WEBKITGTK_CONF_OPTS = \
 	-DENABLE_GAMEPAD=OFF \
 	-DENABLE_GEOLOCATION=OFF \
 	-DENABLE_GTKDOC=OFF \
-	-DENABLE_INTROSPECTION=OFF \
 	-DENABLE_MINIBROWSER=ON \
 	-DENABLE_SPELLCHECK=ON \
 	-DPORT=GTK \
@@ -59,6 +58,13 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+WEBKITGTK_CONF_OPTS += -DENABLE_INTROSPECTION=ON
+WEBKITGTK_DEPENDENCIES += gobject-introspection
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_INTROSPECTION=OFF
+endif
+
 # Only one target platform can be built, assume X11 > Wayland
 
 # GTK3-X11 target gives OpenGL from newer libgtk3 versions
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
