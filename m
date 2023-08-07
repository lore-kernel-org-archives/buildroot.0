Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E085CEB64DD
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 09:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4736F40577;
	Mon,  7 Aug 2023 09:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4736F40577
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZWjZfR0CyrZ; Mon,  7 Aug 2023 09:54:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BBDC40913;
	Mon,  7 Aug 2023 09:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BBDC40913
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46ADB1BF329
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 09:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8A3380C14
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 09:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8A3380C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K_xlxOGLHXB2 for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 09:54:11 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 237388142D
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 09:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 237388142D
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 629033520C44; Mon,  7 Aug 2023 11:54:08 +0200 (CEST)
Date: Mon, 7 Aug 2023 11:54:07 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNC/P8D2B1tAPFk0@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691402048; bh=v08jNf2j1DHItSIvekH/YV60KwPw0vtnexLqlaLC+Zc=;
 h=Date:From:To:Subject:From;
 b=fDvuCNaE2MufxKvbwweZZX+GaiCCK7DFqj+crvOdqQLtKLamJ4/8CK3wm7nuWGYwV
 ccuITx1dWb/H1HOVThLT4IV+nidOSUWoR6qTZ5+vjE5Vn6l2/cyZd+bFs7RUblAPyC
 33S4H7/298wSmJrYw6VaQT597T1NrLy41ccjyP9m9GbHudgZp4Im4VU/5TTtemypdA
 q8pcyq6zipZYj8Y9R7fVGJM5dXGGIhDFTRQBb5006ZVdNEA4wV2CnMWOlEMicXcw0a
 jyD52YjVmu6bpSSyu/41bdAg1hhC2UOohZxP03KpHy3axM9fxTWKRUpoAA1g0xg8xT
 LuPjVatVK/tQw==
Subject: [Buildroot] [PATCH v2] package/elf2flt: handle more relocations
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

See here the comment:
https://github.com/uclinux-dev/elf2flt/pull/24

Fixes following autobuild failure:
http://autobuild.buildroot.net/results/c16/c161f191d85f9d064626ee6fcfebea61d916e434/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
 - remove patch numbering 8/8
 - add Upstream Tag
---
 ...e-relocations-required-to-be-handled.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch

diff --git a/package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch b/package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch
new file mode 100644
index 0000000000..74d3085d08
--- /dev/null
+++ b/package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch
@@ -0,0 +1,40 @@
+From 5acfed0012f2fff9801b25403bd8a5e1c2ccfea2 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 7 Aug 2023 09:30:34 +0200
+Subject: [PATCH] riscv64: add more relocations required to be handled
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://github.com/uclinux-dev/elf2flt/pull/24
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
