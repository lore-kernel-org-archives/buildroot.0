Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E743C87FCC
	for <buildroot@archiver.kernel.org>; Fri, 25 Jul 2025 03:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEDDB822EC;
	Fri, 25 Jul 2025 03:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0leTRSGfpM0; Fri, 25 Jul 2025 03:14:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C86581369
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C86581369;
	Fri, 25 Jul 2025 03:14:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C39EB909
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 03:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9E6F414B8
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 03:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jkUAMNfpU1h0 for <buildroot@buildroot.org>;
 Fri, 25 Jul 2025 03:14:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD3F041497
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD3F041497
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD3F041497
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 03:14:50 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-60bf5a08729so3318908a12.0
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 20:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753413289; x=1754018089;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YPUbYm5/1HyxgSEpyak0oLTipH16HvlY/cv9gReH+JI=;
 b=vMyZ7C6rSAzqbXB4mzsy77s14TTj6mepWd7bCrLyeIpnV9iE6u4tfYDWizzXqeT+iZ
 LakCHwu1pM0BkNZj/8TxJ81npDkke+2nXWTNbIAbGyFNJ5HNGqBCyicVfSoMA1DbzdXj
 vgPuxPxMVSQk1hMmWQI0MI8dyIWOKUrRHOWqRCfFnlC7NCr+h8zv4PJW2QhHSLdRX30Z
 SasWeTlR9l/C6adgiuMg2WxivRMEhiv1IACBsSBx26fDgUFYwYOFGFKylSOnXXKk8l4J
 MZc1LENuiejikaojgh52KNGSW3P5lv+HwEibHdy1ybD2o+75uwbceaITPCuQfEFx3ITz
 3sSw==
X-Gm-Message-State: AOJu0YwYdAPeEwA+Vfx3JR08MSiRa4IIQbD18pCTLI5xUWU3SnOzd3QM
 DCpYl/JIFkM1q4bALywPY20x1VMr5z+GD41JpdyCdhIek/Fs1yGqzrKdp/F2jw==
X-Gm-Gg: ASbGncuYjR85Ti17sA5eEN+26vfFwoRpMhzYbEQA/4qsGJPMTdqeSBTfYZCQWSQ1zUv
 68RQOosYulmmy3jVfLGB/1J9hKfDMR15wq0zQdkkoEZBnMOGLi7UuoDjvxmuB5QJpqS9V1n77IN
 ijYTrtLgpWcCsSGyDPyF0wvOUAvcBfuocpMKauNDZFVWgEn4u4Ah96D/iBuHfY25m6PeNhEBqgR
 m9ihKaTOZygWos2fn8bmPyKbr4Qlj/Wf9HTHb9YPrvQqXXAbXecoOnk1SlwYsrEOq0FATqrmro2
 qIc194W5pf0RJCtrdhqksgyo8DOWYtKjnI9hVCSUrRjYeHWEC/tG7aitn7xBvIOD9b6+hHq6Cce
 N9L3x3F/tGjlFNB8KaB9VizLPKg==
X-Google-Smtp-Source: AGHT+IGLQsqfdaS9wAhIXuMKBfxSy7DjVHo2lIOxu2wHZWfaVQpDGvLCwk3zWRBPX0vac1xkTRlADQ==
X-Received: by 2002:a17:906:6a2a:b0:af2:42e8:ad92 with SMTP id
 a640c23a62f3a-af61f11955cmr37262966b.61.1753413288369; 
 Thu, 24 Jul 2025 20:14:48 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af47ff42f38sm192557366b.135.2025.07.24.20.14.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 20:14:48 -0700 (PDT)
Message-ID: <6882f6a8.170a0220.3a43ca.67b0@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 25 Jul 2025 03:14:48 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753413289; x=1754018089; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YPUbYm5/1HyxgSEpyak0oLTipH16HvlY/cv9gReH+JI=;
 b=nHem4gd72CUVzumHkoX/SaYi4cSTfwt+T5zEE1LeZ9D0i6AcllJTIPSnje8CNX++iD
 C6LFomyjq64Pp5N3UVqEzuOLTT7uDhg49Xq6F8f728NNF2hm5x8s+hua3h9JGpFxRFuW
 JbxyG84Q9kNoc738JhyWN9toUp4GR0mi4636E7LeehZHeGe8woiKS+JBlh9tSGuD9x/1
 Wp4ISKQZqRXRt662kj/KYE/lvOQXSXPaTFh1uP8ci94FUx9l1huiLJM1c9t/yrMl+sRp
 Ldko48FG+8T4plfTrj56uHlbq2M+cHIkIVp6+TpETfqUgHMiHnZs38Vt7ytd2PMZG/7Q
 h0lQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nHem4gd7
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-24
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

Autobuild statistics for 2025-07-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  7  |  0  | 11  |
  2025.05.x  |  4  |  4  |  0  |  8  |
    master   | 14  | 347 |  0  | 361 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 32
              libselinux-3.8.1 | 17
                    yajl-2.1.0 | 14
                  cjson-1.7.18 | 11
                   avrdude-8.0 | 10
             batman-adv-2024.4 | 10
host-binutils-arc-2023.09-r... | 9 
         host-gcc-final-14.3.0 | 9 
                liboauth-1.0.3 | 8 
                       unknown | 8 
                   bash-5.2.37 | 6 
                       cfm-0.3 | 6 
                 openal-1.22.0 | 6 
               bctoolbox-4.4.8 | 5 
  gobject-introspection-1.84.0 | 5 
        host-berkeleydb-5.3.28 | 5 
                 host-gdb-14.2 | 5 
