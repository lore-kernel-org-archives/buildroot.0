Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891F8C44500
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65C3A413C2;
	Fri,  3 Jul 2026 14:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 09gi8KCiTfU2; Fri,  3 Jul 2026 14:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57EA9413A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089216;
	bh=N1UkMOyGTwssXmeCM7KXhd2JsdxUMLRgcc2wTpcWBhs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=THskP1H1JxJ/bNz7Vjc1Ux2UBf9VR912NVA0c+7bmdCNjoxAl0UKf5e8zmpMkDEEK
	 gqgnJVn+H5azGQPS+4d7pUqZeFWU/eKGMNQZiETVO/idZvHTMm1PECo695ZY5m4wgM
	 SkhHGvWwYbEzU1JgjMrsILzK+/XR7JuqkZWVOd6fNHQNQMWJqjS/a+nKGTcMvGUWwZ
	 ne8MfmfaYYppmWnoG94+42wQ38zVjxNuPOPtigDblmzScvOJ6JAoGDTxzDCmEAjtsm
	 CZVRAWBdr+wlBoPZujR3Chrx2VwZXFCpjSgxUzUd3QT+2pZ1x/JQkzYpn52iUSNzZ6
	 Nlnsp7VGavJpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57EA9413A7;
	Fri,  3 Jul 2026 14:33:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CFB7B14F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C205E6154C
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tW6nCDSzCf0c for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:33:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2872B61541
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2872B61541
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2872B61541
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:32 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-493b691cb44so4389385e9.0
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089211; x=1783694011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nzmLuHJqvBlOOZFPth2tnxcDg4XrZnwfbwtXCUWc9Gw=;
 b=FSyQGfu8aiWuIr79Pq1GGXfEL6lu75HnRUwtBTIpPvwkKTZkoyuvP0vcVDfD5LKYMV
 dH/Tn/lt3H5NH4IQdukyzuN7RewdQLVBOSogc0JUwANlM8/TvYynEBq4uuQjoAk7ztGo
 QiQrk27EUCd90A3SYVNY/EARUM3EZacab0bk7EQe9aCsQrQ2uBTGEVvlEDb+USQCMpM1
 e5tTfPILgJTBfG588o4hFZlkl3IOfY1t9SO7xgdc/BZGlAkapwVt/HD/Pr0s9rfxLiu6
 kIcVtZZvJOlj7n1AgxoQczimqNPBPbIu6e/b8JxSAuZ2hGJjpAvLadgtsbcO6unJZE+r
 sLsA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Hdic/LBtPkwYxTYhVwDytvPPIYc8rR3yrpKno2f7Wr0mE0M8cm5rIx89HfrNN+WbmA5YRDqDpKPI=@buildroot.org
X-Gm-Message-State: AOJu0YwpbASQ1A5P+9rKgMhRaeZ98Hkhx8f/r4p+4r5YA520kt7pSyTt
 Fg43BV3R9F7mBuH3MXvv11+56JntiV8XvM5r6wAMurAIqNtBGGITTzYn8nns+r1DSvY=
X-Gm-Gg: AfdE7clyt2KOo9P8/Sx1yyzKV2bafHx9QVIWWl5ZJvnT6CqQQcwrWZF9m8P6lJ/eae2
 hjvv82CWGY0iml1T9gPzN0YYvKbyuA8eG06Du/Qc74JYETzIt4c16y7TBMIZ8CXP1ICKnpPP/rR
 eAR9bESjope1dSstdKK9o94+hSXfO7KyCdZy/SmA4RnvQRu32PGQ3KaRiNlakdjlmrnyv2yNjjY
 nZTT5FfVrt0YwSQ2lYIl6ACubGAweALI6XoZ/jjdwfVC4vjGxsR+BlGoZPvHkg0OncmzXr2wJKU
 Y/cRW8lt/W8mmm/dROO5ZOfxn1jR5FU43zhhauC3J+WvOjZ2r/iTpd3kIJIf/evx+ajQcPOSMxs
 Y+5P4j0z1lm5Wuj0CzTs5dSBeU/NfliK6lkbqwAbA0e8Q8Ly1W1JinFW2p1n9LZUiySTKaS/uQ7
 dwahsX
