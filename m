Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF78CA0FF2
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 03:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99E5740CDD;
	Thu, 28 Aug 2025 03:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QVh_-fc9MCZm; Thu, 28 Aug 2025 03:25:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA2A440CDE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA2A440CDE;
	Thu, 28 Aug 2025 03:25:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57B08B8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 03:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C6C440CDF
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 03:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2Xma9m1SVVh for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 03:25:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2FF0240CDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FF0240CDD
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FF0240CDD
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 03:25:25 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-61c325a4d18so766353a12.0
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 20:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756351524; x=1756956324;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xq4JEbigGNhOwbwhHnrXU7e35S3oCMCzrKVP5/TamFg=;
 b=V5B5fPZsl0xvPN2zecVZZSycxplNDBRLKdr5WxznuNGWk9YY44tgDfVAktRpSJTD8M
 iL5jBDEBM1GxDvWB9m0ZS+W+ukNMztIh40/Mm+PypHS9o/bSJOmtNsxbbdWPfyn7ACoR
 R8nHR6c0RLWANb1jdMPJzv3+jRHHCXIGxJU21wWy/Y/md/OYtdm00TcUQVCbrKv9qTQh
 j1BxUjIydtdTIORSVjYXpB4AVW/BQMkHcse4d1O3hEaFppnWROlxgKtt1w/E4ort927b
 YRnKGRWtHWur7ClKLkHR2hzOmY7KQ5Xfvh/0rw/YiSi2yTdVKjmiuz/6EkIqXEQzeMTb
 rlHg==
X-Gm-Message-State: AOJu0YwEIBYfo/P6LhEmM4GqKQP4idnWUZc82F+lh8CcKL6zVlzckP8e
 eZVlyJuctRx1W9SuJyKunMoXY4+5+JSzz8OPgFJ2lSz/01u+fIuB6C18inGJlA==
X-Gm-Gg: ASbGncutzSDX81XtprxrAJcNVMpCDuW2PnBT58uQkDLL/O6tICPTAX5fi7EVIU4tIGx
 xiZ1lohK58U+a7e2G+7viyrTuw47QfakI9nF6RJ76ZO1WKusPJvBnREgtQFCwU9NDVgK74sHx46
 W6GDLlCFz4AKZsxzJxd2XsoUfpruYvFhLZDrLUr2/D51u7eQGRYNKL9oQwKI9T6YbeZ9fmsztML
 yJXgnWIHXS4Ex5GISATwDZ2ImfRKs8B20dXUFEJSVVRpL9ysm9qlyGW2r59PlzZDTeCmfe9glg+
 DyZ+5IN4pmen8p/DNhyotptVWG9g7HToA4iXMQo6tYhbYa4YkE5Js75V3p3Oicm9KlA3au/HMKZ
 k9Aff455G9Ek4LQp5lKDZm/tslks56Q==
X-Google-Smtp-Source: AGHT+IGV31DEU8cThZbvfIzYYDvmlLB5h6yoxq+bZZq4RoA39hgNzu8a/YPhyWJGCup7bmq8lMa1qg==
X-Received: by 2002:a05:6402:2346:b0:61c:793b:97e6 with SMTP id
 4fb4d7f45d1cf-61c793b9ef1mr8598738a12.5.1756351523667; 
 Wed, 27 Aug 2025 20:25:23 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c5f416f26sm7501156a12.22.2025.08.27.20.25.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 20:25:23 -0700 (PDT)
Message-ID: <68afcc23.050a0220.ba105.c179@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 28 Aug 2025 03:25:23 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756351524; x=1756956324; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=xq4JEbigGNhOwbwhHnrXU7e35S3oCMCzrKVP5/TamFg=;
 b=bgEPH8Wcg/Y2zU1o44lH/BsaqdkS6xt/0Xndi7dcwQEPOsCqRt7fH+TXZVoZXzUMr6
 bI5135MUbqixmIiXIxnEahDoMqQmZ069jxKKumxYnYVxbjNs8UjrvyoSCMv6gc9SVd/Y
 +8BMvG0FjuLtKe2rQaPKBxPzDReVNQFc9ywNXIB03fyJHYpMa6zSKZBITTyygAa2p9e0
 5PSGC6bd6bL2zUpRyfCmJyHD6bGLGkAdNNFhCDUd62EIRUKd01MUvM3wQ27R0c0RyYqy
 uevXVRzCtInzPUipjMUvNGwFGETuIGAFLSF+G7EU8ZgBw6rWSMOXBRHX+rrOtRupquOL
 Wa8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bgEPH8Wc
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-27
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

