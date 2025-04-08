Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6C2C36010
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 00:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2F80610E6;
	Tue,  8 Apr 2025 00:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_H9eyLK3aBJ; Tue,  8 Apr 2025 00:10:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 199E861013
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 199E861013;
	Tue,  8 Apr 2025 00:10:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC3C11DE
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 00:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3A6D610FF
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 00:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GwUiKL_licL for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 00:10:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D54C361010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D54C361010
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D54C361010
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 00:10:47 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-22435603572so46786415ad.1
 for <buildroot@buildroot.org>; Mon, 07 Apr 2025 17:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744071046; x=1744675846;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q8lL+je3k3SxDogK7Nm8cfj1o+kKMyCb6/DaP7elYIY=;
 b=EX9HGm0T+vFHiWD/iQ2YqRR5fL117MHcdFoevw9ijryExyoh/iXoQ3Gv2uPExXUVXT
 h9JhxTk+65yrpITY5vwxHIcVgRz3W2/HWs/GlK8BhlhqIxSbjgIqVe/hQBmXyE9S2RGP
 L31pcJP78G5AtENvyGRfO/H6/ATM3EstfoenRnqXRpA9mI6RFRbiwYpyUWN2ZBPeN+F3
 4LdwGTQFXSoKwzsaVq5EpuCp4ndoL79IT0M6ZXXEnseIiwg9jLlHGn+rrpIS+kdv0dwx
 o1fPFqO6vg43u5hWx/QUPTgcZDN4kKEyE9Abwi637ydsWY8szoj0jj5s6UEeAIlw1gR4
 D5xg==
X-Gm-Message-State: AOJu0Ywap1dWqcpg+XLU37usKz5wbzQQ69v8nu70/z1xMueBZ6TJNJCU
 miGLLdtkksIlZukrSBy19lfHKpOvjeUc5mFospktuHOZa30tv+iDHSLvPR0WhX3x2lHYDONJQXu
 M
X-Gm-Gg: ASbGncvYAbQhD7YEALYn0fDXeSlmsTWSftpLdIho6v0/I3IJPIv8gUrtryInMaeB+kZ
 TE930/PcVYSIo/GYjVApChbJ17g+JBdGkj6VKTSyMB91cXkY4qJvvJa9sek01l+BDm9+v/o+kfv
 p6d2MFAVKVKDfIrU29TeaOs/Nwsb6QcLPk5sSjni3wEvnOHfpMxskcKEOLWpUsmZe6RqfwHkb9L
 +pLIN5zo+oSeDDFtBnbb77pCmLLGxSyfQx8qu9DiW/m4XUnBXzC9KsvPEeJbCHRR1N9kFXde1wt
 U8nA81F201be5AwqxHFnligdULs/9wBPccucli/n
X-Google-Smtp-Source: AGHT+IFzrm6sVX+fj+4f9+FhOobDVnKcO+OdCDRdPDyPGO2gXkP7b5KOjZ4M2mKSQKS0EgpHjcWG8Q==
X-Received: by 2002:a17:903:1a10:b0:224:216e:3342 with SMTP id
 d9443c01a7336-22a8a8e3d97mr199180925ad.43.1744071046466; 
 Mon, 07 Apr 2025 17:10:46 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:d889:2507:e4f5:b671])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-229787727eesm87406045ad.224.2025.04.07.17.10.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 17:10:45 -0700 (PDT)
Date: Mon, 7 Apr 2025 17:10:44 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: buildroot@buildroot.org
Message-ID: <Z_RphBTT5pqKjfuS@ghost>
References: <20250407-fixup_bzip2-v1-1-12442cbc4b03@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407-fixup_bzip2-v1-1-12442cbc4b03@rivosinc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744071046; x=1744675846;
 darn=buildroot.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q8lL+je3k3SxDogK7Nm8cfj1o+kKMyCb6/DaP7elYIY=;
 b=VGqJvgiJQksCHE/VvgmbaWxiR74LqJTMEzIHP3Z7i5ULDxLeoaGk4t0bAAUzXZdFIH
 AIQnWSeZRq00quUYsLVOffkQlsLAAoFgtgAHizss4SW0+oBn6MC5yV7bhnXTY+0LVxjR
 C02+4mjve2qY1aRc2ZGx0lQR6sts5DA0XMlkcoe+NsHlUvTabnSAr+w5Jg//jiE/wIuY
 MzzAMIbi8bq7VquI0jQLbQcPcJzwfBByJlADUiEOxdTpXdj5pvy9a6UEjGmv1ymmNg8R
 b9JCrRoHq49TGPqBmxo0AT4hlYNFzEQbnGCKq+0rvd1a7ygkUGv+cxvi8W90yNsX20BK
 /tzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=VGqJvgiJ
