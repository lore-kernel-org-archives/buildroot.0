Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E289ECCA468
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 10:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9744080E18;
	Tue, 30 Sep 2025 10:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYjT7efXhqPH; Tue, 30 Sep 2025 10:40:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C11F80CF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C11F80CF2;
	Tue, 30 Sep 2025 10:40:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E703111
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 10:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0070D40A22
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 10:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Dx7WIWOedUo for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 10:40:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ACFC540A7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACFC540A7F
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACFC540A7F
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 10:40:51 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so3847821f8f.0
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 03:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759228850; x=1759833650;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=geA+Kq4VKCF7WPrkV/UwC/A57SFA/t2xnCXxaPb3svw=;
 b=hA8/c7i/iVnt0HNTk6Dl165Nr4pntzsbsLVD2mOk3GAyJwW1qdZab6Pu72KCBEhVrc
 qyOqz7P2/1cjcppBWdycd6y+fRVshQ0UDcHK9fmJbTab52M7QTZcHWD3atxTv+STcN8b
 cufqI9qpZKLbicrQ7H/rfAxMJka4p2PSJeAg9T9mTX15pLSy5R7SQXuDNOEKMCUYa6DD
 4HaAHTZoUcrMCyg0PxyO6vkIGGc26VXkEWu9MCyVfSqYudgSp74DVph4iix18//QKRxh
 3rAfvfnLfhFOW4rGDCU2p4vHha9u34W6ewss57ppSlF+UJar9FZJMEPdJySr0+QM6RMs
 UKkg==
X-Gm-Message-State: AOJu0YxKhq1RIQQX1VpF7bC/V+p52Oow/ePV7pYDwuCv7K9n26ym6kXq
 uqb9WdhO/t81+tyXIIWI9ulidqswYyJaYXSkYzZ2PELKGliR5AH4GyAYrGPRbEnky0mn4f0JxG2
 YE2Nb
X-Gm-Gg: ASbGnctGHIIV1XhoCqwhQlnDE1OghohONmeZlDg4Gyn8o9Wy77eLuyHLgS/olLXIdvI
 /HIE5nNVC4jS7obTI9VZYnm2N0pV2/DO7+nG2JY9NEIiRB060NFVdu0weTN8ELqPZXxLZSy7hB6
 k7/KRqGDp2oHqHXz4x5lyxyOUUSspVSd1Cl6rgap3zgIaOzIt+I7W70zlC41gqNDIup2q6FrKpF
 Fll7wjNvtvkS6bcY7rzQRb0LT89kD7bfCz/EJp48okd2nfSVUhv6Jzw0yWN8YUi2AS+QvLllQuP
 +QwVPHSblCfvBiwiblqcWk6vNsh0j+5oksLxBvbnPHH4Gy3L62DcBSLGPamSXCPfjwT3f70wS6s
 MmksomoVjQj29VpUG5Y6owmJKk3wZCyLo+MY6O/sU5GJMrlr9FRfMlI6BcWkTeG1meXeWsYXcQ2
 uSna0jGwIlJjdTPGjgcCVnS46aZ5HNNmeHIw8hY656
X-Google-Smtp-Source: AGHT+IEyuVzZ0hb3Mut8IGfzO/K/D9wWgMKey9wgoldr2oCUZD9mJgj94nYr3f5jt9CNGc8Pz0bi+Q==
X-Received: by 2002:a5d:5c84:0:b0:3e7:6197:9947 with SMTP id
 ffacd0b85a97d-40e4ff1a303mr19017633f8f.53.1759228849540; 
 Tue, 30 Sep 2025 03:40:49 -0700 (PDT)
Received: from dragon.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab62233sm266630095e9.21.2025.09.30.03.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 03:40:49 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Tue, 30 Sep 2025 12:40:38 +0200
Message-ID: <20250930104038.58702-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1759228850; x=1759833650; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=geA+Kq4VKCF7WPrkV/UwC/A57SFA/t2xnCXxaPb3svw=;
 b=htNSoRz0dG3FC11YsRhOGDUsOt8qt3qVN12ypne56NcwrKEmjDvc+ThwoWiPMsU2XA
 lH85k62oziWcuCA9OopUdMNU2AGbcj3FIb0BN3J5XJ60yDWVDEdBX+DElEEcf5fy1uhl
 7kbOcV/zj3+4tEkz0fWEWkjMNOxhW4VLn6u84/gULDfU0Z7A3Col5zfOYeah/jCJoTI0
 nyPfpkR5LlEZfivrAm4g9zIKiRQAqqFWZZ8XsZZ7bIJM9gSgCGRz3sR0/OGpIJ29iwqa
 wBX+qT+QqnGOOfVVW8fP3J7c26SXPjEo3tW5doZ3UXpp/j2dSCmk6ZxpAUDy44gM3XyU
 M3Mw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=htNSoRz0
