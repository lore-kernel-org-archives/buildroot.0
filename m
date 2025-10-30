Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022B7CCF9F8
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCFB24105A;
	Thu, 30 Oct 2025 08:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JaRFZCGZ8l2a; Thu, 30 Oct 2025 08:23:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8E6840FFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8E6840FFE;
	Thu, 30 Oct 2025 08:23:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F588160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0643183FA9
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnAIuC-YiP5D for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:23:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB4EF83F79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB4EF83F79
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB4EF83F79
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:45 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b70406feed3so212786166b.3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 01:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812623; x=1762417423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mZernarRK6DWQNraIbM36/AVH4XjKbMb7HzCS86gI1M=;
 b=Zqy7W8vWXQ/cQKBUppYORz55ECPEJDA8nFgPhmvp5lwZ79L74rJIZJXEu06tF8w8rI
 /DSH4BC3eh9abI/RHQYvQeG/4tBCNV3CwP7Jfs0wCIk17kUA1rf3epeTKoDyus7gGOve
 o2dnAY8nnLixVSR6/sAddrR2vyW2AKmi6Qpdiq7jvcHwtIlX9qgHsNnCiJAQOTNaLMpb
 llpJzIUl59jdjMDnyiMyvYJnvHyaKq6dzg3uO8uCrg2rs8f2SyfLExxEt8rVUJXJxrDq
 RAakGUbvotQZb9v3VUa+YkAg9FgyJvRleChHplSgZPpIS1wmqOw6dgH7raC/IlQgbGqY
 mmQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwInrkDtD1JoMDAY4p22J7m/OLeNRqToQjRSIKeS8+u8IGp/3+L6S3Na5TNXEjQuSLcX6WcI962TQ=@buildroot.org
X-Gm-Message-State: AOJu0YyUCnFwYqySvfsudWAr58l9YijHE8cuWHI25mPPYbNMd20AQdTY
 gj779aW1NxmuprzPAGvuWTgbdZnJyNnYbsDCTSpUqL539InPqOlZtw8jBBGLZuBrnDU=
X-Gm-Gg: ASbGncvf6EXqcbTA8R2eXzy1bplaJFJ/TTaNt4Au81Db1axKAFWpH+e5Di2BkiaMFNz
 Bv0toLDJTdY+OL3CvmCnL/M/GIOLxGXvhWCiq5Sbzqvnn6ODfJ4s7QSnvaCJ4ZJDRFNYjSyHH05
 TYKAlR81hHx+AyS1HI9lP0AbtotYzuLwq0a+qNifyHzBlyUdIw2tZQWh50RzZUUuNyIGycjLxzB
 PWpsgA6wnfhpRctvJ0w743xOv9mIrtXGEjWKK/vGgNEujCLHqwdQ3OX9WU17AQPlZCgBXFb/cIj
 Cto8bun4WaOasJKp7FHHQUDjKoEHua4h1EPbRzwFz6V9oqK5kx+dsQsE+IWrOIOcgtoQ1VsDnjX
 2Ms5NommFM7aVGuq8MshcVd6zi0ZvF/VzHuzsvUGQKu2tik5ez8yqLrwXNuJN64T/Bqi2bd9yBt
 5fPd57lwb/dMIHHzpOKgzNO2XwpA==
X-Google-Smtp-Source: AGHT+IExR0Y7kjyCaB7fr1hSaopbD79PjgTLbSPuJwfexiaUhH3jlHDVO7zpyPFKgBg4V4oo/GhsSg==
X-Received: by 2002:a17:907:3e8b:b0:b60:18d5:42a8 with SMTP id
 a640c23a62f3a-b7053ea06f5mr214861066b.55.1761812623445; 
 Thu, 30 Oct 2025 01:23:43 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e8036cdd4sm14156068a12.22.2025.10.30.01.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 01:23:43 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:23:42 +0100
Message-ID: <20251030082342.34760-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016115601.228048-1-titouan.christophe@mind.be>
References: <20251016115601.228048-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761812623; x=1762417423; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mZernarRK6DWQNraIbM36/AVH4XjKbMb7HzCS86gI1M=;
 b=fspdMQ153mBoMIe1U+Onx5DZYwQpgrjpYB/+MYXpLnUTW/8q84xE0bdvZ85QxR7EzV
 P4Hc5JCVm6IqVYxlltxFMEYu2D0Rw5Lpj5zBFWz40fPUhf+u0tUDRDCghLTiqvjeStFD
 9vrQd+z6qb4pBWft0wpLJb3CBGXxM2kQwZGe/h9/6SY4dlHL9N+Qw2zDUQBDIGTUBHLh
 WHiULEoATHp1gbK0C9v43wpVXpeTy3XyMNrfO9jY67XcGj9/bbeDjaD7pb87yyItcWp9
 PmA2Hz2d6sRTr1rdLfKMMFLvpIkTmHdm5zqTFi1mjiaPbHr4JmQ9hwGnxUvWJJ2VWu0u
 QDJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fspdMQ15
