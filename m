Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04AEC79FB6
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 11:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B1EE60600;
	Sat, 12 Sep 2026 11:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id obPgVdVwD9J9; Sat, 12 Sep 2026 11:14:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2EB3B60614
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789211679;
	b=Z5THjWr3lnFihXmZM4smOfXuIST0pb3VF0Qb9xLY0yDdDu4A+auxQwGjb3hozGkuL+Gz
	 2elMp73QleXZzNz/17MY4syz3+DE6ObqNfgiax2zQvV7C7fgBLC5mCaaeuuF9y2uR2iGX
	 420Ic8GvRf095py8VyLfZLUNneL4cu+ZYREm+2gOA0UvyIjMAahbW8lKRhHUuwNsXlK5M
	 D30QzRMmKyNMBuGpJ7ujRiaKJ9AerqSa+kWTRt46gwPODgkN/G+Aa13XdFpSZSPbxoEyq
	 +lp/ROCEnSEjipHkfBkN/G5xDFrOwAC4oiYifW8mN/uwUezQxTBQA3Q8zFEwgEK2w9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789211679;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=4YnA3GzwwiYKZcy9Dj9YPIWyS813+t2CbOi83HSwuBw=;
	b=Lw/xml95mO+nVeIN4v9SF0mL30P0nkmg93WeA6cASC27HtaFG0uUh2lnGq6Q+nWdQQt3
	 eXIvqfqktzsVL2oCJ9UELzqLB60SzT2rbP+ZU9pHmL+mcN6w8izguPYiI2tnLhDgKnhRE
	 48WiYQxEZIhYCrpVi45wFelOndbmRiCwrEzqr0loq7/lq9kj7dND+zyYLOcs5gUNKoV8S
	 +7NVTU3czmoNTeeC8+UjRnPW/g8glIox8LXLXzlyYe/WoK/DvtOgJnaGnUmvfpgAD/6VZ
	 b/SPfTOAB7wQcp6kCFaBfdPCo9Mmu5RVB3kTqQHq37jUykHlZuCHlsjjxs0OwUaJMxw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=VBAGsnxu;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789211679;
	bh=4YnA3GzwwiYKZcy9Dj9YPIWyS813+t2CbOi83HSwuBw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IrWn2EYTJESejurSBL6BKI33ql/0flAX5eFEdwGX9rGVOeRRfqw3ptOJgSlg14vHc
	 RJXfNKh2tWQ4ZMH5wXNxXtljQGwzgTjrffD8Ug2Z+E6GEajhGUeiFszRvtmneaYeCy
	 GxXnWPragqUaCfdFS3OLF6MvZceKvRynm8X3ibANawBJCs01UnXpf2w8ix4OL6S5f/
	 TJXgQRp/NvTahnnFgaCNxVs+bMjyaLf0G5Bdluxi17TbnDtpauyMqy2IFAPn0AeRbB
	 Z32y3c/YOFqMkEaIC7VV3HItyfYmEAfy5KbzsiGC9mqLxa9i3+ucOrYK8zSZfpsAhl
	 nXZSck0BDctpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EB3B60614;
	Sat, 12 Sep 2026 11:14:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5946832F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 11:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B87260614
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 11:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5SY5ks9f6Kx for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 11:14:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D286460600
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789211676;
 b=kzKhkeM885oyxxtdyh5CoTR+afRD2VUSYj6TpBjQRPqIfAZDyihaGanOdUO/cBLCEq7z
 FUVs4urKLd3LgpHFqommMKpB4Tj7CfbEXT+SAPsMYt6YsjkTVYPLE2zKBvQuRKFj9solL
 b93TSjK9RyluqGn3Ad6uPP8M7w1FqfNEXLmT+gpjs7fDJBf/troSvPjFL9vsZzLAyELx+
 rlAfOBLHeC+PhQfY34+JKwIY0TfOUNVmMOLVsh5bvV0D4mwX3RHinBDwks6LGW5kaLlV8
 7imadhBWg/A1+0m+bYDIUmiROt4gwK/TuFww5QrFjrYHC9a5ujZ8FEWQgcyalXxoyJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789211676;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=1beqjvlBN6qwqi3nju9iA6kEbyjirRPw8AC2Csvhw5E=;
 b=guGOjsw2xzab+Wvnk7Z8FnNEbVeVAN17EncKrdkn/YDsmFnG28cxlhXgAzbRXgenelEx
 LTQqkUdjB3Eqpj05hYrrwtrft2YcSMFns1MnYPuIWcdJQ6QNQe4g1nrlRfqd2L4eG9io7
 gDiPC+rem+X8YovTM+Z2TK7wI8Yi8AjhuDFDWS8+deppByLNvF0lj17KZ8Ny14Hul6aja
 fwUjmdNdFa9syLKVkwaNYvck0h3Swz6qdjulQLhoh5nsnZUVPlJh11/nLrOAw1MN3zgOw
 m42eVjcO9scTxj0esWK2WYJESqFOMTb0W8I+dXDX7yujZ2DTFiK03sgXUuF+oIQCcLg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=VBAGsnxu; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=VBAGsnxu
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D286460600
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 11:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789211668;
 bh=1beqjvlBN6qwqi3nju9iA6kEbyjirRPw8AC2Csvhw5E=;
 h=From:To:Cc:Subject:Date:From;
 b=VBAGsnxulinlWKVHar8/957XVFoPcwcjRRahHiPKEiaCQfHr9DKn1rkUWA2cXFXO6
 FgqsxFcMRDaYOKp2Ck+CTMhf3A5Wl3DSO6bGasRJtZ/IBKEIeBHcQdxk2qypYHI1n4
 sGB2AZ3G3j4B69s1LKe20vV7EHkRlrLqriYojiG93iTFZTzMeUQLp+u/1Sg6zc8cVn
 bh3JCTI8SyJTWTJvhtVFts1uwe1sNSR+XOKdxJm4FwHJWx0VsxQZjnEuImIOwPqPlh
 eG74iJ+VmuhODj+LTGpFwsQN5ry5XSwJEw0idAQ8g/EaeoK3LDD7ljwRn4bGFSPmDe
 ff7c8v4TYSM6g==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D6ED5A4C40DB;
 Sat, 12 Sep 2026 13:14:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47006)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x5Lgi-000000003Xc-0CGF;
 Sat, 12 Sep 2026 11:14:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Sep 2026 13:14:28 +0200
