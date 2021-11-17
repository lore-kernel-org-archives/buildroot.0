Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA90C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:03:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EE0961B50
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4EE0961B50
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7C2F80BA6;
	Wed, 17 Nov 2021 21:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k40mTIwAYJQ1; Wed, 17 Nov 2021 21:03:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CD6F80CDD;
	Wed, 17 Nov 2021 21:03:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB9391BF842
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B757A40192
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s7Qfl7-0UQiv for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:03:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5266E400D0
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:03:01 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id e3so16965837edu.4
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 13:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=a1xo/YRlfszd2+oHaW8to8q05BYah/JuPpdqi+J/LCs=;
 b=FZWQJBedNcs18lbDOG4ssULxT2ZRS6Kmxc0BpO4CId5QYoICGB6IOwITFMRRwk1QuX
 /UetaHDKIPXEo8kc3hzv3YWVFG/jLhs74mstvkIp2F0jmXufJP9Zw5ML3YVEKeYLvtQB
 4R9066MIugXiUbzewHh+ssXkHpzWMHV3OGhFJfCwsuiPMYIRAzFxg0QqOMVGK/TsJXjr
 UGiWnUrayk4a3PmdpJpQ5LQ6f0uPalaWTgd4eNrKiM0OdPY8/y6VP+JJIgZCw+PBf1mn
 mXWOqvHkVZnU3evgtuTxHn9PcdAZY1YliLjIlDVvUB+D37aM6sw4OP8BT6jbD3FkEddn
 PXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=a1xo/YRlfszd2+oHaW8to8q05BYah/JuPpdqi+J/LCs=;
 b=5vvcAf702jpzIhwLVFJalc4qZmA0CwvFjOoaZrotJJ1ZoCrV2wrY4kDvutjGxGRRWV
 5IcPMyeq5K4ZGyCBM8sNZa1m2D9atSbYPPumQGmiAhwBKLWERTF/EO5M0Mcf1JSigBL1
 BuMvDJvWrY/Id3aKnL71UZ+3ggFbheW18nLXRg/MNKEf+t5HvBfbcZDnEAQ9aqZmUUBu
 4rOiM4d+6ewfrnqT0PMFEg9BMFt17ggBHhiLYojxti0ye+juFbouwYHq16MiFfafwg50
 OFjNshxfTrnvWZQcb/GyfgWd7zgAA/N0Y7Myog94bA+jVVNq+HKC1h5DunVNJqForzZJ
 BZ9g==
X-Gm-Message-State: AOAM530xWvuhd01arkkX9hrDowhb9U7lQftG/2lrRgcD8trxU6CUNemr
 oOERpVQhs9TkVElt9dQH78BBJQb00up8UQ==
X-Google-Smtp-Source: ABdhPJxZX+XuaGN+FF+V4B10Nn7m1LwwqfDEaPVGN46UUikAuymqsUIufTHrX9ft4Y9UefBMQff4pg==
X-Received: by 2002:a17:907:2cc4:: with SMTP id
 hg4mr25938959ejc.112.1637182979483; 
 Wed, 17 Nov 2021 13:02:59 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bo20sm522263edb.31.2021.11.17.13.02.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 13:02:59 -0800 (PST)
Message-ID: <5e2f1dea-f262-1e41-10c3-db140fc764d6@mind.be>
Date: Wed, 17 Nov 2021 22:02:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20211025224403.979315-1-aperez@igalia.com>
 <20211025224403.979315-4-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211025224403.979315-4-aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH 3/4] package/wpewebkit: bump to version
 2.34.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/10/2021 00:44, Adrian Perez de Castro wrote:
> Update to a new major release which brings in improvements and a number
> of new features. Release notes:
> 
>    https://wpewebkit.org/release/wpewebkit-2.34.0.html
>    https://wpewebkit.org/release/wpewebkit-2.34.1.html
> 
> Some of the new features require additional dependencies: HTTP/2
> requires libsoup3, which is not yet in packaged in Buildroot, and
> disabled at the moment (with -DUSE_SOUP2=ON, to keep using libsoup2);
> and the color management support needs LCMS2 (which will be enabled
> in a follow-up patch.)
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>   ...e-build-issues-with-ENABLE_VIDEO-OFF.patch | 78 +++++++++++++++++++
>   package/wpewebkit/wpewebkit.hash              |  8 +-
>   package/wpewebkit/wpewebkit.mk                |  4 +-
>   3 files changed, 85 insertions(+), 5 deletions(-)
>   create mode 100644 package/wpewebkit/0001-WPE-GTK-Multiple-build-issues-with-ENABLE_VIDEO-OFF.patch
> 
> diff --git a/package/wpewebkit/0001-WPE-GTK-Multiple-build-issues-with-ENABLE_VIDEO-OFF.patch b/package/wpewebkit/0001-WPE-GTK-Multiple-build-issues-with-ENABLE_VIDEO-OFF.patch
> new file mode 100644
> index 0000000000..51212dd82d
> --- /dev/null
> +++ b/package/wpewebkit/0001-WPE-GTK-Multiple-build-issues-with-ENABLE_VIDEO-OFF.patch
> @@ -0,0 +1,78 @@
> +From afc83d41293333f694630451f865a7a257a9b917 Mon Sep 17 00:00:00 2001
> +From: Adrian Perez de Castro <aperez@igalia.com>
> +Date: Mon, 25 Oct 2021 23:45:15 +0300
> +Subject: [PATCH] [WPE][GTK] Multiple build issues with ENABLE_VIDEO=OFF
> + https://bugs.webkit.org/show_bug.cgi?id=232264
> +
> +.:
> +
> +Reviewed by NOBODY (OOPS!).
> +
> +* Source/cmake/WebKitFeatures.cmake: Make ENABLE_MEDIA_SESSION depend on ENABLE_VIDEO.
> +
> +Source/WebCore:
> +
> +Reviewed by NOBODY (OOPS!).
> +
> +No new tests needed.
> +
> +* accessibility/AXObjectCache.cpp:
> +(WebCore::isSimpleImage): Guard usage of HTMLMediaElement with ENABLE(VIDEO).
> +* page/EventHandler.cpp:
> +(WebCore::EventHandler::textRecognitionCandidateElement const): Ditto.
> +* platform/graphics/BifurcatedGraphicsContext.cpp: Ditto.
> +* platform/graphics/displaylists/DisplayListRecorder.h: Guard usage of MediaPlayer with
> +ENABLE(VIDEO).
> +* platform/graphics/displaylists/DisplayListRecorderImpl.cpp: Ditto.
> +* platform/graphics/displaylists/DisplayListRecorderImpl.h: Ditto.
> +
> +Source/WebKit:
> +
> +* WebProcess/WebCoreSupport/ShareableBitmapUtilities.cpp:
> +(WebKit::createShareableBitmap): Guard usage of RenderVideo with ENABLE(VIDEO).
> +
> +Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> +---
> +Upstream status: https://bugs.webkit.org/show_bug.cgi?id=232264

  Since this has landed now, I've changed it into the trac link.

  Regards,
  Arnout