Subject: Re: [Buildroot] [PATCH] package/poppler: bump to v25.10.0
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
> This contains many bug and security fixes since v22.12.0.
> See the release notes: https://poppler.freedesktop.org/releases.html
> 
> In addition:
> - Drop patch that has been applied upstream
> - Update a few cmake configuration options that changed upstream
> 
> There is currently a build failure when enabling gpgme, so disable it
> unconditionally for now.
> 
> Finally, this fixes the following vulnerabilities:
> - CVE-2024-6239:
>     A flaw was found in the Poppler's Pdfinfo utility. This issue occurs
>     when using -dests parameter with pdfinfo utility. By using certain
>     malformed input files, an attacker could cause the utility to crash,
>     leading to a denial of service.
>     https://www.cve.org/CVERecord?id=CVE-2024-6239
> 
> - CVE-2024-56378:
>     libpoppler.so in Poppler through 24.12.0 has an out-of-bounds read
>     vulnerability within the JBIG2Bitmap::combine function in
>     JBIG2Stream.cc.
>     https://www.cve.org/CVERecord?id=CVE-2024-56378
> 
> - CVE-2025-32364:
>     A floating-point exception in the PSStack::roll function of Poppler
>     before 25.04.0 can cause an application to crash when handling
>     malformed inputs associated with INT_MIN.
>     https://www.cve.org/CVERecord?id=CVE-2025-32364
> 
> - CVE-2025-32365:
>     Poppler before 25.04.0 allows crafted input files to trigger out-of-
>     bounds reads in the JBIG2Bitmap::combine function in JBIG2Stream.cc
>     because of a misplaced isOk check.
>     https://www.cve.org/CVERecord?id=CVE-2025-32365
> 
> - CVE-2025-43903:
>     NSSCryptoSignBackend.cc in Poppler before 25.04.0 does not verify the
>     adbe.pkcs7.sha1 signatures on documents, resulting in potential
>     signature forgeries.
>     https://www.cve.org/CVERecord?id=CVE-2025-43903
> 
> - CVE-2025-50420:
>     An issue in the pdfseparate utility of freedesktop poppler v25.04.0
>     allows attackers to cause an infinite recursion via supplying a
>     crafted PDF file. This can lead to a Denial of Service (DoS).
>     https://www.cve.org/CVERecord?id=CVE-2025-50420
> 
> - CVE-2025-52886:
>     Poppler is a PDF rendering library. Versions prior to 25.06.0 use
>     `std::atomic_int` for reference counting. Because `std::atomic_int` is
>     only 32 bits, it is possible to overflow the reference count and
>     trigger a use-after-free. Version 25.06.0 patches the issue.
>     https://www.cve.org/CVERecord?id=CVE-2025-52886
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.08.x. Thanks

