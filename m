Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5871C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 20:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6873660A7D;
	Wed,  6 Aug 2025 20:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YuBwL7CKsmn7; Wed,  6 Aug 2025 20:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D1F661CC8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D1F661CC8;
	Wed,  6 Aug 2025 20:20:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A0FED79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 20:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10FA241EE5
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 20:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpeW1eyAf8FB for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 20:20:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD16341F39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD16341F39
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD16341F39
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 20:20:32 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-459ddf83023so2025015e9.0
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 13:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754511630; x=1755116430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=poLebK0b/Uy22FTiNnON0zwGjQreynmrOCJMr1yIndM=;
 b=RVzZPXNCKwFu4Z8XSk9dCbEWUAxi8aHtXeByDGt12s2I4d0fTUuIqHv6X0QdbS8Qb8
 wbzbGozn4/KjkCv48ECQDiu5dC2HvF+HY9KAoj7YG9uX+VJMc+Fqh9kSKCjavdJ/lGsd
 +KAE/heYYzLrOClwVnixjgmbTeZKDrs57onUywo4eyf2XaH0NSfTWlv0bzxn3AWk3cvr
 yts3uWlJPCw046dTj5ISW8sM/xAhgTOsu1ZCJcafwciOwn00TENQ4kxRzLyVjUOB0K4H
 c8igaP0Om9Ic2Q2uAr6EmHhv4Zssh4pvJPsN8rQaihRxwH75HJO5+yIek5kAJNn5r1c7
 +mcA==
X-Gm-Message-State: AOJu0Yy8K8JKV0JX0vXvvXtYlSdlWTE7zOPuBEHZPmJkykwXDu4rW/8N
 nDhL2sEIgocZrn2ZFRXhcr8rp1bLzqmhtI9VXXEu9snAk5VHbLtswxSQvWs0e+OmrC+g0ARl+fV
 kxI3T
X-Gm-Gg: ASbGncv6vz3UYTmZJ6zXSS4DvV25dfvoNLw0MkFo/txmEqesJXbQ6Zf53q7UvRn+/BD
 f7zhiAQ07QWkWWPH+gQKR6Fce+m+xTRkWqyLXdRTdiR8Vd+j7FrBkLAIHk/RNzIxg/gaBiRAayh
 SpsHXIK5loP4PvZQVacKDjfJZnBaAg9xNIN6lx/DytR+WaIsCedCy+e6eGbBnBIMjl/qH1jYV43
 pV49Qtzm9TFm2j6A2kIfs1Ugc5HaoLw2g/8cky5Z17yskxLi0MYl2p004BZp9aDb7ucVXHmFAoC
 lpeQLGyUIJ3YRDcEtZ4QdZ2uR1lyy4JAHJ2W0nxg5nOjxnFEcJAMHCi27xiy/cV85/gfv/iSfYr
 4AWv3sLfOH3KAow==
X-Google-Smtp-Source: AGHT+IFFGDHI59sEzGwwqOI27KrLgZYE2QZhWwoZIZov4lZ9TnKc5jEAXPQuAmuV1qhLtu4bfEqltA==
X-Received: by 2002:a05:600c:5254:b0:456:1b93:76b with SMTP id
 5b1f17b1804b1-459e7440a7cmr40027095e9.4.1754511630164; 
 Wed, 06 Aug 2025 13:20:30 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3bf93dsm24194029f8f.27.2025.08.06.13.20.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 13:20:29 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  6 Aug 2025 22:20:28 +0200
Message-ID: <20250806202029.625736-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754511630; x=1755116430; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=poLebK0b/Uy22FTiNnON0zwGjQreynmrOCJMr1yIndM=;
 b=Pza5ql5OBIYdbbp7EaY7A3yA9xXZFyUjzt+Zdsajt3W5E/kIFUOeA6VtVra5LUbuvB
 lnzRVWSPrGVNb/XTOqSJC2Phu96BGPjYh1AsCRnph/vc/Yj+yOI4xgnFexaPnzSFNsFd
 /bMNntITwHFy/24fm61z+AJkSandUDbXp1zJRCizPxnlwMa120W6n2BjEjuhLe+PIyqU
 lBB/IvkeInZSaKbK7TKOXlrBzHPbWHUyCjYJuXMIoe8ISnYf6KFvBDvFVxl4qvaRh0VC
 eD+9VDqJvLI3XP2BGATX3CmZGNtLVBxZ95I+MeZKYHVI/zTOvwdm7VIWq0m5eXbrgrtv
 bV5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Pza5ql5O
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
v1 -> v2: split the CVE-2025-8176 fix into multiple patches
---
 ...ip-the-first-line-of-the-input-image.patch | 61 +++++++++++++++++++
 package/tiff/0002-fix-tiffmedian-bug.patch    | 31 ++++++++++
 package/tiff/0003-conflict-resolution.patch   | 28 +++++++++
 package/tiff/tiff.mk                          |  3 +
 4 files changed, 123 insertions(+)
 create mode 100644 package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
 create mode 100644 package/tiff/0002-fix-tiffmedian-bug.patch
 create mode 100644 package/tiff/0003-conflict-resolution.patch

diff --git a/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch b/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
new file mode 100644
index 0000000000..bdf4bd8e94
--- /dev/null
+++ b/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
@@ -0,0 +1,61 @@
+From 3994cf3b3bc6b54c32f240ca5a412cffa11633fa Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Mon, 19 May 2025 10:53:30 -0700
+Subject: [PATCH] Don't skip the first line of the input image.  Addresses
+ issue #703
+
+Upstream: https://gitlab.com/libtiff/libtiff/-/commit/3994cf3b3bc6b54c32f240ca5a412cffa11633fa
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
diff --git a/package/tiff/0002-fix-tiffmedian-bug.patch b/package/tiff/0002-fix-tiffmedian-bug.patch
new file mode 100644
index 0000000000..880bade7d8
--- /dev/null
+++ b/package/tiff/0002-fix-tiffmedian-bug.patch
@@ -0,0 +1,31 @@
+From ce46f002eca4148497363f80fab33f9396bcbeda Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sat, 24 May 2025 21:25:16 -0700
+Subject: [PATCH] Fix tiffmedian bug #707
+
+Upstream: https://gitlab.com/libtiff/libtiff/-/merge_requests/727/diffs?commit_id=ce46f002eca4148497363f80fab33f9396bcbeda
+CVE: CVE-2025-8176
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
diff --git a/package/tiff/0003-conflict-resolution.patch b/package/tiff/0003-conflict-resolution.patch
new file mode 100644
index 0000000000..0c16aa3271
--- /dev/null
+++ b/package/tiff/0003-conflict-resolution.patch
@@ -0,0 +1,28 @@
+From ecc4ddbf1f0fed7957d1e20361e37f01907898e0 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sat, 24 May 2025 21:38:09 -0700
+Subject: [PATCH] conflict resolution
+
+Upstream: https://gitlab.com/libtiff/libtiff/-/merge_requests/727/diffs?commit_id=ecc4ddbf1f0fed7957d1e20361e37f01907898e0
+CVE: CVE-2025-8176
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
index 5d7219d7da..bd95fdca7f 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -13,6 +13,9 @@ TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
+# 0001-don-t-skip-the-first-line-of-the-input-image.patch, 0002-fix-tiffmedian-bug.patch, 0003-conflict-resolution.patch
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
