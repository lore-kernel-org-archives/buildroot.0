Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7E8D6B6DC
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 22:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67F4E81260;
	Wed, 30 Oct 2024 22:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RO1syQNeFEyN; Wed, 30 Oct 2024 22:09:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E0A781270
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E0A781270;
	Wed, 30 Oct 2024 22:09:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F3DC95E4F
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 22:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D405A81270
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 22:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bHrRK9Op7sxb for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 22:09:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD64A81260
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD64A81260
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD64A81260
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 22:09:03 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49UM92bm099302;
 Wed, 30 Oct 2024 17:09:02 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49UM92tR025022
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Oct 2024 17:09:02 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 30
 Oct 2024 17:09:02 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 30 Oct 2024 17:09:02 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49UM92Bw071042;
 Wed, 30 Oct 2024 17:09:02 -0500
Date: Wed, 30 Oct 2024 17:09:02 -0500
To: Bryce Johnson <bryce@redpinelabs.com>
CC: <buildroot@buildroot.org>, Xuanhao Shi <X15000177@gmail.com>, Anand
 Gadiyar <gadiyar@ti.com>
Message-ID: <20241030220902.yo475pa5avafzo4c@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20241022225457.568323-1-bryce@redpinelabs.com>
 <20241022225457.568323-3-bryce@redpinelabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241022225457.568323-3-bryce@redpinelabs.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1730326142;
 bh=G5lM4t0lACO3HxuL3Z/mJqiiS1aXuMxPzLd3mixlp24=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=pnnyDx5USfjmZnmbi1ZKAU/0R2pIu+1XmPsQwPBgqQknOWiszgR3RjNzCBcP9K1gc
 HW5qpNP+3AFJvbKv3oNVNfCCFwY2FphOnawdbh/n7QBknyk7Kv7uXuJfj/htyFjFGx
 qdJcgGK83hmzI8xp2HRWL0lZhoEiubAIKZAgU6M4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=pnnyDx5U
Subject: Re: [Buildroot] [PATCH 3/3] boot/ti-k3-r5-loader: use
 HOST_ARM_GNU_TOOLCHAIN_SUPPORTS
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bryce!

On October 22, 2024 thus sayeth Bryce Johnson:
> To check for valid x86_64 or aarch64 configuration for arm32 toolchain
> 
> Signed-off-by: Bryce Johnson <bryce@redpinelabs.com>
> ---
>  boot/ti-k3-r5-loader/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
> index 8c7898ebf6..fe429bb8b4 100644
> --- a/boot/ti-k3-r5-loader/Config.in
> +++ b/boot/ti-k3-r5-loader/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_TARGET_TI_K3_R5_LOADER
>  	bool "ti-k3-r5-loader"
>  	depends on BR2_aarch64
> +	depends on BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_SUPPORTS

This package is really only here for TI's K3 SoCs. Would it make sense 
to drop the BR2_aarch64 here for this or to keep BR2_aarch64?

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
