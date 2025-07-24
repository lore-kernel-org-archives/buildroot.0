Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3347EC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 03:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABD7360FBB;
	Thu, 24 Jul 2025 03:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zq27FRVTfgum; Thu, 24 Jul 2025 03:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B4F261020
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B4F261020;
	Thu, 24 Jul 2025 03:15:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E647DA
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 03:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04BC941765
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 03:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0O36N9QfZal for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 03:15:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E0C841763
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E0C841763
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E0C841763
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 03:15:11 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ae36dc91dc7so75231666b.2
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 20:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753326909; x=1753931709;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rmgsGKFF5dTp4eFOYMZPST35L/dnMDjfmw+VKV7xH4U=;
 b=hbEyYAPIVU3ulR1e05Na78zrKNxACESL/nZLjglccTrfovIRmaL7eMq4QwK6NAEM2F
 h1aUN3AOtEeokxmNGNPwnH3hVm1GHL+v+GW/W44ucGjI7i9WOfDCJDYe0SJpnU20TnyA
 U2lbdrwZHA0t52dhHXPy+g/9Z8Y0HlvRwBnwtaN18/2OA8jGDviyaqQun00k8KcyRDFX
 Xm/BIDsfJtTjy5PZuAUPR16M1i4+S5uEPmHe4EzhElkydUBWBOhkfdB3UO5zlVvP+x2v
 dGRun7e5du1XMyYlPJTTYwk1koqNdxMGwdBsiZ8T0aRPeINeLqth8xIO0wKApGwDZDwm
 II0w==
X-Gm-Message-State: AOJu0YxqRUroLuI8+La5kgQrfMd0Fn8oPKroU8MefwUbZC2tzS+i/LK+
 KoECvQmJ8kw2kEnqOG7XBhP4Nuh302gbYfQQ7JRq+2rr4jegmcF+Mgm11Ej5DA==
X-Gm-Gg: ASbGncsdRfh8c3PQ5aN2r8xq98u1PxbcZ+Gu4mSElY08yCaHUxKLjj+PxD7zEzs9TKl
 EqGy4M5QHy9ds1gW+vZU4FcGHsG/LDhJJGwS3bvKmB8TsXT+nQEjCkeLyj9D70+Xb7pj/eo40mq
 y8B6UxkqUwjsTEbuEamcY0r1f0f39bpU0oSxoEmQwaXcsrlc9e7bqE4n+8h6r38RHOoffgj/0p7
 mr7OMN0cGpgsEwLHUp5u3FXdM7faDpE/6urYzcTPdWk+viBDFASJIBHFt54CBaPE5GU74CsnM6z
 Ik7k80WWtzUs4SJxhovdY8XBMyhkf+J3eFmCQEQIJehWsPR5y71KafjJ1WAS8sFGhBR/sHpKuxx
 xAAa1ZrhDRig/clxDx7RCALRxfoaeZ3Kz9J+T
X-Google-Smtp-Source: AGHT+IF+f4ih4q5sP4Naw+VQNpWRQ8qbF535AQWz6pY+IT2RF4rr6Pd/NLBsldzJOjiGFopez7drng==
X-Received: by 2002:a17:907:3d12:b0:ae3:cab8:d9d8 with SMTP id
 a640c23a62f3a-af2f8d4b759mr582604066b.41.1753326908576; 
 Wed, 23 Jul 2025 20:15:08 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af47c58bb5bsm44298666b.20.2025.07.23.20.15.08
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 20:15:08 -0700 (PDT)
Message-ID: <6881a53c.170a0220.2e0790.15a7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 24 Jul 2025 03:15:08 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753326909; x=1753931709; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rmgsGKFF5dTp4eFOYMZPST35L/dnMDjfmw+VKV7xH4U=;
 b=c/SOD3nUCrIUNQk9FQu8xVoOpXTSKq3Cd2NR7JxjxrrDSWbdPmYfWS5eiBpnyfuxKF
 OrzLe/OULNEzgqsrQHlodmSb3/YGvAa01xW4B/zszcxgUDCwSY3YX4YboQh1mvTNO8er
 nB8tcXkp0qqQw3M5HC8ULn+ynAMLEHS/0/luH+RMfF6whYILnGwtVhGKWQp/IpFXv4pr
 8yvg6jC2dIM8JEpNkqsnOXJoYyM33oaCkww9w+ABKCc3PVwRY6ofJRsvubNDEEw1bck8
 7O3SZw0F6UMYvg7ohyCD1pMy3Rs02Q8ebyLEkuuwI2nNmZb6BvDyBeAoJJ1nQyvwOjAW
 DC5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=c/SOD3nU
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-23
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2025-07-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  3  |  0  |  7  |
  2025.05.x  |  3  |  7  |  0  | 10  |
    master   | 17  | 388 |  2  | 407 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 40
              libselinux-3.8.1 | 23
                  cjson-1.7.18 | 11
                   bash-5.2.37 | 9 
       host-gcc-initial-14.3.0 | 9 
                  linux-6.15.6 | 9 
                    yajl-2.1.0 | 9 
                   avrdude-8.0 | 8 
                       cfm-0.3 | 8 
host-binutils-arc-2023.09-r... | 8 
         host-gcc-final-14.3.0 | 8 
                    gpm-1.20.7 | 7 
        host-berkeleydb-5.3.28 | 7 
              libopenssl-3.5.1 | 7 
                       unknown | 7 
               bctoolbox-4.4.8 | 6 
             dahdi-linux-3.3.0 | 6 
                liboauth-1.0.3 | 6 
libsvgtiny-ea9d99fc8b231c22... | 6 
                   perl-5.40.2 | 6 
             batman-adv-2024.4 | 5 
                   cvs-1.12.13 | 5 
                 host-gdb-14.2 | 5 
              host-json-c-0.18 | 5 
         host-mariadb-10.11.11 | 5 
