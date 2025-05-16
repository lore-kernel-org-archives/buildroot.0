Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70B1C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7308A607A0;
	Fri, 16 May 2025 10:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RdmFfURCNN2E; Fri, 16 May 2025 10:54:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4F0F608B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4F0F608B0;
	Fri, 16 May 2025 10:54:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CA401AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98BAB4198D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6EAPRQtYbMF for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:54:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7E61419AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7E61419AB
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7E61419AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:54:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BE2C71C0FF6; Fri, 16 May 2025 12:54:35 +0200 (CEST)
Message-ID: <f844f017-9f21-42ab-b0af-c85833c1393d@rnout.be>
Date: Fri, 16 May 2025 12:54:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>, Richard Braun <rbraun@sceen.net>
References: <20250507045650.5514-1-kadambini.nema@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250507045650.5514-1-kadambini.nema@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392876; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=waNXAWG055BkIgekOL/JK3FhZKk2MIZTcPfL3kObB4o=;
 b=Ku33lzM/oF5OrGDtGpAhUJk0lUhOYNscrw4PCcxdz2J+patIjVLggWyRvAri4DLdugiF/O
 mkm3a8gA1Ssp6KsbN1j8wS6+hTntdnjSEIXzB39NIO7jqMWThIsPtE82H5x5Ldt5kfdMdH
 ddgVEu6xGc4t+KZX9tMLw7uB1oVmKXQufMtR0s3oB2g6V0v6LM4pRPdJr91wpvH7VIw1DB
 /YKFD2DPWWbnPyRMKeHtpa1dUe1N72+P3FDSkfnSUMO5N2wALvDLUeQ5+AfqnDpjZKr6Hh
 jOBP6MERiXlCV6+c7blTI0Eh0s81wffB3IPgPwP3qZ1MOD9LXM8mpGuTRcJiPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Ku33lzM/
Subject: Re: [Buildroot] [PATCH 1/1] package/tzdata: bump version to 2025b
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



On 07/05/2025 06:56, Kadambini Nema wrote:
> Release notes:
> https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/6JVHNHLB6I2WAYTQ75L6KEPEQHFXAJK3/
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/tzdata/tzdata.hash | 4 ++--
>   package/tzdata/tzdata.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
> index d347bc4560..a1629066ce 100644
> --- a/package/tzdata/tzdata.hash
> +++ b/package/tzdata/tzdata.hash
> @@ -1,4 +1,4 @@
> -# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/MWII7R3HMCEDNUCIYQKSSTYYR7UWK4OQ/
> -sha512  93b8f939d39bdfe451e262666f9099c529c96c49d14c08e3611560ca660e12e16d08a22b145d615e00570fb194881618d6f9a0a617c119ab447be03279d747c3  tzdata2025a.tar.gz
> +# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/6JVHNHLB6I2WAYTQ75L6KEPEQHFXAJK3/
> +sha512  7d83741f3cae81fac8131994b43c55b6da7328df18b706e5ee40e9b3212bc506e6f8fc90988b18da424ed59eff69bce593f2783b7b5f18eb483a17aeb94258d6  tzdata2025b.tar.gz
>   # Locally computed:
>   sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
> diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
> index 46c65707a7..32607268d8 100644
> --- a/package/tzdata/tzdata.mk
> +++ b/package/tzdata/tzdata.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TZDATA_VERSION = 2025a
> +TZDATA_VERSION = 2025b
>   TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
>   TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
>   TZDATA_SELINUX_MODULES = tzdata

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
