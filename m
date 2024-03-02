Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE9FC54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 21:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 127B94087C;
	Sat,  2 Mar 2024 21:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H5QFKJ6uIcst; Sat,  2 Mar 2024 21:45:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8DCE40873
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8DCE40873;
	Sat,  2 Mar 2024 21:45:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED1151BF2BA
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 21:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAD3A608DB
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 21:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ra1DC2T-5wr7 for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 21:45:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA1BB606B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA1BB606B3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA1BB606B3
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 21:45:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6E8AB13F88D;
 Sat,  2 Mar 2024 22:45:00 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 02 Mar 2024 22:45:00 +0100
Date: Sat, 2 Mar 2024 22:45:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZeOd3DPvi0lZy5pU@landeda>
References: <20240229224122.1085300-1-romain.naour@smile.fr>
 <20240229224122.1085300-3-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240229224122.1085300-3-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709415902;
 bh=C+ilDx9QmlJdhFIJyj2xhp7qnvSolvezRxfF/tp8LCY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g+8FMbFYehoLPFTvBXTDL9i6cmVR5AILqUJOsJdfmlE74sD25VKlIp1rcp13geKR7
 tuckXj1GzvWxPFu2CKEAe00zR8lcCJU3/dAoZMxst4dVtKMI2+OL3cDeoyOLaob8dS
 VK+MwkY7SvO7COF6W6deuMHcjpG3fqGsfsTHN0YvyJ4INe4ea7psVsuZdMzQZ2bZfI
 jENivAfsa3r5FZLPWq/KkdeJhG1J0I/Upk7JJdKRd5SWSJq7dItBSfFoh7WbhKBdAB
 pkA+W2JZ8yuMjxctATpSclrTYlcZ3l7wGf0jDnxj+gASE53QetKwzKW+xdSCnJ1wVc
 Qv3OMpqGl6oCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g+8FMbFY
Subject: Re: [Buildroot] [PATCH v2 3/3] package/rust: provide RUSTFLAGS for
 cargo
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

On 2024-02-29 23:41 +0100, Romain Naour spake thusly:
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
> Fixes:
> 
>   error: could not compile `rustdoc-tool` (bin "rustdoc_tool_binary") due to previous error
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.02-rc1/package/pkg-cargo.mk?ref_type=tags#L167
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> v2: no change
> ---
>  package/rust/rust.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index 4903060368..394fbfa4ca 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -70,7 +70,9 @@ define HOST_RUST_CONFIGURE_CMDS
>  endef
>  
>  define HOST_RUST_BUILD_CMDS
> -	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py build
> +	cd $(@D); $(HOST_MAKE_ENV) \
> +		RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))" \

Why don't we jsut pass $(HOST_PKG_CARGO_ENV)? That one also contains
CARGO_HOME=$(DL_DIR)/br-cargo-home so I think it might make sense to
pass, no?

Regards,
Yann E. MORIN.

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
