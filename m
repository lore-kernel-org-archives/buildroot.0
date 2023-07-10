Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC57C001B0
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 18:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E41E3409A1;
	Mon, 10 Jul 2023 18:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E41E3409A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6_UcdZLVxg9Q; Mon, 10 Jul 2023 18:38:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D27714090C;
	Mon, 10 Jul 2023 18:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D27714090C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0EEB1BF3AE
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7B8161002
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7B8161002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H3ifg8-Nt8jf for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 18:38:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBC2D60FFA
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 18:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBC2D60FFA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6E0E86CBD; Mon, 10 Jul 2023 18:38:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 20:36:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36c29522ae6840eb8815a4e0c037f4cd17b1f126
X-Git-Newrev: e70fefa3b89d445d2695109c02e7b65c6b3062c1
X-Patchwork-Hint: ignore
Message-Id: <20230710183823.C6E0E86CBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-meson.mk: disable staticpic on
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e70fefa3b89d445d2695109c02e7b65c6b3062c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build error in the upcoming libdisplay-info package:
"Tried to convert PC relative branch to absolute jump" as described
here: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101971#c11

Since this issue not only occurs with this package, see
https://git.busybox.net/buildroot/commit/?id=2a48a6ee9d6b81c804182ff0ad6e0f7c850f6839
we add the configure option to pkg-meson.mk.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
