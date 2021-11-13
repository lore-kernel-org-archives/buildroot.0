Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C1ADC433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:51:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ECFF61056
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2ECFF61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3BC882538;
	Sat, 13 Nov 2021 09:51:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TPOlBJzXhfl1; Sat, 13 Nov 2021 09:51:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C45E824CE;
	Sat, 13 Nov 2021 09:51:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C83511BF35E
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B770A4058D
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wv7Fy756pVtO for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 09:51:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15AC0402FE
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 09:51:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6228288974; Sat, 13 Nov 2021 09:47:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 10:40:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82f5b765779af0f530ccff6667b3c64e42b009dc
X-Git-Newrev: 4a36af9450d46fed830c62761662da119b3809a3
X-Patchwork-Hint: ignore
Message-Id: <20211113094705.6228288974@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glmark2: fix selection of
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a36af9450d46fed830c62761662da119b3809a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 9c068b4be8 (package/glmark2: fix wayland build) extended the set
of required libraries for various "flavor" options by selecting those
libraries from the blind options.

However, those blind options are true as soon as their requirements are
met (the depends on), even when glmark2 itself is not enabled.

This means that extra libraries are pulled in to the build, even when
not required.

We fix that by moving the actual selects to the main symbol, along with
the proper conditions. This means that we have two lines that select
wayland-protocols, under two different conditions; we could make that a
single select, but the condition would need to be on two lines anyway,
so meh...

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/glmark2/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
index 40d0adcc8a..ddc27479cf 100644
--- a/package/glmark2/Config.in
+++ b/package/glmark2/Config.in
@@ -24,7 +24,6 @@ config BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GLESV2
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
-	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 
 config BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GL
 	bool
@@ -33,7 +32,6 @@ config BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GL
 	depends on BR2_PACKAGE_HAS_LIBGL
 	depends on BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
-	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 
 config BR2_PACKAGE_GLMARK2_FLAVOR_X11_GLESV2
 	bool
@@ -64,6 +62,8 @@ config BR2_PACKAGE_GLMARK2
 	depends on BR2_PACKAGE_GLMARK2_FLAVOR_ANY
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GL
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GLESV2
 	help
 	  glmark2 is an OpenGL 2.0 and ES 2.0 benchmark.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
