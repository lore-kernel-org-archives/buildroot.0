Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78EDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 883C582605;
	Sat, 12 Mar 2022 20:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cdGsL1DdiaQc; Sat, 12 Mar 2022 20:26:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98664825DC;
	Sat, 12 Mar 2022 20:26:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8847E1BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7845F410B1
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:26:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qIrt6AoaX4J for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:26:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B948410AF
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:26:09 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bg10so26074614ejb.4
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 12:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hNjc6yHjKMYdDrugJkY/s4gY3SwNP8oOYl+2y5JSwWQ=;
 b=LTnto2OCXqs7lCMfZs77wreoREalUys78aQ5Qx4ADh3aNePBu4wZ5g3iJ0g8qnspUo
 dnUVkbOmRxx1KWRNTR47jP/Ub02BO8ShpMqaeRtnDCl6dVD10xoRktm8ELrgdLPJxiAN
 KuMc9JVhxxnibkJkt5MzQYJ7ggsw7ALiQR6ssrfIjsZ2NgWqPnI/pzd/ulSjVr4V2ftN
 wZCRtUbcu3P44oWeWKTk62zpIcWysasdIKGTZkDbqitXNzgi9W5z20bxYL7+uJjiwFgO
 e+qrSlEqPbVIQU98D2IFa37nfan2v39SUQLyTma3TwSlWK5Lt0h3YIENkyu4iFgpF+gE
 mRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hNjc6yHjKMYdDrugJkY/s4gY3SwNP8oOYl+2y5JSwWQ=;
 b=RueHZwbNkI6fPEU2qqSZ56Fw+33te6ERR833kPuksGCRrRJ0RIvFYgIQKMdUdnVe/W
 BXle0VIhFedYPW2A92siDdsBV2V7c2I3B7ungJTqR/tQyVMllIieuowfFzj/4dpV+Su3
 uNvS6xqRFCf71kWLVU1rvOZrjTEZ+bl8R06fS874X0Uymrc1Y5+AycQbfkdJVtQt9SB/
 +1VjmpOwfgDt+JgoNQgj9XcYCHCK1jrsNrH9qzDmgJqW+jCEs/+h3I4Li/dXxUNykgXI
 lJyh1ywaMwNUjqdIEeU0lVKWMWihex8ElO35HZPIKmQ9jXDvIF4KYus67e1rea9nzH9V
 vbew==
X-Gm-Message-State: AOAM5317vRrj5/9aKVmO+T513ebupdPbh9xUHx9LxhlcPJ6n7xUy5QFw
 s3nfGvqXf5Bs1LKF2cHCXrO8jQ==
X-Google-Smtp-Source: ABdhPJw44wqOKNzwFiwiOzjVceQiN7GH2EHEsK4KBus7oRI4CuF/L9/3piP/x0MoYufoZmcCaiSueQ==
X-Received: by 2002:a17:907:1694:b0:6da:9271:486b with SMTP id
 hc20-20020a170907169400b006da9271486bmr13697802ejc.508.1647116767558; 
 Sat, 12 Mar 2022 12:26:07 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 lb14-20020a170907784e00b006d5c0baa503sm4638349ejc.110.2022.03.12.12.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 12:26:07 -0800 (PST)
