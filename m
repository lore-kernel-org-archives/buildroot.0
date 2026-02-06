Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B22EB28E2
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BC4A612C3;
	Fri,  6 Feb 2026 08:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VA6Hi14KOgn; Fri,  6 Feb 2026 08:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EDDC61289
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365543;
	bh=bSQaB5pIayB2yOKsCaZiZgFEX5vbZBdukSq0Z56VcJ0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MYwfOwy+IqJMnyhizACWvTIjkPQxQXdoQZeLKdWH1V3/54ep8kIdpeVq/tHLDztcP
	 FI04YBKQf2UE1lALfn5WPBDDucj/GNJv3MuRCG9CR1rY3NP6E7ttuw8I1rppIaK+NG
	 cH+Y0ifJg5zkTVp461BvV2tdiiF8mvamukqMdwo+s40fCZuWHFcYjmxn+TL0LJMKhK
	 Wu/6lwa9I4HFtj1TpKFPmKdymAIATf1szS3zjCdX3NEFZh7PNxVauxh/8Mtixw0OJj
	 gX0xK8gH3pK0FGaGt4pdNddANWkbLGUw2KQsb7mPczYchipJOhwoVTVE/KGjPncsEI
	 TndhQ2iIAceeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EDDC61289;
	Fri,  6 Feb 2026 08:12:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35D86173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2550684040
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jcsctvCzWMTg for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:12:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F3A4A834C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3A4A834C7
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3A4A834C7
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:07 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4362c635319so197827f8f.2
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:12:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365526; x=1770970326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=00V66idYmuXhBjx/kAJrwFY1bf8iDMn7uEU5/9hWEyk=;
 b=rY2fsk4Zy7AGNAsLunry5x1EIbOgG1ylSaftSR1wOjv565lplmM0ftvszyLu1UjwBG
 ywICFAubsxWNNQHZU5yYA/YGJlAgOqblRl+ztX+AdiPOEh83KGb5pPfLhezu5rdB+NA9
 zGVJIs8sY5Uog7aazvEJ995wc6Ws5Ns2+GVWsXJlSkuf9ho2QePp95SNnWYnIDdvBffU
 fq84+q55zfFJ3AleoNJaRw+KFqwW42DEOpsdKAJGdZpNG5It4NcY2WgtrzIcfk+2uS/N
 ceH+eTuR7dspgkVe5mc2Adr4GudiQ8+ZdgCD5fdN02lVb9z3DOH9dC0kzuRV4Y5Y3Ig+
 OOaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYAFb51anaApmn5htvYI22lzri/mt4T0pxTQ1jTTrpg+bppeyjKq/zSAOZOnG0YQNQPPVKYU4kyuk=@buildroot.org
X-Gm-Message-State: AOJu0YxWF2r7mgYW5aL1riKgU316smfp4ZYO75MoaEM6KhvLFfWjtI04
 vUjKGxgqBEmOXMwBAaKQAIdjy7GmejVSMeDmfxyd1sGsZmogUF3aXUNRAOyDNp7Si9UOlQBEi8K
 U+t1x
X-Gm-Gg: AZuq6aJnCtB43vlzx9pECk7Cl2b9G9wHaciUZ57f2IgcaOfqbHFDkKGtAzLV+CwpEPK
 tkW4Rma2ZVQvu5274J6Sf/VmajDX3M+i3V6S+Fs1sj+olUqBEr8Omhe9siugtU//oSP7pYBTbOo
 R7Qs9e7NRnIk89l+D/WOPZLFrXvRk6pakmI4VeNuJeepJjEdyOItZSg0yCFqrqnD47Vo5KFIKKD
 GNlbhu8leRgvkGRimd+egDTZiKqUTUbErAYLwPVG3UGqgqGKMP2pknUximVVKDzzk7QLIEEI+HC
 KFeIbgjU59Ze9Orp8Zu8dyh25eaH2jOB3qG45HPauECNbiKcCbsb/ew13Y+zAKgqgyNfsbPceKb
 CchT15owi1ANsupkvmFRtAEQ7wKMh0yN1p1SO2F90sUTxpqrWD+mAMFE8s2nYQJcPD9wZOpIyiX
 gS8bendyi8omxcbA==
