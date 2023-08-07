Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EABEB64DD
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 07:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AA0281A34;
	Mon,  7 Aug 2023 07:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AA0281A34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jvnWYgsftTor; Mon,  7 Aug 2023 07:51:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4151781E30;
	Mon,  7 Aug 2023 07:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4151781E30
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDF911BF357
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 07:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E50AE81A34
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 07:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E50AE81A34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e2f2Doy2Nz_y for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 07:50:24 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33F3180BBC
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 07:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33F3180BBC
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D9B2C35206AA; Mon,  7 Aug 2023 09:50:20 +0200 (CEST)
Date: Mon, 7 Aug 2023 09:50:20 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNCiPEKIjPhDgxLN@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691394621; bh=WzMkDz8G3armlTmJ3SEKEFmArj70itviFcv+DkViJrE=;
 h=Date:From:To:Subject:From;
 b=gLqjvQoocdsVb9XZbJK5y7ZS4oh2hObX67KZLfwhUxO9caQHuT4e7uGtRbAsFaZx4
 tKFVE00sbdfz3LHIDhUQRPNdWGAaQ/RSd2mGKc4MeKiw0B0mcd1yQrPvbZ+2fVIVtU
 QTlvzopXeteSZ12A/cK8H4zi1WckBSmetzgKtfoo5xEHGf1Y4dVpGK6KCAqo65xze0
 JmfKp2jyCCncyLqi1cup9xbdpgopkAnlS+lXAoASjMRoKXddO0RP05q359ei64lYJs
 57bnI0Sjhr9AMrUCUGzGZz5d9JI8MKo9+pfE8WTDWf8tMU4QdP9DBNeIdYVjDqEPVY
 QhUZ+1jzDBiTA==
Subject: [Buildroot] [PATCH] package/elf2flt: handle more relocations
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

Fixes following autobuild failure:
http://autobuild.buildroot.net/results/c16/c161f191d85f9d064626ee6fcfebea61d916e434/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...e-relocations-required-to-be-handled.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch

diff --git a/package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch b/package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch
new file mode 100644
index 0000000000..c619a1d068
--- /dev/null
+++ b/package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch
@@ -0,0 +1,39 @@
+From 5acfed0012f2fff9801b25403bd8a5e1c2ccfea2 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 7 Aug 2023 09:30:34 +0200
+Subject: [PATCH 8/8] riscv64: add more relocations required to be handled
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ elf2flt.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/elf2flt.c b/elf2flt.c
+index 6685bff..6b3bea4 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -850,11 +850,21 @@ output_relocs (
+ 				default:
+ 					goto bad_resolved_reloc;
+ #elif defined(TARGET_riscv64)
++				case R_RISCV_NONE:
+ 				case R_RISCV_32_PCREL:
++				case R_RISCV_ADD8:
++				case R_RISCV_ADD16:
+ 				case R_RISCV_ADD32:
+ 				case R_RISCV_ADD64:
++				case R_RISCV_SUB6:
++				case R_RISCV_SUB8:
++				case R_RISCV_SUB16:
+ 				case R_RISCV_SUB32:
+ 				case R_RISCV_SUB64:
++				case R_RISCV_SET6:
++				case R_RISCV_SET8:
++				case R_RISCV_SET16:
++				case R_RISCV_SET32:
+ 					continue;
+ 				case R_RISCV_32:
+ 				case R_RISCV_64:
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