Message-ID: <20260912111428.1896500-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/oprofile: Fix build with binutils
 2.47
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

Fixes build error using this defconfig:

BR2_BINUTILS_VERSION_2_47_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_OPROFILE=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
This patch does not introduce new build errors, Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/68b57fcc7595615baac119d47edbd2ab591a57dd

with the exception of br-arm-full-static/build/binutils-2.46.1/.stamp_built:
https://gitlab.com/bkuhls/buildroot/-/jobs/16462318396

 .../0004-Fix-build-with-binutils-2.47.patch   | 118 ++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100644 package/oprofile/0004-Fix-build-with-binutils-2.47.patch

diff --git a/package/oprofile/0004-Fix-build-with-binutils-2.47.patch b/package/oprofile/0004-Fix-build-with-binutils-2.47.patch
new file mode 100644
index 0000000000..ab2b042ce4
--- /dev/null
+++ b/package/oprofile/0004-Fix-build-with-binutils-2.47.patch
@@ -0,0 +1,118 @@
+From 0a9a94a4f212fea58792e35b195587a153919968 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 30 Jul 2026 11:33:45 -0700
+Subject: [PATCH] Fix build with binutils 2.47
+
+binutils 2.47 removed the bfd_boolean compatibility define, together with
+the TRUE/FALSE macros that came along with it, see binutils commit
+1d95b744c069 ("Remove bfd_boolean definition from bfd").
+
+Use the C99 bool/false from <stdbool.h> instead, which is what the bfd
+API has been returning since binutils 2.36.
+
+While here, make _bfd_target_name a 'char const *' since that is the type
+of bfd_target::name; it is only ever read.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+
+Downloaded from
+https://git.openembedded.org/meta-openembedded/commit/?id=a884b55acd042b8ab29c70952c0d8daff48a1468
+
+Upstream: https://sourceforge.net/p/oprofile/bugs/296/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libopagent/opagent.c   |  5 +++--
+ opjitconv/create_bfd.c | 13 +++++++------
+ 2 files changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/libopagent/opagent.c b/libopagent/opagent.c
+index f280880..c3d1af9 100644
+--- a/libopagent/opagent.c
++++ b/libopagent/opagent.c
+@@ -52,6 +52,7 @@
+ 
+ #include "config.h"
+ #include <stdio.h>
++#include <stdbool.h>
+ #include <errno.h>
+ #include <string.h>
+ #include <stdint.h>
+@@ -70,7 +71,7 @@
+ #include "jitdump.h"
+ 
+ // Declare BFD-related global variables.
+-static char * _bfd_target_name;
++static char const * _bfd_target_name;
+ static int _bfd_arch;
+ static unsigned int _bfd_mach;
+ 
+@@ -78,7 +79,7 @@ static unsigned int _bfd_mach;
+ static int define_bfd_vars(void)
+ {
+ 	bfd * bfd;
+-	bfd_boolean r;
++	bool r;
+ 	int len;
+ #define MAX_PATHLENGTH 2048
+ 	char mypath[MAX_PATHLENGTH];
+diff --git a/opjitconv/create_bfd.c b/opjitconv/create_bfd.c
+index da1e6d2..3124d88 100644
+--- a/opjitconv/create_bfd.c
++++ b/opjitconv/create_bfd.c
+@@ -20,6 +20,7 @@
+ 
+ #include <bfd.h>
+ #include <assert.h>
++#include <stdbool.h>
+ #include <stdint.h>
+ #include <stdio.h>
+ 
+@@ -65,7 +66,7 @@ static int fill_symtab(void)
+ 		syms[i] = s;
+ 	}
+ 	r = bfd_set_symtab(cur_bfd, syms, entry_count);
+-	if (r == FALSE) {
++	if (r == false) {
+ 		bfd_perror("bfd_set_symtab");
+ 		rc = OP_JIT_CONV_FAIL;
+ 	}
+@@ -88,11 +89,11 @@ asection * create_section(bfd * abfd, char const * section_name,
+ 		goto error;
+ 	}
+ 	op_bfd_set_section_vma(abfd, section, vma);
+-	if (op_bfd_set_section_size(abfd, section, size) == FALSE) {
++	if (op_bfd_set_section_size(abfd, section, size) == false) {
+ 		bfd_perror("bfd_set_section_size");
+ 		goto error;
+ 	}
+-	if (op_bfd_set_section_flags(abfd, section, flags) == FALSE) {
++	if (op_bfd_set_section_flags(abfd, section, flags) == false) {
+ 		bfd_perror("bfd_set_section_flags");
+ 		goto error;
+ 	}
+@@ -134,7 +135,7 @@ static int create_text_section(int start_idx, int end_idx)
+ int fill_section_content(bfd * abfd, asection * section,
+ 			 void const * b, file_ptr offset, size_t sz)
+ {
+-	if (bfd_set_section_contents(abfd, section, b, offset, sz) == FALSE) {
++	if (bfd_set_section_contents(abfd, section, b, offset, sz) == false) {
+ 		bfd_perror("bfd_set_section_contents");
+ 		return OP_JIT_CONV_FAIL;
+ 	}
+@@ -257,11 +258,11 @@ bfd * open_elf(char const * filename)
+ 		bfd_perror("bfd_openw");
+ 		goto error1;
+ 	}
+-	if (bfd_set_format(abfd, bfd_object) == FALSE) {
++	if (bfd_set_format(abfd, bfd_object) == false) {
+ 		bfd_perror("bfd_set_format");
+ 		goto error;
+ 	}
+-	if (bfd_set_arch_mach(abfd, dump_bfd_arch, dump_bfd_mach) == FALSE) {
++	if (bfd_set_arch_mach(abfd, dump_bfd_arch, dump_bfd_mach) == false) {
+ 		bfd_perror("bfd_set_arch_mach");
+ 		goto error;
+ 	}
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
