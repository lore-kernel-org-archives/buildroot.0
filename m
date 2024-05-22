Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFE1C25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 07:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71C878209F;
	Wed, 22 May 2024 07:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ZiENMu4HgMd; Wed, 22 May 2024 07:03:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA09E820B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA09E820B5;
	Wed, 22 May 2024 07:03:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 549011C584B
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F2C540347
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nI_a-vS4vc0q for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 07:02:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F329740181
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F329740181
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F329740181
 for <buildroot@buildroot.org>; Wed, 22 May 2024 07:02:53 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-572a93890d1so10728076a12.3
 for <buildroot@buildroot.org>; Wed, 22 May 2024 00:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716361372; x=1716966172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F3jUMTjQuVY3DEmL6gNZCYhAlpLJFtfL9KDS9J+O1pc=;
 b=Ip1CXd+sl5DI4NxNGnQL+IcminquPcnf8kP4hXj9OsKY1Y1FtvawA6fqriRo8RUEhe
 mu60ETvybihcOn2qu4EA4VhY1ZThaYnKk8VDD5hxh1SFsbByB2akQpgJ/B2B+Mri6o9o
 xdEnIEiE0Ax7oxkl8jx/PFNCEM0MI6AC8OYWSRIEBA+qnXgR6BJHwhjapu4aMZYlZwY/
 SmxGcgTg2YTf7nMdgAIZfw/OLQRDOwVgxepXHKc731zweeJxuVwukEduIsiEYuvOnnh9
 Y1s4DDEP/VRoPd2/xVQMKdxg22uSPcxiHIBrrewwoCVmRL/qukU44XkWatBmFSftgwg+
 9sJg==
X-Gm-Message-State: AOJu0YyGNThAI2gmpsUoTAH1cmPuN2M1pRUyQaGaZLI6HS2ocWunz/tr
 Z5vRyLCt5/8N1eglHZbCpkTV5tkUO3nZrlXZ3PWaBJns/6BMQq8MSm/AkBbi5mGmsfPjKY+JqtA
 UtMk=
X-Google-Smtp-Source: AGHT+IHD+FQ4x43ieFRJ0Pdif426uDojjsZ/lwCyib36X9mK2n4P/YcJZ32bJaeltaix8oCNKPZdsA==
X-Received: by 2002:a50:9e25:0:b0:572:a731:dd1d with SMTP id
 4fb4d7f45d1cf-57832a3e7f0mr1000753a12.25.1716361371881; 
 Wed, 22 May 2024 00:02:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.196])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574d738c80csm12028365a12.81.2024.05.22.00.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:02:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:02:24 +0200
Message-ID: <20240522070238.3282121-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716361372; x=1716966172;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F3jUMTjQuVY3DEmL6gNZCYhAlpLJFtfL9KDS9J+O1pc=;
 b=Y/2lyxEVEk7EueKbLrXdIZ/itdWTQIwjgd4xyrLE/rWH6NONO6Hn+QO8Ta2HI9XY0E
 yV6oBdXoO+5W2a7n9otO9Sr3rd08TF8miXj7cANGDX+xLQeIOT1LqKPgqHbVTUweB4+T
 csSqkLhbSpRb6XY7PfAzNEiSkJIiT5rjkIAhA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Y/2lyxEV
Subject: [Buildroot] [PATCH v2 05/18] package/bzip2: update the patches to
 be applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit allows the package patches to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/bzip2/0001-build-objects-twice.patch  | 14 ++++++++------
 package/bzip2/0002-improve-build-system.patch | 12 +++++++-----
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/package/bzip2/0001-build-objects-twice.patch b/package/bzip2/0001-build-objects-twice.patch
index 9bde0f6488c0..52b234f65a8e 100644
--- a/package/bzip2/0001-build-objects-twice.patch
+++ b/package/bzip2/0001-build-objects-twice.patch
@@ -8,14 +8,16 @@ and build the shared objects as *.sho instead of *.o.
 Then, we use these objects to create the shared library.
 
 Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 Index: bzip2-1.0.6/Makefile-libbz2_so
 ===================================================================
 --- bzip2-1.0.6.orig/Makefile-libbz2_so
 +++ bzip2-1.0.6/Makefile-libbz2_so
-@@ -25,13 +25,13 @@ SHELL=/bin/sh
- CC=gcc
- override CFLAGS += -fpic -fPIC -Wall
+@@ -26,13 +26,13 @@ CC=gcc
+ BIGFILES=-D_FILE_OFFSET_BITS=64
+ CFLAGS=-fpic -fPIC -Wall -Winline -O2 -g $(BIGFILES)
  
 -OBJS= blocksort.o  \
 -      huffman.o    \
@@ -33,10 +35,10 @@ Index: bzip2-1.0.6/Makefile-libbz2_so
 +      bzlib.sho
  
  all: $(OBJS)
- 	$(CC) -shared -Wl,-soname -Wl,libbz2.so.1.0 -o libbz2.so.1.0.6 $(OBJS)
-@@ -45,17 +45,5 @@ install:
+ 	$(CC) -shared -Wl,-soname -Wl,libbz2.so.1.0 -o libbz2.so.1.0.8 $(OBJS)
+@@ -43,17 +43,5 @@ all: $(OBJS)
  clean: 
- 	rm -f $(OBJS) bzip2.o libbz2.so.1.0.6 libbz2.so.1.0 bzip2-shared
+ 	rm -f $(OBJS) bzip2.o libbz2.so.1.0.8 libbz2.so.1.0 bzip2-shared
  
 -blocksort.o: blocksort.c
 -	$(CC) $(CFLAGS) -c blocksort.c
diff --git a/package/bzip2/0002-improve-build-system.patch b/package/bzip2/0002-improve-build-system.patch
index 2d6e2cf900d2..11a856e49c96 100644
--- a/package/bzip2/0002-improve-build-system.patch
+++ b/package/bzip2/0002-improve-build-system.patch
@@ -20,12 +20,14 @@ This patch makes a number of improvements to the bzip2 build system:
    appropriate symbolic links.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -20,8 +20,7 @@
+@@ -20,8 +20,7 @@ AR=ar
  RANLIB=ranlib
  LDFLAGS=
  
@@ -35,7 +37,7 @@ Index: b/Makefile
  
  # Where you want it installed when you do 'make install'
  PREFIX=/usr/local
-@@ -90,14 +89,14 @@
+@@ -90,14 +89,14 @@ install: bzip2 bzip2recover
  	cp -f libbz2.a $(PREFIX)/lib
  	chmod a+r $(PREFIX)/lib/libbz2.a
  	cp -f bzgrep $(PREFIX)/bin/bzgrep
@@ -66,9 +68,9 @@ Index: b/Makefile-libbz2_so
 -CFLAGS=-fpic -fPIC -Wall -Winline -O2 -g $(BIGFILES)
 +override CFLAGS += -fpic -fPIC -Wall
  
- OBJS= blocksort.o  \
-       huffman.o    \
-@@ -37,8 +36,11 @@
+ OBJS= blocksort.sho  \
+       huffman.sho    \
+@@ -37,8 +36,11 @@ OBJS= blocksort.sho  \
  all: $(OBJS)
  	$(CC) -shared -Wl,-soname -Wl,libbz2.so.1.0 -o libbz2.so.1.0.8 $(OBJS)
  	$(CC) $(CFLAGS) -o bzip2-shared bzip2.c libbz2.so.1.0.8
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
