Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F3AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 22:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72D2E60F25;
	Sat, 28 May 2022 22:09:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a9ceBC4UkFlt; Sat, 28 May 2022 22:09:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 696C260C12;
	Sat, 28 May 2022 22:09:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F6041BF580
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 22:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E3B08485B
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 22:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IoqlpWVkhCfT for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 22:09:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51202846C9
 for <buildroot@buildroot.org>; Sat, 28 May 2022 22:09:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CEB008649A; Sat, 28 May 2022 21:58:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 00:02:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b512056381e53deb2ea5e3228643ef6422c51bf
X-Git-Newrev: 31962ae9383bf47c5632ced82ddaaf25b8625c49
X-Patchwork-Hint: ignore
Message-Id: <20220528215812.CEB008649A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwebsockets: disable -Werror
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

commit: https://git.buildroot.net/buildroot/commit/?id=31962ae9383bf47c5632ced82ddaaf25b8625c49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable -Werror (enabled by default) through DISABLE_WERROR which is
available since version 4.1.0 and
https://github.com/warmcat/libwebsockets/commit/c9c152baba1fbd6e2b061b16a5c987a80309caee
to avoid the following build failure with gcc 4.8 and libev:

/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/libwebsockets-4.3.1/lib/event-libs/libev/libev.c: In function 'lws_ev_hrtimer_cb':
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/libwebsockets-4.3.1/lib/event-libs/libev/libev.c:44:3: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
   ev_timer_set(&ptpr->hrtimer, ((float)us) / 1000000.0, 0);
   ^

Fixes:
 - http://autobuild.buildroot.org/results/75ddbd2e0b058b69a99a2a2f01c62dedad1199c0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libwebsockets/libwebsockets.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 63d50999a5..3a9b9ea88f 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -11,6 +11,7 @@ LIBWEBSOCKETS_LICENSE_FILES = LICENSE
 LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_INSTALL_STAGING = YES
 LIBWEBSOCKETS_CONF_OPTS = \
+	-DDISABLE_WERROR=ON \
 	-DLWS_WITHOUT_TESTAPPS=ON \
 	-DLWS_IPV6=ON \
 	-DLWS_UNIX_SOCK=ON \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
