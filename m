Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155D8C25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 07:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C65ED820E6;
	Wed, 22 May 2024 07:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdE7ps93Eoy6; Wed, 22 May 2024 07:03:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A080C820EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A080C820EB;
	Wed, 22 May 2024 07:03:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B810D1C584B
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A10C24079E
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5TXcLvKMtctT for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 07:02:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 38CA540799
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38CA540799
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38CA540799
 for <buildroot@buildroot.org>; Wed, 22 May 2024 07:02:59 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-572c65cea55so978885a12.0
 for <buildroot@buildroot.org>; Wed, 22 May 2024 00:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716361377; x=1716966177;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OHcUaBiXvjNpQjCcFcxDYSeACdn61ui6MlAbPKkbqrE=;
 b=L44e36vqe3swgLQztKxh2/ZWTEMOoCA3S1rVkg08+YfGsCWgzcne/m6hNIeS4YA0Dp
 isCQUY747i/icrfIiLg8ij+IRIgHV9LGeGEQw/eMvn49XDcP6SFRjW0sMg85xmsgUe7Y
 SBqzBz4DKroS2em0jspGjZ9xXfXvdp5t4sME2h5Ml1HPBKvdMH/oncS8eMveQqNG087Q
 RaDN5Ooq0tyf0SEm1n9TFvBK8KlCkj9b4iT3cboU7aBBeMD+12HwDvhpuavviWaAoMxe
 MDb3xBl+syX7zR+d9MKeRjJu0ZuhyD2ybAFy7OLsFreIvRA+AovZ9SoO/+n18nr0Zr7c
 Xxfg==
X-Gm-Message-State: AOJu0YyZMkkCt4qhETE8CWvTah2f5OrvxL10R3CvGONK85yEJVJinV3X
 X4teKZGRMIMWCppKO8eapcmk7Prnw4BYykmT0QTFeeOMEOzGbYDzMGt/vHH50MWPsU5d8uLY7bE
 8sq0=
X-Google-Smtp-Source: AGHT+IHKPDYhNub45mH3WLjbCF2qr5uwT4rswj76JXBitg4Ny2yxz824feIeH48s0a6NbNUjX9ZVgw==
X-Received: by 2002:a05:6402:22b9:b0:578:23a4:3c2a with SMTP id
 4fb4d7f45d1cf-57823a43c5dmr3297217a12.0.1716361377180; 
 Wed, 22 May 2024 00:02:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.196])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574d738c80csm12028365a12.81.2024.05.22.00.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:02:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:02:27 +0200
Message-ID: <20240522070238.3282121-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716361377; x=1716966177;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OHcUaBiXvjNpQjCcFcxDYSeACdn61ui6MlAbPKkbqrE=;
 b=fQRwtepdGWQyOyLWzNDhkNwqxingmhLXuDLngJEX8Uz5QfM40VDkse6OBEzAeMmdVt
 fBo7BTVaQDBBNU93rH0e3oSZHS76ZPaB6zx7tgWjuyikZyUx1tHdTBEUP9GV6d6UmiSm
 k4mGarbuhp7bBms19hAGKlZeIHytzRSqxjo2I=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fQRwtepd
Subject: [Buildroot] [PATCH v2 08/18] package/giflib: update the patches to
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
 ...dd-targets-to-manage-static-building.patch | 18 +++++++++--------
 ...veral-defects-found-by-Coverity-scan.patch | 20 ++++++++++---------
 2 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch b/package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch
index ba8d426bea11..31d7542e60c9 100644
--- a/package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch
+++ b/package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch
@@ -1,4 +1,4 @@
-From 487407d722714f13e8a06d1a9d89f48a5738191e Mon Sep 17 00:00:00 2001
+From 409af8210f2256eed4d2c73083aa75975f03424b Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Fri, 12 Jul 2019 12:20:38 +0200
 Subject: [PATCH] Makefile: add targets to manage static building
@@ -8,16 +8,18 @@ targets to allow the user to build giflib when dynamic library support
 is not available or enable on the toolchain
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 Upstream: https://sourceforge.net/p/giflib/code/merge-requests/7
 ---
  Makefile | 18 ++++++++++++++----
  1 file changed, 14 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index b2bf6de..111f52f 100644
+index 87966a96cd4f..4a93aace54b8 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -91,13 +91,20 @@ LIBUTILSO	= libutil.$(SOEXTENSION)
+@@ -87,13 +87,20 @@ LIBUTILSO	= libutil.$(SOEXTENSION)
  LIBUTILSOMAJOR	= libutil.$(LIBMAJOR).$(SOEXTENSION)
  endif
  
@@ -40,7 +42,7 @@ index b2bf6de..111f52f 100644
  
  $(LIBGIFSO): $(OBJECTS) $(HEADERS)
  ifeq ($(UNAME), Darwin)
-@@ -120,7 +127,7 @@ libutil.a: $(UOBJECTS) $(UHEADERS)
+@@ -116,7 +123,7 @@ libutil.a: $(UOBJECTS) $(UHEADERS)
  	$(AR) rcs libutil.a $(UOBJECTS)
  
  clean:
