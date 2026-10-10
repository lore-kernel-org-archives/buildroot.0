Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6876BCA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E53760EE6;
	Sat, 10 Oct 2026 09:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8OcejA67AOnO; Sat, 10 Oct 2026 09:28:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BDBC060F6E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624507;
	b=NsEfKrHUdA6k/ePTuZZURrsfllH089CPgYFpHlBCvQuFnyRVmCu2/15pC8GdUZkf6MAM
	 cHf79XlAPJoHano9O+pyuhueTUQEGM75gmA82HS7pjjHjHgre96pTXjoDoJEIcWRoC32a
	 gTkN+9bGr8G0VB0vhChTGN4LTxJZT/y4frR9vFofK45Ye9rEHjbcH6Ocq6g31HIzebo64
	 Kj8vuLSltXwvreLGNZTec0vu5+6E4AZoXAEjDNoOZaYBmuqPgsm0vo4PoAVCkEQmix22t
	 yivtEbNBkJX/C8izTyQLpIUtt/U37+WNES/oYvliwarft5zYa9OYzBgOU0undymdFeg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624507;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=9RAxWCbjmI3VliYl84HMFp83P4pthKMlIBj6iCXKjJY=;
	b=Vzq9Ngvh2x4ldd69GfGzzDEKSkKeF52wvrfjTQUBMEvp/wLJNE8ZjqJWztYhQEXOgJ5+
	 EaEmo3Th8wYQTe8kLKtyhIJHgOTn9k+GgD7W4tXCh1+L1mQwamXDcHL45jkoTMtQYM4Qp
	 6azZKT3iDj4HlwU1B9ci4XCVvqv6FyKkYSfSK431VDF0TvopyAZw76J5KORUfD2cQOLmt
	 KQuEhw1DoEn1FYJE+Paq8/RQTr24hGSQcFeqwte75AwZsZT8RBt9b+1m7LnLxWMAbnMrM
	 FSEiLtkzr0z0XUUomc2M12dHcxR/30jPpCNh73tuzFUEuWcMX+hzl4SzpLRrMF6iRCw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624506;
	bh=9RAxWCbjmI3VliYl84HMFp83P4pthKMlIBj6iCXKjJY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Bhx7ijCKtIgoYHX9Ct9Pprk/Wphgc5SZWgsHrYQB+uk+rbvSOLUTHkp7o5CtCKkms
	 EtD/XkiUgpsD24tFR5hIjpktbgviOgVQhgGwKp9UnO5JpDTAqTg9xnONnlPyZw5NdY
	 cedn47DlSq8BFaRMbM+oUi2ZAMzGf78MQyEXUwG0XpM8DDMwOp5SvzmvvtYrPlmGrx
	 YTqNYFG6V0ppCv8k1EtwCLpzhZOu4ADR7O88xeMnewgFAGahjkUrRqRzaJtwRP/70K
	 5PlJZsM5XIw6vYed/u8GkyRUcBdigyQRlaQbt2iJFao9JUaoweS3TcFn5aMXqj0v6F
	 zyAZzA/+dffuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDBC060F6E;
	Sat, 10 Oct 2026 09:28:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 74D34A64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66D7380F85
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1cNQDgjXbiX1 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 35865811BE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624443;
 b=TiJL25iomv0wsJDzsZ1ieFc0r8y+8JXrw8zN0KERVIPK69SJFSX91ep8RrNdFmCEA7fH
 MVXMU6+td+5EstS2JzYgmhZUMGKpvSRtzcbEWV2WzztHl8nyrhyQ0yDVul1EPoOAwjnmv
 Ys6KyieYe8fPV5YqvL9SqTydvN+FnLJSQlNuRelTWOPmHfTTLxuhMHMtmfdH2OovxIRV6
 uNrYQAKchcQIuO9DvDoJ9N9xxFEw/4ksuRMo4PpaeyUfVFRHfsoq7it3qxtuSXis2tthp
 f0vl/+ZYSk5dK8Hlw8IvxgLw/xF1dSziTjuDbPsc+XDZ3Gizz++o1M7SQkSpfqfNn5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624443;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sTEuyZWs8t15ht4KfqFOoCvSg8Um0POgp3Lx/HaSA08=;
 b=mzjr39Hdb6k3P20zYZyQN8oyVTJl0E+r/tINl3p4V8HKIZr5vDFWSI1E8byW6m3u+3Lv
 FLc9TH0CTtCAg9bYath14Z3jRbn9KTW0f6aBTkXrZRhS9Orlo6zJug46MppWDGftyQAIc
 b70l9kYMvzCYzA7vkePqT1VKSzhn6wft04j1LJByfKIjOiZiLHAn39IU7OT0oFtZ+otBz
 7KXUE9hx2UuA46KZ6FQL9lYElFobkN+3Hxl5jfNOM3dxsxc4MCXLRev/gzsVyovWQBj8B
 ++XFhWaGQVyGaL3JYA95V+I7+t4dWkAytWep11jEfEJJbp6ylsHhhsrrNnCK1XVy7Rw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35865811BE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 092DF8F1BD; Sat, 10 Oct 2026 09:26:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 09:10:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2bf0a34e85b3ce6e8b6603fdb150c5c22b0698bc
