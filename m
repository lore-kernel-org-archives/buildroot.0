Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822B6D42B9E
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 04:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7EBB80AD1;
	Wed, 13 Nov 2024 04:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYLgGrTa75_J; Wed, 13 Nov 2024 04:14:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CFD580630
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CFD580630;
	Wed, 13 Nov 2024 04:14:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 270031531
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 04:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B8078058C
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 04:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugJ-5Wt-Xj4w for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 04:14:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9656080520
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9656080520
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9656080520
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 04:14:36 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9a68480164so910342966b.3
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 20:14:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731471274; x=1732076074;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CgAe51NKOFSUiD4xfquekxvFqUd2eyKljaCqUbGzRCA=;
 b=IKu4yq1DRmnRy+7QeVH/+fGYzWNL6kk5SMRVBGh5pur0eNKGrYttuxml3SbJlg6YGp
 xdonSIx9mZpOAjutKumqMTg4VvbPDJArSCcpSvoc6ZqzJ37l1GmyUXYlIUWhukjFgZol
 wyd/gzw2YailfeirE0AhLszVXp/vfSeQm2eZ1XTYygoxi0kLaBYAAETI0/XBr4o9wHys
 f5ACr/CSdZM9yMNFDqq/2l8YSoaP+30OuEFxu1SVpzYCLu69G/ys9T+HRcu2GRTmrtFm
 nJvpLgYWbpcNqVihuvW2cu8iPfjb7YzXvOCku+A+v64wolj4Q8qJhR0GMdL3n3c1EbnL
 mXrA==
X-Gm-Message-State: AOJu0YyJHLT8fnWh1pVh1rCIUlyIFbbD1fxkujVEgpad4VeZXtfDhFMG
 i7dOa86hkHjLKQqoE4nXAVA03b6TUcOtuu6T4uNzRAgFeXvL9fV1rvAwcg==
X-Google-Smtp-Source: AGHT+IELJAzbugTWr8sIpbNSvHVRmnZ+XRnBC+qneDElyijXMORI43PshtiMG3UkFxiwjqRWvJNULA==
X-Received: by 2002:a17:907:d13:b0:a99:ffef:aec5 with SMTP id
 a640c23a62f3a-a9eeff0e434mr2011744866b.23.1731471274223; 
 Tue, 12 Nov 2024 20:14:34 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a48b1fsm806635666b.58.2024.11.12.20.14.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 20:14:33 -0800 (PST)
Message-ID: <673427a9.170a0220.3bd515.bde0@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 13 Nov 2024 04:14:33 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731471274; x=1732076074; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=CgAe51NKOFSUiD4xfquekxvFqUd2eyKljaCqUbGzRCA=;
 b=QWSLcreYXpKQG2m9NcLQQG/O1YinSN5phqUEF23lo3BaSQgClVFdc1JMQ7HXkU6Suq
 dzIFErfqkxst+qQXYAw1VjHeh/XMxVW9OIL3LQi9r2nGLdnAkq1ea7nyTSBwtvgOwd9A
 8IkIm/pxW/4b061kSR357rAMDllSeI2Kmwlow6gMbEFR3raKZw3a5fCG2svadgUfFAGe
 04korLqgXDsuImEGsslGp6tt53tM4vKMKeS5fpm4zgBGJvKnv2zspfsODmW/5CQWtJpb
 GIkF1lDZb2BnVFYr+3cHd3DEaalvD5e08jF3feZpNLLDQKythlhA/PQCrA9JzNbFY9MF
 FqyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QWSLcreY
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-12
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

Autobuild statistics for 2024-11-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  2  |  0  |  5  |
  2024.08.x  |  5  |  4  |  0  |  9  |
    master   | 14  | 290 |  5  | 309 |

Classification of failures by reason for master
-----------------------------------------------

             util-linux-2.40.2 | 17
             dahdi-linux-3.3.0 | 15
 ibm-sw-tpm2-rev183-2024-03-27 | 15
                  linux-6.11.7 | 11
           host-doxygen-1.8.18 | 10
                lmbench-3.0-a9 | 10
              libopenssl-3.4.0 | 8 
                  curlpp-0.8.1 | 7 
                  ffmpeg-6.1.2 | 7 
  gobject-introspection-1.76.1 | 7 
          linux-5.10.162-cip24 | 6 
                  ntp-4.2.8p18 | 6 
               procps-ng-4.0.4 | 6 
               pulseaudio-17.0 | 6 
                elfutils-0.189 | 5 
         gobject-introspection | 5 
              host-rust-1.82.0 | 5 
                 libv4l-1.28.1 | 5 
                  bcusdk-0.0.5 | 4 
                   bird-2.15.1 | 4 
                   foot-1.16.2 | 4 
            host-binutils-2.42 | 4 
                 pixman-0.42.2 | 4 
