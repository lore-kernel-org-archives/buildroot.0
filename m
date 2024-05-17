Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BE3C25B7A
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 14:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DD9B822A3;
	Fri, 17 May 2024 14:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WT_JlfN1Yi1F; Fri, 17 May 2024 14:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60A2C822AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60A2C822AC;
	Fri, 17 May 2024 14:30:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47A991BF2B6
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 14:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41D73822AC
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 14:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Q851SOlzTIE for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 14:30:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 38D69822A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38D69822A3
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38D69822A3
 for <buildroot@buildroot.org>; Fri, 17 May 2024 14:30:06 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44HEU5aM025897;
 Fri, 17 May 2024 09:30:05 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44HEU5wF126380
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 17 May 2024 09:30:05 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 May 2024 09:30:05 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 May 2024 09:30:05 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44HEU5ED104801;
 Fri, 17 May 2024 09:30:05 -0500
Date: Fri, 17 May 2024 09:30:05 -0500
To: Marc Murphy <mailer@sancloud.com>
Message-ID: <20240517143005.lu4x4afty6t7qo7b@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240516200837.244258-1-marc.murphy@sancloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240516200837.244258-1-marc.murphy@sancloud.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1715956205;
 bh=0mTyWyTcrD69h8FI8l3ibFn93wDFuM+db+it4dDmj7E=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=DBQPQgX/DEwtDvB8oTQ1yOvKJ/k4lkBbSbYprnvGth1v1FvGECqmn0Qm10dpD2C9h
 V61hBaw6FL+nckgE4XNHitvtxS8SuE6h+gIjDjMLn7bfukV7pA+w7DOkff/MZptN0a
 D94BmV4WjRPVE6lIenrucIlB9k8NaeUGMEZV/1xA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=DBQPQgX/
Subject: Re: [Buildroot] [PATCH 1/1] package/ti-k3-r5-loader: support
 patching in same way as u-boot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Marc,

On May 16, 2024 thus sayeth Marc Murphy:
> Signed-off-by: Marc Murphy <marc.murphy@sancloud.com>
> ---
>  boot/ti-k3-r5-loader/Config.in          | 12 ++++++++++++
>  boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 19 +++++++++++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
> index c276528fad..0e26a15369 100644
> --- a/boot/ti-k3-r5-loader/Config.in
> +++ b/boot/ti-k3-r5-loader/Config.in
> @@ -69,6 +69,18 @@ config BR2_TARGET_TI_K3_R5_LOADER_VERSION
>  		if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT || \
>  		   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG  || \
>  		   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN
> +
> +config BR2_TARGET_TI_K3_R5_LOADER_PATCH
> +	string "Custom U-Boot patches"
> +	default ""
> +	help
> +	  A space-separated list of patches to apply to U-Boot.
> +	  Each patch can be described as an URL, a local file path,
> +	  or a directory. In the case of a directory, all files
> +	  matching *.patch in the directory will be applied.
> +
> +	  Most users may leave this empty
> +

Thanks for the patch! Just trying to understand what we're trying to do. 

Anytime I have some patches I want to apply on-top of a package version
I'll typically put them in the board/ folder and use the 
BR2_GLOBAL_PATCH_DIR to point to that folder:

    board/<vendor>/<board>/patches

Ideally we should be applying the same patches for uboot and 
ti-k3-r5-loader as it's really just a 32bit build of the SPL

Is there something you're trying to do that needs a list of patches in 
different paths and not in the 64bit uboot package?

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
