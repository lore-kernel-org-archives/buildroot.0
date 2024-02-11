Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A02C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8790840227;
	Sun, 11 Feb 2024 15:47:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KxKxOuUAh2lV; Sun, 11 Feb 2024 15:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C4EE40323
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C4EE40323;
	Sun, 11 Feb 2024 15:47:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC7F71BF3D0
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9B5C82156
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V0ZGJkXtoL7S for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:47:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 99A7682152
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99A7682152
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99A7682152
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:47:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 86029A4C0686;
 Sun, 11 Feb 2024 16:47:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42182)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rZC30-000000002c7-19bJ;
 Sun, 11 Feb 2024 16:47:14 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 16:47:13 +0100
Message-Id: <20240211154714.2311642-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1707666434;
 bh=NeqhKvdYUe2day67KU5Zz9MowO00WAokk/6u1D/K+SE=;
 h=From:To:Cc:Subject:Date:From;
 b=uhl6LpCVlOrvBk+7AUXUuaU4Jw+zntQEufS/ElSpeCBlcyhvIp/ldKks9yuEaXexM
 GCV3S3gMIy6su+U2yTHNxUgQoVrss2GKuUUQC7k2whOaMV4dx3hUE6f/wtyGdGqxRg
 m3QdhJyNrNOyedHpwttOF6VR14k5AezSEPTscP5yaNcWOGgg5ia/OWosdJRwMuw2lg
 YBQ8W4yKPIhDJiXyOyQjYJJlHnyBh8QIhsI/Cvd0nik+Ed9OrlFxYDwhTJKmyAv+sN
 mtD1KntmvDMNOVSdjfF+K+S4rXFyRbfjy/5y1Dbz5T5U93NS28d18RZIHNRdGragT9
 JpU/w6Gz2OKjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=uhl6LpCV
Subject: [Buildroot] [PATCH 1/2] package/alsa-lib: bump version to 1.2.11
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch which is included in this release.

Changelog:
https://www.alsa-project.org/wiki/Changes_v1.2.10_v1.2.11#alsa-lib

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...STRING-macro-outside-PIC-ifdef-block.patch | 50 -------------------
 package/alsa-lib/alsa-lib.hash                |  2 +-
 package/alsa-lib/alsa-lib.mk                  |  2 +-
 3 files changed, 2 insertions(+), 52 deletions(-)
 delete mode 100644 package/alsa-lib/0002-global-h-move-__STRING-macro-outside-PIC-ifdef-block.patch

diff --git a/package/alsa-lib/0002-global-h-move-__STRING-macro-outside-PIC-ifdef-block.patch b/package/alsa-lib/0002-global-h-move-__STRING-macro-outside-PIC-ifdef-block.patch
deleted file mode 100644
index 7bd67507fd..0000000000
--- a/package/alsa-lib/0002-global-h-move-__STRING-macro-outside-PIC-ifdef-block.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 10bd599970acc71c92f85eb08943eb8d3d702a9c Mon Sep 17 00:00:00 2001
-From: Jaroslav Kysela <perex@perex.cz>
-Date: Wed, 6 Sep 2023 15:16:44 +0200
-Subject: [PATCH] global.h: move __STRING() macro outside !PIC ifdef block
-
-It solves the musl libc compilation issue.
-
-control.c: In function 'snd_ctl_open_conf':
-../../include/global.h:98:36: warning: implicit declaration of function '__STRING' [-Wimplicit-function-declaratio]
-   98 | #define SND_DLSYM_VERSION(version) __STRING(version)
-      |                                    ^~~~~~~~
-
-Fixes: https://github.com/alsa-project/alsa-lib/issues/350
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-
-Upstream: https://github.com/alsa-project/alsa-lib/commit/10bd599970acc71c92f85eb08943eb8d3d702a9c
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- include/global.h | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/include/global.h b/include/global.h
-index dfe9bc2b..3ecaeee8 100644
---- a/include/global.h
-+++ b/include/global.h
-@@ -51,6 +51,11 @@ const char *snd_asoundlib_version(void);
- #define ATTRIBUTE_UNUSED __attribute__ ((__unused__))
- #endif
- 
-+#ifndef __STRING
-+/** \brief Return 'x' argument as string */
-+#define __STRING(x)     #x
-+#endif
-+
- #ifdef PIC /* dynamic build */
- 
- /** \hideinitializer \brief Helper macro for #SND_DLSYM_BUILD_VERSION. */
-@@ -71,11 +76,6 @@ struct snd_dlsym_link {
- 
- extern struct snd_dlsym_link *snd_dlsym_start;
- 
--#ifndef __STRING
--/** \brief Return 'x' argument as string */
--#define __STRING(x)     #x
--#endif
--
- /** \hideinitializer \brief Helper macro for #SND_DLSYM_BUILD_VERSION. */
- #define __SND_DLSYM_VERSION(prefix, name, version) _ ## prefix ## name ## version
- /**
diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index a6d9c7dbdc..830643dea8 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  c86a45a846331b1b0aa6e6be100be2a7aef92efd405cf6bac7eef8174baa920e  alsa-lib-1.2.10.tar.bz2
+sha256  9f3f2f69b995f9ad37359072fbc69a3a88bfba081fc83e9be30e14662795bb4d  alsa-lib-1.2.11.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 5dfcd1e861..246761d4e6 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.10
+ALSA_LIB_VERSION = 1.2.11
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
