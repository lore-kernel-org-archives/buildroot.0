Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730DCC3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C0A1815C1;
	Fri,  2 May 2025 11:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzHPHHd-KqEz; Fri,  2 May 2025 11:06:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D6A481778
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D6A481778;
	Fri,  2 May 2025 11:06:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D8893EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9C54407F4
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OxeoWq75wRli for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:06:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 566F64064B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 566F64064B
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 566F64064B
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:06:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 22CD81C0D8C; Fri,  2 May 2025 13:06:52 +0200 (CEST)
Message-ID: <03c1ec12-88a7-4517-964f-76a1d792e9af@rnout.be>
Date: Fri, 2 May 2025 13:06:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Grzegorz Blach <grzegorz@blach.pl>
References: <20250423190643.3526208-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250423190643.3526208-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746184012; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=eKbT5M0adkewsMMwYXsbZ3ABAPQrt19mPwiRfzmYkXc=;
 b=BOKdw7pWrVDK6+fiTHn3CaLUSXDYxDfl+WWy3E+LEQodpQUuqvFtrok3GSJODYJXkIJNm2
 ZElA5mmrcv9UywrCVB7xe8tqE4Rv3xAUw8Fdp6805ZXN3n+XjdV2Edd3Z1egXQvuTFjEP+
 uAEQfONRSDGUXIaRdWNzQAaffA+XYq6I/g3GQvCcH5SpwhdjXoyM5FeZsBOX8YhHwJVfGI
 cfiXffn+wRsXGQfpZylsDXD2Y6L/bLhs5cO8XxhIxZniABzc1iSITrbAZWZBC1Yhmw2yxq
 XgkmU2j2ZT/BjnA47Ik0OLtwjSnhuEzZrV2UKMJ6CCRrWKCybFgP929g7wFTyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=BOKdw7pW
Subject: Re: [Buildroot] [PATCH 1/2] package/graphicsmagick: security bump
 to version 1.3.45
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



On 23/04/2025 21:06, Peter Korsgaard wrote:
> 1.3.44 added the following security fixes:
> 
> * TIFF: Fixed multiple heap and stack buffer overflows (directed by
>    the source EXIF profile) while writing EXIF into the native TIFF
>    IFD.
> 
> * FITS: Fix problem that the FITS reader could return invalid image
>    frames with rows or columns set to zero. Other code in the library
>    crashes, or even asserts, if invalid image frames with rows or
>    columns set to zero are returned.
> 
> * Coverity fixes: Various fixes for Coverity issues raised after the
>    update to version 2023.12.2.
> 
> * Clang Analyzer (scan-build) fixes: Various fixes for new issues
>    discovered by Clang Analyzer.
> 
> https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/7046c344273c263a9b6e4901b910508aea3804b5
> 
> In addition 1.3.45 fixes a off-by-one issue introduced in 1.3.44:
> https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/96f765a2e3cebf0b70094da34d03b73c50c3aa63
> 
> Update the Copyright.txt hash for a change in copyright years:
> https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/f0bba104ee3859286ea8adfc2ff603fd64be5624
> https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/26fce892769e4a26247dd2db5b8dc0719ce20953
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied both to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/graphicsmagick/graphicsmagick.hash | 4 ++--
>   package/graphicsmagick/graphicsmagick.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/graphicsmagick/graphicsmagick.hash b/package/graphicsmagick/graphicsmagick.hash
> index a894aedf11..044214c8fc 100644
> --- a/package/graphicsmagick/graphicsmagick.hash
> +++ b/package/graphicsmagick/graphicsmagick.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  97dc1a9d4e89c77b25a3b24505e7ff1653b88f9bfe31f189ce10804b8efa7746  GraphicsMagick-1.3.40.tar.xz
> -sha256  0a20e661de942ebe115a354d0ec6d1d42b93856ea765f813f350a5ce5024cdb7  Copyright.txt
> +sha256  dcea5167414f7c805557de2d7a47a9b3147bcbf617b91f5f0f4afe5e6543026b  GraphicsMagick-1.3.45.tar.xz
> +sha256  27d121f97ad71ff506ac5a6a9539e969154f3a66f3da24fd5b6f268acd106295  Copyright.txt
> diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
> index 76b826ceef..baaa9bcb02 100644
> --- a/package/graphicsmagick/graphicsmagick.mk
> +++ b/package/graphicsmagick/graphicsmagick.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GRAPHICSMAGICK_VERSION = 1.3.40
> +GRAPHICSMAGICK_VERSION = 1.3.45
>   GRAPHICSMAGICK_SOURCE = GraphicsMagick-$(GRAPHICSMAGICK_VERSION).tar.xz
>   GRAPHICSMAGICK_SITE = https://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/$(GRAPHICSMAGICK_VERSION)
>   GRAPHICSMAGICK_LICENSE = MIT

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