libdbi-drivers-0bfae6c43134... | 5 
                 apitrace-10.0 | 4 
               host-vde2-2.3.3 | 4 
                 openal-1.22.0 | 4 
                    azmq-1.0.3 | 3 
          host-binutils-2.43.1 | 3 
           host-doxygen-1.8.18 | 3 
                 libgee-0.20.6 | 3 
                libkrb5-1.21.3 | 3 
        liblog4c-localtime-1.0 | 3 
                 logsurfer-1.8 | 3 
                  prboom-2.5.0 | 3 
             util-linux-2.41.1 | 3 
          aardvark-dns-v1.15.0 | 2 
amazon-ecr-credential-helpe... | 2 
               asterisk-22.3.0 | 2 
             berkeleydb-5.3.28 | 2 
                 expect-5.45.4 | 2 
                     fd-10.2.0 | 2 
  ffmpeg-n6.1.2-27-ge16ff06adb | 2 
       freeradius-server-3.2.6 | 2 
            gettext-gnu-0.22.4 | 2 
host-am335x-pru-package-5f3... | 2 
             host-fatcat-1.1.1 | 2 
                 host-gdb-15.2 | 2 
                host-odb-2.4.0 | 2 
            igh-ethercat-1.6.3 | 2 
                  jack2-1.9.22 | 2 
                       jose-14 | 2 
             libapparmor-3.1.7 | 2 
                 libmbus-0.8.0 | 2 
                libshout-2.4.6 | 2 
                 libsoxr-0.1.3 | 2 
        linux-headers-5.10.239 | 2 
                    mpir-3.0.0 | 2 
                   nanocom-1.0 | 2 
            netstat-nat-1.4.10 | 2 
            python-yarl-1.18.3 | 2 
                    sdl-1.2.15 | 2 
                setserial-2.17 | 2 
                   thttpd-2.29 | 2 
              xlib_libXt-1.3.0 | 2 
am33x-cm3-11107db2f1e9e58ee... | 1 
                   atop-2.11.0 | 1 
   azure-iot-sdk-c-LTS_03_2025 | 1 
                    bat-0.25.0 | 1 
                  bcusdk-0.0.5 | 1 
                  cairo-1.18.4 | 1 
                     crun-1.22 | 1 
          cryptodev-linux-1.13 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
           dmraid-1.0.0.rc16-3 | 1 
                   duma-2.5.21 | 1 
                  dump1090-9.0 | 1 
                     ed-1.20.2 | 1 
                espflash-4.0.1 | 1 
firmware-utils-86739f2b3ae9... | 1 
                flashrom-1.5.1 | 1 
              graphite2-1.3.14 | 1 
             gtkiostream-1.8.0 | 1 
            host-binutils-2.42 | 1 
             host-flatcc-0.6.1 | 1 
         host-gcc-final-13.4.0 | 1 
              host-guile-3.0.9 | 1 
host-mxsldr-2793a657ab7a224... | 1 
               host-runc-1.3.0 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                jemalloc-5.3.0 | 1 
                   libcap-2.76 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                 libgsm-1.0.22 | 1 
                 libiconv-1.15 | 1 
                  libjwt-3.2.0 | 1 
libmodplug-d1b97ed0020bc620... | 1 
             libopenmpt-0.7.13 | 1 
                 libpng-1.6.50 | 1 
                libressl-3.9.2 | 1 
                libsepol-3.8.1 | 1 
                       libsrtp | 1 
                 libv4l-1.28.1 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
             lirc-tools-0.10.2 | 1 
                 mdevd-0.1.6.5 | 1 
                          musl | 1 
                     nvme-1.12 | 1 
           oath-toolkit-2.6.12 | 1 
                openssh-10.0p1 | 1 
                openswan-3.0.0 | 1 
               pulseaudio-17.0 | 1 
                python3-3.13.5 | 1 
                 rtptools-1.22 | 1 
                   s6-2.13.1.0 | 1 
                s6-dns-2.4.0.0 | 1 
     s6-portable-utils-2.3.0.4 | 1 
                  snmppp-3.5.1 | 1 
                    sslh-2.0.1 | 1 
                 systemd-257.7 | 1 
toolchain-external-codesour... | 1 
               valgrind-3.25.1 | 1 
                   wget-1.25.0 | 1 
                    wipe-2.3.1 | 1 
        wireless_tools-30.pre9 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/ae3514afe0107c6b0ac5e89879e104460d455eda | ORPH
    arm      |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/f1f97ea07d0bf180b39548b284d63fe289b26826 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | https://autobuild.buildroot.org/results/57e78bf5e81be4b37dfc5a2da97f92e13c5024c2 | ORPH
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/f3ae24a207c8a3a44688b9850482225e356cff29 | ORPH
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/6a48f81e4a2529daba2969231dd4ce652f1cb7e5 | ORPH
   x86_64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/27d741d1bddf694602fd096ae6065c526c3d8a4b |     
  mips64el   |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/ea7b7316705c9fe7226915645addd4d339a0e34f |     
    i686     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/c3e5f8cca20524d1daf6783a146dda7fdabd7eac |     
microblazeel |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/040b8c8a7ac06f8847a3c83704433b93f407754a |     
 aarch64_be  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/dd4fbe32cc4aee3c105239caf80a98b7cc27ee25 |     
   x86_64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/4e78b6bdcb604c26a5bfd77fc50d0193294187c4 |     
   sparc     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/005d57006e12e3e91dc212306c4082822fff0963 |     
  mips64el   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/57e2b303c9e782cbdf13363598dc7e466f8393e2 |     
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/18dc4001b5961aff9447f54ba0d43018bcfc519c |     
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/0867e44a5f28e5fd64b59952c3bab8f8a68637ed |     
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/58ae60cfd9ed035090de98b30e49bd026286f335 |     
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/dd6f80ad4a5e8b56ca14b1990f54c2c59aaf6658 |     
  powerpc    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/15480b44e622b5af8a91e36e7214dfcbff14f36e |     
   s390x     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/f51656b6ec1cede342d490060ce33437342d7881 |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/fad98a9aa60e6b5c29ec0ee7f4ab661cda1080d5 |     
    arc      |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/4d3f882e4eea012dbde24e0e1def44707917e72b |     
 aarch64_be  |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/12aacf335dc47b49140affef053006719d486f59 |     
