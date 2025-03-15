Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DCBC28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 23:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A57FB40B65;
	Sat, 15 Mar 2025 23:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYIBmmpWlEov; Sat, 15 Mar 2025 23:50:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89E1C40B56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89E1C40B56;
	Sat, 15 Mar 2025 23:50:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00B8DEA
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D906440B51
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IIKJ3vahaSDk for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 23:50:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07D8240B46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07D8240B46
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07D8240B46
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:50:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7931819F5B2;
 Sun, 16 Mar 2025 00:50:05 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Mar 2025 00:50:05 +0100
MIME-Version: 1.0
Date: Sun, 16 Mar 2025 00:50:05 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, Brandon
 Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>, Romain
 Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20250302215219.1276480-14-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
 <20250302215219.1276480-14-olteanv@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <dd8dfa0fa65a2f04412ae033867a1173@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742082612;
 bh=iNZi5HpsOOFSkgSjb6gQV9Z2/4C3ZN7ur3Z+z0YihAU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KUEvewgk7NslFlTNF8rcUlK9WE5ig4pjiaanLisKN8QdKzfdvs9Efb6FAG/fpjm7Q
 n3KsFD3lpQ9mIoJfsoMAm2PeGS4Cvh8vu3VCDHGkol31wzCIX8aUpvk0QjLAT7meIH
 aE6ticrn6s9zhm+iD3qp7CP8UYHoO+vzeToOWp8zLLHjeyQPmgByRMLGyguOPDUI2d
 iRC/o53eL1m27r4wdiJcT9WEq+p2BG91bSgPDw23d9eVbkIQS6ZSj6qKfi2hGYuFfj
 bH6+gMnyOvTxgDHfoc+kvINyLRMRixpOYKd0YzADWd9Ynkclm8EQXqVMG+l692kpcG
 QALwQVIHFK+9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KUEvewgk
Subject: Re: [Buildroot] [PATCH 13/15] configs/ls1046a-frwy: enable the fmc
 package and dependencies
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vladimir,

Thanks for the patches.

On 02/03/2025 22:52, Vladimir Oltean wrote:
> Since LS1046A-FRWY uses the Linux Factory-supplied lsdk.config, it
> disables the upstream DPAA1 kernel networking drivers and enables their
> SDK counterparts. These SDK kernel drivers are configured using the fmc
> tool to do basic things such as apply a default PCD, so it seems a
> reasonable idea to enable this package by default.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> ---
> Change log:
> Patch is new.
> 
>  configs/ls1046a-frwy_defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/configs/ls1046a-frwy_defconfig 
> b/configs/ls1046a-frwy_defconfig
> index 52d8f0cc07bb..5c05da82f0a6 100644
> --- a/configs/ls1046a-frwy_defconfig
> +++ b/configs/ls1046a-frwy_defconfig
> @@ -41,3 +41,7 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_QORIQ_RCW=y
>  
> BR2_PACKAGE_HOST_QORIQ_RCW_INTREE="ls1046afrwy/NN_NNQNNPNP_3040_0506/rcw_1600_sdboot.bin"
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +BR2_FMLIB_QORIQ_FAMILY_ARM=y
> +BR2_PACKAGE_FMLIB=y
> +BR2_PACKAGE_FMC=y

In Buildroot, defconfigs should be kept "minimal", in their
default order. So you can do that with the commands:

     make ls1046a-frwy_defconfig
     make savedefconfig

BR2_PACKAGE_FMLIB=y is not needed as it is selected by
BR2_PACKAGE_FMC=y.

And BR2_FMLIB_QORIQ_FAMILY_ARM=y is also not needed, as
it is selected by default.

Can you send an updated patch with the minimal changes
after a "make savedefconfig" please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
