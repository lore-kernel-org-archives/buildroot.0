Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB141C48297
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 07:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 659F661450;
	Fri,  9 Feb 2024 07:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t6HDJQPpAdSn; Fri,  9 Feb 2024 07:53:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70ABD61515
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70ABD61515;
	Fri,  9 Feb 2024 07:53:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8758B1BF32E
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 07:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76C6C41C53
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 07:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1GIzwybOXbwm for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 07:53:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3028541C3F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3028541C3F
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3028541C3F
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 07:53:31 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a36126ee41eso80856466b.2
 for <buildroot@buildroot.org>; Thu, 08 Feb 2024 23:53:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707465209; x=1708070009;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jftEVUnl4GKSCQxtPqCwZlVe+Csw24H8vOzBGMUZTyU=;
 b=sV6hrmiFJl572Mcr50TyHbQ4cv9Moo2i/W8b6VQFLjYdu8HpGfYFXG7lqZrwV1MV8s
 ZUEpqDVOBa4vRyjEFGmEHqsZDQ+kxjCXmqZdF94rSDrvCGhBJrzZtP/gz+laIARKwN7x
 2RpTcau1i8JScNRhsheq08SQDWfaB1Lf3Svdcci/ZVA3qkqSnNP/v5lenb2TJ2ZvHmG2
 RfKZ0tbtmyoEBEPO64EJCzSAX3CKzMV6xF+HP1cOAh4sUr1LJR3wo+VMAksVF3OZUX9e
 hV/N+/AHVNRnLRDGFxQ47zRZMoCxxD7A3zeStkL4+fQ0cjo6BKjTOnRcvxBa4RLN6oJo
 KHxQ==
X-Gm-Message-State: AOJu0YwAz8sk2YASD9UWpSGciYdr095vJRZ41vEYBRfRPSbUPBzXBjoe
 Q6Yt+aV6cRxGzGaNJFv7Pu3UVBhDGvOUT+KrZTe71lDYigFOg9MDQ/Hz50Wmqzw=
X-Google-Smtp-Source: AGHT+IE7mUHe2PVNRBQnqO4uUbXZpPWAhBg7WQX8F+SK8BF6bjTbkytRMTx7nWJdUvmFR1YIonNR4g==
X-Received: by 2002:a17:906:acd:b0:a3b:f0fe:3175 with SMTP id
 z13-20020a1709060acd00b00a3bf0fe3175mr475732ejf.45.1707465208916; 
 Thu, 08 Feb 2024 23:53:28 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX+rOkrHOpx29TahO36dprxhDs5BBDe5YQCINmzdZMHUOnzRTTkaqhBHcvjU/UH5Dl5ZHMfNjCg8cBtVZp2FuTztkip5r4deyvt9oUSwr/LmB6OwwUMMKMmMB1rFBhgYXmBP1ZHaRxpPT5p2N3oxKQ7ereNZ1E9z4UFz4GOyftFrdkfnhrYmN5a89NJ2ae22ulPR/na4763tJ6Bv+AzkQHU0Jf7wheeA4yX8XVt8j7OQq0w
