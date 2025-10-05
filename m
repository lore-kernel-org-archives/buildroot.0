Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AF5CAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 09:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E043882E1A;
	Sun,  5 Oct 2025 09:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bj7ZMmgxLMzd; Sun,  5 Oct 2025 09:42:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E10CF83E68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E10CF83E68;
	Sun,  5 Oct 2025 09:42:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EFDAC272
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 09:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D54BF409EA
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 09:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynQA2yFDfglQ for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 09:42:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 031FE409E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 031FE409E8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 031FE409E8
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 09:42:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c725.dip0.t-ipconnect.de [79.214.199.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4A85DA4C5DDD;
 Sun,  5 Oct 2025 11:42:41 +0200 (CEST)
Received: from [192.168.1.144] (port=45266 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v5LGK-000000000op-2qCJ;
 Sun, 05 Oct 2025 09:42:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Sun,  5 Oct 2025 11:42:40 +0200
Message-ID: <20251005094240.2177055-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759657361;
 bh=C7chXerOerpcdRWH3LZlNashDLVv0Pa9sQOn50bQom8=;
 h=From:To:Cc:Subject:Date:From;
 b=A6hgEVM1hObjdH6HDtuXI6HLLchZZlbMPaSffO1yB5f0VZP2iuFWIV5rTil/uOpzU
 jlaAeKbG9rAbz43xQeOgYrg5aENug1z0fuc7QsChVl3Hrd0BATMVg0xO3erqw9O8Li
 XTX5+gBmYTD9hVEMxr6PuGhMvMGaK///A93/tSiq3tXhg6SO9h7JovLgjBX05fnKjO
 lCGg7tnIZvJAOG+ySq6G3xYLYbvKvQTysfry7vtXfRvlhQS9x/aNUPstRVlpnvpHWP
 lvp4vRvFYkNGVpRdzYaTuCWe2jXS2nFZWjYvdzFeOXL2Zn5V/jTIUGJLmvXodpjcTC
 ELYvkDbksRd7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=A6hgEVM1
Subject: [Buildroot] [PATCH 1/1] package/aubio: fix build with ffmpeg 8.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ce_avcodec-fix-build-with-ffmpeg-8.0.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/aubio/0002-source_avcodec-fix-build-with-ffmpeg-8.0.patch

diff --git a/package/aubio/0002-source_avcodec-fix-build-with-ffmpeg-8.0.patch b/package/aubio/0002-source_avcodec-fix-build-with-ffmpeg-8.0.patch
new file mode 100644
index 0000000000..db5003e76b
--- /dev/null
+++ b/package/aubio/0002-source_avcodec-fix-build-with-ffmpeg-8.0.patch
@@ -0,0 +1,37 @@
+From d79fa30d780eca95548352ce01cf9104f46aeec4 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 5 Oct 2025 11:37:52 +0200
+Subject: [PATCH] [source_avcodec] fix build with ffmpeg 8.0
+
+AV_INPUT_BUFFER_MIN_SIZE was removed with upstream commit
+https://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=1d66a122df9fd5d8400b05c74462d0082990fc01
+
+A similar fix is used by Arch Linux:
+https://gitlab.archlinux.org/archlinux/packaging/packages/aubio/-/commit/bdf858e4291aa170a23c470ac1caf2c827bfd01d
+
+Upstream: https://github.com/aubio/aubio/pull/427
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/io/source_avcodec.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/io/source_avcodec.c b/src/io/source_avcodec.c
+index 71ea8b5f..1fb14bf5 100644
+--- a/src/io/source_avcodec.c
++++ b/src/io/source_avcodec.c
+@@ -67,7 +67,11 @@
+ #if LIBAVCODEC_VERSION_INT < AV_VERSION_INT(56, 56, 0)
+ #define AUBIO_AVCODEC_MAX_BUFFER_SIZE FF_MIN_BUFFER_SIZE
+ #else
++#if LIBAVCODEC_VERSION_INT < AV_VERSION_INT(60, 40, 100)
+ #define AUBIO_AVCODEC_MAX_BUFFER_SIZE AV_INPUT_BUFFER_MIN_SIZE
++#else
++#define AUBIO_AVCODEC_MAX_BUFFER_SIZE 16384
++#endif
+ #endif
+ 
+ #if LIBAVCODEC_VERSION_MAJOR >= 59
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
