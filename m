Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3245FE80A88
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 05:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84CBE60B71;
	Wed, 27 Sep 2023 05:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84CBE60B71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D1iFXA87KQhf; Wed, 27 Sep 2023 05:22:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABEAD60BBD;
	Wed, 27 Sep 2023 05:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABEAD60BBD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5D601BF23C
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 05:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EDEB827FD
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 05:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EDEB827FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PKTrd_BUGmU6 for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 05:22:08 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17FDB82796
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 05:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17FDB82796
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D758EA4C06F9
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 07:22:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42618)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qlMzs-0005zJ-10
 for buildroot@buildroot.org; Wed, 27 Sep 2023 07:22:04 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 07:22:04 +0200
Message-Id: <20230927052204.231589-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695792124;
 bh=OlMNpiHS5hNgi/l1DsYJhjguNTdSPKe+jAbswHYT3h0=;
 h=From:To:Subject:Date:From;
 b=BxP5mqVzKLuUqPDD4hjkf0JSvDVnnX0/aUaZvz4sJWyhpx+mMiKdQrkx8BpboLydc
 i+KgVQkOiGO3fPgxOjj8uDgOefKDAyHRGgot4BC5//wTjYwYCRmr3tNGmzsrlbnl3n
 4milJJaB2sIOB76f2GABSCyuW3PhwTgbyj82NR6puG2XoiUdnTe2S36bOL/Y0wSBxV
 Gr3YMGn7x6/IOR2gQExEnT6b8hGp2q8vzD1dds5FpmmGZDAz04AyOCvKkT6sB2j5mP
 TQ+VJ3nyMVHGG6VZx2CS1mu3m+vUgWUfSGW/4Wbe+Not0eMppsLC7DLWU2a3qIjkyl
 zbfmI8SwbJZSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=BxP5mqVz
Subject: [Buildroot] [PATCH 1/1] package/alsa-lib: fix musl build
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
