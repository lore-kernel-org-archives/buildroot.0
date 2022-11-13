Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFF0C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3702E4087E;
	Mon, 20 Feb 2023 21:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3702E4087E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMmFRd4bOKEp; Mon, 20 Feb 2023 21:18:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3AF242CE1;
	Mon, 20 Feb 2023 21:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3AF242CE1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1259C1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A458610BC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A458610BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Sn_iklAatks for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 426AF610A6
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 426AF610A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B0BC828C8; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 15:09:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9c333176a3dae8aa4fa5468e3345d71bc10c44ca
X-Git-Newrev: 0910ada70b7194596c6ace0cb06b303173c13de7
X-Patchwork-Hint: ignore
Message-Id: <20230220205150.3B0BC828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/imagemagick: utilities
 now need C++ support
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

commit: https://git.buildroot.net/buildroot/commit/?id=0910ada70b7194596c6ace0cb06b303173c13de7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since upstream commit
https://github.com/ImageMagick/ImageMagick/commit/07f3b487f9860fd4eb9422f1a906d0fe83b6fd1c
(which first appeared in version 7.1.0-47), ImageMagick forces the
need of a C++ compiler to build its utilities. Despite the request of
Bernd Kuhls to revert this change, upstream declined.

Since this change is causing build failures in our autobuilders, our
only choice is to follow the choice of upstream, and disable building
the utilities when C++ support is not available.

Fixes:

  http://autobuild.buildroot.net/results/4283235d697408cf2e70be5e3769dbe6ebb9ddae/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/imagemagick/imagemagick.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 6bdf24c1e8..8a2ec460d5 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -178,6 +178,12 @@ else
 IMAGEMAGICK_CONF_OPTS += --without-bzlib
 endif
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+IMAGEMAGICK_CONF_OPTS += --with-utilities
+else
+IMAGEMAGICK_CONF_OPTS += --without-utilities
+endif
+
 HOST_IMAGEMAGICK_CONF_OPTS = \
 	--disable-opencl \
 	--disable-openmp \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
