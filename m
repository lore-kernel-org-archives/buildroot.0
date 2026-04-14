Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55ACF9D0EB
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD0AD427A3;
	Tue, 14 Apr 2026 17:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IuruO8Ob82lE; Tue, 14 Apr 2026 17:49:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB57042B1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776188979;
	bh=sdOe1EJO1x0tbJnvU248TyuwlL897tqqJNoiMLsV86s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Tg7Hz6izH/K+kIXInpAdDesDAMWe+cnyuUoELH7A4w6jEl/hyA6JtIWiPBeeJjsw3
	 sCMuxu6rWJUF7Wp2U0523UjZLftiarHRbo3YIsq6JN7QvGWJjs/zOk43H06RtyYLc4
	 ha6h9HttwBfg5FQFupsAREK6fFm3C3tNauDPYOEDnXNygQf3Dat5wp+OQcS1tG9I+L
	 IwXUT9AAR3Iv1VbkE0qop7Q0qOuXxwggztJEAit3fFlfFwa7T8zbTWE6+L+ny4yBFd
	 aNGlAZaoYX0npb9lEweTs6c02u7BphBhxyg0qbmfjDqNgNLhDaTAkGfmxxvMAuwru7
	 FcpO2+PoVU2vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB57042B1E;
	Tue, 14 Apr 2026 17:49:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6710B283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D45D42771
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rAh--g9b8qZL for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:49:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C51F4273C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C51F4273C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C51F4273C
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:49:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 283A113F8C2;
 Tue, 14 Apr 2026 19:49:27 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Apr 2026 19:49:27 +0200
MIME-Version: 1.0
Date: Tue, 14 Apr 2026 19:49:27 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, David GOUARIN <dgouarin@gmail.com>, Fabrice
 Fontaine <fontaine.fabrice@gmail.com>, Laurent Cans
 <laurent.cans@gmail.com>, Mario Lang <mlang@blind.guru>, Maxim Kochetkov
 <fido_max@inbox.ru>, Phil Eichinger <phil.eichinger@gmail.com>
In-Reply-To: <20260409084305.3960494-1-bernd@kuhls.net>
References: <20260409084305.3960494-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <74fbbf652fde1566ffea7e3b2b64c5ea@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776188974;
 bh=MCoDmLk3fTdbliZ6HeNMowdiqnvFMkdoUENx5qoWQeg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VU26DBO6Rr/1/b57vozv12iaN9w5Aw/nOzt0yeC4YW1QcgB7SwqecYqidIaIkgA2o
 Ze7W0bMayePPFcPJUj0Bloyc6/KLORyKlV6YIJSnHsl94s0iY2rwe6OC7Hyfw2bF2x
 7LhN8GY/MdpE2KTwWU/AKkZYO62JtDBI/TobJ1xBI+N0727RcsnNsOs8zLZFnTrrN8
 U+0fBa7CkDChDJCm8vvnhUORjgYodlzyEbDDqVLhxY1LyBft7XXGlLGPVOYqcLkRRo
 hJJANE5r4pvgIXO3GtwTmQX7Ler4PONx7ZWcQV3VKd7pZTw/tdDyYRO1WlY0mUKKIa
 bIWcuTQJ6ErZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VU26DBO6
Subject: Re: [Buildroot] [PATCH 01/20] package/shadowsocks-libev: bump
 version to 3.3.6
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09/04/2026 10:42, Bernd Kuhls wrote:
> https://github.com/shadowsocks/shadowsocks-libev/releases/tag/v3.3.6
> 
> Upstream tarball does not contain submodules so we need to download the
> git repo ourselves. Please note that these submodules cannot be 
> provided
> as system libraries:
> https://github.com/shadowsocks/shadowsocks-libev/commit/6423c8e496fe2e8d37e02b9a2d0472f7f4d6f5c0
> "These are vendored code built from git submodules, not system
>  libraries, [...]"
> 
> Removed all patches, they were either autoconf-related or are included
> in this release.
> 
> Added patch to fix build with toolchains without c++.
> 
> Switched build system to cmake due to upstream removal of autoconf and
> switched to pcre2 instead of pcre:
> https://github.com/shadowsocks/shadowsocks-libev/commit/7bb250739ef0067c62e4ffd533ec8cee2775995a
> 
> The cmake build system always builds dynamic libraries:
> https://github.com/shadowsocks/shadowsocks-libev/blob/v3.3.6/src/CMakeLists.txt#L252
> so we added a dependency to !BR2_STATIC_LIBS and -DWITH_STATIC=OFF as
> configure option.
> 
> Please note that this bump will not fix the build errors introduced by
> the bump of glibc to version 2.43:
> https://github.com/shadowsocks/shadowsocks-libev/issues/3032
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
