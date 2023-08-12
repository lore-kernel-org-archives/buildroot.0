Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E256C001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 18:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05E14400C1;
	Sat, 12 Aug 2023 18:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05E14400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YtC8uzkNsHTF; Sat, 12 Aug 2023 18:33:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FC5D40577;
	Sat, 12 Aug 2023 18:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FC5D40577
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B39B1BF41F
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 18:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32A80606AA
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 18:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32A80606AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pH74DGHNalPG for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 18:33:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A4FD60648
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 18:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A4FD60648
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15A6A8477C; Sat, 12 Aug 2023 18:33:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 17:32:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d6dde8fc0cf44e631ce7d3df6f956cb35f8cf1e9
X-Git-Newrev: 534c22dd606e200969fce49b8d23b27902dec94e
X-Patchwork-Hint: ignore
Message-Id: <20230812183317.15A6A8477C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/weston: fix the
 configuration of simple-clients
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

commit: https://git.buildroot.net/buildroot/commit/?id=534c22dd606e200969fce49b8d23b27902dec94e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

commit 7329a0db442026c6b856e76ea964107fa3c730f3
"weston: disable v4l simple dmabuf for headers < 3.8"
disabled dmabuf-v4l-client when kernel headers are older than v3.8.
This commit was made at the time the weston package was at version
1.10.0, using the autotools package infra.

commit e672eb5c39fa626f8e924269cec2056be9e14ded
"package/weston: bump to version 8.0.0"
replaced the package infra to meson (since upstream deprecated
autotools). This commit changed a disable of dmabuf-v4l-client in
autotools, by enabling it only if supported. The end result is that
the current meson package recipe disable ALL simple clients, or just
enable dmabuf-v4l-client when supported. In all cases, all other
weston simple clients are disabled. This behavior is not convenient
since some of those simple clients are useful to test the correct
operation of Weston and the rest of the graphic stack.

This commit fixes this issue by enabling all supported simple clients.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/weston/weston.mk | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 437c6f2e38..5f8d915d5a 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -22,13 +22,22 @@ WESTON_CONF_OPTS = \
 	-Dlauncher-libseat=true \
 	-Dtools=calibrator,debug,info,terminal,touch-calibrator
 
-# Uses VIDIOC_EXPBUF, only available from 3.8+
+WESTON_SIMPLE_CLIENTS = \
+	damage \
+	dmabuf-egl \
+	dmabuf-feedback \
+	egl \
+	im \
+	shm \
+	touch
+
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),y)
-WESTON_CONF_OPTS += -Dsimple-clients=dmabuf-v4l
-else
-WESTON_CONF_OPTS += -Dsimple-clients=
+# dmabuf-v4l uses VIDIOC_EXPBUF, only available from 3.8+
+WESTON_SIMPLE_CLIENTS += dmabuf-v4l
 endif
 
+WESTON_CONF_OPTS += -Dsimple-clients=$(subst $(space),$(comma),$(strip $(WESTON_SIMPLE_CLIENTS)))
+
 ifeq ($(BR2_PACKAGE_JPEG),y)
 WESTON_CONF_OPTS += -Dimage-jpeg=true
 WESTON_DEPENDENCIES += jpeg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
