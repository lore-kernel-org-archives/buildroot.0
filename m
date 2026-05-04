Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A10DCD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 514224110D;
	Mon,  4 May 2026 14:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5d_aY7GdKfX; Mon,  4 May 2026 14:47:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 428AF41BDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906071;
	bh=imzKpoVMMjGPtvofqAGgrAjKzd+PX06WslojZroVIHA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GEd4q9xqVx2FM2EpIu5Bg/m6Zb5hclfUR6TfRvtAVi6SA4Wst/HAJoFAsuHqnS5Vg
	 Q3PwsugZ83Z5onRuBHTQuBc6q0+zibyABxXVCuZIkcf1tO4J1xd3IfTJa0X0Bjk0SZ
	 ZrsmfjGIjoWSVQ4yIs4gV1RyWv5bN2tVNE6tDvLd5JwGrPy4de60GA4lt/GTR7+xeX
	 N+PMwifvEsI3wVHEEc8wtMqTJSKjv71VG4f+wN2MoyabwQQvwJj7IMc3InkqZTIqsc
	 82BI21LLUU57Cr0CxOni8PpXLjBoE4ClKb5Y1i4AuhDVstcCt+aH4j2glUxPywdIiW
	 xC3HvAecofo4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 428AF41BDE;
	Mon,  4 May 2026 14:47:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11DDC190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC47384651
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w4pHqPMV4rNX for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6CCF08464F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CCF08464F
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CCF08464F
 for <buildroot@busybox.net>; Mon,  4 May 2026 14:47:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-44985f4ab0fso1802983f8f.0
 for <buildroot@busybox.net>; Mon, 04 May 2026 07:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906065; x=1778510865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LX1YKpxYGaBOBaufX42AjLF18XYM4PLsxu+2pXWKTOA=;
 b=c1Cf18F4T31EvmoxweZF4t0JgJc70bFD/nY6oAthiBBRM0IrQqqkQDJBJgIHNxAxe/
 5+2M3WGT3lpi5j8jisGukwPvm1FYOWhHdHyex1pGxNXn6Ac74t7RhewAbWORwXtHPS5Q
 FU6MH8inQsU1P3+3BIeS/aVzBHjw5ah5Pn6dI5nKAPKgmtX8TQY/9Pnh/md9FkmvIu/0
 As5iwoxMhgVEJO9Usb67eZ/6raKhAm67Dda5QyzStMs2pOdUsLhUTW9lRpKs3vdB1vo1
 sxVATQf9Cdc+7hravW0e8EOvqtEOXyPrzvqywIl4PrAHi3bk4Q9k6djndvu+MONZEtBG
 +7DQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9VHX1VHcWmPYGbIAkTVt12NVDGwXkt5rOGOArimneS0Pdhnov0AnCrIU5M7GhGbxy2WT1ZQ2jXmm0=@busybox.net
X-Gm-Message-State: AOJu0YwATVS4/EoQ2MclaMohPLXyavmrV4OmWF2JBTG+oUvtV2nmEHYo
 UhGNfrNg7I5+4S+L/czUi7DV4kZgrAIGcP8XFhsvyCGRs6FNw8f/1xiVJ07+nyuL/mZZEj5YzwW
 cADNj
X-Gm-Gg: AeBDieuRqW9qgofLrqSnwTeUYfJAXm7x6lKv6YBOpzhhCRlcmMcCF5Owmec03Elhsps
 olQyCeuenqXT4ZIqBL8TA01BXx4i+SOUPqh67nF0MF6lZuwlHKfU6pztORP8N/UOGQe0ulLnFD2
 5cpPUZfQsg0UyV+Q1O4ROcExBw8hH4WmabOp3eeO6/jn6EIiHmARXkaJJB73whwBcdpMhE3jFJ5
 u6ElJ55QkXDmaOpGR0oFi9lojE0T7t0KP7f9VX0qbTJvD3TcA9M3GxWtPXUgcATgYnqpazhuMuK
 45Mxldw55Xiv9nGC49fKWGg3DQdy+Wu18aKI1yObNds1zJEQ/JEz36KcfK5c3GDBFDNSmU92rNR
 ZNStb2Sg2HtjGHkphcfaldajbf9WOVYKuCmRuly7yC7DzpEnvGjHBxqpcCYsDpbLJnq/GgyRR7i
 8hysAxj85jmj4SrfhKYCWY9HqZQw==
