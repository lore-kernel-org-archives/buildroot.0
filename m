Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AFAC43334
	for <buildroot@archiver.kernel.org>; Sun, 10 Jul 2022 13:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA661408C4;
	Sun, 10 Jul 2022 13:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA661408C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CvFAZlBvC8VP; Sun, 10 Jul 2022 13:51:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4ECC40223;
	Sun, 10 Jul 2022 13:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4ECC40223
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 468D41BF429
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 13:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EFF584102
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 13:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EFF584102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eaixTneVk5Vf for <buildroot@lists.busybox.net>;
 Sun, 10 Jul 2022 13:51:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13FC6840F9
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13FC6840F9
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 13:51:34 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id n10so3977442wrc.4
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 06:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rghWN5yA2t00d6+xdYFmIm1/6HqouOcxPo2C62u+DEw=;
 b=W4/jbzVz20SHAQIHXg6/FceRgWbqn+EiBiPhdZMo9hVOJcMHANuBRCgNnueysHeWOJ
 ldQKCmwygwFblHXut3q9xHLDU3AHrjXG47AUxwuUgWu6wO1NFVM5OWFEFqWK3mzeLLOd
 oFRkUFzBLMOh0EIwLnTw+a324VxTgLT96PlEygzG/nGo5gBj/d7b7UymmGgTjwKUwWIy
 YaVFAiQ//xNb2EHO/8hvRTXa1bG4nwLrXJU5B+ZOggenU6TcRrvvvhBlJ8Pg5c1S+gsI
 tKDeVlI5oOeRoXfE1VbJk/rP6Cuj8Dhp9XXKeJ9wgQx8WDX6znOABf9aFU1xrcCWlFUx
 neHw==
X-Gm-Message-State: AJIora/IXqOLHdQEhJN2QSus8Akz/w65V9T/vLYt6DBDQiGWHjmX4BWl
 TthM5ZxeoyCbnw/QnmiSAQf56T6CPFs=
X-Google-Smtp-Source: AGRyM1umhDJDcKjK8+9gsNWQImMNaGagfFLZK9KoJ4YQNzFbv7uVxgVz3rK+Uvd6a8QMxg4gpTmkyA==
X-Received: by 2002:a5d:648b:0:b0:21d:a61c:a9c9 with SMTP id
 o11-20020a5d648b000000b0021da61ca9c9mr835194wri.268.1657461091867; 
 Sun, 10 Jul 2022 06:51:31 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a5d634f000000b0020fcaba73bcsm3596500wrw.104.2022.07.10.06.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 06:51:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Jul 2022 15:48:22 +0200
Message-Id: <20220710134822.373689-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rghWN5yA2t00d6+xdYFmIm1/6HqouOcxPo2C62u+DEw=;
 b=kWTQsx8gNNZvi89peq7STOkQwAJJvyn1BEacPSSo9yr2FIB7pi19KF0T96quCWNaon
 MDwCW1ji/HwpJqLydICVV2NPiY9UoEB0nvMs2SOF4ennsNeX98ATwSyXLta867S5Pm5m
 fbvfZjcyPl7gM2Wv8PUSqtaWg///g3/CTsEhCDZWJ6zYpgLmy5mwCktwRnOBWasi16kE
 ye1onYI+X0aqzvqnbDUtq+ESdb5mVVseXzZkSeQ8ViuBiJ6IMlFceeTs/WJ856WrUtxg
 4xNMuu0nQqFvgu1Zy1FW/x5Axh8xgjF/65Q4FsyVps4DnmiwB95i387vTOI9sr9AI5nH
 Htmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kWTQsx8g
