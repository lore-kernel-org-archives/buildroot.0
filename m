Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08AFC5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 22:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B7A1409E6;
	Sat,  2 Mar 2024 22:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K4E1aZ7mLjLy; Sat,  2 Mar 2024 22:07:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89D18409F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89D18409F5;
	Sat,  2 Mar 2024 22:07:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C9B51BF57C
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 22:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A3F8606C6
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 22:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id feCAhUVVNzQn for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 22:07:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D486A6064E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D486A6064E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D486A6064E
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 22:07:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 116AB13F88D;
 Sat,  2 Mar 2024 23:07:11 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 02 Mar 2024 23:07:10 +0100
Date: Sat, 2 Mar 2024 23:07:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZeOjDlcTpkAMw6VG@landeda>
References: <20240229224122.1085300-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240229224122.1085300-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709417233;
 bh=hI5RPG8ieCqmjWEyLAg7fOmwl/QzYdGgPfTMTzMWsPo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vbb+scCW0t9rxniNHhZHeKLFkcNACtn1U8QespkTRGH5VC0xefNb6SSGGdccWlTcx
 /kq4hl2UA84/l78UIlg9Qt8y7CQQbvhdg4dx0u2omTYiO3AaBUW56nDKZLZAOoDDlx
 BLPkjBtxwu1ycPB6sRnb/MYcCDdXeoYmFPd+HLCKVf2kb+dYcAxCjkCwjCSgjOTOdX
 do/PipaGPG5yZo4L2OZkpduiQV8myR9dq8eGv7vhcUFf3vDXzxWK1Sv8jBrg2I1p7B
 YdlW0XG/dUtNqjrXlIJBR8rR/wSpmRJjFj/qPbF3U/ZoqsZSV1AlMDG+wD/G7xattj
 DDrQDb4M06+4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Vbb+scCW
Subject: Re: [Buildroot] [PATCH v2 1/3] package/rust/rust.mk: add missing
 host-zlib dependency
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
> Several rust tool are linking against zlib, so add
> the depedency explicitely in HOST_RUST_DEPENDENCIES.
> 
> For now, host-rust build system is not able to find
> provided by Buildroot in HOST_DIR due to at least two
> issues that will be fixed in followup commits.

I've slightly reflowed the commit log, and added a note about the
transitive depndency.

> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2: new commit
> ---
>  package/rust/rust.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index f7a5c0fcd5..16a397407f 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -20,6 +20,7 @@ HOST_RUST_DEPENDENCIES = \
>  	host-python3 \
>  	host-rust-bin \
>  	host-openssl \
> +	host-zlib \
>  	$(BR2_CMAKE_HOST_DEPENDENCY)
>  
>  HOST_RUST_VERBOSITY = $(if $(VERBOSE),2,0)
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
