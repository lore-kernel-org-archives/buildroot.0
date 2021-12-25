Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E40FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 15:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF2974057E;
	Sat, 25 Dec 2021 15:30:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2JwBYPWd2RJ1; Sat, 25 Dec 2021 15:30:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D5364057C;
	Sat, 25 Dec 2021 15:30:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18CA51BF32E
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 15:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 157AD825C7
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 15:30:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kOqdkPFjgqwY for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 15:30:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 714FB818D7
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 15:30:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9E72382AA5; Sat, 25 Dec 2021 15:24:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Dec 2021 16:29:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea667f523aee0a4cb38a2be524bc46a2cc9f26e0
X-Git-Newrev: 3e4c2d6213a09e9a0c598f800510acd6687ffcda
X-Patchwork-Hint: ignore
Message-Id: <20211225152439.9E72382AA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cage: only enable XWayland if
 wlroots has X11
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e4c2d6213a09e9a0c598f800510acd6687ffcda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/cage/cage.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cage/cage.mk b/package/cage/cage.mk
index a661857a95..c132f086f6 100644
--- a/package/cage/cage.mk
+++ b/package/cage/cage.mk
@@ -11,7 +11,7 @@ CAGE_LICENSE_FILES = LICENSE
 CAGE_DEPENDENCIES = host-pkgconf wlroots
 CAGE_CONF_OPTS = -Dman-pages=disabled
 
-ifeq ($(BR2_PACKAGE_XORG7),y)
+ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
 CAGE_CONF_OPTS += -Dxwayland=true
 else
 CAGE_CONF_OPTS += -Dxwayland=false
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