Subject: [Buildroot] [PATCH 1/1] package/wavpack: bump to version 5.5.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- Update hash of license file (update in year:
  https://github.com/dbry/WavPack/commit/30d4161c47e135bda2c25a2161b9e3e44e4980ce)

https://github.com/dbry/WavPack/releases/tag/5.5.0
https://github.com/dbry/WavPack/blob/5.5.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e-DSD-file-types-for-invalid-lengths.patch | 42 -------------------
 package/wavpack/wavpack.hash                  |  4 +-
 package/wavpack/wavpack.mk                    |  5 +--
 3 files changed, 3 insertions(+), 48 deletions(-)
 delete mode 100644 package/wavpack/0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch

diff --git a/package/wavpack/0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch b/package/wavpack/0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch
deleted file mode 100644
index 76c1e81674..0000000000
--- a/package/wavpack/0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 773f9d0803c6888ae7d5391878d7337f24216f4a Mon Sep 17 00:00:00 2001
-From: David Bryant <david@wavpack.com>
-Date: Tue, 23 Nov 2021 13:14:35 -0800
-Subject: [PATCH] issue #110: sanitize DSD file types for invalid lengths
-
-[Retrieved from:
-https://github.com/dbry/WavPack/commit/773f9d0803c6888ae7d5391878d7337f24216f4a]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- cli/dsdiff.c | 6 ++++++
- cli/dsf.c    | 1 +
- 2 files changed, 7 insertions(+)
-
-diff --git a/cli/dsdiff.c b/cli/dsdiff.c
-index d7adb6a..5bdcae3 100644
---- a/cli/dsdiff.c
-+++ b/cli/dsdiff.c
-@@ -278,6 +278,12 @@ int ParseDsdiffHeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpa
-             }
- 
-             total_samples = dff_chunk_header.ckDataSize / config->num_channels;
-+
-+            if (total_samples <= 0 || total_samples > MAX_WAVPACK_SAMPLES) {
-+                error_line ("%s is not a valid .DFF file!", infilename);
-+                return WAVPACK_SOFT_ERROR;
-+            }
-+
-             break;
-         }
-         else {          // just copy unknown chunks to output file
-diff --git a/cli/dsf.c b/cli/dsf.c
-index e1d7973..dddd488 100644
---- a/cli/dsf.c
-+++ b/cli/dsf.c
-@@ -113,6 +113,7 @@ int ParseDsfHeaderConfig (FILE *infile, char *infilename, char *fourcc, WavpackC
- 
-     if (format_chunk.ckSize != sizeof (DSFFormatChunk) || format_chunk.formatVersion != 1 ||
-         format_chunk.formatID != 0 || format_chunk.blockSize != DSF_BLOCKSIZE || format_chunk.reserved ||
-+        format_chunk.sampleCount <= 0 || format_chunk.sampleCount > MAX_WAVPACK_SAMPLES * 8 ||
-         (format_chunk.bitsPerSample != 1 && format_chunk.bitsPerSample != 8) ||
-         format_chunk.numChannels < 1 || format_chunk.numChannels > 6 ||
-         format_chunk.chanType < 1 || format_chunk.chanType > NUM_CHAN_TYPES) {
diff --git a/package/wavpack/wavpack.hash b/package/wavpack/wavpack.hash
index abc9ab6905..021703df74 100644
--- a/package/wavpack/wavpack.hash
+++ b/package/wavpack/wavpack.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  4bde6a6b2a86614a6bd2579e60dcc974e2c8f93608d2281110a717c1b3c28b79  wavpack-5.4.0.tar.xz
-sha256  f38defde000d62c4ff158f1445cb85a0c2f67cbc1d3cfa34ed882f439f6e3b43  COPYING
+sha256  ef749d98df46925bc2916993e601cc7ee9114d99653e63e0e304f031ba73b8e6  wavpack-5.5.0.tar.xz
+sha256  275d65ec11a78d552d078b9c26d950e3075892bca895a415ceaaec33bcfabff9  COPYING
diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
index 2e0438ac80..a3d952e29b 100644
--- a/package/wavpack/wavpack.mk
+++ b/package/wavpack/wavpack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAVPACK_VERSION = 5.4.0
+WAVPACK_VERSION = 5.5.0
 WAVPACK_SITE = \
 	https://github.com/dbry/WavPack/releases/download/$(WAVPACK_VERSION)
 WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.xz
@@ -14,9 +14,6 @@ WAVPACK_LICENSE = BSD-3-Clause
 WAVPACK_LICENSE_FILES = COPYING
 WAVPACK_CPE_ID_VENDOR = wavpack
 
-# 0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch
-WAVPACK_IGNORE_CVES += CVE-2021-44269
-
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 WAVPACK_CONF_OPTS += LIBS=-liconv
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
