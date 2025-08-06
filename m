Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136BBCA0EC0
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 19:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B665484011;
	Wed,  6 Aug 2025 19:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9tMGLM7SzvUX; Wed,  6 Aug 2025 19:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 220A683FAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 220A683FAE;
	Wed,  6 Aug 2025 19:31:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8456DD79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 19:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D564400E2
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 19:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KW4vLh5LKJRW for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 19:31:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 17CAE4005E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17CAE4005E
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17CAE4005E
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 19:31:11 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b783ea5014so86626f8f.0
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 12:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754508669; x=1755113469;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=92vSyTizESzs3pEmS4AUkM4zyKdbVHzxnSeH+3Xhu1U=;
 b=ZQjq+BJAHYspqBW6IsTl8MLqMarV8m1fl+nrXM51E6ZOFh+E+BGsn+7nZ6nCQW4dg0
 5BXLBbZn+t5twTl31YYakPx2hvwwYASH/Q8rSRhbxV8JVlS5TxrqaGKcyj450S7r62E1
 oY/pJNFT8Ep4IgmfVkzkUh2y4EDA2I3XLHlwut4qRA/wZzlxKIKhMRKuL/AbeeLp6KOq
 YLWWTc05gqykiJX+4kMogIY1fr/male+liYzyemBM6WJnv2yt094Ku6tBJ4/UbKaJmvy
 A8LaH2tRpfvBhe+BHPJU9WmIjOAhEWLfUY6hPh9wOwEHfjvgp0bPl3JVTYG/uW4vjDj8
 eOFw==
X-Gm-Message-State: AOJu0YziAC0q/bOpua2OXGzwFrshUBevQGzgEEEDpY3tSUseb7xVBIYz
 Itih9ABk7wKWX2qC4IDoWRfprU21EX2YybugytfHSFR3FjsuxmlbosCin8CXAvHufHh+az3Pw8X
 h2SWJ
X-Gm-Gg: ASbGnctaBWnXd/tRtHWG+wiPhsEVs2mN5bvfrNy9feMrHtK90EvZi/JbB7uF2DVgCfE
 rZoEVlZ+gWhLWA9npALpnopWSVWpKoILYykxNRFuPdvyLm46/UgqI/ttDfRz6auRoG2NzsNZZqE
 lixMyk8F8rkIUG0MHAs3rW8azpMk9IxTIpQwmEVH6MTf5QyPrygSaTfiDZ64ESlBiFnFDHqFQRO
 Yuc0BG4jga/4UY8Ykdd3gMXlZhMPTWIjlO4BPdjObtN9OV38NhYEoKp3c3KbPZ4aCn5msrBDbTZ
 J6FbyeabFpfWoz4Y66n5MsObhCM9Mx50K87jiUqd6MufDMMS+L0OET+TXJ76oVob441NZOaij0i
 aRa91JP8Tn7pLwA==
X-Google-Smtp-Source: AGHT+IG6lfiH+tM4OeldX4wNMF1FPY5oE/rlX10MLcyhDqROVqavRYOVuDe1DKcCb4Eidm2RTrMu4Q==
X-Received: by 2002:a05:6000:258a:b0:3b7:974d:537b with SMTP id
 ffacd0b85a97d-3b8f491c316mr3504953f8f.35.1754508668907; 
 Wed, 06 Aug 2025 12:31:08 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e009e465sm15032891f8f.43.2025.08.06.12.31.08
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 12:31:08 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  6 Aug 2025 21:31:06 +0200
Message-ID: <20250806193107.528541-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754508669; x=1755113469; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=92vSyTizESzs3pEmS4AUkM4zyKdbVHzxnSeH+3Xhu1U=;
 b=VjcoSyqAghpopYFzSECuQ/gQxfip7jUAvkkMOyKe7wQP2vY6N0jqjyRLeTK6xjMB6X
 A6OTUgaQVuzmFzjGYhCdB2yPtqCY0w6QegnHfkIzfK2K27A62WhQexy7e7SZ2vtsbmj1
 JhbnPZw/myCNNA5nNX2KJSBbEAirSML9qnSHqaBKkJcZDAdl566G5pME9wTJ+bf7tt1l
 p94VhUdIqjtlLgsMP/1FaRLBO+/n3V8lRyQ0ayeMtlohjwNhxu3M7X0kV3J45R9CC5K7
 7SzQOEk8R/+OXYEIB7BSeYI0SlEk8nqTQJ6dckWG6uMsskDs4lgtFKrQxNsZmBeS0dB3
 vMWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VjcoSyqA
Subject: [Buildroot] [PATCH 1/2] package/tiff: add patch to fix CVE-2025-8176
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

Fix the following vulnerability:

- CVE-2025-8176

    A vulnerability was found in LibTIFF up to 4.7.0. It has been declared
    as critical. This vulnerability affects the function get_histogram of
    the file tools/tiffmedian.c. The manipulation leads to use after free.
    The attack needs to be approached locally. The exploit has been
    disclosed to the public and may be used. The patch is identified as
    fe10872e53efba9cc36c66ac4ab3b41a839d5172. It is recommended to apply a
    patch to fix this issue.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-8176
  - https://gitlab.com/libtiff/libtiff/-/merge_requests/727

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ip-the-first-line-of-the-input-image.patch | 116 ++++++++++++++++++
 package/tiff/tiff.mk                          |   3 +
 2 files changed, 119 insertions(+)
 create mode 100644 package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch

diff --git a/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch b/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
new file mode 100644
index 0000000000..3bc0f26772
--- /dev/null
+++ b/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
@@ -0,0 +1,116 @@
+From 3994cf3b3bc6b54c32f240ca5a412cffa11633fa Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Mon, 19 May 2025 10:53:30 -0700
+Subject: [PATCH] Don't skip the first line of the input image.  Addresses
+ issue #703
+
+Upstream: https://gitlab.com/libtiff/libtiff/-/commit/fe10872e53efba9cc36c66ac4ab3b41a839d5172.patch
+CVE: CVE-2025-8176
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ tools/tiffdither.c | 4 ++--
+ tools/tiffmedian.c | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tools/tiffdither.c b/tools/tiffdither.c
+index 714fe03d4..bfed6df18 100644
+--- a/tools/tiffdither.c
++++ b/tools/tiffdither.c
+@@ -98,7 +98,7 @@ static int fsdither(TIFF *in, TIFF *out)
+     nextptr = nextline;
+     for (j = 0; j < imagewidth; ++j)
+         *nextptr++ = *inptr++;
+-    for (i = 1; i < imagelength; ++i)
++    for (i = 0; i < imagelength; ++i)
+     {
+         tmpptr = thisline;
+         thisline = nextline;
+@@ -146,7 +146,7 @@ static int fsdither(TIFF *in, TIFF *out)
+                     nextptr[0] += v / 16;
+             }
+         }
+-        if (TIFFWriteScanline(out, outline, i - 1, 0) < 0)
++        if (TIFFWriteScanline(out, outline, i, 0) < 0)
+             goto skip_on_error;
+     }
+     goto exit_label;
+diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
+index 02b0bc2b4..f6cf26c2c 100644
+--- a/tools/tiffmedian.c
++++ b/tools/tiffmedian.c
+@@ -917,7 +917,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
+     outline = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(out));
+ 
+     GetInputLine(in, 0, goto bad); /* get first line */
+-    for (i = 1; i <= imagelength; ++i)
++    for (i = 0; i <= imagelength; ++i)
+     {
+         SWAP(short *, thisline, nextline);
+         lastline = (i >= imax);
+@@ -997,7 +997,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
+                 nextptr += 3;
+             }
+         }
+-        if (TIFFWriteScanline(out, outline, i - 1, 0) < 0)
++        if (TIFFWriteScanline(out, outline, i, 0) < 0)
+             break;
+     }
+ bad:
+-- 
+GitLab
+
+
+From ce46f002eca4148497363f80fab33f9396bcbeda Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sat, 24 May 2025 21:25:16 -0700
+Subject: [PATCH] Fix tiffmedian bug #707
+
+---
+ tools/tiffmedian.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
+index f6cf26c2c..8c9978bab 100644
+--- a/tools/tiffmedian.c
++++ b/tools/tiffmedian.c
+@@ -414,7 +414,10 @@ static void get_histogram(TIFF *in, Colorbox *box)
+     for (i = 0; i < imagelength; i++)
+     {
+         if (TIFFReadScanline(in, inputline, i, 0) <= 0)
+-            break;
++        {
++            fprintf(stderr, "Error reading scanline\n");
++            exit(EXIT_FAILURE);
++        }
+         inptr = inputline;
+         for (j = imagewidth; j-- > 0;)
+         {
+-- 
+GitLab
+
+
+From ecc4ddbf1f0fed7957d1e20361e37f01907898e0 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sat, 24 May 2025 21:38:09 -0700
+Subject: [PATCH] conflict resolution
+
+---
+ tools/tiffmedian.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
+index 8c9978bab..47e0524bc 100644
+--- a/tools/tiffmedian.c
++++ b/tools/tiffmedian.c
+@@ -920,7 +920,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
+     outline = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(out));
+ 
+     GetInputLine(in, 0, goto bad); /* get first line */
+-    for (i = 0; i <= imagelength; ++i)
++    for (i = 0; i < imagelength; ++i)
+     {
+         SWAP(short *, thisline, nextline);
+         lastline = (i >= imax);
+-- 
+GitLab
+
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 5d7219d7da..fe35ed01b5 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -13,6 +13,9 @@ TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
+# 0001-don-t-skip-the-first-line-of-the-input-image.patch
+TIFF_IGNORE_CVES += CVE-2025-8176
+
 # webp has a (optional) dependency on tiff, so we can't have webp
 # support in tiff, or that would create a circular dependency.
 TIFF_CONF_OPTS = \
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
