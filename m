Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90E8CA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C153361C98;
	Thu, 21 Aug 2025 19:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOXljFFqD9rb; Thu, 21 Aug 2025 19:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE2A7616EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE2A7616EE;
	Thu, 21 Aug 2025 19:22:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ACCC21C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9349440D21
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0eX2YyNFVcXn for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9011940D1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9011940D1C
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9011940D1C
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:34 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45a1b0d224dso6737115e9.3
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804093; x=1756408893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fco3F3UqYlQvX9+9AHciYJwSmMBJOoAFc4jwkVrPuZ0=;
 b=jx1AZMgn+hIwEtKsNFScwITEE9uOGhG8F31Gk/QGhzmVORPSNJJ3VNK84iDsfn/FMk
 C9SrtanbWrQC3xSyULrKvxTquLGNKMo+NBQdUgCQml4+jgnqW5s+balINpalSNcnvRXf
 clSpLMiGgL8vChqdDGiOgJ5aYTyJgU6Y2BM5FHcaSen7FNXo8qb/yOpmWJQ1VWmWHNpa
 L/nNb+Vz8MXVrwsgi6PkF7JemXJc9j70D1XV1C2glGfQt910OviGCVHdWzoNl1lb3n5U
 D+791yD83fJGeP0aSwtkCxNcrBcpqv+ofmCeyAFkJ4NQhPyGWu9yj++nA6M5l8g5u3Dj
 Wh8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8lkOAuScjylIJnCPUu01mAsd1ZcFLA02u97HunpP4WrBcNUk+xstipjtyzl8oP9iUtBMjmfozZI0=@buildroot.org
X-Gm-Message-State: AOJu0Ywgrb/IsaUwnaP45VXnqOAc8K6LGTck2LBvNxcmSYY0LpfqSdX8
 YEoQYbdXz/R5uEUidkTcv+l7YyOEOvF2bgsfZDZ6g0KvKZGiHVMFIGySPh7r5nZi5AY=
X-Gm-Gg: ASbGncuC5jl7g+OVbXgdczgVqAou5UnvzNFA1J1H761hCRBBid76JZt9zwX+YCEBr2h
 8s3wJmzCMMSQVowmg8ska+BrppwDCl1+ALhfHsfvx/YSaZQCgwXA9lZvHS0DcpS53e27+UW9Bwx
 bapJ+/Tndq2IfgDDV8eFFUNUnHnlEpsIG3nBRZ49Ji2LvwlEkbAVTG9uzx0iVDNqI7yJBeETXFM
 iKwhBnOz49pm++B1wwjAdYW4XqQG1pmWUiPsnS6/c4Qzv2hCwLjxA8QSEWB2MxMwXMrm2+csVjY
 QVl1e8sHanIlswepPSn2wbK9r7Reu/GZycqP8K2avKQ1gtbJnuEEB3r/9xw7w6dWHzWFTAoMAZd
 cfJat30SjltDRxQ==
X-Google-Smtp-Source: AGHT+IEaXwZGQDZikHWpX60R4solRZrY2ZHQn7sgIchkcJxEX15YDMuV9wC8FavvxQF6ltHljkZW2Q==
X-Received: by 2002:a05:600c:4743:b0:458:bfe1:4a82 with SMTP id
 5b1f17b1804b1-45b5179683dmr2683435e9.16.1755804092509; 
 Thu, 21 Aug 2025 12:21:32 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b50ddbef8sm8255485e9.6.2025.08.21.12.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:32 -0700 (PDT)
To: Florian Larysch <fl@n621.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:21:31 +0200
Message-ID: <20250821192131.25043-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820132628.681-3-fl@n621.de>
References: <20250820132628.681-3-fl@n621.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804093; x=1756408893; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fco3F3UqYlQvX9+9AHciYJwSmMBJOoAFc4jwkVrPuZ0=;
 b=JH7k09v1+GSTwvmMH9Eoymsobj7MwFs8CeNBrcEHrd2eD19tCfp5MTD6PXC3i96DM0
 6J5+9T/MUNpAxc/mv0TCMjX0Q6KCw3W8ivmcwyheYLVI7yJg0z0HCEV1kZqOwdXUdqFC
 rOzr9GIjSB061viQvv2DgC7hWOJ5xQ6nikke/BC7f2trgLGZp9NkkaCL9sTO+X6g0vFI
 T8OZ4d9E+Oh2x9POUrZYgquPj/YiO+1N91F3bQHKDKMMPe44jd7s7xksDLox2smkm8Ix
 lwYEfTwYGS4cTcpiWxuFNKSPnwRE7pesGhWNblAaxpn19M9ACmASHTStlRHAaxbKQC0f
 cNTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JH7k09v1
