Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B759C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 18:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A696405C6;
	Sun, 24 Mar 2024 18:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yBXr9CRTzHpg; Sun, 24 Mar 2024 18:25:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B61640596
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B61640596;
	Sun, 24 Mar 2024 18:25:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6093D1BF364
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 18:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EA9D60754
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 18:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLS6q0MPlXC8 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 18:25:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B9596072A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B9596072A
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B9596072A
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 18:25:10 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-789db18e24eso253057485a.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 11:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711304709; x=1711909509;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YjvHXkn2e+UAcNnGqF5XP6JwrKkq55Yk0rqdYOBYc6g=;
 b=WfNEZARWCYybs1ERFP9mUgufrfA/4HoLOqbSR4eXUwiKNwh0xA1nHSU8FbzDQBrkgl
 yEeLSGJqk2ZaS1Q5dcjULL7IEb2+QSkeTx13RDFZtODBCS2HkA9yMnoHi3vR5q+WfudL
 flpoX0M5ql5i3IzWgKBYlum7pggzxTzreQN5FW04vQkk3XtnPxAx92++1pJKtqnULlGu
 fvn/9uwd9VqWQ8k+OBLNL7HWdhGYWX5MwVooVLgHg9UMvq7AheAqRKRD0DsDM9uy+ik1
 1lTPlnAUFiXjmObwYXLrxuDPBBARfz3X1J6J8NmVW50Xsnd31OqX1NGIXlYFk7g3wYX3
 2InQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ+wTEsIkvqfqxL7637p/HPCe/N6K98qgfxwL4rUvvSqSXO8QySJsX7aa4td3jFC3IPQ3n81ZsBN4E8aBnxYoNdHdcUIn62w==
X-Gm-Message-State: AOJu0YwIA9nW79OwbDb7+km3gvm6JQuXrX4BAVgeNOmqn70qgMgaK3Bc
 Di7BXOIc4WEeBp9MUs2JO9XPzx/JShmc89H1Brn/rKX2vodSJ0I8ZFhHXSzFKKw=
X-Google-Smtp-Source: AGHT+IH1SG7EUjyduP3z0mmsZRwPFHgF0VGqOXYj4t4JgiThL3oAVjVJ+XMRH1sCk9d/KXOMlhOhRA==
X-Received: by 2002:a05:6214:b67:b0:691:1a5b:f5ab with SMTP id
 ey7-20020a0562140b6700b006911a5bf5abmr7938374qvb.19.1711304708696; 
 Sun, 24 Mar 2024 11:25:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fv11-20020a056214240b00b0069035d9a576sm3235529qvb.60.2024.03.24.11.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 11:25:08 -0700 (PDT)
Message-ID: <354c3335-a0bb-4092-8ced-bfaeb4534b5d@mind.be>
Date: Sun, 24 Mar 2024 19:25:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240324172855.55663-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240324172855.55663-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711304709; x=1711909509; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YjvHXkn2e+UAcNnGqF5XP6JwrKkq55Yk0rqdYOBYc6g=;
 b=fIYIksU3h8mfNE+TnrhjAUMMElu7u3t2Gm1xGWRXyCtDh7udJAT6XSMHriQtJl2Ya5
 mOtJG5VXWDHvUNE8igK5+onc3r5PV9EtAosmZQnmQbfQR2lkTx5sl/MRj1E3zMj3gA/b
 /su25FutoDAM6Y9MPLyq0TimFxfryIakqpDouy7snAF82bLyXjKtB3tF8JYnWBtthVZn
 X3i/sA+UUGKGR//gnfta2PIssIR4TkwTiNaDjbuIlhJAi4SfTjwP7IJ2HBzRA7WeRisI
 gpywjFBzZV6UivBiaM3Im58iqRf3/Ev5GnLkYL5cHszuN0jQBO+kSLztwp7XzzMlboB9
 Cxyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fIYIksU3
Subject: Re: [Buildroot] [PATCH 1/1] package/giflib: bump to version 5.2.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/03/2024 18:28, Fabrice Fontaine wrote:
> - Refresh first and fourth patches
> - Drop second nad third patches (already in version)
> 
> https://sourceforge.net/p/giflib/code/ci/5.2.2/tree/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

[snip]
> diff --git a/package/giflib/0002-Fix-several-defects-found-by-Coverity-scan.patch b/package/giflib/0002-Fix-several-defects-found-by-Coverity-scan.patch
> new file mode 100644
> index 0000000000..f6816d0753
> --- /dev/null
> +++ b/package/giflib/0002-Fix-several-defects-found-by-Coverity-scan.patch
> @@ -0,0 +1,59 @@
> +From a1c48b91cd1cf1e9bf7077709b69f4bfd4c4abc7 Mon Sep 17 00:00:00 2001
> +From: Sandro Mani <manisandro@gmail.com>
> +Date: Tue, 5 Dec 2023 16:38:48 -0700
> +Subject: [PATCH] Fix several defects found by Coverity scan
> +
> +From: giflib-5.2.1-17.fc39.src.rpm
> +Upstream: Not submitted

  Any chance to submit it to upstream after all? It looks like a kind of 