android-tools-4.2.2+git2013... | 3 
                 c-ares-1.34.2 | 3 
                  giblib-1.2.4 | 3 
             gstreamer1-1.22.9 | 3 
      libabseil-cpp-20240722.0 | 3 
                libdrm-2.4.123 | 3 
                libesmtp-1.1.0 | 3 
                  libva-2.22.0 | 3 
           libzenoh-pico-1.0.1 | 3 
     linux-5.10.162-cip24-rt10 | 3 
               linux-pam-1.6.1 | 3 
              mosquitto-2.0.20 | 3 
                   perl-5.40.0 | 3 
                       unknown | 3 
               acpica-20240927 | 2 
                  boost-1.83.0 | 2 
             cni-plugins-1.3.0 | 2 
                   crun-1.18.2 | 2 
            gdk-pixbuf-2.42.12 | 2 
                  jack2-1.9.22 | 2 
                  libnss-3.106 | 2 
               libunwind-1.8.1 | 2 
                libxml2-2.13.4 | 2 
                   linux-tools | 2 
                  lvm2-2.03.27 | 2 
               mariadb-10.11.6 | 2 
            netstat-nat-1.4.10 | 2 
                 openssh-9.9p1 | 2 
                pipewire-1.2.2 | 2 
                 agentpp-4.6.1 | 1 
           at-spi2-core-2.50.0 | 1 
                    azmq-1.0.3 | 1 
                  boinc-7.20.2 | 1 
                busybox-1.36.1 | 1 
                cairomm-1.16.2 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
          cloudflared-2024.9.1 | 1 
                 coreutils-9.5 | 1 
                cryptopp-8.9.0 | 1 
                   cvs-1.12.13 | 1 
                   duma-2.5.21 | 1 
                  fwupd-1.9.20 | 1 
             fxload-2008_10_13 | 1 
            gettext-gnu-0.22.4 | 1 
               graphene-1.10.8 | 1 
         graphicsmagick-1.3.40 | 1 
                   grpc-1.51.1 | 1 
          host-binutils-2.43.1 | 1 
         host-libxcrypt-4.4.36 | 1 
   host-mender-artifact-3.11.2 | 1 
    host-python-greenlet-3.1.1 | 1 
             libapparmor-3.1.7 | 1 
               libglib2-2.76.1 | 1 
        liblog4c-localtime-1.0 | 1 
                  libnvme-1.11 | 1 
                 libpng-1.6.44 | 1 
                  libsepol-3.7 | 1 
                   libsha1-0.3 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
              libtracefs-1.8.1 | 1 
              libunistring-1.3 | 1 
                  liburing-2.6 | 1 
             lirc-tools-0.10.2 | 1 
            live555-2021.05.03 | 1 
        ltp-testsuite-20240524 | 1 
                 mdevd-0.1.6.4 | 1 
                memtest86-6.20 | 1 
                   mimic-1.1.0 | 1 
                    mpir-3.0.0 | 1 
           oath-toolkit-2.6.12 | 1 
          obsidian-cursors-1.0 | 1 
               openblas-0.3.28 | 1 
                     pcre-8.45 | 1 
      python-autocommand-2.2.2 | 1 
                  quagga-1.2.4 | 1 
                ramspeed-2.6.0 | 1 
       riemann-c-client-1.10.5 | 1 
                  snmppp-3.5.1 | 1 
                tpm2-tss-3.2.2 | 1 
        util-linux-libs-2.40.2 | 1 
                  whois-5.5.14 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        acpica-20240927         | NOK | https://autobuild.buildroot.org/results/d6c9c03e52a5db7ab627819bb3752ddf11d1d1a1 | ORPH
