Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D4DCF257C
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 04:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 425FE61045;
	Wed, 19 Nov 2025 04:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_6pkMv_Cii9; Wed, 19 Nov 2025 04:21:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DA9D60FD3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DA9D60FD3;
	Wed, 19 Nov 2025 04:21:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D535160
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 04:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C47CF40B18
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 04:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYL0MsJKOl8O for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 04:21:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD61D40B0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD61D40B0C
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD61D40B0C
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 04:21:49 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47755a7652eso42128595e9.0
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 20:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763526108; x=1764130908;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5V/3owngO7+gmRroMeGiKYsCuJpAHOCKYcdRr6REoUc=;
 b=vfu4sGTNzPSJBCCGmdiaSUjEP+0wNI2XiTrlmdCIz37bHGYBiflzPgHnHWAXtoEdA8
 2AAuZca1L+uEr+Wzte4hh4ipjt47zQn5GJwQdJ/4OHSoItEn4Z+iNEaDevqHZ0t3+1KN
 0FWZzyHZNnjObQu4aUf67GlIuUTp6wBYChJp5F1lOpIYNA4FvwfIMX5Q/ouscjx5reE2
 wDD+hm56zQe63qhfPTb2Iwgls+2m4tAtqoW7n49qTlbU/xgOhS+83JGTvIM1sJBHBZqM
 NG4RokS89VKUOaZM8gydovvmv/bXAqsx5BVJrzT3UFg8jPOLTyiueXPREkVSzxYsy0TK
 kyVA==
X-Gm-Message-State: AOJu0YzQu30+nqT851R9MdT9MpiWsqjKMdORBgn5ruuXhr5i6+Q7uMV3
 rmTuiooMokQ2/U9x8aZMczV1WMwV8Ma4yIYwn++ynEZeHlZYeFTlsql44uqogw==
X-Gm-Gg: ASbGnctJv5NDUp+5qL4ljYLOky7Eth6ivlJ3zUEAcrTOid0QKe6QEJgxUJoHsKMxgyC
 V5O1nhDVVPRT53mQK9NU/SdH8aiSXZU+fcaNS+9FJbZoXyABZtbgzuZv7q0gXROo4NLg7pzvK71
 2e5WTLOADX41K8GNdoPIxglct770bC3LVzavPCuRfFcodaQ2uJbsbhQTdCQGGElhbUrO/ktVnk/
 hBlk7q/GjO+MGGY0IzAS/OR/x2bFKyL/Ek9qm5oZe/tU7etjlysFeKIGs7NzDfJGIvQv4OJMcTf
 5f79YKD6VLpX+AlVeGkcdPKAzr12J7QrgmKq7KM0szG1al+pKfMp/+e2iatEBIXm+YSu8zhd+Tn
 dXmQhSQyIuuOKzzkfb+FNC7++E4f/B0mCmw6eTk/c8fGNwt6WQFloG11CYXUXrMQ2WkB2VNh0Ul
 G8KOWtKzYsvvIJX23KiuljNyrdktsf
X-Google-Smtp-Source: AGHT+IGLDi6RzV28ffxWUdD4UwXJw6yXpvmqo3/V/1CiA9/PKwf2A2zjn2IdtE9sWtNZTds3RDpXjw==
X-Received: by 2002:a05:600c:3b19:b0:471:989:9d7b with SMTP id
 5b1f17b1804b1-4778fe95fe2mr180043095e9.21.1763526107559; 
 Tue, 18 Nov 2025 20:21:47 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f2084dsm36359621f8f.42.2025.11.18.20.21.47
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 20:21:47 -0800 (PST)
Message-ID: <691d45db.5d0a0220.b9ae4.223f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 19 Nov 2025 04:21:47 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763526108; x=1764130908; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=5V/3owngO7+gmRroMeGiKYsCuJpAHOCKYcdRr6REoUc=;
 b=CQD3bZ6TlEeXCcGRwQxsI48o9APNUYLAUdLxDkSU7PFIbue6mbQ9XoJTlEsxcHFVWw
 HWcfDVi4wMcHIZLXGmpS7sN9FQsxcAmk1kbmHRkNDR0+UQz9EP6QxehZX/WpDOM8/8Ig
 dH9HFyURJSaDFnAclYABKF+elz4/0gD2vJTm95+KywhUSC4SDsGmWIrB6Hmxf61GhHtL
 7KxYxW1pOgcTkJQ/PaPnZ7nvdpZSOttZrftfI9PhscXGgfwRpAv2MSPKeNwXAa7vvsit
 ifBE0W0gmtrY95yPc4y/FvpjnunYw58v7bDGPjYxt9AN//DUXr87IFKsapCKdeRGHalw
 UyGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CQD3bZ6T
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-18
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