Autobuild statistics for 2025-08-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  3  |  0  |  7  |
  2025.05.x  |  0  |  1  |  0  |  1  |
    master   | 21  | 178 |  0  | 199 |
     next    |  0  |  3  |  0  |  3  |

Classification of failures by reason for master
-----------------------------------------------

             18xx-ti-utils-8.8 | 9 
host-gobject-introspection-... | 9 
              libselinux-3.8.1 | 6 
                 logsurfer-1.8 | 5 
                 apitrace-10.0 | 4 
  gobject-introspection-1.84.0 | 4 
                 host-gdb-14.2 | 4 
libsvgtiny-ea9d99fc8b231c22... | 4 
                  linux-6.16.2 | 4 
amazon-ecr-credential-helpe... | 3 
                   avrdude-8.0 | 3 
                   cvs-1.12.13 | 3 
 host-binutils-bare-metal-2.44 | 3 
               host-vde2-2.3.3 | 3 
libdbi-drivers-0bfae6c43134... | 3 
            netstat-nat-1.4.10 | 3 
                openvpn-2.6.14 | 3 
                 agentpp-4.6.1 | 2 
        b43-firmware-5.100.138 | 2 
brcm-patchram-plus-15bd6638... | 2 
                 c-icap-0.5.10 | 2 
                     crun-1.22 | 2 
            host-binutils-2.42 | 2 
                 host-gdb-15.2 | 2 
              host-json-c-0.18 | 2 
         host-mariadb-10.11.11 | 2 
                 libiconv-1.15 | 2 
                libkrb5-1.21.3 | 2 
                liboauth-1.0.3 | 2 
                  libsvg-0.1.4 | 2 
          linux-5.10.162-cip24 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                openssh-10.0p1 | 2 
                       unknown | 2 
        vulkan-headers-1.4.317 | 2 
am33x-cm3-11107db2f1e9e58ee... | 1 
                 argus-3.0.8.2 | 1 
               asterisk-22.3.0 | 1 
                   bash-5.2.37 | 1 
             batman-adv-2024.4 | 1 
               bctoolbox-4.4.8 | 1 
                    brltty-6.6 | 1 
                busybox-1.37.0 | 1 
                  cairo-1.18.4 | 1 
          chocolate-doom-3.0.1 | 1 
                 coreutils-9.5 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                 dc3dd-7.2.641 | 1 
             docker-cli-28.3.2 | 1 
               dvbsnoop-1.4.50 | 1 
               ebtables-2.0.11 | 1 
                   exim-4.98.2 | 1 
                  ffmpeg-6.1.3 | 1 
                flashrom-1.5.1 | 1 
               freeipmi-1.6.14 | 1 
            gdk-pixbuf-2.42.12 | 1 
glibc-2.41-70-g1502c248d58c... | 1 
host-am335x-pru-package-5f3... | 1 
            host-autoconf-2.72 | 1 
          host-automake-1.16.5 | 1 
          host-binutils-2.43.1 | 1 
            host-binutils-2.44 | 1 
              host-bison-3.8.2 | 1 
            host-coreutils-9.5 | 1 
                host-cpio-2.15 | 1 
               host-gawk-5.3.1 | 1 
       host-gcc-initial-13.4.0 | 1 
       host-gettext-gnu-0.22.4 | 1 
                host-gmp-6.3.0 | 1 
                host-gperf-3.3 | 1 
    host-llvm-libunwind-20.1.8 | 1 
                host-m4-1.4.20 | 1 
                 host-tar-1.35 | 1 
      input-event-daemon-0.1.3 | 1 
                  iozone-3.506 | 1 
                       jose-14 | 1 
                  ledmon-1.0.0 | 1 
              libmhash-0.9.9.9 | 1 
                  libnl-3.11.0 | 1 
             libopenmpt-0.7.13 | 1 
              libopenssl-3.5.2 | 1 
                     libuecc-7 | 1 
               libunwind-1.8.1 | 1 
                    mpir-3.0.0 | 1 
              netavark-v1.15.2 | 1 
           oath-toolkit-2.6.12 | 1 
            paho-mqtt-c-1.3.14 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.40.2 | 1 
                 pixman-0.44.2 | 1 
