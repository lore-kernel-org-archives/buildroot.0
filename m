Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338D8C83F26
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 20:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68F2240F4F;
	Mon, 28 Jul 2025 20:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTNznzomcBpY; Mon, 28 Jul 2025 20:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D661F40F30
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D661F40F30;
	Mon, 28 Jul 2025 20:44:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EE74127
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 03:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5542F40E3A
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 03:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F48uAI_dv-TL for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 03:16:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46B2740D91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46B2740D91
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46B2740D91
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 03:16:20 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-60780d74c85so6528941a12.2
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 20:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753067778; x=1753672578;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q1lJuWoDcaziLSiWyAtBPdaiF9e6tgzFPpR2VYzxHSw=;
 b=DqyEgqOkRlc2ehzRcEMQvwj2SVdIHY8ny86i2dsHxXzeY71X+1/P/f9Yc87uNQ4gPC
 74SGdeZJn4hX/V7welCYBnmpRLeJCBHzFDshx2Hct6ZKof6C9rwi3x4cK6ZENvEY3jFa
 OVZ15tHVGvlRhNyjbCX3v3hpKAvG9hQW8ph3uE439/Zw7+lBsWltnc7TZsifQaWvoqUv
 +0py5ZDfqCGdrKuABLncq7oyUgl1XbX4SinDk787eM6qpkpWc1RonHhyaUdswxNMO08z
 5p6WoFS8bsRMHW57hE1P2CeDRIJ2SvKdV1AI6OhyQyq54O2guu7wrz2GuIPPSvD65iTw
 qrCw==
X-Gm-Message-State: AOJu0YyyeYVlhIyZgTlgFIhJ54POZxd0kDPxlPh6SFcvwiyPBUrcbX62
 ndJGGG+iVc1RFWbJeAj0dK8Smg+SjUBD69nusFJKjqJgQU74fxzOuKZYJk85eg==
X-Gm-Gg: ASbGncvgF3bH1RkTDu+1tEqRtS34Wif48vzMTsGwBVK2GRmVCxqfBPqrJhGY4s3hz8+
 +UjM2X47RJCStiek0GjNxmu+3xYLXbg3nBRI4Hcl8Blqi1R72qr4xAEFwzt8wQwQaZo89bAdSbX
 7KpQ4E61bCY3NTkAC0QIa7/d1kIDweEIz7LDgicGBGEO1PhbVVGbq7j05BqMQO7K2VfDDHZy/yd
 OARhgyH/SzJKH9NEA6w9tT1AQoPTbWVzATtFOQ2N25ccN+aviTIQwEsKVV1OoD+kRp8gpsPbc+q
 PEKh+R4rzof0ING+fo3X+NuyDNB98phCUoEND/E8aMvQiRWKQHF+WrNAhW/0ySpmdNMubVmOoaA
 UJnHyxO0fxgUbqwLqDkE3S7ClgQ==
X-Google-Smtp-Source: AGHT+IHAkygyj7s3y/U6AtcLPAsy0nBcm1QBib/2rj/Y5KFwlJ+LgnhVPcOWDXQG0oePM2s/eeuMOA==
X-Received: by 2002:a17:907:9809:b0:ae0:ce40:11c6 with SMTP id
 a640c23a62f3a-ae9c9987810mr1712021966b.21.1753067776279; 
 Sun, 20 Jul 2025 20:16:16 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c7d8357sm593955166b.52.2025.07.20.20.16.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 20:16:15 -0700 (PDT)
Message-ID: <687db0ff.170a0220.22b916.d367@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Mon, 21 Jul 2025 03:16:15 -0000
X-Mailman-Approved-At: Mon, 28 Jul 2025 20:44:28 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753067778; x=1753672578; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=q1lJuWoDcaziLSiWyAtBPdaiF9e6tgzFPpR2VYzxHSw=;
 b=XhoEUwDFfLhXW7OFtFgrb2qzfkLx1gW+r5FLF8p6SK/LJIbMT5eTTB7eqI5AnltfNn
 TBPWQighhwVZBcIU9PTg9CLpcqhxPB98yEYOGg6Ud5Q9VbXe60rwxbyUJAEnkgczIw2X
 nnAdzw55XRzjNDQtQznDLeEsa+QhgJGkyX9e9KV4j8TKquKvkBbv/bLEkT+lQg1eIclR
 qwu4xZY0sPIsDLbUgMpakOwjOh8Kri4ZkYI1UKnTV9zs2Rc2U7cRUhP3WzU2UcJ2+Vrr
 ilzCyxF+wZ1dQZ7/yqeKNiTW20ra9urzQEcirZ+PxXI0wQedfMfKUnL0KCfakt0tZ3W+
 xfoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XhoEUwDF
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-20
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

Autobuild statistics for 2025-07-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  7  |  0  | 11  |
  2025.05.x  |  2  |  4  |  0  |  6  |
    master   | 19  | 412 |  0  | 431 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 43
        host-berkeleydb-5.3.28 | 16
              libselinux-3.8.1 | 16
                  cjson-1.7.18 | 14
host-binutils-arc-2023.09-r... | 14
                    yajl-2.1.0 | 11
                   avrdude-8.0 | 9 
                   bash-5.2.37 | 8 
                    gpm-1.20.7 | 8 
         host-mariadb-10.11.11 | 8 
                       unknown | 8 
          host-binutils-2.43.1 | 7 
                liboauth-1.0.3 | 7 
               bctoolbox-4.4.8 | 6 
                       cfm-0.3 | 6 
                 host-gdb-14.2 | 6 
        b43-firmware-5.100.138 | 5 
             berkeleydb-5.3.28 | 5 
             dahdi-linux-3.3.0 | 5 
        liblog4c-localtime-1.0 | 5 
                 openal-1.22.0 | 5 
          aardvark-dns-v1.15.0 | 4 
                 apitrace-10.0 | 4 
             batman-adv-2024.4 | 4 
                  bcusdk-0.0.5 | 4 
glibc-2.41-5-gcb7f206537240... | 4 
           host-doxygen-1.8.18 | 4 
       host-gcc-initial-14.3.0 | 4 
              host-json-c-0.18 | 4 
libmodplug-d1b97ed0020bc620... | 4 
                 libsoxr-0.1.3 | 4 
     linux-5.10.162-cip24-rt10 | 4 
                  linux-6.15.6 | 4 
                   perl-5.40.2 | 4 
             util-linux-2.41.1 | 4 
                 agentpp-4.6.1 | 3 
   azure-iot-sdk-c-LTS_03_2025 | 3 
                 coreutils-9.5 | 3 
                    ficl-4.1.0 | 3 
firmware-utils-86739f2b3ae9... | 3 
            gettext-gnu-0.22.4 | 3 
         host-gcc-final-14.3.0 | 3 
                 host-gdb-15.2 | 3 
libdbi-drivers-0bfae6c43134... | 3 
libftdi1-v1.5-48-g22b4667a8... | 3 
                libsepol-3.8.1 | 3 
          linux-5.10.162-cip24 | 3 
               asterisk-22.3.0 | 2 
                     cpio-2.15 | 2 
            host-binutils-2.42 | 2 
       host-gcc-initial-13.4.0 | 2 
               host-vde2-2.3.3 | 2 
                  iozone-3.506 | 2 
                libgsasl-2.2.1 | 2 
              libopenssl-3.5.1 | 2 
     libphidget-2.1.9.20190409 | 2 
                  libsvg-0.1.4 | 2 
libsvgtiny-ea9d99fc8b231c22... | 2 
                    musl-1.2.5 | 2 
            netstat-nat-1.4.10 | 2 
                  ntp-4.2.8p18 | 2 
                python3-3.13.5 | 2 
                setserial-2.17 | 2 
amazon-ecr-credential-helpe... | 1 
                   atop-2.11.0 | 1 
                    azmq-1.0.3 | 1 
brcm-patchram-plus-15bd6638... | 1 
                    brltty-6.6 | 1 
                  cairo-1.18.4 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
           crucible-2023.11.02 | 1 
                     crun-1.22 | 1 
                   cvs-1.12.13 | 1 
                diffutils-3.12 | 1 
              dropbear-2025.88 | 1 
                 dtbocfg-0.1.0 | 1 
                   dvblast-3.4 | 1 
               dvbsnoop-1.4.50 | 1 
               ebtables-2.0.11 | 1 
                 expect-5.45.4 | 1 
                     gdbm-1.24 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.84.0 | 1 
               graphene-1.10.8 | 1 
                haveged-1.9.19 | 1 
host-am335x-pru-package-5f3... | 1 
              host-audit-3.1.2 | 1 
            host-autoconf-2.72 | 1 
          host-automake-1.16.5 | 1 
               host-gawk-5.3.1 | 1 
  host-gdb-arc-2023.09-release | 1 
                 host-isl-0.26 | 1 
                host-m4-1.4.20 | 1 
     host-python-maturin-1.9.1 | 1 
               host-runc-1.3.0 | 1 
              host-rust-1.86.0 | 1 
 host-softether-4.30-9700-beta | 1 
                  jack2-1.9.22 | 1 
                       jose-14 | 1 
                libheif-1.20.1 | 1 
                 libmbus-0.8.0 | 1 
                  libnl-3.11.0 | 1 
                libnss-3.113.1 | 1 
               libsigrok-0.5.2 | 1 
                 libv4l-1.28.1 | 1 
               libvorbis-1.3.7 | 1 
        linux-headers-5.10.239 | 1 
         linux-headers-5.4.295 | 1 
            live555-2021.05.03 | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250530 | 1 
luajit-a4f56a459a588ae76880... | 1 
                  mbpfan-2.4.0 | 1 
                    mpir-3.0.0 | 1 
                   nanocom-1.0 | 1 
                 netsnmp-5.9.4 | 1 
                openssh-10.0p1 | 1 
                p11-kit-0.25.5 | 1 
                pipewire-1.2.7 | 1 
               procps-ng-4.0.5 | 1 
               pulseaudio-17.0 | 1 
        python-propcache-0.2.1 | 1 
                  readline-8.3 | 1 
                   s6-2.13.1.0 | 1 
     s6-portable-utils-2.3.0.4 | 1 
                    sdl-1.2.15 | 1 
                 siproxd-0.8.3 | 1 
                  snappy-1.2.1 | 1 
                  snmppp-3.5.1 | 1 
                    sslh-2.0.1 | 1 
    start-stop-daemon-1.20.7.1 | 1 
                   thttpd-2.29 | 1 
               tipidee-0.0.5.1 | 1 
toolchain-external-codesour... | 1 
             ufs-utils-7.14.12 | 1 
                     unzip-6.0 | 1 
        vulkan-headers-1.4.317 | 1 
                 watchdog-5.16 | 1 
                   wget-1.25.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/4060153a9c00d899861fb6d8ca182ad922ee2e56 | ORPH
   s390x     |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/a5cf8342351aa776c28d40d65d57495fab82ea93 | ORPH
powerpc64le  |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/38581642eab9bb6a1e340c3c985185315f1849e2 | ORPH
  sparc64    |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/f84d1080e61fa55ffbdbad306a8d836561008b2f | ORPH
    mips     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/59fdcaf3da5f3aa7a5efab4d80af037c84f986a8 |     
   s390x     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/aa44dba16f0e9be420b2383ef2dcdfddc2eea1c6 |     
   s390x     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/407c0e3d326e831a5da75b8381a634e4f0b9da8d |     
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/b4a850c1ff4b9b46267b3233c75d134c79e36b84 | ORPH
powerpc64le  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/b755cc995ce9f549e6e4e5f7c5d63bb91efe8fd6 |     
   mipsel    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/957ea882f75932ecb05af80b925ce3ab473ce172 |     
   mips64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/3109d8fcb7f1b7afd873173a4064fd88ea54a92d |     
 microblaze  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/a8ff385b7f7943017201b52242fef758a6e6d36a |     
  mips64el   |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/c2cec8e53f555ac4006f0703e3437c7e8259ff79 |     
 microblaze  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/15d2eec10272030cd30450d9e4d8b77a0d5106c6 |     
  mips64el   |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/03833a0f624c7cf61a1cc20e6936e1d507451a87 |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/7acaf6581984e2006b451d642d14f14a6b6b99a4 |     
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/3124c7a16a90fb4f825047a6530646919019ce20 |     
   mips64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/6c140a97894860263c032132dbcd758be9b80fbe |     
   s390x     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/683253f50ddefa4d22022967c2ff1a6b97a66fb6 |     
   s390x     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/2296604a01df6d76f3282fea2db46757930a20f4 |     
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/f8dfa0270cec932e2b7a8b44a3c9bba6a68cf83c |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/fb5374d850a7b55d7320895d8f2de348af499616 |     
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/77b0b7c2e7bbd6084701529df95c66fb0aea6ba9 |     
    m68k     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/422ff0df943e469495d8b40d9ae87b53dfe5903c |     
  mips64el   |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/5721149e81be415ea913261fef8a9ddcee34c136 |     
powerpc64le  |  azure-iot-sdk-c-LTS_03_2025   | NOK | https://autobuild.buildroot.org/results/eba3e3982b23c5a16a3b66ce27e6c198b2be2065 |     
    or1k     |  azure-iot-sdk-c-LTS_03_2025   | NOK | https://autobuild.buildroot.org/results/920d14506569f2f2b8b274f416fc65ba98ab0e73 |     
    m68k     |  azure-iot-sdk-c-LTS_03_2025   | NOK | https://autobuild.buildroot.org/results/1c508b867a9194eb607e9209c7d02af87217f59a |     
   arceb     |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/a30bf4785bf71d33350215a98ef3a857c655b126 |     
  riscv64    |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/cbb62b5198b0059daca5734b8f315644fb9f431d |     
    arm      |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/e9dfe63090be04d9ca4726c539034c77b2a33837 |     
 aarch64_be  |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/1a76b49c5f7026f41b8df65bb336bf47d75e033a |     
  sparc64    |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/1f049ef8e19866290c772ba308332a2eaf83ae70 |     
  mips64el   |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/26a6b094d7828b34da7cb3c3f000475f1935467d | ORPH
   s390x     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/df7c54e9754cbb05ef5e7fce7f54ee99c0f66783 | ORPH
    m68k     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/4d098ca8d717451b1fe0a82b75d308fbd2934bbe | ORPH
    or1k     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/d8200daa1824c956254dbd8248c262027ba431bc | ORPH
   s390x     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/e07b672ca1276ec92df8aa86d80c2e5119f8b19b | ORPH
 aarch64_be  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/2eed28b6a3c077fe1f2ee3a7c8fe84814a57b49c | ORPH
    arc      |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/105ba2fe0b87bed522d98e1d74dcd40dacfaf335 | ORPH
   xtensa    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/1ba49543e6e0547dadd865e2ebbe61cbf952765c | ORPH
microblazeel |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/3e0e843eb5aa7e134614ab1eeeb2a03cd63f2ddc |     
   arceb     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/8a5147e5506c6fb17ecdbcdc98874b0ee881ccbb |     
  mips64el   |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/649c6923b258955a7d3997fc5607f5babbddfb44 |     
   sh4eb     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/3bab4a37da7ca51a81b01b4754c60b09258ddcb2 |     
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/bc80cfd5b5d712aeb28a4552d92b8a6935f7f05e | ORPH
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c274360ea7684612b70e628044c02efcaffecef9 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9cbc599e21f3ed2a23107ec7202dfe96e8458aec | ORPH
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/b153907148484227e0e6980ef69b67c7ca998850 | ORPH
  powerpc    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0847d2f40c4249cbaf8aba0e94505309ac7aed37 | ORPH
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/161286481886c9f6997ee112f134e0d6d3155be8 | ORPH
   sparc     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/ae6916bd121efdaaf226eb34d7b5421b427ed8d4 |     
    mips     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/8d189d3bea2bc703c0f3ecb9f48d14a592e94b07 |     
 powerpc64   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/b9f4d9e464b17738cd00e8e0ee8283e9808fd94e |     
   mipsel    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/1127812b1cc3a8ed7961f81056b74af9080beb63 |     
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/edd0d74dc805e979249168fc5552cf4fe9b3d0d0 | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/c1f4ad7af9284bcfedcff94c93ab4fcacf18c140 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/dac18a463d59f1ff51a90fabc312523ad11d4f6e | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/51e0640f00ed9b42902cc25464bbf23e92faa567 | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/c512f606ed1d40a7471f64477ff3f44e467e2acc | ORPH
    arc      | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/5db112b18ce6ea3399d6755a4d82d12f4199c4be |     
   xtensa    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/1848c2b2318c403ee79c06487a88098e1b7372dc |     
   mips64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/c33f4e02cdad5cf7b4809760392cd42fd82e6a8b |     
 aarch64_be  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/f9c95c196586f6a60f53ac1911a975fabd84930e |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/0c86ec03a46381c5c791adc5fe1e62d90b33aefe |     
    m68k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/7f74ba13ee5a7eb000ab359a08c9fd68d935f4af |     
   armeb     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/438adf5ba9f2ded8a2029dc4b491351bcd28852a |     
    arc      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/76d7b8e040306a46effe0f7105a749b78abb66bd |     
   arceb     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/31dcc14f420d8050c998f61b62e8f38675b85a00 |     
   mips64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/86a14a9eb062ef77f20cedd30367c51fd9740cde |     
  aarch64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/f270b942202399833d95092779be4f4270879335 |     
  sparc64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/6ff4ca986ea672e90e77b454047edadad9bc975d |     
    sh4a     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/244cb9982f0487ab98929135ef56148c2e666b87 |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/6121f53ef7e784a2b9b0476d790115edcc899bba |     
   mips64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/0b97aaeb05dc5b4d6cffa44af3d8161279de3c01 |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/e998485111da9d6bb2bbe9fd60c793b58a250667 |     
  mips64el   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/cdb547852c4c9e205bd2fbae93861a68ffcbd2e9 |     
    mips     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/75d536970ecd3bfade816ad22bcab5918a92516e |     
  sparc64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/cbfd69e02f2da4c62edb9ca4f664719718097a31 |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/b9951cd8c224d3f91ebaab0dd31768de6d40d310 |     
  powerpc    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/ff645d0d691daf4a0aeaa127cd509c57c0075501 |     
microblazeel |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/1217ec80088b4001f452faec10728b3e0a9a471b |     
microblazeel |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/33d37393091d7c7df068f6ba54c9c0a1b9c2fd58 |     
  mips64el   |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/e59b85583b6b4be7210da7a48154e37b55824eca | ORPH
   sh4eb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/eb5693bbfda364cc7559f634e388853cb844cbac | ORPH
   armeb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/3054ae9be1ca416f051507c5948bf0cd2dce5b56 | ORPH
   arceb     |           cpio-2.15            | NOK | https://autobuild.buildroot.org/results/be9b0fdcda2efc8dfcb8698c940857f8e937cddf |     
   s390x     |           cpio-2.15            | NOK | https://autobuild.buildroot.org/results/aca94ef47e9830e2a4b73e62688165de006ecbda |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/f1ec69f6086da29de80568aa11554fbcfd238f07 |     
   s390x     |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/3b48a754cb901ef045a9c9dff6e82e194b74dd39 |     
   arceb     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/6497ea4933bb7cb657bc084449f0cc6c0663df6b |     
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/eed36eb8a2f3e1f0670088ba649db5dc694c8ba2 | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/db27e09abdd00f207435af57ce677a34bc240304 | ORPH
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8849f394f3a954cd7ded602eadca67ede8bafc42 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b961793339ffa39461c844d638ff8d848b9302d8 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c94cb7df7db6553199058b7721db9667c5405958 | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/850ee5e21b0c7ce9c4131b32b0b3c20da1d59899 | ORPH
   arceb     |         diffutils-3.12         | NOK | https://autobuild.buildroot.org/results/80fbed3bfd9247809d279c5f6aedcdd5c8869744 | ORPH
    or1k     |        dropbear-2025.88        | NOK | https://autobuild.buildroot.org/results/4144df508f89a953f72071c6cf56a143d3158015 |     
  powerpc    |         dtbocfg-0.1.0          | NOK | https://autobuild.buildroot.org/results/6761eb9d0ac3772253924a52736dcec986b7d781 |     
