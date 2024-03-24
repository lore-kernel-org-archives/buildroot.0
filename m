Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EADC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 17:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBA5C405BC;
	Sun, 24 Mar 2024 17:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OjQKiOmoeW3g; Sun, 24 Mar 2024 17:30:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E111405BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E111405BD;
	Sun, 24 Mar 2024 17:30:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30B081BF40A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DCDE81DF0
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3oM34XHA9g6z for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 17:30:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 455F0813EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 455F0813EE
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 455F0813EE
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 17:30:34 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33fd12a06fdso2548221f8f.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 10:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711301432; x=1711906232;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nltRoF11rSunkiPa+u6N0QDxoTWMCxmNB+yxUksZjzA=;
 b=jQUmK8QBPDXn8hca0Hve/or9FAS9jKi5cI16qtwyYrp4Tt0+Bh1/SpHC6LL3/g7xEk
 7lEjNSd0306sA+peL8G334rUwoJ8t1VD3cSy9dfWjQiGCccWQRk+ad4RgJh2ZUZlKra6
 dLsyJAwlFGZ/YDsB611zGU1XWGcS2YqkKk4ala1/7VKatBjL1R6JJXPtUWIkemvnrv1T
 9iW4kM+thWmDAIG1s3g7vPwx0NQ0kYknfXvIjpXDBs7AxXnmNG86At9P36zmb3LhDzVr
 E3nSGRKBqorYWsown2dyDmhPEYkMwS+B0Ea+2Iy0XwDPMUc6Stztgun1D9FH85N1D715
 THrQ==
X-Gm-Message-State: AOJu0YyPISFw1HTBkDVeWXL6uXsrh4kS9ro9VIB5xOJEkIGsMZJIKoo+
 wUHCYZo3sDRRrVr+irJl9NukcQbiKxaWTKNiiy34ABKdeoC+l7dJS5yQ8R9p
X-Google-Smtp-Source: AGHT+IHGO1gsMgmbQ7BocHbsUMCDAv8aFeRyPXEDIwAMeuBMl9d88D5QtFxkt3S1hIbXlfcLyx+8VA==
X-Received: by 2002:a5d:64ab:0:b0:33d:a185:17ec with SMTP id
 m11-20020a5d64ab000000b0033da18517ecmr4190971wrp.4.1711301431857; 
 Sun, 24 Mar 2024 10:30:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x4-20020a5d60c4000000b00341ce1b64f0sm43752wrt.17.2024.03.24.10.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 10:30:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 18:28:55 +0100
Message-ID: <20240324172855.55663-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711301432; x=1711906232; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nltRoF11rSunkiPa+u6N0QDxoTWMCxmNB+yxUksZjzA=;
 b=ilyyno2OTkxVvJV+XeAXbmzOgyuCuY/nPC46tWHbUJxf1RqIdUSKBCXiNoF5MQt/UC
 vYwrb8sO8OYsqlwlBfIOBdMIshwr0PSzT01CzPMU53qMZ5784RatCroz0rSl67kZV47m
 3giLRnH61yOZLdKeFd+nyAKXANT9i0sG5wCY6I8u34rtZnkjtDwuzfwuN5O+JVfqxA48
 I++mB0VqUYd+7pxhkHg0rsDv357cOtgPONHgSa7xkhYhkEt9ZiGQzxduvsFYdrYrViA4
 9sbr1ofGSH94X/osK9gecPfLJYoHHJBW66mXyN/2MM71oVOKh4i2IJsJO54LlI94qLvr
 mSXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ilyyno2O
Subject: [Buildroot] [PATCH 1/1] package/giflib: bump to version 5.2.2
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Refresh first and fourth patches
- Drop second nad third patches (already in version)

https://sourceforge.net/p/giflib/code/ci/5.2.2/tree/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...dd-targets-to-manage-static-building.patch | 44 ++++++-------
 package/giflib/0002-Fix-CVE-2022-28506.patch  | 34 -----------
 ...veral-defects-found-by-Coverity-scan.patch | 59 ++++++++++++++++++
 package/giflib/0003-Fix-CVE-2023-39742.patch  | 36 -----------
 ...veral-defects-found-by-Coverity-scan.patch | 61 -------------------
 package/giflib/giflib.hash                    |  5 +-
 package/giflib/giflib.mk                      |  7 +--
 8 files changed, 86 insertions(+), 161 deletions(-)
 delete mode 100644 package/giflib/0002-Fix-CVE-2022-28506.patch
 create mode 100644 package/giflib/0002-Fix-several-defects-found-by-Coverity-scan.patch
 delete mode 100644 package/giflib/0003-Fix-CVE-2023-39742.patch
 delete mode 100644 package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index b3ab5f053d..ba8a97fc62 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -458,7 +458,6 @@ package/genromfs/0001-build-system.patch Sob Upstream
 package/gensio/0001-Fix-missing-EVP_PKEY_ED25519-build-error-on-libressl.patch Upstream
 package/gerbera/S99gerbera Indent
 package/giblib/0001-fix-imlib2-detection.patch Upstream
