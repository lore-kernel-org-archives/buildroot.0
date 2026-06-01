Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB3ACD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 001D040920;
	Mon,  1 Jun 2026 19:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WT1zKYQC2mp2; Mon,  1 Jun 2026 19:49:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EA4A40987
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780343372;
	bh=CnsGrsqCVBW5Jeuyhw/JHqSkNupV34nsftiWwhUBeFE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YkwUaSFDm8280nMpcMkJ3E4mgaW350hnGQBCHjC6MWl+frDdOYzr//6NlWBMnMZ/I
	 ga23UH75Gmlg6/9zmB0Kp80WmdvBbMUEE0l07xmBRfZjZlaAT55Y/UAx7RmdrrYsfo
	 XxQlFHuL8TISMkBXDnpf3FR2nad7JL27CZjN95d+QonY4f+/dO6sOhqlFzNqSOiPvj
	 chtTXf4r7Pwyrh/FgIfvfxZJLEAxK+D+o8NO4943NUWu2AGE/uFvQGrNzVZoO97AC3
	 L5QkulZMFIo+rV9TGf5TxMjNtn9Y2a+alnwYgCNgeFjuoeOuri/2H2pV+dIwhAmGG6
	 RXITYciNBOPCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EA4A40987;
	Mon,  1 Jun 2026 19:49:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ADA66F5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F2494096E
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r93LXioZn9Ft for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:49:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C52E40920
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C52E40920
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C52E40920
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:49:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7CC65B97C76C; Mon,  1 Jun 2026 21:49:27 +0200 (CEST)
Message-ID: <2aa50f15-8ec2-405b-887c-737c589f323e@rnout.be>
Date: Mon, 1 Jun 2026 21:49:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Guillaume Chaye <guillaume.chaye@zeetim.com>
References: <20260531143820.2967481-1-bernd@kuhls.net>
 <20260531143820.2967481-2-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260531143820.2967481-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780343367; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=+nb8/z4yxExJpG2jKFVkARhiE0yOVlwBfkEzF68z+T4=;
 b=D+MO2zelJJdj/3nDDcsPIjP44eqqJF74tIG5sAxyEyyP3Z/D1hMIE9R1AlGb4tTYzgik68
 SZ01JMQ0QQRSfyeCtCHWP1Ev2lmOoF16gMahZDYci7/Uvbn3Fvq1/jt7cVD1aCDcNAu5yr
 2MdjT+Vi0azxLUgwUGoDDcT+UL8pzSPqikhT2dBfFcgzvM0seNr4jUn20vrsiv90/dmTkG
 +Q6s2oekIPlaWFrvAnp1NuXJuVZ1WdB3huvfIH8C/bR8BfFp+61PXsD9WmgZylM9qY2a73
 551nilTg4fj6M8EEmR0aZXShs6siBnkPdnlenHvSAe/uE52o6fAWYXqSCBqcYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=D+MO2zel
Subject: Re: [Buildroot] [PATCH 2/3] package/sane-airscan: needs
 BR2_TOOLCHAIN_HAS_SYNC_4
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/05/2026 16:38, Bernd Kuhls wrote:
> Fixes a build error
> 
> output/per-package/sane-airscan/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
>   libsane-airscan.so.1.p/airscan-http.c.o: in function `http_data_ref':
> airscan-http.c:(.text+0x1c88): undefined reference to `__sync_fetch_and_add_4'
> output/per-package/sane-airscan/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
>   libsane-airscan.so.1.p/airscan-http.c.o: in function `http_data_unref':
> airscan-http.c:(.text+0x1cd0): undefined reference to `__sync_sub_and_fetch_4'
> output/per-package/sane-airscan/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
>   libsane-airscan.so.1.p/airscan-trace.c.o: in function `trace_ref':
> airscan-trace.c:(.text+0x32c): undefined reference to `__sync_fetch_and_add_4'
> output/per-package/sane-airscan/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
>   libsane-airscan.so.1.p/airscan-trace.c.o: in function `trace_unref':
> airscan-trace.c:(.text+0x358): undefined reference to `__sync_sub_and_fetch_4'
> 
> with this defconfig
> 
> BR2_sparc=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE=y
> BR2_PACKAGE_SANE_AIRSCAN=y
> 
> detected by the Gitlab pipelines while testing to bump of sane-backends
> to 1.4.0 in this series.
> 
> The build error is caused by an upstream commit added in 2020 to version
> 0.99.14:
> https://github.com/alexpevzner/sane-airscan/commit/fccd8402a6bc5fce22805edf4e0fb6b0f24479e7
> so a backport to LTS branches should be considered because the initial
> version of the buildroot package was 0.99.33, added with commit
> f78280bf262ceb1c1abbdade9de77fcc4add74ae.
> 
> An autobuilder error was not recorded yet because it is masked by various
> build errors of the sane-backends package which are resolved by its bump
> to 1.4.0 in this series.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/sane-airscan/Config.in | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/sane-airscan/Config.in b/package/sane-airscan/Config.in
> index 2324a3f661..63ef06b582 100644
> --- a/package/sane-airscan/Config.in
> +++ b/package/sane-airscan/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_SANE_AIRSCAN
>   	bool "sane-airscan"
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on !BR2_STATIC_LIBS # avahi, gnutls, sane-backends
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # avahi, dbus
>   	depends on BR2_USE_WCHAR # avahi, gnutls
>   	depends on BR2_USE_MMU # dbus, sane-backends
> @@ -26,5 +27,6 @@ config BR2_PACKAGE_SANE_AIRSCAN
>   
>   comment "sane-airscan needs a toolchain w/ wchar, dynamic library, threads, C++"
>   	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
>   		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
