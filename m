Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D15FEE4F7
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 20:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DE4460F90;
	Sat, 28 Feb 2026 20:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6JyOsN5QrK7v; Sat, 28 Feb 2026 20:15:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EF0360F93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772309757;
	bh=f9X4Yanv8oLhobGokgNGvKjcEC+xJihRIuv8Z+crNjk=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ChYIgvn7ALgBPyTR3gQtAEWih4CcF7/WSbDdtIZhe5uPPDREeXgGcDFIqfvkHi/eY
	 YCf8P5tRSUmmUYtkhIpDfw9NX9OH1CJmcnWdZjg717+ksZzIwSvxB5vTV+A+c0sK0m
	 CwfLELHNE93oDGZxlPBj5s2xP18b4BgZwDCs3M90DVyOJiVUrGWOoyPhHmX6OpSDLN
	 asyxjZoeZdmaZrV+XdJv6Uv8LvUTIN08lyIKRAJN9LYS0Lrqu2t3CM5pszKTt5TeDN
	 AKaXU1ZP1/HvBkkzhxVUU+0V7w5JKAy7xkHdlnXhmVFRyEbfRXeNknHNwem4Tv0PG9
	 ig0JrFLTouYdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EF0360F93;
	Sat, 28 Feb 2026 20:15:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1F9B18D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 20:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C385A83E70
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 20:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mnCR4YYCWU-x for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 20:15:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D546883E6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D546883E6E
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D546883E6E
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 20:15:53 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-4399dd8d7b3so1552017f8f.0
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 12:15:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772309750; x=1772914550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4AMCMYY9g7ZJCqRf6zI1MFxi2+vJtQow9iBs8hoDDk=;
 b=rd9JZ8/UBu37PxG0VAlkQn4GvrXyJLM4RqRRfaF2eiHuPwcfqvBHbSDFreKz8/DemN
 OGxMEihZ30rk5BW0Bzv5b9IxJEYz16FUDviGSGdSqGDV56fKbhgAW6lN3Js1H6wngLut
 y6fPIOEbQ+icZR6OXisqyQ3nFfBQF2ounf98ByOjlhpbyiE80w6PXVENs34qxPGIEmDl
 k0fCls1F2FGFL0YWRJtcHC57xecF0Hu2X3s9dwPLslqg+9DFSp/PIl1NVeCTqeOQdPVK
 PGsdtn8ffkk+DOsCOubS/RibZ8oC8/dSHEKv3IxHuqcNblJ5KYn68GYHvOuUYHKZJWem
 3aXw==
X-Gm-Message-State: AOJu0Yyggu5xhPAdmweMXiR+yAt97E91vhldridKh4TqrCwmsQDIYIXI
 Rmy+krb6/snrdy+7/oGnnNAZ1QTHEhk4Je8Nlyn4Q9ljbGqyJyA2SGZauF93PnA7PUTnlLwQkqv
 PLTjC
X-Gm-Gg: ATEYQzxIcLM3ybfR5f+QFpp0ROB1YjxZ7BuwTHkd0hCbEvQFowamB6folE2EV8RMgHH
 d7hTVWY8SeguABTCM9mcVfiiHlsJywPAfsdevKqZF0kUF99Y/0Ov8uVuJzND8ecjJAd7+O7x+J8
 1+Dq4xOz15a7zVo2wm53Sgy8p/8ZNjw2aKo9i/mx37O+gEzZLYK4SGTBpa7w9EW+5xuIrPP2FvK
 b0DP7VJuD8Of6S58906z3JAU5h9NaKOfjMtUlsJzc33Goz92ZF3I7RgFbdssqC2w3EmICRUfRUF
 xYn+7W6Lek5HNbh7S6LPiXo94i7p3uZpLf3rhhEWtkvaXvUcecJ6V2apxyvtC3P5J0fXgUIPfc2
 pI8LdDb5SEmHM6Y0PnA2ZiW14013buNXGrfJ0Y7BoaFcuM2I5+uJTO+C1MDGvJniR3Ow+M3bq9H
 E4bvm/2e2cq6H5j6U=
X-Received: by 2002:a05:6000:288a:b0:439:af0e:5796 with SMTP id
 ffacd0b85a97d-439af0e5989mr1774544f8f.27.1772309749657; 
 Sat, 28 Feb 2026 12:15:49 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c60f8e5sm18120867f8f.4.2026.02.28.12.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 12:15:48 -0800 (PST)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Sat, 28 Feb 2026 21:15:47 +0100
