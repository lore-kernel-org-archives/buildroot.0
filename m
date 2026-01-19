Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC76CCF2D5
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA90980582;
	Mon, 19 Jan 2026 10:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXD9TeKZrix0; Mon, 19 Jan 2026 10:09:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C43781BD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817358;
	bh=KrA3yglrjv6FkaGUNWGYiIGX+D2fTb6tVYOkbX0y7yo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e94HzoSh9x+5qYQDy+5qUckN5k0ElVWuevoHvfopRdYx68RIJ/xF75/lmGTJ1xSCG
	 ZEJwwofaAKrrxrB6V2T0qLrxjMYAQrGuxGH7DpqIiemSya/I9RMNFSa4/C2WpFMfJu
	 80WcH7DqdzTRlgI0E/K1kh1he095dPg9P3NfRlm3y6yhZZj/4aHzSG/LDEw4b2O9iq
	 7v9kM/x6SnI3ipjceWKGHFXzJLoL3S42TS1gTwsctSO0OzQ3ywgOcmHB5970plTid8
	 6MbTIko+sXbcsSUW52AQCOnSpbWQ+/tnVTRJbL2np4JKzuWcq3WBT5Hu9cY7yIEr1L
	 /NkmZ5PJq1QoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C43781BD9;
	Mon, 19 Jan 2026 10:09:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80ACF347
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63A6281D35
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfRDKbgfNDZK for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F06781DB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F06781DB2
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F06781DB2
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B3859B97A96A; Mon, 19 Jan 2026 11:09:09 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:09:08 +0100
Message-ID: <20260119100908.12559-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103132552.3979708-2-bernd@kuhls.net>
References: <20260103132552.3979708-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817349; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=T3fQV9K5jSB9kSlVV5Qs/DtboKH7+/am4ovk5tYkeNs=;
 b=YKgdATG2y+BXCFLKU6q9vK1c2A9rfi0GVuKni16LgBZuqufCDO8fkoURTTZBWOYl+402aw
 GQb+ywcLjtd6PMxQsYjTloz8sMqWmmmwQPjH/hzW8iOTv8rx0ElyIYP/w7GYhRmO4UeKfj
 JarUQqqa9IeRPqb72Uq2v4Pe0X9A9M+kyKWpaPB/RFkkNJymZpJI/HwF6FQSaHchVbCI56
 y/8EhQW1uCjbSOPHeafvVcAdtcI55CKAqmYxmVg/+9wHXzDmqR2NFV7MAjOHKbLPlr9Jqs
 c+RnQeN3esu5a54DuPr/kSjtIJv1nLEzpN7QOoju7vJW6ZqLJQ8iSyUjgxFrKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=YKgdATG2
Subject: Re: [Buildroot] [PATCH v4 1/5] package/libtirpc: introduce
 BR2_PACKAGE_LIBTIRPC_RPCDB
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
> Package libtirpc with commit[1] exposes --enable-rpcdb so make it
> selectable to allow packages that use rpcdb functions to enable it
> and build correctly.
> 
> [1]:
> https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> [Bernd: move gss comment into if-block]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/libtirpc/Config.in   | 17 ++++++++++++-----
>  package/libtirpc/libtirpc.mk |  7 +++++++
>  2 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
> index 31f1636ef5..371f7c46c1 100644
> --- a/package/libtirpc/Config.in
> +++ b/package/libtirpc/Config.in
> @@ -7,19 +7,26 @@ config BR2_PACKAGE_LIBTIRPC
>  
>  	  http://sourceforge.net/projects/libtirpc/
>  
> +if BR2_PACKAGE_LIBTIRPC
> +
>  config BR2_PACKAGE_LIBTIRPC_GSS
>  	bool "gss"
>  	depends on BR2_USE_MMU # libkrb5
>  	depends on !BR2_STATIC_LIBS # libkrb5
> -	depends on BR2_PACKAGE_LIBTIRPC
>  	select BR2_PACKAGE_LIBKRB5
>  	help
>  	  Enable GSSAPI support
>  
> -comment "libtirpc needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> -
>  comment "libtirpc gss support needs a toolchain w/ dynamic library"
>  	depends on BR2_USE_MMU
>  	depends on BR2_STATIC_LIBS
> -	depends on BR2_PACKAGE_LIBTIRPC
> +
> +config BR2_PACKAGE_LIBTIRPC_RPCDB
> +	bool "rpcdb"
> +	help
> +	  Enable RPCDB support
> +
> +endif
> +
> +comment "libtirpc needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
> index ab15954561..eadacedfcf 100644
> --- a/package/libtirpc/libtirpc.mk
> +++ b/package/libtirpc/libtirpc.mk
> @@ -25,5 +25,12 @@ LIBTIRPC_CONF_OPTS += --disable-gssapi
>  endif
>  HOST_LIBTIRPC_CONF_OPTS = --disable-gssapi
>  
> +ifeq ($(BR2_PACKAGE_LIBTIRPC_RPCDB),y)
> +LIBTIRPC_CONF_OPTS += --enable-rpcdb
> +else
> +LIBTIRPC_CONF_OPTS += --disable-rpcdb
> +endif
> +HOST_LIBTIRPC_CONF_OPTS += --disable-rpcdb
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
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