-package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch Upstream
 package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch Upstream
 package/glorytun/0001-Add-support-for-Apple-silicon.patch Upstream
 package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch Upstream
diff --git a/package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch b/package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch
index 384457d0bd..ba8d426bea 100644
--- a/package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch
+++ b/package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch
@@ -8,8 +8,7 @@ targets to allow the user to build giflib when dynamic library support
 is not available or enable on the toolchain
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://sourceforge.net/p/giflib/code/merge-requests/7]
+Upstream: https://sourceforge.net/p/giflib/code/merge-requests/7
 ---
  Makefile | 18 ++++++++++++++----
  1 file changed, 14 insertions(+), 4 deletions(-)
@@ -18,16 +17,19 @@ diff --git a/Makefile b/Makefile
 index b2bf6de..111f52f 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -61,10 +61,17 @@ UTILS = $(INSTALLABLE) \
+@@ -91,13 +91,20 @@ LIBUTILSO	= libutil.$(SOEXTENSION)
+ LIBUTILSOMAJOR	= libutil.$(LIBMAJOR).$(SOEXTENSION)
+ endif
  
- LDLIBS=libgif.a -lm
- 
--all: libgif.so libgif.a libutil.so libutil.a $(UTILS)
-+SHARED_LIBS = libgif.so libutil.so
+-all: $(LIBGIFSO) libgif.a $(LIBUTILSO) libutil.a $(UTILS)
++SHARED_LIBS = $(LIBGIFSO) $(LIBUTILSO)
 +STATIC_LIBS = libgif.a libutil.a
 +
 +all: shared-lib static-lib $(UTILS)
+ ifeq ($(UNAME), Darwin)
+ else
  	$(MAKE) -C doc
+ endif
  
 -$(UTILS):: libgif.a libutil.a
 +$(UTILS):: $(STATIC_LIBS)
@@ -36,18 +38,18 @@ index b2bf6de..111f52f 100644
 +
 +static-lib: $(STATIC_LIBS)
  
- libgif.so: $(OBJECTS) $(HEADERS)
- 	$(CC) $(CFLAGS) -shared $(LDFLAGS) -Wl,-soname -Wl,libgif.so.$(LIBMAJOR) -o libgif.so $(OBJECTS)
-@@ -79,7 +86,7 @@ libutil.a: $(UOBJECTS) $(UHEADERS)
+ $(LIBGIFSO): $(OBJECTS) $(HEADERS)
+ ifeq ($(UNAME), Darwin)
+@@ -120,7 +127,7 @@ libutil.a: $(UOBJECTS) $(UHEADERS)
  	$(AR) rcs libutil.a $(UOBJECTS)
  
  clean:
--	rm -f $(UTILS) $(TARGET) libgetarg.a libgif.a libgif.so libutil.a libutil.so *.o
+-	rm -f $(UTILS) $(TARGET) libgetarg.a libgif.a $(LIBGIFSO) libutil.a $(LIBUTILSO) *.o
 +	rm -f $(UTILS) $(TARGET) libgetarg.a $(SHARED_LIBS) $(STATIC_LIBS) *.o
