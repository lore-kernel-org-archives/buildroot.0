Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E34F5C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 09:41:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C4A761039
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 09:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C4A761039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FE1C6079D;
	Sun, 10 Oct 2021 09:41:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kXnwR0gXgnRt; Sun, 10 Oct 2021 09:41:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6752960784;
	Sun, 10 Oct 2021 09:41:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89F6D1BF476
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 09:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7893981092
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 09:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LDh-7qd7RKkS for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 09:41:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A8FF80F1A
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 09:41:01 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v17so45082089wrv.9
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 02:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LtCMhwEJ+763UZ665bK7WGYXa3ArMlz/F/2icVYKMKg=;
 b=IUUxWA0726jksUqiK+K+J8CAHLV+4U8PInbCmE5r+FfBv0IP7EnrGKpNmHU295Nf5/
 WRkwbq5/zBMQj756wuDACrB2Y2/LrPNXisCG1KyZmQ0cHIM/+BveKY4jyR8CyaLqxVOu
 MrmQPkFn9XqofLADDKkd5Es7dPOoLs/hfKYVqYJAEoG6shqgBPaLolOIJahqHsj6NvwT
 JXsa9KBZFZsFqaV91kS/gCnGyTk5vsp63hCC8OWL06GUgP/Ay1QEpqa1ife9xmPYajft
 JEem0qhACh4+CXfkfVbWvzw+abXysJ5HsSojOOwZ0VdppTvYdbaK5idQNvL/HLN5f7Is
 DFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LtCMhwEJ+763UZ665bK7WGYXa3ArMlz/F/2icVYKMKg=;
 b=J4igmZU61di4R4gl4ge2nKgbXgiqqWLUlwM3+k3LbjM5Lni+v1OhCEHFnr3nNbcdKC
 VRulKOzLBu0Z4dQialcpJe+RsP2Ta1yyVWh0QtKOvVR/C5lCOUk3a8SB9CsyfUwT0DBG
 sWDpKNPVllSM36pClAE/owo2Sq1k92KfhPbC6RRuG7sgYesLWhhtxkgC49ulP/rpFIgQ
 Cq+AawnwZMhrknnLx+WHotRsaO2uPkGcybqHXjLdAz+3OQtG1gp+QqTigyb+D/eHvyJW
 TXt8Hsx78f8KU0iNOQgbO1gvUG1eEHW2Fic9zXPZdoZtjw9Zfizr34DyvPrDSRxJRHLD
 ukMw==
X-Gm-Message-State: AOAM532UsA1rTqvUaoY+VklxslOgq5He0OXq5SfVod7xfO7lLMNeB6KT
 wZgpPL+Aqiz5XfpvwsKfpCM6CBpCvnk=
X-Google-Smtp-Source: ABdhPJwwLPGSlXugWnc2DZ29R44KNo6Bsz/JddXCpsgcFgq8aRYDR+hyQYV5zKmx7SVwyFS5iT4cDQ==
X-Received: by 2002:a1c:3b44:: with SMTP id i65mr14771628wma.129.1633858859333; 
 Sun, 10 Oct 2021 02:40:59 -0700 (PDT)
Received: from localhost.localdomain (138.23.87.79.rev.sfr.net. [79.87.23.138])
 by smtp.gmail.com with ESMTPSA id d8sm4505657wrz.84.2021.10.10.02.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 02:40:58 -0700 (PDT)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 11:40:51 +0200
Message-Id: <20211010094051.108966-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/iozone: bump to version 3_492
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reworked existing patch to make it apply to this version

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 .../0001-Add-new-targets-for-iozone.patch     | 22 +++++++++----------
 package/iozone/iozone.hash                    |  2 +-
 package/iozone/iozone.mk                      |  4 ++--
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/iozone/0001-Add-new-targets-for-iozone.patch b/package/iozone/0001-Add-new-targets-for-iozone.patch
index e6bfc18de6..3cc184ec8f 100644
--- a/package/iozone/0001-Add-new-targets-for-iozone.patch
+++ b/package/iozone/0001-Add-new-targets-for-iozone.patch
@@ -1,6 +1,6 @@
-From 1584ffbfda3277b82997b9f1e0ef31a7061560e0 Mon Sep 17 00:00:00 2001
+From 5b1e973b2333e838624abf195b3ba9716591f304 Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sun, 26 Aug 2018 18:39:06 +0200
+Date: Sun, 10 Oct 2021 10:15:26 +0200
 Subject: [PATCH] Add new targets for iozone:
 
 linux-noaio is for linux targets without AIO (use case: uClibc)
