Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99C9CD6E79
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 18:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83966844E8;
	Mon,  8 Jun 2026 18:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfFSYvXtNUI9; Mon,  8 Jun 2026 18:22:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70ADB846B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780942960;
	bh=JBK17PV6q26o7V0tbVt2JDeKqIANEMzmr61t194GE9A=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V+hronmkD8VpUYr1p+bH0jU9q2Yf22bnFlimEpOC24agd6cfNWQhwheMAmDCpjtxZ
	 9CAvCutMkkOh4ViB9Ic8grQHb3mIdFA+M7iKAXMhMDY0+jEpPZwL0rwB436Irn/eHc
	 Gcu4cHvNhIe8/4CkwgXnqbweXtrRkDHldnHz9NPcvIonZIDtkhwITd+w4/S6UmSMhF
	 4xYYA0SGCEeICnF+/BdoKa62nIL3YfnYKEqe+RbG+sV3vnbaupg4coH1tjT8Sq9Btz
	 wHro/KWzXeKAGQT5N7azvkWakdlOqSQInNgp50Walq0GTPsZ+ZJNgt8PS8yMx7Q+P+
	 HqwZqiUehTjfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70ADB846B0;
	Mon,  8 Jun 2026 18:22:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E89A6190
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 18:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D939D42670
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 18:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZO5W8IsUQZk for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 18:22:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A75F4265E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A75F4265E
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A75F4265E
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 18:22:37 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-befd83e0521so1017632866b.1
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 11:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780942955; x=1781547755;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wnPDxtHs8hSpp56tKRMWrNfNB90XbGu0jPdL/BW8sPs=;
 b=lxDBsZDUMm7KTvNRf2Y9JRXDND3jvjYcXb9aJs8HTfwVoRfJChxxhEiHKxpw4tLSpS
 Q+tlV0ID47VJaOTk0035x62jBQXW2aIMLRl7S5vH1t8d/gdtnCz+U2vznTRB8PEn8j97
 npXV+sYvEjaLh1WGh4N53CUR7JWMastUukSJZJTGU1a6+NtFgKCuRX2mM/XD3m0CZnUr
 m2/63HaB16TCKDHR9mHHu15p/t/WaZYWWFaptvgra0Ep5wd/Vnyf2AdEcGyPGe/OEFIV
 zjd+NqUD44exs+Gn9//bT+s2sWAth2EsLhcDgMBDf9Rt3deDrvyOa7WgSVwyRjTGvKeH
 y05Q==
X-Gm-Message-State: AOJu0YyWohc5FQZelFwPQ2BbvabMhO/qfwYqWqrx9SH0FRCdIlRD07ca
 Ccy7VoZkYvoCz6Kiy0B2wWN+82B7NOXFOpu6C0INR29yYXF1wTq+ulud9nVQmvtNr3FwEuM9SZ6
 27obz
X-Gm-Gg: Acq92OF1AY4IdaKH6LJKHV1ZpREIMQ2vzLffmb6GDFtkL76lZ0Jzykjp0foeCMP98Mh
 cfxSniZtvP5b9wvgJqMBP9O3uiH5JY5/cmbvOn9d1q3jbdzBQhtg4oORmqU4q2FW5MVoYuw5bmp
 zsif3Q7Q9eQk8fW75WyAc14Wab9FSD+kkKqJZP+jtDcqjed0IUjEm6Jfugfrx3WFDIat24cxw5u
 uNqbUgrTRC3x2dcgPAD3aG8ea10s34KANUDPDtu7ufdGDJXI6TtAJFfwB+LI0DYqpn04Km+5dVx
 DEg5bcB7aKNoRvJDtNF4iVyCvUghM3Uafq50qJJyIms6f+qnzOtWlo69QbSIaSVP7RwpJFrj7Ng
 bwcOJZx8ThAJa8mIH5+ZfwxADgXpZzNBpinTtKPFmaMGifRNipXjLkp77FiWa3R9quboZun97LH
 A+hx04J+MxejRPiSHKs90JaJg+NBipot38+wv4OdR7LxCiXyGQzanMJyF9nltRuBSCDWbNPQd3q
 2eGr+uv9WKEmQ/srYs5IkWYtqYCnj3YCLF24xputf3tswT80FDkb8u7TAU=
X-Received: by 2002:a17:907:270e:b0:bee:c13f:7ebd with SMTP id
 a640c23a62f3a-bf3a8b06e67mr539774466b.16.1780942954908; 
 Mon, 08 Jun 2026 11:22:34 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf0558f3885sm907098766b.54.2026.06.08.11.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 11:22:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon,  8 Jun 2026 20:22:30 +0200
Message-ID: <20260608182230.1212023-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780942955; x=1781547755;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wnPDxtHs8hSpp56tKRMWrNfNB90XbGu0jPdL/BW8sPs=;
 b=cQQ3g+MXPynjAdbB4npu8vrFgap3FgSKJCcFSVvZqpFXspTTL5bu/dZIaLx+d7/vGv
 ThJAHQW2Htyb9PFfekNCVmsd9MJyYCwQ3gVCYKDqyf2ZsFK+fSiwQ1w+qd9JdKOmyEYZ
 gXae4BNXPwoNj3l3MAHm4171BLuSUY4jZ3gwc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=cQQ3g+MX
