Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAA1C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:03:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0662E619EA
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0662E619EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D030180F68;
	Wed, 17 Nov 2021 22:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wboXYu14bwj8; Wed, 17 Nov 2021 22:03:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31FC3826E7;
	Wed, 17 Nov 2021 22:03:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C3C91BF307
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C3F9826E7
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id swht02xyZxIM for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 22:02:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 799A8826D6
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 22:02:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 685878D5F4; Wed, 17 Nov 2021 21:58:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 22:54:10 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: db39403155f445b5c8a9d18ccda98c299c740abb
X-Git-Newrev: 8dea79bf8544e6f0629d08ef29f387825192ac16
X-Patchwork-Hint: ignore
Message-Id: <20211117215831.685878D5F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/glmark2: fix
 selection of dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=8dea79bf8544e6f0629d08ef29f387825192ac16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
(cherry picked from commit 4a36af9450d46fed830c62761662da119b3809a3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