powerpc64le  |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/bdc29aa692e3315b6eb804d678c63315c46e3f7a |     
powerpc64le  |  azure-iot-sdk-c-LTS_03_2025   | NOK | https://autobuild.buildroot.org/results/3047aa44fc6beef2e90dcba6c88b5dba8522cd80 |     
   sparc     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/f3dbcbd061327a0cb8bcfe892d91a916bb121be8 | ORPH
    or1k     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/1aed0396e14629fdc0c6dfc594dbbc7d5cd5d54d | ORPH
powerpc64le  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/9b9d291075b1e2e822cbabe35d5c17723deebce0 | ORPH
powerpc64le  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/51299cb9e5de14b52e7b3c803989e8940b0956c8 | ORPH
    arc      |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/cf4564518b1cd64bb5b6fced38dc79b2868fc0bc | ORPH
   xtensa    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/b66cb70f3ac1485d9307ef0d899a33a599fe2c29 | ORPH
  powerpc    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/9a42cd61177456cbba0e2366c7c66fb86cc6da1a | ORPH
   xtensa    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/e86f92ffade87a1d3a45582f7224e7a33ed20392 | ORPH
  mips64el   |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/8baf0ebfa922d3ada1618896720dfaa3a70c5f11 | ORPH
   x86_64    |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/1e3641923afed141acf9737784aba7382e8ce496 |     
 powerpc64   |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/36bb65e7b26790a59cad1dfdbd982efd6a11f35b |     
   sparc     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/7146458e5013a6c4631124fbcf62c97b7840c398 |     
  aarch64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/d5990570fedede6775cc5fcdc1f05c3993b4d445 |     
  riscv64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/73aa00e7f6cfadde43d4111aba4c43d78eaea41c |     
microblazeel |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/2663f591423f556f3280ca3636c3567e8fca49fc |     
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a18c4dc744d73da12eb5638cb08d9b2048d01cca | ORPH
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/b292bcaa0ed3db721255f7f96615a7647553935f | ORPH
  mips64el   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c1ffbde4a51a8ecbb6a34d976441b4d26f7906dd | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0604498123fc62e83825407d72069f918ed803e9 | ORPH
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/b3507f23ea2c0b69d1f0c1ca34c049532153cac7 | ORPH
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0299feb0858fc3e50e754c9d5114715dce7394fd | ORPH
   mipsel    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/5e455c1ccce441c008e461c30d9979bd922530ff |     
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/ea2c3c72f9d1e25d945d9cde8373702f5ce10576 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/7178a71637cd70465a38c02283a34af7b6bd3471 | ORPH
  riscv64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/c3cfea39f356826267f8e3a7506ab783223917bc |     
    arc      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/1edb6b428f808fe84e6a2f353c10aaded1649bf0 |     
   arceb     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/289eeeabc8b887b852d4fe27c96a76c3af483dfd |     
  mips64el   |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/5c1b5d36323ef80eaeff872e4f30efeaf347ffb6 |     
  mips64el   |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/e6b99b54a08d3dc73a9b7f913749173c47381cdf |     
  sparc64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/4c28df0dc344b7d7d3cffa4d2bb34d4ee566c6f8 |     
   xtensa    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/46618d96a27d00f80ee559c09ff2f8638e9ebd63 |     
loongarch64  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/849190a3ef1275edb1b11835a06a35d4c43101c1 |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/e8426cb81e1b89bf48e314f9b5f6e36694ca82b3 |     
    or1k     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/c0f1c14f94977f47c2269c9cb1f1e3b156ba82bc |     
 microblaze  |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/bf676af33d5a9172db4fbaf838a036f70ded05ca |     
   sparc     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/c9a9f9f5fc63675a6a5d89e556d551ac6848b785 |     
microblazeel |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/2cd750d0360a65a2829d3631c648ccd81b92529d |     
  mips64el   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/9e52e55cd547fad2a9275692ea61ebc1fed4098f |     
  riscv64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/64c4bd1420128cb77ed11587a089ab8d0e7f1180 |     
   arceb     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/cbf803ad9f2c18989cef58ad2d92290007622437 |     
    i686     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/a9d6d6f5eb4861eb143735a87428f9b65efad81d |     
    mips     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/c90068f7aa654a268864b4b528d8a315268d4b3d |     
