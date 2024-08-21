Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E1EC52D6F
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 07:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CB5E4039D;
	Wed, 21 Aug 2024 07:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id itKnb_nVk9vw; Wed, 21 Aug 2024 07:37:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A6C14066D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A6C14066D;
	Wed, 21 Aug 2024 07:37:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F8ED1BF38B
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 07:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59E5540C2B
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 07:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tRGCSdRdp5D for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 07:37:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A58A440472
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A58A440472
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A58A440472
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 07:37:44 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D85B33535C1F; Wed, 21 Aug 2024 09:37:41 +0200 (CEST)
Date: Wed, 21 Aug 2024 09:37:41 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsWZRc1pbliUXAk7@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724225861; bh=GCCEbiiiDxEXmTS/XJBJez2WC996OZYvpAh19TROZAQ=;
 h=Date:From:To:Subject:From;
 b=fbHUQYhM+qfQ7rhdJUUtZmgUxnrDDc4C5eKqK7taFXkuyEu4SVPmtFmV0HBq2rVfK
 wIVAiFjuGMo9QH6Kx1xdVny8f5rhybXMcOkD8MMFe/5HuKnu4sQyOTux3RVnD+i8ws
 cqlttvBWDbuTrArEzeETH5MnQNtX6t9/7eJQJathDdT+DSt+7fe4Hz/RaCwq75d8pY
 yZDnLSVaPOQUAjC40UgEJJ6UJlX+dEKbfaDclUNgX2gPFjHvhVkUCxRxTeFNFddCah
 U9ohowCtUmNJB5b6nZAU2SsB41j23uXp9Bg3G/OZzC+PwzQUnSYapTaxZ5+wh2QLsC
 erJt9V0w53LPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=fbHUQYhM
Subject: [Buildroot] [PATCH] package/elf2flt: fix riscv64 C++ compilations
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:

 http://autobuild.buildroot.org/results/63f/63f32c9d5d4097ef2b3cbba1ce665e13e9dbd430

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ..._RISCV_SET_ULEB128-R_RISCV_SUB_ULEB1.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/elf2flt/0001-riscv64-handle-R_RISCV_SET_ULEB128-R_RISCV_SUB_ULEB1.patch

diff --git a/package/elf2flt/0001-riscv64-handle-R_RISCV_SET_ULEB128-R_RISCV_SUB_ULEB1.patch b/package/elf2flt/0001-riscv64-handle-R_RISCV_SET_ULEB128-R_RISCV_SUB_ULEB1.patch
new file mode 100644
index 0000000000..3aba6eca08
--- /dev/null
+++ b/package/elf2flt/0001-riscv64-handle-R_RISCV_SET_ULEB128-R_RISCV_SUB_ULEB1.patch
@@ -0,0 +1,30 @@
+From 5b8288257c66c76cc578935276dc5b512010b6a3 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Wed, 21 Aug 2024 07:23:19 +0200
+Subject: [PATCH] riscv64: handle R_RISCV_SET_ULEB128/R_RISCV_SUB_ULEB128
+
+For C++ applications or libraries like gdbserver or gmp
+we need to handle these relocations.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://github.com/uclinux-dev/elf2flt/pull/35
+---
+ elf2flt.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/elf2flt.c b/elf2flt.c
+index 04b6b43..d5e32ab 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -840,6 +840,8 @@ output_relocs (
+ 				case R_RISCV_SET8:
+ 				case R_RISCV_SET16:
+ 				case R_RISCV_SET32:
++				case R_RISCV_SET_ULEB128:
++				case R_RISCV_SUB_ULEB128:
+ 					continue;
+ 				case R_RISCV_32:
+ 				case R_RISCV_64:
+-- 
+2.30.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