Message-ID: <cc41bbf1-0eac-7258-328f-3b6ad6de0cff@mind.be>
Date: Sat, 12 Mar 2022 21:26:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220225185204.1043277-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220225185204.1043277-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-userland: fix build with
 libexecinfo
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/02/2022 19:52, Fabrice Fontaine wrote:
> Fix the following build failure raised on uclibc and musl since the
> addition of libexecinfo package in commit
> eea8ba446c10701a273432552108d80fb2224ef4:
> 
> /home/peko/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../build/lib/libvcos.so: undefined reference to `backtrace_symbols'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/93d3b8cc2ac5dfa9d4b44946c0b4d8171e8f52a1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...on-t-override-CMAKE_EXE_LINKER_FLAGS.patch | 58 +++++++++++++++++++
>   package/rpi-userland/rpi-userland.mk          |  5 ++
>   2 files changed, 63 insertions(+)
>   create mode 100644 package/rpi-userland/0006-don-t-override-CMAKE_EXE_LINKER_FLAGS.patch
> 
> diff --git a/package/rpi-userland/0006-don-t-override-CMAKE_EXE_LINKER_FLAGS.patch b/package/rpi-userland/0006-don-t-override-CMAKE_EXE_LINKER_FLAGS.patch
> new file mode 100644
> index 0000000000..bf2a9eb6ea
> --- /dev/null
> +++ b/package/rpi-userland/0006-don-t-override-CMAKE_EXE_LINKER_FLAGS.patch
> @@ -0,0 +1,58 @@
> +From 87febf8b7b1c0a6d0ea1d26770d3665008d66fd2 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 25 Feb 2022 19:21:06 +0100
> +Subject: [PATCH] don't override CMAKE_EXE_LINKER_FLAGS
> +
> +Don't override CMAKE_EXE_LINKER_FLAGS as it could be used by the user to
> +pass additional flags such as -lexecinfo on musl and uclibc-ng
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/raspberrypi/userland/pull/719]
> +---
> + host_applications/android/apps/vidtex/CMakeLists.txt | 2 +-
> + host_applications/linux/apps/raspicam/CMakeLists.txt | 2 +-
> + makefiles/cmake/arm-linux.cmake                      | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/host_applications/android/apps/vidtex/CMakeLists.txt b/host_applications/android/apps/vidtex/CMakeLists.txt
> +index e7206cc..16c64db 100644
> +--- a/host_applications/android/apps/vidtex/CMakeLists.txt
> ++++ b/host_applications/android/apps/vidtex/CMakeLists.txt
> +@@ -5,7 +5,7 @@ SET(COMPILE_DEFINITIONS -Werror -Wall)
> + # Set --no-as-needed to stop the linker discarding mmal_vc_client
> + # as it can't see that the constructor registers a load of functionality
> + # with the MMAL core.
> +-SET( CMAKE_EXE_LINKER_FLAGS "-Wl,--no-as-needed" )
> ++SET( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--no-as-needed" )
> +
> + include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/libs/bcm_host/include)
> +
> +diff --git a/host_applications/linux/apps/raspicam/CMakeLists.txt b/host_applications/linux/apps/raspicam/CMakeLists.txt
> +index e6bd373..2f72eb2 100644
> +--- a/host_applications/linux/apps/raspicam/CMakeLists.txt
> ++++ b/host_applications/linux/apps/raspicam/CMakeLists.txt
> +@@ -6,7 +6,7 @@ SET(COMPILE_DEFINITIONS -Werror)
> + # Set --no-as-needed to stop the linker discarding mmal_vc_client
> + # as it can't see that the constructor registers a load of functionality
> + # with the MMAL core.
> +-SET( CMAKE_EXE_LINKER_FLAGS "-Wl,--no-as-needed" )
> ++SET( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--no-as-needed" )
> +
> + include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/libs/bcm_host/include)
> + include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/apps/raspicam/)
> +diff --git a/makefiles/cmake/arm-linux.cmake b/makefiles/cmake/arm-linux.cmake
> +index 957846a..e172282 100644
> +--- a/makefiles/cmake/arm-linux.cmake
> ++++ b/makefiles/cmake/arm-linux.cmake
> +@@ -93,7 +93,7 @@ if(ANDROID)
> +     set(CMAKE_SHARED_LINKER_FLAGS "-nostdlib ${ANDROID_CRTBEGIN} -Wl,-Bdynamic -Wl,-T${ANDROID_LDSCRIPTS}/armelf.x")
> +
> +     link_directories(${ANDROID_LIBS})
> +-    set(CMAKE_EXE_LINKER_FLAGS "-nostdlib ${ANDROID_CRTBEGIN} -nostdlib -Wl,-z,noexecstack")
> ++    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -nostdlib ${ANDROID_CRTBEGIN} -nostdlib -Wl,-z,noexecstack")
> +     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-dynamic-linker,/system/bin/linker -Wl,-rpath,${CMAKE_INSTALL_PREFIX}/lib")
> +     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-T${ANDROID_LDSCRIPTS}/armelf.x -Wl,--gc-sections")
> +     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-z,nocopyreloc -Wl,-z,noexecstack -Wl,--fix-cortex-a8 -Wl,--no-undefined")
> +--
> +2.34.1
> +
> diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
> index 84050b6df3..3564ec0703 100644
> --- a/package/rpi-userland/rpi-userland.mk
> +++ b/package/rpi-userland/rpi-userland.mk
> @@ -13,6 +13,11 @@ RPI_USERLAND_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr
>   
>   RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
>   
> +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> +RPI_USERLAND_DEPENDENCIES += libexecinfo
> +RPI_USERLAND_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lexecinfo
> +endif
> +
>   ifeq ($(BR2_PACKAGE_RPI_USERLAND_HELLO),y)
>   
>   RPI_USERLAND_CONF_OPTS += -DALL_APPS=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