powerpc64le  |        acpica-20240927         | NOK | https://autobuild.buildroot.org/results/a46b64db41cb7f38ca82f8ed644ae27d703ff6a0 | ORPH
    m68k     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/e75b749f008c2ccc25ed37f0719e7c9e6fcbff8c |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/a179f4e45370fd4c20b87eb838d95aca31ccba95 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/a0bcb585101139188bbb229a278dd4f25d8e0b05 |     
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/3eab59359465115d9b3f4ef4bdbd0f9bcc2850e7 |     
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/5b6f7f03c395dd3ead9f74b78a0cb1755046c1af |     
microblazeel |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/c8258aa2037e40141c74f9fab4db882f425a99a2 |     
   mipsel    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/064d74e025ca7d23ec3eee02a86c82bcc6447ac2 |     
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/5376335c4477de0b0525df31ccf7014b31d73223 |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/59b85bcdbc5233d449ceeac258abc8e288a58ea4 |     
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/01138b61161a34cf2a0bd67c367b83d8e8bdc3f7 |     
  aarch64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/5fff14753b1d4b8e99f65e3351fd83c82545a046 |     
   mips64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/d19840cc943254da0bbafd4c381ea0ab9d87ca67 |     
   sh4aeb    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/5a22d4a5bf7c618e9ae047b95267150d95ee67e1 |     
   s390x     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/6ccdc65790cceb98722d112bde441e4211754b9f |     
   nios2     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/8e028a493b12d9695281fd5bc6952d680ef1c5c2 |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/005c607f4d05eb86cfecaccd62df43c7254f2b7d |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/73439ba3a68088e7aab938a28c3fea89c14a4b2a |     
  riscv32    |         busybox-1.36.1         | NOK | https://autobuild.buildroot.org/results/a6e1d74af3be316ce24600c3fed068302cc63223 | ORPH
    i686     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/0b63c3fcfa2179e4f3057b1418b2d2e02fcc2b7b | ORPH
    arc      |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/33fcc11c17683b84f39ba64962879ad1a136a085 | ORPH
    i586     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/73396d63df4364b1a45cb19a07d05961a8bb2da8 | ORPH
   x86_64    |         cairomm-1.16.2         | NOK | https://autobuild.buildroot.org/results/0dfb19f64c5dfca8af3b6b1ffab994baf06548ee |     
 aarch64_be  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/20d533a8e72c4108f16f784e4eb0daae393f5589 |     
  riscv64    |      cloudflared-2024.9.1      | NOK | https://autobuild.buildroot.org/results/111ff016968b027daff34b3f41422aa88fe07301 |     
   s390x     |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/504659db8bd30271662f4cff25d5e421972f4acf |     
    i686     |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/0dcf8c82680ec67e75645354739064b6590e2e74 |     
   sh4aeb    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/65fde7f9f35d4a901d1e3348e18c6476f45bf6e3 | ORPH
   arceb     |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/9a8f6eae6fa9febcef7b023b6f87f976a93f7af2 |     
   mips64    |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/ee86c9078843d4dbb32228d9a8e35844df11c706 |     
   nios2     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/bf4871bd855946d0564b304993af2dd9aff9a8a6 |     
  aarch64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/bfd44253a4a5d991d74f05eb0e502253e2a2c05b |     
   arceb     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/ec57bbbca15fab3b7bff8f869ea4b993054cdb47 |     
powerpc64le  |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/644ff07daffed7c75dc55768d2a287eb19c7365f |     
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/9ce7957bd0ecc7e1ea1340ad24421e03e3c4e85c |     
    mips     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/4815b22652a0f15a68cd66a7a40f20f9a6a3e846 |     
   nios2     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/bf8b3318223073c737d97fec00c8cf396dbd45c4 |     
   mips64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/59790e2c799bb1a4e95783063119b704cfbe0e09 |     
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/eb0acee083cdc7d8e30426abd72f3c11ce5210e2 | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7ffbc80565beed39550296306a41c15ec6a6bded |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d076c62d2259d7651ebe3e2ed53d589135aabe0a |     
   arceb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5b912fd8c7c296ceea3876cca51a780dc8b7fab9 |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0f93267509189807cb50cae9355cad14abb39248 |     
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ab41946eb8105328208edc6e85667dfe79644d74 |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e61989ae43835a440a7092d612e39144a288e3bc |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ef30a7ea57311e1de9ae1596ea8228f201ee1b2e |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/70cc8e7248fdead870735888e3ae938ab60aa5aa |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7f3c0ca30cf67681437b9a532acaf42aaf0c566f |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2c16fb27a56fbb415f7969580a26e2a4f7547288 |     
   nios2     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7d483661ca6f1612418f54a89a16116e55b3d563 |     
    i586     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f6bba6a4f7672454ac4a86c3170e3b5d82ab846e |     
   arceb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a954d295df8c45f6adc3088da804e8abddc58616 |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3fa20c7b8ad93a16d60e1d6551b8b9d36fbbb4fa |     
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a21e3869ae85a6ba9a82a8a6a1de7b4d3cc36c27 |     
    arc      |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/9770588adf7cce5cf4b3cf6982e9b006f7131c05 | ORPH
   x86_64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/e9cd0216c50cc7097afac262af5dae062a4aad74 | ORPH
  mips64el   |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/19b2ceeb59c10c38e2c74d743f59c37f64ad0348 | ORPH
   mips64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/7b2c1062405a22a1c3a2978faac64d853077d5b2 | ORPH
  mips64el   |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/b8039772beb228b64ae39434121b04cf3fcd376e | ORPH
    mips     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/734fdbdaeb5dd5d12ed26bda976219b624a5c2ed | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/c06d121da332f504c1515127744893e84cf596d8 |     
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/53db32bcbaab8d703a1ded18823c31bc7588da89 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/51b50aedcfbb4b6169503c0ddfbf503a342b56ca |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/cea6e99873a7e3c61005ff58e98ef56d91db6e4a |     
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/8ba6886d0f13c0996e4311585c65a61a06816a99 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/d84802388eaab37b6ae65568ad86653328f55caf |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/cadaaae65b7327c8dbff102bfa3a22e11be78039 |     
powerpc64le  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/28d2889cbde7234612c866734b6456b5dc20d5e2 |     
    arm      |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/e0eb108c97b477167c915edb669c9500b99cd4bf |     
  mips64el   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/fd3f7c41b459ab24ec6508aa4a252b61f874e3eb |     
    m68k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/cc77dc276037ba251ec7a681bf0e2b6698eef8e5 |     
