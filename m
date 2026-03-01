Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA226FD0079
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 21:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DBFE40D19;
	Sun,  1 Mar 2026 21:29:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id miVKecPFA13o; Sun,  1 Mar 2026 21:29:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCAF640D20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772400551;
	bh=+tCxBjZrCTT6DOQY9V0h6FB41kbee9l4S2KzQXYQGDI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HFscof9+LdrfpH3/bjVFQP0lovbZv+w4JJOG47Eo6/CWYSSQa4A7gKBT7/RwcI33L
	 ftTxrf/88hnvlPzfsatpAs6z6sFCE9A5ZqSPw6l06WvGL9FuGflhx1q/OKhpjnuy6B
	 mPD0y0b4xfX+sOjsh1P291PKLVUAoEqAkk1bcyL0jaoRvcXc0/LLeWLyKdi4Z4L4U8
	 RExDsIBte6pGtbHDxTLZLgBY05CcHIFw/trS/yqsmQA5zLDOh05/rAnm6arbSbbMZr
	 aob3GdRvfw0qYxMfV0p+ClwILgemRgTUN+meTaufIFOpqHP1Aj8Dr/JOzK5yDFIkYb
	 SQkxsOu+xqNfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCAF640D20;
	Sun,  1 Mar 2026 21:29:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B0CEA24E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 21:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96D2F40894
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 21:29:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MjJ8pbL4vxIw for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 21:29:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9F8140515
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9F8140515
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 21:29:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B843A8469E; Sun,  1 Mar 2026 21:29:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Mar 2026 22:26:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88d1fde405054b2f39a5a12531a3a50b32c254db
X-Git-Newrev: d88660265bd80591034caf0dbb95236342a2c823
X-Patchwork-Hint: ignore
Message-Id: <20260301212909.B843A8469E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/safeclib: fix build error with gcc
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d88660265bd80591034caf0dbb95236342a2c823
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-vsnprintf_s-Increase-Buffer-Size-by-1.patch | 47 ++++++++++++++++++++
 ...002-vsnprintf_s-Increase-Buffer-Size-by-1.patch | 50 ++++++++++++++++++++++
 2 files changed, 97 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
