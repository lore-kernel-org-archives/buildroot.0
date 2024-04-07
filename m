Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63DDCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 16:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B699B820B4;
	Sun,  7 Apr 2024 16:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0l7dn661y63; Sun,  7 Apr 2024 16:26:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 447A582077
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 447A582077;
	Sun,  7 Apr 2024 16:26:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF2491BF326
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 226DF6085E
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tCZUrnqW1mGl for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 16:26:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C086606DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C086606DE
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 16:26:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DBAA8143C; Sun,  7 Apr 2024 16:26:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 18:25:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4922233cb0c8b0355acf8e96ac0eb59422405c17
X-Git-Newrev: 46bb598f1a67ed2bf7acef8b17ea09ee0f425d8e
X-Patchwork-Hint: ignore
Message-Id: <20240407162602.1DBAA8143C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dmenu-wayland: fix uclibc build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=46bb598f1a67ed2bf7acef8b17ea09ee0f425d8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set -std=gnu99 to fix the following uclibc build failure raised since
the addition of the package in commit
2f6b1b8e6893003efcc72185cd468dcb0b088b2d:

../draw.c:37:23: error: 'CLOCK_REALTIME' undeclared (first use in this function)
   37 |         clock_gettime(CLOCK_REALTIME, &ts);
      |                       ^~~~~~~~~~~~~~

Fixes: 2f6b1b8e6893003efcc72185cd468dcb0b088b2d
 - http://autobuild.buildroot.org/results/4b9db67fb444ec35d741e5d3e74263ac0c4d4a7d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/dmenu-wayland/dmenu-wayland.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dmenu-wayland/dmenu-wayland.mk b/package/dmenu-wayland/dmenu-wayland.mk
index 33a73c0153..fec984194c 100644
--- a/package/dmenu-wayland/dmenu-wayland.mk
+++ b/package/dmenu-wayland/dmenu-wayland.mk
@@ -8,6 +8,7 @@ DMENU_WAYLAND_VERSION = a380201dff5bfac2dace553d7eaedb6cea6855f9
 DMENU_WAYLAND_SITE = $(call github,nyyManni,dmenu-wayland,$(DMENU_WAYLAND_VERSION))
 DMENU_WAYLAND_LICENSE = MIT
 DMENU_WAYLAND_LICENSE_FILES = LICENSE
+DMENU_WAYLAND_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 
 # host-wayland is for wayland-scanner
 DMENU_WAYLAND_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