important patch, and upstream seems to be active...

  Regards,
  Arnout

> +
> +Signed-off-by: Sandro Mani <manisandro@gmail.com>
> +Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> +[Fabrice: updated for 5.2.2]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + gif2rgb.c | 11 ++++++++++-
> + 1 file changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/gif2rgb.c b/gif2rgb.c
> +index d9a469f..02cea41 100644
> +--- a/gif2rgb.c
> ++++ b/gif2rgb.c
> +@@ -170,6 +170,8 @@ static void SaveGif(GifByteType *OutputBuffer,
> + 	/* Open stdout for the output file: */
> + 	if ((GifFile = EGifOpenFileHandle(1, &Error)) == NULL) {
> + 		PrintGifError(Error);
> ++		free(OutputBuffer);
> ++		GifFreeMapObject(OutputColorMap);
> + 		exit(EXIT_FAILURE);
> + 	}
> +
> +@@ -179,6 +181,8 @@ static void SaveGif(GifByteType *OutputBuffer,
> + 	     EGifPutImageDesc(GifFile, 0, 0, Width, Height, false, NULL) ==
> + 	        GIF_ERROR) {
> + 		PrintGifError(Error);
> ++		free(OutputBuffer);
> ++		GifFreeMapObject(OutputColorMap);
> + 		exit(EXIT_FAILURE);
> + 	}
> +
> +@@ -187,6 +191,8 @@ static void SaveGif(GifByteType *OutputBuffer,
> +
> + 	for (i = 0; i < Height; i++) {
> + 		if (EGifPutLine(GifFile, Ptr, Width) == GIF_ERROR) {
> ++			free(OutputBuffer);
> ++			GifFreeMapObject(OutputColorMap);
> + 			exit(EXIT_FAILURE);
> + 		}
> + 		GifQprintf("\b\b\b\b%-4d", Height - i - 1);
> +@@ -196,6 +203,8 @@ static void SaveGif(GifByteType *OutputBuffer,
> +
> + 	if (EGifCloseFile(GifFile, &Error) == GIF_ERROR) {
> + 		PrintGifError(Error);
> ++		free(OutputBuffer);
> ++		GifFreeMapObject(OutputColorMap);
> + 		exit(EXIT_FAILURE);
> + 	}
> + }
> +--
> +2.43.0
> +
> diff --git a/package/giflib/0003-Fix-CVE-2023-39742.patch b/package/giflib/0003-Fix-CVE-2023-39742.patch
> deleted file mode 100644
> index 2ba01ac8a4..0000000000
> --- a/package/giflib/0003-Fix-CVE-2023-39742.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 4288b993ee9df6550a367fe06ede3c003dc7bbc6 Mon Sep 17 00:00:00 2001
> -From: Sandro Mani <manisandro@gmail.com>
> -Date: Tue, 5 Dec 2023 16:35:40 -0700
> -Subject: [PATCH] Fix CVE-2023-39742
> -
> -From: giflib-5.2.1-17.fc39.src.rpm
> -Fix segmentation faults due to non correct checking for args
> -Fixes: https://nvd.nist.gov/vuln/detail/CVE-2023-39742
> -Upstream: https://sourceforge.net/p/giflib/bugs/166/
> -
> -Signed-off-by: Sandro Mani <manisandro@gmail.com>
> -Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ----
> - getarg.c | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/getarg.c b/getarg.c
> -index d569f6c..51fbe0b 100644
> ---- a/getarg.c
> -+++ b/getarg.c
> -@@ -307,6 +307,12 @@ GAGetParmeters(void *Parameters[],
> -     int i = 0, ScanRes;
> -
> -     while (!(ISSPACE(CtrlStrCopy[i]))) {
> -+
> -+        if ((*argv) == argv_end) {
> -+            GAErrorToken = Option;
> -+            return CMD_ERR_NumRead;
> -+        }
> -+
> -         switch (CtrlStrCopy[i + 1]) {
> -           case 'd':    /* Get signed integers. */
> -               ScanRes = sscanf(*((*argv)++), "%d",
> ---
> -2.43.0
> -
> diff --git a/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch b/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
> deleted file mode 100644
> index 1719769872..0000000000
> --- a/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From a1c48b91cd1cf1e9bf7077709b69f4bfd4c4abc7 Mon Sep 17 00:00:00 2001
> -From: Sandro Mani <manisandro@gmail.com>
> -Date: Tue, 5 Dec 2023 16:38:48 -0700
> -Subject: [PATCH] Fix several defects found by Coverity scan
> -
> -From: giflib-5.2.1-17.fc39.src.rpm
> -Upstream: Not submitted
> -
> -Signed-off-by: Sandro Mani <manisandro@gmail.com>
> -Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ----
> - gif2rgb.c | 11 ++++++++++-
> - 1 file changed, 10 insertions(+), 1 deletion(-)
> -
> -diff --git a/gif2rgb.c b/gif2rgb.c
> -index d9a469f..02cea41 100644
> ---- a/gif2rgb.c
> -+++ b/gif2rgb.c
> -@@ -170,6 +170,8 @@ static void SaveGif(GifByteType *OutputBuffer,
> -     /* Open stdout for the output file: */
> -     if ((GifFile = EGifOpenFileHandle(1, &Error)) == NULL) {
> - 	PrintGifError(Error);
> -+	free(OutputBuffer);
> -+	GifFreeMapObject(OutputColorMap);
> - 	exit(EXIT_FAILURE);
> -     }
> -
> -@@ -179,6 +181,8 @@ static void SaveGif(GifByteType *OutputBuffer,
> - 	EGifPutImageDesc(GifFile,
> - 			 0, 0, Width, Height, false, NULL) == GIF_ERROR) {
> - 	PrintGifError(Error);
> -+	free(OutputBuffer);
> -+	GifFreeMapObject(OutputColorMap);
> - 	exit(EXIT_FAILURE);
> -     }
> -
> -@@ -187,8 +191,11 @@ static void SaveGif(GifByteType *OutputBuffer,
> - 	       GifFile->Image.Width, GifFile->Image.Height);
> -
> -     for (i = 0; i < Height; i++) {
> --	if (EGifPutLine(GifFile, Ptr, Width) == GIF_ERROR)
> -+	if (EGifPutLine(GifFile, Ptr, Width) == GIF_ERROR) {
> -+	    free(OutputBuffer);
> -+	    GifFreeMapObject(OutputColorMap);
> - 	    exit(EXIT_FAILURE);
> -+        }
> - 	GifQprintf("\b\b\b\b%-4d", Height - i - 1);
> -
> - 	Ptr += Width;
> -@@ -196,6 +203,8 @@ static void SaveGif(GifByteType *OutputBuffer,
> -
> -     if (EGifCloseFile(GifFile, &Error) == GIF_ERROR) {
> - 	PrintGifError(Error);
> -+	free(OutputBuffer);
> -+	GifFreeMapObject(OutputColorMap);
> - 	exit(EXIT_FAILURE);
> -     }
> - }
> ---
> -2.43.0
> -
> diff --git a/package/giflib/giflib.hash b/package/giflib/giflib.hash
> index 445e9c4b3d..f11d4f1505 100644
> --- a/package/giflib/giflib.hash
> +++ b/package/giflib/giflib.hash
> @@ -1,5 +1,6 @@
>   # From http://sourceforge.net/projects/giflib/files
> -md5  6f03aee4ebe54ac2cc1ab3e4b0a049e5  giflib-5.2.1.tar.gz
> -sha1  c3f774dcbdf26afded7788979c8081d33c6426dc  giflib-5.2.1.tar.gz
> +md5  913dd251492134e235ee3c9a91987a4d  giflib-5.2.2.tar.gz
> +sha1  608ba98d2dd8d03dfa7476f434d57de50a33e10b  giflib-5.2.2.tar.gz
>   # Locally computed
> +sha256  be7ffbd057cadebe2aa144542fd90c6838c6a083b5e8a9048b8ee3b66b29d5fb  giflib-5.2.2.tar.gz
>   sha256  0c9b7990ecdca88b676db232c226548ac408b279f550d424d996f0d83591dd8e  COPYING
> diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
> index 3ac74f9244..770338507b 100644
> --- a/package/giflib/giflib.mk
> +++ b/package/giflib/giflib.mk
> @@ -4,18 +4,13 @@
>   #
>   ################################################################################
>   
> -GIFLIB_VERSION = 5.2.1
> +GIFLIB_VERSION = 5.2.2
>   GIFLIB_SITE = http://downloads.sourceforge.net/project/giflib
>   GIFLIB_INSTALL_STAGING = YES
>   GIFLIB_LICENSE = MIT
>   GIFLIB_LICENSE_FILES = COPYING
>   GIFLIB_CPE_ID_VALID = YES
>   
> -# 0002-Fix-CVE-2022-28506.patch
> -GIFLIB_IGNORE_CVES = CVE-2022-28506
> -# 0003-Fix-CVE-2023-39742.patch
> -GIFLIB_IGNORE_CVES += CVE-2023-39742
> -
>   ifeq ($(BR2_STATIC_LIBS),y)
>   GIFLIB_BUILD_LIBS = static-lib
>   GIFLIB_INSTALL_LIBS = install-static-lib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
