Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30EEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AA9983E27;
	Sat, 23 Apr 2022 16:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZznEaOPCBmW4; Sat, 23 Apr 2022 16:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46E5783E14;
	Sat, 23 Apr 2022 16:27:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C70651BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3973417CA
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:27:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sHt4wdfD7_Ul for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:27:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 667A0417C0
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:27:43 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z19so591304edx.9
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 09:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=OKXlnO0ieE0zEIWu/gmEIzw8i8EJ3EPeORnpfkc2UTw=;
 b=EnWMjGnOYJgn0jXsgP9A4KYM9MrL7+TUOtjoW3h6KNYbQ3NYO0pF+dUw1U0Q3VImtV
 TSAIUDiuNfRqJs708awPWvepE4W7srqKcXmsNGMMtUA7MTgx/1oMbtP5A1azQdg63Zhc
 2cPbCqYc1tys4nj193QtWmTWhnMwNACAtC7t1FiwY2gbb9n4IzOlsD2R2g/SB21mSLZp
 347UHiR/u9QnOiS9NQRXogNII2Z44itLCZ4o9PgXtYxpFywCMeS3KwuBZhWt7jb1G2Ay
 QTqqBZGm6jsDksa0TpwBHLRy09eI7ShOqf7sIKvQ43PHbwxWXak8JG4lArgOF8Do4C8O
 Hm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OKXlnO0ieE0zEIWu/gmEIzw8i8EJ3EPeORnpfkc2UTw=;
 b=jRAU4Z7f59gKm9uzoLDjgc6psJSpbFp0vsj2N6O4B3eMVmL1L50TPGAg9CN/mXpJ2/
 39VEINJ+qpgpGl1haMitr6/lYAPvI9Q2k7IH8RjOlH8QTlbw1ypnTorp9jqYhg+fBQh7
 EHqWA4imph/PQjiB7Mjm0266DWX40RkdSLOYRZWTsIPMq7LMZkO64gbF7tgiHenqZs6h
 B042c6qRqavUN9SQ/2We5km1ozjDfmN9yFFipWIKvua3yk+uw+eKAMi2k5N0aCqMKdab
 L63ItiWemErQ6ClBq+LYU02lFKuBiN3HvL53WGZEnaUE/u0i5MTcw9yCd87MAyrFcP0e
 aFTQ==
X-Gm-Message-State: AOAM530NH+bWy60ko+SpJ3sfsZvojpspGoXL2v1sspwPN/VZbv4rbMzI
 oKDhe/aZXzj81LSyWF1OO/HRPg==
X-Google-Smtp-Source: ABdhPJyJbTebG90c+Cef7bAheSBABZzPCYVJGbN4nGAMabUmQTq5Ez+EZF3vWO24BreM+IRVKXBmAg==
X-Received: by 2002:aa7:ce87:0:b0:425:d88c:bc92 with SMTP id
 y7-20020aa7ce87000000b00425d88cbc92mr978177edv.147.1650731261427; 
 Sat, 23 Apr 2022 09:27:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ay17-20020a170906d29100b006e88f246fdbsm1805433ejb.152.2022.04.23.09.27.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 09:27:41 -0700 (PDT)
Message-ID: <9b7c0ad7-1ab5-aacf-6612-84c9b96ca8e4@mind.be>
Date: Sat, 23 Apr 2022 18:27:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220420172816.1160081-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220420172816.1160081-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv4: fix uclibc build
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



On 20/04/2022 19:28, Fabrice Fontaine wrote:
> Add BR2_PACKAGE_OPENCV4_LIB_DNN to fix the following uclibc build
> failure raised since bump to version 4.5.5 in commit
> b6922313937712a89841b58d3b355edd53754bca and
> https://github.com/opencv/opencv/commit/1feb3838b51c0b27b0f3e64f02358ff5ef3111b8:
> 
> /home/giuliobenetti/autobuild/run/instance-3/output-1/build/opencv4-4.5.5/modules/dnn/src/layers/elementwise_layers.cpp: In member function 'float cv::dnn::RoundFunctor::calculate(float) const':
> /home/giuliobenetti/autobuild/run/instance-3/output-1/build/opencv4-4.5.5/modules/dnn/src/layers/elementwise_layers.cpp:1260:43: error: 'fegetround' is not a member of 'std'
>   1260 |         int old_rounding_direction = std::fegetround();
>        |                                           ^~~~~~~~~~
> /home/peko/autobuild/instance-0/output-1/build/opencv4-4.5.5/modules/dnn/src/layers/elementwise_layers.cpp:1261:14: error: 'fesetround' is not a member of 'std'
>   1261 |         std::fesetround(FE_TONEAREST);
>        |              ^~~~~~~~~~
> /home/peko/autobuild/instance-0/output-1/build/opencv4-4.5.5/modules/dnn/src/layers/elementwise_layers.cpp:1261:25: error: 'FE_TONEAREST' was not declared in this scope
>   1261 |         std::fesetround(FE_TONEAREST);
>        |                         ^~~~~~~~~~~~
> 
> Indeed, uclibc pretends to implement fenv but it raises build failures
> on numerous architectures (or1k, sh4, xtensa, mipsel, arm, arc, riscv64,
> etc.)
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/a6dd3c10acfbf6bc1af867d770cf0ce926c6ce84
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/opencv4/Config.in  | 11 +++++++++++
>   package/opencv4/opencv4.mk |  1 +
>   2 files changed, 12 insertions(+)
> 
> diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
> index 23d34a9d22..a61a106952 100644
> --- a/package/opencv4/Config.in
> +++ b/package/opencv4/Config.in
> @@ -30,6 +30,17 @@ config BR2_PACKAGE_OPENCV4_LIB_CALIB3D
>   	  Include opencv_calib3d (camera calibration and 3d
>   	  reconstruction) module into the OpenCV build.
>   
> +config BR2_PACKAGE_OPENCV4_LIB_DNN
> +	bool "dnn"
> +	# dnn needs fenv.h which is not provided by uclibc
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC
> +	help
> +	  Include opencv_dnn (Deep Neural Networks) module into the
> +	  OpenCV build.
> +
> +comment "dnn needs a glibc or musl toolchain"
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC
> +
>   config BR2_PACKAGE_OPENCV4_LIB_FEATURES2D
>   	bool "features2d"
>   	select BR2_PACKAGE_OPENCV4_LIB_FLANN
> diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
> index 0563026b18..84e0487dc4 100644
> --- a/package/opencv4/opencv4.mk
> +++ b/package/opencv4/opencv4.mk
> @@ -92,6 +92,7 @@ OPENCV4_CONF_OPTS += \
>   	-DBUILD_opencv_apps=OFF \
>   	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV4_LIB_CALIB3D),ON,OFF) \
>   	-DBUILD_opencv_core=ON \
> +	-DBUILD_opencv_dnn=$(if $(BR2_PACKAGE_OPENCV4_LIB_DNN),ON,OFF) \
>   	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV4_LIB_FEATURES2D),ON,OFF) \
>   	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV4_LIB_FLANN),ON,OFF) \
>   	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV4_LIB_HIGHGUI),ON,OFF) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
