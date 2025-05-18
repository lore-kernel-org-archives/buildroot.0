Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0552EC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B17C460AB4;
	Sun, 18 May 2025 14:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYp_vzBkTJMH; Sun, 18 May 2025 14:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF03060A5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF03060A5B;
	Sun, 18 May 2025 14:45:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A6FBDF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3070A60A5B
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPFhv2PjFX1p for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:45:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7F8996064D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F8996064D
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F8996064D
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:45:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8AC381C1001; Sun, 18 May 2025 16:45:23 +0200 (CEST)
Message-ID: <1c3fdbca-356e-4df7-bdd7-8a2ef95d1553@rnout.be>
Date: Sun, 18 May 2025 16:45:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250426073305.1189443-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250426073305.1189443-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579523; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=DEVLkPsUD3NrxLfCPCnWrmqs9xzTJPYbOFf8L6zgw58=;
 b=flDknF7mh3lcaf8PXKt/yUXUY0LeNztgPOyKGbur6sK+MNB4iOajjyVfkRGgx8kZvCWebr
 luu+yNqYBW4+s13hCUqEwJHmeSmhXgE2XnNShs5rUpV0+FnflEAVEr9XIPWTv5PKXKm9wr
 j0+s4brG7JriAe1kTnKAjevywHiemNlgf0gUi/ZzKfpYzi0FbX4BbURm+/Fo0683n9154f
 U2SQ4vL2JM8FpQuTnl5V/J8rARCiIkBBdBctZDKvSVVekxGaRWLn2l3zgoiZFDMZQSEhTJ
 uAi2KQdTurAuvGCFKEpJJJEH3HHeQ7Zcg3x/60f0UmFEUtgpBdJ4W99yzHSmKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=flDknF7m
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: make target nodejs
 package virtual
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



On 26/04/2025 09:33, Thomas Perale wrote:
> Since commit [1], the host-nodejs package was turned into a virtual
> package. However, the target nodejs package was intentionally not
> turned into a virtual package and became an empty package.
> The reason for this is:
> 
>    - No alternatives providers were introduced for the target nodejs
>      package.
>    - The Config.in remained unchaged for the target package.
> 
> As a result, running `make show-info` with a config that includes the
> target nodejs package, outputs an entry for the empty package:
> 
> ```
> "nodejs": {
>      "type": "target",
>      "name": "nodejs",
>      "virtual": false,
>      "version": "",
>      ...
>      "cpe-id": "cpe:2.3:a:nodejs:node.js::*:*:*:*:*:*:*"
> },
> ```
> 
> This can be an issue because the CPE ID of the empty nodejs package
> is the following `cpe:2.3:a:nodejs:node.js::*:*:*:*:*:*:*`.
> Reporting such a CPE ID can be an issue for certain software that consume
> the SBOM and could be interpreted as CPE that matches with every versions
> of the package.
> 
> This patch converts the target nodejs package into a virtual package to
> prevents the empty package from being included in the SBOM.
> 
> [1] 4cbc2af604 package/nodejs: rename to nodejs-src and convert to virtual package
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/nodejs/Config.in                | 4 ++++
>   package/nodejs/nodejs-src/nodejs-src.mk | 1 +
>   package/nodejs/nodejs.mk                | 3 +--
>   3 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index 50d1360715..2a0074b5a4 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -87,4 +87,8 @@ config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS
>   
>   endif
>   
> +config BR2_PACKAGE_PROVIDES_NODEJS
> +	string
> +	default "nodejs-src"
> +
>   source "package/nodejs/nodejs-src/Config.in"
> diff --git a/package/nodejs/nodejs-src/nodejs-src.mk b/package/nodejs/nodejs-src/nodejs-src.mk
> index 8f934202b0..30e72743a1 100644
> --- a/package/nodejs/nodejs-src/nodejs-src.mk
> +++ b/package/nodejs/nodejs-src/nodejs-src.mk
> @@ -14,6 +14,7 @@ NODEJS_SRC_LICENSE_FILES = $(NODEJS_LICENSE_FILES)
>   NODEJS_SRC_CPE_ID_VENDOR = $(NODEJS_CPE_ID_VENDOR)
>   NODEJS_SRC_CPE_ID_PRODUCT = $(NODEJS_CPE_ID_PRODUCT)
>   
> +NODEJS_SRC_PROVIDES = nodejs
>   HOST_NODEJS_SRC_PROVIDES = host-nodejs
>   
>   NODEJS_SRC_DEPENDENCIES = \
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 6dc0e501b4..752971c4a6 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -32,8 +32,7 @@ PNPM = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/pnpm
>   YARN = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/yarn
>   endif
>   
> -NODEJS_DEPENDENCIES = nodejs-src
> -$(eval $(generic-package))
> +$(eval $(virtual-package))
>   $(eval $(host-virtual-package))
>   
>   include $(sort $(wildcard package/nodejs/*/*.mk))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