microblazeel |          dvblast-3.4           | NOK | https://autobuild.buildroot.org/results/e946784d4897dd6f20aa3971f6cd16d0d5d4e8b3 |     
   mipsel    |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/3665e57f89241570ed4a99a20ec689ac5eacd184 |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/c9af57747b23f417979c6b60b3b6a8a96aa538f5 |     
   mipsel    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/d3e75081222468049f05ac5c0bff46dfa3ad804d | ORPH
microblazeel |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/88934920c6117adbbf065729f50874cbb0526a91 |     
    m68k     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/b5c89b7852272dd9b43d4d161f93683414120e2b |     
    i586     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/57b3dca4f3ad2b6e53eff326af2f751415e32988 |     
 microblaze  | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/a3c5607ec87dc5904002c67dbd4c7105a621197c |     
  mips64el   | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/a9f18798c3d33a1ae0d6a2211713191a7148c7a7 |     
   mips64    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/207cf654c655f2c5918ec3d2ed12470c0695d6b9 |     
  mips64el   |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/89bb110e208eeadd716dafa8239303cb04e7dc60 | ORPH
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/04dceb10af2ccbc32f965029a035b46c82556ef9 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/9206c5bdadc7c84c2e0a8035cdf5958473a1a99a | ORPH
    mips     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/2bf90978611d115e1e96d5ad11de903fb7217ebc | ORPH
   armeb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/91b51ae709857368ac13e41c65663a5a7b7c5053 | ORPH
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/d7ff76735a782d047bab5236d45cc2f1579a011e |     
loongarch64  | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/a62ea52eef3aebc56601ab7fe747be5831d98c5a |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/9390ccbbd4ae7cd33b69cfc25372522b8f37df37 |     
loongarch64  | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/af2854a3db50f7e3c6676ebbc43457bc33a6e443 |     
    sh4      |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4871256cfdf589d91c8a89b5d795c2b4f22f3e00 | ORPH
   arceb     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/59d5871f442dfeeaf225ded1eaa9d329717c8e26 |     
    mips     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/a6f68b8682af932491ec733fc6e3146ef5be38a3 |     
    arc      |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/d2715ef53fd2cf8471ca4cd0a9e7bf080a2d0112 |     
   mips64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/5b0e63441ea70b8814829fcfe6a82463a5b9f225 |     
  sparc64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/6b1e1a6a80127a36952ef9d822d742627c49b506 |     
   mipsel    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/761c1ac8e1b057f7f42bbb1b4880815900523175 |     
 aarch64_be  |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/259e46170d578c293e16447cc8f3f037a8105905 |     
    mips     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/499bb492f1c06973de14e3c83c791fa37ccd2e24 |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/751f4a267c645fc853c54cef7ce98d46ec230dbe |     
   mips64    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/8c27a792cd1053b82f3208d0b77ecdec45a23059 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/6a51e52b371cdc6ebdb66aef24bb8a677a4b12b8 |     
    m68k     |        host-audit-3.1.2        | NOK | https://autobuild.buildroot.org/results/c5c40bf743dbe252efd31e43e321c8fecc89e295 |     
  mips64el   |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/7c38f2455a49d9685158c6f947e26b041804063a | ORPH
   armeb     |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/f02534c844781a5ddd5e9c8c5ca7e535a687e0dd | ORPH
   mipsel    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/cda96fcc15eb5e765579729fb1dafd0677bf3744 | ORPH
 microblaze  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/b3e961103091532bd452babe087fe1bef6319e89 | ORPH
 microblaze  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/5a7d8f793b66268d40b406a2833f360ba64be17e | ORPH
microblazeel |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/4d863fa05ec56d09e4f77a0d7060a15dc0fd5df0 | ORPH
   sh4aeb    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/14829255aaf9cae644e4727cda5e8b51a5b5c06a | ORPH
microblazeel |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/f2bfeaffeee5f6a1272249aa806d9dfe79240a9f | ORPH
    i686     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/12ef1fa0755e338de4929ccdffd4d1aa7a02d94a | ORPH
  powerpc    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/42d4dc841cf94ceec5d74f189a6e024ffa1ce82c | ORPH
   sparc     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/3a4915c91ceba2917bd756363057ae5f00a1d1ba | ORPH
    sh4      |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/6e7e3a065d03e50dfb266536269dec468ad86be9 | ORPH
  sparc64    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/940df480a64727aad576565f6f092a0416007013 | ORPH
 microblaze  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/13bd9617edf9bef9e01978002d7154104ba05cdf | ORPH
   sparc     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/8de77de0c93ecd2668a015a7add76e1d4bfa3edf | ORPH
    sh4      |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/c425a78c4a8070c7acea33e15af1d043356d799b | ORPH
   arceb     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/ea02221e51c8d2d4818e929bfdb574ae7ae6c9a7 | ORPH
  mips64el   |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/e3a1bd18f51fea3a176fd70f2659c96f68e06060 | ORPH
 microblaze  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/9a1a1db9ea5a3c1e8573415744762e79847d6301 |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a1182b7a7f1a43ea4e44ab75a75bbb5d26622325 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e850b01b7a479cc0ddd522e17337c9e95e0d1c47 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0b2320a72c980f3a78bfe390dac991759e0d6086 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e5e6c45f21e77cb3376909c5297759bfb53e055b |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/29ebce2721dcd7f32566a531eb0969c3d956805d |     
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f4fc44f41cc8695c8698861e4c726bed7d5d7597 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/30c9d4cefcf37ff08f15803a622665c96bb1e14b |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d578299fc8c52751bf1aa2296d19e8eaa3afac7c |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c918ea84ce962822f87b2a5a460664329bd8c140 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/516fdb53081befa4b458ea3b2b4ea9b9ec704d25 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/45f21b2ed660747d2e694b40e831e8ec7fa2fca6 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/f1c232d6965339534b5c4f5e28edd6d0b889f48b |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/6c1bd4c3b2c93aa03fa6b5b6803468e9cdf6b639 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/6f96019914ff740da49178df968f12f9435a54ae |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/cb8afdfb6df17e25a7a093bdce0e9479e92d9ada |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c5b17b2b649a398ef3d743d10bb09ab22b5d046d |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/acea4a993d9bdd712048716d0f740b82898300c6 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/5fd100330989b05b85cdec4aeda896ff2a1f8793 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/b33de76e34decf14b68f4639d0720b55254c3582 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/7f50eba6773b3d1f6514e761351d86b18424ab52 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/58745042ca2bf166cfca14958ae72172708b1b99 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d96d4d6b16e813725c383b9f30f48e2cba2723ae |     
  riscv32    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/22ca70ea33aeb68de7dadceb31cf61b0956c0b5f | ORPH
microblazeel |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/cc1b98950a29963afe849833e27c5fa50c790044 | ORPH
 microblaze  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/aa6563a558940688bf69449a4bd7c47b9f03fc69 | ORPH
   mips64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/6d12ab8e9fe42b332fbd8ff087640b29c420f8a3 | ORPH
microblazeel |        host-gawk-5.3.1         | NOK | https://autobuild.buildroot.org/results/e09bf738ff17f35b98a6f07fb624a8102373a661 | ORPH
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/5535881caf73972c39feaecc899f6421271ea778 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/a6b23fde3bec5b84411c5c89a849715acbe9dccd |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/58521c6b70a51c993f30cea069ddcf3b02ef45c7 |     
microblazeel |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/496fe0a34a7593d686ac4409e509814f92e5953c |     
  sparc64    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/68b9a7fb35f77a8405ec5accd1707d9c0d827b34 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/0cc7b1e4ec09d12e4e2616551998a81d7a655454 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/77942d84c4daceb18dc9e30fa3ac7cc038f9d426 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/12500a90c88dec28011f20a21e92a99820a6d6ff |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/7afa56f33691f5404291e1d1eda053ef579f2d9b |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/79e4febce3c767e63c3c4680c962650471babfa5 | ORPH
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/154150bf362bb25af2050110cdcee03923a7bd83 | ORPH
  aarch64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/aa7a8c8bb88f6c9b6e74ba6365221d7d7e963029 | ORPH
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/52761a795bd1088fb45e465be2a760d318d9e516 | ORPH
   sparc     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/e74f184a8857a3dca0df1502f3eb26666f72915a | ORPH
   armeb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/7e11b8cad78e8ad25dbfae8453a487f47e942c88 | ORPH
   x86_64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/ef80ad6c098aaecfb71bc3182f008632bcc26004 | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/0bfea684aecfbb0aec55f5f1a8ece2f522dbb7bd | ORPH
powerpc64le  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/7f45a376f84a078438bf1e8860b2df9313b76c94 | ORPH
    arc      |  host-gdb-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/b6244d29fafd91b8bcbe6ecc9fcd1fd20953d5aa | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f14b46b2f1860d8511b68e0c39c074c514855991 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8dddee5d9c5a3484df18ccd0f0e5181f0110cfd5 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8bd0275d0a955e22cd6ade61a6d44480aa17e83c | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8d88e6c57c411ca190d756d82f326c1ca09290e6 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0870db6e7315333c24f50f747be5ea775cd2bde6 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/da229937388c3bbd180aa7d31d6dc748b638c23d | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9d75d03d8505256f43244f141d934d2fd1a3fb99 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/48b8b4f05a779cfdc145cfe5efc6137d527fa256 | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/84e227241b97f18f270fe5af064b629a5ff5a2a9 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f65622f3ed88bf1cbb17265b20286c1b8e449a0d | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/18c12033a37d7da0fbb0724d62b6287759e4410f | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7c06a42cc30229d353de550a2a21b71253fd9a46 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/240fe3422e340a2130c873e6c7143bef971c6851 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/de75316f07b07ce1bfc5d960e26b096dc82b23fa | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/56fe5e9784ccf7baeff32b8459a1889d39749c7f | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/da687111f62e0b8d6de3290702891e837e363cf1 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d5c7eeb4f0e3ab4629eebf7bfb69a52da387f74e | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e3f4ab7c7a6e21895fc32efe31f8f61a2275ee1f | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1f5d53df6e96f157bf332b700111cb594e2a1f6d | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/46933e5afc28f080670865765e6320652a70494a | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/852509a8c145ddb4c4b21bb05d4d3265dd90c864 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/083e94a95188bcd621eaa39b349a9ba086739c45 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b05bbf7b7577c9a66c8f7659522a54a363ff4183 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/220f891a7e7403002a8b42896a69536fb177e37a | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8fd2877eb295ee30b10edd39ffd56515803ed60b | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d7b06ae204269ab76bdf58e9dbae6f5886cd7086 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9db2c6f91d66595420a9bc9291eb2a0eee08c3fa | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/eb1f9a0885021e2fa5cfca41ce25a9072595706a | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cce87341c4d6ade01bfb9978e5628f60c438eeda | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fcce0d53a8d872052177bf0b6153032a49f1be62 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5d29bfe68e5bf02d10ff330fc75e985164bebf1f | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f81118cd444967e47800301ef654f3ac5984722a | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9cf6023d61f1fd32ef5ce8e0fd587d56327bc1d3 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/49f1614982883c9f9b589616d4d0fcf5637c8991 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bba72e26469ae137a0fd50aff083dfedd8555bd4 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c3ea8c983d0f8de42e2ffc478f5de0e80ff5c15c | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b5819c756a642cd0f0419c68701cb466fbbd0061 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d5d749f72fd510d1633fe0a18c82b20ab0ff011e | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/23016aedb0f24c59fb8444e869b6f48ebe516d77 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/25e68ad8946adf788337f4b637570acbd07051b8 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/eee8e3d00a7491bd6d2a8ab68a95c075cc84ccec | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3a792facd76954a5d347586211d15b7656a2a356 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a8853b9238e0c2e4a97b50ee3a9cb6abac5dfc84 | ORPH
   mips64    |         host-isl-0.26          | NOK | https://autobuild.buildroot.org/results/58816488579fb0de9d2511757d5e0c6443c17eaa | ORPH
   mipsel    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/81e67ed2313b970ec3f15fb7cf386b9b14fdd49b |     
    mips     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/18243a31145e9232d77e751eb3b6143333f4bd50 |     
  powerpc    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/24700abf366555003ce0e5fdddf92601403b1868 |     
 powerpc64   |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/2ed1f79149e17224ae77a3e83c49f4e060c1c5e9 |     
   mips64    |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/a5421b43655344c79fa71b81a19a540976ae4bea | ORPH
    mips     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/4d0329eb8a3acb6c2f6196ae128e9d89351bef26 | ORPH
 aarch64_be  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/aac7498a2ffcbc6f29c732b89609f1ee0e68d494 | ORPH
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/2bf6cdb0aa37af80bd6df21aacfacf177fe7370b | ORPH
  mips64el   |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/2689e094b6c76a50871e6afec904ceeec73f666a | ORPH
   x86_64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/b5a0b5f850d9e2e3074d9fb6463015409e630d50 | ORPH
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/00a70535181004f98c3b71cf03053f0cacb66d97 | ORPH
   mipsel    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/c51855ac6ead20cf819a09ea309aeba13b87dd6b | ORPH
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/9397861c6ea6af7ff6df218e4fd41347f36f284c | ORPH
   s390x     |   host-python-maturin-1.9.1    | NOK | https://autobuild.buildroot.org/results/7dd59da15f588dd8c9eb31b2b1afe84d0edc098c |     
  riscv32    |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/8870e929c73dbc2322da678641b2dd53647438ec |     
  aarch64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/65d2ad42415f4287832b99718348981dd1440282 |     
    i586     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/960a81ef6f623a91839c92c4e64b1d9b08857dc8 | ORPH
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/1d78fc042382db1f6723c367d5cfd1eb3e5a4fcb | ORPH
    arm      |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/c648153884df93435c49f9b811ab1a22178a293f | ORPH
   sparc     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/247543d8fa8925475b32d019e6ad2ad5ee85d16f |     
 aarch64_be  |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/4d9fcc19715876e0a90581b0913a194af1ff20d8 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/cd1def4dcee3aaf66ad362bd13a45a40e212c530 |     
  mips64el   |            jose-14             | NOK | https://autobuild.buildroot.org/results/d55517d960d2164ee4b353387b031d1feb1004e6 |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/a16209628716de8b225b9e08334f7698bf5bb1f6 |     
   sparc     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/f46910160ae6a476ecf073bd7b13a7942df27ffe |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/a37cb1138592bde1d38b3821a3e83feb37f3b197 |     
  powerpc    | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/513d25c223fd7443f5cbe411f4c005bf4e915104 |     
   xtensa    | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/ec01574eb2f76c60b61e4f94a9ac17f5d6b8ca20 |     
    m68k     | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/bfd82c8d2ab842915a1c2f2858ee48226d50b169 |     
powerpc64le  |         libgsasl-2.2.1         | NOK | https://autobuild.buildroot.org/results/8293f475534db075542e67941471c6a5aef27d15 | ORPH
    sh4      |         libgsasl-2.2.1         | NOK | https://autobuild.buildroot.org/results/f06f2667ce950a5ec9b5bc330b7aaa701e5a4206 | ORPH
  mips64el   |         libheif-1.20.1         | NOK | https://autobuild.buildroot.org/results/bd8309fad55a8209ca7e05f4f3a4f1e78d14bed3 |     
    or1k     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/e9ac1f50c6e6b4581fb229fff1cb5e25ce740ae5 |     
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/c875b7a9ff0acd7d8537b39c36f4433bc0b932f2 |     
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/f6dd74a80ff0e93bbdb766ac45c34940fc24c453 |     
   armeb     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/9bcba57e3cb62e00b954a66cdfe8fd776c134f3a |     
    m68k     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/7182515e10118153b6f4f98fb780b6b4775f03f8 |     
  mips64el   |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/8029d4c4756c0ff6cc455c9b4e2beb80c88ac49a | ORPH
   sparc     | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/369c615e5a481279845bd0fca6618bfbd366b9d4 | ORPH
microblazeel | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/1b51b455492c3aebb4cfcc1520134674099fc042 | ORPH
 aarch64_be  | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/3174c33cbaf7549f94c24ce4a8553918abba09f6 | ORPH
 aarch64_be  | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/a591eb2860fefe734097963e99a352587bdc8c6c | ORPH
powerpc64le  |          libnl-3.11.0          | NOK | https://autobuild.buildroot.org/results/ab3b8febac50a3efb7eb9fed26bb42104fb336b1 | ORPH
   mips64    |         libnss-3.113.1         | NOK | https://autobuild.buildroot.org/results/260759556dbbdd53bbdc787ddb1c2be9a9fec143 |     
   armeb     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/2d866fe1a1785f4c455594baede57203c5678e2d | ORPH
powerpc64le  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/d794080d83161db2d35ed4d24ecde6c683da7f48 | ORPH
    mips     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/335f05db0e860283633075b0e5c7da4f8722b037 | ORPH
 powerpc64   |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/1d483d4f8b6870670726d7359f513ef1a406e925 | ORPH
  mips64el   |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/1dc8b77ae12f5c90bde5f4785be6aa7342bd0df4 | ORPH
  mips64el   |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/f9fcb9c24ab8c1fab0e2569f6c481535b1db4ae6 | ORPH
    mips     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/08bf4256d668c283fdbe7aeea92243948c05db34 | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/7cfdae7f32732280c122cbb8c861e7a0f91261fd | ORPH
    arc      |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/fd293bd4717d4e08191261cb220245b3c9e2930b | ORPH
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/1fa4d74dedf05c8b18465e9dbf4c601607a4861b |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/668535e9e5837f6e8bc33d6deaf16845566ed4ca |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4513ac277a5b4ee14747f1b7228c067bc770e969 |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/cbb043e9e8293834b63e12f922761cf6aa0ce315 |     
  mips64el   |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/7fbce6ad41b418297136cc84491334ef84047670 |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0d3915d1ca27256d083594da7475fc2a428497bb |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/60af611436dff673a1313f80878816b30949af60 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/cb47e21ead750d7fb36457dcf521aecb5f597c8b |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8a4a2b1d478117a7bf33d5c9868b8c1e16b27e9d |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0186d7a9716aa1b0d4209189abf1fa67ca072bd2 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/731eb755fa11c8290c49ca69c60e90b99b6e005f |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/af9aefd560bdaa059d42a48a84a347255eba2937 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/eebe54555d66a553f5ebd454657e8f93adbf0ace |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e662f403e88cc8b248e3571a9ca32a07529cd282 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/676e040f62e17441fba8b39f46c37aa9ca0c6be0 |     
  mips64el   |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c187468e437cd3af8634540e06eba95083cd2a5f |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/babd488d0e95bdb183283bb848a35829a0a28622 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d6e9b9be6e629998b0a429b2b778f0375bb6bd27 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/79065ce0064fd171bf44c10e75ae57108d89c8c7 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/052004172faa14cd2ed3378bc4ed6300febf43d4 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/8ec965d8db1e349297c8d9654f48b9122f8b5701 |     
 microblaze  |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/f8f4501930fcabdac447c809130d99096531e88e | ORPH
   s390x     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/3ebd465871ae69786ef2c1765fea061914fbf822 |     
   sparc     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/ab3ee454d39d6c53d7563bf8d4faf2a62efe52b4 |     
 aarch64_be  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/54ed5037b857f7d9233dd3b8386e640a836361b6 |     
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/5405892888c652efafb19e57ed4bac086ff4569d |     
   xtensa    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/0189e11c71b404b68d33a674ad4690ecf99cd7f4 |     
   mips64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/b64eb41951a2b860b687b55f9394d7a6c1202707 |     
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/b2982cba9ffa9f192fd7ebedd742c11f98f26f77 | ORPH
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/8e971a30fac4516185d520c510c31ecf561a7185 | ORPH
    m68k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/26287721dd3e1035ec323197fe734d922af2f17b |     
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/c61356b24103ba8b62e2246ee9c0439543922c0f |     
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/376e9cd2a302ace183d34ecbcd86cd551facd352 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/99bd748d9be2903745b6654ed018cd8db1adba32 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/814779e390145e4c0476a23f7d4d2828d316acca | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/c6dafdeaba9adc02816f7ab42baa9662c5d5a239 | ORPH
    or1k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f4e02745196d28fc9a62a550f6c508c3cc67e74f | ORPH
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/cc0a699a6249de753b00a61337f8e9d70c020248 | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0543a46881d205d694f5341aa0f074c4eca55184 | ORPH
    arm      |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/ba3e5f49ad1d746ce86b95afc38bb576a6edc46b | ORPH
  sparc64    |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/3ff20136f1955d031ba379a0102bbbfecbc76b3d | ORPH
   s390x     |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/e60a57a20a3372235a2f32792f100f3353a07da0 | ORPH
