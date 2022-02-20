Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55936C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 20:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC8DA8146D;
	Sun, 20 Feb 2022 20:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h2RiI2RFqiTw; Sun, 20 Feb 2022 20:52:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 462BD81463;
	Sun, 20 Feb 2022 20:52:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB6921BF4E6
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 20:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9F8660BAE
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 20:52:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gw9z01LflCn2 for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 20:52:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33C5C60BA5
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 20:52:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 705B183489; Sun, 20 Feb 2022 20:44:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 21:52:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 057e89c9c596cb876379757cb530fdb8a8d42bf3
X-Git-Newrev: 5663f3679dbeef791d3e0dcf8c8695b2312044db
X-Patchwork-Hint: ignore
Message-Id: <20220220204447.705B183489@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: use lcms2 if available
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

commit: https://git.buildroot.net/buildroot/commit/?id=5663f3679dbeef791d3e0dcf8c8695b2312044db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make webkitgtk enable color management support if the lcms2 package has
been selected.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index eaf98900ef..36e4b8943b 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -24,7 +24,6 @@ WEBKITGTK_CONF_OPTS = \
 	-DENABLE_MINIBROWSER=ON \
 	-DENABLE_SPELLCHECK=ON \
 	-DPORT=GTK \
-	-DUSE_LCMS=OFF \
 	-DUSE_LIBNOTIFY=OFF \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_OPENJPEG=ON \
@@ -59,6 +58,13 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+WEBKITGTK_CONF_OPTS += -DUSE_LCMS=ON
+WEBKITGTK_DEPENDENCIES += lcms2
+else
+WEBKITGTK_CONF_OPTS += -DUSE_LCMS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_INTROSPECTION=ON
 WEBKITGTK_DEPENDENCIES += gobject-introspection
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