@@ -11,18 +11,18 @@ And make largefile support optional via CFLAGS.
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
 ---
- src/current/makefile | 56 +++++++++++++++++++++++++++++++++++++++++++---------
+ src/current/makefile | 56 +++++++++++++++++++++++++++++++++++++-------
  1 file changed, 47 insertions(+), 9 deletions(-)
 
 diff --git a/src/current/makefile b/src/current/makefile
-index cfef879..7925e62 100644
+index 3a54701..3b17b1b 100644
 --- a/src/current/makefile
 +++ b/src/current/makefile
-@@ -168,10 +168,28 @@ hpux_no_ansi:	iozone_hpux_no.o  libbif.o
+@@ -172,10 +172,28 @@ hpux_no_ansi:	iozone_hpux_no.o  libbif.o
  # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
  #
  linux:	iozone_linux.o libasync.o libbif.o fileop_linux.o pit_server.o
--	$(CC)  -O3 $(LDFLAGS) iozone_linux.o libasync.o libbif.o -lpthread \
+-	$(CC)  -O3 $(CFLAGS) iozone_linux.o libasync.o libbif.o -lpthread \
 +	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux.o libasync.o libbif.o \
 +		-lpthread -lrt -o iozone
 +	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
@@ -43,14 +43,14 @@ index cfef879..7925e62 100644
 +linux-noth: iozone_linux-noth.o libbif.o fileop_linux.o pit_server.o
 +	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux-noth.o libbif.o \
  		-lrt -o iozone
--	$(CC)  -O3 -Dlinux fileop_linux.o -o fileop
--	$(CC)  -O3 -Dlinux pit_server.o -o pit_server
+-	$(CC)  -O3 $(CFLAGS) -Dlinux fileop_linux.o -o fileop
+-	$(CC)  -O3 $(CFLAGS) -Dlinux pit_server.o -o pit_server
 +	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
 +	$(CC)  $(CFLAGS) -Dlinux pit_server.o -o pit_server
  
  #
  # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O 
-@@ -814,13 +832,33 @@ iozone_linux.o:	iozone.c libbif.c libasync.c
+@@ -841,13 +859,33 @@ iozone_linux.o:	iozone.c libbif.c libasync.c
  	@echo ""
  	@echo "Building iozone for Linux"
  	@echo ""
@@ -89,7 +89,7 @@ index cfef879..7925e62 100644
  
  fileop_AIX.o:	fileop.c
  	@echo ""
-@@ -924,7 +962,7 @@ fileop_linux.o:	fileop.c
+@@ -951,7 +989,7 @@ fileop_linux.o:	fileop.c
  	@echo ""
  	@echo "Building fileop for Linux"
  	@echo ""
@@ -99,5 +99,5 @@ index cfef879..7925e62 100644
  fileop_openbsd.o:	fileop.c
  	@echo ""
 -- 
-2.7.4
+2.27.0
 
diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
index 61e8ff3abe..1255392e38 100644
--- a/package/iozone/iozone.hash
+++ b/package/iozone/iozone.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5eadb4235ae2a956911204c50ebf2d8d8d59ddcd4a2841a1baf42f3145ad4fed  iozone3_490.tar
+sha256  93c9142d61e6a71ea43b0a266bad7f49f07ce5f5d31b36f8edf4dd386795c483  iozone3_492.tgz
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index 32d57ea76e..2282a44eb8 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IOZONE_VERSION = 3.490
-IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tar
+IOZONE_VERSION = 3.492
+IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tgz
 IOZONE_SITE = http://www.iozone.org/src/current
 IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
 # IOzone license details can be found at:
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
