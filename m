Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EE0C87FCE
	for <buildroot@archiver.kernel.org>; Sun, 27 Jul 2025 09:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1690241019;
	Sun, 27 Jul 2025 09:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKrwjvdyNetl; Sun, 27 Jul 2025 09:55:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0558441072
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0558441072;
	Sun, 27 Jul 2025 09:55:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4515B1BE
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 09:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36B9583CF0
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 09:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72vXLfZxfQbk for <buildroot@buildroot.org>;
 Sun, 27 Jul 2025 09:55:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C491483DE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C491483DE7
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C491483DE7
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 09:55:30 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b783ea502eso295673f8f.1
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 02:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753610128; x=1754214928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gz/5bclkRFzhGHTPm84D+LP/YHrekcLlE4AnIyEcdM0=;
 b=pNDmFZmbbjGeB9HKXNztdcrYbOpz417a9LyF0y1g0Qf5J1gNl4OAuMlec9NieP2/Uq
 g2+63kCbVlbkSOdCrfVSnyKF6Mi5rpABryvi6l/BL1PEmk54ULwtxh7pONgyIrV9N+kH
 Di1fjzflFs1hzd+Wy8WGyROgtX+a2dRscs9w9Uo/lu0yyJ+8FjxGXh3nQToj813yElQX
 1gLvMJ9GEF+gzpnCxoQ63wsQ2XgfuVgwWaKZvronPnRPhG5bFNQAOz16t4EMl3mn/gGA
 dhurVJ9V+gfzl9+1FIs26IVldyogbRrpi4AGF0/2H1iBbCtbhOVdmRhie7S4GVZrmjOU
 ybYA==
X-Gm-Message-State: AOJu0Yzlo7FdJP/DbZZ2msKvLmCCFQKMJbig0f+gfZNQs3+egK6cMuQW
 +GmE4g0fFZQJ8RSfAsPo7QbzLph8aQ4dgUY2SfsTCvdbUPrprhCf28qyXdlHcsaxFUPiQ7nE1OA
 uV/Rp
X-Gm-Gg: ASbGncsHTX291rgdAQK+spFCNt2HNDVaGPGtEc2ItAfdlNmV1rMQXfTUJWylYMZxuvH
 x+Y8c0IXU+pvCGQZXWa2XVZHNDETTz3DpN86609U/LmPA9DDIL7xT9PB1EeX/mvR0SozhS8lhlW
 2bMs4/E+eYdrmMJECbZiZjKkPLr/c49ij8nT+7AGWhVSejpwoCg+qYnIKVKGBS+/9HprFIOGo7Y
 1hQh4t8z3rDH2r+84mxuG/f7Ivx3j8lW/+bWcYXb99ZkGHLl2StKF5O3H4hA2xig3sPXlIfXIJH
 tGhP5DqmRVYSP/hkOrM/AyaEsdcJhd1TzSjq8hULIMaD1DlBG6AmWqZD0vS3i96+D5zuJv4O4yw
 SnEK2i+g23tFfSKdVwRRf2mD9
X-Google-Smtp-Source: AGHT+IEkzwSeDjsOUwGj9xtpcFvLreYiTYwninIhY/f8ZkMKeuKAhVNVhZOvIPWRVR2+P0CS6GsesQ==
X-Received: by 2002:a5d:5f46:0:b0:3b5:f6f9:e803 with SMTP id
 ffacd0b85a97d-3b771356b1emr9745006f8f.14.1753610128382; 
 Sun, 27 Jul 2025 02:55:28 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587ac65e86sm56952755e9.25.2025.07.27.02.55.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 02:55:27 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 27 Jul 2025 11:55:25 +0200
Message-ID: <20250727095526.1006204-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250727095526.1006204-1-thomas.perale@mind.be>
References: <20250727095526.1006204-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1753610128; x=1754214928; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gz/5bclkRFzhGHTPm84D+LP/YHrekcLlE4AnIyEcdM0=;
 b=Js0zZOejnFJJa1eOP0W8Pxd9cU9ILkXphAhQW5yDnxyWTEwd73xQa1SxS/wSFjb6HL
 dOlWdZ/WUVH+H/rxHWDS8LbPq1Q034z0UU4z/62zCa+yugINTqjNuXAops7Ua45nE7fw
 P7m9Z+TxnvdEqCMKGCJB85Y/YqgjCr0KoAAy7cwbnyFUKxF7+MIAyKfGAo5NM+tCL2nW
 cnSlX/zTjMroJAkqkix2FAx1HK86Z+6ly+sKaMCSWoD+/BEtUIDl6bDZ2x6qv82deVI/
 X2I+LKunS++09RleZKQ6Od9wHh9gzq86J3ZfNl2QxPV/1ZhfrX9bbrsg7+qP4AJ97RHw
 k1EQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Js0zZOej
Subject: [Buildroot] [PATCH 2/3] package/orc: add patch for CVE-2024-40897
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

This fixes the following vulnerabilities:

