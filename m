Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3A8C3ABAC
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F95583C88;
	Fri,  2 May 2025 10:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1k6xgL-98IR; Fri,  2 May 2025 10:24:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CB97839CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CB97839CF;
	Fri,  2 May 2025 10:24:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EFC70229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7ACC5839CF
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBExaaQ4iwuY for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:24:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C8E78376D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C8E78376D
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C8E78376D
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:24:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BD5811C0D8C; Fri,  2 May 2025 12:24:13 +0200 (CEST)
Message-ID: <65672767-b565-4af8-85f6-b8b3f7b3eed1@rnout.be>
Date: Fri, 2 May 2025 12:24:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250414205359.1717253-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250414205359.1717253-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181455; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=arR3sKjtHgmrNDogviskq2zd/xvDa8VKNo1j9hperrk=;
 b=VmUCAV3awBZQtEkAiquxjwdWilQmHpoe2ZEAH/BVOKavNEB5mHf6aVZcVQn9K96P/mBFlO
 Xb8JM3GcoJTKiV/H0nahieSS9PrFqqliMxjUMjXTtqL4ST9Pnbs6zTQPIL3+BN9h46gUxa
 iZuW+ju0eJBtRXGAokotMd/aXFII/aGWM3V18wkWzaybhNKlwHT8ePW8KSVvDO5uUDKCRS
 9s/xiU7LBg5mq57DoY1JWKr/R1dUgDA8yzgfJHemek+KzAIQBXcP3piM3abJwQhtixNsJQ
 hVn2zwSjoIecvGALeXUM6I4NqMHPREb4e381+NUEQwH7WIRT0CO18iJOnbtcCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=VmUCAV3a
Subject: Re: [Buildroot] [PATCH] package/ghostscript: security bump to
 version 10.05.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/04/2025 22:53, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> - CVE-2025-27830: An issue was discovered in Artifex Ghostscript before
>    10.05.0.  A buffer overflow occurs during serialization of DollarBlend in
>    a font, for base/write_t1.c and psi/zfapi.c.
> 
> - CVE-2025-27831: An issue was discovered in Artifex Ghostscript before
>    10.05.0.  The DOCXWRITE TXTWRITE device has a text buffer overflow via
>    long characters to devices/vector/doc_common.c.
> 
> - CVE-2025-27832: An issue was discovered in Artifex Ghostscript before
>    10.05.0.  The NPDL device has a Compression buffer overflow for
>    contrib/japanese/gdevnpdl.c.
> 
> - CVE-2025-27833: An issue was discovered in Artifex Ghostscript before
>    10.05.0.  A buffer overflow occurs for a long TTF font name to
>    pdf/pdf_fmap.c.
> 
> - CVE-2025-27834: An issue was discovered in Artifex Ghostscript before
>    10.05.0.  A buffer overflow occurs via an oversized Type 4 function in a
>    PDF document to pdf/pdf_func.c.
> 
> - CVE-2025-27835: An issue was discovered in Artifex Ghostscript before
>    10.05.0.  A buffer overflow occurs when converting glyphs to Unicode in
>    psi/zbfont.c.
> 
> - CVE-2025-27836: An issue was discovered in Artifex Ghostscript before
>    10.05.0.  The BJ10V device has a Print buffer overflow in
>    contrib/japanese/gdev10v.c.
> 
> - CVE-2025-27837: An issue was discovered in Artifex Ghostscript before
>    10.05.0.  Access to arbitrary files can occur through a truncated path
>    with invalid UTF-8 characters, for base/gp_mswin.c and base/winrtsup.cpp.
> 
> https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/tag/gs10050
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/ghostscript/ghostscript.hash | 4 ++--
>   package/ghostscript/ghostscript.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
> index c64ab80eb0..8f44c444f1 100644
> --- a/package/ghostscript/ghostscript.hash
> +++ b/package/ghostscript/ghostscript.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10040/SHA512SUMS
> -sha512  2e711f8ba86491570684f13851190f41e6eee87dcfacce0a4adfd09a4523abf2e0b6727f0958ee2683834218f5705675b531fd2419cb7fc314ed4becf51f3ce3  ghostscript-10.04.0.tar.xz
> +# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10050/SHA512SUMS
> +sha512  5a8695726ea2c70fd153bac47696c9e9046e9f74eccf8eea500794f79f09d5d2be70597c9d85c0b51b71d46d7974f50c5c9e3b0e242816bb84e64f1098a306a6  ghostscript-10.05.0.tar.xz
>   
>   # Hash for license file:
>   sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
> diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
> index a29ab9b66e..9e2342e5ac 100644
> --- a/package/ghostscript/ghostscript.mk
> +++ b/package/ghostscript/ghostscript.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GHOSTSCRIPT_VERSION = 10.04.0
> +GHOSTSCRIPT_VERSION = 10.05.0
>   GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
>   GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
>   GHOSTSCRIPT_LICENSE = AGPL-3.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