Autobuild statistics for 2025-11-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  | 12  |  0  | 18  |
  2025.05.x  |  2  |  2  |  0  |  4  |
  2025.08.x  |  2  |  5  |  0  |  7  |
    master   | 34  | 87  |  0  | 121 |

Classification of failures by reason for master
-----------------------------------------------

                     kbd-2.9.0 | 6 
                openocd-0.12.0 | 6 
                   cvs-1.12.13 | 3 
           host-openocd-0.12.0 | 3 
                   libcap-2.77 | 3 
                      fio-3.41 | 2 
glibc-2.42-3-gbc13db7393773... | 2 
 host-softether-4.30-9700-beta | 2 
     libphidget-2.1.9.20190409 | 2 
                  libsvg-0.1.4 | 2 
                       unknown | 2 
             util-linux-2.41.1 | 2 
          aardvark-dns-v1.17.0 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
                   atop-2.12.1 | 1 
                   bird-2.15.1 | 1 
             bmap-writer-1.0.2 | 1 
                    brltty-6.8 | 1 
                  brotli-1.2.0 | 1 
                     crun-1.24 | 1 
                 dhcp-4.4.3-P1 | 1 
           dmraid-1.0.0.rc16-3 | 1 
              e2fsprogs-1.47.2 | 1 
                enscript-1.6.6 | 1 
                espflash-4.0.1 | 1 
                 fwupd-efi-1.7 | 1 
            gstreamer1-1.24.13 | 1 
host-am335x-pru-package-5f3... | 1 
    host-mender-artifact-4.1.0 | 1 
              host-swipl-9.2.8 | 1 
            igd2-for-linux-2.2 | 1 
                 inadyn-2.12.0 | 1 
                  ledmon-1.1.0 | 1 
libdill-32d0e8b733416208e04... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
              libmhash-0.9.9.9 | 1 
                  libnss-3.117 | 1 
              libopenssl-3.6.0 | 1 
                libselinux-3.9 | 1 
             libtorrent-0.13.8 | 1 
            libxkbcommon-1.9.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.17.8 | 1 
               linux-pam-1.6.1 | 1 
                lmbench-3.0-a9 | 1 
                memtest86-7.20 | 1 
                    mpir-3.0.0 | 1 
                netdata-1.37.1 | 1 
               openblas-0.3.30 | 1 
                parprouted-0.7 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.40.2 | 1 
          pkcs11-helper-1.30.0 | 1 
               pulseaudio-17.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
                   qemu-10.1.0 | 1 
       riemann-c-client-1.10.5 | 1 
                safeclib-3.7.1 | 1 
          sane-airscan-0.99.33 | 1 
                    sdl-1.2.15 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
toolchain-external-bootlin-... | 1 
                     unzip-6.0 | 1 
          usb_modeswitch-2.6.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/8dcfb3f776d1c6f25ae78cbae9fdb99f13ab3aa7 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | https://autobuild.buildroot.org/results/2e8124823a8ed393c7e66cacf88f5883bfd71359 | ORPH
microblazeel |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/02715214a821ac68a25b14e98af67608a56060ca |     
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/745ed49fb7af06c9f62b5f99c8ccbbe482d42046 |     
   x86_64    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/a17d82daf0d7dea55127ac6a084aa3aed2221aaa |     
