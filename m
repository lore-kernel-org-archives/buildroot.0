Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9C5C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 09:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D541F418BC;
	Sun, 18 Sep 2022 09:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D541F418BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ty4LVt7Ycmjp; Sun, 18 Sep 2022 09:39:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B099E418B9;
	Sun, 18 Sep 2022 09:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B099E418B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 149FA1BF97F
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E510260E2E
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E510260E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qXv20T0fi4CE for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 09:39:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EA3860E27
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EA3860E27
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE85D84BF0; Sun, 18 Sep 2022 09:39:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 11:34:14 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 6138dc9857d3f1115c267ca401781010139d119b
X-Git-Newrev: a3f28c84f5d686d5c5c4dd6abdc3229d81b5000b
X-Patchwork-Hint: ignore
Message-Id: <20220918093924.EE85D84BF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] arch/xtensa: custom
 configuration requires an overlay
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3f28c84f5d686d5c5c4dd6abdc3229d81b5000b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Using a custom Xtensa configuration requires an overlay that provides
that configuration; not providing an overlay is like using the default
configuration, BR2_xtensa_fsf, so there would be no point in that case
in requesting a custom configuraiton.

Make providing an overlay mandatory for custom configurations.

Fixes:
    http://autobuild.buildroot.org/results/f0b/f0ba47d2534aeb3cc2921124aa639ae3aa072b9b

    xtensa-buildroot-linux-uclibc/bin/ld: ldso/ldso/ld-uClibc_so.a(ldso.oS): compiled for a big endian system and target is little endian

[1] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=include/xtensa-config.h;hb=2ee5e4300186a92ad73f1a1a64cb918dc76c8d67#l28

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
[yann.morin.1998@free.fr:
  - always require an overlay for custom configurations, not just for
    little endian ones
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4cbf7336914f25478aea943456ba7dc3c892c21a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/arch.mk.xtensa | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index fd410f6bfa..7b6c59cecd 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -1,3 +1,9 @@
+BR_ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
+
+ifeq ($(BR_BUILDING)$(BR2_XTENSA_CUSTOM):$(BR_ARCH_XTENSA_OVERLAY_FILE),yy:)
+$(error No xtensa overlay file provided. Check your BR2_XTENSA_OVERLAY_FILE setting)
+endif
+
 ################################################################################
 # This variable can be used by packages that need to extract the overlay.
 #
@@ -9,7 +15,6 @@
 #       tar xf $(ARCH_XTENSA_OVERLAY_FILE) -C $(@D) --strip-components=1 gcc
 #   endif
 ################################################################################
-BR_ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
 ifneq ($(filter http://% https://% ftp://% scp://%,$(BR_ARCH_XTENSA_OVERLAY_FILE)),)
 ARCH_XTENSA_OVERLAY_URL = $(BR_ARCH_XTENSA_OVERLAY_FILE)
 ARCH_XTENSA_OVERLAY_FILE = $($(PKG)_DL_DIR)/$(notdir $(BR_ARCH_XTENSA_OVERLAY_FILE))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