powerpc64le  |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/27f8c927b1c8faf39a5f2b267104e82ae73c3abb | ORPH
loongarch64  |     linux-headers-5.10.239     | NOK | https://autobuild.buildroot.org/results/8ca373a87110afa0e48e284c4a4e6b4423c7941b | ORPH
loongarch64  |     linux-headers-5.4.295      | NOK | https://autobuild.buildroot.org/results/76393c8894ca91acbdebe00ed1f27e1cd1ece51f | ORPH
 microblaze  |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/5ef40b720695529b96befe480c6d4a9a5765df37 | ORPH
   x86_64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/724699d87bbefd6701b4d0d42be19d5847b8966b |     
    or1k     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/f3e03b9a1a69988d6497f36c9d64a37a66e9ad20 |     
  powerpc    | luajit-a4f56a459a588ae76880... | NOK | https://autobuild.buildroot.org/results/c59fda453e22ebd2b08008b03a6dc895c9823818 |     
    arc      |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/6cb9f574cd619841c754c5bf649da69118258a32 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2724d4506d792a5b4ca8546428a3577db6125bfb |     
loongarch64  |           musl-1.2.5           | NOK | https://autobuild.buildroot.org/results/aa2eebc8c2777d9ac458b39a20b983279548ae21 |     
loongarch64  |           musl-1.2.5           | NOK | https://autobuild.buildroot.org/results/084f1d9bfab2bc56f4bee3be96f224681d353624 |     
    mips     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/1e74ef983c13b54a47f74e1deed9ecd97c2d75d1 |     
   s390x     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/6b1573f1a9411ed685525a7e23e4b6b4a6d8d17c | ORPH
  sparc64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/8e8879e105617d4e1d088ffaa1a8d82002f3c758 | ORPH
   sh4eb     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/73c21f44cc19ab0c8edaadc885bd207ce440a1b2 | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/95a0e1c8f6732a6da7d6e43080a7c643ec57d9c6 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/724ca75b2866eaf87762810b50f5c1118c32bead |     
    m68k     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/3f5ee81e7d51f73d753a948e60b7363c80a73a7b | ORPH
    arc      |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/46b3f35e9e9a77c496f10e14aff9ad50ceae17ea | ORPH
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/9464e8d2c2bf70f00e437eac2f66739c9af0aede | ORPH
  powerpc    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/1b8168b032748f042cfa3bf89d65e96b95f8584d | ORPH
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/a55ecfdd68afa9db15567a88b7179ba457881905 | ORPH
    arm      |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/f871f98142683265c2c1f81ee21e91e2a1718bca | ORPH
    mips     |         p11-kit-0.25.5         | NOK | https://autobuild.buildroot.org/results/f8bd0089ac2649cee673422843322c4de45304b8 | ORPH
    arc      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/fe5aa6a59fddace8a76c7de6938775cf38d2ea28 |     
microblazeel |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/c929e65a43bf712e3cbc3f3ade679bf0b568b69e |     
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/20534f5c153bf9b2b7d0cd5440f77eabc6d55797 |     
  powerpc    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/1f01aeeb08a526f838a309a33f65f148dd7bd9aa |     
 microblaze  |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/1136f9f2631a7bcbcbc8c91cd1b111aa3aaaafe3 |     
   sparc     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/fbb4d949cf58bc5a32ef2f14d7b5662041dd5231 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/d8b058399897402532597b661dac59c596298d11 | ORPH
   armeb     |     python-propcache-0.2.1     | NOK | https://autobuild.buildroot.org/results/d0a1afdd4d09634fea4b5be3b902298042f787b0 |     
    sh4      |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/e296e04e5c2847b24185e05c8879f5a5b583699c |     
   sh4eb     |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/b017f4cb40f6be32bf03198bdfc96c0788d75a94 |     
   mips64    |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/cd0561721da94c0bc0fa756077c41fefc65fab1e | ORPH
microblazeel |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/06a48fc7976bff0dfe676bdc67425d0d6548af23 |     
  mips64el   |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/b463563e8d69856493fdef7cfd05f230b7a78e42 |     
   s390x     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/d3290fcf74d2a1d0183b03cd50148485a533ed23 | ORPH
  mips64el   |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/c2e049e34bbc676fc7498e5fca31fc99671d257f | ORPH
    arm      |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/0d4f861d231a26044011834f0c031c1f5309564d | ORPH
   s390x     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/2df69054b010c17626efa36ca059ff1e78756dff |     
  sparc64    |          snappy-1.2.1          | NOK | https://autobuild.buildroot.org/results/f8da28bbeed18e759f371f48f8a2382f21285564 | ORPH
loongarch64  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/24d775584ae427646389f38bac03d86f9f29f1eb |     
  sparc64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/e45dab30d267ed0888e12be9bfaac493816aeaa0 | ORPH
   mipsel    |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/89035b63b36e9fc40c96ff9947a57f53f2946098 | ORPH
 powerpc64   |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/747338fe14814d12d732a856678846c9d23559fd | ORPH
   x86_64    |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/6ac448cda31644ff088d97a9f622dd31e53fb03e |     
   mipsel    | toolchain-external-codesour... | NOK | https://autobuild.buildroot.org/results/a5fbc3bacebe2eb3f55710b27b361db46100a741 | ORPH
   xtensa    |       ufs-utils-7.14.12        | NOK | https://autobuild.buildroot.org/results/b69472d2eaf27dfcc97c300b96868cab52068ce9 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c335f133960841b628316452ce11ba3081c8a405 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/c308f4e2b333f7776de5feb56eb159d9dd6b8719 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/37f88b57ca538d23b1201ac15ecf9bb81b813c82 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/cedb960c8441ab94f9a48cd8397ed7f883afb8aa |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/f5467cfeff14e41266c3bd3f7e88f8218d835c44 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/76949f9628433ef71876b060bc488a2d28b0caf3 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/39ae68219c644730dc26e8b04fc474e9afa1f192 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f1afa79b1a50f515d9dc45f5268ef03546c98045 |     
  powerpc    |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/33f8ca5ffae09954ca57af053a2f7efb1aac998a |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/fdfe282a8bbd05e62677e8c692d19b0041203583 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/96031a4d3bc125692e9c235890b0a5f89eec91b4 | ORPH
    arm      |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/99c88a0b3de1ece72f4cbf2ba375b4599e1223e7 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/15f56ed28eb8943df015791b068faf3c2db25f6c | ORPH
microblazeel |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/1e7d3cdbbc0b3f27a00424574c26e799bbb5eb33 | ORPH
   s390x     |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/4b032b266b70b65ad78e1f8044e218289e9b0f8a |     
    sh4      |          wget-1.25.0           | NOK | https://autobuild.buildroot.org/results/02b3d12e86a8b6942be6d4966900754a790813bb |     
    sh4a     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/0606e5b25bcd84596df5d5316dc9068a93e3b248 | ORPH
    arm      |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/912bb5d3479104446b774107cf70d634e9ddd8ff | ORPH
 powerpc64   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/a3201c40625d41460a0ae78b80862fda377c4f08 | ORPH
   mips64    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/c7177bc2195279469bc983dd8703eef0189e4fd5 | ORPH
   mips64    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/ad9029572300babd575c74198688d0a88659f6c0 | ORPH
   mips64    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/e3e3ef1be681f71bafd23fa34b56b0fe8731d4f9 | ORPH
  mips64el   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/93ba466b86dc1ac6e0e5b7b2fc92a143fb8e064b | ORPH
 powerpc64   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/b06dfb739182d5f13f66c11a090214091e4d8cb6 | ORPH
   sparc     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/deffda57ee58711d834a1bf790c986fee21b4775 | ORPH
  powerpc    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/2232e1b481c808bcfa4f3ba24c27f22306db2431 | ORPH
    arm      |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/b52f2309d210afaa2c04fcc6fdbde7b9821bdd59 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  cmake-3.31.5 | 1 
                   eza-0.20.19 | 1 
        host-berkeleydb-5.3.28 | 1 
                   host-go-src | 1 
              host-rust-1.82.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
toolchain-external-bootlin-... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          cmake-3.31.5          | NOK | https://autobuild.buildroot.org/results/ec4fb4b71ef8b94e244527aaba2b6da1401ffc20 |     
   s390x     |          eza-0.20.19           | NOK | https://autobuild.buildroot.org/results/d2b8e40991a1db9b803eb5fa4c5e71e81dba7004 |     
 aarch64_be  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/640790ec59ffb1b0893b434fb9c95214b328bc39 | ORPH
    arm      |          host-go-src           | NOK | https://autobuild.buildroot.org/results/7c13e51a1ba1a1535a9e6253c90dcebda7b337cd |     
  powerpc    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/4e71c4a27cbbd0740be1e41f3edca773d6000c01 |     
   s390x     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/e65935567254dfd8313d4612c1015d424cebd5bd |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/40cb68d95e441aa2e955befc63de288c1d092af7 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                       unknown | 2 
      passt-2025_02_17.a1e48a0 | 1 
                petitboot-1.15 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/41bc2d619a69cc877798f0db188575be6ba1aa43 | ORPH
   armeb     |         petitboot-1.15         | NOK | https://autobuild.buildroot.org/results/2436c5e11d3b6376322131114943c66532abe312 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/13e70f063ed9eaf62cd2395dfe44211eb3945287 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/99ba5d42246d82436b56cce3c762bdfda21362d6 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org         |   version    |   upstream   | orph?
