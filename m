Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EE9E7717F
	for <buildroot@archiver.kernel.org>; Tue, 10 Dec 2024 11:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE79A80FA7;
	Tue, 10 Dec 2024 11:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0oG4kzOz5QJ5; Tue, 10 Dec 2024 11:23:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AC5B80FA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AC5B80FA6;
	Tue, 10 Dec 2024 11:23:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E7DB6F
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 11:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FFDC80F92
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 11:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUL4Vh0iBooB for <buildroot@buildroot.org>;
 Tue, 10 Dec 2024 11:23:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D6FD980F93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6FD980F93
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6FD980F93
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 11:23:45 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa679ad4265so414215666b.0
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 03:23:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733829823; x=1734434623;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bsnJPLJIw7fh9eR1Q6EIoFEhnjlXEOaiNUsAzJx5MT4=;
 b=L0N0NJ5eU6wygtyJ1llgz7S/bCe08nS3THtsu9ps0fcgzVhbIUfZlUyX56cBxzj/bP
 Qbn2TQsZIb/utHErPKNZ0DhVL8tILT6Cq1VtdBCuiWgaeVnn9AXzlEGOEIO1kSqZTBsW
 eUhZnnJyY2VCOHEBX0Bvo73Lf1/83TvYVVHdgdZ7IL8SCaseVB/kHRSOHGmwN40ovGQz
 2YBiA6NQylo6ZUZy0DhRAzU+wocycTnKCWhxkjnRdPCUr7unUuecNoJiqxnbL9NTAzhd
 w5/sM6z1bduVTzHXELRmK0evcqmoP0wMbrp1RrqgCuyTQSabGJhfFbCS7rVST78Qqvjp
 Ft2w==
X-Gm-Message-State: AOJu0Yz0Yf9Op+y31/K1DMhLY6ffho9dTdc9NOjxJa4nQtk/wl6fcT2r
 +28FlTTrYQY0Jx2s/mRPExJSM7f7N02dhPqFPoKEg+plGG+HFFeZ+2X8fg==
X-Gm-Gg: ASbGncsJxQoCOjebMa06OKcwPjjYdW4DS0agXjWMIP5kRyoPCXhDaMu7qd/g7scW2SB
 S3yi1buasxX5J/2YmSxXnG2fBZJGbwHdO465ldf2yYKnUEkBorVOl+yLlQhmFFuDc3PE72z0odU
 FRSrLqNaeCub8wFGMuSvYNxTXWIQLFwODYFDL06zDL7f5HKcNQlFIYtPk0JIB0s+esNhtBubGom
 x6UnYjh4kBiVBGwU17kdx9k81HHLTSA5Aivs0Ot72syrKnaOF3dPdfKokM975fLMDleUR0NfJQe
 /pnYaaGCz4RXUjATBLPeC8lbTfhRoXOlg88=
X-Google-Smtp-Source: AGHT+IHgpiOOQ/EFnBT5FKI6GZ4hdWxS+XNV0y1tcbpfzP0BEaWRsR/Bb2L7zGZEGAH3fbID8/IHOQ==
X-Received: by 2002:a17:907:950f:b0:aa6:a9fe:46de with SMTP id
 a640c23a62f3a-aa6a9fe47f4mr56595566b.19.1733829822477; 
 Tue, 10 Dec 2024 03:23:42 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6552b29a3sm518195566b.86.2024.12.10.03.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 03:23:41 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 10 Dec 2024 12:23:35 +0100
Message-Id: <20241210112335.1590394-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1733829823; x=1734434623; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bsnJPLJIw7fh9eR1Q6EIoFEhnjlXEOaiNUsAzJx5MT4=;
 b=FL+BNi5LrOURullXtn1Bt2doF5VoYF1Y2W/QUWkBC9R1QYfC7TRjtcD0ALjdDlbS04
 nyeEUCo2ALU9lnYhMvtLEyjbv6JYu1+sEnlM4A4szXI/JbFXyqOMOx+kytRsDpeBG7/C
 bkOg1D60/dua7wu8HpKm9sJCpqrQTvp1IBgQnnFvcMsfACPpkuUE/SOOEUcezXJdzeS8
 KROH8hWi3VSxFqztd9eqHLQkHVgovA6qDVjBXlrN4FnUUU74bRcSQyTJqNiQQ8FAAgyI
 aQEvTQn9jSeGB+EPYjeydqvWqtewTVHcRYjKSEO7zy6KAwv8TKB4pWfZZMSKoOrJECwC
 jdBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FL+BNi5L
Subject: [Buildroot] [PATCH] package/giblib: remove package
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

giblib was introduced as a dependency of a feh package that
no longer depends on it.