libdbi-drivers-0bfae6c43134... | 5 
                    gpm-1.20.7 | 4 
       host-gcc-initial-14.3.0 | 4 
              host-json-c-0.18 | 4 
               host-vde2-2.3.3 | 4 
        liblog4c-localtime-1.0 | 4 
amazon-ecr-credential-helpe... | 3 
  ffmpeg-n6.1.2-27-ge16ff06adb | 3 
host-am335x-pru-package-5f3... | 3 
          host-binutils-2.43.1 | 3 
              libopenssl-3.5.1 | 3 
                  linux-6.15.6 | 3 
                 logsurfer-1.8 | 3 
                    sdl-1.2.15 | 3 
                setserial-2.17 | 3 
                 apitrace-10.0 | 2 
        b43-firmware-5.100.138 | 2 
             berkeleydb-5.3.28 | 2 
             dahdi-linux-3.3.0 | 2 
           dmraid-1.0.0.rc16-3 | 2 
                flashrom-1.5.1 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
            host-binutils-2.42 | 2 
           host-doxygen-1.8.18 | 2 
             host-flatcc-0.6.1 | 2 
                 host-gdb-15.2 | 2 
              host-rust-1.86.0 | 2 
libmodplug-d1b97ed0020bc620... | 2 
     libphidget-2.1.9.20190409 | 2 
                libsepol-3.8.1 | 2 
                  libsvg-0.1.4 | 2 
libsvgtiny-ea9d99fc8b231c22... | 2 
          linux-5.10.162-cip24 | 2 
     linux-5.10.162-cip24-rt10 | 2 
        linux-headers-5.10.239 | 2 
              mariadb-10.11.11 | 2 
                    mpir-3.0.0 | 2 
                 netsnmp-5.9.4 | 2 
            netstat-nat-1.4.10 | 2 
             parsec-tool-0.7.0 | 2 
                   perl-5.40.2 | 2 
            python-yarl-1.18.3 | 2 
              skalibs-2.14.3.0 | 2 
        vulkan-headers-1.4.317 | 2 
                 agentpp-4.6.1 | 1 
               asterisk-22.3.0 | 1 
                    bat-0.25.0 | 1 
                     bc-1.07.1 | 1 
                  bcusdk-0.0.5 | 1 
brcm-patchram-plus-15bd6638... | 1 
                    brltty-6.6 | 1 
                  cairo-1.18.4 | 1 
          chocolate-doom-3.0.1 | 1 
          cryptodev-linux-1.13 | 1 
                   cvs-1.12.13 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                 dc3dd-7.2.641 | 1 
               ebtables-2.0.11 | 1 
                     ed-1.20.2 | 1 
                espflash-4.0.1 | 1 
                   eza-0.20.19 | 1 
              fftw-quad-3.3.10 | 1 
firmware-utils-86739f2b3ae9... | 1 
              fluent-bit-4.0.3 | 1 
                      gd-2.3.3 | 1 
                    gdal-3.8.2 | 1 
                     gdbm-1.24 | 1 
           ghostscript-10.05.1 | 1 
               graphene-1.10.8 | 1 
            host-binutils-2.44 | 1 
       host-gcc-initial-15.1.0 | 1 
              host-guile-3.0.9 | 1 
         host-mariadb-10.11.11 | 1 
                host-odb-2.4.0 | 1 
              host-swipl-9.2.8 | 1 
          host-tipidee-0.0.5.1 | 1 
imx-lib-3f777974c0c146817e2... | 1 
                 inadyn-2.12.0 | 1 
        inotify-tools-3.20.2.2 | 1 
                  iozone-3.506 | 1 
               libcap-ng-0.8.5 | 1 
                libcuefile-475 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                 libgee-0.20.6 | 1 
               libglib2-2.84.3 | 1 
                libkrb5-1.21.3 | 1 
                  libnss-3.114 | 1 
             libopenmpt-0.7.13 | 1 
                libshout-2.4.6 | 1 
               libsigrok-0.5.2 | 1 
              libsodium-1.0.18 | 1 