- CVE-2024-40897

 Stack-based buffer overflow vulnerability exists in orcparse.c of ORC
 versions prior to 0.4.39. If a developer is tricked to process a
 specially crafted file with the affected ORC compiler, an arbitrary
 code may be executed on the developer's build environment. This may
 lead to compromise of developer machines or CI build environments.
 https://www.cve.org/CVERecord?id=CVE-2024-40897

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2024-40897
 - https://gitlab.freedesktop.org/gstreamer/orc/-/commit/fb7db9ae3e8ac271651d1884a3611d30bac04a98

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ror-messages-and-otherwise-vsnprintf.patch | 94 +++++++++++++++++++
 package/orc/orc.mk                            |  3 +
 2 files changed, 97 insertions(+)
 create mode 100644 package/orc/0001-use-vasprintf-if-available-for-error-messages-and-otherwise-vsnprintf.patch

diff --git a/package/orc/0001-use-vasprintf-if-available-for-error-messages-and-otherwise-vsnprintf.patch b/package/orc/0001-use-vasprintf-if-available-for-error-messages-and-otherwise-vsnprintf.patch
new file mode 100644
index 0000000000..41c5290722
--- /dev/null
+++ b/package/orc/0001-use-vasprintf-if-available-for-error-messages-and-otherwise-vsnprintf.patch
@@ -0,0 +1,94 @@
+From fb7db9ae3e8ac271651d1884a3611d30bac04a98 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Tue, 9 Jul 2024 12:11:37 +0300
+Subject: [PATCH] Use vasprintf() if available for error messages and otherwise
+ vsnprintf()
+
+vasprintf() is a GNU/BSD extension and would allocate as much memory as required
+on the heap, similar to g_strdup_printf(). It's ridiculous that such a function
+is still not provided as part of standard C.
+
+If it's not available, use vsnprintf() to at least avoid stack/heap buffer
+overflows, which can lead to arbitrary code execution.
+
+Thanks to Noriko Totsuka for reporting.
+
+Fixes JVN#02030803 / JPCERT#92912620 / CVE-2024-40897
+Fixes #69
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/orc/-/merge_requests/191>
+Upstream: https://gitlab.freedesktop.org/gstreamer/orc/-/commit/fb7db9ae3e8ac271651d1884a3611d30bac04a98
+CVE: CVE-2024-40897
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ meson.build       |  1 +
+ orc/orccompiler.c |  6 +++++-
+ orc/orcparse.c    | 14 +++++++++++---
+ 3 files changed, 17 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index c7ba5d7d..fe8c6016 100644
+--- a/meson.build
++++ b/meson.build
+@@ -128,6 +128,7 @@ int main() {
+ '''
+ cdata.set('HAVE_MONOTONIC_CLOCK', cc.compiles(monotonic_test))
+ cdata.set('HAVE_GETTIMEOFDAY', cc.has_function('gettimeofday'))
++cdata.set('HAVE_VASPRINTF', cc.has_function('vasprintf'))
+ cdata.set('HAVE_POSIX_MEMALIGN', cc.has_function('posix_memalign', prefix : '#include <stdlib.h>'))
+ cdata.set('HAVE_MMAP', cc.has_function('mmap'))
+ cdata.set('HAVE_SYS_TIME_H', cc.has_header('sys/time.h'))
+diff --git a/orc/orccompiler.c b/orc/orccompiler.c
+index 1e24b8a3..d3394612 100644
+--- a/orc/orccompiler.c
++++ b/orc/orccompiler.c
+@@ -1332,8 +1332,12 @@ orc_compiler_error_valist (OrcCompiler *compiler, const char *fmt,
+ 
+   if (compiler->error_msg) return;
+ 
++#ifdef HAVE_VASPRINTF
++  vasprintf (&s, fmt, args);
++#else
+   s = malloc (ORC_COMPILER_ERROR_BUFFER_SIZE);
+-  vsprintf (s, fmt, args);
++  vsnprintf (s, ORC_COMPILER_ERROR_BUFFER_SIZE, fmt, args);
++#endif
+   compiler->error_msg = s;
+   compiler->error = TRUE;
+   compiler->result = ORC_COMPILE_RESULT_UNKNOWN_COMPILE;
+diff --git a/orc/orcparse.c b/orc/orcparse.c
+index b0d67095..ae4f1b6b 100644
+--- a/orc/orcparse.c
++++ b/orc/orcparse.c
+@@ -424,17 +424,25 @@ orc_parse_get_error_where (OrcParser *parser)
+ static void
+ orc_parse_add_error_valist (OrcParser *parser, const char *format, va_list args)
+ {
+-  char text[ORC_ERROR_LENGTH] = { '\0' };
+-
+   if (parser->error_program != parser->program) {
+     parser->error_program = parser->program;
+   }
+ 
+-  vsprintf (text, format, args);
++#ifdef HAVE_VASPRINTF
++  char *text;
++  vasprintf (&text, format, args);
++#else
++  char text[ORC_ERROR_LENGTH] = { '\0' };
++  vsnprintf (text, sizeof (text), format, args);
++#endif
+ 
+   orc_vector_append (&parser->errors,
+                      orc_parse_error_new (orc_parse_get_error_where (parser),
+                                           parser->line_number, -1, text));
++
++#ifdef HAVE_VASPRINTF
++  free (text);
++#endif
+ }
+ 
+ static void
+-- 
+GitLab
+
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 436dc9d629..466e554f6b 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -20,5 +20,8 @@ ORC_CONF_OPTS = \
 	-Dtests=disabled \
 	-Dtools=disabled
 
+# 0001-use-vasprintf-if-available-for-error-messages-and-otherwise-vsnprintf.patch
+ORC_IGNORE_CVES += CVE-2024-40897
+
 $(eval $(meson-package))
 $(eval $(host-meson-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
