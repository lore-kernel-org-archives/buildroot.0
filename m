Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10DDE9D834
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 13:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 780974094C;
	Mon,  6 Apr 2026 13:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGMjlf7D_vvX; Mon,  6 Apr 2026 13:41:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D775408D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775482876;
	bh=P/vRlSmhK+hioekbBnI4KbY7Aw3m4fKeo3EjUcZGy+Y=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V2isYMnS27pBlYrGTYMmhmdzTZiJtlStO1hmWzEdIcLI+gIOdXx1jJBobzQofxqmh
	 tokAf9cfHz2oSSifIut+lFwDlcze3BcSEh7btznpi+XdkiO8ZGa4rodALjqnblXo8j
	 ArNrQGWf9x5h0Bm8z7ru3SZYOEWmyBDCCKHDGJ6JqQIHJ2yMufGpEp9gFXuu18m8et
	 0bnJolK+5ZEze/3Vahh7lpbxQ5H6d3QVuo/uaKxeu+iFRWdLtKiF0CQJVszn5w4cfV
	 6rghpgzJV/B/R5EvjcCGDRUIlItJpC5HwLeS1WdzHX+Rc8XYW4iTLdmNbqKpoDDQGF
	 wBJ5MowDE9jzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D775408D5;
	Mon,  6 Apr 2026 13:41:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 57D37219
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 13:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4950760721
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 13:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8oIew2SdkIwQ for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 13:41:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F2A0260679
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2A0260679
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2A0260679
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 13:41:13 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4888375f735so35435435e9.3
 for <buildroot@buildroot.org>; Mon, 06 Apr 2026 06:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775482872; x=1776087672;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cp1t8oM6TUHMTqy1Jerb2+ittTXrUcgT4OyBZ9si1oE=;
 b=ZRh7DQYO8edWdAWG26iduib6FB4kITHlnraAEhf207/gEmTUsKFiWxALgVTE9YvadW
 vStkep7AWegqwtD0s6EA2wKNyfnAR2Rewnd+oZaoF0cXnIAD1mAT/tlPQz9zmH5EFwH2
 Eo4ugHCtbIs7uBX7gAg5Pq/IaiDpk5VnP7QCeCyfksjLhw8KDsl7MmSU8nwaHLbozTUp
 wZ/T67//2Cr61blE5hfEMFQsa8dNZLSUeE6ECy6fQCkzHmUPBOe9mzYMlpz1xj7mLtkh
 +T12TrLV6RLWDvUiGIyak3afZFV6J5xIymWq0IIKb+HPoFYUFvrdjGtdGjrw3ZU0RDxY
 jvGA==
X-Gm-Message-State: AOJu0YxwrxiEDysnj3uHL4J5Fc2NGlpbKY59IKOLCZ4lqNq/6VOCXY4A
 D0BNE1wIULjQvtN8ukOZpVolgNvjnnm2bf+X6W8T5yBlGldl6XtnPQ/j7vcfGt/3urBnbcbTSd1
 9T7G7
X-Gm-Gg: AeBDieuCqN6MohBH4E21KC3jUtUAUR8llxbx6+swX25P8rEnIGmp1lZtiA6HuN9Qcne
 1CofeExcJBg344Aj8aKY3DlbotyD4k5UkimARhVCHSsppmsFfhtC1sNKw/llWLUts1camp41GZW
 jh9OypyN1eE3sxALIWU0fRqLoIGMSr/cppbRCIyWxpLREiEcr3C3px1L5fmXHYviROU19g7dVHK
 gONM7DCu3vkOHnH7mUAmKnr/NwDSDgnNHSDs3KttWfcVDE1yKejH9WEBTnZa/oWJZkZiupqbX/m
 zjcgoaZd6YBtBu6MTagbzlWXwjtdGybdjQ/hV1fvpZT4UZqHRVgnuNF6b3vBNPw+8X41DwKhiIk
 qxFfhM8+bOh5aeZC7HxToKwU60IwrgVnXcsShV79086HVBNGKi9rW6AyvrJ+pBOIXFA+nzJ8jTF
 wt29OQNnoQfg0Z+s95Zq/BQzyLDk288Uat7s60qctCjHJEVHGSHmZYAUuotNM2cVtN5cZuOx92h
 EnE5JYxiedjthJA4oVP42NeaRgUgrTg5PxymFQ3NDg6ezGk7VbOOrI5wFeeEM5gJBeypkm9tiso
 hU5fysGC0/9YNXIjQU/AL7wK67wLXE78W/s=