powerpc64le  |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/b2d588c0408e8d0b38d9a33e0ecab99ae8dcd92e |     
    sh4a     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/9b3e4ea87773a4a6fc5d505e8dd01ff5f8574f7e |     
    arc      |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/faae9b572c351f0a7e8da97060aa80e536c23e1d |     
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/22ec7cf068c5759ffca5b743e044f41c9e23fc95 | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c6991652b4f1886cd0a88350de9fabb2f39bff90 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/8c54d5433e1cf74b166965430a55a9e0b3f9b9ff | ORPH
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f77ebbfe61884735553a2dc078f7c121050a8d6a | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/66858b6eeedde045f0b3df663861e4ffcb81cd79 | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b547727920d5c44c6ce0af3ebeec5f21690a2d61 | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3e52968d3eae36dd49a1d93a21c6c6fa20dbf228 | ORPH
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9ef8f007c86cd081e05ed6ecc20fafb8db56dffc | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/10836d97b6745e09699623c1d2f7aeebdfd3cd38 | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c7790df131002b28db4eb9e651cb62a62972acfe | ORPH
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f43bda554383d182e1884a57da49e518d1012190 | ORPH
   xtensa    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/60253d4cef11394f2c3f0789a27ee443f3deebab | ORPH
    arm      | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/2cd599c7de2502cec4aab5b2445186e62b15f9e1 | ORPH
 aarch64_be  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/27bdb023c09c2c38a80715358febb6c8382a44f7 | ORPH
    mips     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/b87bcbcd952939456019f7c15f7ff707f69bbbb1 | ORPH
    i686     |          dump1090-9.0          | NOK | https://autobuild.buildroot.org/results/4addf9cbefd2d56a18ed8d9ca5cc0e017bf33d26 |     
   sparc     |           ed-1.20.2            | NOK | https://autobuild.buildroot.org/results/53f58f944da4342be4c92dd60821f688393b3443 | ORPH
    i586     |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/35d984fe22998d64b2e629d0652d9179604ec73b |     
    i686     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/779532b06f1328f4e7103c747c9277db5d95bdaa | ORPH
  riscv32    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/b2197e0551272f58410813b538411512647d64bf | ORPH
  aarch64    |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/0558df163e4c9bbe851af6a29c9d297362165a8f |     
  powerpc    |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/db4af38f4f3cdf12d2fdba208557d2e37cea6a94 |     
   arceb     |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/d1ae64c884599cbfb785d16de9576e85712c1fb2 |     
   arceb     |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/ddba7e8eb5f5b1931f9c9af985845e34ceb53a29 |     
   mips64    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/2685ab0083b1661a4118e23aa7d5685a68231c62 |     
    sh4a     |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/d15590d10b741b2954ede56e307ef796c68e79fe |     
  powerpc    |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/5a24588b929008f15234c7395989af5ee899767e |     
   s390x     |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/bb59132b0aecc2940ef885d9f30bb5a080c67dd2 |     
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/a2be51a6d62c52e90a6c771e6a13f8deeb051ce9 | ORPH
 aarch64_be  |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/5d972a94e3aa8924b35b71c8d3092728356d9601 | ORPH
  sparc64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/5376ec12f86ea9881c9cc8428a8b934cd93364e5 |     
powerpc64le  |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/ca229162483ca8c5d621904eeaed50fa72c3929c |     
 powerpc64   |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/a02cd02afe82f9ae43ef358dc90e84c8ea170fa7 |     
  powerpc    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/6f27e38611b7e6d994bb492d1535bb8963e8af4e |     
  mips64el   |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/4ff96f4a31f56a72d65eea0e99e55d1ebc348ff9 |     
    sh4a     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/65bcae0bd817b83393050b0d0e9067cf88d9bea4 |     
  riscv32    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/f353539cd2bc5c276c277c820b9dc16299212dad |     
   sh4aeb    |        graphite2-1.3.14        | NOK | https://autobuild.buildroot.org/results/1e8a65df833b2d0db5dbf9b34990396b53e878bd | ORPH
  aarch64    |       gtkiostream-1.8.0        | NOK | https://autobuild.buildroot.org/results/3525f1d2e1ddc4d516c99a47e8c59bc0ebc91653 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/b511c636034537a82baaa0b2001a35d0a0a7c1df |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/2f2cc3282939660b4567c5d902588e29949ef734 |     
    sh4a     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/020dac8ea9ebbe81b74f60e510dc3d184dd4d5a5 | ORPH
 microblaze  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/efd2b939b21233572ed029072d318fb8b38d0617 | ORPH
   mipsel    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/993bee53625112a505fb1bf2e6333d4f7dcf244d | ORPH
   sparc     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/15eae52bba8b0650daf2f51eefb245e37851c550 | ORPH
   s390x     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/d2e30642aa11cf269eb3d0854efa0db698b2d639 | ORPH
powerpc64le  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/11349dd1d3653367771c9619e112d2c17bede422 | ORPH
powerpc64le  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/6d2ffba9f487e582e9d786d3694f2cdeb72de54e | ORPH
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f2c563e83bdf0842321ed25762e38dbda357785d |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2fdd5690b53f054107747a21ff6bf60f314b7891 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/aedc9ca952c059b3df7e3e124bceb887a2dd07d6 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e91870e7608a2a6c933519d5ba2150ef6010f45d |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d039b35d5a5835e5e053bfeedfd04cde4bf0759c |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/731b8e8217f8eb1458d1d602eace88695ba4258b |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/9af11e9b3c56f1eff9927ff2a8b115dd35955846 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d4528f783e38559cc1beed2b3d2f902f0ae07024 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/6c3a6846320419b982485660164572ca1d9ef5b4 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/4f6a863fce64021b3188ca61415e0ab89b633c26 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/aa7059223526179ccb989dbc8587f9e377a56c0d |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/6652956fdddc4639f2a9031bd96c533c7767560f |     
   mips64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/fb8c6af5093957cf5a98ce6e3042099e9dd1c4e7 | ORPH
 microblaze  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/7b53f5bbba538502842844da5ca4712272cf0785 | ORPH
   sparc     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/5840fbbfaeaf515c1b41e1cb669f80b5f2ceff68 | ORPH
   xtensa    |       host-fatcat-1.1.1        | NOK | https://autobuild.buildroot.org/results/f7423d1dbafbfe970042cb4d1133488b7f61dd2e |     
   mips64    |       host-fatcat-1.1.1        | NOK | https://autobuild.buildroot.org/results/e717f0c6bb01cad1058313c58e1ad4f05d481347 |     
 powerpc64   |       host-flatcc-0.6.1        | NOK | https://autobuild.buildroot.org/results/e77e307656ece3a4de488176cc759b8ecf2a53bc |     
    i586     |     host-gcc-final-13.4.0      | NOK | https://autobuild.buildroot.org/results/a6c4484e8ae718f4cb3dc9941c9d67ad12d7160b |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/38ca843da300ed9bcf5d578007cdb0afd62b8149 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/2f8dd5852a8d1e77de4f63c22987f3beb2ead866 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/78e6d4c5ecb0b86e74027e093a12c21a4d92c351 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/5a933f49978b88c46f874ebf642cc5fc01288ab4 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/0f03fd00e42edf0851b0223339399c38ec6b6bbb |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/a46d4d51e3d3706db121c79fcb29def996ac80ae |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/703a52749c56e49bb7a0fa1ac07fe3ae37d3b880 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/c2c3e4df9e06dc4530cdb1211761d846f006bc4a |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/4f5426f3704f74645150e4ae27dd0978763fa0e2 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/ba1330e395f945b8e86984872a0b65928cea9508 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/533e83ad614691b4fa39605677d50e6b2b9a90af |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/34fbe0b6413559bfecd89aa6621d56b614ae592c |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/a5a6ef8ae33fbe7fd1d5c8e5fafb8a3341def990 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/404fb6c215a3362ee403e4a0b8302baa7d17e359 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/13f649b6cbbfbcfa20610d5f0e1f8dabf310823e |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/c76c67450f659242ddde7232aebb599cb03b1038 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/0ed15e5c1e0c23d5f62b049c76293f9060aa7865 |     
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/399b9db25dd4b504de6c3264f6d639bf08a1bca3 | ORPH
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/eecd8e571e042662683093986cd07216d099e4b1 | ORPH
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/25fcb04465b4922bd386f739112074de433b1f5c | ORPH
   armeb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/91110ebc4900a4e8c9f89e6f5ce252a50d56bb5b | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/28da4b04b632c89990a3568e1d0cf61548b5cd36 | ORPH
   sparc     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/ff22b32a004e356b0d8645ef4d74ea1cbab28a0b | ORPH
