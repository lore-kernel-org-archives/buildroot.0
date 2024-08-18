Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33306C5320E
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 07:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E142840201;
	Sun, 18 Aug 2024 07:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6KzQssnexVn; Sun, 18 Aug 2024 07:31:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A90240275
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A90240275;
	Sun, 18 Aug 2024 07:31:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50A861BF41A
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 07:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AFA060625
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 07:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D6_IPVo8ROnS for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 07:31:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C7FB60608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C7FB60608
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C7FB60608
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 07:31:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 79E2613F81D;
 Sun, 18 Aug 2024 09:31:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Aug 2024 09:31:34 +0200
Date: Sun, 18 Aug 2024 09:31:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZsGjVj_U_qjfT39a@landeda>
References: <20240817123040.841448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240817123040.841448-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723966296;
 bh=2f6Us0pcvxAyvgZFlWyswfMvuvbmdgVTYgCGBukjv+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pg7NfRkiXM6BY7/KRLpGRkfAWOtUFCLU9qCtqfVFIWDKoTH6310+DpbKtuM4B6JIS
 gKAZe1aPJm7aqcXGuREvNLmrNrsEYUt9x8sIxpTLdjxVOZEsG0fic74QRrFcXM6T8C
 DBH1eMHH9Hl3Pjpe3pef6J76AyZfoaEEHLQwoxXkoQPY2eHGWTqcCz5UTeapheX6mU
 gcNmtm/sEShRDkEuUNu7nQuCUN+IU9YkRbY5H3BFlQtcG6aR7gXZOew80evKByB33e
 08caOhoroUNtV2BB5MOtyRvwWFkFs3YoV/7swXyPaMWx9gJXSTmC38Dr5iA7KW7pkk
 a7IHAm9WeXJgw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pg7NfRki
