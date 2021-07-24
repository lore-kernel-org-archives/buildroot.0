Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C1FC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:15:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 120B5608FB
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 120B5608FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFDA84039A;
	Sat, 24 Jul 2021 20:15:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ddut2tCdop14; Sat, 24 Jul 2021 20:15:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B695F403A2;
	Sat, 24 Jul 2021 20:15:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C1E81BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58BA4401B3
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B4-8PB9_QWFw for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:15:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FE12400CE
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:15:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4802:7ee4:40b0:1519])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6DAD578033D;
 Sat, 24 Jul 2021 22:15:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627157751;
 bh=Q8VFaAjniluK8IoHktaA8IwQGV31/glUdjm4UxYX6kM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KZ1KcWGKS67BkLPIJ965jXL8kYabZsi6arH7J+5SSYu1wX8HhZ3DPG3J36ijAvH3v
 HfLqzVhbLk2CXraYtAXiUJoFUn1ei2HGL9j7zZr9pV+NKYYjbf1CuvWHOefYGpeqrQ
 CpgxMtgU/FJD1VXqvBWEsX77s4IXGYNqWwSd9kGeFuhiarHNx4+BAU/LSHwJjH3EAV
 B3PUeEnUKwmzHqI3wDLzSzLFVODfpY2SMKMzKTZjdnpLM1X0r1ZJhYaviL99Tqgnzc
 u8pnEYdIILUds6sUgBMngBpxUoPNeUST7pqI7sPAbPm6w7m/VDckEwkPP6/dUU/A3Y
 6W9JhVL1muAtg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jul 2021 22:15:45 +0200
Date: Sat, 24 Jul 2021 22:15:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210724201545.GG2382418@scaer>
References: <20210722053117.1199335-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722053117.1199335-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/mupdf: fix CVE-2021-3407
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-07-22 07:31 +0200, Fabrice Fontaine spake thusly:
> A flaw was found in mupdf 1.18.0. Double free of object during
> linearization may lead to memory corruption and other potential
> consequences.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-free-of-object-during-linearization.patch | 52 +++++++++++++++++++
>  package/mupdf/mupdf.mk                        |  3 ++
>  2 files changed, 55 insertions(+)
>  create mode 100644 package/mupdf/0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch
> 
> diff --git a/package/mupdf/0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch b/package/mupdf/0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch
> new file mode 100644
> index 0000000000..a4746961a6
> --- /dev/null
> +++ b/package/mupdf/0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch
> @@ -0,0 +1,52 @@
> +From cee7cefc610d42fd383b3c80c12cbc675443176a Mon Sep 17 00:00:00 2001
> +From: Robin Watts <Robin.Watts@artifex.com>
> +Date: Fri, 22 Jan 2021 17:05:15 +0000
> +Subject: [PATCH] Bug 703366: Fix double free of object during linearization.
> +
> +This appears to happen because we parse an illegal object from
> +a broken file and assign it to object 0, which is defined to
> +be free.
> +
> +Here, we fix the parsing code so this can't happen.
> +
> +[Retrieved from:
> +http://git.ghostscript.com/?p=mupdf.git;h=cee7cefc610d42fd383b3c80c12cbc675443176a]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + source/pdf/pdf-parse.c | 6 ++++++
> + source/pdf/pdf-xref.c  | 2 ++
> + 2 files changed, 8 insertions(+)
> +
> +diff --git a/source/pdf/pdf-parse.c b/source/pdf/pdf-parse.c
> +index 7abc8c3d4..5761c3351 100644
> +--- a/source/pdf/pdf-parse.c
> ++++ b/source/pdf/pdf-parse.c
> +@@ -749,6 +749,12 @@ pdf_parse_ind_obj(fz_context *ctx, pdf_document *doc,
> + 		fz_throw(ctx, FZ_ERROR_SYNTAX, "expected generation number (%d ? obj)", num);
> + 	}
> + 	gen = buf->i;
> ++	if (gen < 0 || gen >= 65536)
> ++	{
> ++		if (try_repair)
> ++			*try_repair = 1;
> ++		fz_throw(ctx, FZ_ERROR_SYNTAX, "invalid generation number (%d)", gen);
> ++	}
> + 
> + 	tok = pdf_lex(ctx, file, buf);
> + 	if (tok != PDF_TOK_OBJ)
> +diff --git a/source/pdf/pdf-xref.c b/source/pdf/pdf-xref.c
> +index 1b2bdcd59..30197b4b8 100644
> +--- a/source/pdf/pdf-xref.c
> ++++ b/source/pdf/pdf-xref.c
> +@@ -1190,6 +1190,8 @@ pdf_read_new_xref(fz_context *ctx, pdf_document *doc, pdf_lexbuf *buf)
> + 	{
> + 		ofs = fz_tell(ctx, doc->file);
> + 		trailer = pdf_parse_ind_obj(ctx, doc, doc->file, buf, &num, &gen, &stm_ofs, NULL);
> ++		if (num == 0)
> ++			fz_throw(ctx, FZ_ERROR_GENERIC, "Trailer object number cannot be 0\n");
> + 	}
> + 	fz_catch(ctx)
> + 	{
> +-- 
> +2.17.1
> +
> diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
> index b481fb1eae..294cd8a61b 100644
> --- a/package/mupdf/mupdf.mk
> +++ b/package/mupdf/mupdf.mk
> @@ -22,6 +22,9 @@ MUPDF_DEPENDENCIES = \
>  	xlib_libX11 \
>  	zlib
>  
> +# 0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch
> +MUPDF_IGNORE_CVES += CVE-2021-3407
> +
>  # The pkg-config name for gumbo-parser is `gumbo`.
>  MUPDF_PKG_CONFIG_PACKAGES = \
>  	freetype2 \
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
