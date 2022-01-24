Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53ACEC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 17:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01CFF401CA;
	Mon, 24 Jan 2022 17:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2UzcDm4WWZ_n; Mon, 24 Jan 2022 17:36:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 042DD405F2;
	Mon, 24 Jan 2022 17:36:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D61A1BF487
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09A6760EBF
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:36:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id krlig2-hqlwe for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 17:36:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BEFB60A79
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 17:36:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C6FA982B33; Mon, 24 Jan 2022 17:29:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 17:33:39 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: b2619c07f0a479cbdc3739b12d1e7a0cc4ffd562
X-Git-Newrev: 4294adf244cd5083ba957a106c4a13562692367d
X-Patchwork-Hint: ignore
Message-Id: <20220124172936.C6FA982B33@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/cage: only enable
 XWayland if wlroots has X11
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

commit: https://git.buildroot.net/buildroot/commit/?id=4294adf244cd5083ba957a106c4a13562692367d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Cage requires wlroots to be built with X11 enabled
in order to enable XWayland, otherwise it will fail
with error:

"ERROR: Problem encountered: Cannot build Cage with
XWayland support: wlroots has been built without it"

Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
[yann.morin.1998@free.fr:
  - drop explicit _XORG7, as _WLROOTS_X11 depends on it
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3e4c2d6213a09e9a0c598f800510acd6687ffcda)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cage/cage.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cage/cage.mk b/package/cage/cage.mk
index 9fc01d36c1..731702b4d3 100644
--- a/package/cage/cage.mk
+++ b/package/cage/cage.mk
@@ -10,7 +10,7 @@ CAGE_LICENSE = MIT
 CAGE_LICENSE_FILES = LICENSE
 CAGE_DEPENDENCIES = host-pkgconf wlroots
 
-ifeq ($(BR2_PACKAGE_XORG7),y)
+ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
 CAGE_CONF_OPTS = -Dxwayland=true
 else
 CAGE_CONF_OPTS = -Dxwayland=false
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