libubox-3868f47c8f6c6570e62... | 1 
                     libuecc-7 | 1 
               libunwind-1.8.1 | 1 
           libzenoh-pico-1.2.1 | 1 
             lirc-tools-0.10.2 | 1 
                openssh-10.0p1 | 1 
                openswan-3.0.0 | 1 
                p11-kit-0.25.5 | 1 
                   pcre2-10.45 | 1 
                 pixman-0.44.2 | 1 
          powerpc-utils-1.3.11 | 1 
                  prboom-2.5.0 | 1 
               procps-ng-4.0.5 | 1 
               pulseaudio-17.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
                python3-3.13.5 | 1 
                 s6-rc-0.5.5.0 | 1 
                  snappy-1.2.1 | 1 
    start-stop-daemon-1.20.7.1 | 1 
             strongswan-5.9.14 | 1 
             util-linux-2.41.1 | 1 
               valgrind-3.25.1 | 1 
                    wipe-2.3.1 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/bb141c96800419ef3b0004e065ac29d5b0cd8aaf |     
  riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/eea46cde031ffb5d3327bf8b431033a930027bcb | ORPH
  riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/c8b40a1dff3f1827866cc33db85389758b495917 | ORPH
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/9ba2d98ac3fd41fd5824244b9069a947c15b773c | ORPH
   x86_64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/675db356b36d8c17c5866120e6bed3bf082ddbcd |     
 microblaze  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/288d0184690bcd9297e570a0fe5997171e4ed127 |     
   sparc     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/3e1cc94c0bb0dd1a6cd6419f6aca1902d59aabb2 |     
  sparc64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/eaf17b568d267907b37776f5a0ed18419b06abc4 |     
   x86_64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/6e9b93308ab89bd6263c6f6bcfb5548294d55009 |     
  powerpc    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/2aa4f05a015a09aae0d66a1df275971fa841c05c |     
    arc      |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/308f7b93c6e880270efb512dfd0f4b1046278725 |     
  sparc64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/2f0c78c6c5f0caf708c6903503bd42e24cb67365 |     
   s390x     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/36484de10a9379090e7197827a6a73209ce017c6 |     
   mips64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/be85461e2b2f054fbd4a5a16e6fe8e03415bfed7 |     
    i686     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/c255fd6292609e0475c5694c26083a928952ecb7 |     
   mipsel    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/bfb595fe8c139f617f8b52c649e665b4d277f9df |     
  aarch64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/2056826c87b9aecbdf84b348b37a6607085b03a0 |     
  riscv32    |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/ab0b35bb323960e572fbf3481973a55e3502b678 |     
  mips64el   |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/1f7739550a0020bf2982ceef4c25043e77db5313 |     
  sparc64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/b266b8fa427f2c47d97c9107b4d9f79f851d8504 | ORPH
   armeb     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/fa0907efc777be10d9c2f2a819807bd20e1da4da | ORPH
  mips64el   |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/aafcae94d6d6468ecb995ada8a818ec1f626aec7 | ORPH
    i686     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/663203bdb21c79212761a50214ef7a5ed1c3073c | ORPH
    sh4      |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/dbaddef11e3bca7102a05a54963c8d7408b75089 | ORPH
   sparc     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/188cf162566c4590f6287a3b577722a37d2c6e6a | ORPH
powerpc64le  |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/a1182ca66c2e86242c19f3765d0af4332df30833 |     
   sparc     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/8667f548c00a822bd506b9bf5a3229a99b6c8c38 |     
   mips64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/6d1cbd39cc8503a97ad64df13570c26d0ce6eb7a |     
  sparc64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/e22a58e21321aa2fc38993085f7d2e6fd696bd0f |     
   s390x     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/407a22826a0219dfe7a9b6eef4c054871b8acc45 |     
   mipsel    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/3a06d727d266fd9323c20591493856962d13eba7 |     
   armeb     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/329a3a58cbd2b2ee95869e9e4ef781de8a1f48ae |     
 powerpc64   |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/17e497fb05e3907b9578c42952ea6752f3ceaa72 |     
   mips64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/a5c115b4be3aabc8d9f2c56fb93e96b52b19d917 |     
    sh4      |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/f719e071ae99b7f5b4534f265d9639c5aec59a5e |     
   s390x     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/4327dc47640be377fe5faf5deae5a749048f74e8 |     
   armeb     |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/5dd6c4e6ae2de219ef4ed3b3e020c61516bff8a5 | ORPH
   armeb     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/aa7f3293738f7283fa770518b99ff6190a087bbf | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/87b2ffc62fcfe0cc0b791fa2d471f2e309b8218b | ORPH
   xtensa    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/fa82221bfefa79bc060a4ddfc4fd874b83c0579d | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/63b5ac30cb30f1f0dd18e848d030a310720e1a72 | ORPH
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/4d0b5447fee5d712fe21e49f7b852e6401933e6f | ORPH
  mips64el   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/75b6dc2932e79ae08e798c197de0dabda7b9301d |     
    arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/fc89ca38a219fa252a0e66b7f0677e2627ffa099 | ORPH
    arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/5c90a8116d720c8365b7c3b3a2322ac79c6dc633 | ORPH
   xtensa    | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/1c23a52bce4a4d61cbcf52a45e257a575cb1c90b |     
   mipsel    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/1d84bffe8dcb1842977b01e4124606430f1c2a51 |     
  mips64el   |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/198033e6c5d1b545fae6243914efe5d5f69feef4 |     
powerpc64le  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/a73340c4bf3d182c5772dbe88ef551180ba175e8 |     
  riscv64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/eccbdcf57d54ee4290637c927e9dddc97baa763c |     
  mips64el   |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/83cee94ff2791bfcc3d95a89a18f32cefd0eab16 |     
   armeb     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/6281f44ade414f8f8c6d2e02685880d705dc3a29 |     
    i686     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/79e66134c2cfda6e184c5b289133fa1aeadcb60a |     
  mips64el   |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/09fae477850398df02f2ddb2c7102fc8cc48d7ea |     
   armeb     |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/a2d33b957a8eadf2c2060cbf6080c7d993f1ea73 |     
   mips64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/a390e0be7d3f8b90366934a215f8f5252432a0a1 |     
  mips64el   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/93caf014ae87ab835e48814efe68b36adb74a7a8 |     
   sparc     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/8a1f2a7ce3f9c86d634197ee75385263befec51c |     
   xtensa    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/e7e427b90718a5fc4985e2718e8b629bba672390 |     
   armeb     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/cf01d4259deb92ca45f33fa2bbe69f60e2ff1af1 |     
   mipsel    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/4dee7cd1d9c8dde06c851926e737070f6e8577c7 |     
  mips64el   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/43fdb768bcd41811036ed64a375627e9410de9c2 |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/d059a20de1c39aa5a949d7c48a0707fa72c8ccce |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/af3b370cee0bae8876a9d6e653068413b1fe7333 |     
  mips64el   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/9adbc1fb055f1903da32146d34cab11de3253cbb |     
    i686     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/e675a5148d916c545995b4867df87c030ec0a1aa |     
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/0714143cc9457d2bb99ff65b996f4220918199e9 | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/158f5bffbf6f8c36b7bd6c7d92b1614f81f47404 | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/889119e319159e9ff5eb5189e1225d3e36375b11 | ORPH
   arceb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a19a88efc7b158b27f8aa8097f1bce81f84d64a3 | ORPH
    or1k     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/30ffb8215f99315abf399bb1e0dddccef3cf0721 | ORPH
    m68k     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/7e2f86012731458a192afcc6589c2fa74d8d55b8 | ORPH
    arm      |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/97874cb7e49b2b7cf8d4f0da94a49cd3053c6e10 | ORPH
   sparc     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/be01186f9a41b05aa63d574005950a02092404a8 | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/2669d82df18c73d309da633b2e2ba9c72a94565f |     
   mipsel    |           ed-1.20.2            | NOK | https://autobuild.buildroot.org/results/8e0beff2a7749b1a03c7e5892e8a51bcdfae2edb | ORPH
   s390x     |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/b31b55b2027bd1f4fbf95601019e7a1b6951bf17 |     
 powerpc64   |          eza-0.20.19           | NOK | https://autobuild.buildroot.org/results/d1beea971a494e9bbc530f79daaccf7119eaa65c |     
    arc      |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/65025d8d0cbbca6c4c93907b111f734a58a8db8d |     
 microblaze  |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/ea4b96ba995a2e8f1e142483b7db357ae2300ee3 |     
