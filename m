Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F976CDB482
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48FD8414C6;
	Sun, 15 Oct 2023 20:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48FD8414C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wv2GA48VWXKW; Sun, 15 Oct 2023 20:13:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32C21414CF;
	Sun, 15 Oct 2023 20:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32C21414CF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EC9A1BF28F
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 155E581DF2
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 155E581DF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pvNs4SHtMgqZ for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:13:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1AF8817C0
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1AF8817C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADB5985A84; Sun, 15 Oct 2023 20:13:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 22:05:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8ff60cff9402dcd04fffb67af15dfe2caab0995
X-Git-Newrev: 8fb216e977c8aeae1b6736bade53e2bb7b382d60
X-Patchwork-Hint: ignore
Message-Id: <20231015201321.ADB5985A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-lib: fix musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=8fb216e977c8aeae1b6736bade53e2bb7b382d60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 227d414ded bumped alsa-lib to version 1.2.10 which
introduced a build error with musl toolchains.

Fixes:
http://autobuild.buildroot.net/results/bce/bce46fd8aab9ef4918228e8cfc5f8b5abe71e859/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...ve-__STRING-macro-outside-PIC-ifdef-block.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/alsa-lib/0002-global-h-move-__STRING-macro-outside-PIC-ifdef-block.patch b/package/alsa-lib/0002-global-h-move-__STRING-macro-outside-PIC-ifdef-block.patch
new file mode 100644
index 0000000000..7bd67507fd
--- /dev/null
+++ b/package/alsa-lib/0002-global-h-move-__STRING-macro-outside-PIC-ifdef-block.patch
@@ -0,0 +1,50 @@
+From 10bd599970acc71c92f85eb08943eb8d3d702a9c Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Wed, 6 Sep 2023 15:16:44 +0200
+Subject: [PATCH] global.h: move __STRING() macro outside !PIC ifdef block
+
+It solves the musl libc compilation issue.
+
+control.c: In function 'snd_ctl_open_conf':
+../../include/global.h:98:36: warning: implicit declaration of function '__STRING' [-Wimplicit-function-declaratio]
+   98 | #define SND_DLSYM_VERSION(version) __STRING(version)
+      |                                    ^~~~~~~~
+
+Fixes: https://github.com/alsa-project/alsa-lib/issues/350
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+Upstream: https://github.com/alsa-project/alsa-lib/commit/10bd599970acc71c92f85eb08943eb8d3d702a9c
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ include/global.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/include/global.h b/include/global.h
+index dfe9bc2b..3ecaeee8 100644
+--- a/include/global.h
++++ b/include/global.h
+@@ -51,6 +51,11 @@ const char *snd_asoundlib_version(void);
+ #define ATTRIBUTE_UNUSED __attribute__ ((__unused__))
+ #endif
+ 
++#ifndef __STRING
++/** \brief Return 'x' argument as string */
++#define __STRING(x)     #x
++#endif
++
+ #ifdef PIC /* dynamic build */
+ 
+ /** \hideinitializer \brief Helper macro for #SND_DLSYM_BUILD_VERSION. */
+@@ -71,11 +76,6 @@ struct snd_dlsym_link {
+ 
+ extern struct snd_dlsym_link *snd_dlsym_start;
+ 
+-#ifndef __STRING
+-/** \brief Return 'x' argument as string */
+-#define __STRING(x)     #x
+-#endif
+-
+ /** \hideinitializer \brief Helper macro for #SND_DLSYM_BUILD_VERSION. */
+ #define __SND_DLSYM_VERSION(prefix, name, version) _ ## prefix ## name ## version
+ /**
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
