Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE47D4921C
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 05:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7978847745;
	Tue, 19 Nov 2024 05:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYGG8eQmZpWl; Tue, 19 Nov 2024 05:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EADD7474F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EADD7474F3;
	Tue, 19 Nov 2024 05:35:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B8C6DB2
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 05:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59F8F84FDC
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 05:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6VKfuwhg5ru for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 05:35:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D3B2984CA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3B2984CA2
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3B2984CA2
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 05:35:52 +0000 (UTC)
Received: from unknown (HELO opfedv3rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 06:35:50 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Nov 2024 06:35:50 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Tue, 19 Nov 2024 06:35:48 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 19 Nov 2024 06:35:48 +0100
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.12,165,1728943200"; d="scan'208";a="224404037"
Date: Tue, 19 Nov 2024 06:35:48 +0100
To: Julien Olivain <ju.o@free.fr>
CC: <buildroot@buildroot.org>
Message-ID: <ZzwjtKDhz+TLUe8O@yd-6wlzhs3>
References: <20241118232420.3166108-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241118232420.3166108-1-ju.o@free.fr>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX204.corporate.adroot.infra.ftgroup (10.115.26.9)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1731994553; x=1763530553;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=cYiCxCFdVa6dUDA9rpku/IIwTqhrcuRlsMhALCDujzg=;
 b=fbSEbP93Rr3LEy4BsDtE+DCAMvgqi3k8MJNizfRPrGoV1TbNON9EnyU8
 NHS3AZu4M+AN4gXcE8BmXIn3HX1XGRnXR2/ZlgB9jl/9NK3nJu8PfmL0i
 WtiArT2YSsWvt1wh0ZI+/BO8zNhStG7Bfm53yF2tTiabz90Ij+Fq66fDA
 PTeSek+iggHdcT+3+NCLcH9odVCxgi9GPgc0aWB36aYuZ0GV6SURDfWQO
 /JZNecOcCBuO3fjIVK6kwicp96fPaopPTWuFCDUAas6JoXaFpSvj5NBya
 Fb6KzEXR8Vn0ea+PvIRgwBTag4aV5zmD/tQbObv9XlDe2K+LCrZWD8d0J
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=fbSEbP93
Subject: Re: [Buildroot] [PATCH 1/1] package/skopeo: select
 BR2_PACKAGE_HOST_GO
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2024-11-19 00:24 +0100, Julien Olivain spake thusly:
> host-skopeo fail to build, using the commands:
> 
>     echo BR2_PACKAGE_HOST_SKOPEO=y >.config
>     make olddefconfig
>     make host-skopeo
> 
> This commit fixes the issue by selecting BR2_PACKAGE_HOST_GO
> in the Config.in file.
> 
> Fixes:
> 
>     make: *** No rule to make target 'host-', needed by '/buildroot/output/build/host-go-1.23.2/.stamp_configured'.  Stop.

For host-skopeo, that indeed fixes the issue, but there is still the
case that prompt-less host package written in go are still broken in the
same way.

I have already sent a related patch to fix that issue:
    https://patchwork.ozlabs.org/project/buildroot/patch/cf517426f7868af6c3e80e5016ac23759bf75290.1726556733.git.yann.morin@orange.com/

Of course, I did not notice the issue your patch is fixing, because I
had that patch of mine above already applied, sorry for the mess...

> Signed-off-by: Julien Olivain <ju.o@free.fr>

This select was missing in my initila host-skopeo submission,m because
it was made before 7b2a164b7460 (package/go/go-bin: new host-go
provider) was applied, when it was not needed to select the host-go
package.

Reviewed-by: Yann E. MORIN <yann.morin@orange.com>

Regards,
Yann E. MORIN.

> ---
>  package/skopeo/Config.in.host | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/skopeo/Config.in.host b/package/skopeo/Config.in.host
> index 334a12b6fc..1c1c8f3ebe 100644
> --- a/package/skopeo/Config.in.host
> +++ b/package/skopeo/Config.in.host
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_HOST_SKOPEO
>  	bool "host skopeo"
>  	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS
> +	select BR2_PACKAGE_HOST_GO
>  	help
>  	  skopeo is a command line utility that performs various
>  	  operations on container images and image repositories.
> -- 
> 2.47.0
> 

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
