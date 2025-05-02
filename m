Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E79AC3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41BF183DED;
	Fri,  2 May 2025 11:10:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AM18f21HL7OB; Fri,  2 May 2025 11:10:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AF6C81F1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AF6C81F1A;
	Fri,  2 May 2025 11:10:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 41DB2EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3353941711
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3Pz4L5FF-cg for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:10:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8AA284160D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AA284160D
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AA284160D
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:10:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 60EDA1C0FC1; Fri,  2 May 2025 13:10:10 +0200 (CEST)
Message-ID: <baa367fd-bb88-45e1-b8b6-90dbf9568f99@rnout.be>
Date: Fri, 2 May 2025 13:10:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>
References: <20250424211216.4117827-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250424211216.4117827-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746184210; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=bwI3hasaSzS/z+rfRVRenT2zBHb2NdETUsowxohpAvQ=;
 b=WYRlc3AstfwAl4+zN5lj+3wiW9Q5kT/1BQ2ymyk6pnJy92lfdP6aY2EHr0jkXYeok/gAYr
 Nx6EqHb0iD4WFReKv+IEioHaNtTQtmnbhk7I1o4PRfEO2gzP2QvxAsyTegTeOwQ8e2COVS
 2+hP5VIfS84JyOvbc/dZYxt5KRig1Hw03M0OEdmmfiZBYmrcvEznpfGDC4/7oRWVS04fBj
 J9tjH48L0VDm+WSj99s0h0DhMKKCymCX4SGzV7oj9tSfTqy85ntauBw2SUqQS3WeVGIPXG
 B1Af3DmYfbFyaLz3/2DaI88/+4nS3uvNpududlxeyOQlUI8FCXKVWBcjUGIyrw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=WYRlc3As
Subject: Re: [Buildroot] [PATCH] package/dpdk: fixup Config.in comment about
 dependencies
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



On 24/04/2025 23:12, Thomas Petazzoni via buildroot wrote:
> The Config.in comment in the dpdk package was wrong for a number of
> reasons:
> 
> - It didn't mention the glibc dependency
> 
> - It didn't mention the gcc >= 4.9 dependency
> 
> - It mentioned a wchar dependency that isn't listed in the dpdk
>    dependencies
> 
> - It mentioned a dynamic library dependency that isn't listed in the
>    dpdk dependencies
> 
> - It used "kernel headers >= 4.19", while for brievity we use "headers
>    >= 4.19" everywhere in Buildroot
> 
> - Minor nit: DPDK was written allcaps, while we write package names
>    lower-case in Buildroot
> 
> Fixes: d17d1b6bde95d46376c4fe93e8ca1a1f9da6c179 ("package/dpdk: add 24.07")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/dpdk/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
> index 328129ea65..7d4a002002 100644
> --- a/package/dpdk/Config.in
> +++ b/package/dpdk/Config.in
> @@ -45,7 +45,7 @@ config BR2_PACKAGE_DPDK_TESTS
>   
>   endif
>   
> -comment "DPDK needs a toolchain w/ dynamic library, threads, wchar, kernel headers >= 4.19"
> +comment "dpdk needs a glibc toolchain w/ threads, gcc >= 4.9, headers >= 4.19"
>   	depends on BR2_USE_MMU # pthread() memory mappings
>   	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS || \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
