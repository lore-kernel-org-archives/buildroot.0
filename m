Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11433C87FCA
	for <buildroot@archiver.kernel.org>; Sat, 26 Jul 2025 12:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB5EF60A8F;
	Sat, 26 Jul 2025 12:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9k0QShbaB4d; Sat, 26 Jul 2025 12:09:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F300A6068D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F300A6068D;
	Sat, 26 Jul 2025 12:09:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D77B8198
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 12:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDA0560656
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 12:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otiBXgtS7tim for <buildroot@buildroot.org>;
 Sat, 26 Jul 2025 12:09:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F14D660657
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F14D660657
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F14D660657
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 12:09:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id BBB58780395;
 Sat, 26 Jul 2025 14:09:14 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 26 Jul 2025 14:09:14 +0200
MIME-Version: 1.0
Date: Sat, 26 Jul 2025 14:09:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250726071547.3545928-1-bernd@kuhls.net>
References: <20250726071547.3545928-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <cae84bc1e5b4b43378d0c9720b0ca1d7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753531755;
 bh=7GjcFhCi0DD1mEF/9ZFRwfu3wkWibkHH4WdeBtF+X18=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sxX0QXtM+m+9Mkn61eoINohArgM5ZT4c5gRuD45jFo+AoPBBWG2XPt8U9U38KURch
 A0DHguMfxZYvaij7dpQ46w/2L2YxFNVfv7j+7qKugjQAOFcBhePsgoEspN+S+gnAnb
 aOMqneusGO5aZ8IlazKQRQFhnceT0HzlsC9ODtCZEqmhYoOv8aEkPNtuaFpk7q5Lhu
 iV9vcmGx+3W1WuuezZAveZByR63rTT8Bexi91PakDO+b02XpzvFFMGwnMYOSzIpsPI
 P5x3rmqBuWhzMeT2zPaifEcbXs0n5fcd8ViyWbkuuc7sGtPsVlt4zzxxsP+V2nq0p4
 9S2MK+L3WXpKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sxX0QXtM
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-vaapi: bump
 version to 1.24.13
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

Hi Bernd,

On 26/07/2025 09:15, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 4 ++--
>  package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash 
> b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
> index d53a962150..b01ff938af 100644
> --- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
> +++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
> @@ -1,3 +1,3 @@
> -# From 
> https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.24.11.tar.xz.sha256sum
> -sha256  
> e85904a47d9ecb41d7f76b1d3fe887fa18c0b81a3793e7d7f61361ea7e90420d  
> gstreamer-vaapi-1.24.11.tar.xz
> +# From 
> https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.24.13.tar.xz.sha256sum
> +sha256  
> b92c008841387043aec83b08b1fa8cf41e7866a106311a7d99e274e7d24ddc47  
> gstreamer-vaapi-1.24.13.tar.xz
>  sha256  
> dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  
> COPYING.LIB
> diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk 
> b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
> index 1bd3dbf12e..418369c38e 100644
> --- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
> +++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -GST1_VAAPI_VERSION = 1.24.11
> +GST1_VAAPI_VERSION = 1.24.13

What is the motivation to update to that version?

Looking at changelogs:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/0a7d7071207d40cc003f6cd9f2f123f759fdfce1
I don't see any changes between 1.24.11 and 1.24.13 for gst1-vaapi.

Also, gstreamer packages are usually updated all at once, to the
same version.

If there is no specific reason, I'll keep this package to 1.24.11 and 
wait
for the next gstreamer grouped updated.

>  GST1_VAAPI_SITE = 
> https://gstreamer.freedesktop.org/src/gstreamer-vaapi
>  GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
>  GST1_VAAPI_LICENSE = LGPL-2.1+
> --
> 2.39.5

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
