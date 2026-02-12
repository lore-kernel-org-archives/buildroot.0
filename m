Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D051EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DB1642076;
	Fri, 13 Feb 2026 19:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLmvfv00npAa; Fri, 13 Feb 2026 19:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 515BB42077
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011506;
	bh=F3cYpcxfXCxm4s5n8auOTR35/UM8pzS9gBXj1AK8WfE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XY3STVc3YNCjQ+Q9KSsJ7brnEDGrX7jkIGKVz69GummRC0YlBQmJqHe+NstVfpgCp
	 rka5GL+QOEY+uFHrRq/lRrIgpxilrCyHDbLQ7Hv7YXS+lVR+Npznyh578DeZXypxyJ
	 TLF5k8brKRjM43uxXjeYLrwEMmq4rPR9Pqx6Pt+HrGFsgmksKGB1NCW5/xg77HnrUv
	 9d1rCbDTFEAol6LK0lZxgwQOmdM9Ana7QPFZfMmZuK9zWKaOoPg5OO5lbwF669qqDo
	 m2d3UqihDrn/iHP2SwgLf//4lviGvieNcyszqyErjHQs0K/75973CsiU6mH+deZ/xU
	 kIBC/YCep5V3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 515BB42077;
	Fri, 13 Feb 2026 19:38:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 318B369
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B35EB413FE
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxJs7IfIcndc for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F9FC41309
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F9FC41309
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 651AE7F89B; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:59:34 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: dfedd20a8c9c3ee6cbc18d2b7f8bc5ca324e387d
X-Git-Newrev: 8b3854b54aa9ba6d74b18524f4c95266cc258445
X-Patchwork-Hint: ignore
Message-Id: <20260213193703.651AE7F89B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/safeclib: fix
 build with gcc >= 14.x
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b3854b54aa9ba6d74b18524f4c95266cc258445
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Backport two upstream patches to fix build errors introduced by the
bump of gcc to 14.x.

Fixes:
https://autobuild.buildroot.net/results/af6/af65e6386439098ddf706ca43e99320cf5e9fd80/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 34749a2d3e8f95ed3eb262dc9a4319acb44f8c0b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...002-vsnprintf_s-Increase-Buffer-Size-by-1.patch | 51 ++++++++++++++++++++++
 ...003-vsnprintf_s-Increase-Buffer-Size-by-1.patch | 49 +++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch b/package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch
new file mode 100644
index 0000000000..eae11dcc0d
--- /dev/null
+++ b/package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch
@@ -0,0 +1,51 @@
+From 62051f9761f92dc99c8ce0552239ad10e2062168 Mon Sep 17 00:00:00 2001
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
+Upstream: https://github.com/rurban/safeclib/pull/150
+
+[backported to version 3.7.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/str/vsnprintf_s.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/str/vsnprintf_s.c b/src/str/vsnprintf_s.c
+index 59dbda94..ca838df1 100644
+--- a/src/str/vsnprintf_s.c
++++ b/src/str/vsnprintf_s.c
+@@ -296,7 +296,7 @@ static size_t safec_ntoa_long(out_fct_type out,  const char *funcname,
+                               unsigned long base, unsigned int prec,
+                               unsigned int width, unsigned int flags)
+ {
+-    char buf[PRINTF_NTOA_BUFFER_SIZE];
++    char buf[PRINTF_NTOA_BUFFER_SIZE + 1];
+     size_t len = 0U;
+ 
+     // no hash for 0 values
+-- 
+2.47.3
+
diff --git a/package/safeclib/0003-vsnprintf_s-Increase-Buffer-Size-by-1.patch b/package/safeclib/0003-vsnprintf_s-Increase-Buffer-Size-by-1.patch
new file mode 100644
index 0000000000..2dabebf3b2
--- /dev/null
+++ b/package/safeclib/0003-vsnprintf_s-Increase-Buffer-Size-by-1.patch
@@ -0,0 +1,49 @@
+From dea3c2e1aa1b775baa690b9ef40239f881c5f068 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Submitted [https://github.com/rurban/safeclib/pull/148]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://github.com/rurban/safeclib/commit/f59a0c8c1b5cf19cd0ed7f9bfb3a1e85f54113d0
+
+[backported to version 3.7.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/str/vsnprintf_s.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/str/vsnprintf_s.c b/src/str/vsnprintf_s.c
+index ca838df1..8ef6989a 100644
+--- a/src/str/vsnprintf_s.c
++++ b/src/str/vsnprintf_s.c
+@@ -369,7 +369,7 @@ static size_t safec_ftoa(out_fct_type out,  const char *funcname,
+                          double value, unsigned int prec, unsigned int width,
+                          unsigned int flags)
+ {
+-    char buf[PRINTF_FTOA_BUFFER_SIZE];
++    char buf[PRINTF_FTOA_BUFFER_SIZE + 1];
+     size_t len = 0U;
+     double tmp;
+     double diff = 0.0;
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
