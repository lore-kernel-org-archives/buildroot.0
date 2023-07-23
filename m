Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAB7C001DE
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 14:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41D0D81A58;
	Sun, 23 Jul 2023 14:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41D0D81A58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZC22Rnxqj31h; Sun, 23 Jul 2023 14:19:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8573781496;
	Sun, 23 Jul 2023 14:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8573781496
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5C5D1BF3EB
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 14:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C016481496
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 14:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C016481496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YJYHzMUt2qnm for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 14:19:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC08E81467
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 14:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC08E81467
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8DA1826DF; Sun, 23 Jul 2023 14:19:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 16:17:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3367170667fba95f2b9c45b9b6285bb9cb252df
X-Git-Newrev: b600dbc3191409b52517686bf08aa1d08c31d96e
X-Patchwork-Hint: ignore
Message-Id: <20230723141917.D8DA1826DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/transmission: fix gtk dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=b600dbc3191409b52517686bf08aa1d08c31d96e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 80793107a65d95f8dfd0317a726d3a737c78ef67 forgot to add
packages needed for gtk support:
https://github.com/transmission/transmission/blob/main/CMakeLists.txt#L40

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[yann.morin.1998@free.fr:
  - don't add dependencies to C++ or wh-char, already global deps
  - propagate sync-4 dependency to comment
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/transmission/Config.in       | 7 ++++++-
 package/transmission/transmission.mk | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index fd4c897497..eeaa7890fb 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -37,11 +37,16 @@ config BR2_PACKAGE_TRANSMISSION_DAEMON
 
 config BR2_PACKAGE_TRANSMISSION_GTK
 	bool "transmission-gtk"
+	depends on !BR2_nios2 # gtkmm3
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pangomm, libgtk3 -> pango -> harfbuzz -> gtkmm3
 	depends on BR2_PACKAGE_LIBGTK3 && BR2_SYSTEM_ENABLE_NLS
+	select BR2_PACKAGE_GTKMM3
 	help
 	  Install transmission GTK-based GUI interface.
 
-comment "transmission-gtk needs NLS enabled"
+comment "transmission-gtk needs libgtk3 and a toolchain with NLS enabled"
+	depends on !BR2_nios2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGTK3 && !BR2_SYSTEM_ENABLE_NLS
 endif
 
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index f3a200ced3..26deeefa34 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -74,7 +74,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_GTK),y)
 TRANSMISSION_CONF_OPTS += -DENABLE_GTK=ON
-TRANSMISSION_DEPENDENCIES += libgtk3
+TRANSMISSION_DEPENDENCIES += gtkmm3 libgtk3
 else
 TRANSMISSION_CONF_OPTS += -DENABLE_GTK=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