Message-ID: <20260228201547.84699-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772309750; x=1772914550; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O4AMCMYY9g7ZJCqRf6zI1MFxi2+vJtQow9iBs8hoDDk=;
 b=fVErftZlY3BQpLiT3ZCfvy31LXM8lOz7jWLtnIe1U6ErKlEJkJHoX70F/y8zqLJ11p
 i/B3kztWtevS218rQge23RX2jv7H72/S605yE+P0jeHRE5P7rZ9WVkf6SAPMcBRsmbBE
 Pmb2+ytA9YqC5YIoWPl0PrdRKoSdocZT2QKL54W/BTw7ZFbhNDX0eP3ReYTOnP7O4E3T
 1z9DcQrT+jrLkQ9EgK/xFl6/1hIQxvwBhIWQTzWTGwr2/JJSOtakIUnSb+NLlo7/ZNze
 LyISSJ4z9A073onbIXuDruc4V6iTYIzsYLDxLUGi5ImGgnHvKHrH7ElywtnZtD5C9pum
 FOLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fVErftZl
Subject: [Buildroot] [PATCH] package/mupdf: add patch for CVE-2026-25556
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

Fixes the following vulnerability:

- CVE-2026-25556:
    MuPDF versions 1.23.0 through 1.27.0 contain a double-free
    vulnerability in fz_fill_pixmap_from_display_list() when an exception
    occurs during display list rendering. The function accepts a caller-
    owned fz_pixmap pointer but incorrectly drops the pixmap in its error
    handling path before rethrowing the exception. Callers (including the
    barcode decoding path in fz_decode_barcode_from_display_list) also
    drop the same pixmap in cleanup, resulting in a double-free that can
    corrupt the heap and crash the process. This issue affects
    applications that enable and use MuPDF barcode decoding and can be
    triggered by processing crafted input that causes a rendering-time
    error while decoding barcodes.

For more information, see
  - https://www.cve.org/CVERecord?id=CVE-2026-25556
  - https://cgit.ghostscript.com/cgi-bin/cgit.cgi/mupdf.git/commit/?id=d4743b6092d513321c23c6f7fe5cff87cde043c1

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-incorrect-error-case-free-of-pixmap.patch | 53 +++++++++++++++++++
 package/mupdf/mupdf.mk                        |  3 ++
 2 files changed, 56 insertions(+)
 create mode 100644 package/mupdf/0001-Fix-incorrect-error-case-free-of-pixmap.patch

diff --git a/package/mupdf/0001-Fix-incorrect-error-case-free-of-pixmap.patch b/package/mupdf/0001-Fix-incorrect-error-case-free-of-pixmap.patch
new file mode 100644
index 0000000000..f78c429cef
--- /dev/null
+++ b/package/mupdf/0001-Fix-incorrect-error-case-free-of-pixmap.patch
@@ -0,0 +1,53 @@
+From d4743b6092d513321c23c6f7fe5cff87cde043c1 Mon Sep 17 00:00:00 2001
+From: Robin Watts <Robin.Watts@artifex.com>
+Date: Mon, 12 Jan 2026 19:08:56 +0000
+Subject: Bug 709029: Fix incorrect error-case free of pixmap.
+
+Don't free a pixmap we don't own!
+
+CVE: CVE-2026-25556
+Upstream: https://cgit.ghostscript.com/cgi-bin/cgit.cgi/mupdf.git/commit/?id=d4743b6092d513321c23c6f7fe5cff87cde043c1
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ source/fitz/util.c | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/source/fitz/util.c b/source/fitz/util.c
+index 7710124cc..90226a5c1 100644
+--- a/source/fitz/util.c
++++ b/source/fitz/util.c
+@@ -119,7 +119,15 @@ fz_new_pixmap_from_display_list_with_separations(fz_context *ctx, fz_display_lis
+ 	else
+ 		fz_clear_pixmap_with_value(ctx, pix, 0xFF);
+
+-	return fz_fill_pixmap_from_display_list(ctx, list, ctm, pix);
++	fz_try(ctx)
++		fz_fill_pixmap_from_display_list(ctx, list, ctm, pix);
++	fz_catch(ctx)
++	{
++		fz_drop_pixmap(ctx, pix);
++		fz_rethrow(ctx);
++	}
++
++	return pix;
+ }
+
+ fz_pixmap *
+@@ -136,14 +144,9 @@ fz_fill_pixmap_from_display_list(fz_context *ctx, fz_display_list *list, fz_matr
+ 		fz_close_device(ctx, dev);
+ 	}
+ 	fz_always(ctx)
+-	{
+ 		fz_drop_device(ctx, dev);
+-	}
+ 	fz_catch(ctx)
+-	{
+-		fz_drop_pixmap(ctx, pix);
+ 		fz_rethrow(ctx);
+-	}
+
+ 	return pix;
+ }
+--
+cgit v1.2.3
+
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index fe4f3e6756..c538b9bec8 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -27,6 +27,9 @@ MUPDF_IGNORE_CVES = \
 	CVE-2024-24258 \
 	CVE-2024-24259
 
+# 0001-Fix-incorrect-error-case-free-of-pixmap.patch
+MUPDF_IGNORE_CVES += CVE-2026-25556
+
 # mupdf doesn't use CFLAGS and LIBS but XCFLAGS and XLIBS instead.
 # with USE_SYSTEM_LIBS it will try to use system libraries instead of the bundled ones.
 MUPDF_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