procrank_linux-21c30ab4514a... | 1 
               pulseaudio-17.0 | 1 
            python-yarl-1.18.3 | 1 
                ramspeed-2.6.0 | 1 
                  readline-8.3 | 1 
         s6-networking-2.7.0.4 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                    sslh-2.0.1 | 1 
             strongswan-5.9.14 | 1 
toolchain-external-bootlin-... | 1 
toolchain-external-codesour... | 1 
              udpcast-20230924 | 1 
                    uftp-5.0.3 | 1 
                ustreamer-6.37 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/c10273c797681747a7f4759b209e648f2bae399c |     
    or1k     |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/46efc5747fe04bbc2849e918ad22ad70639941c9 |     
   mipsel    |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/f47a4bf27492bf419474609ced83102d7670337d |     
   x86_64    |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/f12c2a118dcd8225bdc35d0042aafae9637d8baf |     
    arc      |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/d73c33839c3f993583665e9fb514becec21ad03c |     
   xtensa    |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/e6ad620c171c134b99182b7920f3a5da92a36549 |     
   armeb     |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/358f51a5354b081c2cf96ab00493c7b96db2d8b7 |     
    m68k     |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/d89050d3211787132055cc9b8c749f8aef6d0f6b |     
    i686     |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/f67303f4f298e97602dc250afc72ddc7580c76f8 |     
   s390x     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/e92d24fdbfaafafe6bf081ae908adf2feda9d948 |     
microblazeel |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/900ec5795b8405107f79b2b69b90926818550633 |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | https://autobuild.buildroot.org/results/47c164d1d4e23f4b947dc3333a16ed3b32c4f794 | ORPH
    i586     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/3758d3ddf87e018029e5ce35695ce29cffb86377 | ORPH
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/0a629757f9dae4b45d4356d9b14bd59e8d4120a9 | ORPH
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/8679186321433228389c3313aee65427e648c72a | ORPH
powerpc64le  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/ca5f7c954d07430d8ebb9ec30563a6bd7e982d41 |     
 microblaze  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/c1cd084043c4828202c68aa320e9f520a7ab0b59 |     
   x86_64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/ed34cd1645766a708f323d6015004eef7722c95f |     
    arc      |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/e1a48ed5f4409fc576ed24da5fa71996e8b4c31d |     
  sparc64    |         argus-3.0.8.2          | NOK | https://autobuild.buildroot.org/results/efe59b7f76fafd024ae871000a0af314b0bb335f | ORPH
  aarch64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/2d39791c65c5b71b0533d4b2bce5f073f5919552 |     
  mips64el   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/237fb4e699ed7cb4d6a93ac9c2df7ec6dd8a6a2a |     
   x86_64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/b943ef50d326ae53ec252a781b8d516ba115781e |     
powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/a42cde7ba7788b8298fad6ed4f6faeb3abea43ca |     
    i686     |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/daf0aefbb10299f150c2c6a93df759ad07974752 |     
   armeb     |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/8ec3af5cd345ff5918b784fff7734ce3591e1858 |     
 microblaze  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/62834f8e9dcdb6fadcb5d340002233bbba781c81 | ORPH
  mips64el   |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/a17350945ede00793679745e1799b82a655bcc7f |     
   mipsel    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/f3d647e53a216f605135e5d8dac39de34081e9a6 | ORPH
 powerpc64   | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/1e305685dd082ed089cb65acd8fac932b5cc5b82 |     
   x86_64    | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/df109cd2d751c181bf1cbb6f4d171eff80753702 |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/56788eb8f700fbafaa9110e2569e96bbd538e2e3 |     
   armeb     |         busybox-1.37.0         | NOK | https://autobuild.buildroot.org/results/15de6aae44f0ed7244f74eb2f8fdc664341d7391 | ORPH
  powerpc    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/21fafd94567bdeaa017d8a42a822fb740ce28062 | ORPH
   mipsel    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/379cc58223fad302411bde2ac1e7a697bf9d776d | ORPH
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/4e6fcdb34125e26c13a50ec795736ca1516f6f0d |     
   s390x     |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/226cda8583e0fbf5bd9786de022786567132ef5b |     
    arc      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/669b9b897bd33e670d7228f66e481dd8d244f567 | ORPH
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/7b96361d3db6d3ecf452dd4297d63b88e8fdda39 |     
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/04965c7a84229cbf921550d3d2598ab32b2965e5 |     
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/617285c4bd14d3bb115638c79b5fd07e2e058ae5 | ORPH
    sh4a     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/aab30739ecef474eaffe91e1145e6fbf32054dca | ORPH
    sh4      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f7f8eae17bd28a44147b0cfdedda4aaea9fd2a37 | ORPH
 aarch64_be  | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/d1ec30cd25fe1f7058c37a4a285063c7fadf08cd | ORPH
    i686     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/2d6af1b426828e93b34593ad7d603443a65d2f10 | ORPH
  riscv64    |       docker-cli-28.3.2        | NOK | https://autobuild.buildroot.org/results/0fc3667c542572c6804845b5638c7688fd40224a |     
    mips     |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/5cce8a512628fed7a19c6b06f8f94f3befdf84f9 |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/af24f96be3bdae4458d520aa18086e419bbf12ae |     
   armeb     |          exim-4.98.2           | NOK | https://autobuild.buildroot.org/results/8f1ddc98653bad08281a048ef839d0a7554bccf0 |     
   mips64    |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/a61f6fbb0900c7f46bb63685e23925df17d7ebe6 |     
    mips     |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/cd0afc24e30654a3e9444d2469fcaeb20e21b0b7 |     
   sh4eb     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/29ee20fdb4dac7ae3cb6e9c033713be6fd9a0d40 |     
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/93ea4aab6da4946556e88aba6fbb34f4c3a6819b | ORPH
   mipsel    | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/24c671e988631ea9aca3fc235b59b084314341c4 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0306b15110dc3a5577dc25e3867577dab0b5aabf | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/9b3b735519c842d677f45b6ee6f2ef7c9b593423 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a73a68881c0204be3d3e93caaa5794b456d1bc72 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1dc5d281d6345811ccbea73a450a3d14b994ee34 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/0ab20331dc8644e37f58087ecec93d5a3bbca654 |     
   xtensa    |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/c1667247f5b676dc98f8ac82747697d05ea2d210 | ORPH
   sh4aeb    |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/1de83c1f33ba92eb55d60178d33a42a95b7abe64 | ORPH
powerpc64le  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/e775bc82888ad3ba20370eb7454464da3e75a041 |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/7231077a946f5b0c2955c2f139875baedbdfd7b3 |     
   sh4eb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5bdbca88ae52c12d7a503cfefd5b78a2ac4e7701 |     
   mips64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/9be8660c82eb052eb10195641fd3e1825d5aaaa8 |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/05f013990038540a7c862ee5aa8bfed11da8c230 |     
    arc      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/8b30fcd1d54eaa714934172573c08e0460bd4d53 |     
   sparc     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/80c74d4e98defdcb5a24f9b14563caaf28b461b8 |     
   x86_64    |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/ebd3b18ba0b75c3892b1887374b2791fd38a4257 | ORPH