Subject: Re: [Buildroot] [PATCH next 1/1] package/vorbis-tools: bump to
 version 1.4.3
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
> This is a bugfix release that among other things includes the GCC 14
> build fix and resolves CVE-2023-43361.
> 
> Changelog: https://github.com/xiph/vorbis-tools/blob/v1.4.3/CHANGES
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> I think this could also go into master, the diff looks like this is
> indeed purely a bugfix release.
> 
>  .../0001-fix-build-with-gcc-14.patch          | 51 -------------------
>  package/vorbis-tools/vorbis-tools.hash        |  2 +-
>  package/vorbis-tools/vorbis-tools.mk          |  2 +-
>  3 files changed, 2 insertions(+), 53 deletions(-)
>  delete mode 100644 package/vorbis-tools/0001-fix-build-with-gcc-14.patch
> 
> diff --git a/package/vorbis-tools/0001-fix-build-with-gcc-14.patch b/package/vorbis-tools/0001-fix-build-with-gcc-14.patch
> deleted file mode 100644
> index a05ce8a584..0000000000
> --- a/package/vorbis-tools/0001-fix-build-with-gcc-14.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From f4a31fe975ea37537f39ace4420aee893b7e0b1a Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sun, 21 Jul 2024 21:57:38 +0200
> -Subject: [PATCH] fix build with gcc >= 14
> -
> -Add missing includes to avoid the following build failure with gcc >=
> -14:
> -
> -codec_skeleton.c: In function 'skeleton_process_fisbone_message_header':
> -codec_skeleton.c:119:9: error: implicit declaration of function 'utf8_decode' [-Wimplicit-function-declaration]
> -  119 |     if (utf8_decode(header, &decoded) < 0) {
> -      |         ^~~~~~~~~~~
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/bb5d56d836e7d0f2a62daa9954878ad6e0b190ed
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Upstream: https://github.com/xiph/vorbis-tools/pull/48
> ----
> - ogginfo/codec_skeleton.c | 2 ++
> - share/utf8.c             | 1 +
> - 2 files changed, 3 insertions(+)
> -
> -diff --git a/ogginfo/codec_skeleton.c b/ogginfo/codec_skeleton.c
> -index a27f8da..f906f8c 100644
> ---- a/ogginfo/codec_skeleton.c
> -+++ b/ogginfo/codec_skeleton.c
> -@@ -28,6 +28,8 @@
> - 
> - #include "private.h"
> - 
> -+#include "utf8.h"
> -+
> - typedef struct {
> -     bool supported;
> -     uint16_t version_major;
> -diff --git a/share/utf8.c b/share/utf8.c
> -index be378d1..e819b67 100644
> ---- a/share/utf8.c
> -+++ b/share/utf8.c
> -@@ -28,6 +28,7 @@
> - #include <stdlib.h>
> - #include <string.h>
> - 
> -+#include "charset.h"
> - #include "utf8.h"
> - 
> - 
> --- 
> -2.43.0
> -
> diff --git a/package/vorbis-tools/vorbis-tools.hash b/package/vorbis-tools/vorbis-tools.hash
> index a4f463e466..e31daf96ac 100644
> --- a/package/vorbis-tools/vorbis-tools.hash
> +++ b/package/vorbis-tools/vorbis-tools.hash
> @@ -1,4 +1,4 @@
>  # From http://downloads.xiph.org/releases/vorbis/SHA256SUMS
> -sha256  db7774ec2bf2c939b139452183669be84fda5774d6400fc57fde37f77624f0b0  vorbis-tools-1.4.2.tar.gz
> +sha256  a1fe3ddc6777bdcebf6b797e7edfe0437954b24756ffcc8c6b816b63e0460dde  vorbis-tools-1.4.3.tar.gz
>  # Locally computed
>  sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
> diff --git a/package/vorbis-tools/vorbis-tools.mk b/package/vorbis-tools/vorbis-tools.mk
> index 936d2d816c..d64fe0b1ee 100644
> --- a/package/vorbis-tools/vorbis-tools.mk
> +++ b/package/vorbis-tools/vorbis-tools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -VORBIS_TOOLS_VERSION = 1.4.2
> +VORBIS_TOOLS_VERSION = 1.4.3
>  VORBIS_TOOLS_SITE = http://downloads.xiph.org/releases/vorbis
>  VORBIS_TOOLS_LICENSE = GPL-2.0
>  VORBIS_TOOLS_LICENSE_FILES = COPYING
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