> ---
>  ...em-open-Fix-crash-on-malformed-files.patch | 45 -------------------
>  package/poppler/poppler.hash                  |  4 +-
>  package/poppler/poppler.mk                    | 24 ++++++----
>  3 files changed, 17 insertions(+), 56 deletions(-)
>  delete mode 100644 package/poppler/0001-OutlineItem-open-Fix-crash-on-malformed-files.patch
> 
> diff --git a/package/poppler/0001-OutlineItem-open-Fix-crash-on-malformed-files.patch b/package/poppler/0001-OutlineItem-open-Fix-crash-on-malformed-files.patch
> deleted file mode 100644
> index 478759e0cc..0000000000
> --- a/package/poppler/0001-OutlineItem-open-Fix-crash-on-malformed-files.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From e5cc11e0b5b867f4705fd28ff1b981c1224be1cd Mon Sep 17 00:00:00 2001
> -From: Albert Astals Cid <aacid@kde.org>
> -Date: Wed, 17 May 2023 22:42:05 +0200
> -Subject: [PATCH] OutlineItem::open: Fix crash on malformed files
> -
> -Fixes #1399
> -
> -Upstream: https://gitlab.freedesktop.org/poppler/poppler/-/commit/591235c8b6c65a2eee88991b9ae73490fd9afdfe
> -[Thomas: backported to fix CVE-2023-34872]
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - poppler/Outline.cc | 10 +++++++---
> - 1 file changed, 7 insertions(+), 3 deletions(-)
> -
> -diff --git a/poppler/Outline.cc b/poppler/Outline.cc
> -index cbb6cb49..4c68be99 100644
> ---- a/poppler/Outline.cc
> -+++ b/poppler/Outline.cc
> -@@ -14,7 +14,7 @@
> - // under GPL version 2 or later
> - //
> - // Copyright (C) 2005 Marco Pesenti Gritti <mpg@redhat.com>
> --// Copyright (C) 2008, 2016-2019, 2021 Albert Astals Cid <aacid@kde.org>
> -+// Copyright (C) 2008, 2016-2019, 2021, 2023 Albert Astals Cid <aacid@kde.org>
> - // Copyright (C) 2009 Nick Jones <nick.jones@network-box.com>
> - // Copyright (C) 2016 Jason Crain <jason@aquaticape.us>
> - // Copyright (C) 2017 Adrian Johnson <ajohnson@redneon.com>
> -@@ -483,8 +483,12 @@ void OutlineItem::open()
> - {
> -     if (!kids) {
> -         Object itemDict = xref->fetch(ref);
> --        const Object &firstRef = itemDict.dictLookupNF("First");
> --        kids = readItemList(this, &firstRef, xref, doc);
> -+        if (itemDict.isDict()) {
> -+            const Object &firstRef = itemDict.dictLookupNF("First");
> -+            kids = readItemList(this, &firstRef, xref, doc);
> -+        } else {
> -+            kids = new std::vector<OutlineItem *>();
> -+        }
> -     }
> - }
> - 
> --- 
> -2.41.0
> -
> diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
> index bb07b2ee6a..34f8bcd58f 100644
> --- a/package/poppler/poppler.hash
> +++ b/package/poppler/poppler.hash
> @@ -1,3 +1,3 @@
> -# Locally calculated
> -sha256  d9aa9cacdfbd0f8e98fc2b3bb008e645597ed480685757c3e7bc74b4278d15c0  poppler-22.12.0.tar.xz
> +# Locally calculated after verifying GPG signature
> +sha256  6b5e9bb64dabb15787a14db1675291c7afaf9387438cc93a4fb7f6aec4ee6fe0  poppler-25.10.0.tar.xz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
> index 776fb4d566..08214d38b4 100644
> --- a/package/poppler/poppler.mk
> +++ b/package/poppler/poppler.mk
> @@ -4,15 +4,13 @@
>  #
>  ################################################################################
>  
> -POPPLER_VERSION = 22.12.0
> +POPPLER_VERSION = 25.10.0
>  POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
>  POPPLER_SITE = https://poppler.freedesktop.org
>  POPPLER_DEPENDENCIES = fontconfig host-pkgconf
>  POPPLER_LICENSE = GPL-2.0+
>  POPPLER_LICENSE_FILES = COPYING
>  POPPLER_CPE_ID_VENDOR = freedesktop
> -# 0001-OutlineItem-open-Fix-crash-on-malformed-files.patch
> -POPPLER_IGNORE_CVES += CVE-2023-34872
>  POPPLER_INSTALL_STAGING = YES
>  
>  POPPLER_CONF_OPTS = \
> @@ -24,6 +22,7 @@ POPPLER_CONF_OPTS = \
>  	-DBUILD_MANUAL_TESTS=OFF \
>  	-DENABLE_GTK_DOC=OFF \
>  	-DENABLE_QT6=OFF \
> +	-DENABLE_GPGME=OFF \
>  	-DRUN_GPERF_IF_PRESENT=OFF
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> @@ -98,9 +97,9 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  POPPLER_DEPENDENCIES += zlib
> -POPPLER_CONF_OPTS += -DENABLE_ZLIB=ON
> +POPPLER_CONF_OPTS += -DENABLE_ZLIB_UNCOMPRESS=ON
>  else
> -POPPLER_CONF_OPTS += -DENABLE_ZLIB=OFF
> +POPPLER_CONF_OPTS += -DENABLE_ZLIB_UNCOMPRESS=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_CAIRO),y)
> @@ -112,9 +111,9 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_TIFF),y)
>  POPPLER_DEPENDENCIES += tiff
> -POPPLER_CONF_OPTS += -DWITH_TIFF=ON
> +POPPLER_CONF_OPTS += -DENABLE_LIBTIFF=ON
>  else
> -POPPLER_CONF_OPTS += -DWITH_TIFF=OFF
> +POPPLER_CONF_OPTS += -DENABLE_LIBTIFF=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
> @@ -126,9 +125,16 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_LIBNSS),y)
>  POPPLER_DEPENDENCIES += libnss
> -POPPLER_CONF_OPTS += -DWITH_NSS3=ON
> +POPPLER_CONF_OPTS += -DENABLE_NSS3=ON
>  else
> -POPPLER_CONF_OPTS += -DWITH_NSS3=OFF
> +POPPLER_CONF_OPTS += -DENABLE_NSS3=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LCMS2),y)
> +POPPLER_DEPENDENCIES += lcms2
> +POPPLER_CONF_OPTS += -DENABLE_LCMS=ON
> +else
> +POPPLER_CONF_OPTS += -DENABLE_LCMS=OFF
>  endif
>  
>  ifeq ($(BR2_SOFT_FLOAT),y)
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
