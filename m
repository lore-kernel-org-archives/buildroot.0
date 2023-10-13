Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73821CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 18:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 254774180F;
	Fri, 13 Oct 2023 18:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 254774180F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0c133ILi-iSk; Fri, 13 Oct 2023 18:51:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E075B4188D;
	Fri, 13 Oct 2023 18:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E075B4188D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25BA91BF2BA
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F08AC40C22
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F08AC40C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xiMVETiK9Nuo for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 18:45:59 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F6C74018B
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 18:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F6C74018B
Received: from fli4l.lan.fli4l (p54a1b15c.dip0.t-ipconnect.de [84.161.177.92])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5E2E6A4C018B
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 20:45:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49950)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qrNAY-0005se-1B
 for buildroot@buildroot.org; Fri, 13 Oct 2023 20:45:54 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 20:45:51 +0200
Message-Id: <20231013184554.337101-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697222755;
 bh=OlMNpiHS5hNgi/l1DsYJhjguNTdSPKe+jAbswHYT3h0=;
 h=From:To:Subject:Date:From;
 b=MZasm8IjXSSjcWKSl15IAV9oYtDUTObUyT+ju7FFO5oPAlRxBT0OscLnr9kSUbgXF
 sn0v1D10GocyXb3K2z23uuSpn5BN2Fv84itdxSCT27ziIm83WEPjJsOHTvHAb7AcJq
 oL9wfTRY9zL0ndHUx+5dOZhMa//IlLI7MVcoQ5N3U9Y5LfrjQNwhS7sVVusewO/4oT
 exfSs34tCtGuun7a8tKILbX3/OPVKu8lLpADYRo3MhGTiV5EAkA88ofIohKqebhRZ1
 nAsjXcgHr+xVBPNNN/AG5txDCcv3ldfsJqlVWppDaybndO1dXU/mVRGde7s7P70U0c
 DYUdjdR//Xqpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=MZasm8Ij
Subject: [Buildroot] [PATCH 1/4] package/alsa-lib: fix musl build
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
