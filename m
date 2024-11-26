Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0A1D65552
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 20:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2FDB85058;
	Tue, 26 Nov 2024 20:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4-Yc54e0wHE; Tue, 26 Nov 2024 20:47:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9B7E8515C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9B7E8515C;
	Tue, 26 Nov 2024 20:47:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 314641DA8
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 20:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F9528515C
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 20:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2eYRTXzV7UHU for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 20:47:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1E79D85058
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E79D85058
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E79D85058
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 20:47:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 08C112003CC;
 Tue, 26 Nov 2024 21:47:14 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35356])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 26 Nov 2024 21:47:14 +0100
MIME-Version: 1.0
Date: Tue, 26 Nov 2024 21:47:14 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20241126190214.2092202-1-vfazio@xes-inc.com>
References: <20241126190214.2092202-1-vfazio@xes-inc.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <c24e30d67faa2acbae4a8765cb75f80c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732654037;
 bh=+WtrTKZuNKyVj5/xNGv8t6o/SR/GfPHPtbAUlG/vvyc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pLMDQgzAyypWnTN+esZG4ooZA7HTsJ5g/oCBt5VFpcNFkrpoE64M/oQdJcDDNdr5N
 Sf25xrKEGMwWW3jtm1lZ5IDTZVaic564lA3Cu736V1tQiJmv6tJEU08cgz2p91IKEb
 3YO3ZpQ480DK3dz5pyA8cL1aZZxlrit2dAUjxtTsYkF7+CyYyEaE2A0Hxj3BMQbK06
 E5ThxacYl8kRQlNQByulqx00QPRrayPbFgOadNHUSDBDlatRKwbvLTKhajJXaAeVm7
 cv78zqb3wM+tr6+Ytc8uNF52wwhzeaLhwV40KmpC/t1Z74/vauvL/3+U9jsIcS+xEQ
 kNq428srNBtHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pLMDQgzA
Subject: Re: [Buildroot] [PATCH] package/mmc-utils: bump to 523d8f3cfb21
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 26/11/2024 20:02, Vincent Fazio wrote:
> Upstream commit f884bfe684f2c31e1f5b7c9247b364178fa20ea3 changed the
> default build behavior to run `sparse` which is problematic if the tool
> is not available on the host during builds.
> 
> Update the build command to not define `C` so `sparse` is skipped.
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

Applied to next, thanks.

> ---
>  package/mmc-utils/mmc-utils.hash | 2 +-
>  package/mmc-utils/mmc-utils.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mmc-utils/mmc-utils.hash 
> b/package/mmc-utils/mmc-utils.hash
> index fec7533d16..48bfd7bc04 100644
> --- a/package/mmc-utils/mmc-utils.hash
> +++ b/package/mmc-utils/mmc-utils.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  
> 4547b5f0f8a43857dcfb516b8b9c987d07febfecbe3d27987f43064db46ca8f9  
> mmc-utils-e1281d4de9166b7254ba30bb58f9191fc2c9e7fb-git4.tar.gz
> +sha256  
> 1ae5706ce56bfedda94a01e87c5151ac750fb849987aeb74ff89d70f43556131  
> mmc-utils-523d8f3cfb219d800f45860892e742e3a355f1bb-git4.tar.gz
>  sha256  
> 4207d81122a02555f78c5a11b61c83a331ee03dc933e1ef9dd932ef9b434d12d  
> README
> diff --git a/package/mmc-utils/mmc-utils.mk 
> b/package/mmc-utils/mmc-utils.mk
> index 48c347d846..28ac62678b 100644
> --- a/package/mmc-utils/mmc-utils.mk
> +++ b/package/mmc-utils/mmc-utils.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -MMC_UTILS_VERSION = e1281d4de9166b7254ba30bb58f9191fc2c9e7fb
> +MMC_UTILS_VERSION = 523d8f3cfb219d800f45860892e742e3a355f1bb
>  MMC_UTILS_SITE = 
> https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
>  MMC_UTILS_SITE_METHOD = git
>  MMC_UTILS_LICENSE = GPL-2.0
> @@ -25,7 +25,7 @@ endif
>  # let's do this here otherwise it won't be automatically set and build
>  # will fail
>  define MMC_UTILS_BUILD_CMDS
> -	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
> +	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) C= \
>  		CFLAGS="$(MMC_UTILS_CFLAGS)" \
>  		AM_CFLAGS='-DVERSION=\"$(shell echo $(MMC_UTILS_VERSION) | head -c 
> 6)\"'
>  endef
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
