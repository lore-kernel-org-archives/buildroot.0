Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C15FC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 08:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E449F41633;
	Sat, 23 Jul 2022 08:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E449F41633
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7nMwr7Vfy3lm; Sat, 23 Jul 2022 08:48:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A448D40A45;
	Sat, 23 Jul 2022 08:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A448D40A45
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A5081BF2C7
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6233C8140A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6233C8140A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C_HikQ0m8U1T for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 08:48:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1811981407
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1811981407
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:48:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso6432535wma.2
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 01:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+9lPN60F7ADIrun1nGSi+whLtB3MDWDWrqSwXGYumf4=;
 b=GuuEVst2UdONjC8JHf+jjUXNwqd1owinOq/oJ3UXpyR5ts1DRBbVim3F4z5U0d5FoR
 kJlpYPwD90ijYVLUue9dOgWIYmyta/ZqfhVPf7Cb9UvGJBfapTvZJ2Kq+IlOhfRfNig7
 +5xpjM+ZF4R2kyy8FOao6C56uklWpBjbLrf680fruKxz18XWgZ+RIBqhA7PIawzeHWmM
 2pzWrlhB6NRpCK/dAYDvVjDenKH3+Tt11oOPMGvF9OM1OrmkkJStTRrkSYU/z7Shic/r
 OWhRLgOGEwLex3xekqqI9q91P6/NOXZ6TsAXcyXn1ZJm94MsXuWOMXGydCUxUNFP7ia8
 /1YA==
X-Gm-Message-State: AJIora+HYvzQAgNEvvfOVkKUJZ+DUgZXpVn4Tm3wWXRPC/1iqZG9pB0W
 lzJctz7PM6/TyjIdXf2lJTL9Ig==
X-Google-Smtp-Source: AGRyM1vThxKet0wemLhMqjEBPTelf48IdfMakkW0aKcbApgab3Sa8/dP3Bz3BWvlPx/wA9HO3zwhrQ==
X-Received: by 2002:a05:600c:3845:b0:3a3:227d:c1c6 with SMTP id
 s5-20020a05600c384500b003a3227dc1c6mr15286274wmr.9.1658566109242; 
 Sat, 23 Jul 2022 01:48:29 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003a17ab4e7c8sm14021130wmp.39.2022.07.23.01.48.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 01:48:28 -0700 (PDT)
Message-ID: <e59f5ec7-13f7-4aed-824a-1127f30e5140@mind.be>
Date: Sat, 23 Jul 2022 10:48:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Etienne Carriere <etienne.carriere@linaro.org>, buildroot@buildroot.org
References: <20220722085348.645793-1-etienne.carriere@linaro.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220722085348.645793-1-etienne.carriere@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=+9lPN60F7ADIrun1nGSi+whLtB3MDWDWrqSwXGYumf4=;
 b=O4lI5J38Uk9HnefnUooxyoHGidjdc3yCh22Fa/l8BAznttjFtWVRXNkPWBy6GQuw0g
 2imDo7NigfWQmYXXIx+WfCNegVE80rskPLl5NjDp5+pf7Ra+2tutzwz6ROZ3mczJZTKR
 +HECbrCSYZrCNosXFgCoZlcwJnsyAh2fybDooARf9RyfsuC8T9vZUqysWrrR/kJ8/CXw
 JdOVMdbjMvsDlV1reGh5dOZFYhOvMvYJWYkPpireIebYoyWDE13zYij1Km8YEE7aYw7I
 8sYKU1kSgLo9tOtX+Dxr0pAHL+mm3KdeNy6H3r4Ewk/wpMMQ1lqre4i+TvR7bRyaRrn1
 ssRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=O4lI5J38
Subject: Re: [Buildroot] [PATCH 1/5] boot/optee-os: bump to version 3.18.0
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



On 22/07/2022 10:53, Etienne Carriere wrote:
> Bumps OP-TEE OS package version to OP-TEE release 3.18.0.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>

  Applied all 5 to master, thanks.

  Regards,
  Arnout

> ---
>   boot/optee-os/Config.in     | 4 ++--
>   boot/optee-os/optee-os.hash | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
> index f199de31eb..db7a93c10c 100644
> --- a/boot/optee-os/Config.in
> +++ b/boot/optee-os/Config.in
> @@ -18,7 +18,7 @@ choice
>   	  Select the version of OP-TEE OS you want to use
>   
>   config BR2_TARGET_OPTEE_OS_LATEST
> -	bool "3.17.0"
> +	bool "3.18.0"
>   	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>   	select BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
>   	help
> @@ -70,7 +70,7 @@ endif
>   
>   config BR2_TARGET_OPTEE_OS_VERSION
>   	string
> -	default "3.17.0"	if BR2_TARGET_OPTEE_OS_LATEST
> +	default "3.18.0"	if BR2_TARGET_OPTEE_OS_LATEST
>   	default "custom"	if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
>   	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
>   				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
> diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
> index 5c1047bac3..38f68bec5d 100644
> --- a/boot/optee-os/optee-os.hash
> +++ b/boot/optee-os/optee-os.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/OP-TEE/optee_os/archive/3.17.0/optee-os-3.16.0.tar.gz
> -sha256  5d5a3bda83abddfeb5ee765a15525f23adf2709ba2475a05e0c5f25790c1883f  optee-os-3.17.0.tar.gz
> +# From https://github.com/OP-TEE/optee_os/archive/3.18.0/optee-os-3.18.0.tar.gz
> +sha256  bdd309697745ec4406951652094b50d9adb06c3612f01bd8a3d72682ec8e03e8  optee-os-3.18.0.tar.gz
>   # Locally computed
>   sha256  1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
