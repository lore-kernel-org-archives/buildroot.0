Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD53C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 21:21:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34D7A6054E
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 21:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34D7A6054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8A07400CC;
	Sat, 25 Sep 2021 21:21:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id boUAhrr-FUvv; Sat, 25 Sep 2021 21:21:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 994CD4013D;
	Sat, 25 Sep 2021 21:21:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4AFBB1BF33B
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 21:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44E2880F49
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 21:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVSyHOuWGT3Z for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 21:21:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 265E280F3B
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 21:21:25 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w29so38401487wra.8
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 14:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eQs5VI95u/amSBa2rusrs8tClgTdL7vTgQ3MEJf1EIs=;
 b=Ja6UM4V5TV4qI5rr+v6NmiBFzBB0alCnn5Zip6Bb5fKAelssUnohN+3W2R/zP6Nilo
 d1fjb6RyBKAqBBAV232UvrahZGZ51AgIe3WFjHnpk4etmdvwQCHAfk1iXWF8n6ZD0Vk4
 CLGs/YshkNbfEh5VBsvdwINEq4e3WimbP9HadS7jci8Mjcp2CaHFaaj2FN+xN4N9WJNH
 zWznTxIo6ExTTkLs2nzJELmuBhIE/IFJaxDVsRBWyr2fMXzhbOTSij/Xq+lKS6AcX9kl
 9zVpp+/MYooEXRJnz9i8iUfyZf+oXOjRLhxDG6w7cws1V1Mvhged3otR4eCzXzAZ4Gy4
 +CFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eQs5VI95u/amSBa2rusrs8tClgTdL7vTgQ3MEJf1EIs=;
 b=j82DdB4svZCCyZc1jMAz84sitzdccFKC0sLb0gSEdEqfkM/g/V8yCoWmQjbWnzr9Uk
 vzlYj0g9k3OBQ3Bw8BXVwV9vuDrb0jhgr611JeKKTwyYTboAuya+5pdYO8/6T/MWwivq
 1AWg/HcMx0f4qbV4DcjP/E7MLPYIQ6zX98PnpR040Q7DxrORS0PeCSRB/VIsusfqsjt2
 iDZ6kXf6bXuXVSNvEkYCwydptSSSxrb0AP3vwJWR+HMBlhiiuKBSBJjAEtrh4aK/Lra8
 ER4wniBefNwP5/zkNqMw0jEgQjqMQ5kkFKMRa7A1oO/AGAzJT9py0uiODpCHd5/KR0Yt
 e4tQ==
X-Gm-Message-State: AOAM533rhlXlqd7KGmtcJhMB/nujBpU2CYVEwJ+zbhKBanRnAfp4KHeH
 dm3FZlpzrmEUpRutae57+FD4bMcNkUo=
X-Google-Smtp-Source: ABdhPJw5lt941zy+g8dA8mxYdDyRu3+QuXkqoeJnps3eokgVe4bgKWUEHjdz9+SHxSKZzLj5I0quwQ==
X-Received: by 2002:a1c:a942:: with SMTP id s63mr8438060wme.45.1632604882988; 
 Sat, 25 Sep 2021 14:21:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id g2sm12776495wrb.20.2021.09.25.14.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 14:21:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Sep 2021 23:20:35 +0200
Message-Id: <20210925212035.3357456-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mjpegtools: bump to version 2.2.1
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
Cc: Steve Kenton <skenton@ou.edu>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version) and so autoreconf
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...uses-problems-on-some-x86_64-systems.patch | 73 -------------------
 package/mjpegtools/mjpegtools.hash            |  9 ++-
 package/mjpegtools/mjpegtools.mk              |  4 +-
 3 files changed, 6 insertions(+), 80 deletions(-)
 delete mode 100644 package/mjpegtools/0001-PROGRAM_NOPIC-apparently-causes-problems-on-some-x86_64-systems.patch