-------------------------------+----------+-----------------------------------------------+--------------+--------------+-------
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.4        | ORPH
                       acsccid |  DISTRO  | https://release-monitoring.org/project/015661 | 1.1.11       | 1.1.12       |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/013117 | 3.37.2       | 48.1         |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/021316 | 4.6.1        | 4.7.2        |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2025.2       | ORPH
                 android-tools |  GUESS   | https://release-monitoring.org/project/013989 | 4.2.2+git... | 16.0.0_r2    |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/006170 | 10.0         | 13.0         |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 3.1.7        | 4.1.1        |     
                           apr |  DISTRO  | https://release-monitoring.org/project/000095 | 1.7.5        | 1.7.6        |     
                         argus |  DISTRO  | https://release-monitoring.org/project/000107 | 3.0.8.2      | 5.0.2        | ORPH
                      asterisk |  DISTRO  | https://release-monitoring.org/project/009838 | 22.3.0       | 22.5.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/007841 | 2.50.0       | 2.57.0       |     
                           atf |  DISTRO  | https://release-monitoring.org/project/021394 | 0.21         | 0.23         | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/007962 | 2.36.2       | 2.36.3       |     
                          atop |  DISTRO  | https://release-monitoring.org/project/000135 | 2.11.0       | 2.12.0       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/015225 | 3.1.2        | 4.1.0        |     
              autoconf-archive |  DISTRO  | https://release-monitoring.org/project/000142 | 2023.02.20   | 2024.10.16   | ORPH
                      automake |  DISTRO  | https://release-monitoring.org/project/000144 | 1.16.5       | 1.18.1       | ORPH
                       avocado |  DISTRO  | https://release-monitoring.org/project/013385 | 98.0         | 111.0        | ORPH
                       avrdude |  DISTRO  | https://release-monitoring.org/project/010751 | 8.0          | 8.1          |     
                   babeltrace2 |  DISTRO  | https://release-monitoring.org/project/007137 | 2.0.6        | 2.1.1        |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.44     |     
                          bash |  DISTRO  | https://release-monitoring.org/project/000166 | 5.2.37       | 5.3          | ORPH
               bash-completion |  DISTRO  | https://release-monitoring.org/project/005667 | 2.11         | 2.16.0       | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/014740 | 2024.2       | 2025.2       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/019529 | 2024.4       | 2025.2       |     
                            bc |  DISTRO  | https://release-monitoring.org/project/000170 | 1.07.1       | 1.08.2       | ORPH
                  bcache-tools |  DISTRO  | https://release-monitoring.org/project/021397 | 1.0.8        | 1.1          | ORPH
                           bcc |  DISTRO  | https://release-monitoring.org/project/012803 | v0.34.0      | 0.35.0       |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/021323 | 1.73         | 1.75         | ORPH
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/014746 | 4.4.8        | 5.4.24       | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/014378 | 4.4.8        | 5.4.24       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/080042 | 4.4.8        | 5.4.24       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.14      | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/014923 | 9.18.33      | 9.20.11      | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/007981 | 2.43.1       | 2.44         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/000192 | 2.15.1       | 3.1.2        |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/013618 | 28.0         | 29.0         |     
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.83         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.83         |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/000211 | 7.20.2       | 8.0.2        |     
                         boost |  DISTRO  | https://release-monitoring.org/project/006845 | 1.83.0       | 1.88.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/021578 | 4.3.1        | 5.3.7        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/000214 | 3.5.0        | 3.8.1        | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.5.0       | 7.6.0        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.23.3       | 0.23.5       |     
                        brltty |  DISTRO  | https://release-monitoring.org/project/000220 | 6.6          | 6.8          |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/000227 | 6.10         | 6.15         | ORPH
                        bustle |  DISTRO  | https://release-monitoring.org/project/006428 | 0.8.0        | 0.12.0       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/021325 | 0.5.10       | 0.6.4        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/021326 | 0.5.5        | 0.5.7        | ORPH
                       cairomm |  DISTRO  | https://release-monitoring.org/project/007959 | 1.16.2       | 1.18.0       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/010888 | 0.0.25       | 0.303.1      | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/011515 | 0.10.4       | 1.2.0        |     
                          ccid |  DISTRO  | https://release-monitoring.org/project/002612 | 1.5.2        | 1.6.2        | ORPH
                          cctz |  DISTRO  | https://release-monitoring.org/project/017090 | 2.4          | 2.5          |     
                       chartjs |  DISTRO  | https://release-monitoring.org/project/085785 | 3.9.1        | 4.5.0        | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/000276 | 3.8.1        | 20200710     |     
                chocolate-doom |  DISTRO  | https://release-monitoring.org/project/008547 | 3.0.1        | 3.1.0        |     
                        circus |  DISTRO  | https://release-monitoring.org/project/021726 | 0.16.1       | 0.19.0       |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/020578 | 2.3.2        | 2.5.0        |     
                   cloudflared |  DISTRO  | https://release-monitoring.org/project/186920 | 2025.1.0     | 2025.100.150 |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/000306 | 3.31.8       | 4.0.3        |     
                        cmocka |  DISTRO  | https://release-monitoring.org/project/011779 | 1.1.5        | 1.1.8        |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/000330 | 4.3.2        | 4.3.8        |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/021882 | 0.9.1        | 0.10.1       | ORPH
                      composer |  DISTRO  | https://release-monitoring.org/project/009710 | 2.5.8        | 2.8.10       |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/096793 | 2.1.8        | 2.1.13       |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/000338 | 1.4.7        | 1.4.8        | ORPH
                    containerd |  DISTRO  | https://release-monitoring.org/project/016460 | 2.0.2        | 2.1.3        |     
       containers-image-config |  DISTRO  | https://release-monitoring.org/project/378977 | v5.35.0      | 5.36.0       | ORPH
                     coreutils |  DISTRO  | https://release-monitoring.org/project/000343 | 9.5          | 9.7          | ORPH
                   cpp-httplib |  DISTRO  | https://release-monitoring.org/project/274636 | 0.19.0       | 0.23.1       |     
                        cppzmq |  DISTRO  | https://release-monitoring.org/project/018648 | 4.10.0       | 4.11.0       |     
                      cracklib |  DISTRO  | https://release-monitoring.org/project/000362 | 2.9.11       | 2.10.3       |     
                          criu |  DISTRO  | https://release-monitoring.org/project/000366 | 3.19         | 4.1          |     
                      crucible |  DISTRO  | https://release-monitoring.org/project/267616 | 2023.11.02   | 2025.05.28   |     
                       crudini |  DISTRO  | https://release-monitoring.org/project/021669 | 0.9.5        | 0.9.6        |     
               cryptodev-linux |  DISTRO  | https://release-monitoring.org/project/021409 | 1.13         | 1.14         | ORPH
                       cukinia |  DISTRO  | https://release-monitoring.org/project/138119 | 0.6.0        | 0.8.0        | ORPH
                          cups |  DISTRO  | https://release-monitoring.org/project/000380 | 2.4.11       | 2.4.12       |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/005541 | 1.28.17      | 2.0.1        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/021335 | 2.11.0       | 5.0.0        |     
                          dado |  DISTRO  | https://release-monitoring.org/project/058442 | 1.8.3-1      | 2.2.0-1      |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/021412 | 3.3.0        | 3.4.0        | ORPH
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/010252 | 3.3.0        | 3.4.0        | ORPH
                         dante |  DISTRO  | https://release-monitoring.org/project/014716 | 1.4.3        | 1.4.4        | ORPH
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.9        | 3.0.20       |     
                     darkhttpd |  DISTRO  | https://release-monitoring.org/project/000391 | 1.15         | 1.16         |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.13.4       | ORPH
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.3.6        | ORPH
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.2.2        | ORPH
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.4.1        | ORPH
                        davfs2 |  DISTRO  | https://release-monitoring.org/project/007487 | 1.7.0        | 1.7.1        | ORPH
                          dbus |  DISTRO  | https://release-monitoring.org/project/005356 | 1.14.10      | 1.16.2       | ORPH
                   dbus-broker |  DISTRO  | https://release-monitoring.org/project/271475 | 36           | 37           |     
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/000402 | 1.2.18       | 1.4.0        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/015086 | 7.2.641      | 7.3.1        | ORPH
                      ddrescue |  DISTRO  | https://release-monitoring.org/project/000410 | 1.28         | 1.29.1       | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/021341 | 4.11         | 5.23.1       | ORPH
                    dehydrated |  DISTRO  | https://release-monitoring.org/project/011312 | 0.7.1        | 0.7.2        |     
                         delve |  DISTRO  | https://release-monitoring.org/project/040149 | 1.22.1       | 1.25.1       |     
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/000421 | 0.26         | 0.28         | ORPH
                        dialog |  DISTRO  | https://release-monitoring.org/project/000431 | 1.3-20220117 | 1.3-20250116 | ORPH
                         dillo |  DISTRO  | https://release-monitoring.org/project/000438 | 3.0.5        | 3.2.0        | ORPH
                          dlib |  DISTRO  | https://release-monitoring.org/project/018600 | 19.24.9      | 20.0         |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/021342 | 2024.4       | 2025.1       |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/000456 | 2.3.21.1     | 2.4.0        |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/021418 | 0.5.21.1     | 2.4.0        |     
                          dpdk |  DISTRO  | https://release-monitoring.org/project/000459 | 24.11.1      | 25.03        |     
                        dracut |  DISTRO  | https://release-monitoring.org/project/010627 | 059          | 107          |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/000462 | 9.21.4       | 9.31.0       |     
                     dropwatch |  DISTRO  | https://release-monitoring.org/project/021344 | 1.5.4        | 1.5.5        |     
                            dt |  DISTRO  | https://release-monitoring.org/project/021844 | 18.32        | 21.27        | ORPH
                       dtbocfg |  DISTRO  | https://release-monitoring.org/project/235269 | 0.1.0        | 0.1.1        |     
                      dump1090 |  DISTRO  | https://release-monitoring.org/project/231403 | 9.0          | 10.2         |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 1.1.2        | 1.2.2        | ORPH
                     e2fsprogs |  DISTRO  | https://release-monitoring.org/project/000646 | 1.47.2       | 1.47.3       | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/017392 | 1.7          | 1.8.2        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/017770 | 3.1.7        | 3.2.3        |     
                            ed |  DISTRO  | https://release-monitoring.org/project/000659 | 1.20.2       | 1.21.1       | ORPH
                           efl |  DISTRO  | https://release-monitoring.org/project/006128 | 1.26.3       | 1.28.1       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/000667 | 24.07        | 25.07        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/005679 | 0.192        | 0.193        | ORPH
                           ell |  DISTRO  | https://release-monitoring.org/project/017781 | 0.69         | 0.78         | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/006601 | 2.3.3        | 2.8.10       |     
                          enet |  DISTRO  | https://release-monitoring.org/project/000696 | 1.3.17       | 1.3.18       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/000698 | 0.25.4       | 0.27.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/000707 | 26.0.2       | 28.0.2       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/017060 | 1.0.23       | 1.0.26       |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/045375 | 1.0.23       | 1.0.27       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/008757 | 1.0.31       | 1.0.33       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/020220 | 1.0.17       | 1.0.19       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/009302 | 0.6.14       | 0.9.0        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/010576 | 1.0.54       | 1.0.58       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/009222 | 1.0.30       | 1.0.33       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/010455 | 1.1.21       | 1.1.24       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/008643 | 1.0.26       | 1.0.28       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/045378 | 1.0.16       | 1.0.20       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/009283 | 1.0.13       | 1.0.15       |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/063188 | 1.8.5        | 1.8.10       |     
                      execline |  DISTRO  | https://release-monitoring.org/project/005482 | 2.9.6.1      | 2.9.7.0      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/000767 | 2.6.3        | 2.6.6        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/094441 | 1.2.5        | 1.2.9        |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/000769 | 0.27.6       | 0.28.5       |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.20.19      | 0.23.0       |     
                         faad2 |  DISTRO  | https://release-monitoring.org/project/013755 | 2.11.1       | 2.11.2       |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/012048 | 1.37.1.1     | 1.37.1.2     | ORPH
                      faketime |  DISTRO  | https://release-monitoring.org/project/021348 | 0.9.10       | 0.9.12       | ORPH
                         fastd |  DISTRO  | https://release-monitoring.org/project/017116 | 22           | 23           |     
                          fcft |  DISTRO  | https://release-monitoring.org/project/143240 | 3.1.8        | 3.3.2        |     
                           fio |  DISTRO  | https://release-monitoring.org/project/000806 | 3.38         | 3.40         |     
                     firewalld |  DISTRO  | https://release-monitoring.org/project/009989 | 2.0.2        | 2.3.1        | ORPH
                       flannel |  DISTRO  | https://release-monitoring.org/project/007421 | 0.26.0       | 0.27.1       |     
                          flot |  DISTRO  | https://release-monitoring.org/project/007184 | 0.8.3        | 4.2.6        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/000823 | 1.3.7        | 1.4.4        | ORPH
                    fluent-bit |  DISTRO  | https://release-monitoring.org/project/267335 | 4.0.3        | 4.0.4        |     
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/010437 | 2.4.6        | 2.4.7        |     
                           fmt |  DISTRO  | https://release-monitoring.org/project/011526 | 11.0.2       | 11.2.0       |     
                       fmtools |  DISTRO  | https://release-monitoring.org/project/021435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/000826 | 4.7.0        | 6.7.2        | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.16.2       | 1.23.0       |     
                         fping |  DISTRO  | https://release-monitoring.org/project/000834 | 5.2          | 5.3          |     
                      freeipmi |  DISTRO  | https://release-monitoring.org/project/000848 | 1.6.14       | 1.6.15       |     
             freeradius-server |  DISTRO  | https://release-monitoring.org/project/000853 | 3.2.6        | 3.2.7        |     
                           frr |  DISTRO  | https://release-monitoring.org/project/018555 | 10.3.1       | 10.4.0       |     
                    fscryptctl |  DISTRO  | https://release-monitoring.org/project/270981 | 1.0.0        | 1.2.0        |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.13         | 1.15         |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/021438 | 1.9.1        | 1.13.2       |     
                         fwupd |  DISTRO  | https://release-monitoring.org/project/005833 | 2.0.4        | 2.0.12       |     
                          gawk |  DISTRO  | https://release-monitoring.org/project/000868 | 5.3.1        | 5.3.2        | ORPH
                           gcr |  DISTRO  | https://release-monitoring.org/project/011801 | 3.40.0       | 4.4.0.1      | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/000881 | 3.8.2        | 3.11.3       |     
                          gdbm |  DISTRO  | https://release-monitoring.org/project/000882 | 1.24         | 1.25         | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/009533 | 2.42.12      | 2.43.3       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/067634 | 2.5.5        | 2.8.15       |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/018420 | 2.4.1        | 2.5.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/000898 | 0.22.4       | 0.26         | ORPH
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/011337 | 15.5.0       | 18.2.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/021353 | 2.76.0       | 2.80.1       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/007960 | 2.76.0       | 2.84.0       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/001181 | 1.0.0        | 1.0.1        | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/008732 | 0.7.0        | 0.7.1        |     
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/001202 | 4.0.0        | 4.0.2        |     
                      gnuchess |  DISTRO  | https://release-monitoring.org/project/001206 | 6.2.9        | 6.2.11       | ORPH
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/001215 | 2.4.7        | 2.4.8        |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/001221 | 3.8.9        | 3.8.10       | ORPH
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/021085 | 2.3.2        | 2.6.0        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/005410 | 6.2.0        | 7.6.0        | ORPH
                         grout |  DISTRO  | https://release-monitoring.org/project/375897 | 0.10.3       | 0.11.0       |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/019117 | 1.66.1       | 1.73.1       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/013139 | 45.0         | 48.0         |     
                           gsl |  DISTRO  | https://release-monitoring.org/project/001267 | 2.7.1        | 2.8          | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/001262 | 1.6.3        | 1.6.4        |     
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/021856 | 1.24.11      | 1.27.1       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/021846 | 0.13.1       | 2.2.0        |     
                gst1-interpipe |  DISTRO  | https://release-monitoring.org/project/021847 | v1.1.8       | 1.1.9        | ORPH
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/021848 | 1.24.11      | 1.26.4       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/021849 | 1.24.11      | 1.26.4       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/021850 | 1.24.11      | 1.26.4       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/021852 | 1.24.11      | 1.26.4       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/015187 | 1.24.11      | 1.27.1       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/003881 | 1.24.11      | 1.26.4       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/021853 | 1.24.11      | 1.26.4       | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/021854 | v0.8.1       | 0.8.2        |     
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/021855 | 1.24.11      | 1.26.4       | ORPH
                          gstd |  DISTRO  | https://release-monitoring.org/project/235022 | 0.15.0       | 0.15.2       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/001263 | 1.24.11      | 1.26.4       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.24.11      | 1.26.4       | ORPH
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/007724 | 3.24.7       | 5.16.0       |     
                         guile |  DISTRO  | https://release-monitoring.org/project/001277 | 3.0.9        | 3.0.10       |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/001281 | 1.6.6        | 1.6.9        |     
                      gupnp-av |  DISTRO  | https://release-monitoring.org/project/001282 | 0.14.1       | 0.14.4       |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/001284 | 0.12.1       | 0.12.2       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/001285 | 5.2.14       | 5.3.5        | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/006136 | 2023.01.1    | 2024.02.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/001298 | 2.6.22       | 3.2.3        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/001299 | 11.3.0       | 11.3.1       |     
                heirloom-mailx |  DISTRO  | https://release-monitoring.org/project/095708 | 12.5         | 14.9.25      |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/001327 | 3.17.10      | 3.25.2       | ORPH
                       htpdate |  DISTRO  | https://release-monitoring.org/project/132187 | 1.3.7        | 2.0.0        |     
                         hwloc |  DISTRO  | https://release-monitoring.org/project/013501 | 2.11.2       | 2.12.1       |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/021355 | 2.50.2       | 2.57.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/016134 | 73-2         | 77-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/021670 | 2.9          | 2.14         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/021673 | 0.8.41       | 0.8.44       | ORPH
                  igh-ethercat |  DISTRO  | https://release-monitoring.org/project/021674 | 1.6.3        | 1.6.6        |     
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/001372 | 7.1.1-43     | 7.1.2-0      | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/021676 | 1.7.3        | 1.12.5       |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/008864 | 3.20.2.2     | 4.23.9.0     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/020342 | 22.8.0       | 22.8.1       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/020341 | 25.2.6       | 25.3.0       |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/021679 | 3.506        | 3.507        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/001391 | 3.1.9        | 3.2.1        | ORPH
                         ipset |  DISTRO  | https://release-monitoring.org/project/001393 | 7.23         | 7.24         |     
                     iptraf-ng |  DISTRO  | https://release-monitoring.org/project/007034 | 1.2.1        | 1.2.2        |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/001402 | 1.9.3        | 1.9.4        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/013286 | 0.26         | 0.27         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/018380 | 3.0          | 3.9          | ORPH
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.35.2       | 1.38.0       |     
                       jansson |  DISTRO  | https://release-monitoring.org/project/001417 | 2.14         | 2.14.1       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/015715 | 1.1.2        | 1.3.2        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/001421 | 2.0.33       | 4.2.5        |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/001459 | 0.81         | 0.83         |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/029701 | 3.6.1        | 3.6.3        | ORPH
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/001648 | 3.1.0        | 3.1.1        |     
                            jq |  DISTRO  | https://release-monitoring.org/project/013252 | 1.8.0        | 1.8.1        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/013910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/021681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/059395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/021815 | 1.13.1       | 1.14.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/021816 | 1.10.4       | 1.14.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/021817 | 1.19.5       | 1.21.0       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/001492 | 2.6.4        | 2.8.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/001504 | 2.2.8        | 2.3.4        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.16.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.16.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.16.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.16.0       |     
                          kmod |  DISTRO  | https://release-monitoring.org/project/001517 | 33           | 34.2         |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/021462 | 1.12.15      | 1.13.15      | ORPH
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.5.2        | 3.5.3        |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/012418 | 2.2.0        | 2.3.1        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/016901 | 0.13         | 0.14.1       | ORPH
                        ledmon |  DISTRO  | https://release-monitoring.org/project/012346 | 1.0.0        | 1.1.0        |     
                          less |  DISTRO  | https://release-monitoring.org/project/001550 | 661          | 679          | ORPH
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20250127.0   | 20250512.1   |     
                         libao |  DISTRO  | https://release-monitoring.org/project/007629 | 1.2.0        | 1.2.2        | ORPH
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 3.1.7        | 4.1.1        |     
                     libassuan |  DISTRO  | https://release-monitoring.org/project/001559 | 2.5.7        | 3.0.2        | ORPH
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 1.5.0        | 1.6.1        |     
                        libbsd |  DISTRO  | https://release-monitoring.org/project/001567 | 0.11.7       | 0.12.2       | ORPH
                   libbytesize |  DISTRO  | https://release-monitoring.org/project/007869 | 2.10         | 2.11         | ORPH
                        libcec |  DISTRO  | https://release-monitoring.org/project/021468 | 7.1.0        | 7.1.1        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/001575 | 2.0.3        | 3.2.0        |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/015531 | 2.10.18      | 2.10.19      | ORPH
                       libcurl |  DISTRO  | https://release-monitoring.org/project/000381 | 8.14.1       | 8.15.0       |     
                      libdecor |  DISTRO  | https://release-monitoring.org/project/312806 | 0.1.1        | 0.2.3        |     
                    libdeflate |  DISTRO  | https://release-monitoring.org/project/242778 | 1.22         | 1.24         |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/020540 | 1.13.1       | 1.13.4       |     
                       libexif |  DISTRO  | https://release-monitoring.org/project/001607 | 0.6.24       | 0.6.25       | ORPH
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/012043 | 0.99.9.1     | 1.2304.0     |     
                       libfcgi |  DISTRO  | https://release-monitoring.org/project/059392 | 2.4.5        | 2.4.6        | ORPH
                        libffi |  DISTRO  | https://release-monitoring.org/project/001611 | 3.4.8        | 3.5.1        |     
                         libfm |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.0        | ORPH
                   libfm-extra |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.0        | ORPH
                   libfreeglut |  DISTRO  | https://release-monitoring.org/project/000846 | 3.4.0        | 3.6.0        |     
                      libfuse3 |  DISTRO  | https://release-monitoring.org/project/000861 | 3.17.2       | 3.17.3       |     
                        libgee |  DISTRO  | https://release-monitoring.org/project/001625 | 0.20.6       | 0.20.8       |     
                    libgeotiff |  DISTRO  | https://release-monitoring.org/project/021361 | 1.7.3        | 1.7.4        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/001174 | 2.6.4        | 3.40.0       | ORPH
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/012098 | 1.4.0        | 1.7.0        | ORPH
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/001628 | 1.51         | 1.55         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/001239 | 1.23.2       | 2.0.0        | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/012558 | 2.5.27       | 2.5.32       | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/020640 | 1.6.5        | 2.2.2        | ORPH
                     libgpiod2 |  DISTRO  | https://release-monitoring.org/project/020640 | 2.2.1        | 2.2.2        |     
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/001563 | 2.2.1        | 2.2.2        | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/311549 | 3.24.43      | 3.24.49      |     
                       libgtk4 |  DISTRO  | https://release-monitoring.org/project/013942 | 4.14.5       | 4.18.6       |     
                        libhtp |  DISTRO  | https://release-monitoring.org/project/001632 | 0.5.49       | 0.5.51       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/010656 | 1.15         | 1.18         | ORPH
                     libid3tag |  DISTRO  | https://release-monitoring.org/project/021478 | 0.15.1b      | 0.16.3       | ORPH
                        libidn |  DISTRO  | https://release-monitoring.org/project/001639 | 1.42         | 1.43         |     
                       libidn2 |  DISTRO  | https://release-monitoring.org/project/005597 | 2.3.7        | 2.3.8        |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/021479 | 0.10.3       | 2.3.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/005781 | 1.27.0       | 1.28.1       | ORPH
                      libiscsi |  DISTRO  | https://release-monitoring.org/project/010862 | 1.20.0       | 1.20.2       | ORPH
                        libjwt |  DISTRO  | https://release-monitoring.org/project/242868 | 3.2.0        | 3.2.1        |     
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 2.0.5        | 2.0.7        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/021363 | 2.48         | 249          |     
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/007470 | 1.10.0       | 1.12.2       |     
                   libmediaart |  DISTRO  | https://release-monitoring.org/project/013148 | 1.9.6        | 1.9.7        |     
                 libmicrohttpd |  DISTRO  | https://release-monitoring.org/project/001658 | 1.0.1        | 1.0.2        |     
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/001986 | 2.2.7        | 2.3.3        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/016827 | 0.10.1alpha  | 1.11         |     
        libnetfilter_conntrack |  DISTRO  | https://release-monitoring.org/project/001675 | 1.0.9        | 1.1.0        |     
                        libnfs |  DISTRO  | https://release-monitoring.org/project/007325 | 5.0.3        | 6.0.2        | ORPH
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/001681 | 1.2.7        | 1.2.9        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/001683 | 0.1.21       | 0.1.22       |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/075209 | 4.2.2        | 6.2.1        |     
                       libnspr |  DISTRO  | https://release-monitoring.org/project/007953 | 4.36         | 4.37         |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/002503 | 3.113.1      | 3.114        |     
                        libodb |  DISTRO  | https://release-monitoring.org/project/001687 | 2.4.0        | 2.5.0        | ORPH
                  libodb-boost |  DISTRO  | https://release-monitoring.org/project/001688 | 2.4.0        | 2.5.0        |     
                  libodb-mysql |  DISTRO  | https://release-monitoring.org/project/001689 | 2.4.0        | 2.5.0        |     
                  libodb-pgsql |  DISTRO  | https://release-monitoring.org/project/001690 | 2.4.0        | 2.5.0        | ORPH
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/021365 | 2.5.1        | 2.6.0        |     
                    libopenmpt |  DISTRO  | https://release-monitoring.org/project/141468 | 0.7.13       | 0.8.2        |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/010899 | 2023.8       | 2025.3       |     
                        libp11 |  DISTRO  | https://release-monitoring.org/project/001699 | 0.4.12       | 0.4.16       | ORPH
                       libpeas |  DISTRO  | https://release-monitoring.org/project/006871 | 1.32.0       | 2.0.7        | ORPH
                      libplist |  DISTRO  | https://release-monitoring.org/project/011675 | 2.4.0        | 2.7.0        | ORPH
                        libpri |  DISTRO  | https://release-monitoring.org/project/011042 | 1.6.0        | 1.6.1        | ORPH
                      libressl |  DISTRO  | https://release-monitoring.org/project/012102 | 3.9.2        | 4.1.0        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/005420 | 2.50.9       | 2.60.0       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/010717 | 2.0.5        | 2.0.6        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/013823 | 2.5.5        | 2.6.0        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/013150 | 0.20.5       | 0.21.7       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/001717 | 3.8.1        | 3.9          |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/001718 | 3.8.1        | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/001719 | 3.8.1        | 20200710     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/007961 | 3.4.0        | 3.6.0        |     
                    libsigsegv |  DISTRO  | https://release-monitoring.org/project/001722 | 2.14         | 2.15         |     
                     libsodium |  DISTRO  | https://release-monitoring.org/project/001728 | 1.0.18       | 1.0.20       |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/007908 | 0.7.30       | 0.7.34       |     
                 libsoundtouch |  DISTRO  | https://release-monitoring.org/project/115722 | 2.3.3        | 2.4.0        |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/004864 | 1.9.3        | 2.1.0        |     
                       libspdm |  DISTRO  | https://release-monitoring.org/project/369161 | 3.5.0        | 3.8.0        |     
                        libssh |  DISTRO  | https://release-monitoring.org/project/001729 | 0.11.1       | 0.11.2       | ORPH
                    libstrophe |  DISTRO  | https://release-monitoring.org/project/015633 | 0.13.1       | 0.14.0       |     
                     libtalloc |  DISTRO  | https://release-monitoring.org/project/001733 | 2.4.2        | 2.4.3        |     
                     libtheora |  DISTRO  | https://release-monitoring.org/project/011793 | 1.1.1        | 1.2.0        | ORPH
                       libtool |  DISTRO  | https://release-monitoring.org/project/001741 | 2.4.6        | 2.5.4        | ORPH
                    libtorrent |  DISTRO  | https://release-monitoring.org/project/001742 | 0.13.8       | 0.15.5       | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/004166 | 1.2.19       | 2.0.11       |     
                       libtpms |  GUESS   | https://release-monitoring.org/project/116460 | 0.9.6        | 0.10.1       |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/021371 | 0.8.2        | 0.9.2        |     
                   libucontext |  DISTRO  | https://release-monitoring.org/project/017085 | 1.2          | 1.3.2        |     
                   libunibreak |  DISTRO  | https://release-monitoring.org/project/326564 | 5.1          | 6.1          |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/001748 | 1.8.1        | 1.8.2        | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/021315 | 1.14.19      | 1.14.24      |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/015849 | 0.21.0       | 1.0.3        | ORPH
                       liburcu |  DISTRO  | https://release-monitoring.org/project/007134 | 0.14.0       | 0.15.3       |     
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.6          | 2.11         |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/009998 | 1.28.1       | 1.30.1       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/005097 | 8.10.6       | 8.17.1       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/013830 | 7.10.0       | 11.5.0       |     
                  libvncserver |  DISTRO  | https://release-monitoring.org/project/001756 | 0.9.14       | 0.9.15       | ORPH
                        libvpl |  DISTRO  | https://release-monitoring.org/project/242664 | 2.15.0       | 2023.4.0     |     
                        libvpx |  DISTRO  | https://release-monitoring.org/project/011083 | 1.15.0       | 1.15.2       |     
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/011181 | 4.3.5        | 4.4.1        |     
                        libxcb |  DISTRO  | https://release-monitoring.org/project/001767 | 1.15         | 1.17.0       | ORPH
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/001780 | 1.7.0        | 1.10.0       |     
                       libxml2 |  DISTRO  | https://release-monitoring.org/project/001783 | 2.13.8       | 2.14.5       |     
                       libxmlb |  GUESS   | https://release-monitoring.org/project/179028 | 0.3.19       | 0.3.22       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/011129 | 5.2.0        | 5.4.0        | ORPH
                       libxslt |  DISTRO  | https://release-monitoring.org/project/013301 | 1.1.42       | 1.1.43       |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 1.2.1        | 1.4.0        |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 1.2.1        | 1.4.0        |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/010649 | 1.10.1       | 1.11.4       | ORPH
                          lilv |  DISTRO  | https://release-monitoring.org/project/001818 | 0.24.12      | 0.24.26      |     
                        linknx |  DISTRO  | https://release-monitoring.org/project/021373 | 0.0.1.38     | 0.0.1.39     | ORPH
                     linux-pam |  DISTRO  | https://release-monitoring.org/project/012244 | 1.6.1        | 1.7.1        | ORPH
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/014535 | 1.6.0        | 1.7.0        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/012414 | 2021.05.03   | 2025.07.19   | ORPH
                  lksctp-tools |  DISTRO  | https://release-monitoring.org/project/021497 | 1.0.19       | 1.0.21       | ORPH
                         lldpd |  DISTRO  | https://release-monitoring.org/project/014019 | 1.0.18       | 1.0.19       | ORPH
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/010135 | 0.1.19       | 0.2.0        | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/001835 | 2.1.0        | 2.1.2        | ORPH
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/015330 | 1.3.1        | 1.4.0        |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/011671 | 1.0.1-1      | 1.2.2        |     
                          lsof |  DISTRO  | https://release-monitoring.org/project/001844 | 4.99.4       | 4.99.5       | ORPH
                      lsqlite3 |  DISTRO  | https://release-monitoring.org/project/011649 | 0.9.5-1      | 0.9.6        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/000155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/007135 | 2.13.1       | 2.14.0       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/007141 | 2.13.10      | 2.14.0       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/007136 | 2.13.8       | 2.14.0       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/001847 | 5.1.5        | 5.4.8        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/013887 | 0.15-0       | 0.17.2       |     
                         lutok |  DISTRO  | https://release-monitoring.org/project/021509 | 0.4          | 0.6.1        | ORPH
                           luv |  DISTRO  | https://release-monitoring.org/project/021510 | 1.43.0-0     | 1.51.0-1     | ORPH
                          luvi |  DISTRO  | https://release-monitoring.org/project/021512 | 2.14.0       | 2.15.0       | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/005354 | 2.03.31      | 2.03.33      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/001860 | 5.0.3        | 6.0.4        |     
                         lynis |  DISTRO  | https://release-monitoring.org/project/001862 | 3.1.3        | 3.1.4        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/145824 | 9.22         | 25.00        | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.7.5        | 1.7.7        |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/001887 | 10.11.11     | 12.0.1       | ORPH
                  matchbox-lib |  DISTRO  | https://release-monitoring.org/project/021187 | 1.12         | 1.14         | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/001893 | 1.5.26       | 1.5.28       |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/015518 | 20220418     | 20250429     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/008093 | 194          | 206          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/016553 | 0.1.6.5      | 0.1.7.0      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/021746 | 4.4.8        | 5.4.26       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/001965 | 1.6.29       | 1.6.38       | ORPH
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/001970 | 25.1.5       | 25.1.6       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/001970 | 25.1.5       | 25.1.6       | ORPH
                      metacity |  DISTRO  | https://release-monitoring.org/project/015392 | 2.25.1       | 3.56.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/021519 | 0.02         | 2.8.0        |     