Subject: Re: [Buildroot] [PATCH 1/2] package/libffi: fix build on ARC
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-08-17 14:30 +0200, Thomas Petazzoni via buildroot spake thusly:
> This commit brings two patches that have been submitted to upstream
> libffi by Synopsys people, to fix libffi build issues on ARC.
> 
> This build issue was introduced by upstream commit
> c4df19c99f8d8841942e3edaadbf331d30e298c8, which landed in libffi
> 3.4.5, so the issue exists in Buildroot since we bumped from libffi
> 3.4.4 to 3.4.6 in commit f382de2b0f8a528a09bb975cc088a4342b663134,
> which landed in Buildroot 2024.05. This issue therefore doesn't exist
> in the 2024.02.x LTS branch.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/3accebc6775b9a479876a5898d55bde005d4b12b/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series of two patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libffi/0002-arc-Fix-warnings.patch    | 56 +++++++++++++++++++
>  ...ot-use-mov_s-and-movl_s-instructions.patch | 45 +++++++++++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644 package/libffi/0002-arc-Fix-warnings.patch
>  create mode 100644 package/libffi/0003-arc-Do-not-use-mov_s-and-movl_s-instructions.patch
> 
> diff --git a/package/libffi/0002-arc-Fix-warnings.patch b/package/libffi/0002-arc-Fix-warnings.patch
> new file mode 100644
> index 0000000000..45a2c9dbd7
> --- /dev/null
> +++ b/package/libffi/0002-arc-Fix-warnings.patch
> @@ -0,0 +1,56 @@
> +From 4f25e5be1a8a429b6925527c1cb94b6acd05642b Mon Sep 17 00:00:00 2001
> +From: Yuriy Kolerov <ykolerov@synopsys.com>
> +Date: Wed, 17 Jul 2024 18:56:52 +0300
> +Subject: [PATCH] arc: Fix warnings
> +
> +These warnings are fixed:
> +
> +1. A series of "unused variables".
> +2. Implicit conversion from a pointer to uint32_t.
> +
> +Signed-off-by: Yuriy Kolerov <ykolerov@synopsys.com>
> +Upstream: https://github.com/libffi/libffi/pull/844
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + src/arc/ffi.c | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/arc/ffi.c b/src/arc/ffi.c
> +index d729274..0632319 100644
> +--- a/src/arc/ffi.c
> ++++ b/src/arc/ffi.c
> +@@ -192,9 +192,10 @@ static void unmarshal_atom(call_builder *cb, int type, void *data) {
> + /* for arguments passed by reference returns the pointer, otherwise the arg is copied (up to MAXCOPYARG bytes) */
> + static void *unmarshal(call_builder *cb, ffi_type *type, int var, void *data) {
> +   size_t realign[2];
> +-  void *pointer;
> + 
> + #if defined(__ARC64_ARCH64__)
> ++  void *pointer;
> ++
> +   if (type->size > 2 * __SIZEOF_POINTER__) {
> +         /* pass by reference */
> +         unmarshal_atom(cb, FFI_TYPE_POINTER, (char*)&pointer);
> +@@ -348,7 +349,10 @@ ffi_prep_closure_loc (ffi_closure * closure, ffi_cif * cif,
> + 		      void *user_data, void *codeloc)
> + {
> +   uint32_t *tramp = (uint32_t *) & (closure->tramp[0]);
> ++
> ++#if defined(__ARC64_ARCH64__)
> +   size_t address_ffi_closure = (size_t) ffi_closure_asm;
> ++#endif
> + 
> +   switch (cif->abi)
> +     {
> +@@ -367,7 +371,7 @@ ffi_prep_closure_loc (ffi_closure * closure, ffi_cif * cif,
> +       FFI_ASSERT (tramp == codeloc);
> +       tramp[0] = CODE_ENDIAN (0x200a1fc0);	/* mov r8, pcl  */
> +       tramp[1] = CODE_ENDIAN (0x20200f80);	/* j [long imm] */
> +-      tramp[2] = CODE_ENDIAN (ffi_closure_asm);
> ++      tramp[2] = CODE_ENDIAN ((uint32_t) ffi_closure_asm);
> +       break;
> + #endif
> + 
> +-- 
> +2.46.0
> +
> diff --git a/package/libffi/0003-arc-Do-not-use-mov_s-and-movl_s-instructions.patch b/package/libffi/0003-arc-Do-not-use-mov_s-and-movl_s-instructions.patch
> new file mode 100644
> index 0000000000..3577ddf19d
> --- /dev/null
> +++ b/package/libffi/0003-arc-Do-not-use-mov_s-and-movl_s-instructions.patch
> @@ -0,0 +1,45 @@
> +From 97c273519e41a7ef2841cb7531c6eda01fc69dc2 Mon Sep 17 00:00:00 2001
> +From: Yuriy Kolerov <ykolerov@synopsys.com>
> +Date: Wed, 17 Jul 2024 19:19:30 +0300
> +Subject: [PATCH] arc: Do not use mov_s and movl_s instructions
> +
> +mov_s and movl_s instructions use a restricted set of registers.
> +However, a list of available registers for such instructions for
> +one ARC target may not match a list for another ARC targets. For
> +example, it is applicable to ARC700 and ARC HS3x/4x - build
> +fails because mov_s formats may be incompatible in some cases.
> +
> +The easiest and the most straightforward way to fix this issue
> +is to use mov and movl instead of mov_s and movl_s.
> +
> +Signed-off-by: Yuriy Kolerov <ykolerov@synopsys.com>
> +Upstream: https://github.com/libffi/libffi/pull/844
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + src/arc/arcompact.S | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/arc/arcompact.S b/src/arc/arcompact.S
> +index 1d7f1a1..e749341 100644
> +--- a/src/arc/arcompact.S
> ++++ b/src/arc/arcompact.S
> +@@ -39,14 +39,14 @@
> + #define LARG ldl
> + #define SARG stl
> + #define ADDPTR addl
> +-#define MOVPTR movl_s
> ++#define MOVPTR movl
> + #else
> + #define PTRS 4
> + #define FLTS 4
> + #define LARG ld
> + #define SARG st
> + #define ADDPTR add
> +-#define MOVPTR mov_s
> ++#define MOVPTR mov
> + #endif
> + 
> + #define FRAME_LEN (8 * PTRS + 16)
> +-- 
> +2.46.0
> +
> -- 
> 2.46.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
