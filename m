Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE77AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:43:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 504E360EFF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 504E360EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECC6F40227;
	Sun, 26 Sep 2021 19:43:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qh7bLXe9gAzc; Sun, 26 Sep 2021 19:43:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 014754020E;
	Sun, 26 Sep 2021 19:43:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2E9E1BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9219E60719
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EWgJ6vedGt4j for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:43:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A14A960708
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:43:00 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id ba1so1967358edb.4
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 12:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5ZRQkndKud4bMO6MlZ8YV44afGLVjO/2+XYIsTemyLo=;
 b=iVuC+k5Wkb5o6BBwHq1kwPyJWuypypVaPj0FXZv97FsIKHvfHJqLr95agVjhFvq+KS
 gAd1aIpWWQIC6zPcHDaTt6fesPYQF+vOTknckzYbMtDeYNc8Bqxm2t5f2cHE8jEejMkE
 6g6bpq13YGsHvtMF20NF9pz/ZZvlte7UBwkTS/dDpEXXuu2DzApeh3qr1WTMGwHf4f86
 xgQGfRtteqxzzQEk0Y8VF5fb7rH74TVU8gyQilysJlzgg5qryzwef+dfHGQIN3deHlAj
 N27082Kj7j291QSV4SVZ52UtSrVrOXFhbay5F87aUqIIjnjG3BmPbIr30Y4gMNl3oIcv
 HVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5ZRQkndKud4bMO6MlZ8YV44afGLVjO/2+XYIsTemyLo=;
 b=Bp6bjrxtvfvJYpS65IgPGCXIlwkWtiXStkm5BycG12hslk1kfSocPNNJT94rJ4inxw
 GNd13Fi7QM2EqQ0yZRb9Zc7D7WmH8CUBSu5kpA5U+p45A98anJCbT7JiMe6tGRMhlH4R
 XkyQpSoB5QOkWW3/gEWYVKJ9g6HJFrabVaOv21JHxmIBIkiC/NiV4bYzHFxVSD6VH2CG
 HRDZ9NciCmlJBRJzFoMuaU7akl3jKV/nR05+JMqGZY5RLczD13CCwg1zX1ua6r6YT8/P
 IsxQg3WvZwXJc97jEnyz9/b69fjcNWENXCZVzjw7MZl/hvyAJYPKGD64WRMfMefp42vE
 qSGQ==
X-Gm-Message-State: AOAM531yZST1uqpOuQdTvQJk6LfjKQqRQVQizB6PUd/CcEgwvugHibpj
 gmOyI31WEF1vwAVAA/6LmVu7IUOQlmJCEA==
X-Google-Smtp-Source: ABdhPJwZwNJUSSeYGl2gmzQWYTwUxqx+8IEDoZyPxBrsTvX5GRHyCJ1Y+ojw3xFrKsJ3ElfKRzdzqw==
X-Received: by 2002:a50:9552:: with SMTP id v18mr7485432eda.395.1632685378809; 
 Sun, 26 Sep 2021 12:42:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b13sm10098129ede.97.2021.09.26.12.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:42:58 -0700 (PDT)
Message-ID: <ef72c12d-b490-f523-7dfe-226898df9835@mind.be>
Date: Sun, 26 Sep 2021 21:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210924214321.2920421-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210924214321.2920421-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera: bump to version
 40f5fddca7f774944a53f58eeaebc4db79c373d8
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/09/2021 23:43, Fabrice Fontaine wrote:
> This will fix the following build failure raised since commit
> c09f126f570355b8ec134724b453300a4811339c thanks to
> https://git.linuxtv.org/libcamera.git/commit/?id=c52e8429cce91dadf98378d87015d8f476a44f70:
> 
> /tmp/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: src/libcamera/base/libcamera-base.so.p/message.cpp.o: in function `libcamera::Message::registerMessageType()':
> message.cpp:(.text+0x290): undefined reference to `__atomic_fetch_add_4'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/6e3471df8e9312a1789ca05ae70cc2283bfeec23
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libcamera/libcamera.hash | 2 +-
>   package/libcamera/libcamera.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> index 52c584bc16..a7ca27a96b 100644
> --- a/package/libcamera/libcamera.hash
> +++ b/package/libcamera/libcamera.hash
> @@ -1,4 +1,4 @@
> -sha256  a5ed581416719b914140eda76ca8a4e0e9c944b859f8fb018fc17497278c5ae1  libcamera-e355ca0087cd93ef80f74c61018e9e9228a93313-br1.tar.gz
> +sha256  305e6f458d2bf3d4b697ffe33e104b696db6b1492bb5422e2cce1937e58516f1  libcamera-40f5fddca7f774944a53f58eeaebc4db79c373d8-br1.tar.gz
>   
>   # license files
>   sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 677da8ac4c..8ab95fb42a 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> -LIBCAMERA_VERSION = e355ca0087cd93ef80f74c61018e9e9228a93313
> +LIBCAMERA_VERSION = 40f5fddca7f774944a53f58eeaebc4db79c373d8
>   LIBCAMERA_SITE_METHOD = git
>   LIBCAMERA_DEPENDENCIES = \
>   	host-openssl \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
