Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDD8FF8864
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 06:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98602420B0;
	Fri,  1 May 2026 06:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1hHtllh9vuo; Fri,  1 May 2026 06:24:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA66B4234B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777616674;
	bh=ehtopKHZiPL/OFhw5Z2KlPz2CBaj/ubkeOhjg9cfxM4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dxecx2cCCoWzgYxH05aZpI1qERD5JEINP5J16LlUL3GwY1WxtYx6AaGSp8uuNEWRG
	 17WXHjNfsXPLlvs5udmZXBtN3T6+RPIp6nPeM0PYCmrMn9F3+iDm8xg9whD8aYwKWu
	 lVCvGIkc3pILWiLWn6Nuwv5me6fXfpgGaI/XD0p0FTm2+kElSgOv2e5lza3EtmpaXm
	 cnGX+wrZdU7RPig+Fz18yzbqajeX4N2N8BW7mZ+Dkr2PhLllThhHGZTENkdI8Yvsi4
	 jtgUPY19kVxzP8tHJw04qLFd1zqMrVg0vu7u8rjvB0+I1xiJzK1/AlHFhR9rnxW5tM
	 EFectWjien8sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA66B4234B;
	Fri,  1 May 2026 06:24:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A24EC293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 888CC420B0
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXiHUYpXIXLX for <buildroot@buildroot.org>;
 Fri,  1 May 2026 06:24:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 762B2420A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 762B2420A8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 762B2420A8
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:24:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1A429A4C2A33;
 Fri,  1 May 2026 08:23:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38120)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIhHR-000000007tD-0cHU;
 Fri, 01 May 2026 06:23:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 08:23:00 +0200
Message-ID: <20260501062316.1942112-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501062316.1942112-1-bernd@kuhls.net>
References: <20260501062316.1942112-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777616607;
 bh=BJoBuznYYTEeeh2g9M5tvamlydTqu6Cqv+qZ4iHiMDw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mdr92WalKLKSR/rnEnl9j01VtoOHJGpmZw4YYreGIRdPKq4m8HpGEsQjs+EXzXV/Q
 FYa0pqrGM42ZThGtSRqvy1ZC9Z722fcQ2SDOYaeAjrtlngs06l0ilzvsHihstNvpn+
 7Vl7QJjMVn7tEKTP7eNZ8TXx2Uu3RUn5As2eOYqbV4Piv2nqQQrhpezuLD/E8rF64N
 C7WOTIUSQKgLTR5AQvVJy4jbNZhhUfXdPJpiojaUqIQKalF4NY9cSN4mje1LQK+VKC
 c0A92WsJZUMtpCFyiigiV1oq35uqqwRwP6gXcHHyv/uUJfK84iNITOYAq4SDjbIO38
 Z6BrBbLlSAqzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mdr92Wal
Subject: [Buildroot] [PATCH v3 07/21] package/cups-filters: add upstream
 patch to fix CVE-2025-64524
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ix-infinite-loop-caused-by-crafted-f.patch | 83 +++++++++++++++++++
 package/cups-filters/cups-filters.mk          |  3 +
 2 files changed, 86 insertions(+)
 create mode 100644 package/cups-filters/0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch

diff --git a/package/cups-filters/0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch b/package/cups-filters/0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch
new file mode 100644
index 0000000000..e9900e5672
--- /dev/null
+++ b/package/cups-filters/0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch
@@ -0,0 +1,83 @@
+From b03866fd2e251a6d822a5e8c807c8d47b4d2dce2 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Wed, 12 Nov 2025 16:02:20 +0100
+Subject: [PATCH] rastertopclx.c: Fix infinite loop caused by crafted file
+
+Infinite loop happened because of crafted input raster file, which led
+into heap buffer overflow of `CompressBuf` array.
+
+Based on comments there should be always some `count` when compressing
+the data, and processing of crafted file ended with offset and count
+being 0.
+
+Fixes CVE-2025-64524
+
+Upstream: https://github.com/OpenPrinting/cups-filters/commit/b03866fd2e251a6d822a5e8c807c8d47b4d2dce2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ filter/rastertopclx.c | 25 +++++++++++++++++++++++--
+ 1 file changed, 23 insertions(+), 2 deletions(-)
+
+diff --git a/filter/rastertopclx.c b/filter/rastertopclx.c
+index 3e7c129da..1015308da 100644
+--- a/filter/rastertopclx.c
++++ b/filter/rastertopclx.c
+@@ -818,10 +818,10 @@ StartPage(ppd_file_t         *ppd,	/* I - PPD file */
+   }
+ 
+   if (header->cupsCompression)
+-    CompBuffer = malloc(DotBufferSize * 4);
++    CompBuffer = calloc(DotBufferSize * 4, sizeof(unsigned char));
+ 
+   if (header->cupsCompression >= 3)
+-    SeedBuffer = malloc(DotBufferSize);
++    SeedBuffer = calloc(DotBufferSize, sizeof(unsigned char));
+ 
+   SeedInvalid = 1;
+ 
+@@ -1152,6 +1152,13 @@ CompressData(unsigned char *line,	/* I - Data to compress */
+               seed ++;
+               count ++;
+             }
++
++	    //
++	    // Bail out if we don't have count to compress
++	    //
++
++	    if (count == 0)
++	      break;
+ 	  }
+ 
+          /*
+@@ -1245,6 +1252,13 @@ CompressData(unsigned char *line,	/* I - Data to compress */
+ 
+             count = line_ptr - start;
+ 
++	    //
++	    // Bail out if we don't have count to compress
++	    //
++
++	    if (count == 0)
++	      break;
++
+ #if 0
+             fprintf(stderr, "DEBUG: offset=%d, count=%d, comp_ptr=%p(%d of %d)...\n",
+ 	            offset, count, comp_ptr, comp_ptr - CompBuffer,
+@@ -1416,6 +1430,13 @@ CompressData(unsigned char *line,	/* I - Data to compress */
+ 
+             count = (line_ptr - start) / 3;
+ 
++	    //
++	    // Bail out if we don't have count to compress
++	    //
++
++	    if (count == 0)
++	      break;
++
+            /*
+             * Place mode 10 compression data in the buffer; each sequence
+ 	    * starts with a command byte that looks like:
+-- 
+2.47.3
+
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index dcfb2e9500..6bc4610376 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -13,6 +13,9 @@ CUPS_FILTERS_CPE_ID_VENDOR = linuxfoundation
 # 0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
 CUPS_FILTERS_IGNORE_CVES += CVE-2023-24805
 
+# 0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch
+CUPS_FILTERS_IGNORE_CVES += CVE-2025-64524
+
 CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
 
 CUPS_FILTERS_CONF_OPTS = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