microblazeel |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/1d5271e549f5df5fa09a9653a218cfbcd83a2d7d |     
powerpc64le  |       fxload-2008_10_13        | NOK | https://autobuild.buildroot.org/results/5e3ff102b64c5459376c89dbad301a3562211975 |     
  aarch64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/60e64a2c2877212377495493370347411ab50952 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/8433c6a387e2bd3c24245118c9b77a37560ee7b3 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/92754e8580b38ba18b539061ea6c25acf98da4a5 | ORPH
  riscv32    |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/901b325958ccd16886690356849c1e5486fe3bc6 |     
   nios2     |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/82a824bc02d7f0b09ab969d8d9d3f41d388ccef1 |     
   s390x     |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/6e09b8a14de88c06648c6df66152bf63c16b7021 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/33c879092eefe8e1e3a9eac1637a23c6afa8de9b |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/5cb768d85b16f3a23dff525b001af5f2f37087c0 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/68a8156b614f2436ed040d3e1d324c5b7ed08b78 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/3926f7ee57608c1726ac9a19d02bb30ad25bb07c |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/5cd954ba2ae7abb8edb817e6756d226f65460f62 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/0d3e1e9a57cd20195fec605ca2b3a955b6833a30 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/0766b8e515cdf4bea765f880ca508cf368a839dd | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/71f8268ff5820289d91cea0dcc3e12ca44bc0da7 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/6d348918f6cb22c2a979c8834abe72cddea378cb | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/3ea2b3570e6905d496b138f660838c74837fee81 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/e2b6a8139d7bc85221a1820aac4f27239e74f139 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/ff86d7d5ae1085ae1c14b19a25affc4edcbbe96d | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/773aca92e582b9553cabdd375829c9174b42d9c6 |     
    i586     |     graphicsmagick-1.3.40      | NOK | https://autobuild.buildroot.org/results/2f9222c43430e97ea8954f369fa546b1245afa70 |     
    i686     |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/c51dbe5a5991fad9c24c6a5aedec5434d3fa3dc6 |     
    m68k     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/f3bce658594d380dcc023f323dad540e0aef3f9b | ORPH
    m68k     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/fc9072c69c518cdbcbfbe71c9e1871a16690e060 | ORPH
   mipsel    |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/a6db0952768114811b98a7756d7c69eaf95cc3df | ORPH
   sparc     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/1c0788947bb79f6435d70cc19ee421cbf225dbaf |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c8bdb0d25cef98c4b789dc26a94dbc4cf0123f9e |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/860951357ac801fce1928018750f3ddd66523625 |     
 aarch64_be  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/dcb842355a67b8acffa28d1b599b60057eea602c |     
    m68k     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/dc3ea46038c18a317ff17b1398dbd7e952ed3686 |     
   s390x     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/0c60e0013a5d21276ce7ec1cb86d7794949a60f5 | ORPH
    m68k     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/f68de5b2de0cacb1d4211eea528373fff029eab0 | ORPH
   s390x     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/bb1478e59611503b484bc5441035d1873d5cc5f6 | ORPH
powerpc64le  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/1c0b4f7982e3dc30e5f5841d8e554f3ed4bd62f2 | ORPH
   sparc     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/ec0c90f651e3304640fbaae952cb6f44742a9df1 | ORPH
    or1k     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/a24444daa63a589d483f67970ec57aa2466bcdeb | ORPH
 powerpc64   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/27ae2c9dcf673515bd06930732899f8566109168 | ORPH
 powerpc64   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/3e41b016911b481a1130594a035d205fffafc392 | ORPH
