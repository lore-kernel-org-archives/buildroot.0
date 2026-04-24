Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25614FED3FA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 20:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8B4D811D9;
	Fri, 24 Apr 2026 20:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OVVJ3viM7-O5; Fri, 24 Apr 2026 20:08:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16210811DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777061308;
	bh=XffVVmzkRnNBELXGXUZLEFChGjMSkTBY2niKbO0aWoE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dB2WtuS8HZbyZLq4tKDCUku6s7vrDMvvy+6zkqYzYsUQNtm70xFp5qg6bhMnsGPrU
	 DrUCuK52DD8iRtYPkPDjW6JvU0L7g1fKvU35rL7gk2f4wChf+RevLF4wj0NobSmpw6
	 zEMVzoBGuE4u7Qf3m/0/SMhyEzQuJnjcgJ0hF0rVIOZ+FuLoMPVmv1uGMUb2KQ3MeD
	 tTwMEQiJ3Mcddz/r3Xqo6tOreHjyd8kffXjps1QLkFXm/2cO2W4WKyO2Mnip529WI+
	 1ymbH8eE93pHksr7NQjU1337L6tT1RKShiNhuoZww6tQsNyx79kXhfe/ftrKATMtcm
	 USXykmNtZ8J1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16210811DD;
	Fri, 24 Apr 2026 20:08:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3031424D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 20:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21A1360737
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 20:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1aUoNs4-LzFJ for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 20:08:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1726060736
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1726060736
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1726060736
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 20:08:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 65E9D5FFB7;
 Fri, 24 Apr 2026 22:08:23 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Apr 2026 22:08:23 +0200
MIME-Version: 1.0
Date: Fri, 24 Apr 2026 22:08:23 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260418073313.37718-1-chakrabortyshubham66@gmail.com>
References: <20260418073313.37718-1-chakrabortyshubham66@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <184656bd63302adde883e14ea5e41e85@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777061304;
 bh=zA9XJY7zV1GxbifkZh2RQazSvyvvS8UrhIu/SlAMqfQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HkRv73UuX7BTR+Q1fLk213CBj3PMOCa2hYoGDkvO4eTuNSZhfoSlJkJuiXUAvWpsl
 pMvD0pfQmxyRLFLXIZq0Gz4tvHbxVh4EbY3hJEMMGghKK+43S1d4inlrKqGThq4xhj
 HyncZo6M1+4z46fumwFm2uuUsxpddULZEukswNhyeNM2cKXZlGPvv6Z2SrGh7l+sub
 nCZ5NBJChMwgf2XTjglZXoSARkRiWlbEGhMe+k57uQHFhVu4FUr3ItaOv+knGeKfEi
 0ID1fuYWbOrl0Rh1myLaMPMBCbPt31wIrvPFQ/2d1PGeAd+bh0E7/UHuU4PdfVhwXc
 r0PDEZ3M58GAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HkRv73Uu
Subject: Re: [Buildroot] [PATCH] package/psmisc: bump to version 23.7
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Shubham,

Thanks for the patch.

On 18/04/2026 09:33, Shubham Chakraborty wrote:
> - Fix --disable-statx build option
> - fuser: Add stat() fallback, ignore EACCES errors
> - pstree: Fix assumption about root PID
> - killall: Output formatting fixes
> - Update gettext to 0.21
> 
> https://gitlab.com/psmisc/psmisc/-/tags/v23.7
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>  package/psmisc/psmisc.hash | 5 +----
>  package/psmisc/psmisc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/package/psmisc/psmisc.hash b/package/psmisc/psmisc.hash
> index fe146f90c9..646c01b3c6 100644
> --- a/package/psmisc/psmisc.hash
> +++ b/package/psmisc/psmisc.hash
> @@ -1,6 +1,3 @@
>  # From https://sourceforge.net/projects/psmisc/files/psmisc/
> -md5  014f0b5d5ab32478a2c57812ad01e1fb  psmisc-23.5.tar.xz
> -sha1  a16073f459a19288c1ea2b413a84e1b996cab595  psmisc-23.5.tar.xz
> -# Locally computed:

Why are you removing the upstream hashes and the "Locally computed" 
comment?
Sourceforge upstream is still publishing md5 and sha1 (and not sha256).

Could you put back those upstream hashes please and send an updated 
patch please?

> -sha256  
> dc37ecc2f7e4a90a94956accc6e1c77adb71316b7c9cbd39b26738db0c3ae58b  
> psmisc-23.5.tar.xz
> +sha256  
> 58c55d9c1402474065adae669511c191de374b0871eec781239ab400b907c327  
> psmisc-23.7.tar.xz
>  sha256  
> dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  
> COPYING
> diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
> index 3229184459..85caf30653 100644
> --- a/package/psmisc/psmisc.mk
> +++ b/package/psmisc/psmisc.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -PSMISC_VERSION = 23.5
> +PSMISC_VERSION = 23.7
>  PSMISC_SITE = http://downloads.sourceforge.net/project/psmisc/psmisc
>  PSMISC_SOURCE = psmisc-$(PSMISC_VERSION).tar.xz
>  PSMISC_LICENSE = GPL-2.0+
> --
> 2.53.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