> +
> + Source/WebCore/accessibility/AXObjectCache.cpp                 | 2 ++
> + Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp | 2 ++
> + 2 files changed, 4 insertions(+)
> +
> +diff --git a/Source/WebCore/accessibility/AXObjectCache.cpp b/Source/WebCore/accessibility/AXObjectCache.cpp
> +index f2451102040..930b969dcc2 100644
> +--- a/Source/WebCore/accessibility/AXObjectCache.cpp
> ++++ b/Source/WebCore/accessibility/AXObjectCache.cpp
> +@@ -528,9 +528,11 @@ static bool isSimpleImage(const RenderObject& renderer)
> +         || (is<HTMLImageElement>(node) && downcast<HTMLImageElement>(node)->hasAttributeWithoutSynchronization(usemapAttr)))
> +         return false;
> +
> ++#if ENABLE(VIDEO)
> +     // Exclude video and audio elements.
> +     if (is<HTMLMediaElement>(node))
> +         return false;
> ++#endif // ENABLE(VIDEO)
> +
> +     return true;
> + }
> +diff --git a/Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp b/Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp
> +index c0ce72c5ffc..d7ead303f3c 100644
> +--- a/Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp
> ++++ b/Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp
> +@@ -269,11 +269,13 @@ void BifurcatedGraphicsContext::drawPattern(NativeImage& nativeImage, const Floa
> +     m_secondaryContext.drawPattern(nativeImage, imageSize, destRect, tileRect, patternTransform, phase, spacing, options);
> + }
> +
> ++#if ENABLE(VIDEO)
> + void BifurcatedGraphicsContext::paintFrameForMedia(MediaPlayer& player, const FloatRect& destination)
> + {
> +     m_primaryContext.paintFrameForMedia(player, destination);
> +     m_secondaryContext.paintFrameForMedia(player, destination);
> + }
> ++#endif // ENABLE(VIDEO)
> +
> + void BifurcatedGraphicsContext::scale(const FloatSize& scale)
> + {
> +--
> +2.33.1
> +
> diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
> index ff8bd1f30a..acb3ec4a3e 100644
> --- a/package/wpewebkit/wpewebkit.hash
> +++ b/package/wpewebkit/wpewebkit.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/wpewebkit-2.32.4.tar.xz.sums
> -md5  94ca1cc3f7b2de8b96c59d6e59cafcd0  wpewebkit-2.32.4.tar.xz
> -sha1  19b8ebdbfef193ca50f7625703d871db87624f86  wpewebkit-2.32.4.tar.xz
> -sha256  381f1422cbc319db1aa42dda48de39590ed90ac3bec6b81ec83f3f2cae5c3eeb  wpewebkit-2.32.4.tar.xz
> +# From https://wpewebkit.org/releases/wpewebkit-2.34.1.tar.xz.sums
> +md5  915e583b0e7e82efa155cbce917d6319  wpewebkit-2.34.1.tar.xz
> +sha1  452081b6df9d079f26d22bd0dca9e90f87943089  wpewebkit-2.34.1.tar.xz
> +sha256  cb336986341be9c3a9b1ca2c18de0d29d90ae4e77b9967a6f6879597e7a969f7  wpewebkit-2.34.1.tar.xz
>   
>   # Hashes for license files:
>   sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index 0242f7a288..606a1531c0 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WPEWEBKIT_VERSION = 2.32.4
> +WPEWEBKIT_VERSION = 2.34.1
>   WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
>   WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
>   WPEWEBKIT_INSTALL_STAGING = YES
> @@ -23,6 +23,8 @@ WPEWEBKIT_CONF_OPTS = \
>   	-DENABLE_ACCESSIBILITY=OFF \
>   	-DENABLE_API_TESTS=OFF \
>   	-DENABLE_MINIBROWSER=OFF \
> +	-DUSE_LCMS=OFF \
> +	-DUSE_SOUP2=ON \
>   	-DSILENCE_CROSS_COMPILATION_NOTICES=ON
>   
>   ifeq ($(BR2_PACKAGE_WPEWEBKIT_SANDBOX),y)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
