Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF28E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 19:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46AA060A77;
	Sat, 14 Dec 2024 19:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fPKoluiK34Ue; Sat, 14 Dec 2024 19:32:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5536960A7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5536960A7D;
	Sat, 14 Dec 2024 19:32:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7971ACE
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 19:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5991A60A77
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 19:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ccm6VtUl0d4P for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 19:32:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5994960A7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5994960A7D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5994960A7D
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 19:32:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A79D2780371;
 Sat, 14 Dec 2024 20:32:07 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58868])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Dec 2024 20:32:07 +0100
MIME-Version: 1.0
Date: Sat, 14 Dec 2024 20:32:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20241214130314.343885-1-bernd@kuhls.net>
References: <20241214130314.343885-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <4457186d2ee88770af5011d5b4b4adb4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734204728;
 bh=BOenpJrkSc7NgXhXXi9uW/Jd281M1WTBy62XnNXq74U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qOt7cxgehn6GRTNN6gVn4FhyXf4mbfAKyKqWuk53z+7sHD6oKOAqgkmxmwcvSVNhP
 tAMGZXzk+Eo2z/UC3mbed3csZSj+KKXnCQJ4df2W8/774kiuc5jj/cXeUAYkf1E3Gm
 ye23SFkNbfyQFgjoj70msEz+D+rUESEhmgtg2AREH2AByWJ6dj3iEjGa/PQ6jTTw1T
 5GzxTuGVIS+ZAHVWljyRYQM818nOgKf1tOkKPBpNZbQxK7YEAIHmoiSv4DXkTMw/If
 vECu5EOvOauzueSahJtGC11QKXpuBeIVzeB8IBPc5i4hKQMIhmk+bhTICFBbn9enuT
 dHoSfGG0Kgwwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qOt7cxge
Subject: Re: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.124
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

On 14/12/2024 14:03, Bernd Kuhls wrote:
> Release notes:
> https://lists.x.org/archives/xorg-announce/2024-December/003562.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

> ---
>  package/libdrm/libdrm.hash | 6 +++---
>  package/libdrm/libdrm.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
> index aec9f58749..3ef978775d 100644
> --- a/package/libdrm/libdrm.hash
> +++ b/package/libdrm/libdrm.hash
> @@ -1,6 +1,6 @@
> -# From 
> https://lists.x.org/archives/xorg-announce/2024-August/003528.html
> -sha256  
> a2b98567a149a74b0f50e91e825f9c0315d86e7be9b74394dae8b298caadb79e  
> libdrm-2.4.123.tar.xz
> -sha512  
> d3e6ba26bbd609fd87ca131690547eeb6a903c0a8c28b7f5cd5d0947619da09f31daf7bf4b6c38bf5e5dc173e2ccba476338ef682d8cf06d6b71ba73fc9b948d 
>  libdrm-2.4.123.tar.xz
> +# From 
> https://lists.x.org/archives/xorg-announce/2024-December/003562.html
> +sha256  
> ac36293f61ca4aafaf4b16a2a7afff312aa4f5c37c9fbd797de9e3c0863ca379  
> libdrm-2.4.124.tar.xz
> +sha512  
> 0408c3ae5780c57d19321a9a7b046d656e252b2f48e520b2beb18f83495bea39c445deb9a9a6795b46194051c2ea4da476e08c63972daf841064099df6dff365 
>  libdrm-2.4.124.tar.xz
> 
>  # Hash for license file
>  sha256  
> d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  
> data/meson.build
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index 021a575474..a8a912859e 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBDRM_VERSION = 2.4.123
> +LIBDRM_VERSION = 2.4.124
>  LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
>  LIBDRM_SITE = https://dri.freedesktop.org/libdrm
>  LIBDRM_LICENSE = MIT
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
