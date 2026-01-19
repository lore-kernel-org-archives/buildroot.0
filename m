Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D221CCCF2D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A62C540CD4;
	Mon, 19 Jan 2026 10:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tpuzNeKLWoS9; Mon, 19 Jan 2026 10:09:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBEE340CEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817359;
	bh=XsAoqN79B5m7r5a+6tQVjoI2hAQoET0WMt1pm6Gec1Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oxpACGHhrE0e+md8N5c/rJHmqcXLFtxf69ax9umDEer1hUfrffHHac6s8jUdcJiRG
	 3hD5CEhpr5Nq4ZdNFKRFTTP27XBLdBGztifcEDlO+m2Cxv1MDbK4Z0MB/xWwbtNhLq
	 s2dHEAQblHEX1qtu9n52u8MgXLXFANJ/UkI640UYPb1kL+nEjSRg4yPZjxx+BHKxeu
	 oWjkTn7XjWxgcLcgQhiAniDqME7Hh7hcAeGkdn7xTqibN20QPIPw31+cbgIluh43Ii
	 16v4uqLq8ge6NDlHvNV8qWFFinPQEEm/Dg+sI/ayE+B57nWoYoxKmz6b+R+OjjosOb
	 vTKf9DuD3KRHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBEE340CEB;
	Mon, 19 Jan 2026 10:09:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D9CB2CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80C3540D3B
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GcNQep4eNl1E for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7012A40D09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7012A40D09
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7012A40D09
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9E61AB97A96A; Mon, 19 Jan 2026 11:09:12 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:09:11 +0100
Message-ID: <20260119100911.12719-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103132552.3979708-4-bernd@kuhls.net>
References: <20260103132552.3979708-4-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817352; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=ORsfWwOZfN24cUyIsxaUw++fETrS/GyfzZMsnQSjBUo=;
 b=pIQECZ5q5t2M4lgVpS8DZQJ7vtayVBQVeH+IH6pn1BPsnnJHWNnWAxI+C9BubQWlLAeG67
 8WyTY5DsxLkE8TOi3OfLmIbHe5mwnGpu1wMGbKX83MmbD1MSABqa78kF77IRgG0CDx44xc
 1qlXxqDzSJF1r7cvLYYhSWNw3ynyUhYb2V8f8l0CH8+lNPxnJO7JZKnxQv+eSkttRXIhl3
 b6ImMmUUFYaGVzbZSAERARyGy+wcobxbUMIVy7HwsKhlSpuvaTFqX4FIPKF2dxm1NcudBs
 VO6M3X9jAJblC3N04yks4dvsLB3/PPXBePEoX2zJwUw0+wJt58P7CRRP7Cupxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=pIQECZ5q
Subject: Re: [Buildroot] [PATCH v4 3/5] package/rpcbind: fix build failure
 due to missing BR2_PACKAGE_LIBTIRPC_RPCDB
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Package rpcbind requires libtirpc rpcdb option enabled. Package
> libtirpc with commit [1] disabled rpcdb functions by default so let's
> select it by default to enable rpcdb functions required.
> 
> [1]:
> https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193
> 
> Fixes:
> https://autobuild.buildroot.org/results/f461212605d9d5f1c38a1ffe00a83912522bf482/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> [Bernd: enable BR2_PACKAGE_LIBTIRPC_RPCDB only for non-glibc toolchains]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/rpcbind/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
> index 9cde7bba39..0b2c207580 100644
> --- a/package/rpcbind/Config.in
> +++ b/package/rpcbind/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_RPCBIND
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc
>  	depends on BR2_USE_MMU 	# fork()
>  	select BR2_PACKAGE_LIBTIRPC
> +	select BR2_PACKAGE_LIBTIRPC_RPCDB if !BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  The rpcbind utility is a server that converts RPC program
>  	  numbers into universal addresses.
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
