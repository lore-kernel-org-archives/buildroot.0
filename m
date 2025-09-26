Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC66CAC5B8
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 16:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2704F84C83;
	Fri, 26 Sep 2025 16:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qSiIaDsMWW8G; Fri, 26 Sep 2025 16:32:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E48684CD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E48684CD5;
	Fri, 26 Sep 2025 16:32:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C153C198
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 16:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A738D84C83
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 16:32:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTM2KNMWvygQ for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 16:32:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4358C84C89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4358C84C89
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4358C84C89
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 16:32:42 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e3af7889fso8541265e9.2
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 09:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758904361; x=1759509161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bL+SKlIUPbJ4r4hGSWXSHOn5hTRENBocvXMpL0nOyKQ=;
 b=tILcE7nqljBrihrF8YqRnKI/hsZgvrvDJdJRMOJCjWMTIqp2gKMupCf2jhorEkOn5R
 2iKTLGYXrwCsz3AxTlMkr0568Oytj16JIKjl4xipcn19Y0ON4nB7L90Q1JkBt92mL77B
 IeUzkWNz3R+eo9gFXu7xrp7Qun1K0DYVIgoRqFlcplHrYYPQj7RYo0a6TZNzGuys8UJ8
 nX4PdnvaPYWLH15Zh9Ef+n2r5XRaEaZzplPNrM3vwJNT608MbjFVxyav1xTDniemIkje
 8ogQLR9tkuSXm+wuUCWnkr28+ZOgzFCK2uC6E0j/wsucSh09i0bXZLExkPwQYaAo6Ajl
 E6ww==
X-Gm-Message-State: AOJu0YyUlVWihv2ccLWL5P6MKbyjMn0ylEHG9JQyAfVWshhWoiaOutL6
 2ZZnKjOy6J9B/8fS7IrfyDnsVeMaH18iLEG24Vuc8xIvGsDYbkNKdUWp7sflqzKPyTW2PQi/waz
 94KqgVYs=
X-Gm-Gg: ASbGncucjizXkx+rEhz40o20kcEdpVoFtnta57mgyuQbFSiOte3huhY0GqosyhNXBp5
 s1b8qxzL247/BsH0BAusBUtMveBXprmhNTu7UDTCQNOfOtjQMzDo6HACCEmh/P8Z5oMUth05PiT
 0KVluOP+XC/z9KeVNtc2AI7HMw7royiqHO3THM6FsaXHvoSqYDwXPkZCcGbuSmZZV5hE4lU+GBq
 h0poVmJwQMX9FxbgbMQi7VUSDFSSAIOChAhqOfzTQ3n+461j20Q/oU9nKBi0+QCt8GPUKmB44uD
 WvD+RPGIBNYOLCneg1tQog6/8GjrPNHhKQ9Dki2RfEB9dnbLSd0pFbKyz69FI25rS9SYDYvL4rY
 zZmy+TAz5u6PDnyA=
X-Google-Smtp-Source: AGHT+IEbzKv6hkl33dgsN/8arfWtPNrjGvRUJBaenNumZwUsRjTvt8cmWtfc+S25JfH73LUoY7/V9A==
X-Received: by 2002:a05:600c:8b58:b0:45d:e326:96fb with SMTP id
 5b1f17b1804b1-46e32a17d2bmr85078045e9.30.1758904360653; 
 Fri, 26 Sep 2025 09:32:40 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab31ea3sm121249955e9.12.2025.09.26.09.32.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 09:32:40 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 26 Sep 2025 18:32:39 +0200
Message-ID: <20250926163239.162734-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926163239.162734-1-thomas.perale@mind.be>
References: <20250926163239.162734-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758904361; x=1759509161; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bL+SKlIUPbJ4r4hGSWXSHOn5hTRENBocvXMpL0nOyKQ=;
 b=eoerdbkYH2Eas/yj4hNZzpC87gPbwgOb7jKgq0DxBrOk8R9AsGPGiY9ovlaTXR8Eck
 tyT/pV8RuRRGy2X/3ThR2PZVnbkM7VNd3uv4wtW67u6pQ5uS6LS5PKGBENIOqc/wFOUc
 mOvxQ+Tv8VFfNT0W6cNFnLKTfrO7S9hSTbGhIFG1qQHZ7o3r98CC8+w17Tuyrb4EBqrI
 dLg/ApnixjAxA6vpk3fF2fCHMmcWZ9VZSk5A/fpD/yQaIRh5CbXAc0E7ZE/2HWflp7GU
 COLqxT0mx+VJtASe6/MkP+UTaO7jBvS55TLY5VezQlxK9cZLDBsGc0HS/pta84+kdF4Z
 CMPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eoerdbkY