microchip-hss-payload-gener... |  DISTRO  | https://release-monitoring.org/project/368767 | 2024.06      | 2025.03      |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/010539 | 1.22.2       | 1.25.0       |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/001978 | 5.6.1        | 5.12.0       |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/021522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.0.10       |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/021100 | 2024.12      | 2025.06      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/010267 | 20221107     | 20240407     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/020836 | 0.11.6       | 0.23.2       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/068638 | 2.9.10       | 3.0.14       |     
                         monit |  DISTRO  | https://release-monitoring.org/project/005483 | 5.34.3       | 5.35.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/006360 | 6.12.0.182   | 6.14.1       |     
                     mosquitto |  DISTRO  | https://release-monitoring.org/project/006078 | 2.0.21       | 2.0.22       |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/011578 | 4.0.0        | 4.0.1        |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/002019 | 4.1.1        | 4.2.2        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/012413 | 1.32.8       | 1.33.0       |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/005348 | 0.35.1       | 0.40.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/012278 | 3.3.0        | 7.0.0        |     
                           mtd |  DISTRO  | https://release-monitoring.org/project/002026 | 2.2.1        | 2.3.0        |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/008868 | 1.1.6        | 1.1.7        |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/002028 | 4.0.48       | 4.0.49       | ORPH
                           mtr |  DISTRO  | https://release-monitoring.org/project/002029 | 0.95         | 0.96         | ORPH
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/000424 | 0.9.8        | 0.11.1       |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/002034 | 1.23.9       | 1.26.3       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/002035 | 2.2.13       | 2.2.14       |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/013545 | 3.3.1        | 4.0.4        |     
                       mxt-app |  DISTRO  | https://release-monitoring.org/project/373381 | 1.38         | 1.45         |     
                       nanomsg |  DISTRO  | https://release-monitoring.org/project/014540 | 1.2          | 1.2.1        |     
                           nbd |  DISTRO  | https://release-monitoring.org/project/002052 | 3.25         | 3.26.1       | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/006045 | 1.22         | 2.8.2        |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/002057 | 6.5-20250517 | 6.5-20250720 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/021531 | 1.0.7        | 1.0.8        | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/007604 | 0.33.0       | 0.35.0       | ORPH
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 2.1.3        |     
                      netatalk |  DISTRO  | https://release-monitoring.org/project/002063 | 3.1.19       | 4.2.4        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/011046 | 1.33.1       | 2.6.0        |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/021917 | 0.7.3        | 0.7.12       |     
                       netsurf |  DISTRO  | https://release-monitoring.org/project/005386 | 3.10         | 3.11         |     
                          newt |  DISTRO  | https://release-monitoring.org/project/015129 | 0.52.23      | 0.52.25      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.0        | 1.1.3        |     
               nftables-python |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.0        | 1.1.3        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/008651 | 1.64.0       | 1.66.0       | ORPH
                         nginx |  DISTRO  | https://release-monitoring.org/project/005413 | 1.26.3       | 1.29.0       | ORPH
                        ngircd |  DISTRO  | https://release-monitoring.org/project/002083 | 26.1         | 27           | ORPH
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/008251 | 22.15.1      | 24.4.1       |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/008251 | 22.15.1      | 24.4.1       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/021539 | 2.1.9        | 3.0.0        | ORPH
                          norm |  DISTRO  | https://release-monitoring.org/project/021540 | 1.5.8        | 1.5.9        | ORPH
                       nushell |  DISTRO  | https://release-monitoring.org/project/031106 | 0.96.1       | 0.105.1      | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/002511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/021843 | 390.151      | 390.157      | ORPH
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 575.64       | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 560.35.03    | 575.64       |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/009074 | 1.12         | 2.14         | ORPH
                         oatpp |  DISTRO  | https://release-monitoring.org/project/370050 | 1.3.0        | 1.3.1        |     
                        octave |  DISTRO  | https://release-monitoring.org/project/002528 | 10.1.0       | 10.2.0       |     
                           odb |  DISTRO  | https://release-monitoring.org/project/002531 | 2.4.0        | 2.5.0        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/016859 | 2.2          | 2.17         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/033334 | v1.12.12     | 14.3.4       |     
                       omniorb |  DISTRO  | https://release-monitoring.org/project/021545 | 4.3.1        | 4.3.3        | ORPH
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/010861 | 2.1.9        | 2.1.11       |     
                     open-isns |  DISTRO  | https://release-monitoring.org/project/009393 | 0.102        | 0.103        |     
                     open-lldp |  DISTRO  | https://release-monitoring.org/project/115714 | 1.1          | 1.1.1        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/016896 | v1.3.15      | 1.4.12       | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/008172 | 1.22.0       | 1.24.3       | ORPH
                opencl-headers |  DISTRO  | https://release-monitoring.org/project/223257 | 2024.10.24   | 2025.06.13   |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/021548 | 0.1.5        | 0.1.6        | ORPH
                       opencsd |  DISTRO  | https://release-monitoring.org/project/368613 | 1.5.6        | 1.6.1        |     
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/006615 | 3.4.20       | 4.12.0       | ORPH
                       opencv4 |  DISTRO  | https://release-monitoring.org/project/006615 | 4.11.0       | 4.12.0       |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.11.0       | 0.13.1       |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/002549 | 2.0.36       | 2.0.37       | ORPH
                    openlayers |  DISTRO  | https://release-monitoring.org/project/006847 | 10.5.0       | 10.6.1       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/002554 | 4.1.5        | 5.0.8        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/011687 | 0.56         | 0.62.5       |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/021551 | 3.13.2       | 3.17.0       | ORPH
                        opensc |  DISTRO  | https://release-monitoring.org/project/002559 | 0.26.0       | 0.26.1       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/010998 | 11.3.5-18... | 13.0.0       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/059397 | 0.7.0        | 0.9.0        | ORPH
                           orc |  DISTRO  | https://release-monitoring.org/project/002573 | 0.4.34       | 0.4.41       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/021691 | 4.4.8        | 5.4.24       | ORPH
                     osm2pgsql |  DISTRO  | https://release-monitoring.org/project/002575 | 2.0.1        | 2.1.1        |     
                         p7zip |  DISTRO  | https://release-monitoring.org/project/002583 | 17.05        | 17.06        |     
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/021376 | 1.3.2        | 1.5.3        |     
                        pahole |  DISTRO  | https://release-monitoring.org/project/231624 | 1.28         | 1.30         |     
                         pango |  DISTRO  | https://release-monitoring.org/project/011783 | 1.54.0       | 1.56.4       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/007958 | 2.50.1       | 2.56.1       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/010309 | 0.7          | 0.65         | ORPH
                         patch |  DISTRO  | https://release-monitoring.org/project/002597 | 2.7.6        | 2.8          | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/002598 | 0.13         | 0.18.0       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/002601 | 1.3.7        | 1.3.8        | ORPH
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/002611 | 2.1.0        | 2.3.3        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/021378 | 3.5          | 3.6          |     
                          perl |  DISTRO  | https://release-monitoring.org/project/013599 | 5.40.2       | 5.42.0       |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/011930 | 2.33         | 3.04         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/002743 | 0.02         | 0.21         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/002748 | 0.33         | 0.35         |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/002785 | 6.95         | 6.97         |     
            perl-datetime-tiny |  DISTRO  | https://release-monitoring.org/project/002802 | 1.07         | 1.08         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/002807 | 4.046        | 5.012        |     
                      perl-dbi |  DISTRO  | https://release-monitoring.org/project/002811 | 1.643        | 1.647        |     
               perl-devel-size |  DISTRO  | https://release-monitoring.org/project/002835 | 0.84         | 0.85         |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/012660 | 2.77         | 2.83         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/006175 | 12.50        | 13.32        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/006569 | 2.080        | 2.089        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/003024 | 6.77         | 6.78         |     
        perl-module-build-tiny |  DISTRO  | https://release-monitoring.org/project/011870 | 0.051        | 0.052        |     
           perl-module-runtime |  DISTRO  | https://release-monitoring.org/project/003111 | 0.016        | 0.018        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/005966 | 9.38         | 9.41         |     
               perl-mozilla-ca |  DISTRO  | https://release-monitoring.org/project/003136 | 20240924     | 20250202     |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/003163 | 0.72         | 0.74         |     
                perl-path-tiny |  DISTRO  | https://release-monitoring.org/project/011962 | 0.146        | 0.148        |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/014338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/014406 | 2.006000     | 2.008002     |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/003527 | 2.0134       | 2.0210       |     
                           php |  DISTRO  | https://release-monitoring.org/project/003627 | 8.3.23       | 8.4.10       |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/015603 | 2.0.0        | 2.1.2        |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/011010 | 5.1.22       | 5.1.24       |     
                     php-gnupg |  DISTRO  | https://release-monitoring.org/project/021743 | 1.5.1        | 1.5.3        | ORPH
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/017401 | 3.7.0        | 3.8.0        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/017400 | 3.2.0        | 3.3.0        | ORPH
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 2.2.5        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/021742 | 1.4          | 1.4.1        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/013302 | 3.3.1        | 3.4.5        |     
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/012515 | 2.2.3        | 2.2.4        | ORPH
                        physfs |  DISTRO  | https://release-monitoring.org/project/003631 | 3.0.2        | 3.2.0        |     
                      picotool |  DISTRO  | https://release-monitoring.org/project/373463 | 1.1.2        | 2.1.1        |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/057357 | 1.2.7        | 1.4.6        |     
                        pixman |  DISTRO  | https://release-monitoring.org/project/003648 | 0.44.2       | 0.46.4       | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/012753 | 2.3.0        | 2.5.1        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/003674 | 2.18.0       | 3.0.3        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/005418 | 1.13.2       | 1.14.2       |     
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 4.3          | ORPH
                       poppler |  DISTRO  | https://release-monitoring.org/project/003686 | 22.12.0      | 25.07.0      |     
                       postgis |  DISTRO  | https://release-monitoring.org/project/003694 | 3.5.2        | 3.5.3        |     
                         pound |  DISTRO  | https://release-monitoring.org/project/005436 | 4.8          | 4.16         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/010715 | 1.3.11       | 1.3.13       | ORPH
                         procs |  DISTRO  | https://release-monitoring.org/project/076458 | 0.14.9       | 0.14.10      |     
                       proftpd |  DISTRO  | https://release-monitoring.org/project/007609 | 1.3.8b       | 1.3.9        | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/021570 | 9.5.1        | 9.6.2        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/003709 | 0.11.14      | 13.0.2       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 29.3         | 31.1         |     
                     protozero |  DISTRO  | https://release-monitoring.org/project/008002 | 1.8.0        | 1.8.1        |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/006499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/021825 | 6.0.1        | 6.5.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/003721 | 23.5         | 23.7         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/003726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/003728 | 1.14         | 1.15         |     
                         putty |  DISTRO  | https://release-monitoring.org/project/005749 | 0.81         | 0.83         |     
                            pv |  DISTRO  | https://release-monitoring.org/project/003736 | 1.9.0        | 1.9.31       | ORPH
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/034074 | 3.1.15       | 3.1.16       |     
                python-apispec |  DISTRO  | https://release-monitoring.org/project/037849 | 6.8.1        | 6.8.2        |     
            python-argcomplete |  DISTRO  | https://release-monitoring.org/project/003773 | 3.5.3        | 3.6.2        |     
            python-argon2-cffi |  DISTRO  | https://release-monitoring.org/project/033377 | 23.1.0       | 25.1.0       |     
              python-async-lru |  DISTRO  | https://release-monitoring.org/project/056566 | 2.0.4        | 2.0.5        |     
               python-asyncssh |  DISTRO  | https://release-monitoring.org/project/017555 | 2.19.0       | 2.21.0       |     
                  python-attrs |  DISTRO  | https://release-monitoring.org/project/015099 | 25.1.0       | 25.3.0       |     
                python-automat |  DISTRO  | https://release-monitoring.org/project/015101 | 24.8.1       | 25.4.16      |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/011984 | 2.16.0       | 2.17.0       |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/009047 | 4.2.1        | 4.3.0        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/003779 | 4.12.3       | 4.13.4       |     
               python-bitarray |  DISTRO  | https://release-monitoring.org/project/011014 | 3.0.0        | 3.5.1        |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/014665 | 4.3.0        | 4.3.1        |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/026271 | 0.22.3       | 1.0.1        |     
               python-bluezero |  DISTRO  | https://release-monitoring.org/project/021929 | 0.9.0        | 0.9.1        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/029737 | 1.37.34      | 1.39.9       |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/008748 | 1.37.33      | 1.39.9       |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/011101 | 0.13.2       | 0.13.4       |     
                python-bsdiff4 |  DISTRO  | https://release-monitoring.org/project/044268 | 1.2.5        | 1.2.6        |     
             python-cachetools |  DISTRO  | https://release-monitoring.org/project/007022 | 5.5.1        | 6.1.0        |     
                 python-calver |  DISTRO  | https://release-monitoring.org/project/100823 | 2022.6.26    | 2025.4.17    |     
               python-cchardet |  DISTRO  | https://release-monitoring.org/project/014813 | 2.1.7        | 2.2.0a2      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/007995 | 2024.12.14   | 2025.7.14    |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/021937 | 4.2.0        | 4.2.2        |     
     python-charset-normalizer |  DISTRO  | https://release-monitoring.org/project/055366 | 3.4.1        | 3.4.2        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/020163 | 10.0.1       | 11.0.0b3     |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/019734 | 1.1.30       | 2.0.2        |     
              python-contourpy |  DISTRO  | https://release-monitoring.org/project/244705 | 1.3.1        | 1.3.2        |     
                python-crontab |  DISTRO  | https://release-monitoring.org/project/031282 | 3.2.0        | 3.3.0        |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/005532 | 44.0.1       | 45.0.5       |     
              python-cssselect |  DISTRO  | https://release-monitoring.org/project/011593 | 1.2.0        | 1.3.0        |     
             python-cssselect2 |  DISTRO  | https://release-monitoring.org/project/086109 | 0.7.0        | 0.8.0        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/021939 | 4.1.2        | 4.2.1        |     
               python-dateutil |  DISTRO  | https://release-monitoring.org/project/005621 | 2.9.0        | 2.9.0.post0  |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/003819 | 5.1.1        | 5.2.1        |     
                python-distlib |  DISTRO  | https://release-monitoring.org/project/034504 | 0.3.9        | 0.4.0        |     
               python-dtschema |  DISTRO  | https://release-monitoring.org/project/100908 | 2024.11      | 2025.6.1     |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/008370 | 0.19.0       | 0.19.1       |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/015064 | 4.11.2       | 4.12.2       |     
                python-esptool |  DISTRO  | https://release-monitoring.org/project/011619 | 4.8.1        | 5.0.1        |     
                  python-evdev |  DISTRO  | https://release-monitoring.org/project/062869 | 1.9.0        | 1.9.2        |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/011739 | 3.17.0       | 3.18.0       |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/019867 | 5.0.0        | 6.0.1        |     
          python-flask-smorest |  DISTRO  | https://release-monitoring.org/project/025028 | 0.45.0       | 0.46.1       |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/085010 | 2.0.7        | 25.2.10      |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/007388 | 4.55.6       | 4.59.0       |     
             python-frozenlist |  DISTRO  | https://release-monitoring.org/project/041138 | 1.5.0        | 1.7.0        |     
                python-glslang |  DISTRO  | https://release-monitoring.org/project/205796 | 15.3.0       | 15.4.0       |     
        python-google-api-core |  DISTRO  | https://release-monitoring.org/project/025386 | 2.24.1       | 2.25.1       |     
            python-google-auth |  DISTRO  | https://release-monitoring.org/project/038039 | 2.38.0       | 2.40.3       |     
