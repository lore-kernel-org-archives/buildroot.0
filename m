Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC73E7716A
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 17:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB2DC6064B;
	Sun, 15 Dec 2024 17:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOnKbHcbf8_2; Sun, 15 Dec 2024 17:34:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E59E16067A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E59E16067A;
	Sun, 15 Dec 2024 17:34:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EDEE1CE
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 17:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEE3460697
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 17:34:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Shnjvf5UMbXB for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 17:34:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 145FF6064B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 145FF6064B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 145FF6064B
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 17:34:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 0F502B00596;
 Sun, 15 Dec 2024 18:34:44 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50200])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Dec 2024 18:34:44 +0100
MIME-Version: 1.0
Date: Sun, 15 Dec 2024 18:34:44 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20241214204413.2666219-1-bernd@kuhls.net>
References: <20241214204413.2666219-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <a2e75518c4d1e5f56b7ce0f287f9d79a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734284086;
 bh=7c91TTa/OcGH0uxmTZgk3vhwzoD8Yk1RxvggH6STA1g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qHYS1xkRf08/N26eiWS5Bn2YYeBKPH1gEC6eQe7e5C32c1rYTgOhE//8ZDcqgsRPx
 7okWWKyiTciOvyxENp3BUC3D2CxuN+ALItzVuRqXi6z/PBbsQyuigsT7xiRO+8YGpW
 ehoYpZ0nz6ogB8pgebUTrNGYYGdceBndP+iL7H44iDv2Yb4LYviI0XSwLOjcD4WG7U
 ELdp7/3I7sJGF+fFKOCzbJSczGIN9qNwpHI7PgL1EOS2CoDmIR4TK8GTc9G7ohNlbk
 0P24qC3jta/23yC6zFWaoyPferItP7oMUl+oWSsoMpx690IXiQ9dmYRHD9OvGyOrLe
 G4qZ1aYHqpdTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qHYS1xkR
Subject: Re: [Buildroot] [PATCH 1/5] package/perl-html-tagset: bump version
 to 3.24
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/12/2024 21:44, Bernd Kuhls wrote:
> Updated license filename and hash due to markdown conversion and 
> updates
> to copyright years:
> https://github.com/libwww-perl/HTML-Tagset/commits/dev/README.md
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.

> ---
>  package/perl-html-tagset/perl-html-tagset.hash | 6 +++---
>  package/perl-html-tagset/perl-html-tagset.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/perl-html-tagset/perl-html-tagset.hash 
> b/package/perl-html-tagset/perl-html-tagset.hash
> index 648f75f649..2940ed6e59 100644
> --- a/package/perl-html-tagset/perl-html-tagset.hash
> +++ b/package/perl-html-tagset/perl-html-tagset.hash
> @@ -1,6 +1,6 @@
>  # retrieved by scancpan from http://cpan.metacpan.org/
> -md5  d2bfa18fe1904df7f683e96611e87437  HTML-Tagset-3.20.tar.gz
> -sha256  
> adb17dac9e36cd011f5243881c9739417fd102fce760f8de4e9be4c7131108e2  
> HTML-Tagset-3.20.tar.gz
> +md5  f8db8974f5e7fe7df2a58263a7b00552  HTML-Tagset-3.24.tar.gz
> +sha256  
> eb89e145a608ed1f8f141a57472ee5f69e67592a432dcd2e8b1dbb445f2b230b  
> HTML-Tagset-3.24.tar.gz
> 
>  # computed by scancpan
> -sha256  
> 275cc182d78ac2db6856442c5d334c925350fb56fe83ee3577f5850317423419  
> README
> +sha256  
> ffe7dd5ca8da47fbbd00d35f57b2f17fffcc2b2eb91417d1e3df68fa1841262c  
> README.md
> diff --git a/package/perl-html-tagset/perl-html-tagset.mk 
> b/package/perl-html-tagset/perl-html-tagset.mk
> index c6b5f69134..c1a9210087 100644
> --- a/package/perl-html-tagset/perl-html-tagset.mk
> +++ b/package/perl-html-tagset/perl-html-tagset.mk
> @@ -4,11 +4,11 @@
>  #
>  
> ################################################################################
> 
> -PERL_HTML_TAGSET_VERSION = 3.20
> +PERL_HTML_TAGSET_VERSION = 3.24
>  PERL_HTML_TAGSET_SOURCE = 
> HTML-Tagset-$(PERL_HTML_TAGSET_VERSION).tar.gz
>  PERL_HTML_TAGSET_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PETDANCE
>  PERL_HTML_TAGSET_LICENSE = Artistic or GPL-1.0+
> -PERL_HTML_TAGSET_LICENSE_FILES = README
> +PERL_HTML_TAGSET_LICENSE_FILES = README.md
>  PERL_HTML_TAGSET_DISTNAME = HTML-Tagset
> 
>  $(eval $(perl-package))
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
