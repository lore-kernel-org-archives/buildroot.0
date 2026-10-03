Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC91DCA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7401A6069C;
	Sat,  3 Oct 2026 16:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZsmipZhwRnzZ; Sat,  3 Oct 2026 16:46:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4C6A96069F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791046019;
	b=AxvDUPMK/nYnoxnGfAcshYXMq562VYxcuVWyqlJWfRI6+u7K6vnGxBNQvuNaIjgfjCDV
	 NhvI+TCGIPkDRIx4Ep9l89xBJ4Tw5ZosgYFOCfTVhCcsETkJkp1Yafg1uotAl41sEEk4e
	 5JIBj7fDUdKeDpDG8oxhyPgzhbE/uOLIyXKurXT+xm0I4f8Sole9mUgpEGPBde8+YRwYP
	 kVPy0osaXHotNV6ngdDS+jCGx+iFgyIC2o4sczlkd2MQqlpuhuSrBMATJCDlH2aHm30ia
	 2lMLM3im33rxXUnLIuPUWNSYroL4SbFt0fiSsQT7qfVWjf9uhn2bCLBmx6xa3x1hoTQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791046019;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pycq9+3SRhW3CFlFy53clk9D/6TUBWJBnndrufkrNOc=;
	b=WFG9y2NlwlVJXQ4zKKTwk5dgQ2NTWupUU//Pr+3p8Y9lzqZyCbibYkspv9zv+oqEhsWf
	 Cq0pmsPPJmm6pKWSMhuXRMZjcCmsiovBlbfRlW3aufLGvCKUKhRm44lhW/Cu28BfWUR6v
	 fjSSAtVsPkIceIB9lm4j9nY74pMpd0T4oQArqPkqbuS5urrv2Wn1sGArjamdUej2z+MhD
	 xUKHNSAtMCKMXw6gnG5hMMe6Ped132b8nVHBLXnHqtXACOMPWhw8+mJQ8t1zLsgDStOqU
	 udzeIIqB+A0cWZUk+2pzioiamrWGpd60RF/9rZDKodg0F/GVp/D6HD/7N1R+vsiBVww==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791046019;
	bh=pycq9+3SRhW3CFlFy53clk9D/6TUBWJBnndrufkrNOc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s8OVHF3zmcu7dSbLL2aLGPsRIxQF6smRHtF1+ubUrlG8JV3JWBbykgb0ky2o7aIRn
	 INpo2mM03I1iE15e4sXgvQZ+4iETkH6bwCtHH0NeKmJ423KVhZtfgANUG1QGrio+pc
	 uxIIB/VDmUsbNrUv9BYnfx4QuyC6e/FaV6h9Ot3blm9I/g8gryFtykSMoPjA9I5O/s
	 DiEjt0Fb3DQTAHaDW7E4YYZXNiVFjeecHeTAMRz1rbRbWDx5LS0+FIL1LD1MI5CtME
	 uib+StAS/9KrnqPrgD7a69wa1/lQSEzZYuuSJRwN7nFF6GAXGF3ref5GWXBvDIF7Rt
	 Z0AouvlLSIOOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C6A96069F;
	Sat,  3 Oct 2026 16:46:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5899C1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A32140E62
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfUm8X3YYwPr for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:46:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D99C040E60
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791046017;
 b=ZdDlMgEX3LkiN/IV+Q8XwUfTKShTWRVDOK5BzrdJA3BdFlJcJ9UCKdKYnmBynK3KynCU
 HGgAJYhsXyNxW+zsWWYoWrbloRMFkMBFwOCg0G7Y29LJC6a9qhTwwv6RW0kbkEBzEjvZ0
 ErzZWMY3RI8+VAddAt0CzSGJdFdEhklFFQA/6lb0O9gng1BW+D+/ztM7wwq0ee4e/tIxi
 xj2khbPKLEwAyNy+tY2ZYkIiFDxEqV9Jp72ssWHpp3YEypXsMPcmSGOqm3jGFnGPXJ2UO
 BkG6vnEb1Xl/vpTsvFI/hjVSsrOuJkNebW4qWvsAb0GwrTsTZunTLLs2BIesKvceBPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791046017;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=2o1vaZBrgMXl+avhGM7z0y6ps9xitj0yWvz4sh4zOqk=;
 b=StddrroapMhx9B28slHHQuQR3+dqelFQ8uKq3DQdFVogmGAAhXXsWmuUztMPCgI6QHMD
 awx0T3UCC/nFYKlHuxZpXLcEtEy+6f/wA0dGRPskQbIvUAzraOxH8rIOpSWuYMQaPgUvf
 2ExJjZWruq3UO7duExwcmZiCI+9xTQ+8iFYrqLM+R3j9lJIS4Oh1IeMuEbE+8RqurF3Am
 jwFNGqMRVhEDAWSz35rOXrGo0kzTdYMF1cDWm0Gtv3k2lXq6hIhlbob3V8/1imm1lx03r
 tbBN43KqAXeqkb2/mALVoUoT8s/6Lmj9BntEG7hTyhFlO2zNd6+/lZnCkLB/rxBeH/Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b="iKHlLx/i"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=iKHlLx/i
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D99C040E60
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:46:56 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-49ff680331aso6706585e9.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 09:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1791046014; x=1791650814;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2o1vaZBrgMXl+avhGM7z0y6ps9xitj0yWvz4sh4zOqk=;
 b=iKHlLx/ir9W9WduPr6fN/JOL3wstkHQcnFS9z547Y2x0PG74YVgJfPYijuiVklvAxt
 zPL/mIZvpkZmbF3e3qACEZTa8kOw71wBKHJwzTs6oIoTURy2Owwjja3iCM4q3+Qnv6wZ
 Luw+uiK5F/LIGIpoBN86BWr3sDY549+cBo7jM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791046014; x=1791650814;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2o1vaZBrgMXl+avhGM7z0y6ps9xitj0yWvz4sh4zOqk=;
 b=iR7uhorxzb6YYdAySmSE0ACgdP1cEpbfX0Zu/pyn5U9ZzM7UTa+u5gBWotDalnhmsZ
 si6z78iqghgozDcm5DJNeJjx2fNGAz7ZurWqdSNEKkwpOolp20q/HSQNk/x/tCCkH7pB
 Pnnbf6xNpN2Mk4E+1n9I7V2whlaqb0ZuiHrqkM2LeoVVmpsjaq80tpZ33kDthik1WG33
 9u7BUWxMC5Qe5IUdDiV3F7/QOuk869vxqVwEXhHMMfnGuq2OpQqTcfvRkGeLh6717vYy
 NxjSMpEepDZvpL2QLiNg6/vhu+fYi1Lb0vqsMr11281oxQeichqRMCsXmDvnILOKSKMt
 n3vg==