python-googleapis-common-pr... |  DISTRO  | https://release-monitoring.org/project/063943 | 1.66.0       | 1.70.0       |     
               python-greenlet |  DISTRO  | https://release-monitoring.org/project/006870 | 3.1.1        | 3.2.3        |     
          python-grpc-requests |  DISTRO  | https://release-monitoring.org/project/132701 | 0.1.20       | 0.1.21       |     
                 python-grpcio |  DISTRO  | https://release-monitoring.org/project/018429 | 1.70.0       | 1.73.1       |     
      python-grpcio-reflection |  DISTRO  | https://release-monitoring.org/project/030542 | 1.70.0       | 1.73.1       |     
                python-grpclib |  DISTRO  | https://release-monitoring.org/project/039170 | 0.4.7        | 0.4.8        |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/019033 | 4.1.0        | 4.2.0        |     
                    python-hid |  DISTRO  | https://release-monitoring.org/project/049364 | 1.0.6        | 1.0.8        |     
                python-hiredis |  DISTRO  | https://release-monitoring.org/project/012002 | 3.1.0        | 3.2.1        |     
               python-httpcore |  DISTRO  | https://release-monitoring.org/project/079947 | 1.0.7        | 1.0.9        |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/019799 | 4.11.0       | 4.12.3       |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/011771 | 2.4.1        | 2.4.3-1      |     
               python-iptables |  DISTRO  | https://release-monitoring.org/project/011475 | 1.0.1        | 1.2.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/001399 | 8.31.0       | 9.4.0        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/051611 | 1.5          | 1.7.0        |     
     python-jaraco-collections |  DISTRO  | https://release-monitoring.org/project/058530 | 5.1.0        | 5.2.1        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/020165 | 4.1.0        | 4.2.1        |     
                python-jeepney |  DISTRO  | https://release-monitoring.org/project/019564 | 0.8.0        | 0.9.0        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/003898 | 4.23.0       | 4.25.0       |     