loongarch64  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/b1420f87e380d4a83aa84ad1a89231134a756f18 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/911befc392cee7c1327483272facae5f2c21a0d4 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b185b67eaeac74983184fb95110b375a1c0d6bd9 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/35cc2e78b948acc83e6e82f5878017e95fd430fb | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3ced7ab526d3ca025556e5babcba1a78f552683c | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/69e465a8d498f3f8ea4789367ba4c8b4551beceb | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f5abd669495f56741e09fb4279148ca8e45b4841 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/920827bf953360f3eeda591363d3cbc18cb51e33 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7bfcbd5ab1f83cce283b0350abf054d4fea5592e | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3d1c4cf80e4d0e8c14ce212779f0a7b21bc508a0 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5112d4798e41f6062adb304c2616614c839e9c21 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/00431a24c327fc5f888ec02236661358da3f0b23 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/216154016efe56a5daf301745c98ed9f72957d51 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/48cab25f9696c7bbfe39305354e8449449fe84eb | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/94a294389d76e98c08611d5c23156fc027826f8b | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/decb4b3688d8e23eb6846702abdc97eead39b56a | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5918fdd614758d6a7f9d0ba1013de659db10a6bb | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/aa3354316ecc9d6d728f762ab0c1b6e445979595 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/933f242ba920df70bb2d273845ead1651947715a | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a900cee1fe35911d18e2e7066d1c0e9a7335ec73 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/23deb85a3d3b98a242275534e1f29928c98a2f5e | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0fd663ed15c7bf318de5ee37b57fe15c5679165e | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9652100053be49715315ef33d68c09737a82deac | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1116635bfccf2a3ad2527e8f854fc6fd64e65c13 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8eda5545b5e962e85455aab0aa40c0e79c5b0232 | ORPH
   sh4eb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b0ee4cb4a528d459b26a61447581d413d51057ea | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/85a763379845dd85fe66ba780fa3d78353f8397a | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c94d31d4f96c303be94624209affacb1da94f804 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7cc2c2931bededab7a63ba7bc9ab356fe1b10903 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6baef5879d665db8aaf1559902ccf3b4b89e35d7 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2cd32440a9ee2f533f360a0a533a5d11f4a22e03 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2f168f353ec64122365fbc81c292e545d75008d3 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dac701e4f40df550a7315fd36c8eb2d6965c5102 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ddef6d4a4f13bb8695da36dc25abb590d70ae389 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ab2521be6d0c03cbad23890ad1a2cc5c27456d8b | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/177f6421a12bf6399c0a6aec21947edbb04ec5ae | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/520f5dc315dcf8559012e43d662df518a8c37120 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/86d95c890e6e1b8c6b004edd9deb65e3ebca0910 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b3424ffcc09f9115c2b2d4e8713c75fdcd35fb30 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b857b08c6f1c3f24c52d033ad61ffef2d21ebd5d | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/25c2a0f59a9ff9e68a1ffc186ba5065e96bc57fb | ORPH
    arm      |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/44e57ca9f87efba1e1c1b4ec7e84f888dd4a5610 |     
   s390x     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/3a339124e2d26f929e4aea36acd9b9c4663f6049 |     
   armeb     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/a184ec7eeaef0c9e892dd4fed8a45313167855f8 |     
   sparc     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/8217067405cca6cc5c807f9ce082c847cdafbc84 |     
   xtensa    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/b51332dcb23cdac7fdb90392080e762f7025a75a |     
loongarch64  |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/5bc6f167ee5ae9fc537f54229b254136d8d1596b |     
microblazeel |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/fa64dbf8a13d7d8276ee702618c890a38528b4ab | ORPH
   sparc     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/676142a564ee939fa987104eb40183d602e37349 | ORPH
microblazeel |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/1e017b7b319a1a9a0b215f9ae4b053efcbea71e0 | ORPH
microblazeel |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/4d43eee45cd28a8fd943897a8aa4565189d0c6cf | ORPH
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/c43e7fc20bf48ea7a2487bcf3bc3e6ae0cca1d93 | ORPH
   armeb     | host-mxsldr-2793a657ab7a224... | NOK | https://autobuild.buildroot.org/results/1a71c3895132122b8ddb7475840e7ddcc277cb77 |     
