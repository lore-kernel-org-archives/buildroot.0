Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6128CFF5138
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 19:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27D8E60E13;
	Tue,  7 Apr 2026 19:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fgl4hJM82BVF; Tue,  7 Apr 2026 19:59:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B70B60E0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775591953;
	bh=UgWCAeivpJZeQykbFISgtcxJ0sTFtRLuL0GrXxuHULM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BGokvELsw0OajNsBRai83sT67rCAc2lHM1BJZSfsjbnPJenZlgUbB9TfUdbWj5zM2
	 wckFVHhy71H/AoxXY1JtrSvAFyIsXbgWR7GQW257qSyUtbtgP3UkORBXfNVxn6yrlF
	 tlEkqG0cxw7UjD6wNflkWCmxEkfYGJ0+fQZiJaIVjoF3aN+/RFXUohDx/qkjXEKWnZ
	 8KqFVrPTLwwribM7qeWXO2201RgZMMiLANK7IHOsognqvHJ12pVESFhhC9rTbWGUvt
	 Q84wDBF8EiugQ4t/WL1ECbUGPlUdbJ37r/hh1p/eYwOhyRh1sw4UIapnvb5HTROeA4
	 98Z3kChmHBi9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B70B60E0B;
	Tue,  7 Apr 2026 19:59:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5954B2C7
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A5F360E0B
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5JF-RryHnyZ for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 19:59:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4624260D4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4624260D4D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4624260D4D
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:59:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D01BCB97BCDA; Tue,  7 Apr 2026 21:59:08 +0200 (CEST)
Message-ID: <f6ac7d10-2fe6-4b63-ba97-19875c6de0d6@rnout.be>
Date: Tue, 7 Apr 2026 21:59:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260307180711.1025866-1-ju.o@free.fr>
 <20260307180711.1025866-4-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260307180711.1025866-4-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1775591949; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=QL2JURNaBihvY+5Z5qKE0fzVvHjBh+KJk7Eoan1+pTM=;
 b=DajuDLi7dh/j9YaL67bSMBH6O8W/poPKg1drCO0PvaslJT9KsM/oHLxRJ5wtpyAvg4mMDC
 S8Pzic5yI2ojGQiQMwZhBcBDaAxx3wi42d7Qse7T9VsYhuvlyABLCMAKwovT84G7zqwid4
 i8foSMgqFayK6syfRrZaGxnqte9CPwRVbt2liiATSteNKufpoC58mFUifGIIgH1fzipuHt
 653Z8fQWjASv6IpVUufCI6rmL0qHNfddRzcJHWmYbPHWlTjmOM7ZUjOWGIl5IVPZ4YHfSz
 +t8DnTMqbDxeEL80JQhb7dV73e+kTS0m6SiRS0Xv0hMgNd2YRNb/y/CfywLIIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=DajuDLi7
Subject: Re: [Buildroot] [PATCH RFC v2 4/5] arch/Config.in: add
 BR2_SHOW_SECONDARY_TARGET_OPTIONS
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



On 07/03/2026 19:07, Julien Olivain wrote:
> Suggested-by: Arnout Vandecappelle <arnout@rnout.be>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Changes v1 -> v2:
> - change the Kconfig symbol to be hidden
> ---
>   arch/Config.in | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index bdfc2b092c..bf638e6226 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -15,6 +15,11 @@ config BR2_USE_MMU
>   config BR2_ARCH_HAS_FDPIC_SUPPORT
>   	bool
>   
> +config BR2_SHOW_SECONDARY_TARGET_OPTIONS
> +	bool
> +	default y
> +	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS

  As I mentioned in v1, this symbol isn't needed, we can just use
!BR2_HIDE_SECONDARY_TARGET_OPTIONS directly.

  I dropped this patch.

  Regards,
  Arnout

> +
>   choice
>   	prompt "Target Architecture"
>   	default BR2_i386

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