X-Received: by 2002:a05:6000:2486:b0:44a:8c10:40d9 with SMTP id
 ffacd0b85a97d-44bb63f58bcmr16540437f8f.23.1777906065350; 
 Mon, 04 May 2026 07:47:45 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a981defa6sm24383842f8f.24.2026.05.04.07.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:44 -0700 (PDT)
To: Francois Perrad <francois.perrad@gadz.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@busybox.net
Date: Mon,  4 May 2026 16:47:44 +0200
Message-ID: <20260504144744.10295-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260422163125.5757-2-francois.perrad@gadz.org>
References: <20260422163125.5757-2-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906065; x=1778510865; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LX1YKpxYGaBOBaufX42AjLF18XYM4PLsxu+2pXWKTOA=;
 b=cEp2CqArPINpOvfxUYhdvvIzgVR0pyC/th72wfrnqiUURtBDP7kQv0Z6DgaD0AJuq5
 QmimBmxsUdoA2WKclQq57axFaPYqr0hI/9cW8Kli2EPkJb25lSOdO9/eiPutGTa+flun
 Fmgzm2TuF7vGR06lfXvTUTOCP2QlqOCI58e+F6F4jplKSyWogCh74Jz+cy5yvO1/wKTf
 6/7nYyvEV0XblvWdrFxkqGDHRAJKpw8FeryRcp5PFfd2euwd13x5AP6WYDDwsr3OPrwq
 r2CgpyvFP6owwioKyA0kE08xHeGAI9D8aLW/gDCh04Bhz7MCvFyVH2XRaMf/THwqCtvG
 KtoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cEp2CqAr
