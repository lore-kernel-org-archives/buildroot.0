Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D564BC369A2
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 18:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72F8F41E6B;
	Fri, 11 Apr 2025 18:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zy91S3go9FJG; Fri, 11 Apr 2025 18:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A350641A57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A350641A57;
	Fri, 11 Apr 2025 18:24:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 40903108
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 18:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1927C41A57
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 18:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T6HCnzsKTxfO for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 18:24:27 +0000 (UTC)
X-Greylist: delayed 692 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 11 Apr 2025 18:24:26 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C3E941E6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C3E941E6B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.246;
 helo=fllvem-ot04.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C3E941E6B
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 18:24:26 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BICqVn2196804
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Apr 2025 13:12:53 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BICqdI028165
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Apr 2025 13:12:52 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 13:12:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 13:12:52 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BICqTG057610;
 Fri, 11 Apr 2025 13:12:52 -0500
Date: Fri, 11 Apr 2025 13:12:52 -0500
To: Heiko Thiery <heiko.thiery@gmail.com>
CC: <buildroot@buildroot.org>, Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi
 <X15000177@gmail.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Michael Walle <michael@walle.cc>
Message-ID: <20250411181252.uogyfcxyg5oxjyg5@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250411095040.2276825-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250411095040.2276825-1-heiko.thiery@gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1744395173;
 bh=SOMRHGabUs76KcxuVRudPHfOjJuTkPc6K5zyw5ztN78=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=KEfSUkJP1xPeTgar/MRN6ahKJATpphJEtNXsDmxH18tEpT4eWGvYYsMKrDnueBkyn
 4Q51udMjhh9TWHNcr6HG0t4C78jsm+k9HU+gHeaj+KoqlBDnBYzR4nEFh/KfPEyNn5
 /6JT8/S6Oi3OcOQ64/u6GE2w0L+v5m9l1W3KygQ4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=KEfSUkJP
Subject: Re: [Buildroot] [PATCH] boot/ti-k3-boot-firmware: bump to version
 11.00.10
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

On April 11, 2025 thus sayeth Heiko Thiery:
> Update to latest available version from TI.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash | 2 +-
>  boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Ah thanks for updating this!

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan

> diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> index 2398d02da2..d9cb66cd6a 100644
> --- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> +++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
>  sha256  ab20ffbe7bba7e94be246b3417d33a914b3f07c16c47ef5a7f7602349a666a61  LICENSE.ti
> -sha256  ae888a0a22f8c5b8fe841236d6e40bb2f821d9a4161dab6924fd989e1467ef0e  ti-linux-firmware-09.02.00.009.tar.xz
> +sha256  884c454b1a518e6d31304acb201493156685fb8ff111383c842bb292a1b35c9b  ti-linux-firmware-11.00.10.tar.xz
> diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> index 9332732ad4..e04165edd1 100644
> --- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> +++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TI_K3_BOOT_FIRMWARE_VERSION = 09.02.00.009
> +TI_K3_BOOT_FIRMWARE_VERSION = 11.00.10
>  TI_K3_BOOT_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
>  TI_K3_BOOT_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_VERSION).tar.xz
>  TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
> -- 
> 2.39.5
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