X-Gm-Message-State: AFuF++nZYOl7Eo6IUzEx23+h421Q/YVFpBtjMqPeu8Bk2uhDzVGEy2QB
 KtMuGo0H8RPEh5ELsSFXVTLMNKsfYJWJxfE1cipt2F2Mpi2pZT4esmDg55KYdv2mJQEqE8ywYnb
 A2ZwC
X-Gm-Gg: AYBFou105uBLY/hWzoHl8aGn3ZhYTV1429DILDUtbIcbVnuAQd9EokmDzxQlw/XkP0Q
 7VGSJ2nUhoDpN3JbLkemFUKZYGSgw31v0kR6FeYd5n7fJTdW8tibQYgchYi5hrd61/8mZ2xP2+o
 /ZocA4PmnVtiMflqCEg/brG82hwvm2ijWsF08lXdKs67kLXhZ/a7fdKLVEYmP7UmYIwehsXGhst
 YCm4N0Nd45cQGsr2/9l8VL6RqFOgYfSjVEstrK7WRR41NKa0Kw9WT2m4/6jwvclZK+u/MYIZbpG
 EjH/2Am/HE6uBVKQnnJFKhuVHeOFpZ96zgMo+6P/JjURULQ1I3NutnijnpovwGJ6pLQ3O9Yxsmk
 GtrTgrmVwzvV6mQj8jmhvecxN7qjVF86roMHjgr1HFcXQGd/UZNRQCUWZji1faKiO41YrRrvwj/
 kMmZqlz7OaBrukhcY1rw+CMcl/1yR7F/jeZNrTC+J+q3p0tfpOrH7Ze8yf0rPQBw6H8GYRgkleq
 6xSLkPGdS1aUDzSJz4rJpRWU7neUQkRrUAXgiM1wNs1ePZpigcmuVwbypUVF/fbJzZlVwZdwBVz
 kfrmPf5VgUCxIx5Y9P+3Rk2WS4way2r4MkuItOuzj/WwaIVpKZDCc9l8RpWBhIO1CnQVHIU=
X-Received: by 2002:a05:600c:4453:b0:4a0:2423:946 with SMTP id
 5b1f17b1804b1-4a1680f109emr47971365e9.15.1791046014374; 
 Sat, 03 Oct 2026 09:46:54 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a162e867e8sm149438305e9.15.2026.10.03.09.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 09:46:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sat,  3 Oct 2026 18:46:49 +0200
Message-ID: <20261003164649.488966-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x] package/libgphoto2: fix build with
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
---
 ...s-for-the-size-type-of-jpeg_mem_dest.patch | 142 ++++++++++++++++++
 package/libgphoto2/libgphoto2.mk              |   2 +
 2 files changed, 144 insertions(+)
 create mode 100644 package/libgphoto2/0002-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch

diff --git a/package/libgphoto2/0002-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch b/package/libgphoto2/0002-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
new file mode 100644
index 000000000000..50682743f0b9
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
index f849014bca37..6eda3ea069c9 100644
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