microblazeel |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/8f38f14c0936de27f0e0a4fb2038945dda05b124 | ORPH
 microblaze  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/7b1f9fa0db5c9026f78e22d51f2c9bb0671ca4a8 | ORPH
   x86_64    |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/3f596fe3d7141301c555ac83e767e470e9254f60 |     
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/5a36ed0de03fb7bf9ceea58751799b4876bfd3b0 | ORPH
   s390x     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/fc61ad5a17f5b67e62409740360ef3f1c589d2c1 | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/08b2ae023e78e5fe2e7722e409c51dd83280d6f5 | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/2a2d0165463338119ce06a086384afd9f2f03127 | ORPH
  powerpc    |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/b8bb21b20eb67f0498fab3285864d62b85d7340f |     
   xtensa    |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/2299fb45252412484bba948d90ddd4b041ffa7c7 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/0b590349ee0eb6707b65d960837d82ab6fcee718 |     
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/41e8bb226e7f102c55bc994a546c1d07fec40f28 |     
  aarch64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/5e5f6d993e7463ed2fce974e6202dada1e1b602a |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/b78187e7d2a2ea769b8658286e4a2ecb8451bbd4 |     
    mips     |            jose-14             | NOK | https://autobuild.buildroot.org/results/8de8578f6948176a86004e44fbf31e116f542357 |     
microblazeel |            jose-14             | NOK | https://autobuild.buildroot.org/results/40ac95d7227c0010d2f9f5ac837af14629d98267 |     
   mips64    |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/bb4d8deb5e9138e2fbea95b96ab7241360a9a6bc |     
  powerpc    |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/c1282191c05a8a7095eacb321eadf80db70ed8f5 |     
   arceb     |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/3d6ad82145fd6ca67abd62ffac5f16b5dbc109d7 |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/45787a22270514008fc3f8d7f6b8e35838ea1ea4 |     
    or1k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/896b61383119b5dae43dcfca886fc43374f15780 |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/0d5064b321f9f03e1c6a8e9d0edc047deffbe02d |     
  mips64el   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/9663137d7a7d1e9b501da92ecd046b93aafb1c53 |     
loongarch64  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/1b252aa7678db5c9a1c68169d4eeb356b3e30aaf |     
 microblaze  | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/affcd972cf7da935e74cfb7743a718a2704407fb |     
   armeb     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/3e9a63bb60efa11fca44180aacba6d6a1e63c515 |     
 powerpc64   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/79525340dfcc1474fa8322e913b1264a72232539 |     
   mipsel    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/52493afe84d6384dfe3701125ef04ec3692e1465 |     
   sparc     |         libgsm-1.0.22          | NOK | https://autobuild.buildroot.org/results/be613f1c8b2140083d78fb6c67f29e23dcf27309 | ORPH
  riscv64    |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/f98000d7a28bc0d97b908e27bfc1333c85d2dd1f | ORPH
    arc      |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/246620cb10b823a37f129f361ed38d3cd3902bad |     
powerpc64le  |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/f8612904fde84a2a18366d08af6b2db48569eec2 |     
 powerpc64   |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/d915562bc2c1aab347079dc35acd338dd132936e |     
    or1k     |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/8fda8b4502e5420ea9944380f3f6a395405fbf59 |     
  mips64el   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/413e0ce3ea468c67ffa30ddae85eb4e5ccb64349 |     
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/9f02fb55bf87cd65a88426cb58cc8101755b2f49 |     
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/d3c78e22861d6b185b9bd159b45bb3c56006a39e |     
  aarch64    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/0594b0b4a645b579d7718b4d2555e0d33c5c347e | ORPH
    mips     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/70d022030f874e184d93c1191d0ada40d1f1912f | ORPH
   mips64    | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/0c0a54628784fea206e9b0db4ce2c9df54a7e1b6 | ORPH
 aarch64_be  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/55f8ae616ff2a3916c0df6b7f8759965702cdb21 | ORPH
    arm      |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/03df14e09807035a4a1f4cdabcc3d568973c044b | ORPH
   s390x     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/2222622af083bb66f2e662d82d4bb42c55f19ddb | ORPH
   xtensa    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/50bf021a914214535f4487c3cedd3bcd24986eb3 | ORPH
powerpc64le  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/cb1b59ee9ae6bf59521ce51e08cb7771e2409408 | ORPH
   armeb     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/e2b3966ca2c7edfc2ca8831b82fd434b2fa16b4e | ORPH
