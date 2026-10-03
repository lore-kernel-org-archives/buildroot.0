Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E3ACA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C7106067F;
	Sat,  3 Oct 2026 16:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQbMXJ4CYWJR; Sat,  3 Oct 2026 16:45:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 63B206069F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791045926;
	b=FUWIyStoH7KleYz38BOFbpzSYCok7IMoFewzgy9qjmizWHYyCPnRJ2eux5wUkFajV2Qn
	 gDBhAu71P7aU310tSLO2pbws+RA6IzJXRiorP3oI+ZN8geF4RWSmA7kzKywwqTYXwZy65
	 XkLYzs7qdXftGxM9bMysCebMxq8gMjl9NGZhu2+t3wie5LpUELUyXZffggALCethPuwC+
	 PmuC588sPh1BV5/eiSF13FDE5iQwowwL171KNEcEvESS8pqE2+H1Wuty0E454dodVPbhj
	 raxjd8slBkyZsOjMjvoZQrp/vjqF4MUqBOoyoTySc4UDgJXPsNd6+Rex4+YROzgrY5Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791045926;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ghrgrq/r9LOMcPQU81fG8dsBg++4RtB1k0HRHIVf5Ug=;
	b=MB2hwB/Z5wI0TVdAxLwYOWIJCwlMMK6sBZRikZYFVO5nDcCca0yXRCgaWXLpD5GjfLU+
	 Vj37MRTL+qV9dgI0+sC1VNP5+5xZ1/WA01mcY7PNN/pTb9USoxzsiK2GR33xbiaegfewA
	 SUNEAoEYGQmFmimQGtJ9Ly/tPhRmtM2jma2pH5ge9kJEIGRmo6s25qQaJVhrwAONKrHp0
	 q0RNOiywkluKJLHPKkjuhWM35fVyvKAkc/OhAl337ob4CAPYkfl9Y/G88P4u7JLZch5Yk
	 87zzoORl5EzDuxrYTZf9/gMg/t7gerq0fh1mlr0UMRSfOkKcddhb5qd3VyWaP91Q1PQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=qwSZdH9Y;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791045926;
	bh=ghrgrq/r9LOMcPQU81fG8dsBg++4RtB1k0HRHIVf5Ug=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iVqJTPn+yMLEOgHOsFzbxpOEayJEgH/RnqlXJoG3BiqVgZSjGnyzFjc+ogrj0mn0s
	 Dr6plLswR3mBSimemDxPwynp8TTklcdUkj7d2anVF+20uQzKm1C+w4InDQn69QwGRK
	 cXteykaYB7FMLOCDnZyTA2kQ93dAyVClel86szVfZl0GDgJ7IAM2/3dwX0uq8/NteG
	 o8H91yVL21+xVt6PIh6qvmRCNin9/Yoh3s/C9Goku67HB1ZHL83IeFG5dPhv6hay0G
	 vfP3iJRtFjrAtMkoOd9FcOofoUWDK0oKTglJy36lVoHRiUKq6nLQlxPt1mvx9YLpn1
	 hPWu+FfUAR0SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63B206069F;
	Sat,  3 Oct 2026 16:45:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C7241D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 621AD6069F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W2XyEe6R-B5y for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:45:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CF79560639
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791045923;
 b=n8z+9QgK7BlojCyirp7OrbOHPOn0q8DH1rk0w3l2/TBWOLcLzWak9rd1V8lzgm4xbjLz
 94suX32ZnLaOaMcLowXDVYA9CSzMwR379n23wYSEduIphLqWnMh45JoYxXLxeA4W5ww2f
 cN6SGzcLBfwYVjhCOnugMag3H697bi44dOSm9BeUhc95PnAkQIYjUpQ2FeKxPCzqxivu+
 ModjLw1xvHEAPwn5SViuujTUAFVLwDODOXxovctpL6deE/oL0tuU7+0wJM0iu+7c9N00K
 YRDnOYF2oB9p1dDelTDK8lLcZePABW25GT/UojUuErG14L6mRqHCTL3/bffgFIiA3dg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791045923;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=RY+ffeL+bMOrRA5Ci3vQ/zBaeu3QXXG05l5D/X6EMbo=;
 b=CIeqLM5/TTM5/S3XbNbnWz8nD7owJ2+nqvByvoBNqoD2pB4HsZZUYjEsphZ4rpsYJAbQ
 f4C0ehgrR8b83UgJ2A9rLv0dx/W82x/idHbx1iLkp5UjXyXtPI+1h/euUBwGGodrlEd4S
 M5Dc8KDLrFOW+ZAZHfTA9MVxwoY4PDy9OTmvGRQLDFhJmw6pPU1TR0Egp79/gWmcPVkCQ
 3nAA2EySVnOS922CjxoSpLwVXvVVS2tHUwnn1YnAwOBAuUItYVXShohlxNwYJlKUVxw/5
 amNHiwPbN5664OgxG76IpLwIgmTOoEBs1tHAGoCKtqkn3GBKQdRTbKrKc+wY8qLVqgQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=qwSZdH9Y; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::e"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::e;
 helo=mail-wr2-x0e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qwSZdH9Y