microblazeel |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/82d77e612775abe9a485a409edd986f292320ab3 | ORPH
   mips64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/75bed0614fa953bd9bce9144ce5a335545a2397a |     
    m68k     |        host-gawk-5.3.1         | NOK | https://autobuild.buildroot.org/results/64e4dac18c0daf83897a497482c36a4a06f5b710 | ORPH
 aarch64_be  |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/a87d927628edb429d2bbca0c6ecb1af670b7913b |     
    arm      |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/90ca89f9b7142c6fd3dd1244ce839fb5b4388d60 | ORPH
   armeb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/5b6f9c851ecb523b0cc166d86d8c90385efe6d10 | ORPH
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/9ab203ad002a9c922d854abff8c222ff902870d5 | ORPH
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/d29c6ad6e9e15b5622423f4ac8d58ff4425b2488 | ORPH
    arm      |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/d1abe1aa21dfefa3d542e985a211c7fe29fdb472 | ORPH
   s390x     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/55222dafe4b3ae0c281215bda535448d024ff12b | ORPH
    i686     |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/d7a17fa7fd23a0b09fe3a97d0a142a94823ad44d | ORPH
  sparc64    |         host-gmp-6.3.0         | NOK | https://autobuild.buildroot.org/results/d8ea6371e6078437f66bc726e0f7034158ad7f61 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9aea215f75be595989d8f5a5526f160e125a1c22 | ORPH
   sh4eb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2c8a572da252f3468dd144d0b35394f6c02c741c | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/658d4f5e75b1e6d742de5e79ae59ef8424300703 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/647feadaf978a497ecc86a5d08bfed740083df2b | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4bbed2d6de923fd76c4df01cd04a6b95ecf2e703 | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7c1d5437fde0cd8da30c4c24d54e3d7e045f1ff4 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/50bb51953c6c5f2749c0109467a21da87bbe213a | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/31c171a712e80867e67d7e5974daebf5d702957e | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7917b5fbdf261aaf9387cd88f2259c1a8d9437de | ORPH
microblazeel |         host-gperf-3.3         | NOK | https://autobuild.buildroot.org/results/63ade8077c4ed4c86ae9a9cdd3bcde17303fc5d3 | ORPH
loongarch64  |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/4e5f2d09f89c10509386ce0163b8e5e400088a7b |     
   sparc     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/dd8035a048e533eba4bc693b42c77bdbafe721a4 |     
  riscv64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/09a01e01d4303953b9d6a268864753da60fdacf4 |     
  sparc64    |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/7fd78f2e3f5d7d44fe8dcb7285d4fada1d729a1a | ORPH
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/18083de9234ffbef3d5738b37d4fc7ecc30403e1 | ORPH
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/8efe548d327b5e5494d1642f51cbf34b13fcce34 | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/836ad31be9f7c8608c1d6c96703b0c4154f5ba60 | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/61f40278dd1fd0e53fd0c3a8558a60a0ec016f53 | ORPH
  powerpc    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/685718874c31ee530d9191f9e91b25afcaf4a34c | ORPH
   mipsel    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/4d25b5de8ba17dec509c829b3fc483897e008840 | ORPH
  aarch64    |    input-event-daemon-0.1.3    | NOK | https://autobuild.buildroot.org/results/b31dd3363aed6a71b2fded18cce77ccd52ff1d5f | ORPH
   armeb     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/34389d381963b2a30c97d93c72d1a589e7ca966a |     
   mipsel    |            jose-14             | NOK | https://autobuild.buildroot.org/results/ddf4ba12499b57607b8ce13732003d93a7c6941f |     
    i686     |          ledmon-1.0.0          | NOK | https://autobuild.buildroot.org/results/78296b8245c5535077ef7a2eab974095e5d334ee |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/6999e4456240d792a900a5368ae00e95d4042784 |     
   s390x     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/52b5f7fc74bf4825f7458f3817237e1503bfb6ea |     
  sparc64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/4eaad7577e516e718492dea87c2d83ccb8eaaaa3 |     
    arc      |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/631ab00f2023411e814d7156b9a54b64073ba127 | ORPH
 microblaze  |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/5f00a0e6a2c9c0fbcb245c4cf56ed2b0a9a656ca | ORPH
microblazeel |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/3a4d6070ad15a57f27c507fefd20d048d613cd48 |     
 microblaze  |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/296990d3507c5253e23596341bd7fad22e277bee |     
