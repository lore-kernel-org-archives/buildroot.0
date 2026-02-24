Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0564FF4BB8E
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 21:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 116FD834D3;
	Tue, 24 Feb 2026 21:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrwKAtkbj726; Tue, 24 Feb 2026 21:57:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 738F882F11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771970265;
	bh=n7RavXKT+FEotqHFuIDur4SVuVQTQfewd2M9hd2cj8w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qFZ3W6IngtNqBKMWz2+bP3O6XU1OkmtC1ayzjJFxpXI2KUU+oZ0wUfiRzE+6ztcxG
	 eJqOA7eaXJjFPxhpi32IFBWfXkJcSLQYgFBXRuhu2MTROjbz3vffA8FLLQlvPiyJn9
	 Y69KWtk9pL43gMXiGBq4HI+cK63taO4ArHGN8OTVHqNr5AfblB/AUQVsxVrXgBzU19
	 9kcRN1AV5cxEYnYEtQ5ibNISCRV+7UqDGyGMC6J9QXyiE7rzlRQiwfeakz2RAO2SCa
	 H6sZrIZ4LFD+fMn7TDPOU4p2bkA4haj/0bMEonEeZqnf9riLjbmvBzi0E5u0e0Qjik
	 H8/nKWqSm+E9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 738F882F11;
	Tue, 24 Feb 2026 21:57:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E151523D
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 21:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6E44405D8
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 21:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ArI2w5DBDDkf for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 21:57:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 486F840B16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 486F840B16
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 486F840B16
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 21:57:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1955A4C258F;
 Tue, 24 Feb 2026 22:57:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58766)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vv0PS-0000000055C-2fG3;
 Tue, 24 Feb 2026 21:57:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 24 Feb 2026 22:57:38 +0100
Message-ID: <20260224215738.818318-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771970258;
 bh=SRZuEHVnDaugA65Si+oNGxDGaWctVghaUUE6sernZpM=;
 h=From:To:Cc:Subject:Date:From;
 b=W5L+5FvOVXjLskCDsOs0ZKKAfKAbstypxtPw3FDvvPuYSD9Whqa0bvlygPEIjZadS
 VA3/YaS6kyJdl3DVW3G6BiYGvV0OoNgMB23HsWNm5XoG68uvmRW5MByFd7egP7ykix
 Wf6WXHadu6o2kVzqIaAE9jnvXF1HqFEuj11paaLvyvTBxT10FDjc338kXkOxgX5HOI
 Uo+H00Y+WohTTDsqHvRA3O/qFStiBaxy28kFQT2/zgeBacm7YAmRVOXQcjEfoVNf37
 e1lzeroS3uwrkl3ejLnzPImI98XQezpkECV9akYQCAqXqKpoybMJ+IwhIR+4GN+s76
 2gBPW+0/dDPhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=W5L+5FvO
Subject: [Buildroot] [PATCH 1/1] package/safeclib: fix build error with gcc
 15.x
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

This defconfig can be built without problems:

BR2_x86_64=y
BR2_GCC_VERSION_15_X=y
BR2_PACKAGE_SAFECLIB=y

However adding rocketlake as architecture variant

BR2_x86_64=y
BR2_x86_rocketlake=y
BR2_GCC_VERSION_15_X=y
BR2_PACKAGE_SAFECLIB=y

causes a build error:

str/vsnprintf_s.c: In function 'safec_ftoa.isra':
str/vsnprintf_s.c:523:24: error: writing 32 bytes into a region of size
 31 [-Werror=stringop-overflow=]
  523 |             buf[len++] = '0';

with gcc 15.x only, gcc =< 14.x is not affected, reason unknown.

This commit adds two upstream commits which fix the problem.

No autobuilder error was recorded.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...snprintf_s-Increase-Buffer-Size-by-1.patch | 47 +++++++++++++++++
 ...snprintf_s-Increase-Buffer-Size-by-1.patch | 50 +++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 package/safeclib/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch
 create mode 100644 package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch

