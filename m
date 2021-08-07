Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3952C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:49:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6797261042
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6797261042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 383DB60657;
	Sat,  7 Aug 2021 20:49:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fKIQIPOdj3bi; Sat,  7 Aug 2021 20:49:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9643860652;
	Sat,  7 Aug 2021 20:49:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1D911BF3F7
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C594B400CC
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:48:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Y_smj8BU7OQ for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 20:48:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 380044017C
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 20:48:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 271FC8CA9D; Sat,  7 Aug 2021 20:48:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 21:30:08 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 82b03cfd69637cee334a29555f97ab3d9bbc208a
X-Git-Newrev: 8ca0833767aaafa5becf9a6aa606c5cc2be1f818
X-Patchwork-Hint: ignore
Message-Id: <20210807204835.271FC8CA9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/mesa3d: DRI
 drivers need either glx, egl or gbm
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ca0833767aaafa5becf9a6aa606c5cc2be1f818
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
(cherry picked from commit 4510c38431ba5e0dcd52ef0307011b048b7d46d2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 0a9e95a799..642088cfe9 100644
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