- 	rm -f libgif.so.$(LIBMAJOR).$(LIBMINOR).$(LIBPOINT)
- 	rm -f libgif.so.$(LIBMAJOR)
- 	rm -fr doc/*.1 *.html doc/staging
-@@ -96,12 +103,15 @@ install-bin: $(INSTALLABLE)
+ 	rm -f $(LIBGIFSOVER)
+ 	rm -f $(LIBGIFSOMAJOR)
+ 	rm -fr doc/*.[17] *.html doc/staging
+@@ -145,12 +152,15 @@ install-bin: $(INSTALLABLE)
  install-include:
  	$(INSTALL) -d "$(DESTDIR)$(INCDIR)"
  	$(INSTALL) -m 644 gif_lib.h "$(DESTDIR)$(INCDIR)"
@@ -57,13 +59,13 @@ index b2bf6de..111f52f 100644
  	$(INSTALL) -m 644 libgif.a "$(DESTDIR)$(LIBDIR)/libgif.a"
 +install-shared-lib:
 +	$(INSTALL) -d "$(DESTDIR)$(LIBDIR)"
- 	$(INSTALL) -m 755 libgif.so "$(DESTDIR)$(LIBDIR)/libgif.so.$(LIBVER)"
- 	ln -sf libgif.so.$(LIBVER) "$(DESTDIR)$(LIBDIR)/libgif.so.$(LIBMAJOR)"
- 	ln -sf libgif.so.$(LIBMAJOR) "$(DESTDIR)$(LIBDIR)/libgif.so"
+ 	$(INSTALL) -m 755 $(LIBGIFSO) "$(DESTDIR)$(LIBDIR)/$(LIBGIFSOVER)"
+ 	ln -sf $(LIBGIFSOVER) "$(DESTDIR)$(LIBDIR)/$(LIBGIFSOMAJOR)"
+ 	ln -sf $(LIBGIFSOMAJOR) "$(DESTDIR)$(LIBDIR)/$(LIBGIFSO)"
 +install-lib: install-static-lib install-shared-lib
  install-man:
- 	$(INSTALL) -d "$(DESTDIR)$(MANDIR)/man1"
- 	$(INSTALL) -m 644 doc/*.1 "$(DESTDIR)$(MANDIR)/man1"
+ 	$(INSTALL) -d "$(DESTDIR)$(MANDIR)/man1" "$(DESTDIR)$(MANDIR)/man7"
+ 	$(INSTALL) -m 644 $(MANUAL_PAGES_1:xml=1) "$(DESTDIR)$(MANDIR)/man1"
 -- 
-2.20.1
+2.43.0
 
diff --git a/package/giflib/0002-Fix-CVE-2022-28506.patch b/package/giflib/0002-Fix-CVE-2022-28506.patch
deleted file mode 100644
index 35d5f60a95..0000000000
--- a/package/giflib/0002-Fix-CVE-2022-28506.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c0cca041fc4fb6748d8dff3675fe7a839253d668 Mon Sep 17 00:00:00 2001
-From: Sandro Mani <manisandro@gmail.com>
-Date: Tue, 5 Dec 2023 16:24:32 -0700
-Subject: [PATCH] Fix CVE-2022-28506
-
-From: giflib-5.2.1-17.fc39.src.rpm
-Fixes https://nvd.nist.gov/vuln/detail/CVE-2022-28506
-Upstream: https://sourceforge.net/p/giflib/bugs/159/
-
-Signed-off-by: Sandro Mani <manisandro@gmail.com>
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- gif2rgb.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/gif2rgb.c b/gif2rgb.c
-index 8d7c0ff..d9a469f 100644
---- a/gif2rgb.c
-+++ b/gif2rgb.c
-@@ -294,6 +294,11 @@ static void DumpScreen2RGB(char *FileName, int OneFileFlag,
-             GifRow = ScreenBuffer[i];
-             GifQprintf("\b\b\b\b%-4d", ScreenHeight - i);
-             for (j = 0, BufferP = Buffer; j < ScreenWidth; j++) {
-+                /* Check if color is within color palete */
-+                if (GifRow[j] >= ColorMap->ColorCount)
-+                {
-+                   GIF_EXIT(GifErrorString(D_GIF_ERR_IMAGE_DEFECT));
-+                }
-                 ColorMapEntry = &ColorMap->Colors[GifRow[j]];
-                 *BufferP++ = ColorMapEntry->Red;
-                 *BufferP++ = ColorMapEntry->Green;
--- 
-2.43.0
-
diff --git a/package/giflib/0002-Fix-several-defects-found-by-Coverity-scan.patch b/package/giflib/0002-Fix-several-defects-found-by-Coverity-scan.patch
new file mode 100644
index 0000000000..f6816d0753
--- /dev/null
+++ b/package/giflib/0002-Fix-several-defects-found-by-Coverity-scan.patch
@@ -0,0 +1,59 @@
+From a1c48b91cd1cf1e9bf7077709b69f4bfd4c4abc7 Mon Sep 17 00:00:00 2001
+From: Sandro Mani <manisandro@gmail.com>
+Date: Tue, 5 Dec 2023 16:38:48 -0700
+Subject: [PATCH] Fix several defects found by Coverity scan
+
+From: giflib-5.2.1-17.fc39.src.rpm
+Upstream: Not submitted
+
+Signed-off-by: Sandro Mani <manisandro@gmail.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+[Fabrice: updated for 5.2.2]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ gif2rgb.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/gif2rgb.c b/gif2rgb.c
+index d9a469f..02cea41 100644
+--- a/gif2rgb.c
++++ b/gif2rgb.c
+@@ -170,6 +170,8 @@ static void SaveGif(GifByteType *OutputBuffer,
+ 	/* Open stdout for the output file: */
+ 	if ((GifFile = EGifOpenFileHandle(1, &Error)) == NULL) {
+ 		PrintGifError(Error);
++		free(OutputBuffer);
++		GifFreeMapObject(OutputColorMap);
+ 		exit(EXIT_FAILURE);
+ 	}
+ 
+@@ -179,6 +181,8 @@ static void SaveGif(GifByteType *OutputBuffer,
+ 	     EGifPutImageDesc(GifFile, 0, 0, Width, Height, false, NULL) ==
+ 	        GIF_ERROR) {
+ 		PrintGifError(Error);
++		free(OutputBuffer);
++		GifFreeMapObject(OutputColorMap);
+ 		exit(EXIT_FAILURE);
+ 	}
+ 
+@@ -187,6 +191,8 @@ static void SaveGif(GifByteType *OutputBuffer,
+ 
+ 	for (i = 0; i < Height; i++) {
+ 		if (EGifPutLine(GifFile, Ptr, Width) == GIF_ERROR) {
++			free(OutputBuffer);
++			GifFreeMapObject(OutputColorMap);
+ 			exit(EXIT_FAILURE);
+ 		}
+ 		GifQprintf("\b\b\b\b%-4d", Height - i - 1);
+@@ -196,6 +203,8 @@ static void SaveGif(GifByteType *OutputBuffer,
+ 
+ 	if (EGifCloseFile(GifFile, &Error) == GIF_ERROR) {
+ 		PrintGifError(Error);
++		free(OutputBuffer);
++		GifFreeMapObject(OutputColorMap);
+ 		exit(EXIT_FAILURE);
+ 	}
+ }
+-- 
+2.43.0
+
diff --git a/package/giflib/0003-Fix-CVE-2023-39742.patch b/package/giflib/0003-Fix-CVE-2023-39742.patch
deleted file mode 100644
index 2ba01ac8a4..0000000000
--- a/package/giflib/0003-Fix-CVE-2023-39742.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 4288b993ee9df6550a367fe06ede3c003dc7bbc6 Mon Sep 17 00:00:00 2001
-From: Sandro Mani <manisandro@gmail.com>
-Date: Tue, 5 Dec 2023 16:35:40 -0700
-Subject: [PATCH] Fix CVE-2023-39742
-
-From: giflib-5.2.1-17.fc39.src.rpm
-Fix segmentation faults due to non correct checking for args
-Fixes: https://nvd.nist.gov/vuln/detail/CVE-2023-39742
-Upstream: https://sourceforge.net/p/giflib/bugs/166/
-
-Signed-off-by: Sandro Mani <manisandro@gmail.com>
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- getarg.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/getarg.c b/getarg.c
-index d569f6c..51fbe0b 100644
---- a/getarg.c
-+++ b/getarg.c
-@@ -307,6 +307,12 @@ GAGetParmeters(void *Parameters[],
-     int i = 0, ScanRes;
- 
-     while (!(ISSPACE(CtrlStrCopy[i]))) {
-+
-+        if ((*argv) == argv_end) {
-+            GAErrorToken = Option;
-+            return CMD_ERR_NumRead;
-+        }
-+
-         switch (CtrlStrCopy[i + 1]) {
-           case 'd':    /* Get signed integers. */
-               ScanRes = sscanf(*((*argv)++), "%d",
--- 
-2.43.0
-
diff --git a/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch b/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
deleted file mode 100644
index 1719769872..0000000000
--- a/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From a1c48b91cd1cf1e9bf7077709b69f4bfd4c4abc7 Mon Sep 17 00:00:00 2001
-From: Sandro Mani <manisandro@gmail.com>
-Date: Tue, 5 Dec 2023 16:38:48 -0700
-Subject: [PATCH] Fix several defects found by Coverity scan
-
-From: giflib-5.2.1-17.fc39.src.rpm
-Upstream: Not submitted
-
-Signed-off-by: Sandro Mani <manisandro@gmail.com>
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- gif2rgb.c | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/gif2rgb.c b/gif2rgb.c
-index d9a469f..02cea41 100644
---- a/gif2rgb.c
-+++ b/gif2rgb.c
-@@ -170,6 +170,8 @@ static void SaveGif(GifByteType *OutputBuffer,
-     /* Open stdout for the output file: */
-     if ((GifFile = EGifOpenFileHandle(1, &Error)) == NULL) {
- 	PrintGifError(Error);
-+	free(OutputBuffer);
-+	GifFreeMapObject(OutputColorMap);
- 	exit(EXIT_FAILURE);
-     }
- 
-@@ -179,6 +181,8 @@ static void SaveGif(GifByteType *OutputBuffer,
- 	EGifPutImageDesc(GifFile,
- 			 0, 0, Width, Height, false, NULL) == GIF_ERROR) {
- 	PrintGifError(Error);
-+	free(OutputBuffer);
-+	GifFreeMapObject(OutputColorMap);
- 	exit(EXIT_FAILURE);
-     }
- 
-@@ -187,8 +191,11 @@ static void SaveGif(GifByteType *OutputBuffer,
- 	       GifFile->Image.Width, GifFile->Image.Height);
- 
-     for (i = 0; i < Height; i++) {
--	if (EGifPutLine(GifFile, Ptr, Width) == GIF_ERROR)
-+	if (EGifPutLine(GifFile, Ptr, Width) == GIF_ERROR) {
-+	    free(OutputBuffer);
-+	    GifFreeMapObject(OutputColorMap);
- 	    exit(EXIT_FAILURE);
-+        }
- 	GifQprintf("\b\b\b\b%-4d", Height - i - 1);
- 
- 	Ptr += Width;
-@@ -196,6 +203,8 @@ static void SaveGif(GifByteType *OutputBuffer,
- 
-     if (EGifCloseFile(GifFile, &Error) == GIF_ERROR) {
- 	PrintGifError(Error);
-+	free(OutputBuffer);
-+	GifFreeMapObject(OutputColorMap);
- 	exit(EXIT_FAILURE);
-     }
- }
--- 
-2.43.0
-
diff --git a/package/giflib/giflib.hash b/package/giflib/giflib.hash
index 445e9c4b3d..f11d4f1505 100644
--- a/package/giflib/giflib.hash
+++ b/package/giflib/giflib.hash
@@ -1,5 +1,6 @@
 # From http://sourceforge.net/projects/giflib/files
-md5  6f03aee4ebe54ac2cc1ab3e4b0a049e5  giflib-5.2.1.tar.gz
-sha1  c3f774dcbdf26afded7788979c8081d33c6426dc  giflib-5.2.1.tar.gz
+md5  913dd251492134e235ee3c9a91987a4d  giflib-5.2.2.tar.gz
+sha1  608ba98d2dd8d03dfa7476f434d57de50a33e10b  giflib-5.2.2.tar.gz
 # Locally computed
+sha256  be7ffbd057cadebe2aa144542fd90c6838c6a083b5e8a9048b8ee3b66b29d5fb  giflib-5.2.2.tar.gz
 sha256  0c9b7990ecdca88b676db232c226548ac408b279f550d424d996f0d83591dd8e  COPYING
diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index 3ac74f9244..770338507b 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -4,18 +4,13 @@
 #
 ################################################################################
 
-GIFLIB_VERSION = 5.2.1
+GIFLIB_VERSION = 5.2.2
 GIFLIB_SITE = http://downloads.sourceforge.net/project/giflib
 GIFLIB_INSTALL_STAGING = YES
 GIFLIB_LICENSE = MIT
 GIFLIB_LICENSE_FILES = COPYING
 GIFLIB_CPE_ID_VALID = YES
 
-# 0002-Fix-CVE-2022-28506.patch
-GIFLIB_IGNORE_CVES = CVE-2022-28506
-# 0003-Fix-CVE-2023-39742.patch
-GIFLIB_IGNORE_CVES += CVE-2023-39742
-
 ifeq ($(BR2_STATIC_LIBS),y)
 GIFLIB_BUILD_LIBS = static-lib
 GIFLIB_INSTALL_LIBS = install-static-lib
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
