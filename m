Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D93FC87FCC
	for <buildroot@archiver.kernel.org>; Sun, 27 Jul 2025 09:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BDD441693;
	Sun, 27 Jul 2025 09:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGqi5s2FFDPn; Sun, 27 Jul 2025 09:55:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33D9C416DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33D9C416DB;
	Sun, 27 Jul 2025 09:55:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2268F231
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 09:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 084D960C0D
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 09:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gTH4G1B-qos1 for <buildroot@buildroot.org>;
 Sun, 27 Jul 2025 09:55:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 008A960606
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 008A960606
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 008A960606
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 09:55:31 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so3344861f8f.2
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 02:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753610130; x=1754214930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V9WrNZXaq5Tl/VRfmfBuhCt8rODx410zL7IzDWLemwU=;
 b=JRnHuaol1Uap1noCqYlM8zNAlOLEQFCp/B5NvylIR1hdQWabVAR2RW28nUSLvnLMmp
 uE+NehL7qspVHU6vMSXgfiN5HBOdZ3oNQfsQndXQN/XdxcWmZ6TMkgNq8TGdMVHoV4FN
 O4pRBw7SZr+BRJWHzrsFmyqdUO6XhrfYW9FO6NBwUOTIcq/zfbBVhzgti0Lt7SY4WcY3
 kEtKH0pltvaOTm+23d7Z/C31Pc7y04m2G6sBXD3BVgvi0oDWdPyZTgXvQuf5O7yniIdF
 KNc+lvzsNAp7+IXUg+kyaAnJq2gjwmcfQpvj2TlR9qieBFzpDhRPyjp/wUlF40D6Gv2c
 dnbw==
X-Gm-Message-State: AOJu0Yy0z4edoP99HTe1oOuxOXbse8hi4kUvZ+siy6inDAb7wj3602Eq
 pj5V4aJsyFV9Fn8lRUXxITyWi7/lfWL9Rdx1JHDHK+3S4Uib1qWHdoNq72qMg+ffGg7i30oWmsL
 cZMw+
X-Gm-Gg: ASbGnctSCrLXmC6ggyYRt2GKFW9NqWiEQORlNznYCn3H49Kbw/t+4ROl8UZSRWQ46Yw
 knFRMMWOBYuOhV3LlJ7s2DdfLSuac/t1LrQRPqXjUYYC2Qa8kpwj1kUagP4Hs4qgZchuw+CILf4
 KPGwVbOHrlVAglWtp++TMvm6whAsP6pIP5p0c1Y+2G8vEFw8yZrycCDQCD+Yi+nuBeXvCHJ63Ym
 C7E0U58aXgsdOBLWLVnCuItc+dGZtHriADGXDXzLmk23IeIwiLlVJgkGu9c+veOG26YuW1RYrJt
 ET5U+e1PoO+788uSPmV/lk/lE7UWg6b/nqJpjx1IgxmzDxbCCwEqEUtA6gkx+kIR7BgcfdEOyte
 2KpJVZi+csH/HDzChQtEkiRen
X-Google-Smtp-Source: AGHT+IF0UNFQMBIWL/u48mvYyDtNQn/5mvYi00QLIT/pA2sD7yry4AwrEYvXXBqCVcMsPowV+jvzkA==
X-Received: by 2002:a05:6000:2003:b0:3b7:8832:fdcc with SMTP id
 ffacd0b85a97d-3b78832ff04mr234247f8f.38.1753610129663; 
 Sun, 27 Jul 2025 02:55:29 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587ac65e86sm56952755e9.25.2025.07.27.02.55.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 02:55:28 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 27 Jul 2025 11:55:26 +0200
Message-ID: <20250727095526.1006204-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250727095526.1006204-1-thomas.perale@mind.be>
References: <20250727095526.1006204-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1753610130; x=1754214930; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V9WrNZXaq5Tl/VRfmfBuhCt8rODx410zL7IzDWLemwU=;
 b=Doqq6dq0Zmta4LYvG6CehwE67Brng0uksYzycEI95MgOOrTZ0YOzw7UgM9PstZxGjy
 3czidOtfamhB7D0OpSxcGEnsz8Tq9Zw3BGxTM9VHZcWQdwKj/W/dDU/At9ywI9wftK4X
 pFUCEI2Js6fl+h7kevO0Ph5jMN92ad3HPomzYtg7E0QRFpaypCuBe+gL0BW6uuhtSqCq
 wnkFVhjEcKzmrGS7KwkHzy/pBRKEndbcPGQmGxQ8dcvAk84lXriG0L8oRX4swlqVF2TI
 1sYLX8yLs/YjVV/17vrScozZR/J6ADs1gaY5T/N0ksIkXJ3OrCSHi2Z5/VB6HwdpyqU5
 D+Ig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Doqq6dq0
Subject: [Buildroot] [PATCH 3/3] package/orc: bump to version 0.4.41
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

This bump include fix for CVE-2024-40897 which has been addressed in
previous patch.

For more information on the release, see:
  - https://gitlab.freedesktop.org/gstreamer/orc/-/blob/main/RELEASE
  - https://gitlab.freedesktop.org/gstreamer/orc/-/compare/0.4.34..0.4.41

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ror-messages-and-otherwise-vsnprintf.patch | 94 -------------------
 package/orc/orc.hash                          |  4 +-
 package/orc/orc.mk                            |  5 +-
 3 files changed, 3 insertions(+), 100 deletions(-)
 delete mode 100644 package/orc/0001-use-vasprintf-if-available-for-error-messages-and-otherwise-vsnprintf.patch