Subject: [Buildroot] [PATCH 2/2] package/tiff: security bump to v4.7.1
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

For more details on the version bump, see:
  - https://gitlab.com/libtiff/libtiff/-/releases/v4.7.1

This bump includes the security fix for CVE-2025-8176, CVE-2025-8177
that were addressed in commit [1][2].

Also fixes the following vulnerabilities:

- CVE-2024-13978

    A vulnerability was found in LibTIFF up to 4.7.0. It has been
    declared as problematic. Affected by this vulnerability is the
    function t2p_read_tiff_init of the file tools/tiff2pdf.c of the
    component fax2ps. The manipulation leads to null pointer
    dereference. The attack needs to be approached locally. The
    complexity of an attack is rather high. The exploitation appears to
    be difficult. The patch is named
    2ebfffb0e8836bfb1cd7d85c059cd285c59761a4. It is recommended to apply
    a patch to fix this issue.

For more information, see:
  - https://nvd.nist.gov//vuln/detail/CVE-2024-13978
  - https://gitlab.com/libtiff/libtiff/-/commit/2ebfffb0e8836bfb1cd7d85c059cd285c59761a4

- CVE-2025-8961

    A weakness has been identified in LibTIFF 4.7.0. This affects the
    function main of the file tiffcrop.c of the component tiffcrop.
    Executing manipulation can lead to memory corruption. The attack can
    only be executed locally. The exploit has been made available to the
    public and could be exploited.

For more information, see:
  - https://nvd.nist.gov//vuln/detail/CVE-2025-8961
  - https://gitlab.com/libtiff/libtiff/-/commit/0ac97aa7a5bffddd88f7cdbe517264e9db3f5bd5

- CVE-2025-9165

    A flaw has been found in LibTIFF 4.7.0. This affects the function
    _TIFFmallocExt/_TIFFCheckRealloc/TIFFHashSetNew/InitCCITTFax3 of the
    file tools/tiffcmp.c of the component tiffcmp. Executing
    manipulation can lead to memory leak. The attack is restricted to
    local execution. The exploit has been published and may be used.
    This patch is called ed141286a37f6e5ddafb5069347ff5d587e7a4e0. It is
    best practice to apply a patch to resolve this issue.

For more information, see:
  - https://nvd.nist.gov//vuln/detail/CVE-2025-9165
  - https://gitlab.com/libtiff/libtiff/-/commit/ed141286a37f6e5ddafb5069347ff5d587e7a4e0

[1] b3974df966 package/tiff: add patches to fix CVE-2025-8176
[2] 3db725d71d package/tiff: add patch to fix CVE-2025-8177

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ip-the-first-line-of-the-input-image.patch | 61 -------------------
 package/tiff/0002-fix-tiffmedian-bug.patch    | 31 ----------
 package/tiff/0003-conflict-resolution.patch   | 28 ---------
 .../tiff/0004-fix-for-thumbnail-issue.patch   | 35 -----------
 package/tiff/tiff.hash                        |  4 +-
 package/tiff/tiff.mk                          |  8 +--
 6 files changed, 3 insertions(+), 164 deletions(-)
 delete mode 100644 package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
 delete mode 100644 package/tiff/0002-fix-tiffmedian-bug.patch
 delete mode 100644 package/tiff/0003-conflict-resolution.patch
 delete mode 100644 package/tiff/0004-fix-for-thumbnail-issue.patch