Received: from [10.1.0.191] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 x8-20020a1709065ac800b00a35a9745910sm492973ejs.137.2024.02.08.23.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 23:53:28 -0800 (PST)
Message-ID: <67c8c262-ac4b-46a5-93fa-b3bb18a1d9cb@mind.be>
Date: Fri, 9 Feb 2024 08:53:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
References: <20231012132616.2180337-1-sebastian.weyer@smile.fr>
In-Reply-To: <20231012132616.2180337-1-sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707465209; x=1708070009; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jftEVUnl4GKSCQxtPqCwZlVe+Csw24H8vOzBGMUZTyU=;
 b=ZPSfkcBfy4H5kJ7vd6LBLZqhAe+fTThXcrW6t8JQUcDB0II8M07zjC6C0fY5ZnyjzE
 /tGoUlxYPKXpYFOT6B4ny2PlFsj6O93vWdxF7BAHJcxduBwnGLeON/+1qGd2OWKLm3pr
 NyRQ/w7Oby42s6EvKxJ792eBni9al0XTtvIv8YxAmMRTHkoMxH5cO644F6Q91AJGFBXH
 v4kQsBX5sO8kTwYn7sJU3dfVLfnEWCHIpewOoWWyCfuCGSGpei7wof9Jbp/kGwyoEIRZ
 qds1VerT++m5zv0vt1HTyh2A7pIfK5YjqoeOl7WBQ/LkyRZ4na2Xwd8kiHBeN8nWzF2T
 aFGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZPSfkcBf
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5: bump packages to latest
 kde submodule versions
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Seiderer <ps.report@gmx.net>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/10/2023 15:26, Sebastian Weyer wrote:
> Bump qt5 packages to latest submodule versions from:
> https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15
> 
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> ---
> The package qt53d was not updated with the rest as it fails with
> 
> qgltf.cpp:29:10: fatal error: assimp/Importer.hpp: No such file or directory
>     29 | #include <assimp/Importer.hpp>
> 
> although assimp is installed and the header file is present in
> host/aarch64-buildroot-linux-gnu/sysroot/usr/include/assimp/Importer.hpp
> 
> This package was also not updated in the last version bump to 5.15.10 in
> 6b23dff9e71786191797d3b41ce80afe659f0396. Starting from 5.15.9 it fails
> with this error. I couldn't find out why this package wasn't updated to
> 5.15.10 to begin with but it seems like it could be this error? So I thought
> it might be okay to leave it at 5.15.8 for now. What do you think?
> 
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/qt5/qt5.mk                                       | 2 +-
>   package/qt5/qt5base/qt5base.hash                         | 2 +-
>   package/qt5/qt5base/qt5base.mk                           | 2 +-
>   package/qt5/qt5charts/qt5charts.hash                     | 2 +-
>   package/qt5/qt5charts/qt5charts.mk                       | 2 +-
>   package/qt5/qt5connectivity/qt5connectivity.hash         | 2 +-
>   package/qt5/qt5connectivity/qt5connectivity.mk           | 2 +-
>   package/qt5/qt5declarative/qt5declarative.hash           | 2 +-
>   package/qt5/qt5declarative/qt5declarative.mk             | 2 +-
>   package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash | 2 +-
>   package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk   | 2 +-
>   package/qt5/qt5imageformats/qt5imageformats.hash         | 2 +-
>   package/qt5/qt5imageformats/qt5imageformats.mk           | 2 +-
>   package/qt5/qt5location/qt5location.hash                 | 2 +-
>   package/qt5/qt5location/qt5location.mk                   | 2 +-
>   package/qt5/qt5lottie/qt5lottie.hash                     | 2 +-
>   package/qt5/qt5lottie/qt5lottie.mk                       | 2 +-
>   package/qt5/qt5multimedia/qt5multimedia.hash             | 2 +-
>   package/qt5/qt5multimedia/qt5multimedia.mk               | 2 +-
>   package/qt5/qt5quickcontrols/qt5quickcontrols.hash       | 2 +-
>   package/qt5/qt5quickcontrols/qt5quickcontrols.mk         | 2 +-
>   package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash     | 2 +-
>   package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk       | 2 +-
>   package/qt5/qt5quicktimeline/qt5quicktimeline.hash       | 2 +-
>   package/qt5/qt5quicktimeline/qt5quicktimeline.mk         | 2 +-
>   package/qt5/qt5remoteobjects/qt5remoteobjects.hash       | 2 +-
>   package/qt5/qt5remoteobjects/qt5remoteobjects.mk         | 2 +-
>   package/qt5/qt5scxml/qt5scxml.hash                       | 2 +-
>   package/qt5/qt5scxml/qt5scxml.mk                         | 2 +-
>   package/qt5/qt5sensors/qt5sensors.hash                   | 2 +-
>   package/qt5/qt5sensors/qt5sensors.mk                     | 2 +-
>   package/qt5/qt5serialbus/qt5serialbus.hash               | 2 +-
>   package/qt5/qt5serialbus/qt5serialbus.mk                 | 2 +-
>   package/qt5/qt5serialport/qt5serialport.hash             | 2 +-
>   package/qt5/qt5serialport/qt5serialport.mk               | 2 +-
>   package/qt5/qt5speech/qt5speech.hash                     | 2 +-
>   package/qt5/qt5speech/qt5speech.mk                       | 2 +-
>   package/qt5/qt5svg/qt5svg.hash                           | 2 +-
>   package/qt5/qt5svg/qt5svg.mk                             | 2 +-
>   package/qt5/qt5tools/qt5tools.hash                       | 2 +-
>   package/qt5/qt5tools/qt5tools.mk                         | 2 +-
>   package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash   | 2 +-
>   package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk     | 2 +-
>   package/qt5/qt5wayland/qt5wayland.hash                   | 2 +-
>   package/qt5/qt5wayland/qt5wayland.mk                     | 2 +-
>   package/qt5/qt5webchannel/qt5webchannel.hash             | 2 +-
>   package/qt5/qt5webchannel/qt5webchannel.mk               | 2 +-
>   package/qt5/qt5webengine/qt5webengine.hash               | 2 +-
>   package/qt5/qt5websockets/qt5websockets.hash             | 2 +-
>   package/qt5/qt5websockets/qt5websockets.mk               | 2 +-
>   package/qt5/qt5webview/qt5webview.hash                   | 2 +-
>   package/qt5/qt5webview/qt5webview.mk                     | 2 +-
>   package/qt5/qt5x11extras/qt5x11extras.hash               | 2 +-
>   package/qt5/qt5x11extras/qt5x11extras.mk                 | 2 +-
>   package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash           | 2 +-
>   package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk             | 2 +-
>   56 files changed, 56 insertions(+), 56 deletions(-)
> 
> diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
> index b55accacf1..a43b36dd51 100644
> --- a/package/qt5/qt5.mk
> +++ b/package/qt5/qt5.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   QT5_VERSION_MAJOR = 5.15
> -QT5_VERSION = $(QT5_VERSION_MAJOR).10
> +QT5_VERSION = $(QT5_VERSION_MAJOR).11
>   QT5_SITE = https://invent.kde.org/qt/qt
>   
>   include $(sort $(wildcard package/qt5/*/*.mk))
> diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
> index 4efc8fa172..ffc474f49e 100644
> --- a/package/qt5/qt5base/qt5base.hash
> +++ b/package/qt5/qt5base/qt5base.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  5622a9053154af9a353b8e8be217104c6af068b5b5aba8b07ef4fea2dc79fded  qtbase-e44097b63d17ba3178a637df7fac51ddc51cb48b.tar.bz2
> +sha256  935d01f5c34903ad9e979431cec7a8a59332ed3fc539e639f5ba87e8d6989b9d  qtbase-da6e958319e95fe564d3b30c931492dd666bfaff.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index cc29f5523f..7ee6124d4b 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5BASE_VERSION = e44097b63d17ba3178a637df7fac51ddc51cb48b
> +QT5BASE_VERSION = da6e958319e95fe564d3b30c931492dd666bfaff
>   QT5BASE_SITE = $(QT5_SITE)/qtbase/-/archive/$(QT5BASE_VERSION)
>   QT5BASE_SOURCE = qtbase-$(QT5BASE_VERSION).tar.bz2
>   
> diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
> index 0688f64615..fec54c86b1 100644
> --- a/package/qt5/qt5charts/qt5charts.hash
> +++ b/package/qt5/qt5charts/qt5charts.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  9d2ad94a054bd7df08e5d11bc77b6422ccecbf99ea8dd6f06908bafc72ea869d  qtcharts-841083c263f16f8acb81e4915bf24bbed0461c9a.tar.bz2
> +sha256  66dae46a8bcb1dfc10dd3404296701c41e50658792e4a6a7317a182fad6f36c8  qtcharts-e17308d5ce83a8b66aeeaaaf16ce16d4ee6b2826.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
> diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
> index fa69263be4..bfc6021289 100644
> --- a/package/qt5/qt5charts/qt5charts.mk
> +++ b/package/qt5/qt5charts/qt5charts.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5CHARTS_VERSION = 841083c263f16f8acb81e4915bf24bbed0461c9a
> +QT5CHARTS_VERSION = e17308d5ce83a8b66aeeaaaf16ce16d4ee6b2826
>   QT5CHARTS_SITE = $(QT5_SITE)/qtcharts/-/archive/$(QT5CHARTS_VERSION)
>   QT5CHARTS_SOURCE = qtcharts-$(QT5CHARTS_VERSION).tar.bz2
>   QT5CHARTS_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
> index 1252a73247..776448502b 100644
> --- a/package/qt5/qt5connectivity/qt5connectivity.hash
> +++ b/package/qt5/qt5connectivity/qt5connectivity.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  ec1d91fc35d8b4a333209fb5fd85e00ab77345bff48b60b4e43b804a59f60979  qtconnectivity-c5f35f89e975c2ad58c83c6b606d40ba41057f15.tar.bz2
> +sha256  7a44848e113e1d7232c077f9fa8021ab038f59765123920e11936e7d4b8e3c66  qtconnectivity-f0c98c39447894bba493aa91c65053d7f18d68cb.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
> index 72797de1a0..dc5e647e0b 100644
> --- a/package/qt5/qt5connectivity/qt5connectivity.mk
> +++ b/package/qt5/qt5connectivity/qt5connectivity.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5CONNECTIVITY_VERSION = c5f35f89e975c2ad58c83c6b606d40ba41057f15
> +QT5CONNECTIVITY_VERSION = f0c98c39447894bba493aa91c65053d7f18d68cb
>   QT5CONNECTIVITY_SITE = $(QT5_SITE)/qtconnectivity/-/archive/$(QT5CONNECTIVITY_VERSION)
>   QT5CONNECTIVITY_SOURCE = qtconnectivity-$(QT5CONNECTIVITY_VERSION).tar.bz2
>   QT5CONNECTIVITY_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
> index 0e7978dc58..3db5c94458 100644
> --- a/package/qt5/qt5declarative/qt5declarative.hash
> +++ b/package/qt5/qt5declarative/qt5declarative.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  dbe0cdf84767564a56abf9d0d867c9cfcc754827169357a0f8162309c11882b5  qtdeclarative-b3aaf1482c48bbc0ca4f7c7934597c055afe4b6a.tar.bz2
> +sha256  bebd1205aa087f529b8824f0284e127e08672ff7ce36a6b865cd921514ec1192  qtdeclarative-960a980dc885622cb84990c4da75d5060318302d.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
> index 18c1608fca..99c88e7d06 100644
> --- a/package/qt5/qt5declarative/qt5declarative.mk
> +++ b/package/qt5/qt5declarative/qt5declarative.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5DECLARATIVE_VERSION = b3aaf1482c48bbc0ca4f7c7934597c055afe4b6a
> +QT5DECLARATIVE_VERSION = 960a980dc885622cb84990c4da75d5060318302d
>   QT5DECLARATIVE_SITE = $(QT5_SITE)/qtdeclarative/-/archive/$(QT5DECLARATIVE_VERSION)
>   QT5DECLARATIVE_SOURCE = qtdeclarative-$(QT5DECLARATIVE_VERSION).tar.bz2
>   QT5DECLARATIVE_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
> index 95567b2476..e5fdaf67bf 100644
> --- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
> +++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  de41af344889d35252fec9a6b6c78e1f67b7a7be15a5d3986b2ec20e2fcafadc  qtgraphicaleffects-e6e1e58ec28fd0f2e6426e6962cc4ccddb493349.tar.bz2
> +sha256  18afbc24b40420ce0fe6bfad8331f43a1d8c8ec22501b7987ecec9334b69e9a2  qtgraphicaleffects-cce7d784237cd2dd4af1abe2757d048e34e02685.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
> index f829c67122..ddf805303b 100644
> --- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
> +++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5GRAPHICALEFFECTS_VERSION = e6e1e58ec28fd0f2e6426e6962cc4ccddb493349
> +QT5GRAPHICALEFFECTS_VERSION = cce7d784237cd2dd4af1abe2757d048e34e02685
>   QT5GRAPHICALEFFECTS_SITE = $(QT5_SITE)/qtgraphicaleffects/-/archive/$(QT5GRAPHICALEFFECTS_VERSION)
>   QT5GRAPHICALEFFECTS_SOURCE = qtgraphicaleffects-$(QT5GRAPHICALEFFECTS_VERSION).tar.bz2
>   QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5declarative
> diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
> index 9d821672b3..779db8d109 100644
> --- a/package/qt5/qt5imageformats/qt5imageformats.hash
> +++ b/package/qt5/qt5imageformats/qt5imageformats.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  8bf646d4db7d0099dd49b7c049a64fb585a3e180d73fc2b6edf22a1384529d1d  qtimageformats-9044695f4b1acdd7ec24e7b01f6a6ca61f982a75.tar.bz2
> +sha256  bac150b9c5eaf0132a39a0b2a75cfca5400c11f4b8bf60f7362a6e0307f5c19e  qtimageformats-6a1af670d52492ab0955933b830026b2a18ed6d6.tar.bz2
>   
>   # Hashes for license files:
>   sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
> diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
> index 0ce6e4ffb4..27ef05777d 100644
> --- a/package/qt5/qt5imageformats/qt5imageformats.mk
> +++ b/package/qt5/qt5imageformats/qt5imageformats.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5IMAGEFORMATS_VERSION = 9044695f4b1acdd7ec24e7b01f6a6ca61f982a75
> +QT5IMAGEFORMATS_VERSION = 6a1af670d52492ab0955933b830026b2a18ed6d6
>   QT5IMAGEFORMATS_SITE = $(QT5_SITE)/qtimageformats/-/archive/$(QT5IMAGEFORMATS_VERSION)
>   QT5IMAGEFORMATS_SOURCE = qtimageformats-$(QT5IMAGEFORMATS_VERSION).tar.bz2
>   QT5IMAGEFORMATS_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
> index f73053f388..0188f51c83 100644
> --- a/package/qt5/qt5location/qt5location.hash
> +++ b/package/qt5/qt5location/qt5location.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  90b57a335d8c7311a86865a56b2b9cd944a8a1cafa6a7499de5b35a105c5b247  qt5location-ebdf5b38da6e3fe0a183702bcca395c589c459ed-br1.tar.gz
> +sha256  133d28fc0071e419682b7ed736c17b39240545c8e9d6ff7e9905f365bb1eb693  qt5location-0ec8f5e82da7369a92824167c4d7331f6c502325-br1.tar.gz
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
> index 904d31a983..88bf3d289c 100644
> --- a/package/qt5/qt5location/qt5location.mk
> +++ b/package/qt5/qt5location/qt5location.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5LOCATION_VERSION = ebdf5b38da6e3fe0a183702bcca395c589c459ed
> +QT5LOCATION_VERSION = 0ec8f5e82da7369a92824167c4d7331f6c502325
>   QT5LOCATION_SITE = $(QT5_SITE)/qtlocation
>   QT5LOCATION_SITE_METHOD = git
>   QT5LOCATION_GIT_SUBMODULES = YES
> diff --git a/package/qt5/qt5lottie/qt5lottie.hash b/package/qt5/qt5lottie/qt5lottie.hash
> index cbd94fd111..642625753c 100644
> --- a/package/qt5/qt5lottie/qt5lottie.hash
> +++ b/package/qt5/qt5lottie/qt5lottie.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  82336dd063f8bedc28e9545cc8c0123053434d6c681e470434c80ad3908ca4b0  qtlottie-d40b67401afe7156b03c62c9a4d517b07555fe64.tar.bz2
> +sha256  4d8a063687c25675b012821e252a1afd455bdb4ea43e6d79787f9991c68cb5c5  qtlottie-909b79f4810b8ac62baa3544837793cfb132593b.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
> diff --git a/package/qt5/qt5lottie/qt5lottie.mk b/package/qt5/qt5lottie/qt5lottie.mk
> index 42a920582a..d4ad3afc63 100644
> --- a/package/qt5/qt5lottie/qt5lottie.mk
> +++ b/package/qt5/qt5lottie/qt5lottie.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5LOTTIE_VERSION = d40b67401afe7156b03c62c9a4d517b07555fe64
> +QT5LOTTIE_VERSION = 909b79f4810b8ac62baa3544837793cfb132593b
>   QT5LOTTIE_SITE = $(QT5_SITE)/qtlottie/-/archive/$(QT5LOTTIE_VERSION)
>   QT5LOTTIE_SOURCE = qtlottie-$(QT5LOTTIE_VERSION).tar.bz2
>   QT5LOTTIE_DEPENDENCIES = qt5declarative
> diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
> index 4803ef9230..7925c4fe05 100644
> --- a/package/qt5/qt5multimedia/qt5multimedia.hash
> +++ b/package/qt5/qt5multimedia/qt5multimedia.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  842c5be64dafe7a68d2b120e24faffd14af6e4d9d8e9c0aa8bbf4330b3491aa3  qtmultimedia-76f84c545429a1b988b79f971734ef4bc3e6643f.tar.bz2
> +sha256  3f78ede5dcc231d0e92e9907d11fa1d7a7cf506eb73d3f035e8461b57dc692b4  qtmultimedia-b4d58d8921d6d1c937b5e708e257e2a07a0c5dc4.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
> index 0d0f5dd53d..7a56d238f2 100644
> --- a/package/qt5/qt5multimedia/qt5multimedia.mk
> +++ b/package/qt5/qt5multimedia/qt5multimedia.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5MULTIMEDIA_VERSION = 76f84c545429a1b988b79f971734ef4bc3e6643f
> +QT5MULTIMEDIA_VERSION = b4d58d8921d6d1c937b5e708e257e2a07a0c5dc4
>   QT5MULTIMEDIA_SITE = $(QT5_SITE)/qtmultimedia/-/archive/$(QT5MULTIMEDIA_VERSION)
>   QT5MULTIMEDIA_SOURCE = qtmultimedia-$(QT5MULTIMEDIA_VERSION).tar.bz2
>   QT5MULTIMEDIA_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
> index 05a021e8b2..219dc8d588 100644
> --- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
> +++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  e2c7bc6346a8eb4c21510f8fbf7e752648f68a0c5af8525a784e64503570f72c  qtquickcontrols-e62b8b6d2f45a79652238b33f4bbe23023004ae7.tar.bz2
> +sha256  8c02691d3eb45b9f144bef64c9705e26e8a4c725a0731b18450d39a589965c49  qtquickcontrols-dcc90558d9c0cba41eec7df290943994289b0e87.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
> index 25c1a74f5c..86792ddd8e 100644
> --- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
> +++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5QUICKCONTROLS_VERSION = e62b8b6d2f45a79652238b33f4bbe23023004ae7
> +QT5QUICKCONTROLS_VERSION = dcc90558d9c0cba41eec7df290943994289b0e87
>   QT5QUICKCONTROLS_SITE = $(QT5_SITE)/qtquickcontrols/-/archive/$(QT5QUICKCONTROLS_VERSION)
>   QT5QUICKCONTROLS_SOURCE = qtquickcontrols-$(QT5QUICKCONTROLS_VERSION).tar.bz2
>   QT5QUICKCONTROLS_DEPENDENCIES = qt5declarative
> diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
> index 88777a5cc3..91fb31a7b7 100644
> --- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
> +++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  53caea73e6bdf234cb445067be3bc4e07ed59af7da967638ac598188b719958e  qtquickcontrols2-74e8db97fdb9b55c4b4614b83f4bf17e00df55e9.tar.bz2
> +sha256  481220682ce3127711465d6ade22c9ce0e4a4130dd9735344f7464f9147d8f0d  qtquickcontrols2-1ce461bd1dc713cd2f79fc16c5454d587b45eefa.tar.bz2
>   
>   # Hashes for license files:
>   sha256  d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca  LICENSE.GPLv3
> diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
> index 1732921203..a2503eb9a3 100644
> --- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
> +++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5QUICKCONTROLS2_VERSION = 74e8db97fdb9b55c4b4614b83f4bf17e00df55e9
> +QT5QUICKCONTROLS2_VERSION = 1ce461bd1dc713cd2f79fc16c5454d587b45eefa
>   QT5QUICKCONTROLS2_SITE = $(QT5_SITE)/qtquickcontrols2/-/archive/$(QT5QUICKCONTROLS2_VERSION)
>   QT5QUICKCONTROLS2_SOURCE = qtquickcontrols2-$(QT5QUICKCONTROLS2_VERSION).tar.bz2
>   QT5QUICKCONTROLS2_DEPENDENCIES = qt5declarative
> diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
> index a8acf3c5a2..1c9f436b1b 100644
> --- a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
> +++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  d22637609c4afcc7560d92c894eb55d4afa01706bb5c86499bf56f7c8723a605  qtquicktimeline-87ad61716a7cba5a070d8a7b1756c8b2b48d5d53.tar.bz2
> +sha256  ee404943ef00dbac33928cf001b613ca517fdfdf2767b932a8def5f8c2b0797f  qtquicktimeline-b1b4b882dabaa036c3fb73c4a879ba8efbb02ded.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
> diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.mk b/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
> index de94bd0375..3a8542ab1b 100644
> --- a/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
> +++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5QUICKTIMELINE_VERSION = 87ad61716a7cba5a070d8a7b1756c8b2b48d5d53
> +QT5QUICKTIMELINE_VERSION = b1b4b882dabaa036c3fb73c4a879ba8efbb02ded
>   QT5QUICKTIMELINE_SITE = $(QT5_SITE)/qtquicktimeline/-/archive/$(QT5QUICKTIMELINE_VERSION)
>   QT5QUICKTIMELINE_SOURCE = qtquicktimeline-$(QT5QUICKTIMELINE_VERSION).tar.bz2
>   QT5QUICKTIMELINE_DEPENDENCIES = qt5declarative
> diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.hash b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
> index 1b41ab675f..a931ce09cb 100644
> --- a/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
> +++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  ef8e1f64911f7e03da6306693031fdf953af00d453ec154497178bb7ceab1aa2  qtremoteobjects-aa705010da0f658b78c1155babce7091ae44529a.tar.bz2
> +sha256  677b8ccb5c07673296c4fa01bcbc6bd9b8e3a534d332624f61fe0360a5649703  qtremoteobjects-bdc316aca82769b43cb7821c10d80a1ca02b846e.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.mk b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
> index 3160d37ad7..5fea3487a5 100644
> --- a/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
> +++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5REMOTEOBJECTS_VERSION = aa705010da0f658b78c1155babce7091ae44529a
> +QT5REMOTEOBJECTS_VERSION = bdc316aca82769b43cb7821c10d80a1ca02b846e
>   QT5REMOTEOBJECTS_SITE = $(QT5_SITE)/qtremoteobjects/-/archive/$(QT5REMOTEOBJECTS_VERSION)
>   QT5REMOTEOBJECTS_SOURCE = qtremoteobjects-$(QT5REMOTEOBJECTS_VERSION).tar.bz2
>   QT5REMOTEOBJECTS_DEPENDENCIES = qt5base
> diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
> index f4d52b8a52..0f13743f45 100644
> --- a/package/qt5/qt5scxml/qt5scxml.hash
> +++ b/package/qt5/qt5scxml/qt5scxml.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  a0113f54d9df14ebae15dd85530f87f093a284372ee8237d1ccceb02e6a4607b  qtscxml-631fd7bcc34802b7650c2b1dc73691463954d982.tar.bz2
> +sha256  d598238bfa3bbbe283a8bd2907a4e8e813e00c522f08297a856e6595bbd44099  qtscxml-e8727aabe55526956295407d27317ec15e12b283.tar.bz2
>   
>   # Hashes for license files:
>   sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
> diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
> index f6ccb9298e..32ef425e97 100644
> --- a/package/qt5/qt5scxml/qt5scxml.mk
> +++ b/package/qt5/qt5scxml/qt5scxml.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5SCXML_VERSION = 631fd7bcc34802b7650c2b1dc73691463954d982
> +QT5SCXML_VERSION = e8727aabe55526956295407d27317ec15e12b283
>   QT5SCXML_SITE = $(QT5_SITE)/qtscxml/-/archive/$(QT5SCXML_VERSION)
>   QT5SCXML_SOURCE = qtscxml-$(QT5SCXML_VERSION).tar.bz2
>   QT5SCXML_DEPENDENCIES = qt5declarative
> diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
> index d43fa8ba65..37a23516df 100644
> --- a/package/qt5/qt5sensors/qt5sensors.hash
> +++ b/package/qt5/qt5sensors/qt5sensors.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  8325826a259189fc7dea66651df4022a92a73664e953f86bce5bf5946ebacdf5  qtsensors-35eb5ac7eaef4745a38958c3ca780d7baa2e4f30.tar.bz2
> +sha256  f44148d1a21f3959d79f973d8aa233ddfacf37af6e27902fca8c885b91933fcc  qtsensors-a41492b23cde20d1e00427d31e4637d06aea3638.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
> index 40bb72e038..29e257fdda 100644
> --- a/package/qt5/qt5sensors/qt5sensors.mk
> +++ b/package/qt5/qt5sensors/qt5sensors.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5SENSORS_VERSION = 35eb5ac7eaef4745a38958c3ca780d7baa2e4f30
> +QT5SENSORS_VERSION = a41492b23cde20d1e00427d31e4637d06aea3638
>   QT5SENSORS_SITE = $(QT5_SITE)/qtsensors/-/archive/$(QT5SENSORS_VERSION)
>   QT5SENSORS_SOURCE = qtsensors-$(QT5SENSORS_VERSION).tar.bz2
>   QT5SENSORS_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
> index 01ffd7c215..1d1861a4a3 100644
> --- a/package/qt5/qt5serialbus/qt5serialbus.hash
> +++ b/package/qt5/qt5serialbus/qt5serialbus.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  fe08415d2348797429dc09722478630ceee3d7477652a2712460e79127b7291b  qtserialbus-f9f7eee60adac72fcf6617d164e3bf61222bb5c5.tar.bz2
> +sha256  952b145ae64e03208d7c2a0b0b2b94b928e8998eb72c6762b54e4d9760737dde  qtserialbus-c41785c9f36560722b917d373ee97eed8cc4089a.tar.bz2
>   
>   # Hashes for license files:
>   sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
> diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
> index c718414932..3315ef5be7 100644
> --- a/package/qt5/qt5serialbus/qt5serialbus.mk
> +++ b/package/qt5/qt5serialbus/qt5serialbus.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5SERIALBUS_VERSION = f9f7eee60adac72fcf6617d164e3bf61222bb5c5
> +QT5SERIALBUS_VERSION = c41785c9f36560722b917d373ee97eed8cc4089a
>   QT5SERIALBUS_SITE = $(QT5_SITE)/qtserialbus/-/archive/$(QT5SERIALBUS_VERSION)
>   QT5SERIALBUS_SOURCE = qtserialbus-$(QT5SERIALBUS_VERSION).tar.bz2
>   QT5SERIALBUS_DEPENDENCIES = qt5serialport
> diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
> index 58461430c7..e95392b880 100644
> --- a/package/qt5/qt5serialport/qt5serialport.hash
> +++ b/package/qt5/qt5serialport/qt5serialport.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  6d49d0da174632f51291b0190f6f1db2397a3b339cf293514252766f8a20c63b  qtserialport-c9abfcd5d88cb43c2a7c1d5ddecbff4cdd320694.tar.bz2
> +sha256  2b7584de148f0b6ea2cf162609d44d7ad3bb893b1995427ceed72cb4562db6d7  qtserialport-3380465d5d4977326616c5e57789a81681be650e.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
> index 7d00bd2ab7..462d1dd7b9 100644
> --- a/package/qt5/qt5serialport/qt5serialport.mk
> +++ b/package/qt5/qt5serialport/qt5serialport.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5SERIALPORT_VERSION = c9abfcd5d88cb43c2a7c1d5ddecbff4cdd320694
> +QT5SERIALPORT_VERSION = 3380465d5d4977326616c5e57789a81681be650e
>   QT5SERIALPORT_SITE = $(QT5_SITE)/qtserialport/-/archive/$(QT5SERIALPORT_VERSION)
>   QT5SERIALPORT_SOURCE = qtserialport-$(QT5SERIALPORT_VERSION).tar.bz2
>   QT5SERIALPORT_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5speech/qt5speech.hash b/package/qt5/qt5speech/qt5speech.hash
> index 595aac9f22..3be66a77fe 100644
> --- a/package/qt5/qt5speech/qt5speech.hash
> +++ b/package/qt5/qt5speech/qt5speech.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  6d0794ab9d5286d04fbac2db44c00ed3306e569c876f84cfd91ac0e79c834b1e  qtspeech-d32f4a479d38a11f547598004b975f4356424a16.tar.bz2
> +sha256  4be0161595806cfc5c9c3160a83d0379269a2813dd4b3ffe2e2a1328f23d8fbc  qtspeech-214dcefc7c408e11a3e9fe9d221e4a384e2eaca1.tar.bz2
>   
>   # Hashes for license files:
>   sha256  6c3f3c31b93985f1b93bfbb35fb609d37281697d0efc220c9f91cf4b59eaabde  LICENSE.GPLv2
> diff --git a/package/qt5/qt5speech/qt5speech.mk b/package/qt5/qt5speech/qt5speech.mk
> index 8cf6fe19c1..c8054431df 100644
> --- a/package/qt5/qt5speech/qt5speech.mk
> +++ b/package/qt5/qt5speech/qt5speech.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5SPEECH_VERSION = d32f4a479d38a11f547598004b975f4356424a16
> +QT5SPEECH_VERSION = 214dcefc7c408e11a3e9fe9d221e4a384e2eaca1
>   QT5SPEECH_SITE = $(QT5_SITE)/qtspeech/-/archive/$(QT5SPEECH_VERSION)
>   QT5SPEECH_SOURCE = qtspeech-$(QT5SPEECH_VERSION).tar.bz2
>   QT5SPEECH_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
> index 4816206d64..f3e47da5de 100644
> --- a/package/qt5/qt5svg/qt5svg.hash
> +++ b/package/qt5/qt5svg/qt5svg.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  063ee53515b934c00a65838fe8521142e4a9161b07c8e19b5bb0ea26a0ce9ab3  qtsvg-a9752b00a03438de8e5b080073816e12409404b7.tar.bz2
> +sha256  6a71029b46e71667f86c48923f0b292c3057ea56b2aedb8aeaa5af70e85e71c3  qtsvg-3385b64df939815e9df5955f991d270d47a5515b.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
> index 2a39ed18fe..c1d019000b 100644
> --- a/package/qt5/qt5svg/qt5svg.mk
> +++ b/package/qt5/qt5svg/qt5svg.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5SVG_VERSION = a9752b00a03438de8e5b080073816e12409404b7
> +QT5SVG_VERSION = 3385b64df939815e9df5955f991d270d47a5515b
>   QT5SVG_SITE = $(QT5_SITE)/qtsvg/-/archive/$(QT5SVG_VERSION)
>   QT5SVG_SOURCE = qtsvg-$(QT5SVG_VERSION).tar.bz2
>   QT5SVG_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
> index d603598257..d4ea0dc047 100644
> --- a/package/qt5/qt5tools/qt5tools.hash
> +++ b/package/qt5/qt5tools/qt5tools.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  b6eebbd61dcde981d63ce6de39b3c957bad8f11b0140585ba4d57d166c4dd79d  qttools-32912a06aadfc3dcbc34e0a668ce2c78351eee6e.tar.bz2
> +sha256  7214584115d0b89a362c6b0e8586d6228ac138f3ed5e52c97962b8634edbbcfd  qttools-ddf6686e9bce7a3232af14a2966b4c895e654f02.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
> index a01a336584..98f3948d17 100644
> --- a/package/qt5/qt5tools/qt5tools.mk
> +++ b/package/qt5/qt5tools/qt5tools.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5TOOLS_VERSION = 32912a06aadfc3dcbc34e0a668ce2c78351eee6e
> +QT5TOOLS_VERSION = ddf6686e9bce7a3232af14a2966b4c895e654f02
>   QT5TOOLS_SITE = $(QT5_SITE)/qttools/-/archive/$(QT5TOOLS_VERSION)
>   QT5TOOLS_SOURCE = qttools-$(QT5TOOLS_VERSION).tar.bz2
>   
> diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
> index 60d51fa5fe..89559b63f2 100644
> --- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
> +++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  e1e356e81f3a3fb5da6f6739aa475c15aab15090e202de6704441a3bf41c335b  qtvirtualkeyboard-9fbb837b55887bec5d73fad142c853ef68db35b3.tar.bz2
> +sha256  c8dfb16614a63e39c714673abe35a7c30107d359356695634af619e62e8ce6cd  qtvirtualkeyboard-817378aa10176fd26eed36542bc657e48d9dd42e.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
> diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> index 49ce71b75e..5657d78c30 100644
> --- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> +++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5VIRTUALKEYBOARD_VERSION = 9fbb837b55887bec5d73fad142c853ef68db35b3
> +QT5VIRTUALKEYBOARD_VERSION = 817378aa10176fd26eed36542bc657e48d9dd42e
>   QT5VIRTUALKEYBOARD_SITE = $(QT5_SITE)/qtvirtualkeyboard/-/archive/$(QT5VIRTUALKEYBOARD_VERSION)
>   QT5VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-$(QT5VIRTUALKEYBOARD_VERSION).tar.bz2
>   QT5VIRTUALKEYBOARD_DEPENDENCIES = qt5declarative qt5svg
> diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
> index c9d7f3434c..f4a1663add 100644
> --- a/package/qt5/qt5wayland/qt5wayland.hash
> +++ b/package/qt5/qt5wayland/qt5wayland.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  c881745403a7c3639ee928f64ac9e7252d7a941cb62ef682a7ee83ccf3ae0a60  qtwayland-8faf74a7966b520f0ac3eb4d88235f8ec63b31b8.tar.bz2
> +sha256  d45149cce43ad76f0c8ee43f0469728259d2ab341cf7e2c02ddab6163c5f1d13  qtwayland-b8f1882df7215b6e00f66b7a6a08afafe230de29.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
> index aeca1b0381..4ce89fc46a 100644
> --- a/package/qt5/qt5wayland/qt5wayland.mk
> +++ b/package/qt5/qt5wayland/qt5wayland.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5WAYLAND_VERSION = 8faf74a7966b520f0ac3eb4d88235f8ec63b31b8
> +QT5WAYLAND_VERSION = b8f1882df7215b6e00f66b7a6a08afafe230de29
>   QT5WAYLAND_SITE = $(QT5_SITE)/qtwayland/-/archive/$(QT5WAYLAND_VERSION)
>   QT5WAYLAND_SOURCE = qtwayland-$(QT5WAYLAND_VERSION).tar.bz2
>   QT5WAYLAND_DEPENDENCIES = wayland
> diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
> index b5e9f1a043..7f2a357dbb 100644
> --- a/package/qt5/qt5webchannel/qt5webchannel.hash
> +++ b/package/qt5/qt5webchannel/qt5webchannel.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  a281a053471f5c480d7c2679caa0a759e8628f6eafc07c1781f1eb8bb97ee37d  qtwebchannel-8c842152da613f941892481d62267c73c4a4f006.tar.bz2
> +sha256  7d482e5140d789b417c359f557da783ed2cc07e8148133971caeb5b48b418645  qtwebchannel-48a520c11a0ef57f2553746159acf739c7f3863d.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
> index 54e6a70ddb..8ba81383d1 100644
> --- a/package/qt5/qt5webchannel/qt5webchannel.mk
> +++ b/package/qt5/qt5webchannel/qt5webchannel.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5WEBCHANNEL_VERSION = 8c842152da613f941892481d62267c73c4a4f006
> +QT5WEBCHANNEL_VERSION = 48a520c11a0ef57f2553746159acf739c7f3863d
>   QT5WEBCHANNEL_SITE = $(QT5_SITE)/qtwebchannel/-/archive/$(QT5WEBCHANNEL_VERSION)
>   QT5WEBCHANNEL_SOURCE = qtwebchannel-$(QT5WEBCHANNEL_VERSION).tar.bz2
>   QT5WEBCHANNEL_DEPENDENCIES = qt5websockets
> diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
> index 038446a9f4..e0447c70b1 100644
> --- a/package/qt5/qt5webengine/qt5webengine.hash
> +++ b/package/qt5/qt5webengine/qt5webengine.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  4a3456df42e1c1b859232b3ee1d58360e629d55daf6e5ad308871142c1b0c2fa  qtwebengine-v5.15.10-lts.tar.bz2
> +sha256  e7c9534453472311c06605f2892e038e9920bf10ca3a0dad99b46955ea124618  qtwebengine-v5.15.11-lts.tar.bz2
>   
>   # Locally calculated
>   sha256  f34787ef0342c614b667186a6ec2f5d6b9d650e30142a2788a589a89743e88e9  LICENSE.Chromium
> diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
> index 72fbb4a599..fa3cc48995 100644
> --- a/package/qt5/qt5websockets/qt5websockets.hash
> +++ b/package/qt5/qt5websockets/qt5websockets.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  00a6d312f2e0ec8c64c12f6a178681d5936ec65bc7f1b85948b58cdb5021a8b6  qtwebsockets-6a4991250793cd38efa5e8db858cd49c82439130.tar.bz2
> +sha256  2e024a4c0706d58a9c846cc1d036f383906e392f3cd7c3051fc56915b7530eee  qtwebsockets-50f3853a83ffc80a978cfa0882bdc2859e8de71e.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
> index 4eafb0b212..bb96fefe82 100644
> --- a/package/qt5/qt5websockets/qt5websockets.mk
> +++ b/package/qt5/qt5websockets/qt5websockets.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5WEBSOCKETS_VERSION = 6a4991250793cd38efa5e8db858cd49c82439130
> +QT5WEBSOCKETS_VERSION = 50f3853a83ffc80a978cfa0882bdc2859e8de71e
>   QT5WEBSOCKETS_SITE = $(QT5_SITE)/qtwebsockets/-/archive/$(QT5WEBSOCKETS_VERSION)
>   QT5WEBSOCKETS_SOURCE = qtwebsockets-$(QT5WEBSOCKETS_VERSION).tar.bz2
>   QT5WEBSOCKETS_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5webview/qt5webview.hash b/package/qt5/qt5webview/qt5webview.hash
> index d928c7cdce..00525dbad2 100644
> --- a/package/qt5/qt5webview/qt5webview.hash
> +++ b/package/qt5/qt5webview/qt5webview.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  38f6c0a2863e9144632286b0ef43db506b8631eeff0f8facae14b0da86ca0491  qtwebview-87577dde04ed219bda776dabca86176149736331.tar.bz2
> +sha256  2427179da946d6df409e334c94ffe3f8589035a5d566caf52db2333cc9bfe47c  qtwebview-f078642eb9a440f6aa88f2beaf10f445de1e29bb.tar.bz2
>   
>   # Hashes for license files:
>   sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
> diff --git a/package/qt5/qt5webview/qt5webview.mk b/package/qt5/qt5webview/qt5webview.mk
> index a55fd8ae74..01a377c27b 100644
> --- a/package/qt5/qt5webview/qt5webview.mk
> +++ b/package/qt5/qt5webview/qt5webview.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5WEBVIEW_VERSION = 87577dde04ed219bda776dabca86176149736331
> +QT5WEBVIEW_VERSION = f078642eb9a440f6aa88f2beaf10f445de1e29bb
>   QT5WEBVIEW_SITE = $(QT5_SITE)/qtwebview/-/archive/$(QT5WEBVIEW_VERSION)
>   QT5WEBVIEW_SOURCE = qtwebview-$(QT5WEBVIEW_VERSION).tar.bz2
>   QT5WEBVIEW_DEPENDENCIES = qt5webengine
> diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
> index 87dac8625e..132c28dd96 100644
> --- a/package/qt5/qt5x11extras/qt5x11extras.hash
> +++ b/package/qt5/qt5x11extras/qt5x11extras.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  cf9124f3d35f1c8db4e9e47943cb1ec86834abf2be38d70412d0452e64462906  qtx11extras-982f20eb585d77e5b5c721e05a466d7161f7f2d1.tar.bz2
> +sha256  7d99fa4d900207c0ae1c7a514e7dc0b607c04e0232d2842a8d84f52534bd16e6  qtx11extras-5fb2e067a38d3583684310130f5d8aad064f512f.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
> index 80c5498518..a6fade0135 100644
> --- a/package/qt5/qt5x11extras/qt5x11extras.mk
> +++ b/package/qt5/qt5x11extras/qt5x11extras.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5X11EXTRAS_VERSION = 982f20eb585d77e5b5c721e05a466d7161f7f2d1
> +QT5X11EXTRAS_VERSION = 5fb2e067a38d3583684310130f5d8aad064f512f
>   QT5X11EXTRAS_SITE = $(QT5_SITE)/qtx11extras/-/archive/$(QT5X11EXTRAS_VERSION)
>   QT5X11EXTRAS_SOURCE = qtx11extras-$(QT5X11EXTRAS_VERSION).tar.bz2
>   QT5X11EXTRAS_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
> index 353dfc8485..9be7bb7831 100644
> --- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
> +++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  067b801049f6fada8e7ebcfbce0530db6217a1a94b8ed34c99c530be4129889d  qtxmlpatterns-30e6c84fe2752cde8b53aff9d38c2095cd7c8761.tar.bz2
> +sha256  7770b333f2c0079cf65aa19dafd9e7d80fe058baf8e924f1c0d6e75c0b6e7374  qtxmlpatterns-5a1948ddc05bf44017ac12bd5c2b9bc79fbcb9a2.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> index 803c36cf04..2126d3c915 100644
> --- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> +++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5XMLPATTERNS_VERSION = 30e6c84fe2752cde8b53aff9d38c2095cd7c8761
> +QT5XMLPATTERNS_VERSION = 5a1948ddc05bf44017ac12bd5c2b9bc79fbcb9a2
>   QT5XMLPATTERNS_SITE = $(QT5_SITE)/qtxmlpatterns/-/archive/$(QT5XMLPATTERNS_VERSION)
>   QT5XMLPATTERNS_SOURCE = qtxmlpatterns-$(QT5XMLPATTERNS_VERSION).tar.bz2
>   QT5XMLPATTERNS_INSTALL_STAGING = YES

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