diff --git a/package/orc/0001-use-vasprintf-if-available-for-error-messages-and-otherwise-vsnprintf.patch b/package/orc/0001-use-vasprintf-if-available-for-error-messages-and-otherwise-vsnprintf.patch
deleted file mode 100644
index 41c5290722..0000000000
--- a/package/orc/0001-use-vasprintf-if-available-for-error-messages-and-otherwise-vsnprintf.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From fb7db9ae3e8ac271651d1884a3611d30bac04a98 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
-Date: Tue, 9 Jul 2024 12:11:37 +0300
-Subject: [PATCH] Use vasprintf() if available for error messages and otherwise
- vsnprintf()
-
-vasprintf() is a GNU/BSD extension and would allocate as much memory as required
-on the heap, similar to g_strdup_printf(). It's ridiculous that such a function
-is still not provided as part of standard C.
-
-If it's not available, use vsnprintf() to at least avoid stack/heap buffer
-overflows, which can lead to arbitrary code execution.
-
-Thanks to Noriko Totsuka for reporting.
-
-Fixes JVN#02030803 / JPCERT#92912620 / CVE-2024-40897
-Fixes #69
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/orc/-/merge_requests/191>
-Upstream: https://gitlab.freedesktop.org/gstreamer/orc/-/commit/fb7db9ae3e8ac271651d1884a3611d30bac04a98
-CVE: CVE-2024-40897
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- meson.build       |  1 +
- orc/orccompiler.c |  6 +++++-
- orc/orcparse.c    | 14 +++++++++++---
- 3 files changed, 17 insertions(+), 4 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index c7ba5d7d..fe8c6016 100644
---- a/meson.build
-+++ b/meson.build
-@@ -128,6 +128,7 @@ int main() {
- '''
- cdata.set('HAVE_MONOTONIC_CLOCK', cc.compiles(monotonic_test))
- cdata.set('HAVE_GETTIMEOFDAY', cc.has_function('gettimeofday'))
-+cdata.set('HAVE_VASPRINTF', cc.has_function('vasprintf'))
- cdata.set('HAVE_POSIX_MEMALIGN', cc.has_function('posix_memalign', prefix : '#include <stdlib.h>'))
- cdata.set('HAVE_MMAP', cc.has_function('mmap'))
- cdata.set('HAVE_SYS_TIME_H', cc.has_header('sys/time.h'))
-diff --git a/orc/orccompiler.c b/orc/orccompiler.c
-index 1e24b8a3..d3394612 100644
---- a/orc/orccompiler.c
-+++ b/orc/orccompiler.c
-@@ -1332,8 +1332,12 @@ orc_compiler_error_valist (OrcCompiler *compiler, const char *fmt,
- 
-   if (compiler->error_msg) return;
- 
-+#ifdef HAVE_VASPRINTF
-+  vasprintf (&s, fmt, args);
-+#else
-   s = malloc (ORC_COMPILER_ERROR_BUFFER_SIZE);
--  vsprintf (s, fmt, args);
-+  vsnprintf (s, ORC_COMPILER_ERROR_BUFFER_SIZE, fmt, args);
-+#endif
-   compiler->error_msg = s;
-   compiler->error = TRUE;
-   compiler->result = ORC_COMPILE_RESULT_UNKNOWN_COMPILE;
-diff --git a/orc/orcparse.c b/orc/orcparse.c
-index b0d67095..ae4f1b6b 100644
---- a/orc/orcparse.c
-+++ b/orc/orcparse.c
-@@ -424,17 +424,25 @@ orc_parse_get_error_where (OrcParser *parser)
- static void
- orc_parse_add_error_valist (OrcParser *parser, const char *format, va_list args)
- {
--  char text[ORC_ERROR_LENGTH] = { '\0' };
--
-   if (parser->error_program != parser->program) {
-     parser->error_program = parser->program;
-   }
- 
--  vsprintf (text, format, args);
-+#ifdef HAVE_VASPRINTF
-+  char *text;
-+  vasprintf (&text, format, args);
-+#else
-+  char text[ORC_ERROR_LENGTH] = { '\0' };
-+  vsnprintf (text, sizeof (text), format, args);
-+#endif
- 
-   orc_vector_append (&parser->errors,
-                      orc_parse_error_new (orc_parse_get_error_where (parser),
-                                           parser->line_number, -1, text));
-+
-+#ifdef HAVE_VASPRINTF
-+  free (text);
-+#endif
- }
- 
- static void
--- 
-GitLab
-
diff --git a/package/orc/orc.hash b/package/orc/orc.hash
index 1e584c1190..1becbca37f 100644
--- a/package/orc/orc.hash
+++ b/package/orc/orc.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/data/src/orc/orc-0.4.34.tar.xz.sha256sum
-sha256  8f47abb3f097171e44eb807adcdabd860fba2effd37d8d3c4fbd5f341cadd41f  orc-0.4.34.tar.xz
+# From https://gstreamer.freedesktop.org/data/src/orc/orc-0.4.41.tar.xz.sha256sum
+sha256  cb1bfd4f655289cd39bc04642d597be9de5427623f0861c1fc19c08d98467fa2  orc-0.4.41.tar.xz
 
 # Locally calculated
 sha256  4f5dabb1b44bb6fc5cd53820b1f103147ad61b395a57903991325bd1b85d97bf  COPYING
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 466e554f6b..6cd34df556 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORC_VERSION = 0.4.34
+ORC_VERSION = 0.4.41
 ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
 ORC_LICENSE = BSD-2-Clause, BSD-3-Clause
@@ -20,8 +20,5 @@ ORC_CONF_OPTS = \
 	-Dtests=disabled \
 	-Dtools=disabled
 
-# 0001-use-vasprintf-if-available-for-error-messages-and-otherwise-vsnprintf.patch
-ORC_IGNORE_CVES += CVE-2024-40897
-
 $(eval $(meson-package))
 $(eval $(host-meson-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
