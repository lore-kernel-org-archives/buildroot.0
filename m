Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D18C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9A01408D0;
	Thu, 12 Jun 2025 20:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orwX-vrTdgyt; Thu, 12 Jun 2025 20:07:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F15C040913
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F15C040913;
	Thu, 12 Jun 2025 20:07:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE413183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94B9A8082B
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9BfHh_w0Rygr for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:07:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BFC0480726
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFC0480726
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFC0480726
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:07:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C4C251C107D; Thu, 12 Jun 2025 22:07:33 +0200 (CEST)
Message-ID: <cc633395-f0b6-4fce-a06b-de26f5570599@rnout.be>
Date: Thu, 12 Jun 2025 22:07:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20250602184049.933226-1-dalang@gmx.at>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250602184049.933226-1-dalang@gmx.at>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758853; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=JT1OSM1NF3O1WYqUvDejeBCuENsePiuGeq7SBE+J32o=;
 b=LTgCairuKrKsB2AMAi6AiikeYx7Wn1oyQ0v8/U+XbVsHuWBXYbO+6zx285Seci2CjFKxou
 DR8jkO0ux1QFH5zCXBEQf3ND70wHeljQ1IGh+NPPWoPOC+Y2reaguytsHkMdYGD3hkUzh3
 2Hyxf9/uvAA7wKXrFMRENtm7Hy11aWsy2QFJVHFqtaJhNZ9dzdb8YtLyGfSa+fyYJVY5TM
 wwB7xGIICAzII595IWPWu4PCXJl9Nottn/R9HiaanhZkOiRY8+/vnO4JTw2e05A63e3xG9
 oC6N5eg/OGx4MzYtt/77qo/cPFmDet8qtM9gZ9LECNfp6cGHiWNXo2hacpp6RA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=LTgCairu
Subject: Re: [Buildroot] [PATCH] package/exim: drop stale CVE-2022-3559
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



On 02/06/2025 20:40, Daniel Lang via buildroot wrote:
> The CVE database was updated and includes the additional "up to
> (including) 4.97" version information.
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/exim/exim.mk | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index 6fa16e69a2..3afe553caa 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -13,10 +13,6 @@ EXIM_CPE_ID_VENDOR = exim
>   EXIM_SELINUX_MODULES = exim mta
>   EXIM_DEPENDENCIES = host-berkeleydb host-pcre2 pcre2 berkeleydb host-pkgconf
>   
> -# Incorrect NVD database, reported at
> -# https://lore.kernel.org/buildroot/20250517183423.07951665@windsurf/
> -EXIM_IGNORE_CVES += CVE-2022-3559
> -
>   # Modify a variable value. It must already exist in the file, either
>   # commented or not.
>   define exim-config-change # variable-name, variable-value

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
