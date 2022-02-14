Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E7FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5059960B15;
	Mon, 14 Feb 2022 20:49:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3Hz2t2qD6aS; Mon, 14 Feb 2022 20:49:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8143A606E7;
	Mon, 14 Feb 2022 20:49:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C42701BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B238E401B2
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hN6nBwSfv9xo for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:48:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5580440131
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:48:57 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id i19so8873516wmq.5
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 12:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DDZoFkXXj114u1JyL4Cq/nkQeygvGPTDpNJvo9n7L2w=;
 b=TJ/IKbZZNudfdVXFn551olceiRIoehE3zCEBh0cpVHJja1pnxnieibYoN3zDO28/Gq
 4T8iU5Tt9H30Gt040EgXTAzzq2/r2Y9gjrFAi8iVQELigDa8CdRgB+Ajtih2GvWYgvRD
 J6XXWScVQe1yyv54oZAeFBSIiutUlxqCgndoiqLzlARBWFBk4yvkGYn0shzfp2oCigem
 PB5IfNz3sMnKL0996XnwiyZqaXGGjU84iTCGpivDsMo6z+VbHnVx6lfHjFHFy2A2Hp9f
 3K5s5rMKBohbj5Kq5M7Eslaudp/+UPR0hXS37MNBp42BEWYxGa5o5iT1aq+eTgD3xff+
 Z1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DDZoFkXXj114u1JyL4Cq/nkQeygvGPTDpNJvo9n7L2w=;
 b=iQWRum1uOOpAI2mXHtaVgcHBVCF/P2S4H443nSWH0XqPhieiB4oDYgwQxRVLbON+k5
 KeookBP9dg6QhJ5ghQjymJF8XitgGEk2OGjQin444BvzA0L3ocuTH+GKxypEWOpjZvSl
 t66HkCfh4UUNC8uzOF/XK9bYOD6ta9fcfb1UfvNtUry8ggWuq69iRmahwDMQvm8p1SM4
 3ioM8yyXaSS+8Xv88MiMO8emPnonbcE/ERJhlEGWzV7BRS/l0otJ73xjYuRt1Z9itgsW
 IPPnUB8iofBopk21g7ouLy8pydQL842ghYJxpwR87YhQ+VNvjKCpOxUiL21J0u99PBPI
 +Nkw==
X-Gm-Message-State: AOAM530dycsZWp+5L8GsNCECy3D1QuoWG3jRnIhgz2MUhrcnwrJtaw8X
 gLnSZOOUdxylF02W0E51Xyhuc5tyeFARfA==
X-Google-Smtp-Source: ABdhPJz3Uq0T4hF4kMnLJdUhCzzZw36YxPKL9Lk/HdirKAm1PHZ9aNN3iL2jCr9MELGFzfp7C1nGKw==
X-Received: by 2002:a05:600c:5c1:: with SMTP id
 p1mr434120wmd.151.1644871735592; 
 Mon, 14 Feb 2022 12:48:55 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 20sm11360556wmk.26.2022.02.14.12.48.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 12:48:55 -0800 (PST)
Message-ID: <069d7a4e-63d0-ee43-80b8-222eee4b43e9@mind.be>
Date: Mon, 14 Feb 2022 21:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20220211134906.18280-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220211134906.18280-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/libv4l: v4l-utils needs C++11
 support
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/02/2022 14:49, Peter Seiderer wrote:
> Fixes:
> 
>    - http://autobuild.buildroot.net/results/cacd73e08cfb359d608bca807189b7bd3c5c79bd
> 
>    v4l2-ctl.cpp:53:2: warning: identifier 'nullptr' is a keyword in C++11 [-Wc++0x-compat]
>    v4l2-ctl.cpp:53:37: error: 'nullptr' was not declared in this scope
>    [...]
>    v4l2-ctl-tuner.cpp: In function 'void parse_freq_seek(char*, v4l2_hw_freq_seek&)':
>    v4l2-ctl-tuner.cpp:160:10: error: 'constexpr' does not name a type
>       static constexpr const char *subopts[] = {
>              ^
>    v4l2-ctl-tuner.cpp:160:10: note: C++11 'constexpr' only available with -std=c++11 or -std=gnu++11
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>   package/libv4l/Config.in | 4 ++++
>   package/libv4l/libv4l.mk | 6 ++++--
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
> index 57ddde1dfb..c88f280c3b 100644
> --- a/package/libv4l/Config.in
> +++ b/package/libv4l/Config.in
> @@ -20,6 +20,7 @@ comment "libv4l JPEG support not enabled"
>   
>   config BR2_PACKAGE_LIBV4L_UTILS
>   	bool "v4l-utils tools"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
>   	help
>   	  v4l-utils is a collection of various video4linux and DVB
>   	  utilities.
> @@ -35,6 +36,9 @@ config BR2_PACKAGE_LIBV4L_UTILS
>   	  - rds-ctl
>   	  - qv4l2 (if Qt is enabled)
>   
> +comment "v4l-utils tools needs a toolchain w/ C++11"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +
>   endif
>   
>   comment "libv4l needs a toolchain w/ threads, C++ and headers >= 3.0"
> diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
> index 4dc0f15f94..ee5a1f2241 100644
> --- a/package/libv4l/libv4l.mk
> +++ b/package/libv4l/libv4l.mk
> @@ -59,6 +59,10 @@ ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
>   LIBV4L_CONF_OPTS += --enable-v4l-utils
>   LIBV4L_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
>   
> +# v4l2-ctl needs c++11, qt5 needs c++11 (since qt-5.7)/use gnu++11 for
> +# typeof support

  This no longer makes sense. The "use gnu++11" part is there because libv4l 
uses 'typeof', which is a GNU extension, and -std=c++XX disables GNU extensions. 
qt5 needs -std=c++11, not -std=gnu++11. Since libv4l itself now requires c++11, 
the qt5 reference is no longer relevant.

  So I removed the qt5 part and applied to master, thanks.

  Regards,
  Arnout


> +LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++11"
> +
>   # IR BPF decoder support needs toolchain with linux-headers >= 3.18
>   # libelf and clang support
>   LIBV4L_CONF_OPTS += --disable-bpf
> @@ -71,8 +75,6 @@ LIBV4L_CONF_ENV += \
>   	ac_cv_prog_MOC=$(HOST_DIR)/bin/moc \
>   	ac_cv_prog_RCC=$(HOST_DIR)/bin/rcc \
>   	ac_cv_prog_UIC=$(HOST_DIR)/bin/uic
> -# qt5 needs c++11 (since qt-5.7)/use gnu++11 for typeof support
> -LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++11"
>   else
>   LIBV4L_CONF_OPTS += --disable-qv4l2
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
