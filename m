Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00940C5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 22:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C19AE409A8;
	Sat,  2 Mar 2024 22:07:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pMMgYNU947nl; Sat,  2 Mar 2024 22:07:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0E9D409D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0E9D409D3;
	Sat,  2 Mar 2024 22:07:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 37A831BF57C
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 22:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2558F606C6
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 22:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yEQX0yxDB005 for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 22:07:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E8C026064E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8C026064E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8C026064E
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 22:07:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3165713F846;
 Sat,  2 Mar 2024 23:07:34 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 02 Mar 2024 23:07:33 +0100
Date: Sat, 2 Mar 2024 23:07:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZeOjJb_G9QpWwvsg@landeda>
References: <20240229224122.1085300-1-romain.naour@smile.fr>
 <20240229224122.1085300-2-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240229224122.1085300-2-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709417256;
 bh=L+cUvmVNLEY7kJ8Nk8yOkcu3WS6WVdQy1KvdMim6V7Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MB0Ti0sk0q4XJewQfysJcRvZrckVIywBKEX5uFwA0OIciYNGHPpX5bK3xO2iM23dy
 e0pVGAU9XcE/E4GAY6OFQ26u0FYmjuIdY1UU83YPhGFBBeb/TnXdg8KtmjfzfsVWJy
 FcaX0ReHpoFbxYnpXTiJHf6Xwxfk7z/K8R06oOnardjK6BDASWHpDKi67GzXWJEusB
 tPDLCj4hzzTxcU/kV9Z0ReusVhKiHkD50sEdhG8JbrEkXM4zXpJJeTYVFUguh+yxee
 eSEjjYQatvWY/cWeMtYMdZ8z+GNcO7939IY7+GGQ6SQpxVX2645TBHXeQdE/mB8U2c
 l2erS9wiSUe6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MB0Ti0sk
Subject: Re: [Buildroot] [PATCH v2 2/3] package/rust: use host libraries
 from HOST_DIR
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
> host-rust package depends on several host packages to provide tools and
> libraries but it doesn't take into account HOST_DIR while building rustc
> compiler. Indeed, rustc needs zlib and fail to link if zlib is not
> installed on the host.
> 
>   error: could not compile `rustc_driver` (lib) due to previous error
> 
> If zlib is installed on the host, we can notice it with ldd tool (while
> it should be linked with the one provided by Buildroot host-zlib).
> 
>   ldd [...]TestRust/host/bin/rustc
>   libz.so.1 => /lib64/libz.so.1
> 
> Provide HOST_LDFLAGS using llvm.ldflags in config.toml.
> (HOST_LDFLAGS provide -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib)
> 
> With that fixed, rustc_driver link with libz from HOST_DIR but the
> host-rust build still fail later due to another issue.
> 
>   error: could not compile `rustdoc-tool` (bin "rustdoc_tool_binary") due to previous error
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6256881545
> http://autobuild.buildroot.org/results/a6b/a6b28783f29e6b729824bf42679a62f72ad5bee0
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2: no change
> ---
>  package/rust/rust.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index 16a397407f..4903060368 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -65,6 +65,7 @@ define HOST_RUST_CONFIGURE_CMDS
>  		echo 'cc = "$(TARGET_CROSS)gcc"'; \
>  		echo '[llvm]'; \
>  		echo 'ninja = false'; \
> +		echo 'ldflags = "$(HOST_LDFLAGS)"'; \
>  	) > $(@D)/config.toml
>  endef
>  
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
