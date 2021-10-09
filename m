Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95BFC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:09:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8A7560F57
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A8A7560F57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75A3440576;
	Sat,  9 Oct 2021 12:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZK4CtXfe45b; Sat,  9 Oct 2021 12:09:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A05E4058C;
	Sat,  9 Oct 2021 12:09:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D5F91BF36A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A70A40571
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O4OCE8sA74vg for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 12:03:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E97F740570
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 12:03:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2D222947C4; Sat,  9 Oct 2021 12:00:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 13:46:01 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 598be3d0da2c54e45f186366a02e9c16274c0e35
X-Git-Newrev: fa98ff21321e3a05579cc20d8fa6dd443175103b
X-Patchwork-Hint: ignore
Message-Id: <20211009120036.2D222947C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/mesa3d: remove
 unnecessary passing of CFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa98ff21321e3a05579cc20d8fa6dd443175103b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This package uses meson-package infrastracture, so we don't need to
explicitly pass its additional CFLAGS to some variable. The only thing we
need to pass them is to use MESA3D_CFLAGS, because in package/pkg-meson.mk
we have:
$(2)_CFLAGS ?= $$(TARGET_CFLAGS)
that makes the work automatically, where $(2) is exactly the package name,
though $(2)_CFLAGS expands to MESA3D_CFLAGS.
So let's remove the MESA3D_CONF_OPTS += -DCMAKE_C_FLAGS="$(MESA3D_CFLAGS)"
line that has been added by mistake.

Note: this doesn't fix any bug, but remove an unnecessary and ambiguos line

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4383fde622fd56404e87b23eb07565dfcac13ed4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/mesa3d.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1461c3a7c3..1dc6de787a 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -268,6 +268,4 @@ ifeq ($(BR2_m68k),y)
 MESA3D_CFLAGS += -mlong-jump-table-offsets
 endif
 
-MESA3D_CONF_OPTS += -DCMAKE_C_FLAGS="$(MESA3D_CFLAGS)"
-
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