microblazeel |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/75fb68b2aaef50591c59b1e9c6567fc6613ba9e5 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/c1c398fc260bbc422ca972c4096e4bd42c3634de | ORPH
  mips64el   | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/4db0ac3c07278beff2e9d0e9077f603c6687a2ff |     
   mips64    |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/6dedb8aada419dccc872768e61b826b072a33a92 |     
    arm      |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/7b0ea87e370a9f678bf01a27e4dd2bb5fde51685 |     
   xtensa    |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/ba1b67596927a897dbe1ac649224cc6f7f1c515e |     
   xtensa    |            gd-2.3.3            | NOK | https://autobuild.buildroot.org/results/1349e22659d5cab22a40c80dbbe0ddce98bc03cf | ORPH
 microblaze  |           gdal-3.8.2           | NOK | https://autobuild.buildroot.org/results/fcffbf283f40246529625012d2c810ea6e088f89 |     
   arceb     |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/acf0aafdb3a2da0faaae2bb93c136a250bdbe698 | ORPH
  aarch64    |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/eff985c5a5ea09e02642dc1aa2b5566a6b18c80d |     
   mipsel    | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/26ad1c0150f58f88b591c66d07232d082660fa39 |     
loongarch64  | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/5012e472ca5afd891aebd9df8d52c9f96b21dbd8 |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c2e1350c532b1af72bcbcc5d339fa9f706c6b57f | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/aec5aae6c259a647582249f2a73b562b3b089e69 | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/2ccfc3b47306b4cb3a765c654933211d3e03c665 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1c5e48743b671d51a2d079f805ab94f66dee1500 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/01fcf4992b37ac978241543b4cc80032a79c8a74 | ORPH
   x86_64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/94189a0512fe8695a31211eacca5cb7defb9575d |     
   arceb     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/3a4b12252cfebc0a43661d5bd43921027f7f05d3 |     
    sh4      |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/3144b8d2c20050e18032d7b9a79ea958cf10613b |     
   s390x     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/5b537247fcf4944c893b14e9fbecac588925e959 |     
  mips64el   |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/4cc0b1a726c37aeb521b48d74c0fbcd1ee83d309 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/19fa346941625dc3f36f0408a544e3dc7b2b8d27 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/ce36a4739f68a74540d5371d450c3c3b05a039bb |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/ef6c7a2675c6a3fff174a51e277afd14611d0ced |     
   s390x     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/ea3c8f5f8e61bf4b1b84a2e530d047cf1715a8d1 | ORPH
 microblaze  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/49e1a69a995d43407244a939b7a08d822ebffff8 | ORPH
    arm      |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/10327cffd274561a806fc0051ff2060d126d31a4 | ORPH
 powerpc64   |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/87bd8f80abdbe91dc21058180780d79aee188a58 | ORPH
 microblaze  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/4e3691729fe55c40f6ffd497d50453863b56b47b | ORPH
  aarch64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/de38363d080e4203ea941ec0cee17296301e34a5 |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/bfc22459d54e28df040391be23cace0bfb52626a |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6095e260a2773d2c656d54027a98f8ba63f1b887 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/99d7a8f3e5b3427ffd22f0cdb0424dd0c3ee8871 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c7acbf691c9d766123eedae5df6d56b124528d0f |     