powerpc64le  |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/dd290dcfbec8ed072dd66dce1117b06d653cdfce |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/97baa897d549ab4ae654649f042a634e72a66409 |     
   x86_64    |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/174e51fd7d308a10f698eef488a7b5b083164754 |     
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/46100267e42cf677aecb2796b7ad995ce076dfad | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/76ecbc74681204e8c694ab0d3b42706db3770e51 | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/3354d404a76ff64053712413f91e9f24b06edc18 | ORPH
   xtensa    |         dhcp-4.4.3-P1          | NOK | https://autobuild.buildroot.org/results/c59c38396b6268c8ef16968fd854440c039c11a6 | ORPH
   sparc     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/53a4119f8b6f7a2d3f1cf9694751b797003661c2 | ORPH
   mips64    |        e2fsprogs-1.47.2        | NOK | https://autobuild.buildroot.org/results/36c4be5e55a0957b3014a7be3bfb7f8f4ccd4a75 | ORPH
    arc      |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/d2e8daf0cac2f01a54eb96e8dd9e48eccb78481e | ORPH
   s390x     |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/5f4bc08fdf4dd169f50d4068672d0334728c449f |     
   armeb     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/45ae7d97fb3f2e7c5d6340832dd140564164b575 |     
microblazeel |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/26f929f63ec778a31ff6ab3c87d571a992795794 |     
    i686     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/157693bcee2187fbdcf192f6a727e8554c368091 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/1bcd457a9bc3eeb87879fc1d050bfac03d6d9f18 |     
   arceb     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/06870ef1fb6e15c286b081cc7bb98da486b60fe2 |     
loongarch64  |       gstreamer1-1.24.13       | NOK | https://autobuild.buildroot.org/results/e7611306ca9dc24709a95bb04e29021a85d0e7b2 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/b940161a1301b0c169b7c642e04df6d20ba6ce9a |     
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/4235283218bc49f53bf7cafd4a67f380dba659c0 |     
 aarch64_be  |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/c11c3342d9ea7bc4145b18c8a458b4b2a08fb444 | ORPH
   sparc     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/01f888ec6a5e9f8484b14fe7ef3604d4de71bd38 | ORPH
   mips64    |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/ad368f516fa5dff7377b462a56d48f082f8824b9 | ORPH
   mips64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/de60819270581698b2f95697955a714d6fb20d97 | ORPH
    arm      | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/e2863688f778fc32ccc9a13cdbc18b98239d8230 | ORPH
    mips     |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/b57473fc4283218a4167be4e3a46597d61ec955f |     
   sparc     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/3127f4279ea453123605b1326708545b13a07645 |     
   s390x     |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/38ee10a449216e250370ea7ff9ebb4fd9535f72a |     
 aarch64_be  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/b0eb1c62c8c2fbb38c3630190eafe622b32185b3 | ORPH
 aarch64_be  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/fd5a2c4a5c24c3daeb75eb8348e3ef5103e66bd5 | ORPH
powerpc64le  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/5c808d4ef48c8e044f1d150fc9ec50a68828f4b2 | ORPH
 microblaze  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/8831eccd62d248abee904e3d07729f9017247aa7 | ORPH
    arc      |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/b48798d15d87199ff365169dc1765ba1075fa70a | ORPH
    mips     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/9d19fa83935e58ab73fdbf12bc941e4cfa64eaf4 | ORPH
  aarch64    |          ledmon-1.1.0          | NOK | https://autobuild.buildroot.org/results/6969c6d8a37ad276d09b23f8e568d14a65d54dc1 |     
