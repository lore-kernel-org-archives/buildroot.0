Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58C4C5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 19:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D41EC81D47;
	Mon,  4 Mar 2024 19:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xlmRZ30dsa4U; Mon,  4 Mar 2024 19:27:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39FDC81DF1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39FDC81DF1;
	Mon,  4 Mar 2024 19:27:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C90C31BF2AF
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 19:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B41084010D
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 19:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ju7Hye9oPNSs for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 19:27:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9B45140105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B45140105
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B45140105
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 19:27:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5345E13F899;
 Mon,  4 Mar 2024 20:27:23 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 04 Mar 2024 20:27:23 +0100
Date: Mon, 4 Mar 2024 20:27:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZeYgm_9dQteDN5HO@landeda>
References: <20240302232940.2455257-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240302232940.2455257-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709580445;
 bh=mhqlTthUg+f7N92fV9zkcN58G1VePrq524Sm4GGRSgU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jzM7orA2t4klV6jJrw7A6TjQqKrnWRQVp6dMh0bMiwBkyYlXv6sN7LA02e+/kNB07
 OET84ttV0yB2o4tj+c95Wm5jsk8JVMTKiql9lUZcjgjEp4oUwTWV4McpcY/MEI4gEw
 NUJjz05d0HYTDCbw8s0zZZM5ZYBtmiNMjLogtINwtzHwcx7a8mF4xt9roqtMjzj4vW
 kJe3KH5R3aosljpZkcNoB+Dc/XNRaX+yskWXoJN+zfYleYw4fM2iVCxNO5ZDroDBWf
 hCzaKd8YCv2Hs1THE7fnOlmheZDnVZYU5WCxac9kxq2uKpWqRHbPDSWzo3NgAOaPtp
 OVC75ckmCrNVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jzM7orA2
Subject: Re: [Buildroot] [PATCH] package/rust: provide RUSTFLAGS for cargo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2024-03-03 00:29 +0100, Romain Naour spake thusly:
> While building the rust toolchain, the build system endup using
> cargo (from [...]/output/build/host-rust-bin-1.74.1/cargo/bin/cargo)
> to build some tool like rustdoc-tool.
> 
> But the host-rust package doesn't use the cargo infractructure (since
> it provide cargo binary) and some cargo environment varialble [1] is
> not set to crosscompile cargo packages in the rust toolchain.
> 
> For exemple, we usually set RUSTFLAGS="-C link-arg=-Wl,-rpath,$(HOST_DIR)/lib"
> to force cargo using libraries provided by Buildroot in $(HOST_DIR)/lib.
> 
> RUSTFLAGS is actually needed to find zlib library (host-zlib) to link
> rustdoc-tool when zlib is not installed on the host.
> 
> Add $(HOST_PKG_CARGO_ENV) in HOST_RUST_BUILD_CMDS since it already
> include RUSTFLAGS but also CARGO_HOME.
> 
> Fixes:
> 
>   error: could not compile `rustdoc-tool` (bin "rustdoc_tool_binary") due to previous error
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.02-rc1/package/pkg-cargo.mk?ref_type=tags#L167
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, after slight rewording in the commit log, thanks.

Regards,
Yann E. MORIN.

> ---
> v2: no change
> v3: use $(HOST_PKG_CARGO_ENV) to provide RUSTFLAGS along with CARGO_HOME. (Yann)
> ---
>  package/rust/rust.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index 4903060368..c544582c99 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -70,7 +70,8 @@ define HOST_RUST_CONFIGURE_CMDS
>  endef
>  
>  define HOST_RUST_BUILD_CMDS
> -	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py build
> +	cd $(@D); $(HOST_MAKE_ENV) $(HOST_PKG_CARGO_ENV) \
> +		$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py build
>  endef
>  
>  HOST_RUST_INSTALL_OPTS = \
> -- 
> 2.43.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