microblazeel |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/b71db64c08f1106b59d54273d1822d867e56c07a | ORPH
 aarch64_be  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/ecf94f1cf245af0c8a95fb127db342f9af967fbc | ORPH
  mips64el   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/862c3f4289360a97e3485b10b584fd1113250f32 |     
  riscv64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/42b56805a04acc16c0193b9a15e7ad8c07e3c8dc |     
   mips64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/644fdba702a237a6c7fc4d9fcdc721eae3972129 |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/6150c51a0bafa0dd275b8128667f7fa2d370a168 |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/9163f66896df21bd19dc2dbbcc0a706b2956b2e4 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/87bd50da1b49aed36c79b60944eb154620fd5a99 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/c19cea39e0ad72f7b2404b53860bb8164406be13 |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/d2191ff2ea13ca4a786e9a9954dfda5a8cba4e5b |     
 microblaze  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/e400a741f3064d61c2be0bfa6183e29e725b8e8f |     
 powerpc64   | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/09b62a19a24c7334bd18b6c877e3f67a27e0ac95 |     
  mips64el   | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/38a07c7958091dcf6914468c77a33c8b0dd8446a |     
microblazeel | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/22907673c966d13f984d0e328afa617cefc527b4 |     
   mipsel    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/deef25fa5950f3fcd97d1500a97df819c18a7133 |     
   mips64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/ba2cfdde95ae1d64b0e7c77940fdc926fd939b2e |     
    arc      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/de383ac9b44017e211cd606fa36b7d5f80102474 |     
    or1k     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/31fd30d6dcba16538b30ce583fb55f44348e370d |     
   mipsel    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/1531aa285e82e9495652758ea5032d3d6cc767be |     
  aarch64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/b256a3312b8f3fcfdaf8de3e1f8605dbb78dd2e9 |     
 microblaze  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/414300357fdea7c1656a856eecb66f56482d39d3 |     
   armeb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/c5e73c7770e7529a79dcb506ef4cff79272882d9 |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/e9c193b1ef39d893acd8d48ad60aa79b20652350 |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/f9581ab991c59fcf01a3c2c6a7e478164e36f041 |     
    arc      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/89841a583915189ee3fd21adaedff58d3e1ea4b5 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/1686df9141fd2a1477848f35168198f2572caee5 |     
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/41d23802cc8eb6b0c5e1b87ec756eb0ea22568ba |     
    mips     |    libabseil-cpp-20240722.0    | NOK | https://autobuild.buildroot.org/results/054f5bd52243480191c26a5221bf52eb0ba6e871 |     
   mips64    |    libabseil-cpp-20240722.0    | NOK | https://autobuild.buildroot.org/results/fe67449008e7625fafe7a676de35c733c9d2d06c |     
   mips64    |    libabseil-cpp-20240722.0    | NOK | https://autobuild.buildroot.org/results/7237ba68cd152a3ad98c71c0257a5f8f26504cb9 |     
   sh4aeb    |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/a1402971f715f46cfb9cbf35eb50b24857e083de |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/71046939a21028f9180d0a3f86a976eed605ce45 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/32c63b247c226e42ded3e482e5dc89ef0f590365 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/38574d1db0e4bfd5b75d037c3e3cd592a6328ae4 |     
    or1k     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/979f43c6960d341fa8200c43ccea89e7f25812c6 | ORPH
  sparc64    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/9eda052d35e6e28d6e824d0fc7574bfa576b81cb | ORPH
   armeb     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/6dca507061912b2354202d8bda817fedbbd3ccb5 | ORPH
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/9d56ae834179e777f5c26e5a90f209c5e5b89a4f |     
   sparc     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/5d7cccec4db401319a578acb19abaa6daca2e7e4 |     
  powerpc    |          libnss-3.106          | NOK | https://autobuild.buildroot.org/results/a8719a927297c3048ab8dd1619fcd7626a90e1b5 |     
   mipsel    |          libnss-3.106          | NOK | https://autobuild.buildroot.org/results/bd0f600b326826722e4f41230043087b182d9432 |     
 powerpc64   |          libnvme-1.11          | NOK | https://autobuild.buildroot.org/results/cee0b0ad4385f1be6d6949f653472b61606b2b3e |     
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/d9469b0223c776041975fa7ba214a3f8067a6f8b | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/264dc534713882408b3b1cdecdc36183920aa939 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/bb283d28bee400e8936936c4f401fb9550af2fb2 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/21a5e21c34207460a87de221608ebab5944a6daa | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/dc9a663bf0d2ff7d12a318fdd8db0d63a65165c0 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/351effd40c6a1bc9cf6b5a86f66e562822a97f5a | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/dcb3846eb408c90abdbc1579ebbbdcb07620a539 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/e87fb4012f050a762cf5af8558fe82d1106fc5e2 | ORPH
   armeb     |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/85b171a786147728dfb76f10581ccf08b6ad2c71 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/afb6e7d0bf0bced13ff634843693106a595a585d |     
  sparc64    |          libsha1-0.3           | NOK | https://autobuild.buildroot.org/results/b63640a8009318192a7d03e6a74ed2b40439503e |     
   arceb     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/904f6e494c3df850db769b1f4e3ce220f0f73723 | ORPH
   mipsel    |        libtracefs-1.8.1        | NOK | https://autobuild.buildroot.org/results/3e46e227fdf994178b8ecfda06e5e90d5149e311 |     
   armeb     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/354b7cba084404b2f721c37460dff7bc91ff8a31 |     
  mips64el   |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/491c27f95bd827fc7a33f998e6c15773f3c85e6c | ORPH
  aarch64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/ed0a93a6532f649546e1d03ceae9184b043e9b7e | ORPH
    sh4      |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/a5ed601ed25bd57336c50283870a5e6e6f9246dc |     
   arceb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/4db7b079c41b595c983ffd0eb7b90558f81160f1 |     
   mips64    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/3f304ac516e80c50b11c04c041861f1e48a84bcf |     
