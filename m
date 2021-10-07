Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F37CC433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:14:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B90261108
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B90261108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEFD340161;
	Thu,  7 Oct 2021 20:14:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KLaImE8V_L3V; Thu,  7 Oct 2021 20:14:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C19E401AD;
	Thu,  7 Oct 2021 20:14:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10C531BF84C
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 220B4409CC
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:13:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pf3FHha1BF8U for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 20:13:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60997409D2
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 20:13:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 70C2C934E0; Thu,  7 Oct 2021 20:11:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Oct 2021 22:12:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf87ae9cff6294c1eefc3c1cebb94e99ddccdd9e
X-Git-Newrev: 4383fde622fd56404e87b23eb07565dfcac13ed4
X-Patchwork-Hint: ignore
Message-Id: <20211007201100.70C2C934E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: remove unnecessary passing
 of CFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=4383fde622fd56404e87b23eb07565dfcac13ed4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/mesa3d/mesa3d.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f1862aed69..dc63d8c9f4 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -266,6 +266,4 @@ ifeq ($(BR2_m68k),y)
 MESA3D_CFLAGS += -mlong-jump-table-offsets
 endif
 
-MESA3D_CONF_OPTS += -DCMAKE_C_FLAGS="$(MESA3D_CFLAGS)"
-
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
