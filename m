Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D015C52D7F
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 12:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA88580D59;
	Sat, 17 Aug 2024 12:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFhPnju9weVy; Sat, 17 Aug 2024 12:30:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3A7D80D73
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3A7D80D73;
	Sat, 17 Aug 2024 12:30:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 723341BF356
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 12:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B9D380D73
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 12:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6L1ZQ5W7YcN for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 12:30:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C87CF80D59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C87CF80D59
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C87CF80D59
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 12:30:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id AA71B20002;
 Sat, 17 Aug 2024 12:30:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 Aug 2024 14:30:38 +0200
Message-ID: <20240817123040.841448-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723897841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=DjCH6fCnLkRFUweGFSa9tRu6jwaCC2pIKloSK425X/4=;
 b=gA69EZb70T7cN0g86TBkOhFGdMneekGlyipH+1YvZsa9vSYiCNFEoKd5A2xkuFK0U4/u17
 AWfOF4Drlv/rW3TAkgjYEXzx8XPOmBFFgsDLy5MkNpiVCdVksiNwLQijGPMgBzSFXdPAoU
 bkVVBk9O2Ns+5kO9U2pUk6D+YOKwFsABUMCLWvZPfhVnPqpNxbWi1fisSoR4sxYXmU5hk5
 qoubiHtAnrfItJdii0BSJuny+SJobGhDbAUmd99KC8fbDQQsydIqElnORMuS0NCe9PXfo1
 77gCRjTM+ENxJujHmx5Hog59z2MjdhjL+2owxZm4vsYHmVxBhOe0PX2fG2sLog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gA69EZb7
Subject: [Buildroot] [PATCH 1/2] package/libffi: fix build on ARC
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

This commit brings two patches that have been submitted to upstream
libffi by Synopsys people, to fix libffi build issues on ARC.

This build issue was introduced by upstream commit
c4df19c99f8d8841942e3edaadbf331d30e298c8, which landed in libffi
3.4.5, so the issue exists in Buildroot since we bumped from libffi
3.4.4 to 3.4.6 in commit f382de2b0f8a528a09bb975cc088a4342b663134,
which landed in Buildroot 2024.05. This issue therefore doesn't exist
in the 2024.02.x LTS branch.

Fixes:

  http://autobuild.buildroot.net/results/3accebc6775b9a479876a5898d55bde005d4b12b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libffi/0002-arc-Fix-warnings.patch    | 56 +++++++++++++++++++
 ...ot-use-mov_s-and-movl_s-instructions.patch | 45 +++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 package/libffi/0002-arc-Fix-warnings.patch
 create mode 100644 package/libffi/0003-arc-Do-not-use-mov_s-and-movl_s-instructions.patch

diff --git a/package/libffi/0002-arc-Fix-warnings.patch b/package/libffi/0002-arc-Fix-warnings.patch
new file mode 100644
index 0000000000..45a2c9dbd7
--- /dev/null
+++ b/package/libffi/0002-arc-Fix-warnings.patch
@@ -0,0 +1,56 @@
+From 4f25e5be1a8a429b6925527c1cb94b6acd05642b Mon Sep 17 00:00:00 2001
+From: Yuriy Kolerov <ykolerov@synopsys.com>
+Date: Wed, 17 Jul 2024 18:56:52 +0300
+Subject: [PATCH] arc: Fix warnings
+
+These warnings are fixed:
+
+1. A series of "unused variables".
+2. Implicit conversion from a pointer to uint32_t.
+
+Signed-off-by: Yuriy Kolerov <ykolerov@synopsys.com>
+Upstream: https://github.com/libffi/libffi/pull/844
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/arc/ffi.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/arc/ffi.c b/src/arc/ffi.c
+index d729274..0632319 100644
+--- a/src/arc/ffi.c
++++ b/src/arc/ffi.c
+@@ -192,9 +192,10 @@ static void unmarshal_atom(call_builder *cb, int type, void *data) {
+ /* for arguments passed by reference returns the pointer, otherwise the arg is copied (up to MAXCOPYARG bytes) */
+ static void *unmarshal(call_builder *cb, ffi_type *type, int var, void *data) {
+   size_t realign[2];
+-  void *pointer;
+ 
+ #if defined(__ARC64_ARCH64__)
++  void *pointer;
++
+   if (type->size > 2 * __SIZEOF_POINTER__) {
+         /* pass by reference */
+         unmarshal_atom(cb, FFI_TYPE_POINTER, (char*)&pointer);
+@@ -348,7 +349,10 @@ ffi_prep_closure_loc (ffi_closure * closure, ffi_cif * cif,
+ 		      void *user_data, void *codeloc)
+ {
+   uint32_t *tramp = (uint32_t *) & (closure->tramp[0]);
++
++#if defined(__ARC64_ARCH64__)
+   size_t address_ffi_closure = (size_t) ffi_closure_asm;
++#endif
+ 
+   switch (cif->abi)
+     {
+@@ -367,7 +371,7 @@ ffi_prep_closure_loc (ffi_closure * closure, ffi_cif * cif,
+       FFI_ASSERT (tramp == codeloc);
+       tramp[0] = CODE_ENDIAN (0x200a1fc0);	/* mov r8, pcl  */
+       tramp[1] = CODE_ENDIAN (0x20200f80);	/* j [long imm] */
+-      tramp[2] = CODE_ENDIAN (ffi_closure_asm);
++      tramp[2] = CODE_ENDIAN ((uint32_t) ffi_closure_asm);
+       break;
+ #endif
+ 
+-- 
+2.46.0
+
diff --git a/package/libffi/0003-arc-Do-not-use-mov_s-and-movl_s-instructions.patch b/package/libffi/0003-arc-Do-not-use-mov_s-and-movl_s-instructions.patch
new file mode 100644
index 0000000000..3577ddf19d
--- /dev/null
+++ b/package/libffi/0003-arc-Do-not-use-mov_s-and-movl_s-instructions.patch
@@ -0,0 +1,45 @@
+From 97c273519e41a7ef2841cb7531c6eda01fc69dc2 Mon Sep 17 00:00:00 2001
+From: Yuriy Kolerov <ykolerov@synopsys.com>
+Date: Wed, 17 Jul 2024 19:19:30 +0300
+Subject: [PATCH] arc: Do not use mov_s and movl_s instructions
+
+mov_s and movl_s instructions use a restricted set of registers.
+However, a list of available registers for such instructions for
+one ARC target may not match a list for another ARC targets. For
+example, it is applicable to ARC700 and ARC HS3x/4x - build
+fails because mov_s formats may be incompatible in some cases.
+
+The easiest and the most straightforward way to fix this issue
+is to use mov and movl instead of mov_s and movl_s.
+
+Signed-off-by: Yuriy Kolerov <ykolerov@synopsys.com>
+Upstream: https://github.com/libffi/libffi/pull/844
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/arc/arcompact.S | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/arc/arcompact.S b/src/arc/arcompact.S
+index 1d7f1a1..e749341 100644
+--- a/src/arc/arcompact.S
++++ b/src/arc/arcompact.S
+@@ -39,14 +39,14 @@
+ #define LARG ldl
+ #define SARG stl
+ #define ADDPTR addl
+-#define MOVPTR movl_s
++#define MOVPTR movl
+ #else
+ #define PTRS 4
+ #define FLTS 4
+ #define LARG ld
+ #define SARG st
+ #define ADDPTR add
+-#define MOVPTR mov_s
++#define MOVPTR mov
+ #endif
+ 
+ #define FRAME_LEN (8 * PTRS + 16)
+-- 
+2.46.0
+
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