diff --git a/package/safeclib/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch b/package/safeclib/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch
new file mode 100644
index 0000000000..f99f56f08c
--- /dev/null
+++ b/package/safeclib/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch
@@ -0,0 +1,47 @@
+From f59a0c8c1b5cf19cd0ed7f9bfb3a1e85f54113d0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 Aug 2025 20:23:48 -0700
+Subject: [PATCH] vsnprintf_s: Increase Buffer Size by 1
+
+It is a buffer overflow warning that GCC 15.2 is catching.
+The issue is that it's trying to write to `buf[len++]` when len could
+potentially be 31, which would write to buf[31] in a buffer of size 32
+(valid indices 0-31), but the len++ post-increment means it could
+theoretically write beyond the buffer bounds.
+
+Fixes
+
+../../sources/safec-3.9.1/src/str/vsnprintf_s.c: In function 'safec_ftoa.isra':
+../../sources/safec-3.9.1/src/str/vsnprintf_s.c:523:24: error: writing 32 bytes into a region of size 31 [-Werror=stringop-overflow=]
+  523 |             buf[len++] = '0';
+      |             ~~~~~~~~~~~^~~~~
+../../sources/safec-3.9.1/src/str/vsnprintf_s.c:394:10: note: at offset [1, 32] into destination object 'buf' of size 32
+  394 |     char buf[PRINTF_FTOA_BUFFER_SIZE];
+      |          ^~~
+cc1: all warnings being treated as errors
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://github.com/rurban/safeclib/commit/f59a0c8c1b5cf19cd0ed7f9bfb3a1e85f54113d0
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/str/vsnprintf_s.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/str/vsnprintf_s.c b/src/str/vsnprintf_s.c
+index fa53ab42..0b62c3cb 100644
+--- a/src/str/vsnprintf_s.c
++++ b/src/str/vsnprintf_s.c
+@@ -391,7 +391,7 @@ static size_t safec_ftoa(out_fct_type out, const char *funcname, char *buffer,
+                          size_t idx, size_t maxlen, double value,
+                          unsigned int prec, unsigned int width,
+                          unsigned int flags) {
+-    char buf[PRINTF_FTOA_BUFFER_SIZE];
++    char buf[PRINTF_FTOA_BUFFER_SIZE + 1]; // Add extra byte for safety
+     size_t len = 0U, off = 0U;
+     double tmp;
+     double diff = 0.0;
+-- 
+2.47.3
+
diff --git a/package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch b/package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch
new file mode 100644
index 0000000000..4301426747
--- /dev/null
+++ b/package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch
@@ -0,0 +1,50 @@
+From 79e1445f4b3689526b46121b1218cab802b9ae88 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 10 Jan 2026 12:16:22 +0100
+Subject: [PATCH] vsnprintf_s: Increase Buffer Size by 1
+
+Another fix similar to https://github.com/rurban/safeclib/commit/f59a0c8c1b5cf19cd0ed7f9bfb3a1e85f54113d0
+
+In function 'safec_ntoa_format',
+    inlined from 'safec_ntoa_long' at str/vsnprintf_s.c:331:12:
+str/vsnprintf_s.c:256:24: error: writing 32 bytes into a region of size 0 [-Werror=stringop-overflow=]
+  256 |             buf[len++] = '0';
+      |             ~~~~~~~~~~~^~~~~
+str/vsnprintf_s.c: In function 'safec_ntoa_long':
+str/vsnprintf_s.c:312:10: note: at offset 32 into destination object 'buf' of size 32
+  312 |     char buf[PRINTF_NTOA_BUFFER_SIZE];
+      |          ^~~
+In function 'safec_ntoa_format',
+    inlined from 'safec_ntoa_long' at str/vsnprintf_s.c:331:12:
+str/vsnprintf_s.c:260:24: error: writing 32 bytes into a region of size 0 [-Werror=stringop-overflow=]
+  260 |             buf[len++] = '0';
+      |             ~~~~~~~~~~~^~~~~
+str/vsnprintf_s.c: In function 'safec_ntoa_long':
+str/vsnprintf_s.c:312:10: note: at offset 32 into destination object 'buf' of size 32
+  312 |     char buf[PRINTF_NTOA_BUFFER_SIZE];
+      |          ^~~
+cc1: all warnings being treated as errors
+
+Upstream: https://github.com/rurban/safeclib/commit/79e1445f4b3689526b46121b1218cab802b9ae88
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/str/vsnprintf_s.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/str/vsnprintf_s.c b/src/str/vsnprintf_s.c
+index 0b62c3cb..cf8e866e 100644
+--- a/src/str/vsnprintf_s.c
++++ b/src/str/vsnprintf_s.c
+@@ -309,7 +309,7 @@ static size_t safec_ntoa_long(out_fct_type out, const char *funcname,
+                               unsigned long value, bool negative,
+                               unsigned long base, unsigned int prec,
+                               unsigned int width, unsigned int flags) {
+-    char buf[PRINTF_NTOA_BUFFER_SIZE];
++    char buf[PRINTF_NTOA_BUFFER_SIZE + 1];
+     size_t len = 0U;
+ 
+     // no hash for 0 values
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