powerpc64le  |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/c922e5be43e40b163146b2555a079d4b591dc362 |     
 microblaze  |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/d6d8ef0353622860ba0ad0142401726f1d3e8770 |     
   mips64    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/10ca161c1fa404f3828b6f1f883c08a49f7990dd |     
 microblaze  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/108dacc487c3f52a299511f6cf2f44d03935f17c |     
   mips64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/4939a15e8c01dbef6db84c1eb781de74dc2b11db |     
   sparc     |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/fe1cca3f571baccb84654f62e8e2e47f28531052 | ORPH
   s390x     |          libnss-3.117          | NOK | https://autobuild.buildroot.org/results/5cab11adfbe1a67667b5d9adab6d4d3ce7f1aff3 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/bfb0321db7b014f1ad994d3319205ddcfab44bc5 | ORPH
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d6d2b0d4711da1748ea7f8a62fa57465fa7eb8ce |     
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/58bb62ce71f2f74449a7688e9d56bed1bad4cc65 |     
  mips64el   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/7cda59ef0e0b76760e63bcf2134dd4b445d588fa |     
loongarch64  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/c2709b51bdf26d77ca1e83b571d2b274be07aea5 |     
powerpc64le  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/66580ab2bbd9cf459ee9f5d9c8b8904b1d2ea462 |     
   x86_64    |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/31d607efbde6d4946b7a2d15eae5cbd7aa5a7c00 | ORPH
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/2b75f63cb1e7d984dcd3c73f632eb7bda53001fd |     
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5c1b20b5793a094af2a9580e8fec2a3476480ce8 | ORPH
loongarch64  |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/da8ec39d1642185b0e2ae62285b5b603acad5bfe | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/27a92e2bdc9560bcf507e0d3d5f12465332b326b | ORPH
   armeb     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/4850678bca53ed8621c9d6e50f29b0741721e723 | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/d1b9cfc147a2347b8bbc2f8c0005caa058cfdd14 |     
    i586     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e1e31722cd65fa2911475e9227c39d801e2d80ff |     
 powerpc64   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/ad4c1a96c05cab8ea12404df373099434ae33aa1 |     
  mips64el   |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/91356dd199d74ce7f28226fbd36e3c6a53d3c803 |     
   x86_64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/2d38e3ebf4c936f47e8474a2851d6f5cc07f0d9c | ORPH
loongarch64  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/0ef403ea15abc08355c7bec3ea5a3df3d91c6281 | ORPH
    mips     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/040c7157107aa94c733c2de8ea17396e47d1aab9 | ORPH
   sparc     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/3cb0ea7e69567c7e8fff68af7241d5b99268e2cc | ORPH
   mipsel    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/8a7f6dc40d6042e26e78e9f6290193012d386ed7 | ORPH
    or1k     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/f20667f8fe159de6601a81a827f26d4f0382d673 | ORPH
 microblaze  |         parprouted-0.7         | NOK | https://autobuild.buildroot.org/results/8021827885e78e2f0e5039ee511bb52e96e3fc6e | ORPH
  riscv64    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/8913a79a9b9066dd0e67a41ba603a94ea5d7e6b2 | ORPH
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/7c9a3383ddb929f56200061b8ebcc26fe5e3c723 |     
    mips     |      pkcs11-helper-1.30.0      | NOK | https://autobuild.buildroot.org/results/c9d03be1f6a9ee61cfb6b26ba4cf4751a637dc98 | ORPH
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/dd010303d5af9195c30997ace296d00e06fee146 | ORPH
powerpc64le  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/f617f370895e4b27948e38a23d374615fe46f48f |     
    mips     |          qemu-10.1.0           | NOK | https://autobuild.buildroot.org/results/c633ce5a5d88575e5f6361f2f68214cdbdccf181 |     