Subject: [Buildroot] [PATCH 1/1] package/libgphoto2: bump to version 2.5.34
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

The removed patch has been merged.

Release notes:
https://github.com/gphoto/libgphoto2/releases

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...s-for-the-size-type-of-jpeg_mem_dest.patch | 143 ------------------
 package/libgphoto2/libgphoto2.hash            |   2 +-
 package/libgphoto2/libgphoto2.mk              |   2 +-
 3 files changed, 2 insertions(+), 145 deletions(-)
 delete mode 100644 package/libgphoto2/0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch

diff --git a/package/libgphoto2/0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch b/package/libgphoto2/0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
deleted file mode 100644
index 543678181b06..000000000000
--- a/package/libgphoto2/0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
+++ /dev/null
@@ -1,143 +0,0 @@
-From ca4441f48117c681cecfb3c883115e0546aed985 Mon Sep 17 00:00:00 2001
-From: Marcus Meissner <marcus@jet.franken.de>
-Date: Sun, 29 Mar 2026 21:31:49 +0200
-Subject: [PATCH] autoconf checks for the size type of jpeg_mem_dest
-
-fixes https://github.com/gphoto/libgphoto2/pull/1176
-
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://github.com/gphoto/libgphoto2/commit/ca4441f48117c681cecfb3c883115e0546aed985
----
- camlibs/ax203/ax203.c                   |  2 +-
- camlibs/ax203/ax203_compress_jpeg.c     |  2 +-
- camlibs/ax203/jpeg_memsrcdest.h         |  2 ++
- camlibs/jl2005c/jl2005bcd_decompress.c  |  2 +-
- camlibs/jl2005c/jpeg_memsrcdest.h       |  2 ++
- camlibs/ptp2/chdk.c                     |  2 +-
- libgphoto2_port/gphoto-m4/gp-libjpeg.m4 | 32 +++++++++++++++++++++++++
- 7 files changed, 40 insertions(+), 4 deletions(-)
-
-diff --git a/camlibs/ax203/ax203.c b/camlibs/ax203/ax203.c
-index 62f572686c44..b9db8ebdabf1 100644
---- a/camlibs/ax203/ax203.c
-+++ b/camlibs/ax203/ax203.c
-@@ -1202,7 +1202,7 @@ ax203_encode_image(Camera *camera, int **src, char *dest, unsigned int dest_size
- 	struct jpeg_compress_struct cinfo;
- 	struct jpeg_error_mgr jcerr;
- 	JOCTET *jpeg_dest = NULL;
--	unsigned long jpeg_size = 0;
-+	JPEG_SIZE jpeg_size = 0;
- 	JSAMPLE row[camera->pl->width * 3];
- 	JSAMPROW row_pointer[1] = { row };
- #endif
-diff --git a/camlibs/ax203/ax203_compress_jpeg.c b/camlibs/ax203/ax203_compress_jpeg.c
-index 1ec7534ff484..22068afd79c0 100644
---- a/camlibs/ax203/ax203_compress_jpeg.c
-+++ b/camlibs/ax203/ax203_compress_jpeg.c
-@@ -124,7 +124,7 @@ ax206_compress_jpeg(Camera *camera, int **in, uint8_t *outbuf, int out_size,
- 	jvirt_barray_ptr *in_coefficients;
- 	unsigned int i, x, y;
- 	int stop, size, ret, outc;
--	unsigned long regular_jpeg_size = 0, buf_size = 0;
-+	JPEG_SIZE regular_jpeg_size = 0, buf_size = 0;
- 	int last_dc_val[3] = { 0, 0, 0 };
- 
- 	/* We have a rgb24bit image in the desired dimensions, first we
-diff --git a/camlibs/ax203/jpeg_memsrcdest.h b/camlibs/ax203/jpeg_memsrcdest.h
-index 674ab7128f8e..22ba2ac1e2c7 100644
---- a/camlibs/ax203/jpeg_memsrcdest.h
-+++ b/camlibs/ax203/jpeg_memsrcdest.h
-@@ -5,6 +5,8 @@
- 
- #if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
- 
-+#define JPEG_SIZE unsigned long
-+
- void
- jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
- 	unsigned long bufsize);
-diff --git a/camlibs/jl2005c/jl2005bcd_decompress.c b/camlibs/jl2005c/jl2005bcd_decompress.c
-index dff2d6264025..8c3307fd6098 100644
---- a/camlibs/jl2005c/jl2005bcd_decompress.c
-+++ b/camlibs/jl2005c/jl2005bcd_decompress.c
-@@ -85,7 +85,7 @@ jl2005bcd_decompress (unsigned char *output, unsigned char *input,
- 	struct jpeg_error_mgr jcerr, jderr;
- 	JOCTET *jpeg_header = NULL;
- 	int outputsize = 0;
--	unsigned long jpeg_header_size = 0;
-+	JPEG_SIZE jpeg_header_size = 0;
- 	int i, x, y, x1, y1, jpeg_data_size, jpeg_data_idx, eoi, size, ret;
- 	JSAMPLE green[8 * 16];
- 	JSAMPLE red[8 * 8];
-diff --git a/camlibs/jl2005c/jpeg_memsrcdest.h b/camlibs/jl2005c/jpeg_memsrcdest.h
-index 4334e099688a..94fca070d05b 100644
---- a/camlibs/jl2005c/jpeg_memsrcdest.h
-+++ b/camlibs/jl2005c/jpeg_memsrcdest.h
-@@ -5,6 +5,8 @@
- 
- #if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
- 
-+#define JPEG_SIZE unsigned long
-+
- void
- jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
- 	unsigned long bufsize);
-diff --git a/camlibs/ptp2/chdk.c b/camlibs/ptp2/chdk.c
-index 2787a7261c4a..2646c3ba0fb1 100644
---- a/camlibs/ptp2/chdk.c
-+++ b/camlibs/ptp2/chdk.c
-@@ -1145,7 +1145,7 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
- 	struct		jpeg_error_mgr jerr;
- 	JSAMPROW	row_ptr[1];
- 	uint8_t		*outbuf = NULL, *tmprowbuf = NULL;
--	unsigned long	outlen = 0;
-+	JPEG_SIZE	outlen = 0;
- 	unsigned int	row_inc;
- 	int		sshift, dshift, xshift, skip;
- 
-diff --git a/libgphoto2_port/gphoto-m4/gp-libjpeg.m4 b/libgphoto2_port/gphoto-m4/gp-libjpeg.m4
-index ce9e816fdbce..4870882a686d 100644
---- a/libgphoto2_port/gphoto-m4/gp-libjpeg.m4
-+++ b/libgphoto2_port/gphoto-m4/gp-libjpeg.m4
-@@ -77,6 +77,38 @@ found and made to work.
-     GP_CONFIG_MSG([JPEG mangling support],
-                   [${have_libjpeg}])
-   ])
-+  dnl find type of memdest
-+  AC_LANG_PUSH([C])
-+
-+  AC_MSG_CHECKING([type of jpeg_mem_dest size])
-+  AC_COMPILE_IFELSE([
-+    #include <stdio.h>
-+    #include <unistd.h>
-+    #include <jpeglib.h>
-+    void f(j_compress_ptr cinfo, unsigned char ** outbuffer, unsigned long * outsize) {
-+	    jpeg_mem_dest(cinfo, outbuffer, outsize);
-+    }
-+  ],[
-+     AC_MSG_RESULT([unsigned long*])
-+     AC_DEFINE([JPEG_SIZE],[unsigned long], "JPEG memdest size type")
-+  ],[
-+     AC_COMPILE_IFELSE([
-+    #include <stdio.h>
-+    #include <unistd.h>
-+    #include <jpeglib.h>
-+    void f(j_compress_ptr cinfo, unsigned char ** outbuffer, size_t * outsize) {
-+	    jpeg_mem_dest(cinfo, outbuffer, outsize);
-+    }
-+    ],[
-+     AC_MSG_RESULT([size_t*])
-+     AC_DEFINE([JPEG_SIZE],[size_t], "JPEG memdest size type")
-+    ],[
-+     AC_MSG_RESULT([unknown, using unsigned long*])
-+     AC_DEFINE([JPEG_SIZE],[unsigned long], "JPEG memdest size type")
-+    ])
-+  ]
-+  )
-+  AC_LANG_POP([C])
- ],
- [AC_MSG_ERROR([
- Unhandled value given to --with-jpeg: ${with_jpeg}
--- 
-2.43.0
-
diff --git a/package/libgphoto2/libgphoto2.hash b/package/libgphoto2/libgphoto2.hash
index c2ff672613a2..6a5010da4fba 100644
--- a/package/libgphoto2/libgphoto2.hash
+++ b/package/libgphoto2/libgphoto2.hash
@@ -1,3 +1,3 @@
 # Locally calculated hash
-sha256  28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2  libgphoto2-2.5.33.tar.xz
+sha256  51993f5d9bfb6b4e5925cbbe5883085791bff6f81bcacb8ffe1b783ce76d586a  libgphoto2-2.5.34.tar.xz
 sha256  530128f45fc02d92d4dae04d9c1e1f28a078a9b0d32c0ab254c406ba8fba43ec  COPYING
diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
index 4265d1c57e10..a639245c25f7 100644
--- a/package/libgphoto2/libgphoto2.mk
+++ b/package/libgphoto2/libgphoto2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPHOTO2_VERSION = 2.5.33
+LIBGPHOTO2_VERSION = 2.5.34
 LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.xz
 LIBGPHOTO2_SITE = https://github.com/gphoto/libgphoto2/releases/download/v$(LIBGPHOTO2_VERSION)
 LIBGPHOTO2_LICENSE = LGPL-2.1+, GPL-2.0 (adc65), GPL-2.0+ (some camlibs), \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