python-jsonschema-specifica... |  DISTRO  | https://release-monitoring.org/project/316377 | 2024.10.1    | 2025.4.1     |     
             python-legacy-cgi |  DISTRO  | https://release-monitoring.org/project/375190 | 2.6.2        | 2.6.3        |     
               python-libevdev |  DISTRO  | https://release-monitoring.org/project/250362 | 0.11         | 0.12         |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/012301 | 3.2.0        | 3.3.1        |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/015512 | 1.6.2        | 1.7.2        |     
                python-logbook |  DISTRO  | https://release-monitoring.org/project/020016 | 1.8.0        | 1.8.2        |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/003914 | 5.3.0        | 6.0.0        |     
         python-magic-wormhole |  DISTRO  | https://release-monitoring.org/project/017278 | 0.17.0       | 0.19.2       |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/003915 | 1.3.8        | 1.3.10       |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/003916 | 3.7          | 3.8.2        |     
            python-marshmallow |  DISTRO  | https://release-monitoring.org/project/008079 | 3.26.0       | 4.0.0        |     
 python-marshmallow-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/050566 | 1.4.0        | 1.4.2        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/003919 | 3.10.0       | 3.10.3       |     
           python-meson-python |  DISTRO  | https://release-monitoring.org/project/248985 | 0.17.1       | 0.18.0       |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/006189 | 3.1.0        | 3.1.3        |     
              python-modbus-tk |  DISTRO  | https://release-monitoring.org/project/022813 | 1.1.4        | 1.1.5        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/012201 | 10.6.0       | 10.7.0       |     
              python-multidict |  DISTRO  | https://release-monitoring.org/project/011132 | 6.1.0        | 6.6.3        |     
        python-mypy-extensions |  DISTRO  | https://release-monitoring.org/project/023367 | 1.0.0        | 1.1.0        |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/007791 | 3.4.2        | 3.5          |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/002509 | 1.25.0       | 2.3.1        |     
               python-oauthlib |  DISTRO  | https://release-monitoring.org/project/005377 | 3.2.2        | 3.3.1        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.1.5        | 1.05a1       |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/031737 | 3.10.15      | 3.11.0       |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/003954 | 3.5.0        | 3.5.1        |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/021704 | 3.2.3        | 3.3.1        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/003960 | 6.1.0        | 6.1.1        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/007974 | 11.1.0       | 11.3.0       |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/006529 | 25.0         | 25.1.1       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/020203 | 3.2.0        | 3.2.1        |     
              python-posix-ipc |  DISTRO  | https://release-monitoring.org/project/013204 | 1.1.1        | 1.2.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/008742 | 3.0.50       | 3.0.51       |     
             python-proto-plus |  DISTRO  | https://release-monitoring.org/project/099887 | 1.26.0       | 1.26.1       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 29.3         | 31.1         |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/003978 | 6.1.1        | 7.0.0        |     
                python-psygnal |  DISTRO  | https://release-monitoring.org/project/218690 | 0.11.1       | 0.14.0       |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/003980 | 2024.1.3     | 2025.1       |     
                 python-pyalsa |  DISTRO  | https://release-monitoring.org/project/003767 | 1.2.12       | 1.2.14       |     
                  python-pyaml |  DISTRO  | https://release-monitoring.org/project/083931 | 25.1.0       | 25.7.0       |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/011987 | 0.4.1        | 0.4.2        |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/013384 | 2.13.6       | 3.0.0        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/013166 | 1.27.0       | 1.28.0       |     
                python-pycares |  DISTRO  | https://release-monitoring.org/project/019900 | 4.5.0        | 4.9.0        |     
                python-pycrate |  DISTRO  | https://release-monitoring.org/project/185106 | 0.7.8        | 0.7.11       |     
          python-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/036851 | 3.21.0       | 3.23.0       |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/021582 | 20241204.1   | 20250629.2   |     
          python-pydantic-core |  DISTRO  | https://release-monitoring.org/project/273695 | 2.33.2       | 2.35.2       |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/016219 | 0.31         | 0.32         |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/003986 | 2.19.1       | 2.19.2       |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/012004 | 2.14         | 2.15.2       |     
               python-pylibfdt |  DISTRO  | https://release-monitoring.org/project/269896 | 1.7.2        | 1.7.2.post1  |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/015600 | 3.8.6        | 3.9.2        |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/017320 | 1.23.22      | 1.26.3       |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/005535 | 25.0.0       | 25.1.0       |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/003756 | 3.2.1        | 3.2.3        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/015558 | 3.12.0       | 3.13.0       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/020104 | 5.15.6       | 5.15.11      |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/020081 | 0.8.1        | 0.9.2        |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/021589 | 1.2.10       | 1.2.11       |     
                  python-pysmi |  DISTRO  | https://release-monitoring.org/project/013209 | 1.5.9        | 1.6.2        |     
                 python-pysnmp |  DISTRO  | https://release-monitoring.org/project/012027 | 7.1.16       | 7.1.21       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/003765 | 8.4.0        | 8.4.1        |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/007273 | 1.0.0        | 1.1.0        |     
                python-pythran |  DISTRO  | https://release-monitoring.org/project/021140 | 0.17.0       | 0.18.0       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/006537 | 2024.2       | 2025.2       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/004104 | 25.1.2       | 27.0.0       |     
                 python-qrcode |  DISTRO  | https://release-monitoring.org/project/020011 | 8.1          | 8.2          |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/003992 | 5.2.1        | 6.2.0        |     
               python-reedsolo |  DISTRO  | https://release-monitoring.org/project/081160 | 1.7.0        | 2.0.13       |     
                python-rpds-py |  DISTRO  | https://release-monitoring.org/project/368622 | 0.22.3       | 0.26.0       |     
                  python-rtoml |  DISTRO  | https://release-monitoring.org/project/062048 | 0.10.0       | 0.12.0       |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/019641 | 2.1.76       | 2.2.3        |     
            python-ruamel-yaml |  DISTRO  | https://release-monitoring.org/project/066067 | 0.18.10      | 0.18.14      |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/010428 | 0.13.0       | 0.13.1       |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/004768 | 1.11.4       | 1.16.0       |     
                  python-segno |  DISTRO  | https://release-monitoring.org/project/059641 | 1.6.1        | 1.6.6        |     
               python-selenium |  DISTRO  | https://release-monitoring.org/project/005645 | 4.27.1       | 4.34.2       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/021603 | 2.21.0       | 3.0.0a2      |     
           python-setproctitle |  DISTRO  | https://release-monitoring.org/project/011699 | 1.3.4        | 1.3.6        |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/010429 | 2.2.1        | 2.2.2        |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/004026 | 3.19.3       | 3.20.1       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/021608 | 1.5.3        | 1.5.4        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/013626 | 4.19.25      | 6.12.0       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/012729 | 5.0.2        | 6.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/007203 | 0.6.1        | 0.7.3        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/021611 | 5.12.1       | 5.13.0       |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/027570 | 2.6          | 2.7          |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/029718 | 2.0.0        | 2.0.1        |     
              python-starlette |  DISTRO  | https://release-monitoring.org/project/036570 | 0.47.1       | 0.47.2       |     
                  python-sympy |  DISTRO  | https://release-monitoring.org/project/004923 | 1.13.3       | 1.14.0       |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/021225 | 5.8.0        | 5.8.1        |     
              python-termcolor |  DISTRO  | https://release-monitoring.org/project/010198 | 2.5.0        | 3.1.0        |     
                  python-tftpy |  DISTRO  | https://release-monitoring.org/project/209210 | 0.8.5        | 0.8.6        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/021614 | 0.21.0       | 0.22.0       |     
                python-tomlkit |  DISTRO  | https://release-monitoring.org/project/019609 | 0.13.2       | 0.13.3       |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/019614 | 24.9.1       | 25.5.0       |     
                   python-trio |  DISTRO  | https://release-monitoring.org/project/017451 | 0.28.0       | 0.30.0       |     
         python-trio-websocket |  DISTRO  | https://release-monitoring.org/project/136283 | 0.11.1       | 0.12.2       |     
      python-trove-classifiers |  DISTRO  | https://release-monitoring.org/project/088298 | 2025.1.15.22 | 2025.5.9.12  |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/004071 | 24.11.0      | 25.5.0       |     
                  python-txaio |  DISTRO  | https://release-monitoring.org/project/007202 | 23.1.1       | 25.6.1       |     
              python-typeguard |  DISTRO  | https://release-monitoring.org/project/038819 | 4.4.1        | 4.4.4        |     
  python-types-python-dateutil |  DISTRO  | https://release-monitoring.org/project/147859 | 2.9.0.202... | 2.9.0.202... |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/004079 | 2.6.16       | 3.0.2        |     
                  python-uswid |  DISTRO  | https://release-monitoring.org/project/295497 | 0.5.1        | 0.5.2        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/019818 | 0.34.0       | 0.35.0       |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/011057 | 64.0         | 65.1         |     
                python-webargs |  DISTRO  | https://release-monitoring.org/project/024711 | 8.6.0        | 8.7.0        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/008100 | 15.0         | 15.0.1       |     
                  python-wheel |  DISTRO  | https://release-monitoring.org/project/011428 | 0.45.1       | 0.46.1       |     
                   python-xlrd |  DISTRO  | https://release-monitoring.org/project/015107 | 2.0.1        | 2.0.2        |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/012031 | 3.2.1        | 3.2.5        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/012895 | 1.18.3       | 1.21.1       |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/012681 | 0.141.0      | 0.147.0      |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/013607 | 10.0.0       | 10.0.2       |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/021737 | 2.4.7        | 2.5.0        | ORPH
               qoriq-mc-binary |  DISTRO  | https://release-monitoring.org/project/377827 | 10.39.0      | 10.300.138   |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/005542 | 10.5.0       | 12.2.0       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/015198 | 0.35.0       | 0.40.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.1        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.1        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.1        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.1        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.14      | 6.9.1        |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.1        |     
                qt6core5compat |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.1        |     
                       qt6mqtt |  DISTRO  | https://release-monitoring.org/project/242923 | 6.8.1        | 6.9.1        |     
                  qt6serialbus |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.1        |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.1        |     
                        qt6svg |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.1        |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/004141 | 1.4          | 1.5          |     
                         quota |  DISTRO  | https://release-monitoring.org/project/004145 | 4.09         | 4.10         |     
                     quotatool |  DISTRO  | https://release-monitoring.org/project/004146 | 1.6.4        | 1.6.5        | ORPH
                           qwt |  DISTRO  | https://release-monitoring.org/project/004147 | 6.1.6        | 6.3.0        | ORPH
                    rabbitmq-c |  DISTRO  | https://release-monitoring.org/project/013768 | 0.14.0       | 0.15.0       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/012105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/007426 | 1.9.3        | 1.9.4        |     
          rauc-hawkbit-updater |  DISTRO  | https://release-monitoring.org/project/368765 | 1.3          | 1.4          |     
               redis-plus-plus |  DISTRO  | https://release-monitoring.org/project/368624 | 1.3.12       | 1.3.14       |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/021663 | 2.20250213   | 2.20250618   |     
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.5       |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/016520 | 3.8.1        | 20200710     | ORPH
                         rhash |  DISTRO  | https://release-monitoring.org/project/013843 | 1.4.4        | 1.4.6        | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/021389 | 1.10.5       | 2.0.1        | ORPH
                        rlwrap |  DISTRO  | https://release-monitoring.org/project/004199 | 0.46.1       | 0.46.2       |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/015560 | 6.20.3       | 10.4.2       |     
                  rpi-firmware |  DISTRO  | https://release-monitoring.org/project/021744 | 1.20250326   | 1.20250430   |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/059450 | 2.8          | 2.9          |     
                       rtl_433 |  DISTRO  | https://release-monitoring.org/project/014997 | 23.11        | 25.02        |     
                      rtorrent |  DISTRO  | https://release-monitoring.org/project/004221 | 0.9.8        | 0.15.5       | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/087994 | 8.1.2        | 9.0.0        |     
                          ruby |  DISTRO  | https://release-monitoring.org/project/004223 | 3.4.3        | 3.4.5        |     
                          rust |  DISTRO  | https://release-monitoring.org/project/007635 | 1.86.0       | 1.88.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/007635 | 1.86.0       | 1.88.0       |     
                  rust-bindgen |  DISTRO  | https://release-monitoring.org/project/017910 | 0.65.1       | 0.72.0       | ORPH
                         rygel |  DISTRO  | https://release-monitoring.org/project/004751 | 0.42.5       | 0.44.2       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/010714 | 2.33.1       | 2.38.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/005485 | 2.13.1.0     | 2.13.2.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/016547 | 2.4.0.0      | 2.4.1.0      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/016552 | 1.1.2.1      | 1.1.3.0      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/016551 | 2.6.2.1      | 2.6.3.0      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/016550 | 2.7.0.4      | 2.7.1.0      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/016549 | 2.3.0.4      | 2.3.1.0      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/016548 | 0.5.5.0      | 0.5.6.0      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/021385 | 3.7.1        | 08032024     |     
                  sane-airscan |  DISTRO  | https://release-monitoring.org/project/121086 | 0.99.33      | 0.99.35      |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/004760 | 1.1.1        | 1.4.0        |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/016338 | 2.0          | 2.1          |     
                         scons |  DISTRO  | https://release-monitoring.org/project/004770 | 4.8.1        | 4.9.1        |     
                   screenfetch |  DISTRO  | https://release-monitoring.org/project/005733 | 3.9.1        | 3.9.9        | ORPH
                        scrypt |  DISTRO  | https://release-monitoring.org/project/021238 | 1.3.2        | 1.3.3        |     
                    sdl2_image |  DISTRO  | https://release-monitoring.org/project/004781 | 2.8.4        | 3.2.4        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/004782 | 2.6.3        | 2.8.1        | ORPH
                      sdl2_ttf |  DISTRO  | https://release-monitoring.org/project/004784 | 2.24.0       | 3.2.2        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/004778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/010262 | 1.0.3        | 2.0.4        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/004787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/015203 | 1.20.0       | 1.49.13      |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/001717 | 3.8.1        | 3.9          |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/001717 | 3.8.1        | 3.9          | ORPH
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 2.20.3       | 2.50.0       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.9.1        |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/021655 | 4.3.8        | 4.6.5        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.14      | 0.32.4       |     
                       sexpect |  DISTRO  | https://release-monitoring.org/project/269648 | 2.3.14       | 2.3.15       |     
                        shadow |  DISTRO  | https://release-monitoring.org/project/004802 | 4.17.4       | 4.18.0       |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/021384 | 3.3.9        | 4.3.7        | ORPH
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/005524 | 1.12         | 2.4          | ORPH
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.1.0        | ORPH
                       skalibs |  DISTRO  | https://release-monitoring.org/project/005486 | 2.14.3.0     | 2.14.4.0     |     
                        skopeo |  DISTRO  | https://release-monitoring.org/project/009216 | 1.18.0       | 1.19.0       |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/096796 | 4.8.0        | 4.9.1        | ORPH
                        snappy |  DISTRO  | https://release-monitoring.org/project/004844 | 1.2.1        | 1.2.2        | ORPH
                  snmpclitools |  DISTRO  | https://release-monitoring.org/project/031640 | 0.6.4        | 0.7.2        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/021318 | 3.5.1        | 3.6.3        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/013263 | 3.1.40.0     | 3.9.1.0      |     
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.12      | 0.16.18      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/010152 | 0.7          | 0.8          |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/005388 | 1.6.4        | 1.6.6        | ORPH
                       speechd |  DISTRO  | https://release-monitoring.org/project/328138 | 0.11.5       | 0.12.1       |     
                         spice |  DISTRO  | https://release-monitoring.org/project/004871 | 0.15.2       | 0.16.0       | ORPH
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/014892 | 0.14.4       | 0.14.5       | ORPH
                   spirv-tools |  DISTRO  | https://release-monitoring.org/project/334920 | 1.4.313.0    | 1.4.321.0    | ORPH
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/011213 | 4.5.5        | 4.9.0        |     
                        sqlite |  DISTRO  | https://release-monitoring.org/project/004877 | 3.48.0       | 3.50.3       |     
                      squashfs |  DISTRO  | https://release-monitoring.org/project/004879 | 4.6.1        | 4.7          |     
                         squid |  DISTRO  | https://release-monitoring.org/project/004880 | 6.13         | 7.1          | ORPH
                        sratom |  DISTRO  | https://release-monitoring.org/project/014903 | 0.6.14       | 0.6.18       |     
                      sshguard |  DISTRO  | https://release-monitoring.org/project/013819 | 2.4.3        | 2.5.1        |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/006184 | 2.0.1        | 2.2.4        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/008127 | 1.20.7.1     | 1.22.21      | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/006861 | 6.7.1        | 7.0c         |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/012538 | 0.18.05      | 0.19.02      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/004899 | 5.9.14       | 6.0.2        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/004901 | 5.71         | 5.75         |     
                   superiotool |  DISTRO  | https://release-monitoring.org/project/010128 | 24.05        | 25.06        |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/010925 | 6.0.19       | 8.0.0        |     
                          sway |  DISTRO  | https://release-monitoring.org/project/011497 | 1.10         | 1.11         |     
                          swig |  DISTRO  | https://release-monitoring.org/project/004919 | 4.1.1        | 4.3.1        |     
                         swipl |  DISTRO  | https://release-monitoring.org/project/236197 | 9.2.8        | 9.2.9        |     
                         swtpm |  GUESS   | https://release-monitoring.org/project/116461 | 0.8.2        | 0.10.1       |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/005718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/016898 | 0.29.3       | 0.40.1       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/004930 | 4.8.1        | 4.9.0        |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/004931 | 12.7.5       | 12.7.7       | ORPH
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/011774 | 233          | 235          | ORPH
                     tailscale |  DISTRO  | https://release-monitoring.org/project/141585 | 1.78.1       | 1.84.2       |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/009174 | 2.1.58       | 3.0.1        |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/008217 | 2021.12.0    | 2022.2.0     |     
                     tcf-agent |  DISTRO  | https://release-monitoring.org/project/021833 | 1.8.0        | 1.9.0        |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/004941 | 8.6.15       | 9.0.2        | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/004942 | 1.2.4        | 1.2.5        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/004943 | 1.21         | 2.0          |     
                      tealdeer |  DISTRO  | https://release-monitoring.org/project/084521 | 1.6.1        | 1.7.2        |     
               tensorflow-lite |  DISTRO  | https://release-monitoring.org/project/016141 | 2.11.0       | 2.19.0       |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/004951 | 1.12.1       | 1.14.0       |     
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/004954 | 5.5.0        | 5.5.1        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/014500 | 2.5.6        | 2.5.9        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/005581 | 0.14.1       | 0.22.0       | ORPH
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 4.1.0        | 5.0.2        |     
                      tinycbor |  DISTRO  | https://release-monitoring.org/project/021379 | 0.6.0        | 0.6.1        |     
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/014678 | 20240101     | 20250501     |     
                           tio |  DISTRO  | https://release-monitoring.org/project/020587 | 3.5          | 3.9          |     
                       tipidee |  DISTRO  | https://release-monitoring.org/project/373437 | 0.0.5.1      | 0.0.6.0      |     
                            tk |  DISTRO  | https://release-monitoring.org/project/011426 | 8.6.15       | 9.0.2        |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.2.0        |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/021640 | 1.3.9.1      | 1.3.9.2      |     
                  tpm2-openssl |  DISTRO  | https://release-monitoring.org/project/242488 | 1.2.0        | 1.3.0        |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/018790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/012683 | 3.2.2        | 4.1.3        | ORPH
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/005022 | 2021.07      | 2025.07      | ORPH
                        uclibc |  DISTRO  | https://release-monitoring.org/project/013815 | 1.0.52       | 1.0.53       |     
                       udpcast |  DISTRO  | https://release-monitoring.org/project/010206 | 20230924     | 20250223     | ORPH
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.18.1       | ORPH
                           uhd |  DISTRO  | https://release-monitoring.org/project/012572 | 4.7.0.0      | 4.8.0.0      |     
                         ulogd |  DISTRO  | https://release-monitoring.org/project/005038 | 2.0.8        | 2.0.9        | ORPH
                       unbound |  DISTRO  | https://release-monitoring.org/project/005042 | 1.21.1       | 1.23.1       |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/017617 | 2.1          | 3.6          | ORPH
                         unrar |  DISTRO  | https://release-monitoring.org/project/013306 | 6.2.12       | 7.1.8        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/015848 | 1.5.12       | 1.9.6        | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/005056 | 0.99.19      | 1.90.9       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/013737 | 4.2.1        | 5.0.2        |     
                      usbguard |  DISTRO  | https://release-monitoring.org/project/011151 | 1.1.2        | 1.1.4        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/016012 | 0.14.0       | 0.15.0       | ORPH
                     ustreamer |  DISTRO  | https://release-monitoring.org/project/314869 | 6.37         | 6.39         |     
                      utf8proc |  DISTRO  | https://release-monitoring.org/project/007455 | 2.9.0        | 2.10.0       | ORPH
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/010956 | 0.13.2       | 0.15.1       |     
                      valijson |  DISTRO  | https://release-monitoring.org/project/018452 | 1.0.2        | 1.0.6        | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/005069 | 2.6.5        | 2.7.6        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/005080 | 1.8.0        | 1.8.3        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/005092 | 9.1.0145     | 9.1.1573     | ORPH
                   vis-network |  DISTRO  | https://release-monitoring.org/project/270536 | 9.1.0        | 10.0.1       |     
                           vlc |  DISTRO  | https://release-monitoring.org/project/006504 | 3.0.21       | 3.0.21-1     |     
                  vorbis-tools |  DISTRO  | https://release-monitoring.org/project/005104 | 1.4.2        | 1.4.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/010895 | 0.66.2       | 0.80.3       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/089353 | 3.5.16       | 3.5.17       |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/088835 | 1.4.317      | 1.4.323      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.4.317      | 1.4.322      | ORPH
                    vulkan-sdk |  DISTRO  | https://release-monitoring.org/project/370476 | 1.4.313.0    | 1.4.321.0    | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.4.317      | 1.4.322      | ORPH
                        waffle |  DISTRO  | https://release-monitoring.org/project/021633 | 1.7.0        | 1.8.1        |     
                       wavemon |  DISTRO  | https://release-monitoring.org/project/005120 | 0.9.5        | 0.9.6        | ORPH
                       wavpack |  DISTRO  | https://release-monitoring.org/project/005121 | 5.7.0        | 5.8.1        | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/010061 | 1.23.1       | 1.24.0       |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/013997 | 1.42         | 1.45         | ORPH
                     waylandpp |  DISTRO  | https://release-monitoring.org/project/016969 | 1.0.0        | 1.0.1        | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/005355 | 2.48.3       | 2.49.3       |     
                          webp |  DISTRO  | https://release-monitoring.org/project/001761 | 1.5.0        | 1.6.0        |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/015929 | 1.3          | 2.1          | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/013745 | 14.0.1       | 14.0.2       |     
                         which |  DISTRO  | https://release-monitoring.org/project/005127 | 2.21         | 2.23         | ORPH
                         whois |  DISTRO  | https://release-monitoring.org/project/005128 | 5.6.2        | 5.6.3        |     
                          wine |  DISTRO  | https://release-monitoring.org/project/005134 | 10.0         | 10.12        |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/015257 | 2025.02.20   | 2025.07.10   |     
                     wireshark |  DISTRO  | https://release-monitoring.org/project/005137 | 4.2.11       | 4.4.8        | ORPH
                       wlroots |  DISTRO  | https://release-monitoring.org/project/018357 | 0.18.2       | 0.19.0       |     
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.1.0        | 3.9.1        |     
                    wpan-tools |  DISTRO  | https://release-monitoring.org/project/021835 | 0.9          | 0.10         | ORPH
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/017557 | 2.44.4       | 2.48.3       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.41.0       | 0.45.0       | ORPH
                        x11vnc |  DISTRO  | https://release-monitoring.org/project/010182 | 0.9.16       | 0.9.17       |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/007275 | 3.5          | 4.1          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/015919 | 1.4.27       | 1.4.29       |     
                   xapp_appres |  DISTRO  | https://release-monitoring.org/project/015053 | 1.0.6        | 1.0.7        | ORPH
                 xapp_bdftopcf |  DISTRO  | https://release-monitoring.org/project/015054 | 1.1.1        | 1.1.2        | ORPH
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/000191 | 1.1.0        | 1.1.1        | ORPH
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/017160 | 1.0.8        | 1.0.9        | ORPH
               xapp_fonttosfnt |  DISTRO  | https://release-monitoring.org/project/021723 | 1.2.2        | 1.2.4        | ORPH
                xapp_fslsfonts |  DISTRO  | https://release-monitoring.org/project/017157 | 1.0.6        | 1.0.7        | ORPH
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/015048 | 1.0.9        | 1.0.10       | ORPH
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/017161 | 1.0.5        | 1.0.6        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/015047 | 1.1.1        | 20240910     | ORPH
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/015043 | 1.2.2        | 1.2.3        | ORPH
                   xapp_oclock |  DISTRO  | https://release-monitoring.org/project/015042 | 1.0.5        | 1.0.6        | ORPH
                  xapp_sessreg |  DISTRO  | https://release-monitoring.org/project/015040 | 1.1.3        | 1.1.4        | ORPH
                 xapp_showfont |  DISTRO  | https://release-monitoring.org/project/012316 | 1.0.6        | 1.0.7        | ORPH
                  xapp_smproxy |  DISTRO  | https://release-monitoring.org/project/015039 | 1.0.7        | 1.0.8        | ORPH
                      xapp_twm |  DISTRO  | https://release-monitoring.org/project/015038 | 1.0.12       | 1.0.13.1     | ORPH
                  xapp_viewres |  DISTRO  | https://release-monitoring.org/project/017162 | 1.0.7        | 1.0.8        | ORPH
                  xapp_x11perf |  DISTRO  | https://release-monitoring.org/project/015035 | 1.6.2        | 1.7.0        | ORPH
                    xapp_xauth |  DISTRO  | https://release-monitoring.org/project/005253 | 1.1.2        | 1.1.4        | ORPH
               xapp_xbacklight |  DISTRO  | https://release-monitoring.org/project/005161 | 1.2.3        | 1.2.4        | ORPH
                    xapp_xbiff |  DISTRO  | https://release-monitoring.org/project/015034 | 1.0.4        | 1.0.5        | ORPH
               xapp_xclipboard |  DISTRO  | https://release-monitoring.org/project/015033 | 1.1.4        | 1.1.5        | ORPH
                   xapp_xcmsdb |  DISTRO  | https://release-monitoring.org/project/015031 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xcompmgr |  DISTRO  | https://release-monitoring.org/project/005174 | 1.1.9        | 1.1.10       | ORPH
                 xapp_xconsole |  DISTRO  | https://release-monitoring.org/project/015030 | 1.0.8        | 1.1.0        |     
               xapp_xcursorgen |  DISTRO  | https://release-monitoring.org/project/021210 | 1.0.8        | 1.0.9        | ORPH
                 xapp_xditview |  DISTRO  | https://release-monitoring.org/project/021262 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xdm |  DISTRO  | https://release-monitoring.org/project/005255 | 1.1.14       | 1.1.17       | ORPH
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/005180 | 1.2.3        | 1.2.4        | ORPH
                      xapp_xev |  DISTRO  | https://release-monitoring.org/project/015026 | 1.2.5        | 1.2.6        | ORPH
                    xapp_xeyes |  DISTRO  | https://release-monitoring.org/project/015025 | 1.2.0        | 1.3.0        | ORPH
                 xapp_xfontsel |  DISTRO  | https://release-monitoring.org/project/015023 | 1.1.0        | 1.1.1        | ORPH
                      xapp_xfs |  DISTRO  | https://release-monitoring.org/project/005256 | 1.2.1        | 1.2.2        | ORPH
                    xapp_xhost |  DISTRO  | https://release-monitoring.org/project/015021 | 1.0.9        | 1.0.10       | ORPH
                    xapp_xinit |  DISTRO  | https://release-monitoring.org/project/005258 | 1.4.2        | 1.4.4        | ORPH
                  xapp_xkbcomp |  DISTRO  | https://release-monitoring.org/project/015018 | 1.4.6        | 1.4.7        | ORPH
                   xapp_xkbevd |  DISTRO  | https://release-monitoring.org/project/015017 | 1.1.5        | 1.1.6        | ORPH
                 xapp_xkbprint |  DISTRO  | https://release-monitoring.org/project/017159 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xkbutils |  DISTRO  | https://release-monitoring.org/project/015016 | 1.0.5        | 1.0.6        | ORPH
                    xapp_xload |  DISTRO  | https://release-monitoring.org/project/014992 | 1.1.4        | 1.2.0        | ORPH
                    xapp_xlogo |  DISTRO  | https://release-monitoring.org/project/014991 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xlsfonts |  DISTRO  | https://release-monitoring.org/project/014964 | 1.0.7        | 1.0.8        | ORPH
                     xapp_xmag |  DISTRO  | https://release-monitoring.org/project/014963 | 1.0.7        | 1.0.8        | ORPH
                     xapp_xman |  DISTRO  | https://release-monitoring.org/project/014962 | 1.1.5        | 1.2.0        | ORPH
                 xapp_xmessage |  DISTRO  | https://release-monitoring.org/project/014961 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xmh |  DISTRO  | https://release-monitoring.org/project/021718 | 1.0.4        | 1.0.5        | ORPH
                    xapp_xmore |  DISTRO  | https://release-monitoring.org/project/018845 | 1.0.3        | 1.0.4        | ORPH
                      xapp_xpr |  DISTRO  | https://release-monitoring.org/project/014959 | 1.1.0        | 1.2.0        | ORPH
                    xapp_xprop |  DISTRO  | https://release-monitoring.org/project/014958 | 1.2.6        | 1.2.8        | ORPH
                   xapp_xrandr |  DISTRO  | https://release-monitoring.org/project/014957 | 1.5.2        | 1.5.3        | ORPH
                 xapp_xrefresh |  DISTRO  | https://release-monitoring.org/project/014955 | 1.0.7        | 1.1.0        | ORPH
                      xapp_xsm |  DISTRO  | https://release-monitoring.org/project/005259 | 1.0.5        | 1.0.6        | ORPH
                     xapp_xwud |  DISTRO  | https://release-monitoring.org/project/014948 | 1.0.6        | 1.0.7        | ORPH
                     xcb-proto |  DISTRO  | https://release-monitoring.org/project/013646 | 1.15.2       | 1.17.0       | ORPH
               xcb-util-cursor |  DISTRO  | https://release-monitoring.org/project/005166 | 0.1.4        | 0.1.5        | ORPH
      xdriver_xf86-input-evdev |  DISTRO  | https://release-monitoring.org/project/005217 | 2.10.6       | 2.11.0       | ORPH
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/005782 | 1.3.0        | 1.5.0        | ORPH
  xdriver_xf86-input-synaptics |  DISTRO  | https://release-monitoring.org/project/005239 | 1.9.2        | 1.10.0       | ORPH
        xdriver_xf86-video-ast |  DISTRO  | https://release-monitoring.org/project/017163 | 1.1.6        | 1.2.0        | ORPH
      xdriver_xf86-video-fbdev |  DISTRO  | https://release-monitoring.org/project/005218 | 0.5.0        | 0.5.1        | ORPH
      xdriver_xf86-video-geode |  DISTRO  | https://release-monitoring.org/project/005219 | 2.11.21      | 2.18.1       | ORPH
     xdriver_xf86-video-mach64 |  DISTRO  | https://release-monitoring.org/project/005225 | 6.9.7        | 6.10.0       | ORPH
        xdriver_xf86-video-mga |  DISTRO  | https://release-monitoring.org/project/005226 | 2.0.1        | 2.1.0        | ORPH
    xdriver_xf86-video-nouveau |  DISTRO  | https://release-monitoring.org/project/005229 | 1.0.17       | 1.0.18       | ORPH
         xdriver_xf86-video-nv |  DISTRO  | https://release-monitoring.org/project/021711 | 2.1.22       | 2.1.23       | ORPH
       xdriver_xf86-video-r128 |  DISTRO  | https://release-monitoring.org/project/005232 | 6.12.1       | 6.13.0       | ORPH
     xdriver_xf86-video-savage |  DISTRO  | https://release-monitoring.org/project/005235 | 2.4.0        | 2.4.1        | ORPH
