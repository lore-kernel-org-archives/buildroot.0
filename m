Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8476C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70AC441A2C;
	Mon, 25 Jul 2022 22:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70AC441A2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CbqIoYhVlNFh; Mon, 25 Jul 2022 22:23:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CACE40992;
	Mon, 25 Jul 2022 22:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CACE40992
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 517FF1BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38FDE60B4E
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38FDE60B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jb4krQ0ZZgfU for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:23:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E20E6070A
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E20E6070A
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:23:31 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 f24-20020a1cc918000000b003a30178c022so10261760wmb.3
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4AC01y4CSunnulphY7OBCgRan8gF4coOJqWXFRNd7QY=;
 b=UDglNhLUva7sRM+GbJjilbEY04MDL4r6ekZWPeZErNC2o3i9m/seJuIifnWny+cIJT
 J2u20jF+5A6eUrdkTip9irML68A6w/6Uw7wMgL8OnVcZOO7XtcJ9PjIX02XB0mCkZGG7
 4MbLlFwRl4Lhkdg+OMG5PoyOO+wl747P8Q75VP0mTKPtwy3lbnPNhk1IW9diHf/nYvEO
 +OOTZchvn4QQCjenji48q25NKjwbMEx5vjdhmXs4eK6MtOpybZffXYgCd1risQyMReTB
 +ov/EhDZBTpz88EqwTC9R4oyGaKH7f72U00+UsAPugOiLBQFPx16Pzb+bvHi7CWY8H7X
 EOYQ==
X-Gm-Message-State: AJIora/2u2BuJ77HkxhRSHe1oA/LgVHPpQ+SYr5lZYyXF/LTv/PylV4b
 szgM+Jjg4wh2YOOxfkJjMUlvnWw6EavSTA==
X-Google-Smtp-Source: AGRyM1uN3osLzBGXIrfENm6U4L8kNkhssBPTTu2t/LkBugy0RdPpYezS4CR/zu765i/OJw/JisK9+g==
X-Received: by 2002:a05:600c:1552:b0:3a3:2e4c:bd0a with SMTP id
 f18-20020a05600c155200b003a32e4cbd0amr18553223wmg.82.1658787809488; 
 Mon, 25 Jul 2022 15:23:29 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a5d534a000000b0021e5e5cd3a8sm10757000wrv.87.2022.07.25.15.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 15:23:29 -0700 (PDT)
Message-ID: <a21e929d-5ab2-51de-f5b8-9aef66b23a24@mind.be>
Date: Tue, 26 Jul 2022 00:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220725140820.195083-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220725140820.195083-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4AC01y4CSunnulphY7OBCgRan8gF4coOJqWXFRNd7QY=;
 b=VHom8qypGW7izsCuOgDTquT0BoI5dTjUT5O2ezZOMoJROELtPMa+SLh5/aHtcORXOc
 tx3Km+dhDiXd0f1CVXs0EeyUGXqjZ4/33Y+XrhVjk7zhER/ooSMci0OCM5RvVVZKOgVJ
 W2/6y93QfwEbjyhcZE84ujA/n94B4PavhzgI5p2EEZ2wBFkLezYKAmf/iWg+B+9dGKrw
 LrASkl0NIWkd2zmcGLnIAtCdrpPmXtshvGCdfbLjIeWzt7D90hdiDJSq7aH/ADg4W25Z
 cK1Pr+hwE70Hh/qgIlnl5cyo4cyLNCZVfyEdUH+0yxHt6IjLRlkDn1xFyHdyAsd5hgBa
 2CXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VHom8qyp
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.81
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/07/2022 16:08, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libnss/libnss.hash | 4 ++--
>   package/libnss/libnss.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
> index 0f4c3cabe6..8330d255a7 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_80_RTM/src/SHA256SUMS
> -sha256  c0bf1fd2c7e29a6b02b309622baafc443eec90c8934bb155da4bb98988784b6a  nss-3.80.tar.gz
> +# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_81_RTM/src/SHA256SUMS
> +sha256  a8bf5f3bb617068d57e7b15f3d9d528f109af0d57df2eaab0519b6423edccca6  nss-3.81.tar.gz
>   # Locally calculated
>   sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index e7aa730435..4283ef520f 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBNSS_VERSION = 3.80
> +LIBNSS_VERSION = 3.81
>   LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>   LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>   LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
