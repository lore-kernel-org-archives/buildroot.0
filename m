Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C10AC369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 08:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06CAB40647;
	Mon, 14 Apr 2025 08:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIF8KVXt0GES; Mon, 14 Apr 2025 08:54:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29833402F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29833402F8;
	Mon, 14 Apr 2025 08:54:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22774250
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 08:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EFF660B38
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 08:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_31TFOd3VRC for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 08:54:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.46;
 helo=mail-lf1-f46.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED88C605E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED88C605E4
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED88C605E4
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 08:54:42 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-54996d30bfbso3595857e87.2
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 01:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744620880; x=1745225680;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o2M8Q3jxwEjLLlI+//hs9Y7bdKRAy0fqbQIfcBcGui0=;
 b=K3c0ydyfPX3Ls6j/Kf4WKEWyuGmZl6DX6TewIDRTNVRpjjrV5NBMGhsTUR65S8LXu7
 XFuZ4jK6no2DvfO1Czq8JmwxOA5lT58szmXWmoOXSoww/L3cti7Ca0RGIllPa/xt2FEA
 mtdOTqRAA3LeQzuIepVpy8HtTRYL9jVGC6q9WEHfU+3qBL+Ug5RE5EH4bxjE+3taWki4
 tsA4oDqVOCKYZs0z3QUZfdMdW3NCDDCe+mRt2twhEFKBhS1kuQnO5jf/0jvfBNS39jIv
 vZ2piDslaqGUN9PuKeg5NuG0VyfLOV5tPCPlw3tglfN+eIKORD9Y6Im2NNl5agKs8oaN
 iIvw==
X-Gm-Message-State: AOJu0YzHUeBGKoK538V0Z8M96hvvdBaZVjECacKuykGAw2uZDlG2U1Yb
 vu3ail8c1p0Cql94BfHSbL6OXW8PjH+uomJpkqa4fH2zIlU0OAwETPpX2g==
X-Gm-Gg: ASbGncvq2qjFXOt3sefTUmvffBiEPuRpehjGEnZ4a908cUnFfhbybukxBMN/XtXTI7t
 y+nhhYMMjLHzaamsF83jXLWD7xl73UgtCULSOUrnF6+C7TWOKgc/oBxtPnDkYt0qW1zZ/KJrgLD
 l4GQm7yT8SyO4i6nwpgtoYo9gEzDVuRE/6hRUYl6WGKF2g7XKg9eOnQRQiiNeqIX5IlJM+DORUI
 4yL5WbshO3CHnZlXZtEFN1dQSdYaNKEzdyT5r7Y2pcK/R4PacXrUstvnXqsosoaf3Rbz/dwC+aj
 lZJSbIFm8nPBkvg1cGFObnEyLXzBw5PXULEYMAv8wvtJDl8tpi4Cea5/v0bJaORCNJVEm174zXx
 Aean15A==
X-Google-Smtp-Source: AGHT+IGEmdqNjqvHaq5U2M/yFYbHD7c278COFgVedwFXskRCbEa/2DV9NaSUMvEDSD7QkzWPthzzKw==
X-Received: by 2002:a05:6512:1389:b0:545:2b68:936e with SMTP id
 2adb3069b0e04-54d4529d801mr2819364e87.25.1744620880000; 
 Mon, 14 Apr 2025 01:54:40 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d51e179sm1030362e87.224.2025.04.14.01.54.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 01:54:39 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30bfc8faef9so38579021fa.1
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 01:54:39 -0700 (PDT)
X-Received: by 2002:a2e:ad92:0:b0:30b:d63c:ad20 with SMTP id
 38308e7fff4ca-31049a25e74mr35761901fa.24.1744620879136; Mon, 14 Apr 2025
 01:54:39 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 14 Apr 2025 10:54:27 +0200
X-Gmail-Original-Message-ID: <CACXRmJi+iFhaxBHSDB1V8edSxzsJL6jpMXV+AC+c=TGYkaJCfw@mail.gmail.com>
X-Gm-Features: ATxdqUGKW2hdVDcIdwsZ-dxHHACmb0HHNn4FplaRcYdoCIgCF8l3xxo6G-USmDU
Message-ID: <CACXRmJi+iFhaxBHSDB1V8edSxzsJL6jpMXV+AC+c=TGYkaJCfw@mail.gmail.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/libfcgi: update to 2.4.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

From 7b98d553c19cd00e2072e3c7e42278e8c0b1ec11 Mon Sep 17 00:00:00 2001
From: Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Mon, 14 Apr 2025 10:50:43 +0200
Subject: [PATCH v1] package/libfcgi: update to 2.4.4

Announcement:
- https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.3
- https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.4

Notes:
- drop 0001-link-against-math.patch as it is upstream [1] (by @ffontaine)
- drop 0002-disable-examples.patch as it is upstream [2] (by
@ffontaine), add --disable-examples now
- update LICENSE as the name has been changed [3]

