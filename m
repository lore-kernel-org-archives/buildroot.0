Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04244C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 11:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0BF181270;
	Wed, 27 Jul 2022 11:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0BF181270
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hxfpTI4dtjVC; Wed, 27 Jul 2022 11:08:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 949B980B5F;
	Wed, 27 Jul 2022 11:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 949B980B5F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B99231BF46D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0C6D403CC
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0C6D403CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dy8D7qhwrErT for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 11:08:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 035404035D
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 035404035D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 11:08:20 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v13so15902004wru.12
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 04:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NbRkwMoOZbKj+X6V5M0/UcxnHyd4qq5c07L8z0B5oDk=;
 b=VWxZ6pnyhMDWUrgTDxi8vrpx6QQ8K4HhXMNV71pkwPBPL5auTn6tTXqWc23J+FJB+a
 7iJRadPs8D7mxcpFo63heYXiPCiQWkF2+qoT9AelyNAw6PNwGhSTlxm0V009SeV7ABGw
 Rld2OSK+/f/qEcr9+EDKMMB5GvsQ+vr6Oll+LJsbatMlxX1PTDQNUMVNacCUhq8SNjLe
 +zSy1S99NEAuHZqP3K9/hJ9vEDy42OK9wMjocuHlUvf+Z/GPRW3iccsRdktlfn2sfkhx
 NAYKRKabL3Dg9Fk8IfEJesnSIVtADNmfhM4c9hGiaN9fM9XkSVDYjPZpzDNb/5mnvy8F
 qELQ==
X-Gm-Message-State: AJIora/oKdu2P5Imjea+kpMYtRtPqJ+XHNpN071dDajdJd9ZYZIg+bPO
 xzF1rjmBpUb1pFaQp+7Ecy63iA==
X-Google-Smtp-Source: AGRyM1vPjzf5dRiZhx3FzFTjed0dCzw1nNCA4PGIP6eZcrXWrhO4LMUWgUnx+PkByxaJ6+U+r1bguA==
X-Received: by 2002:a5d:5187:0:b0:21e:6efd:1f06 with SMTP id
 k7-20020a5d5187000000b0021e6efd1f06mr12783544wrv.471.1658920099064; 
 Wed, 27 Jul 2022 04:08:19 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 bg26-20020a05600c3c9a00b003a3279b9037sm2059973wmb.16.2022.07.27.04.08.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 04:08:18 -0700 (PDT)
Message-ID: <ccbd9868-2add-5859-f19b-d46b394f8ca9@mind.be>
Date: Wed, 27 Jul 2022 09:58:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220518013424.2558229-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220518013424.2558229-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NbRkwMoOZbKj+X6V5M0/UcxnHyd4qq5c07L8z0B5oDk=;
 b=QpD5KvFhB8iNtk7gCIHaV69c2W7Z6Y8EfD+RGAwXlwkHfmB1Lz3WTzx5/50DMJfDOF
 mJR65bvRbqtglf30H2Sj7k2mFrdDuXNWeAeoQXcIceeS/orZ66WmB7LcAogdGG+wEZLr
 mJH85bpPZv7NLOZbI+xGz5Sg1Ts0w1h7NwRR/uw37Kao1b0GD1XWmpekhhE3nWuKtolp
 GVcBR2tn4jsi4GQmnqxzErOyDYU2ZeB4scE4EJkaqwpScI1yAS4cW/0Zxv3SyDpXsqlO
 uoirYXfWzOxKxGDvdJCYAfbnJ6mDdOxtDvqcHxbAeZ046fnGrGZCo00jSPRI0pPe5AM/
 YR/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QpD5KvFh
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?Q?Ga=c3=abl_Portay?= <gael.portay@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/05/2022 03:34, James Hilliard wrote:
> Bump qt5 packages to latest submodule versions from:
> https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15
> 
> Drop a qt5location patch which is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/qt5/qt53d/qt53d.hash                  |   2 +-
>   package/qt5/qt53d/qt53d.mk                    |   2 +-
>   package/qt5/qt5base/qt5base.hash              |   2 +-
>   package/qt5/qt5base/qt5base.mk                |   2 +-
>   package/qt5/qt5charts/qt5charts.hash          |   2 +-
>   package/qt5/qt5charts/qt5charts.mk            |   2 +-
>   .../qt5/qt5connectivity/qt5connectivity.hash  |   2 +-
>   .../qt5/qt5connectivity/qt5connectivity.mk    |   2 +-
>   .../qt5/qt5declarative/qt5declarative.hash    |   2 +-
>   package/qt5/qt5declarative/qt5declarative.mk  |   2 +-

  Is it possible that you missed qt5doc, which I merged two days ago? Or did it 