microblazeel |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/2e492472bfa04ea0db60c3902ea2cf919a1d2953 |     
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/f017054572d874b76e83c880a7c4d04b33e68970 |     
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/a7de1e4e9ff580aaa06291fb17d3c00e10fd1486 |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/d7b2b16e2d02d85a5fa8055b97c48bc8916235be |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/12e2a52f4c4037909b46b4db2c610056ff5f14b4 |     
   mipsel    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/a6b9e4aa64877501e58b84134854bb07a19e3f90 |     
   sparc     |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/25172398043f3089001d5d3efcc327748c20a40b |     
   sparc     |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/4f8346c9f74fad397b5c0a54db37e06deeae9d61 |     
    mips     |      libzenoh-pico-1.0.1       | NOK | https://autobuild.buildroot.org/results/bc407e1061866bc6df3f666ba60da9b874e792ed |     
  mips64el   |      libzenoh-pico-1.0.1       | NOK | https://autobuild.buildroot.org/results/3fb2ae69680e25645c6117b07df894c93e43c827 |     
  mips64el   |      libzenoh-pico-1.0.1       | NOK | https://autobuild.buildroot.org/results/16d2e38b270d7c928f96a607a3a84f46297ebbf8 |     
   nios2     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/94862418df3f4555f23107a6de813d706ceba3e3 | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/40c995ea14d8259ba5fca063e14a1ded26483792 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f06e01f8843d94fcaebcd966a3d94185d3e5b5d7 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/c97e042f160cf1ff46612b87fe2133aab31dabaa | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/b9218f6128070ddba96ca1c264c9b78b819bcd6e | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/dfa499b4719c653c41d69d1af25ccbaa36941c57 | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/b25f26ca6cbf8af5ac601f041f82263de8ed33a0 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/eaf46b696617f56be4f19c9ef0c9984c9a8d4280 | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/33d1709aa7797fae717d310a4033ad1977f6f888 | ORPH
    mips     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/efa1c1bd0520b15e25bd3748c590792c543b2167 | ORPH
    mips     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/9bbf76658b8c66d577eda38d296efd7e87d1f6cb | ORPH
    arc      |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/d5a2382b8dee334f508c986f692aff356ac3a5ca | ORPH
    mips     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/9220c91845d99e79a47b144ee644068d0bd98f0d | ORPH
   mips64    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/f201a0f29305ad65226edb4df921f0f82f4b8043 | ORPH
  powerpc    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/5ee2292442b1019f370badf1f448a2385d614c81 | ORPH
   mips64    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/9e64c537b725020bdfbd3f08f62fc7e2de4538bf | ORPH
   mipsel    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/07a733e0feee7b58324085b8518b5cfa19e76241 | ORPH
    arc      |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/dc8b613eeafaf25e8e96006893febc84062ce9c3 | ORPH
  powerpc    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/d57079d4427e13f604ddb368f90f54dcbcc42165 | ORPH
   nios2     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/d594686250b3ef9c01efc609548d269d55d7a2ae | ORPH
    m68k     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/e4f7fb03b285f4f7774f180ed6a27a0035125b18 | ORPH
    arc      |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/91b0be83d34ca6d291aa023524dbb2cd23b79502 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/d389a6e4af98b6d57b7b878514f01f35ab6560ed | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/0ed86b9c00b7556c9cc5a8bb2fed556c5e380b52 | ORPH
   xtensa    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/2d0f379013f809b63282af006662c24fb0dc1c7d | ORPH
    arc      |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/2e24dc2d4eebdfbf0fbab1cbb385e6d43811a30d | ORPH
 powerpc64   |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/4f7d5673684ddbf22773f4a411600805131ecd6e | ORPH
 powerpc64   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/9c3fb344028ce746e9438c65542cacde2bfe5e78 | ORPH
  powerpc    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/6de8afdae5e049b39720c2546e266dd658d9812e | ORPH
    sh4a     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/4b85380be48231723c61303a14a75483480e4d08 | ORPH
   nios2     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/ecb5d5ae0abe9fabd26c03d5b5c8fd9469832d20 | ORPH
 powerpc64   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/2c348807fd967bf8e796cb67e4b972d42b18ae5f | ORPH
   sh4eb     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/8ea1c33c036c00d41f8260636bf9084932662047 | ORPH
 microblaze  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/37a75c3e7f1509c4b95ca646dd5453312c06fcb5 | ORPH
  aarch64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/3548216e10164f09e6dc10684155b6aab2aaf012 | ORPH
    or1k     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/98b89b9bee0204a306b078a4497a41bc0b49023a | ORPH
