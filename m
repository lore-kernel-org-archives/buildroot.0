Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB22BC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 22:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AE6940900;
	Tue,  8 Feb 2022 22:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ToHzm8hyW1zO; Tue,  8 Feb 2022 22:09:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEE0D408E1;
	Tue,  8 Feb 2022 22:09:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C8EBF1BF2EF
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 22:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7CFD826B0
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 22:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UwZTM_xyTfYK for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 22:09:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CA8E826AA
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 22:09:04 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HYfWndaigkz4hHYfWnyhUG; Tue, 08 Feb 2022 23:09:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644358142; bh=CiWYE3lX2dAQn29inh0I+T2r7hQTUysTlqgmESr9Q+Y=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=hBzcorxngHSkNy39s/4ZFxm8tw3v8/tLD9GhkGu5HEZF3VhzSf95IjORLviAv3qov
 CxAMx8KlHyuM01lASc5EzPFhJzmgD9fcBbOeLr70iNbgC6CQK9MAY3VO3pMRsnXvGJ
 Lipat5g5QZv9m3FLTYSibyCVLLwdZ2Lk11iSDXa4wQQVmstZP7dkG+qJVX85awbtmH
 JoS4ffAxfKAKY5mSp+kp2dr9jzgcqAGvgYGGvwCWa58sWdFOx6RqDp76giwRmS1coY
 AN3gKw+E8eFWwEH43gbEdrhMyjY0pcccBkxc1GAokp7vDlMiuIdsPLaTwnCRZBSqE+
 5QDiMKLgjQtzA==
Message-ID: <00d36960-8959-806c-1527-d08a8b94591b@benettiengineering.com>
Date: Tue, 8 Feb 2022 23:09:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Arnout Vandecappelle <arnout@mind.be>, Peter Seiderer <ps.report@gmx.net>,
 buildroot@buildroot.org
References: <20210502095925.10744-1-ps.report@gmx.net>
 <b471621d-c852-fbe1-54ca-0970480cbc36@mind.be>
 <164435572997.3447701.14524139530215798014@Monstersaurus>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <164435572997.3447701.14524139530215798014@Monstersaurus>
X-CMAE-Envelope: MS4wfJd+w05itnJou+98hFB7BLy3p5nyKWd5uWo1oApuhsS+KDMf9dAUUqUseWZwq2AFtOoPamVGy+83jAqt7ROVQu5SetVSulCD4XsU+ggADNiNKqkbJNDv
 UUYhPKhY72/zvRZ2+H1BGdueGNrky9YTdW1yWWIewWyEh6GOdmfi9RF8bBgTVb0wFH4JiJQuorvd2P9rgsRdYoat1dwK/GkPnPLuVBkzIfm4VoIzfnPhUDaW
 z44RPMTsv8denlPElmRHDZtaHp8mMjIRKhnZzYdCD542K/17/ydqW19mwnzO/tWCupcUXFQFkTYQv37fmloPkA==
Subject: Re: [Buildroot] [PATCH v5] package/libcamera-apps: new package
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

Hi Kieran,

On 08/02/22 22:28, Kieran Bingham wrote:
> Hi All,
> 
> Quoting Arnout Vandecappelle (2022-02-08 21:09:44)
>>
>>
>> On 02/05/2021 11:59, Peter Seiderer wrote:
>>> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>>
>>    (Finally) applied to master, thanks. However...
> 
> Ohh, I'm happy to see this packaged.
> 
> Can someone try to bump the libcamera to the latest revision soon
> please? There have been a couple of bug fixes/performance issues
> resolved that were quite noticable on the Pi.
> 
> In fact, now I check there's a couple more RPi patches to be merged soon
> so it might be worth getting those in first.

I can bump the version once you've pushed the RPi patches, but I see 
that you're the maintainer here in Buildroot so you should. Anyway it's 
not a problem for me. Only let me know when it's time to bump it