powerpc64le  |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/a77d8023caa3450a4bb573773900962787e1dcc2 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/6c2d237ec613b37c55aceebea49d926be51c7b63 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/9f31a8996e82315fd8170559dcf36840486d283f |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/b0f619f101c271e64a87504e7e20b4ab2eb6cd97 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/3850a335881c4bb5f61c64ed4c3ad9fe59ad049d |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/65cd7551315bd7773e3ba58780b39928bcd5a416 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/af754c85472c542b3019fc30d80013a31bb242e0 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/b3d9fa3bc3a865d96e688ceb87acde8eac860039 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/67b67f8af7b08abf0dc920aa37771d544d789ff9 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/00a23e810bc6ba434ae1fed48e8159045b3a561c |     
   armeb     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/ca229b267b5d93382106c3cd5738e0ac3c8e4fa4 | ORPH
   x86_64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/85b966e8085a95ce1f65a6da0a43e3f244eae097 | ORPH
 powerpc64   |       host-flatcc-0.6.1        | NOK | https://autobuild.buildroot.org/results/0291ccd7bcfa4692296c3f2c39327e75fd59e29c |     
   armeb     |       host-flatcc-0.6.1        | NOK | https://autobuild.buildroot.org/results/3e0e6f76a11c52962e7b4b6505372dcbd0e7dee8 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/8e59dabf2480c8c9fc5131e5d80144e916326d2f |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/75d41b5ff7b6b85f7ca7f49eb3fa506df75afbb1 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/68480bb280ebb88ce4f05a287c45992e19cd6bfb |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/6377dd2981286e0687c386962640b3496000817d |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/42b69d03bfccd6d5f6ce4405d7a410e7dc09912f |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/37f9e2a904d0d8a731de99cd4ea46ded01cb32e5 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/8be36a4b390b2ba4154e228ff5771c2bbb1e62fe |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/8a37349e47e8e50017de805d02cf14850fa1f24d |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/2ba2d79d98c66c8474b4179ab91d6efb67204ca5 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/2965d2c81e277ff7ed2ffcbd203d2d5a28032b69 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/04515ee59ea991c2220bd8c05dfed566523b8f76 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/680ae87958bb27e9bd99ae13279163dafcc3a9e9 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/6f77ca4448e7ee53700b6c7ebd1dce041c7ef9d9 |     
loongarch64  |    host-gcc-initial-15.1.0     | NOK | https://autobuild.buildroot.org/results/a14d7a80902e54251c4643bf865103bb0b722d42 |     
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/411e9ef19054fc0bac26cb3d30d9a643616588db | ORPH
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/aece2241429e32f3fed0dd1e04b2a1448aa4900f | ORPH
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/8006731d124e528c9cfa9ce290621b4c214a9b08 | ORPH
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/aad22f214181766cd884d866e64f849e8e00e8d5 | ORPH
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/fb2bb9b6fa82e6fd27f7b6fa29356078701cb97c | ORPH
    or1k     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/a21e716d607a7ecf82d2fb393324953206f01c57 | ORPH
  sparc64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/3bcd3eef936924234f501faaa4373f67b17a3ed6 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f823d455a05e69754792b87584ddb2d643a220a6 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0a7860209e129cd06c577b59b77b6b30cf857a65 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/324fe667b501c425b70280dda75e9341f0cbc9c8 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8bf2f47539b8444f0e6419f69738b157f6c67ee9 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b5d54ec8040e6b9dd393010507fd196d398596cb | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6b75b257476f1dacbabf6048b6417de4458601ad | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/896188a91ff0acc53cbf48fed3f0c517d862197c | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/73963710cbaf606bcb14e2f1027b354284bf7d1a | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/180be758511c2e75990b903b96f27d7fd2067e9d | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/672b4b0b8172adc3047a17e7d4f97195a9c4779f | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d378c6ffadf47512f4b6ca4fed10a287d0f92139 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/68dd3a4dc737c9cc02a2092e70ddb6ce3fa4d981 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/851071819dd2aa10299bd796d82d3ffd6ec1e252 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ed6ffba80cd2b73e89053e83c548209ea57ee9d5 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c2d2b0cde10158093c527072144d3e98d5d70e73 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/273f667b9dd4fe2b08f99b594b4c1220df7e112a | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/176e94c8d11074aaa3ee15f1f183162a1e4723d6 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ce7f7d0d72ae5d9c0d526a8103ee17eabc6ca1f5 | ORPH
   sh4eb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9bc92f5b94b165a17110dd2905c3928c0bf3f342 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/eb68854c85468adf9f32f096c42aed53361c9cb9 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c6fbc7db292f23b6eea2c24f42be02718a94840d | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f4dcff2ff975600b2714bc4aa99e6cb85d2b34c7 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a70e4e40e47b1fc6433c101771836253d31d300d | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c017343602e22ec8cb8c21ca890eeeb53e72a2f3 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a072353bf9285cbb7b8b3975eeea19ed8e93c53b | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0d51139724c6963f6ec2be05d782bbda42ee1106 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/212d1b8e8ba1ac2a2f5f54f27c1aec34aea67e0a | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/efb64755468f74a7e9e6daae6cef361cfa95aad6 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9263d90d803ad5fea8457f1a54fb454dc1f2dbfe | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4c8de380cfc7d42f2c680d63546ffdcad8f4f095 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cc43465d6f6ce122271af0e58eef902a4fab1f6d | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ca5ac9a81a894d1019d927e405ab85b8a78d2fbe | ORPH
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/937f7614807d2c895b6ba1e311f3c9e5c454df63 |     
  mips64el   |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/0e16f285cf2e991f2a5fbf4e6902b9c4dc45483a |     
   x86_64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/f4eb3c5d74463e94018c0cae1af8713b9a2eb5d6 |     
   armeb     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/aaaeb74aab1a2310c80556b29d9a329500624da0 |     
 powerpc64   |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/bec5d3d687e8f1a8fad5208ac058a110f5eda91b |     
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/f60bc37b28e0f44c6cc927bacd07696b0eb0e6ca | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/7caeff07d2678b7ceea362cb3bd47cc2071c9976 | ORPH
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/371d63020ce553b3449ed69f0bff548146f0f4d4 |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/023a569364dd9d49fbde27c9d3cc23d4b7bdecf0 |     
   mips64    |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/3d567bbe1abbce1d4af102abdf15a61c91679d4d |     
 aarch64_be  |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/cf42ed422736584371be27d4aa24a017fb38751b |     
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/09b0818441916dc3c3efb5d4057a54caaa87e720 | ORPH
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/7766881bf5d8065eb1ac9a6612b859edf70568af | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/866157ad8964e23b711efcd841ac49fa5ab9378b | ORPH
   mipsel    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/08aaaa522c96017c3779dedf6313372a2d86184a | ORPH
    arm      | imx-lib-3f777974c0c146817e2... | NOK | https://autobuild.buildroot.org/results/e17136fcb635117955afa7367a66f9050e28663e |     
 aarch64_be  |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/7f1e19fef0e920fb13f5b9c2698c797d18aeb728 |     
   sparc     |     inotify-tools-3.20.2.2     | NOK | https://autobuild.buildroot.org/results/39cc206e60136d4731b14e21fa7a87c609313498 | ORPH
    sh4a     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/1d98244fdccda291ef8c3779bb40749d09cafd6c |     
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/61388cf590b01b09643e2095349fae54e7c6f95d |     
  powerpc    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/b35df3e35c0dfb27369992f9ca5080a3269db483 | ORPH
  mips64el   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/92774e508296514eb646a935b52b6bb266ac6077 |     
    i686     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/7f28993dc6076e2da7387f455688ad319a0ceb12 |     
   xtensa    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/c2bf041894e169276de9e33402bf47a5cfb02aa7 |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/4dd758b47977951d5be79305e04dfd2323e8ff7a |     
    m68k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/448cad1a0bf9641e955b1f1dfc3f63b6cb4fcc7d |     
  powerpc    | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/93c023acc20f0f53bf2b7b576b96257a274aa7d8 |     
  mips64el   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/6b7d05595add6675186ffbc75b341b74d7e0e1c9 |     
    m68k     |        libglib2-2.84.3         | NOK | https://autobuild.buildroot.org/results/d0a5b0605a61bbcae1f6ffd39f8af12c80571b16 |     
    sh4      |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/c4d649fb5bcf8ce86514965eb5e20323e99a9446 |     
   sparc     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/19b8fcf58c6603c25c4be8444e0e46dcf9bfeec9 |     
    m68k     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/a384817f3a99bb75661ec77f98ef6d55e09f9435 |     
   s390x     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/39ae21d3f2d8f3da6506144bb2d4a986b19b2305 |     
    mips     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/559a71a89299622bd36acf3ebf0d085c6ce47cda |     
   s390x     | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/913d648add2551813eb8d53744b7108715855289 | ORPH
    arc      | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/2859664a954f6dec2ebc2c5e1184d848dda49d79 | ORPH
