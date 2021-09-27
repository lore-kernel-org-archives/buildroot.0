Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA05CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:38:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DBE660FC2
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DBE660FC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BB2C6081B;
	Mon, 27 Sep 2021 14:38:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MmHNe5lYT7Qi; Mon, 27 Sep 2021 14:37:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A67AA60808;
	Mon, 27 Sep 2021 14:37:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C1CF71BF275
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1C224065D
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:37:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2658fVqqlIk3 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:37:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF0E140631
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:37:55 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id dj4so70409042edb.5
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=/WWHLlT5GYR+qClmU/wGxbPISW5/tG6quUDqIQaFZ+U=;
 b=iQKsnybYln0JFIMsMqrRoOCpnZaIQJgnUkYaDPWRxNuyB6RaYmq6wmoW0kO7HhvxTb
 USmXjsxxDpyTVtOuufj+3zt+73ktl4qywLX6QKgG0Y0D1FmCxCO7reTesyzniXsq84hV
 Iff1sPr0dojOUjLbub15LC2tVGLL9oJxg5Yx3U2z0N/Ab48GqWPqYCpDgTjngAkRDSFv
 iwROeubsYsJ6ufKZrWNddD8SZP36NLlY/JFg9GEwrwZ8xkZxeWBhKxi3aK1u/Z6IymC8
 SmbqPsCP/gahEpIXWxWxVGEQS44kBoFUUzXU6vblVwXfa2iSkxptv7p6ZQ6YG6azULtQ
 hGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/WWHLlT5GYR+qClmU/wGxbPISW5/tG6quUDqIQaFZ+U=;
 b=1OJpT5vFFF1CAND0op2lrxclRrWvB2B9TlGp0fcdgsdtOHmpWqzVEqz0y+gHRd6nhS
 bJoZvrkbwSBlI6ThV6OupOvAYS7/RmFLHzK6i24dtZ51VBN1U5B5BAhgAQkmuinX5ahB
 g8RPxcx3gkgBmCcxlsllopJVRDWjqLXorTCqKwxLN+W0ZG4Y1A5Zj8sdn00wyGGIlYpn
 F4TJYlPebOhHhho1EULrg2lBW6t8FKars3C8Lm+f2b9kV3moYv5kfOAmspiXgfcObJKQ
 tva3/qwAVV7x1W7ED9NcvTJiZeXCCnvethlyAHzNjBRBvP+HYZRYLgEpI32toU+NGkDl
 cjTA==
X-Gm-Message-State: AOAM532iGHcYZhJxh7OqIfw7cQB3jTEG58l5FnYeEoHVQD64BPn/+bMl
 Nd6XmISUx2h2mLyE1qfzkcCbKs5wSKJ105fs
X-Google-Smtp-Source: ABdhPJzqEGLQTvBQ2bcv+8BKrGcPNZDEBt5jjSkgIzxza3c//K5Um0Tm2i7Eap4yrcptenmudE/mug==
X-Received: by 2002:a50:e1c4:: with SMTP id m4mr179222edl.307.1632753472585;
 Mon, 27 Sep 2021 07:37:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k18sm9724243edv.41.2021.09.27.07.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:37:52 -0700 (PDT)
Message-ID: <626f4cf1-ba0a-34c4-13b1-54f758e27a41@mind.be>
Date: Mon, 27 Sep 2021 16:37:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Alexander Egorenkov <egorenar-dev@posteo.net>, buildroot@buildroot.org
References: <20210927105123.12375-1-egorenar-dev@posteo.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210927105123.12375-1-egorenar-dev@posteo.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/multipath-tools: bump to
 version 0.8.7
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



On 27/09/2021 12:51, Alexander Egorenkov wrote:
> Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/multipath-tools/multipath-tools.hash | 2 +-
>   package/multipath-tools/multipath-tools.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
> index 7b8cfe98f641..ac41e4815b72 100644
> --- a/package/multipath-tools/multipath-tools.hash
> +++ b/package/multipath-tools/multipath-tools.hash
> @@ -1,5 +1,5 @@
>   # Locally computed:
> -sha256  ba781d981bd6e8efa5f9f3af6727f85520af6395958e852c1907f59f6124f08e  multipath-tools-0.8.6.tar.gz
> +sha256  7c5962be6068c78d5256e8fc979cf327988f7560705bb9cc25b508c50ca997c0  multipath-tools-0.8.7.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0
>   sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
>   sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
> diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
> index e9db80225803..3d8095b0b093 100644
> --- a/package/multipath-tools/multipath-tools.mk
> +++ b/package/multipath-tools/multipath-tools.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MULTIPATH_TOOLS_VERSION = 0.8.6
> +MULTIPATH_TOOLS_VERSION = 0.8.7
>   MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
>   
>   MULTIPATH_TOOLS_LICENSE = \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
