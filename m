Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF11C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83B2E61347;
	Fri, 16 May 2025 17:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YWxxu13M6sg0; Fri, 16 May 2025 17:59:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DAE460C14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DAE460C14;
	Fri, 16 May 2025 17:59:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3802613D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DF8783CAD
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id po_MlwAlVf2B for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 19BE383CA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19BE383CA8
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19BE383CA8
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EBC201C1104; Fri, 16 May 2025 19:59:28 +0200 (CEST)
Message-ID: <063b5965-3c7b-4b2d-947d-ebea0986f8cd@rnout.be>
Date: Fri, 16 May 2025 13:21:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20250514210430.1064027-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250514210430.1064027-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418369; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wekrYbHVFzY1rwfsnGZqS8E0TQeYiYGSWc9RgDDTTCw=;
 b=kCilR3IQe9+b7vk6I6wxTUr0eMXNP3KkJef5TWvY73PMOBVLpuwJnJ0pQAArn2i38Gr6gz
 CAhzcUWNxZ6OB5yGMfvYti13J0bPwc7k8dfLiH1k4ooqFYR6k6u5CkFUJ1MNV4Bafsg0bn
 8GfhctPLJc8rNXlElJ7BE/9iZ3Y9xTO0yYKoLPULfw7Ne+65yqM7E+qIJTGU7yBxEXWBIR
 E8155XsOX520P7VGV5SzJ3WPLRM3sC86fCStTCySWXf/6Dhl+xb+zqH+nxmMFa1PclyPsF
 K6OHWNGxOgGFbH0SvZY3tKoBJPOB8vuF9W3L8z0vF4lvjtPbzpKN5CL8xDpdpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=kCilR3IQ
Subject: Re: [Buildroot] [PATCH 1/1] package/libraw: security bump to
 version 0.21.4
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



On 14/05/2025 23:04, Thomas Perale via buildroot wrote:
> Fixes the following seucrity issues:
> 
> - CVE-2025-43961: metadata/tiff.cpp has an out-of-bounds read in the
>      Fujifilm 0xf00c tag parser.
> 
> For more information, see:
>    - https://nvd.nist.gov/vuln/detail/CVE-2025-43961
>    - https://github.com/LibRaw/LibRaw/commit/66fe663e02a4dd610b4e832f5d9af326709336c2
> 
> - CVE-2025-43962: phase_one_correct in decoders/load_mfbacks.cpp has
>      out-of-bounds reads for tag 0x412 processing
> 
> For more information, see:
>    - https://nvd.nist.gov/vuln/detail/CVE-2025-43962
>    - https://github.com/LibRaw/LibRaw/commit/66fe663e02a4dd610b4e832f5d9af326709336c2
> 
> - CVE-2025-43963: phase_one_correct in decoders/load_mfbacks.cpp allows
>      out-of-buffer access
> 
> For more information, see:
>    - https://nvd.nist.gov/vuln/detail/CVE-2025-43963
>    - https://github.com/LibRaw/LibRaw/commit/be26e7639ecf8beb55f124ce780e99842de2e964
> 
> - CVE-2025-43964: tag 0x412 processing in phase_one_correct in
>      decoders/load_mfbacks.cpp does not enforce minimum w0 and w1 values.
> 
> For more information, see:
>    - https://nvd.nist.gov/vuln/detail/CVE-2025-43964
>    - https://github.com/LibRaw/LibRaw/commit/a50dc3f1127d2e37a9b39f57ad9bb2ebb60f18c0
> 
> For more details on the version bump, see the release notes:
>    - https://github.com/LibRaw/LibRaw/releases/tag/0.21.4
>    - https://github.com/LibRaw/LibRaw/releases/tag/0.21.3
>    - https://github.com/LibRaw/LibRaw/compare/0.21.2...0.21.4
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/libraw/libraw.hash | 2 +-
>   package/libraw/libraw.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libraw/libraw.hash b/package/libraw/libraw.hash
> index 838c598d78..36d9d31948 100644
> --- a/package/libraw/libraw.hash
> +++ b/package/libraw/libraw.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  fe7288013206854baf6e4417d0fb63ba4ed7227bf36fff021992671c2dd34b03  LibRaw-0.21.2.tar.gz
> +sha256  6be43f19397e43214ff56aab056bf3ff4925ca14012ce5a1538a172406a09e63  LibRaw-0.21.4.tar.gz
>   sha256  eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449  LICENSE.LGPL
>   sha256  0e3098d2d54a12434715f6679ea408d57da5e8d613c385c58ecc6fe5d30cc81f  LICENSE.CDDL
>   sha256  7d6650cef6cf892abe95e55a6bda1e1c42f221fd411b807deb2fc0b805b868d4  README.md
> diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
> index 211b67f935..e320b2d835 100644
> --- a/package/libraw/libraw.mk
> +++ b/package/libraw/libraw.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBRAW_VERSION = 0.21.2
> +LIBRAW_VERSION = 0.21.4
>   LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
>   LIBRAW_SITE = http://www.libraw.org/data
>   LIBRAW_INSTALL_STAGING = YES

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
