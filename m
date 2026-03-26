Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9185C10AB810
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 19:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32DD540BFC;
	Thu, 26 Mar 2026 19:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJ1eh-v6IJ7R; Thu, 26 Mar 2026 19:39:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E4B740BF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774553945;
	bh=JoIYSsg8QDLph9WqDBGebgtWiNWS/+IzytiP6fz9JTQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oVUsHa+T0FGiRYvI9nbIeDB2rLzvPv5i74WFPm2Oh7vB4ieMhW+azrzQyoa8FnQ9j
	 TmSxdJEckZ9FVZIAyjCHnUrHjVbxG24pN8dh1Xt3B4/lhcC9o6/WLImRTMR/zE7vol
	 J96NsUkIiPZpBBSsfWQG0j/+amyfSKb/iGmErnPEfT16j0L/H9d9TWsDRjhf4+wpby
	 HEDBydvwrSF/FY1j7zClIh3YehxuzJVxq9Pmy3IJ97B1wM3gE+52Ifdrb6tGsV+QYO
	 I9aPPimjFZKFIeOx23LQX2nQSWXcPF3RDxv43/t1Qduf3MxUi3TyrE2gqwD7VlGwK6
	 R5EWMyGzsJ6HQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E4B740BF7;
	Thu, 26 Mar 2026 19:39:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DE2691D3
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 19:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D817181279
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 19:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUINRyHvQi5I for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 19:39:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A2C4E81216
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2C4E81216
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2C4E81216
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 19:39:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2FF1D13F8A9;
 Thu, 26 Mar 2026 20:38:59 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 26 Mar 2026 20:38:59 +0100
MIME-Version: 1.0
Date: Thu, 26 Mar 2026 20:38:59 +0100
To: Vincent Cruz <mooz@blockos.org>
Cc: buildroot@buildroot.org
In-Reply-To: <20260326111412.78314-2-mooz@blockos.org>
References: <20260326111412.78314-2-mooz@blockos.org>
User-Agent: Webmail Free/1.6.14
Message-ID: <419f1f0a2b8919d59fc2401b06ff83b4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774553940;
 bh=io11vmH19pRR5R8DfdQJdiPDipZdsEg2u7EBu8izJ+0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UL3xxzymh/eXCri9YpdouIympu7QuOIBHhvH0HRXA/6jHjvfzfLkqyp7Vh2QQsfmw
 eR6/BW07hQPUfSW4k+foil39b0ljxsCaTr3kkMRdppzUeWBcbSSGv2Rp39tUoy6rLM
 qDVTz/PSmu/i5d4ZmnEcf6mSkkp0oc7n+2jHKwgykeZ0eK9wlbIPZ5m3i7BpITWImP
 fEU91VXFSozIPxR7zIc6uZ3S/P89VrVIiz2jHQuGmgeGzJZUmH+PTcnZPie/1mJyCQ
 HlgcWpiMwecszuXwBerHFn8jL2qsd5z+ceGYVau1Xo3H8pkVOn5G+WtvnzXZCa7klL
 8sme4aMmGjs+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UL3xxzym
Subject: Re: [Buildroot] package/rwmem: bump to version 2.0
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

Hi Vincent,

Thanks for the patch.

On 26/03/2026 12:12, Vincent Cruz wrote:
> For more details, see:
> https://github.com/tomba/rwmem/compare/c89bc9ad9...2.0
> 
> Signed-off-by: Vincent Cruz <mooz@blockos.org>
> ---
[...]
> diff --git a/package/rwmem/rwmem.mk b/package/rwmem/rwmem.mk
> index d6ef05193b..1259b5503f 100644
> --- a/package/rwmem/rwmem.mk
> +++ b/package/rwmem/rwmem.mk
> @@ -4,11 +4,10 @@
>  #
>  
> ################################################################################
> 
> -RWMEM_VERSION = c89bc9ad9a8f2359f358c510db57b7678eb156d1
> +RWMEM_VERSION = 2.0

This new version is introducing build failure with musl libc. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2411684550

The old version is working fine:
https://gitlab.com/jolivain/buildroot/-/pipelines/2411842057

Could you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