X-Received: by 2002:a05:600c:1396:b0:486:fb0b:ad79 with SMTP id
 5b1f17b1804b1-488997d10ffmr187763225e9.20.1775482870950; 
 Mon, 06 Apr 2026 06:41:10 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-9-100-184.retail.telecomitalia.it. [87.9.100.184])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488a8ddfde7sm283967485e9.5.2026.04.06.06.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 06:41:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon,  6 Apr 2026 15:41:06 +0200
Message-ID: <20260406134106.4145818-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1775482872; x=1776087672;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cp1t8oM6TUHMTqy1Jerb2+ittTXrUcgT4OyBZ9si1oE=;
 b=i89W2gIc/hXlqeKJhzlpNIl3l2tMkbmV+GnIwvIhTdMx9E1U2bHgeMC5GPB8mRCm63
 ux4NXLBXtVzq620yduGKNJmizMiZOtm+LjtkM/m70QKJEuIzChGKLnAMkGkwd7rfHvcP
 ynuRJXvtu50FktxSkUghfUeTI+eLHq0rhivtI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=i89W2gIc
Subject: [Buildroot] [PATCH 1/1] package/libgphoto2: fix build with gcc >= 14
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

The commit adds an upstream patch to fix the following build failure:

jl2005c/jl2005bcd_decompress.c: In function 'jl2005bcd_decompress':
jl2005c/jl2005bcd_decompress.c:161:46: error: passing argument 3 of 'jpeg_mem_dest' from incompatible pointer type [-Wincompatible-pointer-types]
  161 |         jpeg_mem_dest (&cinfo, &jpeg_header, &jpeg_header_size);
      |                                              ^~~~~~~~~~~~~~~~~
      |                                              |
      |                                              long unsigned int *

Fixes:
- https://autobuild.buildroot.org/results/cb983d9ad90170aa8d7f2b9a5dfc30055d83b5de

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...s-for-the-size-type-of-jpeg_mem_dest.patch | 143 ++++++++++++++++++
 package/libgphoto2/libgphoto2.mk              |   2 +
 2 files changed, 145 insertions(+)
 create mode 100644 package/libgphoto2/0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch

diff --git a/package/libgphoto2/0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch b/package/libgphoto2/0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
new file mode 100644
index 000000000000..543678181b06
--- /dev/null
+++ b/package/libgphoto2/0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
@@ -0,0 +1,143 @@
+From ca4441f48117c681cecfb3c883115e0546aed985 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Sun, 29 Mar 2026 21:31:49 +0200
+Subject: [PATCH] autoconf checks for the size type of jpeg_mem_dest
+
+fixes https://github.com/gphoto/libgphoto2/pull/1176
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/gphoto/libgphoto2/commit/ca4441f48117c681cecfb3c883115e0546aed985
+---
+ camlibs/ax203/ax203.c                   |  2 +-
+ camlibs/ax203/ax203_compress_jpeg.c     |  2 +-
+ camlibs/ax203/jpeg_memsrcdest.h         |  2 ++
+ camlibs/jl2005c/jl2005bcd_decompress.c  |  2 +-
+ camlibs/jl2005c/jpeg_memsrcdest.h       |  2 ++
+ camlibs/ptp2/chdk.c                     |  2 +-
+ libgphoto2_port/gphoto-m4/gp-libjpeg.m4 | 32 +++++++++++++++++++++++++
+ 7 files changed, 40 insertions(+), 4 deletions(-)
+
+diff --git a/camlibs/ax203/ax203.c b/camlibs/ax203/ax203.c
+index 62f572686c44..b9db8ebdabf1 100644
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
+index 674ab7128f8e..22ba2ac1e2c7 100644
+--- a/camlibs/ax203/jpeg_memsrcdest.h
++++ b/camlibs/ax203/jpeg_memsrcdest.h
+@@ -5,6 +5,8 @@
+ 
+ #if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
+ 
++#define JPEG_SIZE unsigned long
++
+ void
+ jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
+ 	unsigned long bufsize);
+diff --git a/camlibs/jl2005c/jl2005bcd_decompress.c b/camlibs/jl2005c/jl2005bcd_decompress.c
+index dff2d6264025..8c3307fd6098 100644
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
+index 4334e099688a..94fca070d05b 100644
+--- a/camlibs/jl2005c/jpeg_memsrcdest.h
++++ b/camlibs/jl2005c/jpeg_memsrcdest.h
+@@ -5,6 +5,8 @@
+ 
+ #if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
+ 
++#define JPEG_SIZE unsigned long
++
+ void
+ jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
+ 	unsigned long bufsize);
+diff --git a/camlibs/ptp2/chdk.c b/camlibs/ptp2/chdk.c
+index 2787a7261c4a..2646c3ba0fb1 100644
+--- a/camlibs/ptp2/chdk.c
++++ b/camlibs/ptp2/chdk.c
+@@ -1145,7 +1145,7 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
+ 	struct		jpeg_error_mgr jerr;
+ 	JSAMPROW	row_ptr[1];
+ 	uint8_t		*outbuf = NULL, *tmprowbuf = NULL;
+-	unsigned long	outlen = 0;
++	JPEG_SIZE	outlen = 0;
+ 	unsigned int	row_inc;
+ 	int		sshift, dshift, xshift, skip;
+ 
+diff --git a/libgphoto2_port/gphoto-m4/gp-libjpeg.m4 b/libgphoto2_port/gphoto-m4/gp-libjpeg.m4
+index ce9e816fdbce..4870882a686d 100644
+--- a/libgphoto2_port/gphoto-m4/gp-libjpeg.m4
++++ b/libgphoto2_port/gphoto-m4/gp-libjpeg.m4
+@@ -77,6 +77,38 @@ found and made to work.
+     GP_CONFIG_MSG([JPEG mangling support],
+                   [${have_libjpeg}])
+   ])
++  dnl find type of memdest
++  AC_LANG_PUSH([C])
++
++  AC_MSG_CHECKING([type of jpeg_mem_dest size])
++  AC_COMPILE_IFELSE([
++    #include <stdio.h>
++    #include <unistd.h>
++    #include <jpeglib.h>
++    void f(j_compress_ptr cinfo, unsigned char ** outbuffer, unsigned long * outsize) {
++	    jpeg_mem_dest(cinfo, outbuffer, outsize);
++    }
++  ],[
++     AC_MSG_RESULT([unsigned long*])
++     AC_DEFINE([JPEG_SIZE],[unsigned long], "JPEG memdest size type")
++  ],[
++     AC_COMPILE_IFELSE([
++    #include <stdio.h>
++    #include <unistd.h>
++    #include <jpeglib.h>
++    void f(j_compress_ptr cinfo, unsigned char ** outbuffer, size_t * outsize) {
++	    jpeg_mem_dest(cinfo, outbuffer, outsize);
++    }
++    ],[
++     AC_MSG_RESULT([size_t*])
++     AC_DEFINE([JPEG_SIZE],[size_t], "JPEG memdest size type")
++    ],[
++     AC_MSG_RESULT([unknown, using unsigned long*])
++     AC_DEFINE([JPEG_SIZE],[unsigned long], "JPEG memdest size type")
++    ])
++  ]
++  )
++  AC_LANG_POP([C])
+ ],
+ [AC_MSG_ERROR([
+ Unhandled value given to --with-jpeg: ${with_jpeg}
+-- 
+2.43.0
+
diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
index 95c0190ee63d..4265d1c57e10 100644
--- a/package/libgphoto2/libgphoto2.mk
+++ b/package/libgphoto2/libgphoto2.mk
@@ -9,6 +9,8 @@ LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.xz
 LIBGPHOTO2_SITE = https://github.com/gphoto/libgphoto2/releases/download/v$(LIBGPHOTO2_VERSION)
 LIBGPHOTO2_LICENSE = LGPL-2.1+, GPL-2.0 (adc65), GPL-2.0+ (some camlibs), \
 	LGPL-2.0 (sipix), LGPL-3.0+ (pentax), BSD-3-Clause (ax203/tinyjpeg)
+# 0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
+LIBGPHOTO2_AUTORECONF = YES
 # There is a single license file for the LGPL-2.1, no license files
 # for other licenses
 LIBGPHOTO2_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