loongarch64  |          libnss-3.114          | NOK | https://autobuild.buildroot.org/results/11bd7aaad17cafd5396c1f4ef928a2dfbee43721 |     
   armeb     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/30f4aace9ee77fada8cf476afdd0a85de9a0f1ce | ORPH
powerpc64le  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/17dfe5ca8398e363d2e49d823b8318878614e540 | ORPH
   xtensa    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/b2b2bbfb2b30dc8003776001912166c291615d22 | ORPH
   s390x     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/a54083c7c3553a1c4542afc8dacf44959e0d75ea | ORPH
   sh4aeb    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/dbdc6b9be9c52ceb501670a8cbf49609b1ed7545 | ORPH
  sparc64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/42d614d57112eb8de45ea70b70975689e7bf95a7 | ORPH
    mips     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/b36f28f071603c5100fbc3cb223c6dd2661d3d57 | ORPH
   sh4eb     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/a8a6b0f1a740d809adc56c6011e3449d3ddef3e1 | ORPH
microblazeel |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/1180475fa4a51d3b3c79b3402208476a657ac918 |     
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/cce8e3b6389b1d450e90d8177302355690653a60 | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/5112c751bfe6ed48ffe5f05b435b48173a5d2fe2 | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/47e67580151868bd82209df9dd562a7cbd2510c1 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/cb8f5c58184b1ed7cffa7a0032303959cb134471 |     
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d1a5908c2f4fc3f7855a0b32d47a9fbc64fab6da |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8137022e23e3fb32190686f021e278350113fc80 |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8c27a56e89ff975abcaac730142fec024645e298 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1ac7f175bc124bad14dce101b68450570adbc148 |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3e266d5bd89db40dc470eb9bba678ea5223f9121 |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/164d25a0088eef74198861f86356e5dc1478e269 |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/728e4869689767175ca513fe6588618c1b911b97 |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/dc185c018171c86816f62b52ef5bceb47dd16630 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/27e6b449b80b20894721744ab421d9766c91d337 |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8e229d1bac193554cb33b34a2b00a9070eb81894 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8855d60cf4f49bca2ddfe4665e77f67f8878a593 |     
   mips64    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/06160c743d885f87887f71f83fc7e65a1450dfd0 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/57196f4d92501013002ee5c8ceda563fcc5ab974 |     
    i586     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c76790e7495ae1223918edf9339cf4c59cce35c1 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b7705b44869c5313b42717528ee2796cf558bb1f |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5204b227114f5f8af19d525d128320fe8a349ccf |     
    mips     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1de6d9b42c7f9cfb282c4dbb0f680952a20395e3 |     
    mips     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/7e561f4ae2eefa2be19b3d0a363289a435d16248 |     
powerpc64le  |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/55292922784a309b83122c740c4101a91a210017 |     
powerpc64le  |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/249e7ada41f78bdb4a8f68f991a07234d6337143 |     
  sparc64    |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/ad9bf1a2ec3e125278bf861e1c181cba51c75cb2 | ORPH