Thank you!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> --
> Kieran.
> 
>>
>> [snip]
>>> diff --git a/package/libcamera-apps/0001-cmake-remove-Wfatal-errors-compiler-command-line-opt.patch b/package/libcamera-apps/0001-cmake-remove-Wfatal-errors-compiler-command-line-opt.patch
>>> new file mode 100644
>>> index 0000000000..11d19fa526
>>> --- /dev/null
>>> +++ b/package/libcamera-apps/0001-cmake-remove-Wfatal-errors-compiler-command-line-opt.patch
>>> @@ -0,0 +1,25 @@
>>> +From 22096ef8cfb18563c1955145db24742081910e10 Mon Sep 17 00:00:00 2001
>>> +From: Peter Seiderer <ps.report@gmx.net>
>>> +Date: Fri, 5 Feb 2021 18:24:08 +0100
>>> +Subject: [PATCH] cmake: remove -Wfatal-errors compiler command line option
>>> +
>>> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>>> +---
>>> + CMakeLists.txt | 1 -
>>> + 1 file changed, 1 deletion(-)
>>> +
>>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>>> +index 4191245..199a0f6 100644
>>> +--- a/CMakeLists.txt
>>> ++++ b/CMakeLists.txt
>>> +@@ -10,7 +10,6 @@ endif()
>>> + set (CMAKE_EXPORT_COMPILE_COMMANDS ON)
>>> + set (CMAKE_CXX_STANDARD 17)
>>> + set (CMAKE CXX_FLAGS "-Wall -Wextra -pedantic -Wno-unused-parameter -faligned-new")
>>> +-add_definitions(-Wfatal-errors)
>>
>>    Why is this patch needed? The only thing that -Wfatal-errors does is to stop
>> compilation when there is an error, instead of trying to continue and find more
>> errors in the rest of the file. It's not -Werror.
>>
>>    I kept the patch anyway because I didn't test without it.
>>
>>
>>    Regards,
>>    Arnout
>>
>>
>>> + add_definitions(-Wno-psabi)
>>> + add_definitions(-DBOOST_LOG_DYN_LINK)
>>> +
>>> +--
>>> +2.30.0
>>> +
>>> diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
>>> new file mode 100644
>>> index 0000000000..08667eb830
>>> --- /dev/null
>>> +++ b/package/libcamera-apps/Config.in
>>> @@ -0,0 +1,31 @@
>>> +config BR2_PACKAGE_LIBCAMERA_APPS
>>> +     bool "libcamera-apps"
>>> +     depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS # libcamera
>>> +     depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
>>> +     depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost/libdrm
>>> +     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17/libcamera
>>> +     depends on !BR2_STATIC_LIBS # gnutls/libcamera
>>> +     depends on BR2_USE_WCHAR # gnutls/libcamera/boost
>>> +     depends on BR2_PACKAGE_XORG7
>>> +     depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libepoxy
>>> +     select BR2_PACKAGE_BOOST
>>> +     select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
>>> +     select BR2_PACKAGE_JPEG
>>> +     select BR2_PACKAGE_LIBCAMERA
>>> +     select BR2_PACKAGE_LIBDRM
>>> +     select BR2_PACKAGE_LIBEPOXY
>>> +     select BR2_PACKAGE_LIBEXIF
>>> +     select BR2_PACKAGE_LIBPNG
>>> +     select BR2_PACKAGE_TIFF
>>> +     select BR2_PACKAGE_XLIB_LIBX11
>>> +     help
>>> +       This is a small suite of libcamera-based apps that aim to copy
>>> +       the functionality of the existing "raspicam" apps.
>>> +
>>> +       https://github.com/raspberrypi/libcamera-apps
>>> +
>>> +comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7 and needs an OpenGL and/or OpenGL EGL backend"
>>> +     depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
>>> +     depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
>>> +             !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
>>> +     depends on !BR2_PACKAGE_HAS_LIBEGL && !BR2_PACKAGE_HAS_LIBGL
>>> diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
>>> new file mode 100644
>>> index 0000000000..da426434c1
>>> --- /dev/null
>>> +++ b/package/libcamera-apps/libcamera-apps.hash
>>> @@ -0,0 +1,3 @@
>>> +# Locally computed
>>> +sha256  9b3475e1c817cbcf942c4be0dac3d1f6bf2ee192b0ca5edb95c85c06c5a12b4f  libcamera-apps-326fdfd120a0f62b7e76f4ee8aa0c82c2bf008e6.tar.gz
>>> +sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
>>> diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
>>> new file mode 100644
>>> index 0000000000..5edcefefad
>>> --- /dev/null
>>> +++ b/package/libcamera-apps/libcamera-apps.mk
>>> @@ -0,0 +1,25 @@
>>> +################################################################################
>>> +#
>>> +# libcamera-apps
>>> +#
>>> +################################################################################
>>> +
>>> +LIBCAMERA_APPS_VERSION = 326fdfd120a0f62b7e76f4ee8aa0c82c2bf008e6
>>> +LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,$(LIBCAMERA_APPS_VERSION))
>>> +LIBCAMERA_APPS_LICENSE = BSD-2-Clause
>>> +LIBCAMERA_APPS_LICENSE_FILES = license.txt
>>> +LIBCAMERA_APPS_DEPENDENCIES = \
>>> +     host-pkgconf \
>>> +     boost \
>>> +     jpeg \
>>> +     libcamera \
>>> +     libdrm \
>>> +     libexif \
>>> +     libepoxy \
>>> +     libpng \
>>> +     tiff \
>>> +     xlib_libX11
>>> +
>>> +LIBCAMERA_APPS_CONF_OPTS = -DENABLE_COMPILE_FLAGS_FOR_TARGET=disabled
>>> +
>>> +$(eval $(cmake-package))
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