X-Received: by 2002:a05:6000:1887:b0:432:8504:befd with SMTP id
 ffacd0b85a97d-4362934c520mr2912961f8f.32.1770365525712; 
 Fri, 06 Feb 2026 00:12:05 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43629756bc3sm3707926f8f.39.2026.02.06.00.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:12:05 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:12:04 +0100
Message-ID: <20260206081204.33020-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125104501.433268-1-bernd@kuhls.net>
References: <20260125104501.433268-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365526; x=1770970326; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=00V66idYmuXhBjx/kAJrwFY1bf8iDMn7uEU5/9hWEyk=;
 b=Z7PkO87vndoxyxm5H8svWvuJCzLGkjCy//fy3YuTr16Z6hwXj3yTZRX94j7nIrpwiQ
 0d2bAQTIFJiyLCcjZyUUloExxj/3sRw7bhV/GsNA7h9+VpTdCZMOTtFWnxMuIm2ZEoXI
 v2HWZRr9+Pgn/mRcU1fRW0hyAox92mAUE8nh5CC56XhoW+eFUOfJqWN1Wxgr/2/Rqf6C
 X7JI4T09MUR3qZxA7OJO70q/qeVrqPyZbiiflYKRNC7Cga/OaenHBoK52ty8SJqxxhE1
 mpgR1RGV3nDre6Ip9mest17xtxENvj4RIddh+mhGvr4Hzu2S7Iy7lCqW6pP78MRNVm//
 Bbow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z7PkO87v
Subject: Re: [Buildroot] [PATCH 1/1] package/netdata: needs C++
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
> Buildroot commit 9cfcd906cff299ef83b48681e50bcef9df124ad4 bumped the
> package from 1.33.1 to 1.37.1. Upstream changed the optional C++ support
> into a mandatory dependency with commit
> https://github.com/netdata/netdata/commit/b6d2a3662dfb683e9e95203ef3b21f8e31238b06
> added to version 1.35.0 causing build errors with toolchains without
> C++ support:
> 
>   GEN      netdatacli
> /bin/sh: line 1: no: command not found
> make[3]: *** [Makefile:5502: netdatacli] Error 127
> 
> Fixes:
> https://autobuild.buildroot.org/results/7084a73d5727a86ca55eda3d1f01ea4d5b8ecf65/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/netdata/Config.in                     | 10 +++++-----
>  support/testing/tests/package/test_netdata.py |  1 +
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/netdata/Config.in b/package/netdata/Config.in
> index 3603eb071c..527d4d39af 100644
> --- a/package/netdata/Config.in
> +++ b/package/netdata/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_NETDATA
>  	bool "netdata"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_MMU # fork()
>  	depends on !BR2_STATIC_LIBS # libuv
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
> @@ -22,22 +23,21 @@ if BR2_PACKAGE_NETDATA
>  config BR2_PACKAGE_NETDATA_PROMETHEUS
>  	bool "prometheus remote write backend"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> -	depends on BR2_INSTALL_LIBSTDCPP # protobuf, snappy
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
>  	select BR2_PACKAGE_PROTOBUF
>  	select BR2_PACKAGE_SNAPPY
>  	help
>  	  Enable prometheus remote write backend
>  
> -comment "prometheus remote write backend needs a toolchain w/ C++, gcc >= 8"
> -	depends on !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
> +comment "prometheus remote write backend needs a toolchain w/ gcc >= 8"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  
>  endif
>  
> -comment "netdata needs a toolchain w/ NPTL, dynamic library, gcc >= 4.9"
> +comment "netdata needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 4.9"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
> +		|| !BR2_INSTALL_LIBSTDCPP \
>  		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> diff --git a/support/testing/tests/package/test_netdata.py b/support/testing/tests/package/test_netdata.py
> index 6b616398d3..42bcbcdc6f 100644
> --- a/support/testing/tests/package/test_netdata.py
> +++ b/support/testing/tests/package/test_netdata.py
> @@ -6,6 +6,7 @@ import infra.basetest
>  class TestNetdata(infra.basetest.BRTest):
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
>          """
> +        BR2_INSTALL_LIBSTDCPP=y
>          BR2_PACKAGE_NETDATA=y
>          BR2_TARGET_ROOTFS_CPIO=y
>          # BR2_TARGET_ROOTFS_TAR is not set
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
