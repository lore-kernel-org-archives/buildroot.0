Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED08BCDB46F
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 23:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7D106070B;
	Mon, 22 Jun 2026 23:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugRxqASpAbp2; Mon, 22 Jun 2026 23:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CACDD6070E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782171009;
	bh=0HG2ZA2+jTS0Hq6iQCNo6h3N4XGy2An02HMOJVhvyY8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rjjQe11lT48000Hqb7yrKHeapikWbNsdpMPMqsoGRIqx1iSx5e3nMBENF0LfLCP57
	 KqBFQS6WEVrbFrydYm4BFT4FxEDxx1dWM0aGqb+I/8V1vtpge5lZDrX/L06fLlky7Q
	 a/1ncp/RWocl4gWrQhZC+GISsRPZie+NKHgAx0Zas+bI9gvrsTpwXHZMmwN6NrHsZO
	 tM55TQkvnySbpF4iWGOFhBYcXSao3KbjuNbceKALkNPvdzg4Oetnrj9XRifIDnoFhp
	 FsBxIgHPXdSOKbyC8oc/kYI9kspHfzNR/29FQLgBvBni9uZHCsl8PdjjuxoEjgLInp
	 /lMD0dJNg1X3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CACDD6070E;
	Mon, 22 Jun 2026 23:30:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FD01367
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 23:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 015648113C
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 23:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 33vzbOvoJg8j for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 23:30:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1BBD8113B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1BBD8113B
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1BBD8113B
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 23:30:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPGRz-1wnaAp2e7R-00MC1R; Tue, 23
 Jun 2026 01:30:02 +0200
Message-ID: <11f625c4-97dd-434b-9ea4-ec82c48031bc@gmx.de>
Date: Tue, 23 Jun 2026 01:30:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Cc: ju.o@free.fr, dowan.gullient@smile.fr
References: <20260621164634.2423931-1-romain.naour@smile.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260621164634.2423931-1-romain.naour@smile.fr>
X-Provags-ID: V03:K1:8h7DlVq8YYRtEtMl6uzFRO7L5ni85iqRwWqdqJv1S6gTOthRZuf
 +AudG5XX4JFo366lDsHqdamaoZuGxzm9PL+ht1Vs1cmUF5yRaY4V6FvmLpuYA78LeLqb5ah
 Zo3S1eEByM7qRAVLkrQisGCJVkkxmT2OnBP1DdDYyW5YdRq9jehl3Fp8V+D+8JXRWuEawcd
 JTdIwENFNlGMXb0rjiAfQ==
UI-OutboundReport: notjunk:1;M01:P0:QapWvW57/ts=;kdNzDSI3ZtiM7sbkfJSPbL3ieHr
 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
 cFObnKYaqoIjUPVOD/9HKZpviQQ6Cm65o1UU/Gl
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782171002; x=1782775802; i=fiona.klute@gmx.de;
 bh=ibQ7aNp7HhXechFPb59oE57f1iHBYW+HEOqCv+Kkclw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=l+O4WpPMselv0y6B1Ra96Dvqa2sSkeSGU9KpCsC0xCjeh23zdyuFefspjLITR1Fn
 lxbtolED1QrzOvJUge3zQxIoAz0gxhMcey8mKF5m/bLEOiY4wtyw9Tg5O+jH9F7I6
 IwQdX1XKUKR2A2tAxpwhVuh+09L88DMFdeFaIfy9z8Mx1MhCd24s7UjjYi1N78Zh7
 mtb9UIu/juyo1pLpC7ghxXzK6HePuCiZMClYfAmRLoWCoytCpHONquiEs9x1kmijj
 d54LLtnCWBCB8AQa/pXfsqKXBRjHLTD0T2u0up/YlMhzctFYqZ+fCjCO9NBF/kkbc
 3rPaP9lfNBqAJwoSUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=l+O4WpPM
Subject: Re: [Buildroot] [PATCH 1/3] package/iptables: improve kernel
 support for iptables-legacy and iptables-nft
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Romain!

Am 21.06.26 um 18:46 schrieb Romain Naour via buildroot:
> Since kernels 6.17, support for netfilter legacy tables were disabled
> by default [1] but iptables package needs Netfilter legacy tables
> support enabled in the kernel when nftables compat is not enabled.
> 
> Make sure to enable CONFIG_IP_NF_IPTABLES_LEGACY and
> CONFIG_NETFILTER_XTABLES_LEGACY for kernels >= 6.17.
> 
> Fixes:
> 
>    [BRTEST# iptables --flush
>    modprobe: module ip_tables not found in modules.dep
>    iptables v1.8.11 (legacy): can't initialize iptables table `filter': Table does not exist (do you need to insmod?)
>    Perhaps iptables or your kernel needs to be upgraded.
> 
> On the other hand, when nftables compat (iptables-nft) is used by
> default (BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT=y) we have to enable
> nft protocol support in the kernel.
> 
>    iptables --version
>    iptables: Failed to initialize nft: Protocol not supported
> 
> Enable CONFIG_NF_TABLES and CONFIG_NF_TABLES_INET as for
> NFTABLES_LINUX_CONFIG_FIXUPS and complete the list with
> CONFIG_NFT_SOCKET needed to pass the TestIptables with
> nftables compat (iptables-nft) enabled.
> 
> Without CONFIG_NFT_SOCKET:
> 
>    iptables --policy INPUT ACCEPT
>    iptables v1.8.11 (nf_tables):  TABLE_ADD failed (Operation not supported): table filter
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=9fce66583f06c212e95e4b76dd61d8432ffa56b6
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>   package/iptables/iptables.mk | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
> index a9d912f6cc..4ace16d0ec 100644
> --- a/package/iptables/iptables.mk
> +++ b/package/iptables/iptables.mk
> @@ -49,11 +49,26 @@ else
>   IPTABLES_CONF_OPTS += --disable-bpf-compiler --disable-nfsynproxy
>   endif
>   
> +ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES),y)
> +define IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_NFT_OR_LEGACY
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_INET)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_SOCKET)
> +endef
> +else
> +define IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_NFT_OR_LEGACY
> +	# [for Linux kernel versions 6.17 and later]
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES_LEGACY)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES_LEGACY)
> +endef
> +endif

On systems where iptables-legacy is the default, we probably want to 
enable the kernel options it needs even if iptables-nft is also built. 
Maybe replace the else block with a separate

ifneq ($(BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT),y)

block, and split the define into 
IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_NFT and
IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_LEGACY so one or both can be defined?

Best regards,
Fiona

> +
>   define IPTABLES_LINUX_CONFIG_FIXUPS
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)
> +	$(IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_NFT_OR_LEGACY)
>   endef
>   
>   define IPTABLES_INSTALL_INIT_SYSV

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