microblazeel |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/5e776b85463fd24e98e848cbd0feafc403bef1f2 | ORPH
   x86_64    |     ltp-testsuite-20240524     | NOK | https://autobuild.buildroot.org/results/be1f9cd21c474e41431e87b625202471553ef053 |     
 microblaze  |          lvm2-2.03.27          | NOK | https://autobuild.buildroot.org/results/b52169d11c84cf2745c223327b7d03821e074566 | ORPH
 microblaze  |          lvm2-2.03.27          | NOK | https://autobuild.buildroot.org/results/dc9e9593ea5c164cf0dfbbc190949ffc335994e9 | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/67c9835f9321d56fddaa9e9d78cb4b0d47c4495d | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/09e8b348dbf5be0f4dd8b3384dd592607cbf5363 | ORPH
    sh4      |         mdevd-0.1.6.4          | NOK | https://autobuild.buildroot.org/results/3018e42cbdf605b2b0c0fb80ac79a2c4756fb368 |     
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/0e43852cf8631d719ff574b4cc714fd03ead503f |     
 microblaze  |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/f10dd6e02930301ab6bc0929e035202052227f85 |     
   sh4eb     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/f3603b3699aca2646c7a90b0484f3cbee37ba442 |     
microblazeel |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/599d05656f31698334cc6fbccf213c7ac25066ac |     
 microblaze  |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/88b17f993e0eb87e3c8aa8f1dfd7f1e03b269fb4 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/7fa292a9ce803cbed6557314182db699dfea9f60 |     
 powerpc64   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/a414dba0591ad857d5bfa816adc67a070574f019 | ORPH
   sparc     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/276cb288a56c7094960ffa4c019e7a9686525b91 | ORPH
   s390x     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/0e2b33d4de41967b23876641b8c6dbdd5418a9de |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/8ef4e957a833821ed8f12f214949e7579a194002 |     
  powerpc    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9a6bcdb84d30ac0f5ef889935b46d1bffa0e3e83 |     
 microblaze  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/db63acf0cdb874caacf08f1cab4a590caf836e16 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/2da34b5cab7b0416a2cee949427e71737317503a |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f59d40164c6ec4d8ad23148a310fcd69dd04fc97 |     
   s390x     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/7076bc4b1b4bfb5ab8540e0b518d7f2232ba8293 |     
   nios2     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/951b77bbf45e6f0dcf831835bd345598fab4df5b | ORPH
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/510822de57285183d2b8801f1c6d03f8f3a09198 |     
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/c9d419a15c3b8a72e5bbafb7b424b2a16abbfdd5 | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/f8ab8277b761b831ab84ba930dde4968775903e3 | ORPH
    or1k     |           pcre-8.45            | NOK | https://autobuild.buildroot.org/results/2760eff00f597d4deb0a9b100a15e3b59d55fbca | ORPH
   mipsel    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/e04175b99ab25be98e4484bf3c96309a77785d83 |     
   arceb     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/36a4fa42201c29a3645a8d5f7839788388e3f585 |     
   s390x     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/3697312ff0b689acca6b06284423071e0b0b912f |     
   arceb     |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/3d2bd743c5628bde3ec2942ddf87416ac73ef1a6 |     
   sparc     |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/0576e621565007b410688ff96b4deda695e98b06 |     
  sparc64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/d2f8861889c4a7a1b5dc80472943d60c44b0e3f1 | ORPH