microblazeel |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/58d6ed912dd6177fb58bd108b68394a60794fb01 |     
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/094def76df511f9828935594de3a83b022b90927 | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/f1257487c8951b8d010e921c3105b5d21025fbe1 | ORPH
   arceb     |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/07bd347f8cf3b1f3155c87f4bcbca7ea8dcd5e53 | ORPH
   arceb     |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/da5c54e221512f922bc185c339317f9d680b192b | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/ac7e559fa8c112c95ef4b3684c9565cb5362ecbf | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/ae32f5a0f26fc8e5a1138c1da220bba50942a7dc | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/970aef7b207709c16ba25cbf68a78cddc86887f3 | ORPH
  riscv64    |         libpng-1.6.50          | NOK | https://autobuild.buildroot.org/results/aef0ff2109dca0690f6956e3b932784b6fc43aa1 |     
  aarch64    |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/bbd3f36f397e815c2bc37eded7766c768ef12414 | ORPH
   sh4eb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d4791183e72969aa081270bcd342f194bf3a6b3f |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d46215c4ff099c92f247e95d7cbfb856addf61b3 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8797f87db004e2b075989af1a7a70110e01f0b74 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/9372685affc2e4585501663b84184d1cee00c12f |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b13726f8233ffd6f6e57a3864e2fea03ee997613 |     
   mips64    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/18b8d5c8285c87da7555eb99678d66a123400c95 |     
   mips64    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/38e6d42ddc54e5444d7798aaa89822ea94189e49 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/bb5f60a53da58fb02fc241e0cf13e788a00680b8 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/da7a7d56b279d77a35e4b4e703a5eea97096ae72 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/75bf29ff370d8732ca841fcaad2ef8865992f40f |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/fe7d34f5cecc59bf021adfdb894596f7471a955a |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b6677aca3860ab9767614cf95c43936fe06f9837 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d95b21bf6e404e1da33a1e4a3815a931c4b02156 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/db0142d705be08909331670898cd9716c650650d |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d07b6dd06ffd4fbebfb967007a3a473e8005e21e |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d2f4ef8ca6f7462dc144bfe47e3e592e5b12078f |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3c1b7ba32e20959058d586de4fa64be3e9403673 |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8192ecdcbc816938446f677e50abdf2bf0881845 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/7accc4585c484096c212faa81f01551c9312bb05 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/7ee4b8c34ef5264bddb48e84e8916564acecce46 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8633243d59afaca59d5ded24430351a2aa33877b |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0f386990322bcf589377599ed6e6bde01e4e62d3 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5e66a2c7c2a1ae41c99ed03604ee95e45496a782 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/936455042675dae23e55803db3a31904441bc68e |     
   x86_64    |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/fa8e477a44d2f47b01a8175e24e83532faaa3052 | ORPH
  riscv32    |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/edd7fe32c7a652332ff7697c677a915496ceb13b | ORPH
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/84bccc48867e341b6e3a06618d91fa5fcd9d9dfc |     
   sparc     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/51f50172cc7a77cca36083119bde8280ec87b16a |     
   mipsel    |            libsrtp             | TIM | https://autobuild.buildroot.org/results/d9a05594a8805f7159e9dab02a866337a682645d |     
   mips64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/2874ff993e64cfc5bfbc9a254717924e22ba073e | ORPH
   armeb     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/a9a49950b61d104635965b244efafc177663131d | ORPH
    mips     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/669ab702544a9e52b83b8c39240e6a023b9924c3 | ORPH
    m68k     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/12e230977a7496c78d5b3c3ed5dedfc7dd87e100 | ORPH
    or1k     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/5fdf9d6760118e2ebc631f985fe3888a321950ba | ORPH
   armeb     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/c1796240c3b8665d606744aff2ffcf51d7b2aa2b | ORPH
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/820c6dedf1fbcc335c27cce656cf10014bef8dbd |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/42071fe170a80885a1711713b86bed5ccbb35de2 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1bd4684fc8e17565785e7b3d8f504a719640dec9 | ORPH
 powerpc64   |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/3f1c7bdd42bc30d73881010523a6379a3110977e | ORPH
   armeb     |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/960aa35cb1da8bce380f01f564e2d9d5f18d3f8e | ORPH
    i686     |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/b6abd799dd809db71457269cdb1437531c7cf32c | ORPH
  mips64el   |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/83210f1472a2d4f81330210c592232ee53160822 | ORPH
 powerpc64   |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/79c7632f507304e07db2e88e71faae8aa1a5e6d0 | ORPH
    m68k     |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/2c87d431d81f2ef6cd7b83b1fb26ddfbae189f03 | ORPH
  powerpc    |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/be55819e898f81bc641f6dfa154ab838369ff1bf | ORPH
    m68k     |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/548cb009af41e0a9da6ef29e37fb65b7c3e2a55b | ORPH
powerpc64le  |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/8091e10cb4ecfc96ea94ff048888547c416dcf42 | ORPH
loongarch64  |     linux-headers-5.10.239     | NOK | https://autobuild.buildroot.org/results/759443fcaa857f9eb5533ab8b82fd6a6bb485c71 | ORPH
loongarch64  |     linux-headers-5.10.239     | NOK | https://autobuild.buildroot.org/results/4526cc6c4e2cdb60b2c7301bf2cea66bb2eafae8 | ORPH
    i686     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/7b9d285c26e1f5b91d4ee7613e3a4d67ac187516 | ORPH
    sh4      |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/2e88d92e952d28cfaaa5063469d303e4ca605e39 | ORPH
  powerpc    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/60430334496ec69d0632cd2fc820536e807f505e |     
   x86_64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/cd09fa21aee2490d820eec0d6046b793b5b42d7d |     
    arm      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/560845ddb861dbabaa48fc9490908e27eaeba432 |     
 microblaze  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/f752265804f070908db4bec38486451e133878f7 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/4afb3b4f153231074a5a6bfd315308dc9d75d3ed |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d48873f9c089b2302127d737c270803b7f113e6e |     
  mips64el   |              musl              | TIM | https://autobuild.buildroot.org/results/e612a3b16095f5cffb1c7330ea3a7bf97dc0be51 |     
powerpc64le  |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/147a64af258d1eeb055aee517bcfabdf85870182 |     
  mips64el   |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/d89cd9cec4eaeaeb2d6e26dcccb94432b4d85107 |     
 powerpc64   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/a83755df717a50b56a08a1016c5919cbe91320d0 | ORPH
 microblaze  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/a158ebaa9700f12221a330e54662916a1bb5b1e4 | ORPH
    mips     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/057ecc3c36acd931c704e6975bd889abaa13e44c | ORPH
 microblaze  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/1e67e6809d97231ad4aa6197e608a0ee0e5ee9eb |     
 microblaze  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/7081626a1d08f6469f02128ea551ea45972a876f | ORPH
   x86_64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/211d1ddc2324c790d977bad189bc13e9cc95d390 | ORPH
   mips64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/6753aaf440e28202996beb03a2e180a2f721519d | ORPH
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/2537bf1aa9aa1f4208ab6d55cc2c613bf34f0907 | ORPH
 powerpc64   |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/428146c3042985062ba45c2b313cc24a7f3105f9 | ORPH
   sparc     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/488980ea2d8d470b1135b7212b699270ed4495c6 | ORPH
   mipsel    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/56591feed22e973f0b2071e93d7b636caf7c6962 |     
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/5fe27d78c75b9a37086fc6facac5048871c08505 |     
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/17e00d4e38312011effc7dbb5e2cf57412aa4ea3 |     
microblazeel |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/c92ea1cda5d933edc7f82f77fccd101176109d0e |     
microblazeel |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/d6849aebd2922d689c3773831f3153044c1e8a01 |     
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/7d591513285372ee7ef221665bab5bc04e2f5cae |     
   s390x     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/35184001aec8ab9cf34c1d326d85b9136f4ff204 | ORPH