really not have an update?

  Regards,
  Arnout

>   .../qt5graphicaleffects.hash                  |   2 +-
>   .../qt5graphicaleffects.mk                    |   2 +-
>   .../qt5/qt5imageformats/qt5imageformats.hash  |   2 +-
>   .../qt5/qt5imageformats/qt5imageformats.mk    |   2 +-
>   ...fix-compilation-for-no-opengl-builds.patch | 528 ------------------
>   package/qt5/qt5location/qt5location.hash      |   2 +-
>   package/qt5/qt5location/qt5location.mk        |   2 +-
>   package/qt5/qt5lottie/qt5lottie.hash          |   2 +-
>   package/qt5/qt5lottie/qt5lottie.mk            |   2 +-
>   package/qt5/qt5multimedia/qt5multimedia.hash  |   2 +-
>   package/qt5/qt5multimedia/qt5multimedia.mk    |   2 +-
>   .../qt5quickcontrols/qt5quickcontrols.hash    |   2 +-
>   .../qt5/qt5quickcontrols/qt5quickcontrols.mk  |   2 +-
>   .../qt5quickcontrols2/qt5quickcontrols2.hash  |   2 +-
>   .../qt5quickcontrols2/qt5quickcontrols2.mk    |   2 +-
>   .../qt5quicktimeline/qt5quicktimeline.hash    |   2 +-
>   .../qt5/qt5quicktimeline/qt5quicktimeline.mk  |   2 +-
>   .../qt5remoteobjects/qt5remoteobjects.hash    |   2 +-
>   .../qt5/qt5remoteobjects/qt5remoteobjects.mk  |   2 +-
>   package/qt5/qt5script/qt5script.hash          |   2 +-
>   package/qt5/qt5script/qt5script.mk            |   2 +-
>   package/qt5/qt5scxml/qt5scxml.hash            |   2 +-
>   package/qt5/qt5scxml/qt5scxml.mk              |   2 +-
>   package/qt5/qt5sensors/qt5sensors.hash        |   2 +-
>   package/qt5/qt5sensors/qt5sensors.mk          |   2 +-
>   package/qt5/qt5serialbus/qt5serialbus.hash    |   2 +-
>   package/qt5/qt5serialbus/qt5serialbus.mk      |   2 +-
>   package/qt5/qt5serialport/qt5serialport.hash  |   2 +-
>   package/qt5/qt5serialport/qt5serialport.mk    |   2 +-
>   package/qt5/qt5svg/qt5svg.hash                |   2 +-
>   package/qt5/qt5svg/qt5svg.mk                  |   2 +-
>   package/qt5/qt5tools/qt5tools.hash            |   2 +-
>   package/qt5/qt5tools/qt5tools.mk              |   2 +-
>   .../qt5virtualkeyboard.hash                   |   2 +-
>   .../qt5virtualkeyboard/qt5virtualkeyboard.mk  |   2 +-
>   package/qt5/qt5wayland/qt5wayland.hash        |   2 +-
>   package/qt5/qt5wayland/qt5wayland.mk          |   2 +-
>   package/qt5/qt5webchannel/qt5webchannel.hash  |   2 +-
>   package/qt5/qt5webchannel/qt5webchannel.mk    |   2 +-
>   package/qt5/qt5websockets/qt5websockets.hash  |   2 +-
>   package/qt5/qt5websockets/qt5websockets.mk    |   2 +-
>   package/qt5/qt5webview/qt5webview.hash        |   2 +-
>   package/qt5/qt5webview/qt5webview.mk          |   2 +-
>   package/qt5/qt5x11extras/qt5x11extras.hash    |   2 +-
>   package/qt5/qt5x11extras/qt5x11extras.mk      |   2 +-
>   .../qt5/qt5xmlpatterns/qt5xmlpatterns.hash    |   2 +-
>   package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk  |   2 +-
>   57 files changed, 56 insertions(+), 584 deletions(-)
>   delete mode 100644 package/qt5/qt5location/0002-fix-compilation-for-no-opengl-builds.patch
> 

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
