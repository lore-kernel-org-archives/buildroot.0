Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FE3EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 18:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 602A161149;
	Sun, 18 Jun 2023 18:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 602A161149
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJPwVmr8Copq; Sun, 18 Jun 2023 18:31:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E18560F77;
	Sun, 18 Jun 2023 18:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E18560F77
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 265AF1BF59B
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 18:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B5EA414E4
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 18:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B5EA414E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hHP7UkfDTn2W for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 18:31:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6500414D8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6500414D8
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 18:31:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0f96.dip0.t-ipconnect.de [91.58.15.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 99210A4C00DD;
 Sun, 18 Jun 2023 20:31:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54440)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qAxB3-0000ZL-1H;
 Sun, 18 Jun 2023 20:31:05 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 20:31:04 +0200
Message-Id: <20230618183105.2474342-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687113065;
 bh=vuahN0BmVTurmLdiBRb6fwLgdwBFN92tW1Ga+kElVXE=;
 h=From:To:Cc:Subject:Date:From;
 b=bmU/CqD09uMW7wZTRrrIV8XdWLsm5v7qJSGLRUCuC1rMmTy8pg7Ayw7yHgl3lVYwN
 WTfrtGLKaWxnnBktYOnq6YKuGLXI3dbfsMasi1tNV/8fv0WkwpqA0qaYtFDSVBkwn+
 3JhQcZ4G2l6x7C0/IVBbORZQPbODSATXgowDVhMgDnME7FOjh+zsY6ngCh3b2GVz5W
 BJOxBhNvD7Uw3OBCgzZnS4Uutu+KPC5WBBjAtMp4SLqwVxR/9NyvNERcU/mCnzK9DM
 0Mpq71kZrLtO7POIoEKQbDfHa6rcIezxu7AjgU7w9l/L+U20Ynl4LaOgbKcWb32yr7
 7mPpTIFVo8qww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=bmU/CqD0
Subject: [Buildroot] [PATCH 1/2] package/pkg-meson.mk: disable staticpic on
 Coldfire
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes build error in the upcoming libdisplay-info package:
"Tried to convert PC relative branch to absolute jump" as described
here: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101971#c11

Since this issue not only occurs with this package, see
https://git.busybox.net/buildroot/commit/?id=2a48a6ee9d6b81c804182ff0ad6e0f7c850f6839
we add the configure option to pkg-meson.mk.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Suggested by Yann:
https://lists.buildroot.org/pipermail/buildroot/2023-June/669138.html

 package/pkg-meson.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 4aa6e44afa..65cabf23ba 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -156,6 +156,7 @@ define $(2)_CONFIGURE_CMDS
 		--buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
 		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
 		-Db_pie=false \
+		-Db_staticpic=$(if $(BR2_m68k_cf),false,true) \
 		-Dstrip=false \
 		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
 		-Dbuild.cmake_prefix_path=$$(HOST_DIR)/lib/cmake \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