diff --git a/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch b/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
deleted file mode 100644
index bdf4bd8e94..0000000000
--- a/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 3994cf3b3bc6b54c32f240ca5a412cffa11633fa Mon Sep 17 00:00:00 2001
-From: Lee Howard <faxguy@howardsilvan.com>
-Date: Mon, 19 May 2025 10:53:30 -0700
-Subject: [PATCH] Don't skip the first line of the input image.  Addresses
- issue #703
-
-Upstream: https://gitlab.com/libtiff/libtiff/-/commit/3994cf3b3bc6b54c32f240ca5a412cffa11633fa
-CVE: CVE-2025-8176
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- tools/tiffdither.c | 4 ++--
- tools/tiffmedian.c | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/tools/tiffdither.c b/tools/tiffdither.c
-index 714fe03d4..bfed6df18 100644
---- a/tools/tiffdither.c
-+++ b/tools/tiffdither.c
-@@ -98,7 +98,7 @@ static int fsdither(TIFF *in, TIFF *out)
-     nextptr = nextline;
-     for (j = 0; j < imagewidth; ++j)
-         *nextptr++ = *inptr++;
--    for (i = 1; i < imagelength; ++i)
-+    for (i = 0; i < imagelength; ++i)
-     {
-         tmpptr = thisline;
-         thisline = nextline;
-@@ -146,7 +146,7 @@ static int fsdither(TIFF *in, TIFF *out)
-                     nextptr[0] += v / 16;
-             }
-         }
--        if (TIFFWriteScanline(out, outline, i - 1, 0) < 0)
-+        if (TIFFWriteScanline(out, outline, i, 0) < 0)
-             goto skip_on_error;
-     }
-     goto exit_label;
-diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
-index 02b0bc2b4..f6cf26c2c 100644
---- a/tools/tiffmedian.c
-+++ b/tools/tiffmedian.c
-@@ -917,7 +917,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
-     outline = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(out));
- 
-     GetInputLine(in, 0, goto bad); /* get first line */
--    for (i = 1; i <= imagelength; ++i)
-+    for (i = 0; i <= imagelength; ++i)
-     {
-         SWAP(short *, thisline, nextline);
-         lastline = (i >= imax);
-@@ -997,7 +997,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
-                 nextptr += 3;
-             }
-         }
--        if (TIFFWriteScanline(out, outline, i - 1, 0) < 0)
-+        if (TIFFWriteScanline(out, outline, i, 0) < 0)
-             break;
-     }
- bad:
--- 
-GitLab
-
diff --git a/package/tiff/0002-fix-tiffmedian-bug.patch b/package/tiff/0002-fix-tiffmedian-bug.patch
deleted file mode 100644
index 880bade7d8..0000000000
--- a/package/tiff/0002-fix-tiffmedian-bug.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ce46f002eca4148497363f80fab33f9396bcbeda Mon Sep 17 00:00:00 2001
-From: Lee Howard <faxguy@howardsilvan.com>
-Date: Sat, 24 May 2025 21:25:16 -0700
-Subject: [PATCH] Fix tiffmedian bug #707
-
-Upstream: https://gitlab.com/libtiff/libtiff/-/merge_requests/727/diffs?commit_id=ce46f002eca4148497363f80fab33f9396bcbeda
-CVE: CVE-2025-8176
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- tools/tiffmedian.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
-index f6cf26c2c..8c9978bab 100644
---- a/tools/tiffmedian.c
-+++ b/tools/tiffmedian.c
-@@ -414,7 +414,10 @@ static void get_histogram(TIFF *in, Colorbox *box)
-     for (i = 0; i < imagelength; i++)
-     {
-         if (TIFFReadScanline(in, inputline, i, 0) <= 0)
--            break;
-+        {
-+            fprintf(stderr, "Error reading scanline\n");
-+            exit(EXIT_FAILURE);
-+        }
-         inptr = inputline;
-         for (j = imagewidth; j-- > 0;)
-         {
--- 
-GitLab
-
diff --git a/package/tiff/0003-conflict-resolution.patch b/package/tiff/0003-conflict-resolution.patch
deleted file mode 100644
index 0c16aa3271..0000000000
--- a/package/tiff/0003-conflict-resolution.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ecc4ddbf1f0fed7957d1e20361e37f01907898e0 Mon Sep 17 00:00:00 2001
-From: Lee Howard <faxguy@howardsilvan.com>
-Date: Sat, 24 May 2025 21:38:09 -0700
-Subject: [PATCH] conflict resolution
-
-Upstream: https://gitlab.com/libtiff/libtiff/-/merge_requests/727/diffs?commit_id=ecc4ddbf1f0fed7957d1e20361e37f01907898e0
-CVE: CVE-2025-8176
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- tools/tiffmedian.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
-index 8c9978bab..47e0524bc 100644
---- a/tools/tiffmedian.c
-+++ b/tools/tiffmedian.c
-@@ -920,7 +920,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
-     outline = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(out));
- 
-     GetInputLine(in, 0, goto bad); /* get first line */
--    for (i = 0; i <= imagelength; ++i)
-+    for (i = 0; i < imagelength; ++i)
-     {
-         SWAP(short *, thisline, nextline);
-         lastline = (i >= imax);
--- 
-GitLab
-
diff --git a/package/tiff/0004-fix-for-thumbnail-issue.patch b/package/tiff/0004-fix-for-thumbnail-issue.patch
deleted file mode 100644
index 237306f6c2..0000000000
--- a/package/tiff/0004-fix-for-thumbnail-issue.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From e8de4dc1f923576dce9d625caeebd93f9db697e1 Mon Sep 17 00:00:00 2001
-From: Lee Howard <faxguy@howardsilvan.com>
-Date: Wed, 25 Jun 2025 17:14:18 +0000
-Subject: [PATCH] Fix for thumbnail issue #715
-
-CVE: CVE-2025-8177
-Upstream: https://gitlab.com/libtiff/libtiff/-/commit/e8de4dc1f923576dce9d625caeebd93f9db697e1
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- tools/thumbnail.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/tools/thumbnail.c b/tools/thumbnail.c
-index 9cade913..7e21f521 100644
---- a/tools/thumbnail.c
-+++ b/tools/thumbnail.c
-@@ -620,7 +620,15 @@ static void setrow(uint8_t *row, uint32_t nrows, const uint8_t *rows[])
-             }
-             acc += bits[*src & mask1];
-         }
--        *row++ = cmap[(255 * acc) / area];
-+        if (255 * acc / area < 256)
-+        {
-+            *row++ = cmap[(255 * acc) / area];
-+        }
-+        else
-+        {
-+            fprintf(stderr, "acc=%d, area=%d\n", acc, area);
-+            *row++ = cmap[0];
-+        }
-     }
- }
- 
--- 
-GitLab
diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index 5e2dcca73c..d156f16226 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking pgp signature
-# https://download.osgeo.org/libtiff/tiff-4.7.0.tar.xz.sig
+# https://download.osgeo.org/libtiff/tiff-4.7.1.tar.xz.sig
 # with key: B1FA7D81EEB8E66399178B9733EBBFC47B3DD87D
-sha256  273a0a73b1f0bed640afee4a5df0337357ced5b53d3d5d1c405b936501f71017  tiff-4.7.0.tar.xz
+sha256  b92017489bdc1db3a4c97191aa4b75366673cb746de0dce5d7a749d5954681ba  tiff-4.7.1.tar.xz
 sha256  0780558a8bfba0af1160ec1ff11ade4f41c0d7deafd6ecfc796b492a788e380d  LICENSE.md
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index dd23c2bd43..32bebcf95f 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.7.0
+TIFF_VERSION = 4.7.1
 TIFF_SOURCE = tiff-$(TIFF_VERSION).tar.xz
 TIFF_SITE = https://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
@@ -13,12 +13,6 @@ TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
-# 0001-don-t-skip-the-first-line-of-the-input-image.patch, 0002-fix-tiffmedian-bug.patch, 0003-conflict-resolution.patch
-TIFF_IGNORE_CVES += CVE-2025-8176
-
-# 0004-fix-for-thumbnail-issue.patch
-TIFF_IGNORE_CVES += CVE-2025-8177
-
 # Fixed in 4.7.0
 TIFF_IGNORE_CVES += CVE-2025-8851
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
