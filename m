Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397F2CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 11:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DECFF81F9A;
	Sun,  7 Apr 2024 11:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRaD1nJgDMyA; Sun,  7 Apr 2024 11:45:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF6A181FC2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF6A181FC2;
	Sun,  7 Apr 2024 11:45:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8E0E1BF947
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3FEB81FC2
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jq7qT_QqxU0c for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 11:45:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D98181F93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D98181F93
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D98181F93
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 11:45:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a070b.dip0.t-ipconnect.de [91.58.7.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9D96EA4C2D88;
 Sun,  7 Apr 2024 13:44:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53892)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rtQx4-000000005Wv-1tHa;
 Sun, 07 Apr 2024 11:44:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 13:44:26 +0200
Message-Id: <20240407114445.683504-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240407114445.683504-1-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712490286;
 bh=9aGqEbNeXIWCTgW6Ql7d/VzuYkGqw/thhLHvk+iA4QQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=glVxluSCQO7CbQwLaKf9RmQ5wKkQVJ+h3miBiaNoRjaIcDQoAolFofb9Og2KkND7s
 f74fa+v5GGEotyL0ghH0/1AnsZ+oLE551zuc+IPLP+Uiuz+GzhwLIGsGMbH3Uciilk
 no4vmRlB0ML87cVjWh6khLEfamMUZmFpTg8My7RjwKmyl7Kbu33rP0z9TaINQPwUhW
 WwcJcXyjDvh9V4jYFmv0nKytFjs01sRkcm85o+lrOpXZRgtcON+kbjj2U44EpPXCQu
 G4+/8TS5KljmK8qZ2VR5FvKo501XNhqhA+74CtRTgvnFEDFjPtkLPKIK7X++DPcbKR
 Z6olpA1EnNKqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=glVxluSC
Subject: [Buildroot] [PATCH v2 01/20] package/aubio: bump version
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The latest release from aubio dates back to 2019 while upstream is
active: https://github.com/aubio/aubio/issues/381

Current git HEAD includes support for ffmpeg 6.x:
https://github.com/aubio/aubio/commits/master/src/io/source_avcodec.c

and also removed the dependency to libavresample which was dropped in
ffmpeg 6.0:
https://github.com/aubio/aubio/commit/245deeadd81afc4ec5635b65d71646490c5c19fd

so we can just depend on the ffmpeg package without suboptions, quoting
configure log:

Checking for 'libavcodec'                : yes
Checking for 'libavformat'               : yes
Checking for 'libavutil'                 : yes
Checking for 'libswresample'             : yes
Checking for all libav libraries         : yes

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/aubio/aubio.hash | 5 ++---
 package/aubio/aubio.mk   | 7 +++----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/aubio/aubio.hash b/package/aubio/aubio.hash
index 6195788327..dff02ffa9f 100644
--- a/package/aubio/aubio.hash
+++ b/package/aubio/aubio.hash
@@ -1,5 +1,4 @@
-# From https://aubio.org/pub/aubio-0.4.9.tar.bz2.sha256
-sha256  d48282ae4dab83b3dc94c16cf011bcb63835c1c02b515490e1883049c3d1f3da  aubio-0.4.9.tar.bz2
-
+# Locally computed
+sha256  b0e20427750fbfbf017f2b54e41dc0d61ab61335b705bc056ca92a928b2bdd30  aubio-152d6819b360c2e7b379ee3f373d444ab3df0895.tar.gz
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index bfc627fa91..07634e41c6 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-AUBIO_VERSION = 0.4.9
-AUBIO_SITE = https://aubio.org/pub
-AUBIO_SOURCE = aubio-$(AUBIO_VERSION).tar.bz2
+AUBIO_VERSION = 152d6819b360c2e7b379ee3f373d444ab3df0895
+AUBIO_SITE = $(call github,aubio,aubio,$(AUBIO_VERSION))
 AUBIO_LICENSE = GPL-3.0+
 AUBIO_LICENSE_FILES = COPYING
 AUBIO_CPE_ID_VENDOR = aubio
@@ -59,7 +58,7 @@ else
 AUBIO_CONF_OPTS += --disable-fftw3
 endif
 
-ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE),y)
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
 AUBIO_DEPENDENCIES += ffmpeg
 AUBIO_CONF_OPTS += --enable-avcodec
 else
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