microblazeel |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/d77e87cad476e200967da7094372f3bda28d8eef | ORPH
  mips64el   |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/a5168ff4593b3b369e3a8ee3d2821ee606ef6de8 |     
  sparc64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/0c4179689a3b86444529665b9db1ed32817f09c7 |     
    mips     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/5051705c2caca14ef7c174f49cc99eceff81e0cd |     
   mips64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/38d05625b38593bfd1959ebf68831cefb15feb88 | ORPH
    mips     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/c9918b881fa94809cff8022a8907ff54f1e4e1b1 | ORPH
   mips64    | libubox-3868f47c8f6c6570e62... | NOK | https://autobuild.buildroot.org/results/f8f95fd44501f3c25335b4cb1e1942a987aa72ab |     
   mipsel    |           libuecc-7            | NOK | https://autobuild.buildroot.org/results/5aaf25ed34ca0943d7a72836980af0e0d686a9bc |     
   mips64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/5e59f19c42ad31983648459121e342abbf6c8ea7 | ORPH
    mips     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/5faf925977259919982e125024965c7000f9db30 |     
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/ef6c93b514bf10cb3fe9babefbe0cc52425a8306 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/50b005f2b79d146b443fcb7942c3b34edf3fdeca | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/d383b8cea8812fda4ea97f51a00753ea6d286d78 | ORPH
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f855560a35c05a059c7b1dee4f7132fc6a7de093 | ORPH
powerpc64le  |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/803db62398aefdc274c79aef1ac81f2d7278befc | ORPH
  powerpc    |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/e143b16379105ae00e76e14e73b4ff540a4fe783 | ORPH
    sh4a     |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/7a74502ab13cad4a2e62b31e23a1ecdfd0db6c59 | ORPH
loongarch64  |     linux-headers-5.10.239     | NOK | https://autobuild.buildroot.org/results/e287f9bd6c2c44346a4f0f592ab947e3a491a5e4 | ORPH
loongarch64  |     linux-headers-5.10.239     | NOK | https://autobuild.buildroot.org/results/eb4e0e29babaff38bb6ac80cfcc2599b5bee4960 | ORPH
    or1k     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/c98b1da6a2f6fd2532ce800a545009fff80f2684 | ORPH
  sparc64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/f70a6e63c653fd51ae7c06fa2a9c3870a327e297 |     
  powerpc    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/03595e0d587d06be94b3444aa2a3041f94e614f3 |     
   mips64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/f7ab941604ff995b09f2194d6ddc31f444e5a601 |     
microblazeel |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/4d5253c0b401242c2cc6ad55e883e8b425d3201b | ORPH
   sparc     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/dce741eb6d37b36e114019351d5667647baf9c56 | ORPH
    or1k     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/3624481aa61109b3adb10239907e00b7cbe1a57b |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/85b31899514e865708baedb4cad078a6bc22cd6d |     
  aarch64    |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/afb7ff6183e51f7325365f29d0e91aecda790682 | ORPH
microblazeel |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/effa5816d66dfddab77620b938fdef47e57854b0 | ORPH
 aarch64_be  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/eb27557771eb31d5201f6b3684d0e554b8d39945 | ORPH
microblazeel |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/a08ed3d438887c7d962e39e00cb725028e726f23 | ORPH
powerpc64le  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/7ea915cea5120fe8cf721fe451e89013ec4307c2 | ORPH
   mips64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/5cf6443b9a0494991599f311aa7ea8e8c56faeb0 | ORPH
    or1k     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/cc6816a80f7c7ae42c1665cc5ce29d7bf0c2bd28 | ORPH
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/3fc29170b55506b148e153b8b26900f81db65fd9 | ORPH
   mips64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/208f5b71e490437f576acade7f10e60ac3410497 | ORPH
 aarch64_be  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/2ed337e7b3cf7f594eb698d8817d90f77f642c54 | ORPH
  mips64el   |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/11ef00605ae710030580f1e83691c872e89dc5e3 | ORPH
   mipsel    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/004301bf3dcf06330543b43ff9a5412e7a3d44a3 | ORPH
  sparc64    |         p11-kit-0.25.5         | NOK | https://autobuild.buildroot.org/results/ac42c29f33a662f6323dd5ef64dc884a168c57e6 | ORPH
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/a6eaadcd0b3695681bfec6cb02224dd407049845 |     
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/9b5ef2a0564272c95329101bfe48f3b1734de1ac |     
    mips     |          pcre2-10.45           | NOK | https://autobuild.buildroot.org/results/cfb59202a2c3b16446e4bee09afc9e5588896b4b | ORPH
   sh4eb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f24b2d561393cf1f674add22b08798d1efdf2c8e |     
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/7fdbaccbda9aa57ae7389a2a28467ae352c42f72 |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/896e78642d998a44c082f81a218ad43908d96809 | ORPH
powerpc64le  |      powerpc-utils-1.3.11      | NOK | https://autobuild.buildroot.org/results/0d64023432a466dbde9e1e9f468ff819a78de41a | ORPH
   sparc     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/58a16fee4fc7fd3744e32b4f892e133b84f6bd79 | ORPH
   sparc     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/50b308f4c8198edc53a20af91ea9aeab69658b06 | ORPH
    arm      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c31627b17fbc626cf0b831b7f0fa9806f2080583 | ORPH
 microblaze  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/8f58fd6a9a28710e94c834d3adac2a73325b8893 |     
   sh4aeb    |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/7586591355796d411acc243e7f35686cb01548f6 |     