powerpc64le  |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/27de128971b0c6cb8b6c99895dda84d6f616dbb7 | ORPH
powerpc64le  |          libnl-3.11.0          | NOK | https://autobuild.buildroot.org/results/16ffd8d0cb0fb21e1e6142c958a5ce36e7a71409 | ORPH
  aarch64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/a90892f24cb87082a43cf1bea4bd30369c8f2962 |     
    mips     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/3f3d820408069d45165735a3a393652bef3d5620 |     
  sparc64    |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/bbfce69f35cafd56245ebeae79086a8b64592a16 |     
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/856b3193fd1894f941d045a578a5903240db7580 | ORPH
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/394891aa6548ed2720e284fd20e8db0cd15ab1a0 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/44c659a4b4e0da75066aa1ff83288222e9569c10 |     
    sh4      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5c3abc02b7a984ece64d7293714550aa3f95b7da |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c0124574b830151dd03b82bfd31990753ea43a9d |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4e0feea09929f924a0b787ceaab5f1e8f9eed19b |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c6ad08c263224cf42ec60d6c1878dcc95f634731 |     
   armeb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/f81c29b53cfee22ac210f36a89d7d707825283d0 |     
    i686     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/5a168c5d12a0e018483227bdc61a16f5bf77811e |     
   mips64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/97eeafb4b11413c57de4f86c92030c4adf0cfc71 | ORPH
loongarch64  | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/e57a4e703fe25c9da00ab2ddd928384255e78477 | ORPH
  sparc64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/307465d8a624dc12be3c66e2d4e79caebc5717f8 | ORPH
powerpc64le  | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/ac1cf4558719dfa18a1d8de1a1281dfd293f6105 | ORPH
   s390x     |           libuecc-7            | NOK | https://autobuild.buildroot.org/results/f7d5425c709f1b06a567f911c4a8a34d5085a44f |     
  aarch64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/19af3c6fd8ec111818b22bdd56820abdc028570a | ORPH
    arm      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/15a7d2820122fd1fb81b694e65323f5143a8d09d | ORPH
   s390x     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/8e6ea3b3bf558220c010da0597bdcb31499a0fda | ORPH
microblazeel |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/252b8c1855c65caae9696a62e1159e36153e04a2 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f3cacb2f367c74e5efa91514abedb8ca408d139f | ORPH
loongarch64  |          linux-6.16.2          | NOK | https://autobuild.buildroot.org/results/361957f50f77675de2c17078b5758c8314686058 | ORPH
 powerpc64   |          linux-6.16.2          | NOK | https://autobuild.buildroot.org/results/a1f77c88e6a55281b7f8ca29f069c27db799bb87 | ORPH
 powerpc64   |          linux-6.16.2          | NOK | https://autobuild.buildroot.org/results/b267e6aac91c0121b0dcba4948a4be2101226c9d | ORPH
loongarch64  |          linux-6.16.2          | NOK | https://autobuild.buildroot.org/results/aa8fb6de271ddf7864938c3786f2430e2616ab50 | ORPH
  mips64el   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/69318e763227a01ebcc0fcce9daa854b5334c37e |     
 microblaze  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/55b1e448c9f4fd18bcee6082f5f24bc3b384b25d |     
   x86_64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/53ad475f3531f44a89896abf4649e5a19a6bf7d9 |     
  mips64el   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/f122bc1928b736e19cd1f93f72c7370bc9f15888 |     
microblazeel |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/068bbbc2f55d743a2e2c22c214b4cbe1a38c5b84 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a4ac2b74498f1ca46d539633e53dfdc7d335c31b |     
  powerpc    |        netavark-v1.15.2        | NOK | https://autobuild.buildroot.org/results/c91b7f18f20e3b9ed4124a3cb5295709c6e47d58 | ORPH
   xtensa    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/257bd9304021704520dcf8692f313a886abac18c | ORPH
   mips64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/ee55388970cf48d756c3baa3777ddc87d22b1f17 | ORPH
 powerpc64   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/62f38c09fdd398a9f75a3c356ec03bff3da05694 | ORPH
   armeb     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/c92aa0236546101559f4188b691be44ac38634d4 |     