powerpc64le  |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/f645abf7cf77f274c6631e08fb0f6e8f2c58a09f | ORPH
    or1k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/dd062c6fb6bfc249299dd1f464941925fc612c69 | ORPH
 powerpc64   |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/d90f24f230a9ba6c232ef57409a0f3762d2a52bf | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/0edd65ad5991518aed4406a48ba5938091da898e | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/9477f14b393bdf236c0999a207c626e24244a22f | ORPH
    i686     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e81ae8b2e465f6f8a8b4c10d5cc155765d7564a1 | ORPH
microblazeel |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/283d96dc72b004287bb90991196e50b12e275607 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1d078902a5e0595e90c06499811c2e28c0124d8f | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/064ab8167788c1308361bd2fcde008dfe8789b5b | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b1efc9d7c6e1cf69ebc319f5211f1e7ea5ee8d4e | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/7cfc0f909e962b819bee5601205aba7772e29128 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/8be41600a6f79b1e8abb7b7d4f054c53d80ade91 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a7d8433b1894aca97a81761365ef8d1fea8c58a6 | ORPH
   arceb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b9ffcde9fe4e0c6565fb4d7c06164b11409ae003 | ORPH
    arm      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/72051a6eefd599d458b2ae5f2fadbddd3a1230ff | ORPH
    sh4      |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/702619e280d76cc17ef2b1b1c5b6b3acbd8ca69e |     
    arm      |          quagga-1.2.4          | NOK | https://autobuild.buildroot.org/results/ce74a68e2103b52d08c3f1034ef78269e5502598 | ORPH
   s390x     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/5d322cb5d248e21214dad7d3aae22258b8daf58a | ORPH
   nios2     |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/a6497a0beddfb4495b1023d8e33cc06e69b01813 | ORPH
microblazeel |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/93b815a9b12de742f0f31f80589d7a60874c747e |     
   nios2     |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/6cd68de54db90b2fc14376b7d99c130316a0b6a6 | ORPH
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/04f2fb9446346844763916eefa20a52333beaf29 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/f475c44c941bf241012e1f6b0616c3af45eb93ec |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/027efedfba2c158d94be782408b030b45081182f |     
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/aee06203834687e83a7868867e7acfb132f90b0a | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/29c870cbfae1df9e32c90684204b380a73e980aa | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/273e2cf09815894048aff6bc476f0b0266032d2d | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/aa768a274aac8643719ece7e1a73df9cb4a9b04e | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ea5a44e8512dce4f689514e77557642910327565 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/3daf35e10ecdc53500e38deacb85a4d7ba48a074 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ba46dadb9e86cf907509630d538942fa6d8540d2 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/6b2819e67f5f543c185b37c0784389028abab4d6 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/453b1bb23fd229ada4382567bbc1588f095ed647 | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b045652d04d4d6a199b9631dbc4ce455b024af80 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/9c38c38a9e448339a1d24aeffbbdc769ed574e99 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ca45e936b0a2b22ff72a09f0f43caa012715e639 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5ecbea5dd5de5e8cbd0ac47db170d0d9de8568f8 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/bd43dad2b87e2a81688935cd32848eaaf22c48c1 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/85e9d6cbe3e4a4c75c18fd63e7fd15c3b85942d0 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5717ee044c004979069a6d003a107703e37c49ef | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/4202ddd2366418f103334e8f93a24e7f765d0503 | ORPH
  mips64el   |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/d353c20019595185831b0ce8982f2525e9520b1e | ORPH
    arc      |          whois-5.5.14          | NOK | https://autobuild.buildroot.org/results/77d2819ce0171977c60ff8e70e6b7d5bb615be28 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

        host-python-lxml-5.1.0 | 1 
                  linux-6.6.58 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |     host-python-lxml-5.1.0     | NOK | https://autobuild.buildroot.org/results/96d975ff870f89984f0ca1027e3eafda912e43a5 |     
   mips64    |          linux-6.6.58          | NOK | https://autobuild.buildroot.org/results/4d4e0dcd68b2964bce26e760e9d15be4ff649e22 | ORPH


Classification of failures by reason for 2024.08.x
--------------------------------------------------

         python-remi-2022.7.27 | 2 
                gnu-efi-3.0.18 | 1 
                    ncmpc-0.49 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/bd50e86dff86a9be95837dd524f040c9e1d79d40 |     
    i686     |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/69c537d2514b8a3c0e855dd4dd47bdab0e0a6f40 |     
  powerpc    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/e3a47378f5af87141205a238410d8527af551190 |     
 aarch64_be  |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/219ab67b325d27b543bdb5a5293f7d3bba33a2f9 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