xdriver_xf86-video-siliconm... |  DISTRO  | https://release-monitoring.org/project/005236 | 1.7.9        | 1.7.10       | ORPH
                           xen |  DISTRO  | https://release-monitoring.org/project/005181 | 4.14.6       | 4.20.1       |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/005182 | 3.2.4        | 3.3.0        | ORPH
               xfont_encodings |  DISTRO  | https://release-monitoring.org/project/015051 | 1.0.7        | 1.1.0        | ORPH
 xfont_font-adobe-utopia-75dpi |  DISTRO  | https://release-monitoring.org/project/017200 | 1.0.4        | 1.0.5        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/015055 | 1.4.0        | 1.4.1        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/005188 | 6.11.0       | 6.15.0       | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/006382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/005191 | 2.38         | 2.45         | ORPH
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/005193 | 1.3.18       | 1.3.19       | ORPH
                    xlib_libFS |  DISTRO  | https://release-monitoring.org/project/001618 | 1.0.9        | 1.0.10       | ORPH
                   xlib_libICE |  DISTRO  | https://release-monitoring.org/project/001638 | 1.1.1        | 1.1.2        | ORPH
                    xlib_libSM |  DISTRO  | https://release-monitoring.org/project/001726 | 1.2.4        | 1.2.6        | ORPH
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/001764 | 1.8.7        | 1.8.12       | ORPH
                   xlib_libXau |  DISTRO  | https://release-monitoring.org/project/001765 | 1.0.11       | 1.0.12       | ORPH
                   xlib_libXaw |  DISTRO  | https://release-monitoring.org/project/001766 | 1.0.15       | 1.0.16       | ORPH
               xlib_libXcursor |  DISTRO  | https://release-monitoring.org/project/001770 | 1.2.1        | 1.2.3        | ORPH
                 xlib_libXdmcp |  DISTRO  | https://release-monitoring.org/project/001772 | 1.1.4        | 1.1.5        | ORPH
                  xlib_libXext |  DISTRO  | https://release-monitoring.org/project/001774 | 1.3.5        | 1.3.6        | ORPH
                xlib_libXfont2 |  DISTRO  | https://release-monitoring.org/project/017165 | 2.0.6        | 2.0.7        | ORPH
                   xlib_libXft |  DISTRO  | https://release-monitoring.org/project/001777 | 2.3.8        | 2.3.9        | ORPH
                    xlib_libXi |  DISTRO  | https://release-monitoring.org/project/001778 | 1.8.1        | 1.8.2        | ORPH
                   xlib_libXmu |  DISTRO  | https://release-monitoring.org/project/001785 | 1.1.4        | 1.2.1        | ORPH
                xlib_libXrandr |  DISTRO  | https://release-monitoring.org/project/001788 | 1.5.3        | 1.5.4        | ORPH
               xlib_libXrender |  DISTRO  | https://release-monitoring.org/project/001789 | 0.9.11       | 0.9.12       | ORPH
                    xlib_libXt |  DISTRO  | https://release-monitoring.org/project/001793 | 1.3.0        | 1.3.1        | ORPH
                  xlib_libXtst |  DISTRO  | https://release-monitoring.org/project/001794 | 1.2.4        | 1.2.5        | ORPH
                    xlib_libXv |  DISTRO  | https://release-monitoring.org/project/001795 | 1.0.12       | 1.0.13       | ORPH
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/001796 | 1.0.13       | 1.0.14       | ORPH
               xlib_libXxf86vm |  DISTRO  | https://release-monitoring.org/project/001799 | 1.1.5        | 1.1.6        | ORPH
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/001613 | 1.1.7        | 1.1.8        | ORPH
                  xlib_libxcvt |  DISTRO  | https://release-monitoring.org/project/235147 | 0.1.2        | 0.1.3        | ORPH
               xlib_libxkbfile |  DISTRO  | https://release-monitoring.org/project/001781 | 1.1.2        | 1.1.3        | ORPH
                   xlib_xtrans |  DISTRO  | https://release-monitoring.org/project/013441 | 1.5.0        | 1.6.0        | ORPH
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/005269 | 6.03         | 6.12         |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/007736 | 3.24         | 3.28         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/005272 | 389          | 401          | ORPH
              xutil_makedepend |  DISTRO  | https://release-monitoring.org/project/013528 | 1.0.8        | 1.0.9        | ORPH
             xutil_util-macros |  DISTRO  | https://release-monitoring.org/project/015037 | 1.20.0       | 1.20.2       | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/005280 | 0.40.0       | 14.1         |     
                            z3 |  DISTRO  | https://release-monitoring.org/project/007812 | 4.15.1       | 4.15.2       |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/005492 | 7.2.5        | 7.4.0        |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.5.1        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 7.2.1        |     
                        zoxide |  DISTRO  | https://release-monitoring.org/project/098400 | 0.9.6        | 0.9.8        |     
                       zziplib |  DISTRO  | https://release-monitoring.org/project/013802 | 0.13.74      | 0.13.80      |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2025-3891    | https://security-tracker.debian.org/tracker/CVE-2025-3891   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-3198    | https://security-tracker.debian.org/tracker/CVE-2025-3198   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                     bootstrap | CVE-2024-6531    | https://security-tracker.debian.org/tracker/CVE-2024-6531   
                         botan | CVE-2024-50382   | https://security-tracker.debian.org/tracker/CVE-2024-50382  
                         botan | CVE-2024-50383   | https://security-tracker.debian.org/tracker/CVE-2024-50383  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                          dpdk | CVE-2015-1142857 | https://security-tracker.debian.org/tracker/CVE-2015-1142857
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                        erlang | CVE-2025-32433   | https://security-tracker.debian.org/tracker/CVE-2025-32433  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                        giflib | CVE-2024-45993   | https://security-tracker.debian.org/tracker/CVE-2024-45993  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2024-56737   | https://security-tracker.debian.org/tracker/CVE-2024-56737  
                         grub2 | CVE-2024-56738   | https://security-tracker.debian.org/tracker/CVE-2024-56738  
                         grub2 | CVE-2024-45778   | https://security-tracker.debian.org/tracker/CVE-2024-45778  
                         grub2 | CVE-2024-45782   | https://security-tracker.debian.org/tracker/CVE-2024-45782  
                         grub2 | CVE-2024-45779   | https://security-tracker.debian.org/tracker/CVE-2024-45779  
                         grub2 | CVE-2024-45780   | https://security-tracker.debian.org/tracker/CVE-2024-45780  
                         grub2 | CVE-2025-0678    | https://security-tracker.debian.org/tracker/CVE-2025-0678   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     linux-pam | CVE-2024-10041   | https://security-tracker.debian.org/tracker/CVE-2024-10041  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                   micropython | CVE-2024-8947    | https://security-tracker.debian.org/tracker/CVE-2024-8947   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2024-49393   | https://security-tracker.debian.org/tracker/CVE-2024-49393  
                          mutt | CVE-2024-49395   | https://security-tracker.debian.org/tracker/CVE-2024-49395  
                          mutt | CVE-2024-49394   | https://security-tracker.debian.org/tracker/CVE-2024-49394  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7848    | https://security-tracker.debian.org/tracker/CVE-2015-7848   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                           orc | CVE-2024-40897   | https://security-tracker.debian.org/tracker/CVE-2024-40897  
                           orc | CVE-2025-47436   | https://security-tracker.debian.org/tracker/CVE-2025-47436  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2023-0778    | https://security-tracker.debian.org/tracker/CVE-2023-0778   
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-25580   | https://security-tracker.debian.org/tracker/CVE-2024-25580  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2024-36048   | https://security-tracker.debian.org/tracker/CVE-2024-36048  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                          sudo | CVE-2025-32463   | https://security-tracker.debian.org/tracker/CVE-2025-32463  
                          sudo | CVE-2025-32462   | https://security-tracker.debian.org/tracker/CVE-2025-32462  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                      unixodbc | CVE-2024-1013    | https://security-tracker.debian.org/tracker/CVE-2024-1013   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                           vim | CVE-2024-45306   | https://security-tracker.debian.org/tracker/CVE-2024-45306  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                        xerces | CVE-2024-23807   | https://security-tracker.debian.org/tracker/CVE-2024-23807  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2025.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2025-3891    | https://security-tracker.debian.org/tracker/CVE-2025-3891   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2024-53425   | https://security-tracker.debian.org/tracker/CVE-2024-53425  
                        assimp | CVE-2024-48426   | https://security-tracker.debian.org/tracker/CVE-2024-48426  
                        assimp | CVE-2024-48424   | https://security-tracker.debian.org/tracker/CVE-2024-48424  
                        assimp | CVE-2024-48425   | https://security-tracker.debian.org/tracker/CVE-2024-48425  
                        assimp | CVE-2024-46632   | https://security-tracker.debian.org/tracker/CVE-2024-46632  
                        assimp | CVE-2025-5165    | https://security-tracker.debian.org/tracker/CVE-2025-5165   
                        assimp | CVE-2025-5166    | https://security-tracker.debian.org/tracker/CVE-2025-5166   
                        assimp | CVE-2025-5168    | https://security-tracker.debian.org/tracker/CVE-2025-5168   
                        assimp | CVE-2025-5169    | https://security-tracker.debian.org/tracker/CVE-2025-5169   
                        assimp | CVE-2025-5167    | https://security-tracker.debian.org/tracker/CVE-2025-5167   
                        assimp | CVE-2025-3158    | https://security-tracker.debian.org/tracker/CVE-2025-3158   
                        assimp | CVE-2025-3160    | https://security-tracker.debian.org/tracker/CVE-2025-3160   
                        assimp | CVE-2025-3159    | https://security-tracker.debian.org/tracker/CVE-2025-3159   
                        assimp | CVE-2025-3196    | https://security-tracker.debian.org/tracker/CVE-2025-3196   
                        assimp | CVE-2025-2152    | https://security-tracker.debian.org/tracker/CVE-2025-2152   
                        assimp | CVE-2025-2151    | https://security-tracker.debian.org/tracker/CVE-2025-2151   
                        assimp | CVE-2025-2592    | https://security-tracker.debian.org/tracker/CVE-2025-2592   
                        assimp | CVE-2025-2591    | https://security-tracker.debian.org/tracker/CVE-2025-2591   
                        assimp | CVE-2025-2754    | https://security-tracker.debian.org/tracker/CVE-2025-2754   
                        assimp | CVE-2025-2751    | https://security-tracker.debian.org/tracker/CVE-2025-2751   
                        assimp | CVE-2025-2757    | https://security-tracker.debian.org/tracker/CVE-2025-2757   
                        assimp | CVE-2025-2752    | https://security-tracker.debian.org/tracker/CVE-2025-2752   
                        assimp | CVE-2025-2755    | https://security-tracker.debian.org/tracker/CVE-2025-2755   
                        assimp | CVE-2025-2756    | https://security-tracker.debian.org/tracker/CVE-2025-2756   
                        assimp | CVE-2025-2753    | https://security-tracker.debian.org/tracker/CVE-2025-2753   
                        assimp | CVE-2025-2750    | https://security-tracker.debian.org/tracker/CVE-2025-2750   
                        assimp | CVE-2025-6119    | https://security-tracker.debian.org/tracker/CVE-2025-6119   
                        assimp | CVE-2025-6120    | https://security-tracker.debian.org/tracker/CVE-2025-6120   
                        assimp | CVE-2025-3548    | https://security-tracker.debian.org/tracker/CVE-2025-3548   
                        assimp | CVE-2025-3549    | https://security-tracker.debian.org/tracker/CVE-2025-3549   
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-3198    | https://security-tracker.debian.org/tracker/CVE-2025-3198   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                     bootstrap | CVE-2024-6531    | https://security-tracker.debian.org/tracker/CVE-2024-6531   
                         botan | CVE-2024-50382   | https://security-tracker.debian.org/tracker/CVE-2024-50382  
                         botan | CVE-2024-50383   | https://security-tracker.debian.org/tracker/CVE-2024-50383  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                          dpdk | CVE-2015-1142857 | https://security-tracker.debian.org/tracker/CVE-2015-1142857
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                        erlang | CVE-2025-32433   | https://security-tracker.debian.org/tracker/CVE-2025-32433  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                        giflib | CVE-2024-45993   | https://security-tracker.debian.org/tracker/CVE-2024-45993  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2024-56737   | https://security-tracker.debian.org/tracker/CVE-2024-56737  
                         grub2 | CVE-2024-56738   | https://security-tracker.debian.org/tracker/CVE-2024-56738  
                         grub2 | CVE-2024-45778   | https://security-tracker.debian.org/tracker/CVE-2024-45778  
                         grub2 | CVE-2024-45782   | https://security-tracker.debian.org/tracker/CVE-2024-45782  
                         grub2 | CVE-2024-45779   | https://security-tracker.debian.org/tracker/CVE-2024-45779  
                         grub2 | CVE-2024-45780   | https://security-tracker.debian.org/tracker/CVE-2024-45780  
                         grub2 | CVE-2025-0678    | https://security-tracker.debian.org/tracker/CVE-2025-0678   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                      libde265 | CVE-2024-38950   | https://security-tracker.debian.org/tracker/CVE-2024-38950  
                      libde265 | CVE-2024-38949   | https://security-tracker.debian.org/tracker/CVE-2024-38949  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     linux-pam | CVE-2024-10041   | https://security-tracker.debian.org/tracker/CVE-2024-10041  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2025-49601   | https://security-tracker.debian.org/tracker/CVE-2025-49601  
                       mbedtls | CVE-2025-49600   | https://security-tracker.debian.org/tracker/CVE-2025-49600  
                       mbedtls | CVE-2025-52497   | https://security-tracker.debian.org/tracker/CVE-2025-52497  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                   micropython | CVE-2024-8947    | https://security-tracker.debian.org/tracker/CVE-2024-8947   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2024-49393   | https://security-tracker.debian.org/tracker/CVE-2024-49393  
                          mutt | CVE-2024-49395   | https://security-tracker.debian.org/tracker/CVE-2024-49395  
                          mutt | CVE-2024-49394   | https://security-tracker.debian.org/tracker/CVE-2024-49394  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                       netsnmp | CVE-2022-44793   | https://security-tracker.debian.org/tracker/CVE-2022-44793  
                       netsnmp | CVE-2022-44792   | https://security-tracker.debian.org/tracker/CVE-2022-44792  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7848    | https://security-tracker.debian.org/tracker/CVE-2015-7848   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                       openssh | CVE-2025-26465   | https://security-tracker.debian.org/tracker/CVE-2025-26465  
                       openssh | CVE-2025-26466   | https://security-tracker.debian.org/tracker/CVE-2025-26466  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                           orc | CVE-2024-40897   | https://security-tracker.debian.org/tracker/CVE-2024-40897  
                           orc | CVE-2025-47436   | https://security-tracker.debian.org/tracker/CVE-2025-47436  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-25580   | https://security-tracker.debian.org/tracker/CVE-2024-25580  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2024-36048   | https://security-tracker.debian.org/tracker/CVE-2024-36048  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                       quickjs | CVE-2025-46688   | https://security-tracker.debian.org/tracker/CVE-2025-46688  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                          sudo | CVE-2025-32463   | https://security-tracker.debian.org/tracker/CVE-2025-32463  
                          sudo | CVE-2025-32462   | https://security-tracker.debian.org/tracker/CVE-2025-32462  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                      unixodbc | CVE-2024-1013    | https://security-tracker.debian.org/tracker/CVE-2024-1013   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                           vim | CVE-2024-45306   | https://security-tracker.debian.org/tracker/CVE-2024-45306  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                        xerces | CVE-2024-23807   | https://security-tracker.debian.org/tracker/CVE-2024-23807  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2025.05.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2025-3891    | https://security-tracker.debian.org/tracker/CVE-2025-3891   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2024-53425   | https://security-tracker.debian.org/tracker/CVE-2024-53425  
                        assimp | CVE-2024-48426   | https://security-tracker.debian.org/tracker/CVE-2024-48426  
                        assimp | CVE-2024-48424   | https://security-tracker.debian.org/tracker/CVE-2024-48424  
                        assimp | CVE-2024-48425   | https://security-tracker.debian.org/tracker/CVE-2024-48425  
                        assimp | CVE-2024-46632   | https://security-tracker.debian.org/tracker/CVE-2024-46632  
                        assimp | CVE-2025-5165    | https://security-tracker.debian.org/tracker/CVE-2025-5165   
                        assimp | CVE-2025-5166    | https://security-tracker.debian.org/tracker/CVE-2025-5166   
                        assimp | CVE-2025-5168    | https://security-tracker.debian.org/tracker/CVE-2025-5168   
                        assimp | CVE-2025-5169    | https://security-tracker.debian.org/tracker/CVE-2025-5169   
                        assimp | CVE-2025-5167    | https://security-tracker.debian.org/tracker/CVE-2025-5167   
                        assimp | CVE-2025-3158    | https://security-tracker.debian.org/tracker/CVE-2025-3158   
                        assimp | CVE-2025-3160    | https://security-tracker.debian.org/tracker/CVE-2025-3160   
                        assimp | CVE-2025-3159    | https://security-tracker.debian.org/tracker/CVE-2025-3159   
                        assimp | CVE-2025-3196    | https://security-tracker.debian.org/tracker/CVE-2025-3196   
                        assimp | CVE-2025-2152    | https://security-tracker.debian.org/tracker/CVE-2025-2152   
                        assimp | CVE-2025-2151    | https://security-tracker.debian.org/tracker/CVE-2025-2151   
                        assimp | CVE-2025-2592    | https://security-tracker.debian.org/tracker/CVE-2025-2592   
                        assimp | CVE-2025-2591    | https://security-tracker.debian.org/tracker/CVE-2025-2591   
                        assimp | CVE-2025-2754    | https://security-tracker.debian.org/tracker/CVE-2025-2754   
                        assimp | CVE-2025-2751    | https://security-tracker.debian.org/tracker/CVE-2025-2751   
                        assimp | CVE-2025-2757    | https://security-tracker.debian.org/tracker/CVE-2025-2757   
                        assimp | CVE-2025-2752    | https://security-tracker.debian.org/tracker/CVE-2025-2752   
                        assimp | CVE-2025-2755    | https://security-tracker.debian.org/tracker/CVE-2025-2755   
                        assimp | CVE-2025-2756    | https://security-tracker.debian.org/tracker/CVE-2025-2756   
                        assimp | CVE-2025-2753    | https://security-tracker.debian.org/tracker/CVE-2025-2753   
                        assimp | CVE-2025-2750    | https://security-tracker.debian.org/tracker/CVE-2025-2750   
                        assimp | CVE-2025-6119    | https://security-tracker.debian.org/tracker/CVE-2025-6119   
                        assimp | CVE-2025-6120    | https://security-tracker.debian.org/tracker/CVE-2025-6120   
                        assimp | CVE-2025-3548    | https://security-tracker.debian.org/tracker/CVE-2025-3548   
                        assimp | CVE-2025-3549    | https://security-tracker.debian.org/tracker/CVE-2025-3549   
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-3198    | https://security-tracker.debian.org/tracker/CVE-2025-3198   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                     bootstrap | CVE-2024-6531    | https://security-tracker.debian.org/tracker/CVE-2024-6531   
                         botan | CVE-2024-50382   | https://security-tracker.debian.org/tracker/CVE-2024-50382  
                         botan | CVE-2024-50383   | https://security-tracker.debian.org/tracker/CVE-2024-50383  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                          dpdk | CVE-2015-1142857 | https://security-tracker.debian.org/tracker/CVE-2015-1142857
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                        erlang | CVE-2025-32433   | https://security-tracker.debian.org/tracker/CVE-2025-32433  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                        giflib | CVE-2024-45993   | https://security-tracker.debian.org/tracker/CVE-2024-45993  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2024-56737   | https://security-tracker.debian.org/tracker/CVE-2024-56737  
                         grub2 | CVE-2024-56738   | https://security-tracker.debian.org/tracker/CVE-2024-56738  
                         grub2 | CVE-2024-45778   | https://security-tracker.debian.org/tracker/CVE-2024-45778  
                         grub2 | CVE-2024-45782   | https://security-tracker.debian.org/tracker/CVE-2024-45782  
                         grub2 | CVE-2024-45779   | https://security-tracker.debian.org/tracker/CVE-2024-45779  
                         grub2 | CVE-2024-45780   | https://security-tracker.debian.org/tracker/CVE-2024-45780  
                         grub2 | CVE-2025-0678    | https://security-tracker.debian.org/tracker/CVE-2025-0678   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                      libde265 | CVE-2024-38950   | https://security-tracker.debian.org/tracker/CVE-2024-38950  
                      libde265 | CVE-2024-38949   | https://security-tracker.debian.org/tracker/CVE-2024-38949  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     linux-pam | CVE-2024-10041   | https://security-tracker.debian.org/tracker/CVE-2024-10041  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2025-49601   | https://security-tracker.debian.org/tracker/CVE-2025-49601  
                       mbedtls | CVE-2025-49600   | https://security-tracker.debian.org/tracker/CVE-2025-49600  
                       mbedtls | CVE-2025-52497   | https://security-tracker.debian.org/tracker/CVE-2025-52497  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                   micropython | CVE-2024-8947    | https://security-tracker.debian.org/tracker/CVE-2024-8947   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2024-49393   | https://security-tracker.debian.org/tracker/CVE-2024-49393  
                          mutt | CVE-2024-49395   | https://security-tracker.debian.org/tracker/CVE-2024-49395  
                          mutt | CVE-2024-49394   | https://security-tracker.debian.org/tracker/CVE-2024-49394  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7848    | https://security-tracker.debian.org/tracker/CVE-2015-7848   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                           orc | CVE-2024-40897   | https://security-tracker.debian.org/tracker/CVE-2024-40897  
                           orc | CVE-2025-47436   | https://security-tracker.debian.org/tracker/CVE-2025-47436  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2023-0778    | https://security-tracker.debian.org/tracker/CVE-2023-0778   
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-25580   | https://security-tracker.debian.org/tracker/CVE-2024-25580  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2024-36048   | https://security-tracker.debian.org/tracker/CVE-2024-36048  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                          sudo | CVE-2025-32463   | https://security-tracker.debian.org/tracker/CVE-2025-32463  
                          sudo | CVE-2025-32462   | https://security-tracker.debian.org/tracker/CVE-2025-32462  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                      unixodbc | CVE-2024-1013    | https://security-tracker.debian.org/tracker/CVE-2024-1013   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                           vim | CVE-2024-45306   | https://security-tracker.debian.org/tracker/CVE-2024-45306  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                        xerces | CVE-2024-23807   | https://security-tracker.debian.org/tracker/CVE-2024-23807  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