powerpc64le  |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/eca77adab4911e34ffd8f855b5475d5ac5b18e84 | ORPH
    i686     |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/6079a0b998b746fa1fc7946673efef1e02740fc9 | ORPH
  mips64el   |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/69e3a3374bbfbb996186bf820d878d9bf4584572 |     
   sh4aeb    |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/535e24ac8cb94df893e7d60d9032210895d1348c |     
 powerpc64   |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/b828940c84243adcd6bcf882b43e8a3b823c0a90 |     
   arceb     |       paho-mqtt-c-1.3.14       | NOK | https://autobuild.buildroot.org/results/9340f18bcef8ce02d4e511088900d5754af8eba0 |     
   xtensa    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/6d0e7236cf7ee1805a1790ab9c703abc5dd301bc | ORPH
   mipsel    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/582f6e6ae29561c4a7b3a87442ad4380f902ecb1 |     
  riscv32    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/1fbe2374fe7a2d32abfaadf0768f44da98275d47 | ORPH
  riscv64    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/d807488ff36ad6dea970495795b30a6ac15dd2c1 | ORPH
  aarch64    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/dac0075a88cb088e546ad365ed8b2d0d5eb44187 | ORPH
    sh4a     |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/dff7af996679587a8aa04c7d2790f08efbc63838 |     
powerpc64le  |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/b81628e857ea06b586674a73e6973bd43f0d1297 | ORPH
    i686     |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/f2dc25a0656987d5b8f85549a4096f45c843cf65 | ORPH
   mipsel    |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/af050873c45380d39fc9d6ecfaef3439d3cc196e |     
powerpc64le  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/83e02b3ebe5e413d1e8df28e9be9b70dcaf42530 |     
    m68k     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/432f7b1952fd7e27561f701b2c5192c60711ee20 | ORPH
    m68k     |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/b3f55f32e91d9e5ccf889577c550d211a4afe4ac |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/6822b13b787b7878507b8e2e7ec2e81f89892a17 | ORPH
   mips64    | toolchain-external-codesour... | NOK | https://autobuild.buildroot.org/results/97ce9c333c29fdb49890e14e71c020ed022f57ef | ORPH
    arm      |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/a5d7a0fc864b5e1b35b04638363398022a7005f0 | ORPH
    i586     |           uftp-5.0.3           | NOK | https://autobuild.buildroot.org/results/7c8a607de3c4c1a201b74b8a2eb4e984dd8f5fb5 | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/f757812c593756184410761ec5c74320fd50cece |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/919abb3e471ecfa868cda0316583c878106c33c0 |     
   sparc     |         ustreamer-6.37         | NOK | https://autobuild.buildroot.org/results/5b067b68f928d3cf6b85cd9e3799f566b9d36d12 |     
    i586     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/1e78e3e1351675ffc189aecf3485831dc4cfc75f | ORPH
   mips64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/11964996570043272c896e6d74307c3de4bd83e9 | ORPH


Classification of failures by reason for next
---------------------------------------------

               bctoolbox-4.4.8 | 1 
                 dtbocfg-0.1.0 | 1 
libdbi-drivers-0bfae6c43134... | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/8b0cfca103026ddb861cfacc20a0b656c8d17305 | ORPH
  powerpc    |         dtbocfg-0.1.0          | NOK | https://autobuild.buildroot.org/results/ec0a861d9a9fca7aa4ebfbff2b9817069db98a10 |     
  mips64el   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/afb6ce78fae2df73c8fa063991a2f62bbe73afeb |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

host-binutils-arc-2023.09-r... | 1 
                 mdevd-0.1.6.4 | 1 
             tpm-tools-1.3.9.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/a7b161edee2bf7029fc708b8e4ac07d3346ffd00 |     
  mips64el   |         mdevd-0.1.6.4          | NOK | https://autobuild.buildroot.org/results/eb23539b641d76f0c4f4bb0842071c9aa415209c |     
   sh4aeb    |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/aa4f49eec9839afb03c6d6a1beb7cc11d992992d |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

              netavark-v1.14.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        netavark-v1.14.0        | NOK | https://autobuild.buildroot.org/results/757e9118e218eb91f833818b89bf0c5411d1735e | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