loongarch64  |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/55a1c74b48dc60313b56694aef893212362d24ef | ORPH
   x86_64    |         safeclib-3.7.1         | NOK | https://autobuild.buildroot.org/results/acdbcef86575e933c4c940bd5b03fb63a54aa255 |     
    arm      |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/83f5405bcfa1718afe37ed681e80b702fc238935 |     
   s390x     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/fe41c05db387b9d2642260798d21ef4ad379dbcc | ORPH
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/8ea92516c319e9d745ca05be2401ff2ce73a05d7 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/c4acc5ad4989bbe524755aa640fb8988f774f242 | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3a6dedcbfe2df4beb0eab96d52414a8b62f57eb8 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/62d9eedbef671caa59b2555c8968c828cb92f58e |     
   armeb     |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/eae39a964864e42ec23e0d6c8b04efab7d6742c3 |     
   s390x     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/62c6edd9553b2c8ed24b3421e622a5fc375ac540 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/5bc7d308c580d38884f716b0cc950f6a9f0e3aab | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/f45209cb2b81ebfcf221a32fa74483645314f456 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

          sane-airscan-0.99.33 | 2 
               bctoolbox-4.4.8 | 1 
       host-nodejs-src-22.15.1 | 1 
              libselinux-3.8.1 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/00fffa8af4fd2e784e875b55370f583ac42a3369 |     
 microblaze  |    host-nodejs-src-22.15.1     | NOK | https://autobuild.buildroot.org/results/b92e6bb0573d107d80149f5610cb57ded6c47bda |     
 aarch64_be  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5a9807d4e34e04ee62a5f105731934641e0f676f |     
   mipsel    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/d07a5eb849578cd011ebd3cfd7b9698227fe21b0 |     
    or1k     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/6745233e3b7536b512fe21524c2b7e0b8faa9e12 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              udpcast-20230924 | 2 
               bctoolbox-4.4.8 | 1 
                  cmake-3.31.8 | 1 
                   dante-1.4.4 | 1 
              erlang-26.2.5.15 | 1 
                espflash-3.2.0 | 1 
                 host-gdb-15.2 | 1 
python-remi-2022.7.27-37-g1... | 1 
            quickjs-2024-01-13 | 1 
                 sudo-1.9.17p1 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/778fc3ff0d383c041c76482b6404784ca842e51e |     
    m68k     |          cmake-3.31.8          | NOK | https://autobuild.buildroot.org/results/32641caf4ac276599c38d6b2fe01d4d1269e47dc |     
microblazeel |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/5c5ee270c66ac6490fea031f247a0b772338eedb | ORPH
   mipsel    |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/1756ab2d5264dacab96c9ceec931cbbf5d1408b9 |     
  sparc64    |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/6e642bca430d626e3efd6bc6ed6102c6da18eaa9 |     
   armeb     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/02249be5d40cc29bd8521b23da4ca195367a78ec | ORPH
microblazeel | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/771f08cd13d13a7f84d0cd1f506263066070bfac |     
   armeb     |       quickjs-2024-01-13       | NOK | https://autobuild.buildroot.org/results/6e598fff2369bec7b8c55bcc1b7a99d86b74cd26 |     
    arm      |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/7bd939e94305acb4611b1461a932269863d277b1 | ORPH
microblazeel |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/f4c204505182e103a9254fd8c34a4db5c9cbd06c | ORPH
    arc      |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/32128ebe98d67af0fc030370507be62b50b662f1 | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/ffa223fcc9f833f51f18fae0b52d360f9d0e7b75 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

amazon-ecr-credential-helpe... | 1 
               asterisk-22.3.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/6cfcd6bfd0537d6820d573816bc33403eddfb7c8 | ORPH
    or1k     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/6030a42d60af172532d692b9eef1e4c64262d74b |     


Gitlab CI results for 2025-11-18
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/12119362060 | ORPH 
...Py3SdbusNetworkmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/12104755719 |      
...Py3SdbusNetworkmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/12104755718 |      
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/12104755713 |      
...onPy3NetworkmanagerGoi | https://gitlab.com/buildroot.org/buildroot/-/jobs/12104755669 |      
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12104755585 | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/12104755575 |      
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/12104755570 |      
              TestOpenOCD | https://gitlab.com/buildroot.org/buildroot/-/jobs/12104755542 |      
        TestMenderSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12104755511 | ORPH 
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/12104755350 |      
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12104755347 | ORPH 
              TestBitcoin | https://gitlab.com/buildroot.org/buildroot/-/jobs/12104755301 |      
...nitSystemSystemdRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/12104755251 | ORPH 
                 TestExt3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/12104755187 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
