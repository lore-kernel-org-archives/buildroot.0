Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19802C25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 21:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9FE440228;
	Tue,  4 Jun 2024 21:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MU77kBZFhslO; Tue,  4 Jun 2024 21:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7920C40256
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7920C40256;
	Tue,  4 Jun 2024 21:33:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2B641BF82F
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 21:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47F5E60618
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 21:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id owpd3gwqejLG for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 21:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 705A860704
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 705A860704
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 21:33:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A51487B2E; Tue,  4 Jun 2024 21:33:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 4 Jun 2024 23:33:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6e0f1b6226c4dadb07d430fdc751a95fbccb272
X-Git-Newrev: 9f39676bdbd4936669a128c544ade514b3afef6a
X-Patchwork-Hint: ignore
Message-Id: <20240604213332.5A51487B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/octave: add optional {Graphics,
 Image}Magick++ support
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f39676bdbd4936669a128c544ade514b3afef6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/octave/octave.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index a087961be9..6a21bef7b8 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -26,6 +26,16 @@ else
 OCTAVE_CONF_OPTS += --without-bz2
 endif
 
+ifeq ($(BR2_PACKAGE_GRAPHICSMAGICK),y)
+OCTAVE_CONF_OPTS += --with-magick=GraphicsMagick++
+OCTAVE_DEPENDENCIES += graphicsmagick
+else ifeq ($(BR2_PACKAGE_IMAGEMAGICK),y)
+OCTAVE_CONF_OPTS += --with-magick=ImageMagick++
+OCTAVE_DEPENDENCIES += imagemagick
+else
+OCTAVE_CONF_OPTS += --without-magick
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 OCTAVE_CONF_OPTS += \
 	--enable-readline \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