Subject: [Buildroot] [PATCH] package/ghostscript: security bump to v10.06.0
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerabilities:
- CVE-2025-59798:
    Artifex Ghostscript through 10.05.1 has a stack-based buffer overflow
    in pdf_write_cmap in devices/vector/gdevpdtw.c.
    https://www.cve.org/CVERecord?id=CVE-2025-59798

- CVE-2025-59799:
    Artifex Ghostscript through 10.05.1 has a stack-based buffer overflow
    in pdfmark_coerce_dest in devices/vector/gdevpdfm.c via a large size
    value.
    https://www.cve.org/CVERecord?id=CVE-2025-59799

- CVE-2025-59800:
    In Artifex Ghostscript through 10.05.1, ocr_begin_page in
    devices/gdevpdfocr.c has an integer overflow that leads to a heap-
    based buffer overflow in ocr_line8.
    https://www.cve.org/CVERecord?id=CVE-2025-59800

- CVE-2025-59801:
    In Artifex GhostXPS before 10.06.0, there is a stack-based buffer
    overflow in xps_unpredict_tiff in xpstiff.c because the
    samplesperpixel value is not checked.
    https://www.cve.org/CVERecord?id=CVE-2025-59801

Also remove patch that is now applied upstream

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...Fix-compatibility-with-C23-compilers.patch | 36 -------------------
 package/ghostscript/ghostscript.hash          |  2 +-
 package/ghostscript/ghostscript.mk            |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch

diff --git a/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch b/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch
deleted file mode 100644
index 0dfca9cfa2..0000000000
--- a/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ae940946473ceb8c5353bc6e7f04673c6e60502d Mon Sep 17 00:00:00 2001
-From: Alex Cherepanov <alex@coscript.biz>
-Date: Thu, 3 Apr 2025 17:19:41 +0100
-Subject: Bug 708160: Fix compatibility with C23 compilers
-
-Upstream: https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=ae940946473ceb8c5353bc6e7f04673c6e60502d
-[thomas: Only backport the bool typedef condition]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- base/stdpre.h              |  6 ++++--
- 1 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/base/stdpre.h b/base/stdpre.h
-index dda30b6a4..2f9c84e0d 100644
---- a/base/stdpre.h
-+++ b/base/stdpre.h
-@@ -1,4 +1,4 @@
--/* Copyright (C) 2001-2023 Artifex Software, Inc.
-+/* Copyright (C) 2001-2025 Artifex Software, Inc.
-    All Rights Reserved.
-
-    This software is provided AS-IS with no warranty, either express or
-@@ -341,7 +341,9 @@ typedef signed char schar;
-  * and the MetroWerks C++ compiler insists that bool be equivalent to
-  * unsigned char.
-  */
--#ifndef __cplusplus
-+
-+/* C23 has bool as a builtin type. */
-+#if !defined(__cplusplus) && (!defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L)
- #ifdef __BEOS__
- typedef unsigned char bool;
- #else
---
-cgit v1.2.3
-
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index c434ac1f3a..9b6ead7cfb 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
 # From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10051/SHA512SUMS
-sha512  1a3f2b0f53db9a00a245df19ce8fdce0fbccc6fad47b64d14fc9058b494ab07c77e21bb073df8d4a2522b3ccb0df26735f8224a9e36c07367031ed2262fb26af  ghostscript-10.05.1.tar.xz
+sha512  e9efa6a334cf34703f565f5043dd794452270415b34c2bea260e9dac6c72ebbcbedfa2e4cb9029841f8f582bbce91be8160e135a190081f3262bcf04417f80f1  ghostscript-10.06.0.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index c9d13f5545..1fc850ad20 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.05.1
+GHOSTSCRIPT_VERSION = 10.06.0
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