Subject: Re: [Buildroot] [PATCH v3 1/2] package/ficl: downgrade to version
 3.03
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> see https://sourceforge.net/p/ficl/news/2025/07/ficl4-is-retiring/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  .checkpackageignore                           |  1 -
>  package/ficl/0001-fix-Makefile.patch          | 47 -------------------
>  package/ficl/0001-missing-include.patch       | 26 ++++++++++
>  .../0002-Makefile.linux-pass-LDFLAGS.patch    | 19 ++++----
>  package/ficl/ficl.hash                        |  4 +-
>  package/ficl/ficl.mk                          | 20 ++++----
>  6 files changed, 49 insertions(+), 68 deletions(-)
>  delete mode 100644 package/ficl/0001-fix-Makefile.patch
>  create mode 100644 package/ficl/0001-missing-include.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 695e0d50c..6b391d926 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -343,7 +343,6 @@ package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch lib_patch.
>  package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch lib_patch.Upstream
>  package/ffmpeg/0003-libavutil-Fix-mips-build.patch lib_patch.Upstream
>  package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch lib_patch.Upstream
> -package/ficl/0001-fix-Makefile.patch lib_patch.Upstream
>  package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch lib_patch.Upstream
>  package/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch lib_patch.Upstream
>  package/flex/0002-build-make-it-possible-to-disable-the-build-of-the-f.patch lib_patch.Upstream
> diff --git a/package/ficl/0001-fix-Makefile.patch b/package/ficl/0001-fix-Makefile.patch
> deleted file mode 100644
> index d5a25c43f..000000000
> --- a/package/ficl/0001-fix-Makefile.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -fix dependency in Makefiles
> -
> -there is no longer a sysdep.h file.
> -
> -Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> -
> -diff --git a/Makefile b/Makefile
> -index 976d00a..7f73c44 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -29,7 +29,7 @@ libficl.so.$(MAJOR).$(MINOR): $(OBJECTS)
> - 	-o libficl.so.$(MAJOR).$(MINOR) $(OBJECTS)
> - 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so
> - 
> --main: main.o ficl.h sysdep.h libficl.so.$(MAJOR).$(MINOR)
> -+main: main.o ficl.h libficl.so.$(MAJOR).$(MINOR)
> - 	$(CC) $(CFLAGS) $(LDFLAGS) main.o -o main -L. -lficl -lm
> - 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so.$(MAJOR)
> - 
> -diff --git a/Makefile.ansi b/Makefile.ansi
> -index e510fcd..170e6eb 100644
> ---- a/Makefile.ansi
> -+++ b/Makefile.ansi
> -@@ -29,7 +29,7 @@ libficl.so.$(MAJOR).$(MINOR): $(OBJECTS)
> - 	-o libficl.so.$(MAJOR).$(MINOR) $(OBJECTS)
> - 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so
> - 
> --main: main.o ficl.h sysdep.h libficl.so.$(MAJOR).$(MINOR)
> -+main: main.o ficl.h libficl.so.$(MAJOR).$(MINOR)
> - 	$(CC) main.o -o main -L. -lficl -lm
> - 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so.$(MAJOR)
> - 
> -diff --git a/Makefile.linux b/Makefile.linux
> -index d447e7e..7f2cdfe 100644
> ---- a/Makefile.linux
> -+++ b/Makefile.linux
> -@@ -29,7 +29,7 @@ libficl.so.$(MAJOR).$(MINOR): $(OBJECTS)
> - 	-o libficl.so.$(MAJOR).$(MINOR) $(OBJECTS)
> - 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so
> - 
> --main: main.o ficl.h sysdep.h libficl.so.$(MAJOR).$(MINOR)
> -+main: main.o ficl.h libficl.so.$(MAJOR).$(MINOR)
> - 	$(CC) main.o -o main -L. -lficl -lm
> - 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so.$(MAJOR)
> - 
> --- 
> -
> diff --git a/package/ficl/0001-missing-include.patch b/package/ficl/0001-missing-include.patch
> new file mode 100644
> index 000000000..a52089623
> --- /dev/null
> +++ b/package/ficl/0001-missing-include.patch
> @@ -0,0 +1,26 @@
> +From 87c78eea2c4ac69c09947c8e49f8e8668640071c Mon Sep 17 00:00:00 2001
> +From: Francois Perrad <francois.perrad@gadz.org>
> +Date: Sun, 7 Dec 2025 10:15:27 +0100
> +Subject: [PATCH] missing include
> +
> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> +Upstream: upstream is dead
> +---
> + fileaccess.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/fileaccess.c b/fileaccess.c
> +index 738889d..c03d5d6 100644
> +--- a/fileaccess.c
> ++++ b/fileaccess.c
> +@@ -4,6 +4,7 @@
> + #include <string.h>
> + #include <ctype.h>
> + #include <sys/stat.h>
> ++#include <unistd.h>
> + #include "ficl.h"
> + 
> + #if FICL_WANT_FILE
> +-- 
> +2.43.0
> +
> diff --git a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch b/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
> index dd9e16412..aa5c00edb 100644
> --- a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
> +++ b/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
> @@ -15,6 +15,8 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  Upstream: upstream is dead
>  [Dario: make the patch to be applied with fuzz factor 0]
>  Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +[francois: downgrade to 3.03]
> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>  ---
>   Makefile.linux | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> @@ -23,14 +25,15 @@ diff --git a/Makefile.linux b/Makefile.linux
>  index 5f1a41f..df887e6 100644
>  --- a/Makefile.linux
>  +++ b/Makefile.linux
> -@@ -14,6 +14,6 @@ MINOR = 1.0
> - 
> - ficl: main.o $(HEADERS) libficl.a
> --	$(CC) main.o -o ficl -L. -lficl -lm
> -+	$(CC) $(LDFLAGS) main.o -o ficl -L. -lficl -lm
> - 
> - lib: libficl.so.$(MAJOR).$(MINOR)
> - 
> +@@ -13,7 +13,7 @@ MAJOR = 3
> + MINOR = 0.1
> + 
> + ficl: testmain.o ficl.h sysdep.h libficl.a
> +-	$(CC) testmain.o -o ficl -L. -lficl -lm
> ++	$(CC) $(LDFLAGS) testmain.o -o ficl -L. -lficl -lm
> + 
> + lib: libficl.so.$(MAJOR).$(MINOR)
> + 
>  -- 
>  2.35.1
>  
> diff --git a/package/ficl/ficl.hash b/package/ficl/ficl.hash
> index df53c843c..1a4a54e70 100644
> --- a/package/ficl/ficl.hash
> +++ b/package/ficl/ficl.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  4daf74f3d3d6f8b86ea7cb47bc24931d50b4809b50ba34ca32e0ca1e972bd3a3  ficl-4.1.0.tar.gz
> -sha256  1d1dd1f1cde52e8b607c5ccb6a2e5de878fd1719b8c5a4d31b9cdb343c203d0d  ReadMe.txt
> +sha256  064abbea44b2cbbeb53b8df8e5588ed41c4d32dd19bdb897e5d21507691407b2  ficl303.tar.gz
> +sha256  18527f5cdc213d29fb65791e153690974e5426b7e989f3b8eee61c2e5f9e5fcd  ReadMe.txt
> diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
> index c0698a343..ef2e1408c 100644
> --- a/package/ficl/ficl.mk
> +++ b/package/ficl/ficl.mk
> @@ -4,9 +4,11 @@
>  #
>  ################################################################################
>  
> -FICL_VERSION_MAJOR = 4.1
> -FICL_VERSION = $(FICL_VERSION_MAJOR).0
> -FICL_SITE = https://sourceforge.net/projects/ficl/files/OldFiles/Ficl4%20%28retired%29
> +FICL_VERSION = 3.03
> +FICL_TAG = ficl$(subst .,,$(FICL_VERSION))
> +FICL_VERSION_SO = 3.0.1
> +FICL_SOURCE = $(FICL_TAG).tar.gz
> +FICL_SITE = https://sourceforge.net/projects/ficl/files/ficl-all/$(FICL_TAG)
>  FICL_LICENSE = BSD-2-Clause
>  FICL_LICENSE_FILES = ReadMe.txt
>  FICL_INSTALL_STAGING = YES
> @@ -26,14 +28,14 @@ endef
>  endif
>  
>  ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> -FICL_BUILD_TARGETS += main libficl.so.$(FICL_VERSION)
> +FICL_BUILD_TARGETS += testmain libficl.so.$(FICL_VERSION_SO)
>  define FICL_INSTALL_SHARED_BIN
> -	$(INSTALL) -D -m 0755 $(@D)/main $(TARGET_DIR)/usr/bin/ficl
> +	$(INSTALL) -D -m 0755 $(@D)/testmain $(TARGET_DIR)/usr/bin/ficl
>  endef
>  define FICL_INSTALL_SHARED_LIB
> -	$(INSTALL) -D -m 0755 $(@D)/libficl.so.$(FICL_VERSION) $(1)/usr/lib/libficl.so.$(FICL_VERSION)
> -	ln -sf libficl.so.$(FICL_VERSION) $(1)/usr/lib/libficl.so.4
> -	ln -sf libficl.so.$(FICL_VERSION) $(1)/usr/lib/libficl.so
> +	$(INSTALL) -D -m 0755 $(@D)/libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so.$(FICL_VERSION_SO)
> +	ln -sf libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so.3
> +	ln -sf libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so
>  endef
>  endif
>  
> @@ -46,8 +48,6 @@ define FICL_INSTALL_STAGING_CMDS
>  	$(FICL_INSTALL_STATIC_LIB)
>  	$(call FICL_INSTALL_SHARED_LIB,$(STAGING_DIR))
>  	$(INSTALL) -D -m 0644 $(@D)/ficl.h $(STAGING_DIR)/usr/include/ficl.h
> -	$(INSTALL) -D -m 0644 $(@D)/ficllocal.h $(STAGING_DIR)/usr/include/ficllocal.h
> -	$(INSTALL) -D -m 0644 $(@D)/ficlplatform/unix.h $(STAGING_DIR)/usr/include/ficlplatform/unix.h
>  endef
>  
>  define FICL_INSTALL_TARGET_CMDS
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