diff --git a/package/mjpegtools/0001-PROGRAM_NOPIC-apparently-causes-problems-on-some-x86_64-systems.patch b/package/mjpegtools/0001-PROGRAM_NOPIC-apparently-causes-problems-on-some-x86_64-systems.patch
deleted file mode 100644
index f5de8ee969..0000000000
--- a/package/mjpegtools/0001-PROGRAM_NOPIC-apparently-causes-problems-on-some-x86_64-systems.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From e69557bea18eb7c3069c9527cc30f7cd91be27b7 Mon Sep 17 00:00:00 2001
-From: sms00 <sms00@3be20b7b-d6de-45d7-9b51-1db703c412de>
-Date: Thu, 28 Nov 2013 22:39:41 +0000
-Subject: [PATCH] PROGRAM_NOPIC apparently causes problems on some x86_64
- systems, has little to no performance effect on x86_64 systems and even on
- x86 systems most programs are I/O bound anyhow.  So remove the 4 uses of the
- flag
-
-git-svn-id: https://svn.code.sf.net/p/mjpeg/Code/trunk/mjpeg_play@3359 3be20b7b-d6de-45d7-9b51-1db703c412de
-
-[Retrieved (and backported by removing INSTALL updates) from:
-https://github.com/jaystevens/mjpegtools/commit/e69557bea18eb7c3069c9527cc30f7cd91be27b7]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- y4mdenoise/Makefile.am |   4 +-
- y4munsharp/Makefile.am |   2 +-
- y4mutils/Makefile.am   |   2 +-
- yuvscaler/Makefile.am  |   2 +-
- 5 files changed, 26 insertions(+), 94 deletions(-)
-
-diff --git a/y4mdenoise/Makefile.am b/y4mdenoise/Makefile.am
-index dee9064f..d7fa76e2 100644
---- a/y4mdenoise/Makefile.am
-+++ b/y4mdenoise/Makefile.am
-@@ -4,8 +4,8 @@ MAINTAINERCLEANFILES = Makefile.in
- 
- EXTRA_DIST = implementation.html
- 
--AM_CFLAGS = -DNDEBUG -finline-functions @PROGRAM_NOPIC@
--AM_CXXFLAGS = -DNDEBUG -finline-functions @PROGRAM_NOPIC@
-+AM_CFLAGS = -DNDEBUG -finline-functions
-+AM_CXXFLAGS = -DNDEBUG -finline-functions
- 
- INCLUDES =  -I$(top_srcdir) -I$(top_srcdir)/utils
- 
-diff --git a/y4munsharp/Makefile.am b/y4munsharp/Makefile.am
-index a7f98acc..f99ff5cf 100644
---- a/y4munsharp/Makefile.am
-+++ b/y4munsharp/Makefile.am
-@@ -4,7 +4,7 @@ MAINTAINERCLEANFILES = Makefile.in
- 
- INCLUDES = -I $(top_srcdir)/utils -I $(top_srcdir)
- 
--y4munharp_CFLAGS=@PROGRAM_NOPIC@
-+y4munharp_CFLAGS=
- 
- bin_PROGRAMS = y4munsharp
- 
-diff --git a/y4mutils/Makefile.am b/y4mutils/Makefile.am
-index f3b0a671..7b8b1881 100644
---- a/y4mutils/Makefile.am
-+++ b/y4mutils/Makefile.am
-@@ -2,7 +2,7 @@
- 
- MAINTAINERCLEANFILES = Makefile.in
- 
--AM_CFLAGS   = @PROGRAM_NOPIC@
-+AM_CFLAGS   =
- AM_CPPFLAGS = -I$(top_srcdir) -I$(top_srcdir)/utils
- 
- LIBMJPEGUTILS = $(top_builddir)/utils/libmjpegutils.la
-diff --git a/yuvscaler/Makefile.am b/yuvscaler/Makefile.am
-index 1fe4d757..6d2adaca 100644
---- a/yuvscaler/Makefile.am
-+++ b/yuvscaler/Makefile.am
-@@ -18,6 +18,6 @@ noinst_HEADERS = \
- 
- EXTRA_DIST = yuvscaler_implementation.txt
- 
--yuvscaler_CFLAGS=@PROGRAM_NOPIC@
-+yuvscaler_CFLAGS=
- yuvscaler_SOURCES = yuvscaler.c yuvscaler_resample.c yuvscaler_bicubic.c
- yuvscaler_LDADD = $(LIBMJPEGUTILS) $(LIBM_LIBS)
diff --git a/package/mjpegtools/mjpegtools.hash b/package/mjpegtools/mjpegtools.hash
index 76e9403f83..8d74907b26 100644
--- a/package/mjpegtools/mjpegtools.hash
+++ b/package/mjpegtools/mjpegtools.hash
@@ -1,5 +1,6 @@
-# From http://sourceforge.net/projects/mjpeg/files/mjpegtools/2.1.0/
-md5	57bf5dd78976ca9bac972a6511b236f3	mjpegtools-2.1.0.tar.gz
-sha1	b9effa86280e23d67369e842e5cb645948583097	mjpegtools-2.1.0.tar.gz
+# From http://sourceforge.net/projects/mjpeg/files/mjpegtools/2.2.1/
+md5  168e0131c0b8a2e31df7a73eb602fc32  mjpegtools-2.2.1.tar.gz
+sha1  26e980912cd06f31033964acbc4b8d1932788bfc  mjpegtools-2.2.1.tar.gz
 # Locally computed
-sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
+sha256  b180536d7d9960b05e0023a197b00dcb100929a49aab71d19d55f4a1b210f49a  mjpegtools-2.2.1.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/mjpegtools/mjpegtools.mk b/package/mjpegtools/mjpegtools.mk
index e2c6b7d8b7..8d6c475518 100644
--- a/package/mjpegtools/mjpegtools.mk
+++ b/package/mjpegtools/mjpegtools.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-MJPEGTOOLS_VERSION = 2.1.0
+MJPEGTOOLS_VERSION = 2.2.1
 MJPEGTOOLS_SITE = http://sourceforge.net/projects/mjpeg/files/mjpegtools/$(MJPEGTOOLS_VERSION)
 MJPEGTOOLS_DEPENDENCIES = host-pkgconf jpeg
 MJPEGTOOLS_INSTALL_STAGING = YES
 MJPEGTOOLS_LICENSE = GPL-2.0+
 MJPEGTOOLS_LICENSE_FILES = COPYING
-# We're patching Makefile.am
-MJPEGTOOLS_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_MJPEGTOOLS_SIMD_SUPPORT),y)
 MJPEGTOOLS_CONF_OPTS += --enable-simd-accel
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
