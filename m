Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53573C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2815140659;
	Fri, 16 May 2025 11:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fFc4LLXVCEM1; Fri, 16 May 2025 11:03:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65AF4419A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65AF4419A5;
	Fri, 16 May 2025 11:03:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 031B413D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC3DD419CB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSYujYETaubc for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:03:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 01508419A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01508419A5
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01508419A5
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:03:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B9AA61C0FA2; Fri, 16 May 2025 13:03:34 +0200 (CEST)
Message-ID: <7b5729df-56f6-463d-adac-d9327b2cbc61@rnout.be>
Date: Fri, 16 May 2025 13:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Joseph Zikusooka (ZIK)" <josephzik@gmail.com>, buildroot@buildroot.org
Cc: luca.ceresoli@bootlin.com, "Joseph Zikusooka (ZIK)" <zik@jambula.net>
References: <20250503135217.490404-1-zik@jambula.net>
 <20250503135217.490404-2-zik@jambula.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250503135217.490404-2-zik@jambula.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747393415; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6txk3NAM75xpSlu7vWpVKd8UFiRP9UHwgao2b8rqBKs=;
 b=RyY3q4cutwtqj1rMwibfGfEGueYiUmnIE0EJ6MOWeeIUpczIQ+wkYXKajRrRKMVWFx7OLi
 g9UjJDfk2amTRiZ1Sg/uweKsOH3GRlovGV1HnO8AinOpim8iqqhEPjHpCulY3cZloEdrDX
 cNKqL2c7kJc5uSoWXZyS8ZEtR9bS/oqSP2fC8PBpsR8fI8EnqNXn3Gd1OFhc/8cDmWJklv
 K4m+mhVR7/W4/foD97OSH/1YFkte/pHwRQLwiqiKe5sIYbD0Q3uB0RQetd4XZbt+BVnTjw
 G0fXRpUzTYWuilsTaaczFCO72Pf2BySm55seCGI2WxIjfExZ2eptJVmWN6Qj9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=RyY3q4cu
Subject: Re: [Buildroot] [PATCH v2] package/m4: fix build failure with gcc 15
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



On 03/05/2025 15:52, Joseph Zikusooka (ZIK) wrote:
> This is a temporary workaround to address build issues with host-m4 when using GCC 15, as encountered on
> the recently released Fedora 42. The issue stems from stricter compiler behavior introduced in recent
> versions of GCC.
> 
> A proper fix has already been committed upstream and will be included in the next release of GNU m4:
> https://git.savannah.gnu.org/cgit/m4.git/commit/?h=branch-1.4&id=a22c9802dd7e724eaefb21dc21d84ac2d3a49c89
> 
> Until that version is available in buildroot, this patch ensures continued compatibility and successful
> builds.
> 
> More context:
> https://lists.buildroot.org/pipermail/buildroot/2025-April/776922.html
> 
> Signed-off-by: Joseph Zikusooka (ZIK) <zik@jambula.net>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> [Tested v1, but v2 has the same diff]

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> 
> ---
> Changes v1 -> v2:
>    - reworded commit message (no diff changes)
> 
>   package/m4/m4.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/m4/m4.mk b/package/m4/m4.mk
> index 39ad898b10..ab8e194b06 100644
> --- a/package/m4/m4.mk
> +++ b/package/m4/m4.mk
> @@ -10,4 +10,6 @@ M4_SITE = $(BR2_GNU_MIRROR)/m4
>   M4_LICENSE = GPL-3.0+
>   M4_LICENSE_FILES = COPYING
>   
> +HOST_M4_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=gnu17"
> +
>   $(eval $(host-autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
