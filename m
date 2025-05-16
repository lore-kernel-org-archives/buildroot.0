Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222FAC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4FD160AF3;
	Fri, 16 May 2025 10:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wEK17U7hR5Ig; Fri, 16 May 2025 10:51:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ED7E60B0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ED7E60B0B;
	Fri, 16 May 2025 10:51:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 533C713D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 391DD83CF5
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jaaKE4LNES52 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:51:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33DF781F68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33DF781F68
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33DF781F68
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:51:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 21D0A1C0DFB; Fri, 16 May 2025 12:51:13 +0200 (CEST)
Message-ID: <a7d48477-84ec-44a4-93ca-1adcfa4c6c0b@rnout.be>
Date: Fri, 16 May 2025 12:51:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
References: <20250501071955.10446-1-kadambini.nema@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250501071955.10446-1-kadambini.nema@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392673; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=VlqxY/Vf6o1GF+Jfkp+AZH50F4skmE5p2jgy+TD90Ug=;
 b=k9f/M7ly09UtTn7MBtd6+ng+NEibhE1n5Qs4hNEkVOZzPfBolXV5l9GCuyw6vy9YrhpHtj
 VXYv7s2ETKHfAz5Qh18bVmlYZ7DH48fPHXdV4F0U2BMKIKtUpSsHRMNo3n7x7YOzmh/A8U
 z6Y2tZgG25/vfmP3tMVXAhWZQqi/dZ0UJ43a3GniWWWsA05GXrwSStyNUJ30WRFAW6JabN
 TVpV+hnw4QvSrdRBgSqMBLisr05r3jwzEFNtPzzMD2Vn2SO7uurZ7DFyJR2g4kCffPxP/t
 5y8ZOAmtbsi2PBtuJS3GaYmoJwA9/JcNEB5VclAZtwWu5ih6AF+CilIcUh1/1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=k9f/M7ly
Subject: Re: [Buildroot] [PATCH 1/1] package/mtools: bump version to 4.0.48
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



On 01/05/2025 09:19, Kadambini Nema wrote:
> Release notes:
> https://lists.gnu.org/archive/html/info-mtools/2025-02/msg00019.html
> 
> Changelog:
> https://svn.savannah.gnu.org/viewvc/mtools/tags/4.0.48/NEWS?view=markup
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/mtools/mtools.hash | 2 +-
>   package/mtools/mtools.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
> index bce1951224..44f0803b0f 100644
> --- a/package/mtools/mtools.hash
> +++ b/package/mtools/mtools.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -sha256  2709cd2f42d65500829b056cb0630edd515d7060b4865bad31277f0da9f9e9d5  mtools-4.0.47.tar.lz
> +sha256  7d57f14a2482dc4658e4b386180793ef50f0de89ee3a9a28f0a371630baac7c4  mtools-4.0.48.tar.lz
>   
>   # Locally calculated
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
> index 45b4b8d49b..8c7a348fea 100644
> --- a/package/mtools/mtools.mk
> +++ b/package/mtools/mtools.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MTOOLS_VERSION = 4.0.47
> +MTOOLS_VERSION = 4.0.48
>   MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.lz
>   MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
>   MTOOLS_LICENSE = GPL-3.0+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
