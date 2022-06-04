Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC20DC43334
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 21:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FE4140A42;
	Sat,  4 Jun 2022 21:09:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nK8M35VoZw8M; Sat,  4 Jun 2022 21:09:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E96C40931;
	Sat,  4 Jun 2022 21:09:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B8C71BF5A4
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 21:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F143760D50
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 21:09:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HDJIOktAJcRo for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 21:09:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2EB660B4B
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 21:09:09 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id k19so14718246wrd.8
 for <buildroot@buildroot.org>; Sat, 04 Jun 2022 14:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l/rVZBe0L/K9usmkT6Ai5WboMi4xwmdsYHkaEcQ3378=;
 b=iwwJPElOKgd54Fv13xTOnKoKVf7MG/C0Fz5jAupLR/cdOsVpTBVnNIWOGxtYS8UDd9
 QAmIXMFMWIFj9u59c+vgq6OXzGJjo5bHXcWlM1TafK+1fJ+c8EbudxaGaFfHetMhTNMK
 k/k8vT1h9em5RqB+Lkc646iUHhON5GiisVjKoFlyRWjswCuMT8XWRR/vHD8FhG+CK93k
 wHT/i3eVjFA6DBmf/E7Nf34jkov/Gzbbk007j/3FCYPydm+fB19UADa3WrX9ukeL4JuV
 BWTTfjtrGjW8zY6X3DKW1APO9sNlz4GHRU5gFCa4C9Zyn4aJKbsX9/LF5kRBG3PyevqS
 Y8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l/rVZBe0L/K9usmkT6Ai5WboMi4xwmdsYHkaEcQ3378=;
 b=OugCpsuAXkHTKXSUh/ORn2XTyrNQP50NemAn3ptNMi3TWNrW/rRY3Uzm1Z0Nvx1NMB
 OsY1o6HQBm4a0E54bHL+IJRfZWjOMPV2aYV8h8McrtASju6/kpyBoqsj/g526cFExkf2
 u2l8qhVevpdC/8x77W14AJIsKU5p/UFfpZo1hZymG/fC9oYDCErfYuTWXA0pzBpv0S5R
 SPCSU9vl/pw9B4GR5nGMR+Xc7ufCIwCBYNiZQS4nB5Wfc3SqSTAJS4FNUUn1HpAvVUOt
 5EBCDk+SzxaiAYdq2oALxIYXGa4PcshONRMj4M3IdsRU41oFYLaWhO706ozPgt9yXhkB
 OI/Q==
X-Gm-Message-State: AOAM530szQfRhq6AS2rJl/T/ce0+cLk32j5GxUU2DEcJPh61qrl7gpA6
 1UrdIhBKuZLsI7EF05hSk79aUBxnZjU=
X-Google-Smtp-Source: ABdhPJyEaggJdpyadkxgB/hkxI3O3zkd0bpslENEEsxJvKOZkq6OIYlmIzFL05MRheV8UZs4TcSJew==
X-Received: by 2002:a5d:4906:0:b0:20f:fc2a:987a with SMTP id
 x6-20020a5d4906000000b0020ffc2a987amr13956186wrq.228.1654376947485; 
 Sat, 04 Jun 2022 14:09:07 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a5d62c7000000b0020fe86d340fsm11140086wrv.55.2022.06.04.14.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jun 2022 14:09:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Jun 2022 23:06:28 +0200
Message-Id: <20220604210628.668951-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tiff: security bump to version 4.4.0
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

Fix CVE-2022-0561, CVE-2022-0562, CVE-2022-0865, CVE-2022-0891,
CVE-2022-0907, CVE-2022-0908, CVE-2022-0909, CVE-2022-0924,
CVE-2022-1056, CVE-2022-1210, CVE-2022-1622 and CVE-2022-1623

Drop patch (already in version)

http://www.simplesystems.org/libtiff/v4.4.0.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...lobal-buffer-overflow-for-ASCII-tags.patch | 43 -------------------
 package/tiff/tiff.hash                        |  2 +-
 package/tiff/tiff.mk                          |  5 +--
 3 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 package/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags.patch

diff --git a/package/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags.patch b/package/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags.patch
deleted file mode 100644
index ba1487782e..0000000000
--- a/package/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 03047a26952a82daaa0792957ce211e0aa51bc64 Mon Sep 17 00:00:00 2001
-From: 4ugustus <wangdw.augustus@qq.com>
-Date: Tue, 25 Jan 2022 16:25:28 +0000
-Subject: [PATCH] tiffset: fix global-buffer-overflow for ASCII tags where
- count is required (fixes #355)
-
-[Retrieved from:
-https://gitlab.com/libtiff/libtiff/-/commit/03047a26952a82daaa0792957ce211e0aa51bc64]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- tools/tiffset.c | 16 +++++++++++++---
- 1 file changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/tools/tiffset.c b/tools/tiffset.c
-index 8c9e23c5..e7a88c09 100644
---- a/tools/tiffset.c
-+++ b/tools/tiffset.c
-@@ -146,9 +146,19 @@ main(int argc, char* argv[])
- 
-             arg_index++;
-             if (TIFFFieldDataType(fip) == TIFF_ASCII) {
--                if (TIFFSetField(tiff, TIFFFieldTag(fip), argv[arg_index]) != 1)
--                    fprintf( stderr, "Failed to set %s=%s\n",
--                             TIFFFieldName(fip), argv[arg_index] );
-+                if(TIFFFieldPassCount( fip )) {
-+                    size_t len;
-+                    len = strlen(argv[arg_index]) + 1;
-+                    if (len > UINT16_MAX || TIFFSetField(tiff, TIFFFieldTag(fip),
-+                            (uint16_t)len, argv[arg_index]) != 1)
-+                        fprintf( stderr, "Failed to set %s=%s\n",
-+                            TIFFFieldName(fip), argv[arg_index] );
-+                } else {
-+                    if (TIFFSetField(tiff, TIFFFieldTag(fip),
-+                            argv[arg_index]) != 1)
-+                        fprintf( stderr, "Failed to set %s=%s\n",
-+                            TIFFFieldName(fip), argv[arg_index] );
-+                }
-             } else if (TIFFFieldWriteCount(fip) > 0
- 		       || TIFFFieldWriteCount(fip) == TIFF_VARIABLE) {
-                 int     ret = 1;
--- 
-GitLab
-
diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index ea08a1fc92..6bd28a0f59 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8  tiff-4.3.0.tar.gz
+sha256  917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed  tiff-4.4.0.tar.gz
 sha256  fbd6fed7938541d2c809c0826225fc85e551fdbfa8732b10f0c87e0847acafd7  COPYRIGHT
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index f80ab7ac55..525712c9e9 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.3.0
+TIFF_VERSION = 4.4.0
 TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
 TIFF_LICENSE_FILES = COPYRIGHT
@@ -12,9 +12,6 @@ TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
-# 0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags.patch
-TIFF_IGNORE_CVES += CVE-2022-22844
-
 TIFF_CONF_OPTS = \
 	--disable-cxx \
 	--without-x
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
