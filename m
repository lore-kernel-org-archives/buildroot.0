Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B64D7360F
	for <buildroot@archiver.kernel.org>; Sat, 30 Nov 2024 22:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C31736148A;
	Sat, 30 Nov 2024 22:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DU9xsbjtUZMG; Sat, 30 Nov 2024 22:33:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD3E2614B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD3E2614B1;
	Sat, 30 Nov 2024 22:33:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D5D860
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 22:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78A8A84783
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 22:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_ecZ_2HmjvQ for <buildroot@buildroot.org>;
 Sat, 30 Nov 2024 22:33:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F707846E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F707846E5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F707846E5
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 22:33:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 27212B00572;
 Sat, 30 Nov 2024 23:33:24 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:45152])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 30 Nov 2024 23:33:24 +0100
MIME-Version: 1.0
Date: Sat, 30 Nov 2024 23:33:24 +0100
From: Julien Olivain <ju.o@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241129140037.897174-1-aperez@igalia.com>
References: <20241129140037.897174-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <2c814382205624bc540af0d903713c4a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733006006;
 bh=JlO4/Y8XTHWRka4tl7113U6DqM32pv6R2ZQQrEsIK/8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=POj5kcG/BSSqwP0Oz8MhiXdmrdUaK1pG86KcMohewheZG55KSwx1ZAfwBhntul3cO
 J9W3JTkYIMYhZVT9A6QR/tjnwT/athiFZpP9Dbk5jinacXJxfhI8APVkP3Dz7JoQ03
 C33BcqM9Ys+aUdtc68bK0KiBpfBYGLSvYa7IbLLoU6Jodjg7pkO1iHre8egNNkN4R6
 uQImfYvvEldu0aNtxx0XZ2HG8pLlUzGpa0TdSvq2KfhcgIGICsdQ2h4eKdgjZKfW5l
 1/bAfo78Z6O4nejyYwFbj4hMkuHSOCNbxtRSoo/tJh6P6wsZ85w4N32gR7JLD7q4Cq
 Tq0bny/hwN8KA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=POj5kcG/
Subject: Re: [Buildroot] [PATCH 1/1] package/libdex: bump to version 0.8.1
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

On 29/11/2024 15:00, Adrian Perez de Castro wrote:
> This release has a fix to properly disable assertions in release
> builds.
> 
> https://gitlab.gnome.org/GNOME/libdex/-/blob/0.8.1/NEWS
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to next, thanks.

> ---
>  package/libdex/libdex.hash | 4 ++--
>  package/libdex/libdex.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libdex/libdex.hash b/package/libdex/libdex.hash
> index 7e08676fe4..d6fba67f32 100644
> --- a/package/libdex/libdex.hash
> +++ b/package/libdex/libdex.hash
> @@ -1,5 +1,5 @@
> -# From 
> https://download.gnome.org/sources/libdex/0.8/libdex-0.8.0.sha256sum
> -sha256  
> 659ab5d0eb7f10bd36af0cde08055158987690b9714e7f5b001c788ec1d01a25  
> libdex-0.8.0.tar.xz
> +# From 
> https://download.gnome.org/sources/libdex/0.8/libdex-0.8.1.sha256sum
> +sha256  
> 955475ad3e43aabd6f6f70435264b5ee77bd265bd95545211fee026b08d378a0  
> libdex-0.8.1.tar.xz
> 
>  # License files
>  sha256  
> dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  
> COPYING
> diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
> index 0d27b35675..381c605b16 100644
> --- a/package/libdex/libdex.mk
> +++ b/package/libdex/libdex.mk
> @@ -6,7 +6,7 @@
> 
>  # The middle number is even for stable releases, odd for development 
> ones.
>  LIBDEX_VERSION_MAJOR = 0.8
> -LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).0
> +LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).1
>  LIBDEX_SOURCE = libdex-$(LIBDEX_VERSION).tar.xz
>  LIBDEX_SITE = 
> https://download.gnome.org/sources/libdex/$(LIBDEX_VERSION_MAJOR)
>  LIBDEX_LICENSE = LGPL-2.1+
> --
> 2.47.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
