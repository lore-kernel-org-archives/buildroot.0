Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6852E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 20:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29440408D4;
	Mon, 16 Dec 2024 20:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xzidle5eeaSg; Mon, 16 Dec 2024 20:27:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE86E408F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE86E408F9;
	Mon, 16 Dec 2024 20:27:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37659E3
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 20:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F93A408F9
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 20:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdNsU90QEqxt for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 20:27:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B2CC408D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B2CC408D4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B2CC408D4
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 20:27:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7D3795FF88;
 Mon, 16 Dec 2024 21:27:26 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52578])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Dec 2024 21:27:26 +0100
MIME-Version: 1.0
Date: Mon, 16 Dec 2024 21:27:26 +0100
From: Julien Olivain <ju.o@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, Petr Kulhavy <brain@jikos.cz>
In-Reply-To: <20241216074520.361061-1-heiko.thiery@gmail.com>
References: <20241216074520.361061-1-heiko.thiery@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <42979075ec8e400f6959e4398268f548@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734380849;
 bh=qbTElZtuTEREN/hfyTdQ91FMsB6dTzM5xYMD58gVw8s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KwEdg6BwUcs6Dg9FnSus5QC+XKx6zeeBlgMPjqqFeQWOd9y7QWlybtY8I24Iag9ij
 jUjNI6+lOFUiwGELSokUZvrlcAfkLrIiWU+ziCzLcF+ZocuTmMYFdq/gvi1gNQX090
 tUWlioW8up2H5kDLb6agoWm5QsZW70a/dWgcDlEagloUNiQoZfaIM//MN6gMgFOT8E
 P03DJet3fMvf1sqdqNFTc5RV6EfQnopCHEUvS6+vLuaoBklxBOcA9GX4065Jg1a3Cc
 QNWwNvH8YANfYQl3C0AoIun4zpjR2/mEJoy6V8ugo8qqISOpeivcHbO0YAvx/ZJF3h
 uIUfGBxjzh0YA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KwEdg6Bw
Subject: Re: [Buildroot] [PATCH] package/linuxptp: bump version to 4.4
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

Hi Heiko,

Thanks for the patch!  I have few comments, see below.

On 16/12/2024 08:45, Heiko Thiery wrote:
> The released package is no longer available under sourceforge. So we
> switch to github.

Could you add in the commit log references to release announces, such as
[1] and [2] please? (this helps during patch reviews to understand
the amount of changes we introduce; it can also help future debug 
sessions).

Also, since the homepage of this package seems to have changed, could 
you
also update the URL in "package/linuxptp/Config.in"? For now, it seems 
the
github page [3] will be sufficient.

> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/linuxptp/linuxptp.hash | 2 +-
>  package/linuxptp/linuxptp.mk   | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/linuxptp/linuxptp.hash 
> b/package/linuxptp/linuxptp.hash
> index 1d5c590ea7..1aae52abb1 100644
> --- a/package/linuxptp/linuxptp.hash
> +++ b/package/linuxptp/linuxptp.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  
> 70e38e5d2764e0217443da6f14e8846fe401a472293ac138d8419c07a665447a  
> linuxptp-4.2.tgz
> +sha256  
> 61757bc0a58d789b8fcbdddf56c88a0230597184a70dcb2ac05b4c6b619f7d5c  
> linuxptp-4.4.tar.gz
> 
>  # Hash for license file:
>  sha256  
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  
> COPYING
> diff --git a/package/linuxptp/linuxptp.mk 
> b/package/linuxptp/linuxptp.mk
> index eea41f0baf..ff2eb45785 100644
> --- a/package/linuxptp/linuxptp.mk
> +++ b/package/linuxptp/linuxptp.mk
> @@ -4,9 +4,8 @@
>  #
>  
> ################################################################################
> 
> -LINUXPTP_VERSION = 4.2
> -LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
> -LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
> +LINUXPTP_VERSION = 4.4
> +LINUXPTP_SITE = $(call 
> github,richardcochran,linuxptp,v$(LINUXPTP_VERSION))

 From the release announce [1], it seems the "official" download site is
more [4].

Can you send an updated v2 patch using this site and tarball, please?

>  LINUXPTP_LICENSE = GPL-2.0+
>  LINUXPTP_LICENSE_FILES = COPYING
>  LINUXPTP_CPE_ID_VALID = YES
> --
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.

[1] 
https://lists.nwtime.org/sympa/arc/linuxptp-devel/2024-09/msg00020.html
[2] https://www.nwtime.org/news/linuxptp-4.4-released/
[3] https://github.com/nwtime/linuxptp
[4] https://downloads.nwtime.org/linuxptp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