Received: from mail-wr2-x0e.google.com (mail-wr2-x0e.google.com
 [IPv6:2a00:1450:4864:30::e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF79560639
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:45:22 +0000 (UTC)
Received: by mail-wr2-x0e.google.com with SMTP id
 ffacd0b85a97d-48aef5d66c1so191524f8f.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 09:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1791045920; x=1791650720;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=RY+ffeL+bMOrRA5Ci3vQ/zBaeu3QXXG05l5D/X6EMbo=;
 b=qwSZdH9YFc/aj4soBMpFvT6vy4qAghXgVHFbOovwnwqS2kO6xe1Sni76lCDxu/q/Sn
 RKTCx+AYecCCfsz1jivilaxTC6v3RbHKokPB8kpOkDQRG7JB8TbtykVUlbDkUEXvyG42
 hnT0CQ+UAJdyutqeMwIrskj9Bk3/3iyyisy+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791045920; x=1791650720;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RY+ffeL+bMOrRA5Ci3vQ/zBaeu3QXXG05l5D/X6EMbo=;
 b=lqe4r8ZR3tqAeaDFfI8s9gHk2s1hxVBM7ikAIScI8QvTKQ+05raCKgYr48h1nKrJ8A
 Q0X+mdW3YfruLS16O47Mngrs+hCO+At8ClPyDzVmtX0NCm46h/J6d/jg6p61hdOijkZ4
 YMBGN2hzxHepgeAd/pG1huVq6J7d2ri933aj3UtEZLPsFyRV5It7KDK7oxbHNEKjahxR
 tUtv453aheAYmgmBu5zl1lQpD8oIMcsgwst9pApDEILXEI8OA4lqrLngtM+fmB8ahxlG
 BEbrsKzO+MR8u3sHd8LSAY9hXizThRnubpGRWAP1JSaj+akm9EO0hPk1vLu13m1jAfku
 hMKw==
X-Gm-Message-State: AFuF++mR0hxWdR5PdIm2w8xlR9i+SyykEuMVLQhOF3TZOWE30w0ayaPL
 48om28vZjTcBIa9NkBkIHsUaPvOq1U1Uia2dYfaFDa+EAYoPtUXyU8qVPLKfznj2Sz/UOhCP3MT
 HZ1fW
X-Gm-Gg: AYBFou16tyfCO2uOYt44MHTuW/MCowKgaqIlvNcsMjMnUjBqdIZ00eRJQWNuRVGmu5e
 irHSYsD2FXSdqnGVBEZsMgjouHMcVar97oTG8OI8DAQZ0N3szj9FfgeSCftDuCivVWzmPyxV4Cc
 nyonj2qNV9Gl0Np6XenidLu7kCRn/hrfj/7mEqd4d3cb8NMe9YRCm6bAcNss4qSUxDl2O8YCh5/
 anIvyjD61zZKwtTKHU8hfSCk96Pp1tFCEnHDhdkOOD1AUMViTtUbQ6Wgvg2DF9mMAolkyufzLMN
 b3aSY/8FxKEvABcj+JZrQvlHmFamWC7Y53Ni1EFfYMYNUQflvGQV84BBAm+wDMOT3IyI8yDaz95
 8Wb7YqR3qZFVIbFEHzhX39kIZtuEjpIDzk5+N/sBMJxYrrjLSv9ASW3gjkNFib9Jwl073wG7Kim
 pM4jeoQExAcuHbBC9nkxNpJUKq1qaptimjKoblrx8Qnide3MZW9Syr6IdNH+vdkyDg8Z1NnCBfz
 QjjDtsxLfGHYbCc2FMHD0TpqbsMHOqOM+PQLXvxW/+7L8x7+UHAKlfiOBe1IZenjJjABVtA2iv2
 Wk7k/n1ny14h/p8kcjVqwNGjo0MQ74mGdezAUmLBBGl9h1X20YNctTJZQNym2PfmI248xC4=
X-Received: by 2002:a05:600c:6215:b0:49d:1fd8:b874 with SMTP id
 5b1f17b1804b1-4a027564c86mr103389415e9.19.1791045920374; 
 Sat, 03 Oct 2026 09:45:20 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a03feed16bsm149802705e9.4.2026.10.03.09.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 09:45:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Romain Naour <romain.naour@smile.fr>
Date: Sat,  3 Oct 2026 18:45:13 +0200
Message-ID: <20261003164513.488800-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.11.x] package/libgphoto2: fix build with
 gcc >= 14
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
Tested-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit d2ad5b883342b92c354c8a110ffbaf1ca7dda20f)
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