[1] https://github.com/FastCGI-Archives/fcgi2/commit/214a7bc4da57ccbb0e8840a2f595cd99701b19f6
[2] https://github.com/FastCGI-Archives/fcgi2/commit/aa74aa7dcec5905de3bdee7f8f5a0a6d62c86cad
[3] https://github.com/FastCGI-Archives/fcgi2/commit/65571daaa538e9193fab5935e3ae69ff123da19d

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
package/libfcgi/0001-link-against-math.patch | 20 -----------------
package/libfcgi/0002-disable-examples.patch | 23 --------------------
package/libfcgi/libfcgi.hash | 4 ++--
package/libfcgi/libfcgi.mk | 4 ++--
4 files changed, 4 insertions(+), 47 deletions(-)
delete mode 100644 package/libfcgi/0001-link-against-math.patch
delete mode 100644 package/libfcgi/0002-disable-examples.patch

diff --git a/package/libfcgi/0001-link-against-math.patch
b/package/libfcgi/0001-link-against-math.patch
deleted file mode 100644
index 909a295bd61..00000000000
--- a/package/libfcgi/0001-link-against-math.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Link libfcgi against the math library.
-
-Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
-[Louis: rebase on top of 2.4.2]
-Signed-off-by: Louis Rannou <louis.rannou@smile.fr>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-
-Index: b/libfcgi/Makefile.am
-===================================================================
---- a/libfcgi/Makefile.am
-+++ b/libfcgi/Makefile.am
-@@ -19,6 +19,7 @@
- os_@SYSTEM@.c
- libfcgi_la_CC = @PTHREAD_CC@
- libfcgi_la_CFLAGS = @PTHREAD_CFLAGS@
-+libfcgi_la_LIBADD = -lm
- libfcgi_la_LDFLAGS = @EXTRA_LIBS@ -no-undefined
-
- libfcgi___la_SOURCES = $(INCLUDE_FILES) \
diff --git a/package/libfcgi/0002-disable-examples.patch
b/package/libfcgi/0002-disable-examples.patch
deleted file mode 100644
index ccd01c0ce03..00000000000
--- a/package/libfcgi/0002-disable-examples.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Common subdirectories: libfcgi-2.4.0.orig/cgi-fcgi and libfcgi-2.4.0/cgi-fcgi
-Common subdirectories: libfcgi-2.4.0.orig/doc and libfcgi-2.4.0/doc
-Common subdirectories: libfcgi-2.4.0.orig/examples and libfcgi-2.4.0/examples
-Common subdirectories: libfcgi-2.4.0.orig/images and libfcgi-2.4.0/images
-Common subdirectories: libfcgi-2.4.0.orig/include and libfcgi-2.4.0/include
-Common subdirectories: libfcgi-2.4.0.orig/java and libfcgi-2.4.0/java
-Common subdirectories: libfcgi-2.4.0.orig/libfcgi and libfcgi-2.4.0/libfcgi
-diff -du libfcgi-2.4.0.orig/Makefile.am libfcgi-2.4.0/Makefile.am
---- libfcgi-2.4.0.orig/Makefile.am 2001-12-22 14:05:39.000000000 +0100
-+++ libfcgi-2.4.0/Makefile.am 2014-07-19 16:56:21.935216540 +0200
-@@ -10,7 +10,7 @@
- aclocal.m4 m4/libtool.m4 m4/lt*.m4 Makefile.in install-sh missing ltmain.sh \
- COPYING INSTALL
-
--SUBDIRS = libfcgi cgi-fcgi examples include
-+SUBDIRS = libfcgi cgi-fcgi include
-
- include_HEADERS = fcgi_config.h
-
-Common subdirectories: libfcgi-2.4.0.orig/perl and libfcgi-2.4.0/perl
-Common subdirectories: libfcgi-2.4.0.orig/Win32 and libfcgi-2.4.0/Win32
diff --git a/package/libfcgi/libfcgi.hash b/package/libfcgi/libfcgi.hash
index 83860a4f3d3..ca660c6ebdc 100644
--- a/package/libfcgi/libfcgi.hash
+++ b/package/libfcgi/libfcgi.hash
@@ -1,3 +1,3 @@
# Locally calculated
-sha256 1fe83501edfc3a7ec96bb1e69db3fd5ea1730135bd73ab152186fd0b437013bc
libfcgi-2.4.2.tar.gz
-sha256 f0a8fe4513a43e8eebb24cdcf9d2e7efc52e4d8259178c6d76d3d84418397d81
LICENSE.TERMS
+sha256 c0e0d9cc7d1e456d7278c974e2826f593ef5ca555783eba81e7e9c1a07ae0ecc
libfcgi-2.4.4.tar.gz
+sha256 f0a8fe4513a43e8eebb24cdcf9d2e7efc52e4d8259178c6d76d3d84418397d81 LICENSE
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index ee61c22c45b..21dc65f4607 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -4,10 +4,10 @@
#
################################################################################
-LIBFCGI_VERSION = 2.4.2
+LIBFCGI_VERSION = 2.4.4
LIBFCGI_SITE = $(call github,FastCGI-Archives,fcgi2,$(LIBFCGI_VERSION))
LIBFCGI_LICENSE = OML
-LIBFCGI_LICENSE_FILES = LICENSE.TERMS
+LIBFCGI_LICENSE_FILES = LICENSE
LIBFCGI_CPE_ID_VENDOR = fastcgi
LIBFCGI_CPE_ID_PRODUCT = fcgi
LIBFCGI_INSTALL_STAGING = YES
-- 
2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