X-Received: by 2002:a05:600c:4ed4:b0:493:bacb:1341 with SMTP id
 5b1f17b1804b1-493d0f08442mr1961765e9.4.1783089211069; 
 Fri, 03 Jul 2026 07:33:31 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493ccdabda3sm58473525e9.5.2026.07.03.07.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:33:27 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:33:27 +0200
Message-ID: <20260703143327.275936-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260624125154.1869177-1-romain.naour@smile.fr>
References: <20260624125154.1869177-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089211; x=1783694011; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nzmLuHJqvBlOOZFPth2tnxcDg4XrZnwfbwtXCUWc9Gw=;
 b=DnmBO1HWxlhJVgMzZCynbexu/JE64R40kdqxquluoFdikhC9tU3lbRq+aZoHz/nm1E
 yh8YEygA5kgJcytrbk1Ymz8xs2LZbQ18vJutmc6v6lvuo9pnXfhfpDSm/tyXrOqof7bI
 MA5L9pZyDWS8CSCWyZAClIINQ9LZYsOmpHWlvyOPa8OnLk4khKblLGLTjFHvyPLkXfhs
 oscxPUJpB1juoCOXTkfSS1nY6H3ngUqX/5rGNiXf6CW2IwWoe8Zz267HxXr7GByravRS
 3+yTquoUKfsekGsalxvqEOZfAPTarDSCGuuH7A4IYqrIWQFMVhj7qCehvoish2yTm3LT
 +FwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DnmBO1HW
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Since kernels 6.17, support for netfilter legacy tables were disabled
> by default [1] but iptables package needs Netfilter legacy tables
> support enabled in the kernel when nftables compat is not enabled.
> 
> Make sure to enable CONFIG_IP_NF_IPTABLES_LEGACY and
> CONFIG_NETFILTER_XTABLES_LEGACY for kernels >= 6.17.
> 
> Fixes:
> 
>   [BRTEST# iptables --flush
>   modprobe: module ip_tables not found in modules.dep
>   iptables v1.8.11 (legacy): can't initialize iptables table `filter': Table does not exist (do you need to insmod?)
>   Perhaps iptables or your kernel needs to be upgraded.
> 
> On the other hand, when nftables compat (iptables-nft) is used by
> default (BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT=y) we have to enable
> nft protocol support in the kernel.
> 
>   iptables --version
>   iptables: Failed to initialize nft: Protocol not supported
> 
> Enable CONFIG_NF_TABLES and CONFIG_NF_TABLES_INET as for
> NFTABLES_LINUX_CONFIG_FIXUPS and complete the list with
> CONFIG_NFT_SOCKET needed to pass the TestIptables with
> nftables compat (iptables-nft) enabled.
> 
> Without CONFIG_NFT_SOCKET:
> 
>   iptables --policy INPUT ACCEPT
>   iptables v1.8.11 (nf_tables):  TABLE_ADD failed (Operation not supported): table filter
> 
> So, disable iptables-legacy support only when nftables compat is not
> enabled by default. Enable iptables-nft support when nftables compat is
> enabled, even if not used by default.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=9fce66583f06c212e95e4b76dd61d8432ffa56b6
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2026.05.x. Thanks

> ---
> v2:
>  - Enable kernel support for iptables-nft even if nftables compat is not
>    enabled by default (Fiona Klute).
>  - Enable kernel support for iptables-legacy only if nftables compat is not
>    enabled by default (Fiona Klute).
> ---
>  package/iptables/iptables.mk | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
> index a9d912f6cc..bb01c07a43 100644
> --- a/package/iptables/iptables.mk
> +++ b/package/iptables/iptables.mk
> @@ -49,11 +49,33 @@ else
>  IPTABLES_CONF_OPTS += --disable-bpf-compiler --disable-nfsynproxy
>  endif
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
>  define IPTABLES_LINUX_CONFIG_FIXUPS
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)
> +	$(IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_LEGACY)
> +	$(IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_NFT)
>  endef
>  
>  define IPTABLES_INSTALL_INIT_SYSV
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