@@ -48,8 +50,8 @@ index b2bf6de..111f52f 100644
 +	rm -f $(UTILS) $(TARGET) libgetarg.a $(SHARED_LIBS) $(STATIC_LIBS) *.o
  	rm -f $(LIBGIFSOVER)
  	rm -f $(LIBGIFSOMAJOR)
- 	rm -fr doc/*.[17] *.html doc/staging
-@@ -145,12 +152,15 @@ install-bin: $(INSTALLABLE)
+ 	rm -fr doc/*.1 *.html doc/staging
+@@ -141,12 +148,15 @@ install-bin: $(INSTALLABLE)
  install-include:
  	$(INSTALL) -d "$(DESTDIR)$(INCDIR)"
  	$(INSTALL) -m 644 gif_lib.h "$(DESTDIR)$(INCDIR)"
@@ -64,8 +66,8 @@ index b2bf6de..111f52f 100644
  	ln -sf $(LIBGIFSOMAJOR) "$(DESTDIR)$(LIBDIR)/$(LIBGIFSO)"
 +install-lib: install-static-lib install-shared-lib
  install-man:
- 	$(INSTALL) -d "$(DESTDIR)$(MANDIR)/man1" "$(DESTDIR)$(MANDIR)/man7"
- 	$(INSTALL) -m 644 $(MANUAL_PAGES_1:xml=1) "$(DESTDIR)$(MANDIR)/man1"
+ 	$(INSTALL) -d "$(DESTDIR)$(MANDIR)/man1"
+ 	$(INSTALL) -m 644 $(MANUAL_PAGES) "$(DESTDIR)$(MANDIR)/man1"
 -- 
 2.43.0
 
diff --git a/package/giflib/0002-Fix-several-defects-found-by-Coverity-scan.patch b/package/giflib/0002-Fix-several-defects-found-by-Coverity-scan.patch
index f6816d07530a..77f21b402e95 100644
--- a/package/giflib/0002-Fix-several-defects-found-by-Coverity-scan.patch
+++ b/package/giflib/0002-Fix-several-defects-found-by-Coverity-scan.patch
@@ -1,4 +1,4 @@
-From a1c48b91cd1cf1e9bf7077709b69f4bfd4c4abc7 Mon Sep 17 00:00:00 2001
+From 7c3bce4add77944e5b479ef5da81ae7fd71a7e95 Mon Sep 17 00:00:00 2001
 From: Sandro Mani <manisandro@gmail.com>
 Date: Tue, 5 Dec 2023 16:38:48 -0700
 Subject: [PATCH] Fix several defects found by Coverity scan
@@ -10,15 +10,17 @@ Signed-off-by: Sandro Mani <manisandro@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [Fabrice: updated for 5.2.2]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
- gif2rgb.c | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
+ gif2rgb.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
 
 diff --git a/gif2rgb.c b/gif2rgb.c
-index d9a469f..02cea41 100644
+index d51226d65d3d..50c43ae44ee2 100644
 --- a/gif2rgb.c
 +++ b/gif2rgb.c
-@@ -170,6 +170,8 @@ static void SaveGif(GifByteType *OutputBuffer,
+@@ -165,6 +165,8 @@ static void SaveGif(GifByteType *OutputBuffer, int Width, int Height,
  	/* Open stdout for the output file: */
  	if ((GifFile = EGifOpenFileHandle(1, &Error)) == NULL) {
  		PrintGifError(Error);
@@ -27,8 +29,8 @@ index d9a469f..02cea41 100644
  		exit(EXIT_FAILURE);
  	}
  
-@@ -179,6 +181,8 @@ static void SaveGif(GifByteType *OutputBuffer,
- 	     EGifPutImageDesc(GifFile, 0, 0, Width, Height, false, NULL) ==
+@@ -173,6 +175,8 @@ static void SaveGif(GifByteType *OutputBuffer, int Width, int Height,
+ 	    EGifPutImageDesc(GifFile, 0, 0, Width, Height, false, NULL) ==
  	        GIF_ERROR) {
  		PrintGifError(Error);
 +		free(OutputBuffer);
@@ -36,7 +38,7 @@ index d9a469f..02cea41 100644
  		exit(EXIT_FAILURE);
  	}
  
-@@ -187,6 +191,8 @@ static void SaveGif(GifByteType *OutputBuffer,
+@@ -182,6 +186,8 @@ static void SaveGif(GifByteType *OutputBuffer, int Width, int Height,
  
  	for (i = 0; i < Height; i++) {
  		if (EGifPutLine(GifFile, Ptr, Width) == GIF_ERROR) {
@@ -45,7 +47,7 @@ index d9a469f..02cea41 100644
  			exit(EXIT_FAILURE);
  		}
  		GifQprintf("\b\b\b\b%-4d", Height - i - 1);
-@@ -196,6 +203,8 @@ static void SaveGif(GifByteType *OutputBuffer,
+@@ -191,6 +197,8 @@ static void SaveGif(GifByteType *OutputBuffer, int Width, int Height,
  
  	if (EGifCloseFile(GifFile, &Error) == GIF_ERROR) {
  		PrintGifError(Error);
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