X-Git-Newrev: 58f2e69d72c172aa7a943e0bc9b4febd875c5bbe
X-Patchwork-Hint: ignore
Message-Id: <20261010092605.092DF8F1BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libgphoto2: fix
 build with gcc >= 14
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6953200025464750459=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6953200025464750459==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/58f2e69d72c172aa7a943e0bc9b4febd875c5bbe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The commit adds a backported upstream patch to fix the following build
failure:

jl2005c/jl2005bcd_decompress.c: In function 'jl2005bcd_decompress':
jl2005c/jl2005bcd_decompress.c:161:46: error: passing argument 3 of 'jpeg_mem_dest' from incompatible pointer type [-Wincompatible-pointer-types]
  161 |         jpeg_mem_dest (&cinfo, &jpeg_header, &jpeg_header_size);
      |                                              ^~~~~~~~~~~~~~~~~
      |                                              |
      |                                              long unsigned int *

The same fix was merged in master with commit d2ad5b883342
("package/libgphoto2: fix build with gcc >= 14") for version 2.5.33.
The patch has been adapted to version 2.5.27, where the libjpeg check
lives in configure.ac rather than in gphoto-m4/gp-libjpeg.m4.

Fixes:
- https://autobuild.buildroot.org/results/09f2756d3d26a9e27ef596428c84d37c5d2d5bb2

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
(alternative to commit d2ad5b883342b92c354c8a110ffbaf1ca7dda20f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...checks-for-the-size-type-of-jpeg_mem_dest.patch | 142 +++++++++++++++++++++
 package/libgphoto2/libgphoto2.mk                   |   2 +
 2 files changed, 144 insertions(+)

diff --git a/package/libgphoto2/0002-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch b/package/libgphoto2/0002-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
new file mode 100644
index 0000000000..50682743f0
--- /dev/null
+++ b/package/libgphoto2/0002-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
@@ -0,0 +1,142 @@
+From 4bcdd2b604cd96815ff4b8bdfe7c7a587970929d Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Sun, 29 Mar 2026 21:31:49 +0200
+Subject: [PATCH] autoconf checks for the size type of jpeg_mem_dest
+
+fixes https://github.com/gphoto/libgphoto2/pull/1176
+
+[Dario: backport to 2.5.27, where the libjpeg check lives in
+configure.ac instead of libgphoto2_port/gphoto-m4/gp-libjpeg.m4]
+Upstream: https://github.com/gphoto/libgphoto2/commit/ca4441f48117c681cecfb3c883115e0546aed985
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+---
+ camlibs/ax203/ax203.c                  |  2 +-
+ camlibs/ax203/ax203_compress_jpeg.c    |  2 +-
+ camlibs/ax203/jpeg_memsrcdest.h        |  2 ++
+ camlibs/jl2005c/jl2005bcd_decompress.c |  2 +-
+ camlibs/jl2005c/jpeg_memsrcdest.h      |  2 ++
+ camlibs/ptp2/chdk.c                    |  2 +-
+ configure.ac                           | 32 ++++++++++++++++++++++++++
+ 7 files changed, 40 insertions(+), 4 deletions(-)
+
+diff --git a/camlibs/ax203/ax203.c b/camlibs/ax203/ax203.c
+index db696110d8aa..540b4ff9ca4f 100644
+--- a/camlibs/ax203/ax203.c
++++ b/camlibs/ax203/ax203.c
+@@ -1202,7 +1202,7 @@ ax203_encode_image(Camera *camera, int **src, char *dest, unsigned int dest_size
+ 	struct jpeg_compress_struct cinfo;
+ 	struct jpeg_error_mgr jcerr;
+ 	JOCTET *jpeg_dest = NULL;
+-	unsigned long jpeg_size = 0;
++	JPEG_SIZE jpeg_size = 0;
+ 	JSAMPLE row[camera->pl->width * 3];
+ 	JSAMPROW row_pointer[1] = { row };
+ #endif
+diff --git a/camlibs/ax203/ax203_compress_jpeg.c b/camlibs/ax203/ax203_compress_jpeg.c
+index 1ec7534ff484..22068afd79c0 100644
+--- a/camlibs/ax203/ax203_compress_jpeg.c
++++ b/camlibs/ax203/ax203_compress_jpeg.c
+@@ -124,7 +124,7 @@ ax206_compress_jpeg(Camera *camera, int **in, uint8_t *outbuf, int out_size,
+ 	jvirt_barray_ptr *in_coefficients;
+ 	unsigned int i, x, y;
+ 	int stop, size, ret, outc;
+-	unsigned long regular_jpeg_size = 0, buf_size = 0;
++	JPEG_SIZE regular_jpeg_size = 0, buf_size = 0;
+ 	int last_dc_val[3] = { 0, 0, 0 };
+ 
+ 	/* We have a rgb24bit image in the desired dimensions, first we
+diff --git a/camlibs/ax203/jpeg_memsrcdest.h b/camlibs/ax203/jpeg_memsrcdest.h
+index b13bf3f4055e..ea0cd7ab4872 100644
+--- a/camlibs/ax203/jpeg_memsrcdest.h
++++ b/camlibs/ax203/jpeg_memsrcdest.h
+@@ -2,6 +2,8 @@
+ 
+ #if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
+ 
++#define JPEG_SIZE unsigned long
++
+ void
+ jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
+ 	unsigned long bufsize);
+diff --git a/camlibs/jl2005c/jl2005bcd_decompress.c b/camlibs/jl2005c/jl2005bcd_decompress.c
+index 005bf8e52ac4..461e714c6de5 100644
+--- a/camlibs/jl2005c/jl2005bcd_decompress.c
++++ b/camlibs/jl2005c/jl2005bcd_decompress.c
+@@ -85,7 +85,7 @@ jl2005bcd_decompress (unsigned char *output, unsigned char *input,
+ 	struct jpeg_error_mgr jcerr, jderr;
+ 	JOCTET *jpeg_header = NULL;
+ 	int outputsize = 0;
+-	unsigned long jpeg_header_size = 0;
++	JPEG_SIZE jpeg_header_size = 0;
+ 	int i, x, y, x1, y1, jpeg_data_size, jpeg_data_idx, eoi, size, ret;
+ 	JSAMPLE green[8 * 16];
+ 	JSAMPLE red[8 * 8];
+diff --git a/camlibs/jl2005c/jpeg_memsrcdest.h b/camlibs/jl2005c/jpeg_memsrcdest.h
+index b13bf3f4055e..ea0cd7ab4872 100644
+--- a/camlibs/jl2005c/jpeg_memsrcdest.h
++++ b/camlibs/jl2005c/jpeg_memsrcdest.h
+@@ -2,6 +2,8 @@
+ 
+ #if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
+ 
++#define JPEG_SIZE unsigned long
++
+ void
+ jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
+ 	unsigned long bufsize);
+diff --git a/camlibs/ptp2/chdk.c b/camlibs/ptp2/chdk.c
+index c9b553ab3bba..b2924a34293c 100644
+--- a/camlibs/ptp2/chdk.c
++++ b/camlibs/ptp2/chdk.c
+@@ -1166,7 +1166,7 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
+ 	struct		jpeg_error_mgr jerr;
+ 	JSAMPROW	row_ptr[1];
+ 	uint8_t		*outbuf = NULL, *tmprowbuf = NULL;
+-	unsigned long	outlen = 0;
++	JPEG_SIZE	outlen = 0;
+ 	unsigned int	row_inc;
+ 	int		sshift, dshift, xshift, skip;
+ 
+diff --git a/configure.ac b/configure.ac
+index 4b5e12d8e34c..6503809e7688 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -315,6 +315,38 @@ AS_IF([test "x$with_jpeg" != "xno"], [
+ 			libjpeg_msg="yes"
+ 		])
+ 	])
++	dnl find type of memdest
++	AC_LANG_PUSH([C])
++
++	AC_MSG_CHECKING([type of jpeg_mem_dest size])
++	AC_COMPILE_IFELSE([
++	  #include <stdio.h>
++	  #include <unistd.h>
++	  #include <jpeglib.h>
++	  void f(j_compress_ptr cinfo, unsigned char ** outbuffer, unsigned long * outsize) {
++		  jpeg_mem_dest(cinfo, outbuffer, outsize);
++	  }
++	],[
++	   AC_MSG_RESULT([unsigned long*])
++	   AC_DEFINE([JPEG_SIZE],[unsigned long], "JPEG memdest size type")
++	],[
++	   AC_COMPILE_IFELSE([
++	  #include <stdio.h>
++	  #include <unistd.h>
++	  #include <jpeglib.h>
++	  void f(j_compress_ptr cinfo, unsigned char ** outbuffer, size_t * outsize) {
++		  jpeg_mem_dest(cinfo, outbuffer, outsize);
++	  }
++	  ],[
++	   AC_MSG_RESULT([size_t*])
++	   AC_DEFINE([JPEG_SIZE],[size_t], "JPEG memdest size type")
++	  ],[
++	   AC_MSG_RESULT([unknown, using unsigned long*])
++	   AC_DEFINE([JPEG_SIZE],[unsigned long], "JPEG memdest size type")
++	  ])
++	]
++	)
++	AC_LANG_POP([C])
+ ])
+ GP_CONFIG_MSG([JPEG mangling support],[${libjpeg_msg}])
+ 
diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
index f849014bca..6eda3ea069 100644
--- a/package/libgphoto2/libgphoto2.mk
+++ b/package/libgphoto2/libgphoto2.mk
@@ -9,6 +9,8 @@ LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.xz
 LIBGPHOTO2_SITE = https://github.com/gphoto/libgphoto2/releases/download/v$(LIBGPHOTO2_VERSION)
 LIBGPHOTO2_LICENSE = LGPL-2.1+, GPL-2.0 (adc65), GPL-2.0+ (some camlibs), \
 	LGPL-2.0 (sipix), LGPL-3.0+ (pentax), BSD-3-Clause (ax203/tinyjpeg)
+# 0002-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
+LIBGPHOTO2_AUTORECONF = YES
 # There is a single license file for the LGPL-2.1, no license files
 # for other licenses
 LIBGPHOTO2_LICENSE_FILES = COPYING

--===============6953200025464750459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6953200025464750459==--