powerpc64le  |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/4584c9054e0feee01218d220f2916feba8c6eccb | ORPH
 aarch64_be  |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/a2d51764a36094f8e2dc71f43ba69e56b7a0891d | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/6cc4b625869ff51f3b2ff6066e8c9204c73dbad6 | ORPH
    or1k     |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/982da0a98edaea3c12eb8358dedab4e0fda72462 |     
   mipsel    |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/804609d7e6a4855b0d34d20abb9306ff7a60a25e |     
    sh4      |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/65d48ef47ada74d56f93e52688db425a103a172a |     
  aarch64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/1b6dfd63ccf0278f7b5bdcb4739a85de956c9cf9 | ORPH
   x86_64    |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/a680d08a0e83bb791387ba2fbff0c9fe6d527925 |     
 microblaze  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/49583ed06ceff048b8fb79db0efd1d8cd34dbcff |     
 microblaze  |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/cb03bd2478030b800bbe9b88438d8f2cee51acd8 |     
 aarch64_be  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/d57d0faa8984938cb3a93ad803476f14892ae395 | ORPH
   s390x     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/9aa05cb24d19b51b62d61ab6d1b6ae9bf0ae6cd2 | ORPH
   mips64    |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/1164b9cb2ed7e12bdbb91765b300a87fb68942f0 | ORPH
powerpc64le  |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/1698805fe84b924025e66a14a4a33b39fca86694 | ORPH
powerpc64le  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/90ee90f60b65a9db5aa2ba2785955dc1d61223e2 |     
    arm      |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/a1664f119c827792895e4248b7324aff9b3fe38c | ORPH
    i686     |         systemd-257.7          | NOK | https://autobuild.buildroot.org/results/06018dbea69155561d9af3cfb20052d8c602d74e |     
 aarch64_be  |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/f3941e57a13fc77de1aa8a430dd9d1d97b683e33 | ORPH
   mips64    |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/17ec87eccbb23d6a2a76da29e2ff683a84201f26 | ORPH
  mips64el   | toolchain-external-codesour... | NOK | https://autobuild.buildroot.org/results/a865c0dcd6ffb593d59cfd0cc63f8f783234c091 | ORPH
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/f62ca5d8ab9c8c515aa22001699a28b9fe4fab3e |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/9ca2198a890037d7c3a98bd9bfee3b40edc5d894 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/de28ae9ef500c903752f2089e48d2c23b6c3acef |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/d8ed65073623df796285efafcb84f5b2b6b97cab |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/1aa5b6a6113372dff047949dc1cdba27e66f1062 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/b0fabd0456c2fc16e53b432aed2e8e56e9d60887 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/d50405d07534939dfce11cccf9cc6f0bb1e1f901 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/6b6460db67b30e91ba211d305b7edc4a6de698b0 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/2be80a789d5ce57ad4fc6105d2f891bcdae20c1c | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/6fa679406dd3179b8d278df6a2f58f019af1dc4a | ORPH
    i586     |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/a6442e38396d22a4e7bea66a80ec4089610b76af | ORPH
   s390x     |          wget-1.25.0           | NOK | https://autobuild.buildroot.org/results/076ab0c97157eeef16bc2a7048090a3385b7ddae |     
   mips64    |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/55c1bf0eeaf4162e4a230211eb524eca76d0a286 | ORPH
 aarch64_be  |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/e76edb10b208ffce9bc0489d4b6217c073a5c9b8 |     
   armeb     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/9a89802a513b63d72c8ca4fa168d785bc63cec24 |     
   armeb     |        xlib_libXt-1.3.0        | NOK | https://autobuild.buildroot.org/results/b2bbeb4c848608ff03124f4f249f3e79776001c4 | ORPH
   mips64    |        xlib_libXt-1.3.0        | NOK | https://autobuild.buildroot.org/results/40e2022a57170fd32fe9de1fdc042abb948288af | ORPH
microblazeel |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/abce8a6f2fb6d25a6b07ecd4b5637712e8b16aeb | ORPH
    mips     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/eba7993569b0a0412830410cd3d892144ba71f64 | ORPH
   armeb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/4d43297accab636df55ba297cda8f3218118bebe | ORPH
powerpc64le  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/a0cf146d071dae4be04e9f3ae7d7d9b27ba924e2 | ORPH
    i686     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/3ce4fcbe37e6956639d544aa12cd88e0e7fcde04 | ORPH
    sh4a     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/70de34f9772d4e7668215d6f281a6e0079a50a5b | ORPH
powerpc64le  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/e4ad9993b85dc0e26e509daf1f09dd48924a8f23 | ORPH
    m68k     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/642171f0dd36f8a77a5b0cc9ddccef4d0fdb0242 | ORPH
 microblaze  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/432fe12d346fab87de65d16af927c81c8e581ad1 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  libsepol-3.7 | 1 
        ltp-testsuite-20250130 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/24a882692396d422c7c8babb37d960abcf270d28 |     
   arceb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/3390faf2133f05a1aecea76b527fde89871d0033 |     
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/2760f84e66c2a7df524108bc1ff79d35986edddf |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

  gobject-introspection-1.82.0 | 1 
host-binutils-arc-2023.09-r... | 1 
           libfreeimage-3.18.0 | 1 
              mariadb-10.11.11 | 1 
           oath-toolkit-2.6.12 | 1 
                openssh-10.0p1 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/0706415d1d8031dd50048be1d256d217ecdd71ac | ORPH
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/7197d201aa29affd0a6fcc0741452da3794efc41 |     
    m68k     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/a4daf48056c55ffd134ed8e869b6929c16482610 |     
   sparc     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/0f4c9de866f568af6166ffbc39cda28be64882db | ORPH
 microblaze  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/82a8c248cc322b6b57727448d7f3abdf8695001b |     
 powerpc64   |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/639b586624c32ea1b28fa7186347fc2c21916777 | ORPH
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/54e391e7e59cc7ef53c96769885d4414fc02d58f |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
