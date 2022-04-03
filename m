Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A17C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 15:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 131004055D;
	Sun,  3 Apr 2022 15:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgbEWC-rILfO; Sun,  3 Apr 2022 15:05:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19E1E40432;
	Sun,  3 Apr 2022 15:05:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BE4B1BF2AF
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19E1F414CA
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ah6QgkWwipPn for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 15:05:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCD7F4167E
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 15:05:52 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id x20so379443edi.12
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 08:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=du/b3cCM3cAl3v+3qr/D93sXmKhTBhDlc/Tby8+a7Dk=;
 b=BFKppnfdemxUwy41Fa3V3/gB6IrQ0QBpVQPavfh+YEEkuhDe1yOl922gce/3xzPqbS
 +zvmul+YKvDaCoJ8sI1vlsgVMdwMSGsdZiCVwW/mRRzoAMiEP2rdtv8i3T0lmxs0AxuG
 eeruDzHXMA5lIBRRGx/AnQm0WJs8omO6cJJ5WiuvypHfHHpqthXNC/5li1A6TFkJVVu3
 h05Zcl5n4Etnu95WM+AWzVmgAbq8zW1F4Ugyg05ywiOBCOGN5g+nleEeKc8cmZDxIfeg
 qVuUmaJqds6oMv1tfLfdlJYb5FOvO+on0BPq+/sMS/ihYrGiMby6k3/0XxRD8gWB7agr
 1rjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=du/b3cCM3cAl3v+3qr/D93sXmKhTBhDlc/Tby8+a7Dk=;
 b=e8m8jVFBMlbHr6+AASE6BiIEQPEwj5WJN7Wy4Ye/cfPgdZJ+R1FlFi59Nb9WRt+y14
 12cldnljv2G3VaA04b/FJihbZtn+uNrSpLmG4DYE0PyoICgPa17yJNAOf9DLXiUaj9pM
 hyuAHRLQS/TUhNrYpIKXy1uMvMOFL+I0KUrp6Q0VRqpfprdtl0ZMWGgkz9fv3w2FOpDe
 1kJGP5ZtuvHi3C5u0TMUzPOsjTXvx47opeKc9vQXUaKes8aPd4vCno9Y7Kpszq6kvX6w
 Hb1iUPhub6fUjVzNrJUSyY5Kv6Q84XzdTUZW8XC/1K+msfOYoSG0uLDJbGFtLSMXvS1P
 FW4A==
X-Gm-Message-State: AOAM53090JSV1r3WImfT+z2kcriKTIKovJFA/tnDzkeY9nAhz/K6G4Df
 SeLptTUYAgwHTEH83ghK/gDkAQ==
X-Google-Smtp-Source: ABdhPJwpmwux7TIa7S9se7QvIesaeU/CJBuP8Z54Z3JqMymkr1HhIO368PXAMyG5NcmS8dQzIraYdg==
X-Received: by 2002:a50:ed09:0:b0:41c:c2a0:75ca with SMTP id
 j9-20020a50ed09000000b0041cc2a075camr2636384eds.350.1648998350746; 
 Sun, 03 Apr 2022 08:05:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425?
 (ptr-9fplejof7ird5pjql2d.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425])
 by smtp.gmail.com with ESMTPSA id
 b3-20020aa7d483000000b00419209d4c85sm3891979edr.66.2022.04.03.08.05.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Apr 2022 08:05:49 -0700 (PDT)
Message-ID: <ffe59381-fead-ce99-66ff-1c51dcecdbbe@mind.be>
Date: Sun, 3 Apr 2022 17:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220402171015.1180992-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220402171015.1180992-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wireshark: needs C++
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



On 02/04/2022 19:10, Fabrice Fontaine wrote:
> wireshark needs C++ since switch to cmake-package in commit
> 7cb7fb8191fc52c1e2cc8b4b15ea52fd12c30d9a:
> 
> CMake Error at CMakeLists.txt:32 (project):
>    No CMAKE_CXX_COMPILER could be found.

  It's actually only needed for the Qt GUI, but it would be really hard to 
change the CMakeLists.txt to make that possible. So let's just go with this.

  Note that it also needs C++11, which means it has minimal GCC version 4.7. But 
that's kind of our implicit minimum anyway.


  Applied to master, thanks.

  Regards,
  Arnout

> 
> Fixes:
>   - http://autobuild.buildroot.org/results/1ce9bc2a2330e27dfaceae682139d222feb806ae
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/wireshark/Config.in | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
> index 95fc9b38f3..fdeb9da259 100644
> --- a/package/wireshark/Config.in
> +++ b/package/wireshark/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_WIRESHARK
>   	depends on BR2_USE_MMU # fork(), glib2
>   	depends on BR2_USE_WCHAR # glib2
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	depends on BR2_INSTALL_LIBSTDCPP
>   	select BR2_PACKAGE_C_ARES
>   	select BR2_PACKAGE_LIBPCAP
>   	select BR2_PACKAGE_LIBGCRYPT
> @@ -45,8 +46,8 @@ comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL, host
>   
>   endif # BR2_PACKAGE_WIRESHARK
>   
> -comment "wireshark needs a toolchain w/ wchar, threads, dynamic library"
> +comment "wireshark needs a toolchain w/ wchar, threads, dynamic library, C++"
>   	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
>   	depends on BR2_USE_MMU
>   	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		BR2_STATIC_LIBS
> +		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
