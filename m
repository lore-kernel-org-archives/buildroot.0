Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0462E8FDA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 14:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B2B860D5B;
	Fri, 26 Dec 2025 14:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JffavVmT-y5; Fri, 26 Dec 2025 14:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4287E60C29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766757901;
	bh=NuQJn3g3VO5UDYdR6GevjW4Ql4RM5vbcvC7VpSmxo9E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q5U+w38c/fm78ORSj3tqywCqZ/8AvbSLtdNc4cQQJ7+PRJMxrKgOVmwpOeS0mCKSC
	 kwkUU1aKq64clHjlcTrqatjrhvMQTU5O7V2HOqc7cJSWi3QCc6dcu9nZWEaJ3d5LYu
	 K5CY4ohA2uYeNQzLBUU67TyLpSimolP209ATYGsYBFsdRALwRxXoWSePRQ8YX1xteU
	 ciYHYZcrOuI233BDZ3td6QvRxGrUuce+0iidCgaVOCy3Hd47V+cpXIb3U8F+yHbJMV
	 U5Be6rOSSfT75vUoNlBZ4aMHT68cw5xv3s/HH8o+glkVH6pw4tsd/fFiNr4w/SLh/b
	 VaPmRSQIUYCsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4287E60C29;
	Fri, 26 Dec 2025 14:05:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AACF4B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 14:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C99240565
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 14:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qaJpmOpM-Jq for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 14:04:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B070040097
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B070040097
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B070040097
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 14:04:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9CF2F60132;
 Fri, 26 Dec 2025 15:04:41 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Dec 2025 15:04:41 +0100
MIME-Version: 1.0
Date: Fri, 26 Dec 2025 15:04:41 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Alexander Clouter
 <alex+buildroot@digriz.org.uk>, Jean Burgat <jeanburgat33@gmail.com>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Prabhu Sannachi
 <prabhu.sannachi@collins.com>, Denis Bodor <lefinnois@lefinnois.net>, James
 Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, James Knight
 <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>, Romain Naour
 <romain.naour@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael
 Vetter <jubalh@iodoru.org>
In-Reply-To: <20251207144243.3696572-7-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
 <20251207144243.3696572-7-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <8e2b9201fff9fbe37dd87f7535664c0d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766757896;
 bh=fMrECPoS3DaDNKvOewR3zk/iXlszamLeXrWlDeUzD8I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aF/rTic4UGuhr4pOWTUJcZUp4LBvad3jr6u6jSCQNioDw2X1LaziqIh3CLY38Aa1H
 FyY+1/cOm7ZkGNW3+oQrJbKPtwNLKiIoPuMtCTAiHAd5scVPu6JfdcrxzrKmj8soOq
 sYhbUzZifsuQMA5hcEVqFoiFd62GWhj2Tq7b/Nac3HC1kGeXQwDZ8zDfy4YgvznUZz
 pT4OzBCg0xLwrKQcF9840EI6Q0F9mPlAHQn8JnCFryPavgwcbCcVH6/i+oqaab5QnZ
 qqPSydbdMUu8JJMNzTN3VI+KXJ6wd54Kj4ZVay1jO434fR/v7sOKGyD7KtGOl2IEIq
 vlnLM/OYn1dtA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aF/rTic4
Subject: Re: [Buildroot] [PATCH/next 07/33] package/odhcp6c: bump version
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

Hi Bernd,

Thanks for the patch.

On 07/12/2025 15:42, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
[...]
> diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
> index dd3a9d3e28..20756bb1e8 100644
> --- a/package/odhcp6c/odhcp6c.mk
> +++ b/package/odhcp6c/odhcp6c.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -ODHCP6C_VERSION = 53f07e90b7f1da6977143a488dd5cb73a33b233b
> +ODHCP6C_VERSION = f19dd37fb467c9cf10cad57aefa0d048312d7dfd

When trying to compile this new version with commands:

cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_ODHCP6C=y
EOF
make olddefconfig
make odhcp6c

It fails with error:

CMake Error: The following variables are used in this project, but they 
are set to NOTFOUND.
Please set them or make sure they are set and tested correctly in the 
CMake files:
/buildroot/output/build/odhcp6c-f19dd37fb467c9cf10cad57aefa0d048312d7dfd/ubox_include_dir
    used as include directory in directory 
/buildroot/output/build/odhcp6c-f19dd37fb467c9cf10cad57aefa0d048312d7dfd
libubox


It is probably due to upstream commit:
https://git.openwrt.org/?p=project/odhcp6c.git;a=commitdiff;h=adc651ffed55d4b538317e50da1a7ec143dbfd1d

Could you have a look please?

>  ODHCP6C_SITE = https://git.openwrt.org/project/odhcp6c.git
>  ODHCP6C_SITE_METHOD = git
>  ODHCP6C_LICENSE = GPL-2.0
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