microblazeel |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/aea45745ba7d3da0e44dfac8fc83c30a237bc3cf |     
    sh4a     |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/a2c815ce7d6472948ca4bf04b000ae1da68c511b |     
    or1k     |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/a284c357498066b245c619884054aa178fc67d9b |     
 aarch64_be  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/e1b56bd0d0cf9c96154e6ab58c5901afcd89bb78 | ORPH
  aarch64    |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/8f57ffb7865cfdf6b36d99b6a8f9524ad372bdd5 | ORPH
   x86_64    |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/f0291f01fc50db0c9b594613ee923fd841e8cea4 | ORPH
loongarch64  |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/4c516be9cccb384c7f6d0e6bdd9eb34965f7d570 | ORPH
   mips64    |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/98c1e1553cc53e1200d194463c26463666dce7fc | ORPH
  sparc64    |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/05e00c982f030b350aa96ac8305c19d1e2d97799 | ORPH
   xtensa    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/9e13f107f8a617a08f043bd5686329c5ecf4dffa |     
  mips64el   |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/9ef7c097209c84ef1cf4436e3cc3ed54c6dd54f0 |     
 powerpc64   |          snappy-1.2.1          | NOK | https://autobuild.buildroot.org/results/8d1eb4941843d45ad6397d9acb4aad19bc751f8a | ORPH
    i686     |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/2174422d7c151817eebe59311f3e2f21c04ad259 | ORPH
    i686     |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/8a18e8a32565a512fe302163536f6d5f6cf3cc45 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/12a6394c41153ffe1e9f84848136577f1559e47e |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/d190220b53af53574f77de0c2083cae574346267 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/c1e0624fb0602be456b49aa1724437746cdd0060 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/66ba4c16fe3a2064f7dd08cf83b7e34a266502c2 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/629074f59acf4ed45a3754864bd5852568c01ed4 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/5cb4622ce89f854228b597cb1fb6f2ed01ce3c5d |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/648a88facee5eb4591dfd0bc9850cf2d1e9c3d1b |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/e693f3574f5190d5dbbf2d1ece5af1f8e84226ec |     
  riscv32    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/673f2b0377b4e45cf8f1b6cd4e27f7894f1193e3 | ORPH
  mips64el   |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/a2bb186bab62c489c9d47fc4e845eb7139af7cdb | ORPH
microblazeel |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/3aeaa7235c1fb47d7e1bfbbc11660e317a5a0d5c | ORPH
microblazeel |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/74949daa00abd91011da100ee76261cd4ae80768 | ORPH
  mips64el   |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/46a2bde4eb4419cafc0b10e1ea6bff0114f5b149 | ORPH
   s390x     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/10094656fb6b5f415eb807ddce628d60a7f963ba |     
   armeb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/038894d6d3414cfe6af2b6713e2590d665eaf9a5 | ORPH
microblazeel |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/bd5491c67e151aedf00ce940307c430e5f49ccd3 | ORPH
 microblaze  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/5ac03b07813589e67c0c79ff8ba75f074993ff38 | ORPH
   mips64    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/0b6ada93f45c16cc8c558ec23a0eb56da2aa86e9 | ORPH
 microblaze  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/15ef5d9cd1987ea1b5ce3374e50bb76480700caf | ORPH
   armeb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/c746aad31ad33f29e549c21c42bd232841668be2 | ORPH
   xtensa    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/6d3be622d613ec109ffc8034400829239cb3362e | ORPH
   mips64    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/0b3a8e12b5d022d7d058934d151ad8dc5a6412e2 | ORPH
microblazeel |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/8bf9cc0c718cdd9159189302ed4598850d098284 | ORPH
   s390x     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/c073efc3ebcbaf83dcf36d94475c3e825f4502bb | ORPH
    i686     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/8fcb83edf569df7edccdfe1884dc0ced6e16cd7a | ORPH
  powerpc    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/54e9f542c2c8e3f88a4802d82badb11bff7e9efa | ORPH
    mips     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/520f42dacb2f821d6b928ea4d7a1c6f273a162cf | ORPH
 microblaze  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/8969b023b3333267e0adc2e7bc14108c234d90ed | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    gcr-3.40.0 | 1 
  gobject-introspection-1.82.0 | 1 
               host-parted-3.6 | 1 
               host-vde2-2.3.3 | 1 
                libressl-3.9.2 | 1 
                 libv4l-1.28.1 | 1 
              openconnect-9.12 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/94429984a80fa58c1723fe14122d185389a432ba | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/b8156e4695addd7a2f2938ddb8e0aff3f1e2ab18 | ORPH
 microblaze  |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/d1c052ed769eb59e46f835c87dc8c522eafbbf8c |     
   mipsel    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/eb35c5f9d77f4ec26230aacac75844762a1ec3a1 | ORPH
   x86_64    |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/e5a2ff5871c2ae1d4e9cb3a6095bb1b936146b51 | ORPH
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/efbef887606af128801f6bfc071156ff12b60d13 |     
 microblaze  |        openconnect-9.12        | NOK | https://autobuild.buildroot.org/results/86878b3c3424aae6e9f4f1077e1fd739146f714e |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                   dillo-3.0.5 | 1 
 host-softether-4.30-9700-beta | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/8b951f5bcc03a7d1091ce10422f48bd2428b3562 | ORPH
 aarch64_be  |          dillo-3.0.5           | NOK | https://autobuild.buildroot.org/results/0588ebae878c68630bf463b7d2dcc782da3f575a | ORPH
 microblaze  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/fa680052457d4b7d7e30418ff5357b9ea318cfa0 | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5dc98e321593a7f284903d52002ef8cb885ab96c |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
