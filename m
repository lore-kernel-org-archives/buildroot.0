Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D590C52D7F
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 12:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ADF08119D;
	Sat, 17 Aug 2024 12:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qOTQHRxF4osu; Sat, 17 Aug 2024 12:30:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2F19811C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2F19811C0;
	Sat, 17 Aug 2024 12:30:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B04F61BF356
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 12:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D98140311
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 12:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9tG0y3dOitiq for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 12:30:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C8E3C4030C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8E3C4030C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8E3C4030C
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 12:30:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 66C9F20009;
 Sat, 17 Aug 2024 12:30:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 Aug 2024 14:30:39 +0200
Message-ID: <20240817123040.841448-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817123040.841448-1-thomas.petazzoni@bootlin.com>
References: <20240817123040.841448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723897842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B2NN91HS4HRbdqIPeyNnzzacUr3rVwy0jzs7nQO1InY=;
 b=a7OTNbuMc4I/7i/rD/NS/YyQyKgjdwfooxxmr+F4B4ACr9AplTB86fiyDFQYflafzcWBjO
 ZE70P/cjW6mO6KhsQARTU+6Yv9tkgjQIWYiZEh2nPlX3vAmOq6wZY76Vc0vnuD2If0oW98
 lHslJ6XVLRrlIvHJ0G6a8ubcyGsx6NZ5P/I0PKMOxL75GDFLBVpeXwpTDlALMlbSpoyiCt
 23WuEZXkjo4aXeh66DYRoB4WqQVb5tnhlbPzw6WY1uaM2ovHxUUDWGvXDnsZjQxo8FowBe
 miHELqX6qiUMJFt3/oQMfGXzCmxfAvYt4Oslzmc7Npt5/u1toonKa6nZeBWU9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a7OTNbuM
Subject: [Buildroot] [PATCH 2/2] package/libffi: fix build on OpenRISC
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The build of libffi on OpenRISC is broken with GCC 14.x. This commit
brings two patches, submitted upstream, that address those two build
issues. Both issues always existed in the OpenRISC libffi code base.

Fixes:

  http://autobuild.buildroot.net/results/fb95d9a0f8322a58cd266014f3dea4eaa1b483e5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ffi.c-fix-prototype-of-ffi_call_SYSV.patch | 47 +++++++++++++++++
 ...-ffi.c-fix-incompatible-pointer-type.patch | 50 +++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 package/libffi/0004-src-or1k-ffi.c-fix-prototype-of-ffi_call_SYSV.patch
 create mode 100644 package/libffi/0005-src-or1k-ffi.c-fix-incompatible-pointer-type.patch

diff --git a/package/libffi/0004-src-or1k-ffi.c-fix-prototype-of-ffi_call_SYSV.patch b/package/libffi/0004-src-or1k-ffi.c-fix-prototype-of-ffi_call_SYSV.patch
new file mode 100644
index 0000000000..f3a7b29e3b
--- /dev/null
+++ b/package/libffi/0004-src-or1k-ffi.c-fix-prototype-of-ffi_call_SYSV.patch
@@ -0,0 +1,47 @@
+From 4506e943289ed1363f3921bc201d5da76f750229 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 17 Aug 2024 12:56:22 +0200
+Subject: [PATCH] src/or1k/ffi.c: fix prototype of ffi_call_SYSV()
+
+The current code base of libffi on OpenRISC (or1k) fails to build with
+GCC 14.x with the following error:
+
+../src/or1k/ffi.c: In function 'ffi_call':
+../src/or1k/ffi.c:167:34: error: passing argument 3 of 'ffi_call_SYSV' from incompatible pointer type [-Wincompatible-pointer-types]
+  167 |       ffi_call_SYSV(size, &ecif, ffi_prep_args, rvalue, fn, cif->flags);
+      |                                  ^~~~~~~~~~~~~
+      |                                  |
+      |                                  void * (*)(char *, extended_cif *)
+../src/or1k/ffi.c:113:27: note: expected 'void * (*)(int *, extended_cif *)' but argument is of type 'void * (*)(char *, extended_cif *)'
+  113 |                           void *(*)(int *, extended_cif *),
+      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+This is due to the fact that ffi_prep_args() is in fact defined as:
+
+  void* ffi_prep_args(char *stack, extended_cif *ecif)
+
+so, let's fix the prototype of the function pointer, which anyway gets
+passed to assembly code, so the typing gets lost.
+
+Upstream: https://github.com/libffi/libffi/pull/854
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/or1k/ffi.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/or1k/ffi.c b/src/or1k/ffi.c
+index 9451d4e..157388e 100644
+--- a/src/or1k/ffi.c
++++ b/src/or1k/ffi.c
+@@ -110,7 +110,7 @@ void* ffi_prep_args(char *stack, extended_cif *ecif)
+ 
+ extern void ffi_call_SYSV(unsigned,
+                           extended_cif *,
+-                          void *(*)(int *, extended_cif *),
++                          void *(*)(char *, extended_cif *),
+                           unsigned *,
+                           void (*fn)(void),
+                           unsigned);
+-- 
+2.46.0
+
diff --git a/package/libffi/0005-src-or1k-ffi.c-fix-incompatible-pointer-type.patch b/package/libffi/0005-src-or1k-ffi.c-fix-incompatible-pointer-type.patch
new file mode 100644
index 0000000000..e1ff003500
--- /dev/null
+++ b/package/libffi/0005-src-or1k-ffi.c-fix-incompatible-pointer-type.patch
@@ -0,0 +1,50 @@
+From ec39b03d891a77552ad7729ff79bf21bf3591842 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 17 Aug 2024 13:52:45 +0200
+Subject: [PATCH] src/or1k/ffi.c: fix incompatible pointer type
+
+The current code base of libffi on OpenRISC (or1k) fails to build with
+GCC 14.x with the following error:
+
+../src/or1k/ffi.c: In function 'ffi_closure_SYSV':
+../src/or1k/ffi.c:183:22: error: initialization of 'char *' from incompatible pointer type 'int *' [-Wincompatible-pointer-types]
+  183 |   char *stack_args = sp;
+      |                      ^~
+
+Indeed:
+
+  register int *sp __asm__ ("r17");
+  [..]
+  char *stack_args = sp;
+
+Adopt the same logic used for:
+
+  char *ptr = (char *) register_args;
+
+which consists in casting to the desired pointer type. Indeed, later
+in the code stack_args is assigned to ptr (so they need to be the same
+pointer type), and some arithmetic is done on ptr, so changing its
+pointer type would change the behavior.
+
+Upstream: https://github.com/libffi/libffi/pull/854
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/or1k/ffi.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/or1k/ffi.c b/src/or1k/ffi.c
+index 157388e..7a6d28c 100644
+--- a/src/or1k/ffi.c
++++ b/src/or1k/ffi.c
+@@ -180,7 +180,7 @@ void ffi_closure_SYSV(unsigned long r3, unsigned long r4, unsigned long r5,
+   register int *r13 __asm__ ("r13");
+ 
+   ffi_closure* closure = (ffi_closure*) r13;
+-  char *stack_args = sp;
++  char *stack_args = (char*) sp;
+ 
+   /* Lay the register arguments down in a continuous chunk of memory.  */
+   unsigned register_args[6] =
+-- 
+2.46.0
+
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
