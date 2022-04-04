Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8492EC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 17:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 316CE408B8;
	Mon,  4 Apr 2022 17:39:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RMNauA-_4elD; Mon,  4 Apr 2022 17:39:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00C994028C;
	Mon,  4 Apr 2022 17:39:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 88E661BF9AD
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7775160FE2
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:39:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Xd-bXhBiTK4 for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 17:39:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 594E960FE1
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 17:39:33 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id b24so11977757edu.10
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 10:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=mgTvxYgAykOTbrJ2SglWIDpiMIkJbWZzBI3NdlCP2uU=;
 b=HFCmKjHBmRC1v7ovvIgshtxOLpR9JL8/fn5fZ2NUb+V2M09dQ0gy6gDd5/9/mxxT2U
 gZ7aF+WkU4lwihzq+REF8zzyD6RxplaNwgG2zgQQYUy73YWmsoaYeew93K+E52a07b38
 bRcc/f22jIim4w3FV6Ig2eCh1ZQalVE6HLSx4U/rczsRu++72FWkbKymCynJs6gvOxXu
 NQMzH9SQGu1XOg6enRWaHUFFjWDNFMs0+qx+FYSeH44zMGqhmq6JSoi3FS6VbUHK8TlW
 nXCLAFBd+UwNO9lECYMud/E5UVmaTHb3Gj6cYMzkY6gP8L3VuejLRnVoH8VerXbLQYk/
 ukHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mgTvxYgAykOTbrJ2SglWIDpiMIkJbWZzBI3NdlCP2uU=;
 b=79dL4i2ijGqswg2f10oCSGR7xjlahdsi6ufdRMztpvJMrE1MSwK3y+FfKYFlVX7IyJ
 QqGUxATSEYWTCFYDoh5HzZxAUoW1hne2TypqoU6GH6JWAP561WpTXNNigN0HF4RBL6bO
 QADcphze2RWAgqMzZhaDOsFjwDBFyKPOmcwcsoogPKbVN2DzXhYBhMb2tl6yeRwmX682
 8hgUxm/Yp3YlN+p48iUMNby/b2gln/DPrYM7sf9D/4J7bNnkFCXJwA0nt27wnyvjyUYL
 n2dooTO00EPqlI07P75RdEjwyrQxsgJbHwCpG9t2mUn0MHpFPDpvjb/NvtodJUSh3vAt
 oV4g==
X-Gm-Message-State: AOAM533HpNVHGqwQB9oZksmpi+bvDd338jSGoq9ahzIQW3AnvBf+wCnw
 OYhfiKZBQrfdsqbHufdaAoo6f18/I8NnLg==
X-Google-Smtp-Source: ABdhPJwamWZr+RDuVLfdbLbxi5TXHRBfBZ/M3TVtI6zKtzIFU9OEdDWFF3+p8nuJTijSB1ZSltFSPw==
X-Received: by 2002:a05:6402:1a54:b0:41c:cddb:3142 with SMTP id
 bf20-20020a0564021a5400b0041ccddb3142mr1370206edb.106.1649093971546; 
 Mon, 04 Apr 2022 10:39:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a50e0cc000000b0041cd813ac01sm1547353edl.28.2022.04.04.10.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 10:39:31 -0700 (PDT)
Message-ID: <91d95b30-2cf5-10c9-2987-b3412c60d06a@mind.be>
Date: Mon, 4 Apr 2022 19:39:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220331152816.245852-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220331152816.245852-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 1.0.0
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



On 31/03/2022 17:28, Bernd Kuhls wrote:
> Release notes:
> https://code.videolan.org/videolan/dav1d/-/blob/master/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dav1d/dav1d.hash | 4 ++--
>   package/dav1d/dav1d.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
> index 5e838b0951..35d753fc27 100644
> --- a/package/dav1d/dav1d.hash
> +++ b/package/dav1d/dav1d.hash
> @@ -1,4 +1,4 @@
> -# From http://download.videolan.org/pub/videolan/dav1d/0.9.2/dav1d-0.9.2.tar.xz.sha256
> -sha256  e3235ab6c43c0135b0db1d131e1923fad4c84db9d85683e30b91b33a52d61c71  dav1d-0.9.2.tar.xz
> +# From http://download.videolan.org/pub/videolan/dav1d/1.0.0/dav1d-1.0.0.tar.xz.sha256
> +sha256  51737db7e4897e599684f873a4725176dd3c779e639411d7c4fce134bb5ebb82  dav1d-1.0.0.tar.xz
>   # Locally computed
>   sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
> diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
> index ecc4cc55c3..2d42cdcb67 100644
> --- a/package/dav1d/dav1d.mk
> +++ b/package/dav1d/dav1d.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -DAV1D_VERSION = 0.9.2
> +DAV1D_VERSION = 1.0.0
>   DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
>   DAV1D_SITE = http://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
>   DAV1D_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