Besides, it is no longer maintained and the download URL is no
longer accessible.

Fixes:
https://autobuild.buildroot.org/results/983f1d4c01f826877c4b372713bf271412973a42/
https://autobuild.buildroot.org/results/0a124034687d55bd8931fef8ef0f20bb56a631f1/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 Config.in.legacy                              |   7 +
 DEVELOPERS                                    |   1 -
 .../giblib/0001-fix-imlib2-detection.patch    | 127 ------------------
 package/giblib/Config.in                      |  13 --
 package/giblib/giblib.hash                    |   3 -
 package/giblib/giblib.mk                      |  19 ---
 6 files changed, 7 insertions(+), 163 deletions(-)
 delete mode 100644 package/giblib/0001-fix-imlib2-detection.patch
 delete mode 100644 package/giblib/Config.in
 delete mode 100644 package/giblib/giblib.hash
 delete mode 100644 package/giblib/giblib.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 2ef1e19516..05ed773f65 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_GIBLIB
+	bool "giblib has been removed"
+	select BR2_LEGACY
+	help
+	  The giblib package was removed as it is not maintained
+	  anymore and the upstream URL is gone.
+
 config BR2_PACKAGE_FCONFIG
 	bool "fconfig has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 646002850f..047dc4a88f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3384,7 +3384,6 @@ F:	package/can-utils/
 F:	package/circus/
 F:	package/dhcpcd/
 F:	package/feh/
-F:	package/giblib/
 F:	package/hostapd/
 F:	package/imlib2/
 F:	package/jquery-datetimepicker/
