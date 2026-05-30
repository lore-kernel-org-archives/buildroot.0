Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E437ACD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 12:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A23EE6F543;
	Sat, 30 May 2026 12:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVzuqgMVh7Sc; Sat, 30 May 2026 12:51:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4EAC6F544
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780145472;
	bh=4BdNZ1pnXWWqe9f/XuBbAmbbit8BF2LDCUP8rFV+N6c=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=r9AFQbtPX+ISgeH6bhu7KnoOssLstPQNZbhweTZp/GNTPX2QrU3g7cYwOXLOUPxlI
	 fu2EyaNmdedgewIclILlesas4IruIiDPfHkr302/nFv4DPhaobWR224jIil6/IzBCF
	 BtIi/ZZw/iUj2g27rNUPhThHjdBCqioqpnMNAaKePzrDXnrMwJWHB5I35zpSKYf51e
	 lde6QP0huQlbXcDcwgfVY1Chor1uynC1Lo41f9L3uH4TgMw7bEpDiAyhPG1Uh91VvC
	 NZ7jxbG+OhvlD1o7ZI54n1k4f/2TCS8XqvnevQ1s2X1USbNIF7Rm8xB6Qc1fZH/i1X
	 4B+QUUW4Lg/5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4EAC6F544;
	Sat, 30 May 2026 12:51:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0B78D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C30DB6F544
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 34ZtwOoA8W9F for <buildroot@buildroot.org>;
 Sat, 30 May 2026 12:51:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6A1B6F543
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6A1B6F543
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6A1B6F543
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:51:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3DC09B97C708; Sat, 30 May 2026 11:41:12 +0200 (CEST)
Message-ID: <1b3a3502-a98c-4186-b6d1-00aaf1a2ef58@rnout.be>
Date: Sat, 30 May 2026 11:41:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20260517110127.230239-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260517110127.230239-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780134072; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=+wlD8046xoGsILMbaWjWZ48KiZlD4iZ81CNELo10O8g=;
 b=bQ+DNzlSnSqBVl/L5vuzxp6a9AK5cYoG/U5PjI+m+wLEvhnnp5HEqKuttWlJUU+HKkasJ0
 rbMdnS5yLi83FUcsTxiWvbh/mPkJsl5m2z+S933O7GtC1uXrGwNG+ycgeJsk/yV6eDjzoP
 g+di7RYAWfKo5940q6xdh0zJLfKWL7qAChvV12WV2KPu24KBleP1p1rO1lU3fsmuTmYMNN
 FWn0+MSRF7NqjAdUgVVdbkx8vQJQIXPAu+ijeDs4VR3ltDiltqvSEr6IS5Jc2mFShlqiRl
 H61GFOMk4oeO2E7O62VyZh7mMoHBIG8D4O8jBOUWXbM0Zw0HE/NOqqgQGvhScg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=bQ+DNzlS
Subject: Re: [Buildroot] [PATCH next 1/1] package/openblas: bump to version
 v0.3.33
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



On 17/05/2026 13:01, Julien Olivain via buildroot wrote:
> For change log since v0.3.32, see:
> https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.33
> 
> This commit reuses the sha256 hash published upstream.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Since it's a minor update that probably would be cherry-picked into stable 
branches anyway, I applied to master, thanks.

  Regards,
  Arnout

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/14407045940
> ---
>   package/openblas/openblas.hash | 6 +++---
>   package/openblas/openblas.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
> index a1e1cfc851..37685185b8 100644
> --- a/package/openblas/openblas.hash
> +++ b/package/openblas/openblas.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.32
> -md5  021eb76c3fc66290b6ce14fa4c1ff3de  openblas-0.3.32.tar.gz
> +# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.33
> +md5  96c5cd9013013faefc294bc57830c77d  openblas-0.3.33.tar.gz
> +sha256  6761af1d9f5d353ab4f0b7497be2643313b36c8f31caec0144bfef198e71e6ab  openblas-0.3.33.tar.gz
>   # Locally calculated
> -sha256  f8a1138e01fddca9e4c29f9684fd570ba39dedc9ca76055e1425d5d4b1a4a766  openblas-0.3.32.tar.gz
>   sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
> diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
> index e8836a9d27..9a3bb42496 100644
> --- a/package/openblas/openblas.mk
> +++ b/package/openblas/openblas.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPENBLAS_VERSION = 0.3.32
> +OPENBLAS_VERSION = 0.3.33
>   OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
>   OPENBLAS_LICENSE = BSD-3-Clause
>   OPENBLAS_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
