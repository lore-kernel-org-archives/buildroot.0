Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA3DCDB479
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 17:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2238681E62;
	Wed, 24 Jun 2026 17:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkRBWzw5R8jP; Wed, 24 Jun 2026 17:37:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 009F581E4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782322625;
	bh=Dmad/OQnaDg8toVM8AG/t5MS7KgS8YsGA/xyvIgfLbw=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ngYCIiIWq0rFDhy9ufp6NDte2MLj0hjEHlkUM986BQCjVSTSbbe0IiM6u/LmloQq+
	 pOUrQHibfF5DtUi7E9uEeawsupDUpJ0xAV07WNGQn5KNI/SWB+Wnu69miS5qaz0juv
	 400wJEruE+xpXM/T+MuyU1OLuDd7EgrFGjhOwRV8J7hUJWa/STB+ajzmrZ8kzoMFPi
	 exkSXGTgb/u4WGWGz1lcN+zTWl2wSYRVDeWS/NEcQFBQzEfUUDiBgVGhlOlJv82Aak
	 ZklwRK7Cp4JFvjFiL0Wv0b4XSV4SZDQTAbCpWEhjPRrlbSxgmNAPMlPyyDUOek1r7H
	 HvoxHKIH5EUbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 009F581E4F;
	Wed, 24 Jun 2026 17:37:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8261AF4
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 17:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6819660B30
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 17:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCJZjc-nGia1 for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 17:37:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB5F760B10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB5F760B10
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB5F760B10
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 17:36:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7QxB-1xDF3d0bcr-015yQc; Wed, 24
 Jun 2026 19:36:56 +0200
Message-ID: <1de61d9e-316f-482a-a5ca-c3040f437f71@gmx.de>
Date: Wed, 24 Jun 2026 19:36:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20260624125154.1869177-1-romain.naour@smile.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260624125154.1869177-1-romain.naour@smile.fr>
X-Provags-ID: V03:K1:M+0ycbcl2QLMnE4bu0Uz3JLFJcl0DwU3k6IonzonN61xbRcYkWP
 isF8IMFJ+UktZ8jAESsM7e4VOsOjlCME51iy0w/K6WPHOJeaOWkydajWkP9r5kIZs91EG1j
 cMrqIxjhDQ+IhFQKHmB5rL492SVnOlwnq47eA1BlgU2rqTJuIUzq7CN4wssKduGH4NQteW4
 /jLwIQEcG/nsb2WihHk+g==
UI-OutboundReport: notjunk:1;M01:P0:/aE9nroJQ3c=;pAR/Cde8JLi6vDGF4yYLXHf79aa
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782322616; x=1782927416; i=fiona.klute@gmx.de;
 bh=WRrjhGEWGQehmjCquEhUH8xI5uS9MXqTJIqCkrB+xCk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ECkI505q+MyCWbshD7PtbacsTnVYLV1WE4Jno02dD7+nxRLn3S4o38bSOXL+jCea
 QWui/i2OBwLXW0Y2WHyOXq3KRXgVBX6UNIQsfVo/4sxYjm/1RV0uGYnm9e89+/hYS
 OOo4wZoNfELyKoW/G1woKNam6OYHtjLyh8juhbsC2aZRqKSlaRCwAWdtoVMP2/mI5
 CAMoXHIOgGpFRUQyeW7jDKS2lLNWxWCl38vGU7TaaYJol0+kXi+9FsHTzjKAP/c+S
 nqN+iSP2G082nNnowmBsvAVbcsrJ9yGOydMAF0tmI6WoNzAAoHQQfezeHmHeTErcF
 V1bmxFOz5Qq5rnPc+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ECkI505q
Subject: Re: [Buildroot] [PATCHv2 1/3] package/iptables: improve kernel
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

Hi Romain,

one small question below.

Am 24.06.26 um 14:51 schrieb Romain Naour via buildroot:
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
> So, disable iptables-legacy support only when nftables compat is not
> enabled by default. Enable iptables-nft support when nftables compat is
> enabled, even if not used by default.

I guess the "not" in the first sentence is a typo? "Disable 
iptables-legacy support only when nftables compat is enabled by default" 
is what's happening. I can fix that when applying, just want to be sure 
about your intention.

Maybe at some point we should merge BR2_PACKAGE_IPTABLES_NFTABLES and 
BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT? I can't really think of a 
situation where someone would want to enable the nftables backend but 
not use it by default, mixing legacy with nftables is a recipe for 
trouble. But that's a separate thing. :-)

Best regards,
Fiona

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=9fce66583f06c212e95e4b76dd61d8432ffa56b6
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> v2:
>   - Enable kernel support for iptables-nft even if nftables compat is not
>     enabled by default (Fiona Klute).
>   - Enable kernel support for iptables-legacy only if nftables compat is not
>     enabled by default (Fiona Klute).
> ---
>   package/iptables/iptables.mk | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
> index a9d912f6cc..bb01c07a43 100644
> --- a/package/iptables/iptables.mk
> +++ b/package/iptables/iptables.mk
> @@ -49,11 +49,33 @@ else
>   IPTABLES_CONF_OPTS += --disable-bpf-compiler --disable-nfsynproxy
>   endif
>   
> +# Enable kernel support for iptables-nft even if nftables compat is not
> +# enabled by default.
> +ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES),y)
> +define IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_NFT
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_INET)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_SOCKET)
> +endef
> +endif
> +
> +# Enable kernel support for iptables-legacy only if nftables compat is not
> +# enabled by default.
> +ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT),)
> +define IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_LEGACY
> +	# [for Linux kernel versions 6.17 and later]
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES_LEGACY)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES_LEGACY)
> +endef
> +endif
> +
>   define IPTABLES_LINUX_CONFIG_FIXUPS
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)
> +	$(IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_LEGACY)
> +	$(IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_NFT)
>   endef
>   
>   define IPTABLES_INSTALL_INIT_SYSV

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
