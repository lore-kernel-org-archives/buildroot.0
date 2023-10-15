Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57542CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 09:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C786C404A3;
	Sun, 15 Oct 2023 09:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C786C404A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nasJ04G3T_yq; Sun, 15 Oct 2023 09:33:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48D2540C53;
	Sun, 15 Oct 2023 09:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48D2540C53
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFE791BF8C7
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80AD640BFA
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80AD640BFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jpvx-TkMdxPz for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 09:33:15 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D703840A75
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 09:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D703840A75
Received: from fli4l.lan.fli4l (p54a1bf4b.dip0.t-ipconnect.de [84.161.191.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 22A7CA4C0C49
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 11:33:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45898)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qrxUk-0004D6-2h
 for buildroot@buildroot.org; Sun, 15 Oct 2023 11:33:10 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 11:33:07 +0200
Message-Id: <20231015093310.1138805-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697362391;
 bh=zN2FBqQil71vPy5T8jDtrPQBOXZez/FV8Fc3xkE+e/M=;
 h=From:To:Subject:Date:From;
 b=xQmJnwe67Sw7PaVSNfgVaGIPyqS/TMZUJkND96LeUKMWbRuEVYhl+B0ANaJ5oxhV3
 htRSkfz8JgS2U4vLM2sHrIb+Xe+xAtkwr081Whuh4UrKoCHmkwpiZQx6wRxISeB/pb
 1/x30JbIy0h5L0HJowE+7VkErO4tgVEuCjaWCri2Nc7uJpqk3xbbTkrPAooBqz4Lwb
 PeZmkMVtJIu/RalFnVG3Bfd7ABvBuYPuTAUy+e665guBR3QJ7qi9WgneZjYO4pNC56
 CpH1wwPybl7TviAXWf/Lm6JPoS6IWzGO1XWzehhCSMfwtm3xuPjAyfQaRMSihh22zT
 CFA9PSGXOYq2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=xQmJnwe6
Subject: [Buildroot] [PATCH v2 1/4] package/alsa-lib: fix musl build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 227d414ded bumped alsa-lib to version 1.2.10 which
introduced a build error with musl toolchains.

Fixes:
http://autobuild.buildroot.net/results/bce/bce46fd8aab9ef4918228e8cfc5f8b5abe71e859/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 ...STRING-macro-outside-PIC-ifdef-block.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/alsa-lib/0002-global-h-move-__STRING-macro-outside-PIC-ifdef-block.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
