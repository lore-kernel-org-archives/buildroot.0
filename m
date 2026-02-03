Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163C2E87822
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 12:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BCF283B6E;
	Tue,  3 Feb 2026 12:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id micGw71PU4aE; Tue,  3 Feb 2026 12:24:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FDFE83B83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770121459;
	bh=UEX2Fe3NIgX/AcDuQyWm9BwgZIU1rgASES49oEx7368=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oR3bILkHHsWbHqg3ODDAceXJBvH3Q135RM8dbSn/dc5dpugz2RfieRaZ4P03iYLA4
	 KkIc2cmgIr7n6X9i4FbwgXApw0iWInGkVGTV/m+ZvLPFLip80+fNeYw6z+fcyt29eP
	 R5kh3gy5w8Kc2PA037t1RzXN5EgthU/dtOjKPfEAONY7mFqMASjGUsKjoTnQBAfd+M
	 htSLXln15M57+aQ6ort5URDjRhubU9VrZt1IR0iOfkmtN9buNxi1ewJNah+zP84Vno
	 kUpA5OLZApa0PcRp8nKlSFMJhUw6efYvwetcArPOkJDgL1u7EFdh1Wbl/B+KN7zAUg
	 FlThrVHgfVb4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FDFE83B83;
	Tue,  3 Feb 2026 12:24:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C809BF5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 12:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0F3F40AB9
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 12:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DesTHzIpRjfi for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 12:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D140340A99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D140340A99
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 12:24:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5D3086657; Tue,  3 Feb 2026 12:24:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 12:47:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c15b507838f7d7315610340fcfd1656a62e02cf2
X-Git-Newrev: 34749a2d3e8f95ed3eb262dc9a4319acb44f8c0b
X-Patchwork-Hint: ignore
Message-Id: <20260203122414.A5D3086657@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/safeclib: fix build with gcc >=
 14.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=34749a2d3e8f95ed3eb262dc9a4319acb44f8c0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport two upstream patches to fix build errors introduced by the
bump of gcc to 14.x.

Fixes:
https://autobuild.buildroot.net/results/af6/af65e6386439098ddf706ca43e99320cf5e9fd80/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
