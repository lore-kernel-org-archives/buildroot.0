Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FFBC4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 12:40:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC05360FC4
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 12:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC05360FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7593F404B9;
	Mon,  2 Aug 2021 12:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u8zhiVXidFAh; Mon,  2 Aug 2021 12:40:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF27A403DC;
	Mon,  2 Aug 2021 12:40:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10A801BF402
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 12:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8561838CC
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 12:40:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tZXtoq9oETCk for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 12:40:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2852D835D3
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 12:40:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 939D38A520; Mon,  2 Aug 2021 12:40:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 Aug 2021 14:36:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db380596e3a6b65f6a0272c342ea7247e7305fcd
X-Git-Newrev: 4510c38431ba5e0dcd52ef0307011b048b7d46d2
X-Patchwork-Hint: ignore
Message-Id: <20210802124015.939D38A520@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: DRI drivers need either
 glx, egl or gbm
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=4510c38431ba5e0dcd52ef0307011b048b7d46d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build error:
../output-1/build/mesa3d-21.1.5/meson.build:520:4:
 ERROR: Problem encountered: building dri drivers require at least one windowing system

OSMesa is not seen as a valid windowing system for DRI drivers anymore:
https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=21.1&id=ee802372180a2b4460cc7abb53438e45c6b6f1e4

Commit 15a2f9b819806d38a7d8172a20f80130b1d60e63 blindly renamed
BR2_PACKAGE_MESA3D_OSMESA_CLASSIC to BR2_PACKAGE_MESA3D_OSMESA_GALLIUM
without checking for this particular case.

Fixes:
http://autobuild.buildroot.net/results/46e3a66ddc13a064e512aad0f3afd8655889ab9d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mesa3d/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index d1b3af2054..41c90c49af 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -63,8 +63,7 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_MESA3D_DRIVER
 	select BR2_PACKAGE_MESA3D_GBM if \
 		!BR2_PACKAGE_MESA3D_OPENGL_GLX && \
-		!BR2_PACKAGE_MESA3D_OPENGL_EGL && \
-		!BR2_PACKAGE_MESA3D_OSMESA_GALLIUM
+		!BR2_PACKAGE_MESA3D_OPENGL_EGL
 	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
 		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
