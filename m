Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7DDC6FD1F
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 21:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E3FA6066D;
	Tue,  2 Apr 2024 21:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4pZruhSgxDG; Tue,  2 Apr 2024 21:27:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90441607A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90441607A8;
	Tue,  2 Apr 2024 21:27:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A42001BF295
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91543607A8
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQv5zjnnbZd4 for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 21:27:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5972F6066D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5972F6066D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5972F6066D
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 21:27:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 795A613F88D;
 Tue,  2 Apr 2024 23:27:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 02 Apr 2024 23:27:15 +0200
Date: Tue, 2 Apr 2024 23:27:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zgx4M66yi_1pUZGw@landeda>
References: <20240402045055.6236-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240402045055.6236-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712093238;
 bh=/jxumhjJDNrtSCgHl8xJIARRMR1tH/NjGOnGTsHT6i0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A70EXr8dx3t3pE2cGH9Xhi9d5h0OmZHNDR0/rVVY70wCwh5B9oWEfkViX8iXOzi82
 RpDxsy8FJGWKBdsfGp6ZqzX7iZA37RdUVskfMhybOJ6CwEFZObfLh+9UAQf650ZCig
 kG29LymFdF0tUWnNGtG12xOk7xEfWDKCSGo+uizaUkm7WdGSoFc885jne2+9EuBv4Y
 WSptaA6zA1G4tibabEbUFb0CS/BBSq7kUiFSwHImPhr15xFmiiLcbJWbgt+Du2N6KG
 tsJ16Ssw+FBRPUTjOvDoneqr967WSMSehlOQ1SEZWHDGKVnAkQbknSV4h8HG82cB/r
 0VP+AmG045mdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A70EXr8d
Subject: Re: [Buildroot] [PATCH 1/1] package/luaposix: fix build with glibc
 2.39
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
Cc: Assaf Inbal <shmuelzon@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-04-01 22:50 -0600, James Hilliard spake thusly:
> When glibc was bumped to version 2.39 in commit
> b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
> libcrypt support.
> 
> As glibc's libcrypt was providing luaposix's libcrypt dependency this
> broke any luaposix build using glibc version 2.39.
> 
> To fix this select the libxcrypt dependency to luaposix when using a
> glibc toolchain and add the dependency if selected.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/luaposix/Config.in   | 1 +
>  package/luaposix/luaposix.mk | 5 ++++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
> index 85943f9915..bd2105743d 100644
> --- a/package/luaposix/Config.in
> +++ b/package/luaposix/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_LUAPOSIX
>  	# "bit" module, but since it has a different name, luaposix
>  	# doesn't find it.
>  	select BR2_PACKAGE_LUA_BIT32 if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # runtime
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  This is a POSIX binding for LuaJIT, Lua 5.1 through 5.4;
>  	  like most libraries it simply binds to C APIs on the
> diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
> index d09a1bcd1d..680aeb8b81 100644
> --- a/package/luaposix/luaposix.mk
> +++ b/package/luaposix/luaposix.mk
> @@ -8,7 +8,10 @@ LUAPOSIX_VERSION = 36.2.1
>  LUAPOSIX_SITE = $(call github,luaposix,luaposix,v$(LUAPOSIX_VERSION))
>  LUAPOSIX_LICENSE = MIT
>  LUAPOSIX_LICENSE_FILES = LICENSE
> -LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
> +LUAPOSIX_DEPENDENCIES = \
> +	luainterpreter \
> +	host-lua \
> +	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
>  
>  define LUAPOSIX_BUILD_CMDS
>  	(cd $(@D); \
> -- 
> 2.34.1
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
