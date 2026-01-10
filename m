Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C65D277EB
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 13:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97AA560809;
	Sat, 10 Jan 2026 13:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DzKII9dFuan; Sat, 10 Jan 2026 13:39:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0867B606F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768052352;
	bh=wIdyvhi5+SlE9SXiCb4RJ4eMqe3gdMTy/iM1EQ33vQk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TZrYy0Vy88qmBdnIa+lqQHFPDLKcx2th3jmfjd9qd6W5xfTuRH56NYOLicXR1CFjD
	 JWG9xPPOWQ4b+M7LB9EjTMRMLHUapqSk5/1COkPksqLDPRz35kZLegZL8lD6lszm6V
	 xyZmoy8TSJSZRzjVhMX5Nz7Yn/HaccCIRharxr94y7J9FbI77CAUAOxj52pWTE36lb
	 kA62YALTHjDV9OKt4FCJrzbOZwuYZiBaEB4nHt/zZN56noKiOQR0Mo3op8LazWF0G7
	 Vk0h7RPUGO5d8htlEvL01MdnFY9gO9xVNXjln6FVDt7ASa6aTTBNcaE9nVAkwMuCq4
	 4EPR3rKEXwqHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0867B606F5;
	Sat, 10 Jan 2026 13:39:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C951131
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 13:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C1B140414
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 13:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JHlR_4fimaES for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 13:39:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 94B754019E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94B754019E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94B754019E
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 13:39:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b915.dip0.t-ipconnect.de [84.161.185.21])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0E9B6A4C04D7;
 Sat, 10 Jan 2026 14:39:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53002)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1veZBJ-0000000070J-1hcs;
 Sat, 10 Jan 2026 13:39:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Jan 2026 14:39:04 +0100
Message-ID: <20260110133905.2518546-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768052346;
 bh=osbTjvCifZTHjPJ+EL9A75o62/WtSQmoPp2u3jNRFD8=;
 h=From:To:Cc:Subject:Date:From;
 b=FO/5bVxVW/j/q10qUms/r8WJ/QKLXZA6S282O4TX/dUveliKPLTbOTJuzLFj7fn54
 u7yHeCMl0SRxdA2y0VW8XPusVqTuG1W+gA/4eMCd2O5TlQprg/Rv5SUkdw3qa6TKr4
 kS9yTreI0amAGw+bb+m9h/O+72xkID7cj8/bieMPmUqVrEmqbr0h95sCVecPE0m7Gm
 zPeBLffzrcjZItE5UNWipMIrVcs5LT+USd8QykKCgySo9vbciyhurB6ZPKTBvjZ1np
 uJpnP0YwMuFj4AuHqQ7WSBcW39O/nUnUCb8yU0SJhOB9GPTvWaKZj0JsCWlRXHZzTR
 94CK03K4Vw0bg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=FO/5bVxV
Subject: [Buildroot] [PATCH 1/2] package/safeclib: fix build with gcc-14.x
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

Backported two upstream patches to fix build errors introduced by the
bump of gcc to 14.x.

Renamed patch 0001 to prepare its removal with the upcoming version bump
of safelib, added Upstream: tag.

Fixes:
https://autobuild.buildroot.net/results/af6/af65e6386439098ddf706ca43e99320cf5e9fd80/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...snprintf_s-Increase-Buffer-Size-by-1.patch | 51 +++++++++++++++++++
 ...snprintf_s-Increase-Buffer-Size-by-1.patch | 49 ++++++++++++++++++
 ...3-fix-armv7-asm-inline-error-GH-115.patch} |  4 +-
 4 files changed, 102 insertions(+), 3 deletions(-)
 create mode 100644 package/safeclib/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch
 create mode 100644 package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch
 rename package/safeclib/{0001-fix-armv7-asm-inline-error-GH-115.patch => 0003-fix-armv7-asm-inline-error-GH-115.patch} (98%)

diff --git a/.checkpackageignore b/.checkpackageignore
index ad02938884..2502803da3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -873,7 +873,6 @@ package/rubix/0001-dont-use-legacy-functions.patch lib_patch.Upstream
 package/rubix/0002-misc-fixes.patch lib_patch.Sob lib_patch.Upstream
 package/rygel/S99rygel Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/s6-linux-init/0001-configure-add-D_GNU_SOURCE.patch lib_patch.Upstream
-package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch lib_patch.Upstream
 package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch lib_patch.Upstream
 package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch lib_patch.Upstream
 package/samba4/S91smb Shellcheck lib_sysv.Indent lib_sysv.Variables
diff --git a/package/safeclib/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch b/package/safeclib/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch
new file mode 100644
index 0000000000..eae11dcc0d
--- /dev/null
+++ b/package/safeclib/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch
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
diff --git a/package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch b/package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch
new file mode 100644
index 0000000000..2dabebf3b2
--- /dev/null
+++ b/package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch
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
diff --git a/package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch b/package/safeclib/0003-fix-armv7-asm-inline-error-GH-115.patch
similarity index 98%
rename from package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch
rename to package/safeclib/0003-fix-armv7-asm-inline-error-GH-115.patch
index 3cb37b96f5..bf14812318 100644
--- a/package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch
+++ b/package/safeclib/0003-fix-armv7-asm-inline-error-GH-115.patch
@@ -7,8 +7,8 @@ some armv7 buildroot variants fail on asm.
 we already probe for that, so use it.
 Fixes GH #115
 
-[Retrieved from:
-https://github.com/rurban/safeclib/commit/9c739800a8915d5f2a73c840190920e95ffa1c5c]
+Upstream: https://github.com/rurban/safeclib/commit/9c739800a8915d5f2a73c840190920e95ffa1c5c
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  tests/perf_private.h | 49 +++++++++++++++++++++++++-------------------
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