Subject: Re: [Buildroot] [PATCH] package/bzip2: Remove stale patch file
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

On Mon, Apr 07, 2025 at 04:27:54PM -0700, Charlie Jenkins wrote:
> Since bzip2 has been bumped to 1.0.8, the patch file that only affects
> 1.06 hasn't been relevant so remove it.

I had a bad setup and was thrown off by "bzip2-1.0.6". This seems to
apply normally on 1.0.8 so I guess this patch can be ignored.

- Charlie

> 
> Fixes: 7ae14d201e14 ("package/bzip2: security bump version to 1.0.8")
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  package/bzip2/0001-build-objects-twice.patch       | 58 ----------------------
>  ...ystem.patch => 0001-improve-build-system.patch} |  0
>  2 files changed, 58 deletions(-)
> 
> diff --git a/package/bzip2/0001-build-objects-twice.patch b/package/bzip2/0001-build-objects-twice.patch
> deleted file mode 100644
> index 52b234f65a8eb1a9aa3c907e9a4718b577401eb1..0000000000000000000000000000000000000000
> --- a/package/bzip2/0001-build-objects-twice.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -Build objects twice for shared and static libraries
> -
> -The existing Makefile causes problems on MIPS because the same object
> -files (not compiled with -fPIC) are used in static and shared libraries.
> -MIPS will refuce to link non-pic objects in shared libraries.
> -We fix this problems by creating a new rule for the shared library
> -and build the shared objects as *.sho instead of *.o.
> -Then, we use these objects to create the shared library.
> -
> -Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> -[Dario: make the patch to be applied with fuzz factor 0]
> -Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> -
> -Index: bzip2-1.0.6/Makefile-libbz2_so
> -===================================================================
> ---- bzip2-1.0.6.orig/Makefile-libbz2_so
> -+++ bzip2-1.0.6/Makefile-libbz2_so
> -@@ -26,13 +26,13 @@ CC=gcc
> - BIGFILES=-D_FILE_OFFSET_BITS=64
> - CFLAGS=-fpic -fPIC -Wall -Winline -O2 -g $(BIGFILES)
> - 
> --OBJS= blocksort.o  \
> --      huffman.o    \
> --      crctable.o   \
> --      randtable.o  \
> --      compress.o   \
> --      decompress.o \
> --      bzlib.o
> -+OBJS= blocksort.sho  \
> -+      huffman.sho    \
> -+      crctable.sho   \
> -+      randtable.sho  \
> -+      compress.sho   \
> -+      decompress.sho \
> -+      bzlib.sho
> - 
> - all: $(OBJS)
> - 	$(CC) -shared -Wl,-soname -Wl,libbz2.so.1.0 -o libbz2.so.1.0.8 $(OBJS)
> -@@ -43,17 +43,5 @@ all: $(OBJS)
> - clean: 
> - 	rm -f $(OBJS) bzip2.o libbz2.so.1.0.8 libbz2.so.1.0 bzip2-shared
> - 
> --blocksort.o: blocksort.c
> --	$(CC) $(CFLAGS) -c blocksort.c
> --huffman.o: huffman.c
> --	$(CC) $(CFLAGS) -c huffman.c
> --crctable.o: crctable.c
> --	$(CC) $(CFLAGS) -c crctable.c
> --randtable.o: randtable.c
> --	$(CC) $(CFLAGS) -c randtable.c
> --compress.o: compress.c
> --	$(CC) $(CFLAGS) -c compress.c
> --decompress.o: decompress.c
> --	$(CC) $(CFLAGS) -c decompress.c
> --bzlib.o: bzlib.c
> --	$(CC) $(CFLAGS) -c bzlib.c
> -+%.sho: %.c
> -+	$(CC) $(CFLAGS) -o $@ -c $<
> diff --git a/package/bzip2/0002-improve-build-system.patch b/package/bzip2/0001-improve-build-system.patch
> similarity index 100%
> rename from package/bzip2/0002-improve-build-system.patch
> rename to package/bzip2/0001-improve-build-system.patch
> 
> ---
> base-commit: af094ed137d6967afb6270b69c516a22eb9d8091
> change-id: 20250407-fixup_bzip2-3fbf6ebde7ee
> -- 
> - Charlie
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