diff --git a/package/giblib/0001-fix-imlib2-detection.patch b/package/giblib/0001-fix-imlib2-detection.patch
deleted file mode 100644
index 2323107941..0000000000
--- a/package/giblib/0001-fix-imlib2-detection.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-configure.ac + Makefile.am: fix the imlib2 detection
-
-Although imlib2 is correctly checked for, the variables used to get
-the CFLAGS and LIBS are wrong (perhaps a remnant of the pre-imlib2
-era, when giblib was using imlib).
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/configure.ac b/configure.ac
-index 6807d86..c8874f0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -18,16 +18,10 @@ AM_MAINTAINER_MODE
- AM_WITH_DMALLOC
- 
- AC_PATH_GENERIC(imlib2, 1.0.0, [
--  AC_SUBST(IMLIB_LIBS)
--  AC_SUBST(IMLIB_CFLAGS) ],
-+  AC_SUBST(IMLIB2_LIBS)
-+  AC_SUBST(IMLIB2_CFLAGS) ],
-   AC_MSG_ERROR(Cannot find imlib2: Is imlib2-config in the path?) )
- 
--dnl the above doesn't work for some reason :/
--IMLIB_LIBS=`imlib2-config --libs`
--IMLIB_CFLAGS=`imlib2-config --cflags`
--AC_SUBST(IMLIB_LIBS)
--AC_SUBST(IMLIB_CFLAGS)
--
- LIBS="$LIBS -lm"
- CFLAGS="$CFLAGS -Wall"
- 
-@@ -48,7 +42,7 @@ $PACKAGE $VERSION
- Configuration:
- --------------
- 
--Imlib2 libs:	$IMLIB_LIBS
--Imlib2 cflags:  $IMLIB_CFLAGS
-+Imlib2 libs:	$IMLIB2_LIBS
-+Imlib2 cflags:  $IMLIB2_CFLAGS
- CFLAGS:			$CFLAGS
- "
-diff --git a/configure.in b/configure.in
-index 432cb16..6999095 100644
---- a/configure.in
-+++ b/configure.in
-@@ -17,16 +17,10 @@ AM_MAINTAINER_MODE
- AM_WITH_DMALLOC
- 
- AC_PATH_GENERIC(imlib2, 1.0.0, [
--  AC_SUBST(IMLIB_LIBS)
--  AC_SUBST(IMLIB_CFLAGS) ],
-+  AC_SUBST(IMLIB2_LIBS)
-+  AC_SUBST(IMLIB2_CFLAGS) ],
-   AC_MSG_ERROR(Cannot find imlib2: Is imlib2-config in the path?) )
- 
--dnl the above doesn't work for some reason :/
--IMLIB_LIBS=`imlib2-config --libs`
--IMLIB_CFLAGS=`imlib2-config --cflags`
--AC_SUBST(IMLIB_LIBS)
--AC_SUBST(IMLIB_CFLAGS)
--
- LIBS="$LIBS -lm"
- CFLAGS="$CFLAGS -Wall"
- 
-@@ -45,7 +39,7 @@ $PACKAGE $VERSION
- Configuration:
- --------------
- 
--Imlib2 libs:	$IMLIB_LIBS
--Imlib2 cflags:  $IMLIB_CFLAGS
-+Imlib2 libs:	$IMLIB2_LIBS
-+Imlib2 cflags:  $IMLIB2_CFLAGS
- CFLAGS:			$CFLAGS
- "
-diff --git a/giblib-config.in b/giblib-config.in
-index f3a7db6..cef1620 100644
---- a/giblib-config.in
-+++ b/giblib-config.in
-@@ -42,11 +42,11 @@ while test $# -gt 0; do
-       if test @includedir@ != /usr/include ; then
-         includes=-I@includedir@
-       fi
--      echo $includes -I$prefix/include/giblib @IMLIB_CFLAGS@
-+      echo $includes -I$prefix/include/giblib @IMLIB2_CFLAGS@
-       ;;
-     --libs)
-       libdirs=-L@libdir@
--      echo $libdirs -lgiblib @LDFLAGS@ @IMLIB_LIBS@
-+      echo $libdirs -lgiblib @LDFLAGS@ @IMLIB2_LIBS@
-       ;;
-     *)
-       echo "${usage}" 1>&2
-diff --git a/giblib.pc.in b/giblib.pc.in
-index df520ae..783e6e1 100644
---- a/giblib.pc.in
-+++ b/giblib.pc.in
-@@ -6,6 +6,6 @@ includedir=@includedir@
- Name: giblib
- Description: wrapper library for imlib2, and other stuff
- Version: @VERSION@
--Libs: -L${libdir} -lgiblib @LDFLAGS@ @IMLIB_LIBS@
--Cflags: -I${includedir} -I${includedir}/giblib @IMLIB_CFLAGS@
-+Libs: -L${libdir} -lgiblib @LDFLAGS@ @IMLIB2_LIBS@
-+Cflags: -I${includedir} -I${includedir}/giblib @IMLIB2_CFLAGS@
- 
-diff --git a/giblib/Makefile.am b/giblib/Makefile.am
-index d1edc09..49d8ac4 100644
---- a/giblib/Makefile.am
-+++ b/giblib/Makefile.am
-@@ -3,7 +3,7 @@ MAINTAINERCLEANFILES = Makefile.in
- 
- INCLUDES = \
- -I. -I$(top_srcdir) \
---DPREFIX=\""$(prefix)"\" @IMLIB_CFLAGS@
-+-DPREFIX=\""$(prefix)"\" @IMLIB2_CFLAGS@
- 
- lib_LTLIBRARIES = libgiblib.la
- 
-@@ -24,7 +24,7 @@ libgiblib_la_SOURCES = \
-     gib_utils.c gib_utils.h \
- 	gib_queue.c gib_queue.h
- 
--libgiblib_la_LIBADD = @IMLIB_LIBS@
-+libgiblib_la_LIBADD = @IMLIB2_LIBS@
- libgiblib_la_DEPENDENCIES = giblib_config.h
- libgiblib_la_LDFLAGS = -version-info 1:6:0
- 
diff --git a/package/giblib/Config.in b/package/giblib/Config.in
deleted file mode 100644
index f50271ac53..0000000000
--- a/package/giblib/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_GIBLIB
-	bool "giblib"
-	depends on BR2_PACKAGE_XORG7
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_IMLIB2
-	select BR2_PACKAGE_IMLIB2_X
-	help
-	  Giblib is a simple library which wraps imlib2.
-
-	  http://linuxbrit.co.uk/giblib/
-
-comment "giblib support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
diff --git a/package/giblib/giblib.hash b/package/giblib/giblib.hash
deleted file mode 100644
index 0c83a55457..0000000000
--- a/package/giblib/giblib.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  176611c4d88d742ea4013991ad54c2f9d2feefbc97a28434c0f48922ebaa8bac  giblib-1.2.4.tar.gz
-sha256  8601e2dacede853fe325f7fd3a11f93b1753d576db60426f1b0ff4e68f41ff07  COPYING
diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
deleted file mode 100644
index b0a962001d..0000000000
--- a/package/giblib/giblib.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# giblib
-#
-################################################################################
-
-GIBLIB_VERSION = 1.2.4
-GIBLIB_SITE = http://linuxbrit.co.uk/downloads
-GIBLIB_INSTALL_STAGING = YES
-GIBLIB_DEPENDENCIES = imlib2
-GIBLIB_AUTORECONF = YES
-GIBLIB_CONF_OPTS = \
-	--with-imlib2-prefix=$(STAGING_DIR)/usr \
-	--with-imlib2-exec-prefix=$(STAGING_DIR)/usr
-GIBLIB_CONFIG_SCRIPTS = giblib-config
-GIBLIB_LICENSE = MIT
-GIBLIB_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
