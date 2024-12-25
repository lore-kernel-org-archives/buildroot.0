Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3C3E7718B
	for <buildroot@archiver.kernel.org>; Wed, 25 Dec 2024 04:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D49A8126A;
	Wed, 25 Dec 2024 04:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvpp69UtWC-3; Wed, 25 Dec 2024 04:14:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62DA08121E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62DA08121E;
	Wed, 25 Dec 2024 04:14:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7300AE0
 for <buildroot@buildroot.org>; Wed, 25 Dec 2024 04:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67590410D2
 for <buildroot@buildroot.org>; Wed, 25 Dec 2024 04:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AURFeR0wSI2b for <buildroot@buildroot.org>;
 Wed, 25 Dec 2024 04:14:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0374410B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0374410B7
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0374410B7
 for <buildroot@buildroot.org>; Wed, 25 Dec 2024 04:14:47 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so200000966b.2
 for <buildroot@buildroot.org>; Tue, 24 Dec 2024 20:14:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735100086; x=1735704886;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TbMRyEV4Li+iZwx/1BcVeUXtzSxW4zP4JeqAC4vI1/Y=;
 b=te2axcABxez8CQnwiShHGtGh04xI4n55teErCgayQqD9tJ2YZQ813gBbVue2wSkrtc
 GfxDSLVG0ssPAmvt2fzhNesjWVXoARPBzdb9Ecsin2hbH8hWco0KX2ZxWNiIjD5jlb2N
 TCto1PGv0QcaN/8Qr05RbsIQN+fmPyeNojL55W6GOH66bYSCmNNtYL7jQP3R0V53T8/K
 u3JHaRl+9sYgB9/M/tpP3vOcKXie8TJmwYWZkycS1Wdrt5Rtznclq/f/BBKMOuTmZ7aW
 03HS9qTD7/HWy5QTc0hllzQxFY855o4qVDTREKOV+oWVe0Edw7VEvT5eDRyBiATsKafP
 22EQ==
X-Gm-Message-State: AOJu0YwjmOAGn6TtjgAgAtbLEmioBEOdOfQcX3UlQYVmLVYtwDvU2XOn
 qJ6wilpHzk6srp2/tTTbXJ+jLKpPTQu8N7xoLFEVE1C+qJqz3WIzaRawVg==
X-Gm-Gg: ASbGncu4BGdSsns51gdDPKr4ZsyWxDZ4CUzbP/zkhT14+JeJJ8DTRWa4jG3wGf9nuYH
 Vrc4K1gO7XDhw56obLFxXL0AW+b5LwTjv1EUKISLKHuOp+vNdYORGYH/zdF3fs/o2DkVvSeK05n
 D0UiOvxcQiEYrc2Ru83sTT7h2Wi3FjxhG1u+vYkGpL98P/gyq7J0ZZhzMBpZ00dkWhZC0r/uAzU
 J86RbOp1jGE0C3aDjbUjMr8dL9weq+wiU1ZrPCCvoRjHJd/C0ct5u59Kvac
X-Google-Smtp-Source: AGHT+IF6uRSVK50G+dz1X6zh9JcgoAG56d0feSFVLUEuWyk5uaPlR9NwFRi4arXAZIHEZfM3NXJ02Q==
X-Received: by 2002:a17:906:478f:b0:aa6:6c46:7ca1 with SMTP id
 a640c23a62f3a-aac27038e93mr1694472466b.10.1735100085510; 
 Tue, 24 Dec 2024 20:14:45 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe494dsm748883566b.101.2024.12.24.20.14.44
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 20:14:45 -0800 (PST)
Message-ID: <676b86b5.170a0220.1f9901.937d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 25 Dec 2024 04:14:44 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735100086; x=1735704886; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=TbMRyEV4Li+iZwx/1BcVeUXtzSxW4zP4JeqAC4vI1/Y=;
 b=CJZ5UlEb/E6yCZLIk2zZLP7uyWUEHFxXbtmYSuoqsTGCWhONDYHVN6Av3kb/9rI+jf
 qY8e0shJ7X1hBHIOujb5ESeRqWq+MpVJYpTTnjuuQ+fvW1bZEC3MlmDls4TwJNBUN/1O
 LXnWrqR4XF3wL+Onvg9MSnXs4ZfIc08slOmESK3tUyhICx5d4BZdFisiu49/lwdTfTDZ
 xxQHInGjJ7u5qK1pxaKEXhkegDzAc9QDVV/uYMCmhZ4QvJyMucIZXwDltBaYfK7O3uwW
 nhb7RUq4EY2FcnHn9ehL06PrqJbn5KliQgxDJ83mRRHa+7BhN9u3zv4XuO1gZHDxHPwW
 /N/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CJZ5UlEb
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-24
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

Autobuild statistics for 2024-12-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  4  |  0  |  8  |
  2024.11.x  |  1  |  4  |  0  |  5  |
    master   | 27  | 114 |  0  | 141 |

Classification of failures by reason for master
-----------------------------------------------

               postgresql-17.2 | 10
             util-linux-2.40.2 | 10
                  linux-6.12.5 | 6 
  gobject-introspection-1.76.1 | 5 
             batman-adv-2024.2 | 3 
                   foot-1.16.2 | 3 
            host-binutils-2.42 | 3 
    host-python-greenlet-3.1.1 | 3 
                  liburing-2.6 | 3 
                   perl-5.40.0 | 3 
                   bullet-3.25 | 2 
         host-libxcrypt-4.4.36 | 2 
httping-0e26c53d5fe504eb720... | 2 
                  libnss-3.107 | 2 
              libopenssl-3.4.0 | 2 
           libzenoh-pico-1.0.4 | 2 
               linux-pam-1.6.1 | 2 
                       unknown | 2 
               valgrind-3.23.0 | 2 
                 agentpp-4.6.1 | 1 
           at-spi2-core-2.50.0 | 1 
                    azmq-1.0.3 | 1 
                   botan-3.5.0 | 1 
                 c-ares-1.34.2 | 1 
                  cairo-1.18.2 | 1 
             containerd-1.7.23 | 1 
                   crun-1.18.2 | 1 
                  curlpp-0.8.1 | 1 
                     daq-2.0.7 | 1 
        edk2-edk2-stable202405 | 1 
                elfutils-0.189 | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
firmware-utils-86739f2b3ae9... | 1 
            gettext-gnu-0.22.4 | 1 
                  gnutls-3.8.8 | 1 
                 hddtemp-0.4.3 | 1 
         host-gcc-final-12.4.0 | 1 
   host-mender-artifact-3.11.2 | 1 
 host-softether-4.30-9700-beta | 1 
                  iozone-3.506 | 1 
                  jack2-1.9.22 | 1 
                latencytop-0.5 | 1 
                   libcap-2.73 | 1 
                libdrm-2.4.124 | 1 
                libesmtp-1.1.0 | 1 
           libfreeimage-3.18.0 | 1 
                  libsepol-3.7 | 1 
                  libva-2.22.0 | 1 
                   mimic-1.1.0 | 1 
                    mpir-3.0.0 | 1 
            netstat-nat-1.4.10 | 1 
               openblas-0.3.28 | 1 
                 opensc-0.26.0 | 1 
                 openssh-9.9p1 | 1 
               pcsc-lite-2.1.0 | 1 
                 pixman-0.42.2 | 1 
               procps-ng-4.0.4 | 1 
         python-remi-2022.7.27 | 1 
                    qemu-9.1.0 | 1 
                  ramsmp-3.5.0 | 1 
                ramspeed-2.6.0 | 1 
        s6-linux-utils-2.6.2.0 | 1 
        util-linux-libs-2.40.2 | 1 
               wireshark-4.2.9 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/b6aeb28ab31479119e261789a4bf5d85a2903f17 |     
microblazeel |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/db7e32f6dbd4ae9499147e8a37002e99c11d9a5f |     
    mips     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/8571864d150c5e71e0396517167ce0ca18e0fad6 |     
   armeb     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/18754d6aa7ffc3497d65d173e667a94f93e714f8 |     
  riscv64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/18259a91212db96fa9be3d64a44a88f0602ce465 |     
   mips64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/7f9bb6c17a84a4b20bef36975d1c77da139c20c8 |     
   x86_64    |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/6dee4bbaa15ac9770631dc2eed439bb1ef3294b1 | ORPH
 powerpc64   |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/6b51114206898526f3b4de75270905ea9884c6c0 |     
   arceb     |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/6fb9c2054e2020a6ee1ba42dd7c81078eb316666 |     
    or1k     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/c2b0a067ff08e530b6e602da42fd36aef57b14ff | ORPH
microblazeel |          cairo-1.18.2          | NOK | https://autobuild.buildroot.org/results/eb78535c042c83dc29386ae70e57687285dac1bb |     
  riscv64    |       containerd-1.7.23        | NOK | https://autobuild.buildroot.org/results/2c9de2d4014523a626c5b42c119f0843431ef9a2 |     
   x86_64    |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/9c2812c5de197b4cc171311c24d3cad814d73fda |     
   nios2     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/98b255f9098217665eb5cd2e1fd4eb9874757301 |     
powerpc64le  |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/051ea315ffa9a19f05081919b65bd41bbcafdb64 |     
  aarch64    |     edk2-edk2-stable202405     | NOK | https://autobuild.buildroot.org/results/aefd828d02d9c3caeac20252cac4a06c8fd84d15 |     
  powerpc    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/c1b710ffb14406e39221b6f9d7d0ba3cbfdf3206 | ORPH
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/be09f80dd938936a327d39105c6da32cdb8e6f33 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/73a9ce4eeb2d03636fbf4fe264ab3cc4efa3e1f5 | ORPH
   sh4aeb    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/21058ced69ff902434c47d3acf0cbd65930f1263 |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/33e4ba89705f7fef354dd46faca6635589dc2127 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/2298b32732ff66dbec3cc05cc1eac102c5387f91 |     
   mips64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/2418b2e209532c39ad7dca3f6c5abcf6de7910e9 |     
 aarch64_be  |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/d0284b6a5feb96954a18c05a71f8c0a72d251d9f | ORPH
   arceb     |          gnutls-3.8.8          | NOK | https://autobuild.buildroot.org/results/8eab0e413d8d55582756077b37a06c12d4e1450e | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/81a56091754a6f689a308cde0de2b09af2ffe155 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/cc4a6414c7e4eaabcf8a05d8c37a8f796c22aba5 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/1ae20f42c78c6e56922111ef19e92e426d3c3cc8 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/0f8ab3789e27d8adb6e085ce2aca95147c6b4eca | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/8bcd27f65b1c14cbf5608b40cbca30324569a879 | ORPH
  sparc64    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/760b933ea7867d6a5956898294730635467d1f1b |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/1c832cba8bd9c83866a99fbc9ae7889934f0807b |     
  powerpc    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/297d4ede0e5f5b69ec0bb1a1c08e0f5b946c7922 |     
   sparc     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/0ba9e1e280f8c9ff0ab466fa7e4327b13e1043fd |     
   arceb     |     host-gcc-final-12.4.0      | NOK | https://autobuild.buildroot.org/results/4588d96ed159e346e38d035a31f77de41d12a7fa |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/04f14ac3f2d48f32f05eccfa936f6b3db81388e8 |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/5a09a8f3655566d4aca7460b56cdf1e9f575bbb4 |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/1d875fe2d4ec6ff961894e4a12c25bd37c4c3534 |     
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/84d1d7fe39ac02fc25fd726abb9a51b393e584fa |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/4fdd87eceb5fe27024214e9438a715f8062372ba |     
   nios2     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/edd06410e288e256b92ca66da4458ea2a2701e65 |     
  mips64el   | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/a61d2764492d27d1e067aa59c392249fc622a4fc | ORPH
 aarch64_be  | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/489f10dff8cca940b813d707c7e705b5fb39b490 |     
   mipsel    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/17abf5041da196cda7ec244e5b65f52f2ac375a2 |     
    i686     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/2648436e0442cf08424200594a43bdf18302db02 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/5646c4d1dde42936c295c71af8176938eb86232e |     
  powerpc    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/7fe4556a6678e7a3c5df801d94cad2d10dc90231 | ORPH
microblazeel |          libcap-2.73           | NOK | https://autobuild.buildroot.org/results/bdab0840bd164faef4566cff998835f375ab16cc |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/43dc6f84241ed56cbb1c070517ea680261359387 |     
   mipsel    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/3db0554d8792f6763b3552ca07b5d2abb7b1ad91 | ORPH
   x86_64    |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/02d025500505fd0cbd25ec287b334401a25176c5 |     
   s390x     |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/51975a8cba9b8e7ef6dd04f937618736580f7b2e |     
  aarch64    |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/3e115974a5d4c361a71d29287e689ff3ba8e80e8 |     
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/cac540d862138def3cd02332a6f27841cc35f073 | ORPH
  riscv32    |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/9debc8f32638f69d9aa17e37059e4ff37097798f | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/e0c076291452d85d0ff4f099f0641132cbfb5da4 |     
 aarch64_be  |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/e5b4da2510b63b8078bef79d62a61c8f33dffa76 |     
  sparc64    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/d90aaf18d2752d85442a83ff21511ba15ab394df |     
   mips64    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/cf1d435f9f25426431d0b84bf20f98805c05b083 |     
   arceb     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/982eca87f04341e35fbd1d121eb682491a606c2f |     
   x86_64    |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/7da3ac698a1b91ab66d1505c99832a0b65f69a4b |     
   s390x     |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/d260e5ef4f71963ad9ea1faaf43db8f67ed4e1cb |     
   nios2     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/c6a49d55813d119e003c1a22cd9b137026d46392 | ORPH
   nios2     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/5a0a99c4df9ee3fa69f864232cd757a8e2c3f0c3 | ORPH
  powerpc    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/2bdd24da26e802750878b6d5cd5a15f3c1d93559 | ORPH
    m68k     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/a074a9fd1c2a83914b5c5e61b4ba7bd396917551 | ORPH
   nios2     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/b6f5775525890dc27072a19ce04aa2e02c5632f1 | ORPH
    m68k     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/4b4fb5ebe2e7b693266512f0ecd6ba1ea216d3dd | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/634e5f369c8ff40ece03eef596d167869338bf29 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/696f09b232c0a0b08ab832d7b04c258175f126fd | ORPH
    or1k     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/9bcfaba5cd2acf2467eb5e68b29af588a3a2a448 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/befa5bd187669de390ae6baeb52d67f29b3d5fea |     
 powerpc64   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/c75e38d9db4bd1255c37d6f4b1306f36becb1a6c | ORPH
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/68956263455eaaed5e3b919adbe920af8a3dc195 |     
   mipsel    |         opensc-0.26.0          | NOK | https://autobuild.buildroot.org/results/819ea66f73668d814ddf6fc75004d3c190631919 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/650359f7ad2bca63b84e5f53b82177233a49ae91 | ORPH
microblazeel |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/c7525d8ff6bf3a48c011af98ccbc2c9444b36bf8 | ORPH
    i586     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/08de02c6f1ada0a78f0b7f540574c96c299d0b6a |     
   sparc     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/1edf1ee1336fe07ca5c953e5b1f6d9134827e85a |     
   sparc     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/333735a20e2f81dd9c649048f27a706a24d2f969 |     
powerpc64le  |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/aaa576062165577d34f90dbceb3ea2b41858ad67 | ORPH
  aarch64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/f19b9e3b85034ab888ed2badc95a3ae599eb9b8a |     
  aarch64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/8d07ae0492f383566878d871b8502fa4760284b1 |     
    m68k     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/879a94a68f741228659a3558d42f1ed4e306f7f0 |     
   mips64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/7c55b0a6dcf3c01f8c73454c1c409bf3fe8e9f6a |     
 aarch64_be  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/8a920e6d6ecfd60b4503fb4d9341959f53541c92 |     
   armeb     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/48080df58529c66a90c7bc0dbc32bf8bf68b561e |     
   nios2     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/a38d258054ef86c92a2349584b202ec5d858940b |     
powerpc64le  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/9338a22da5f66de8bb99de5394cba0a9d0519602 |     
   nios2     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/4f7625a1e6910a01ca0a934220ff92b27f77c9ce |     
   s390x     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/92fe2defc871bd1175f7cb397f914cbce7c299b8 |     
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/38ae2d44780920e86c461de9dfb953c9b784516c | ORPH
   nios2     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/72fce05bbe2dd19421d754ea362b449e8b476580 |     
  riscv32    |           qemu-9.1.0           | NOK | https://autobuild.buildroot.org/results/e934f3988392f0c12faf0ba21d903ec83ccc480e |     
   sparc     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/3ceb31193a953d86eb19628e1dd85610d54119ee |     
 powerpc64   |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/8310d6d5fa8581109ed4f6fd84b3be46f66ec8db | ORPH
   mips64    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/661ed2f15bd6d3eaea3cdaae8e7d71ae203b56fe |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/26e0c2908266a8e30e2604c71a410a65e1f5618b |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/352dda17ac4a2144cef77d801294bb5e945cb041 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/f2239a312338f18a62c25b6336f0b492b3557825 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a5e7e5592f7b4c7bf1ffe5cdb9cbf7829870d05d | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/48fe6e55880bc51ddae42c4d73e0ca1d516132a8 | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/48173bd3c4b37224322b33653a48932c45d8a867 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/48b7f06a8d06e9dcde14ebe39e094507f2652d9f | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/306ea7cd34132cc6172220c85ba42803d12d70b8 | ORPH
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/63b60911d8995c836ba1ef742f17ce2d76db77c1 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8d3db9eed95534bedd382982eb0075840a28cf62 | ORPH
  aarch64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/547ee1a19e913d52c2a4e6a3eef4ea5eed552d1a | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ebc21decef0fd26c33ad343106455dfefaf33bab | ORPH
   mips64    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/22220be55def6d88ba05853e5a5b550e3a4bc6ca | ORPH
    i686     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/af195447aef729091b659ab69015e8f6e2f52630 | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/eeb3552bb9cd99fd35efc52fc8cc04d4382f1dc7 | ORPH
   mipsel    |        wireshark-4.2.9         | NOK | https://autobuild.buildroot.org/results/164dbb47bbdaaa4814f124656fbe8fe62ab6385a | ORPH
    arm      |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/14c26966eac0184376e6c5785266d953ad7fc52c |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  curlpp-0.8.1 | 1 
host-prelink-cross-a853a5d7... | 1 
                  iozone-3.493 | 1 
           python-bcrypt-4.0.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/4a24d5fdca665dc709b502ae25e0e4e3d87be3b9 |     
    i686     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/618b1eeb422092673444aaadd138de946716bc59 | ORPH
    m68k     |          iozone-3.493          | NOK | https://autobuild.buildroot.org/results/2033806e1cafbeffe2734118d4b34712efbb2617 |     
  powerpc    |      python-bcrypt-4.0.1       | NOK | https://autobuild.buildroot.org/results/808c3a627984b1641e63fcd63942ce701769f712 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 1 
           libzenoh-pico-1.0.2 | 1 
                 openssh-9.9p1 | 1 
                   perl-5.40.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/b283317ea656e22bcd19d63e4b1eb9412203b449 | ORPH
   x86_64    |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/0965d54d5a1b797dbf4d926f122bf6ef5d67fc07 |     
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/388654101e6a7974398d02af986ff890423b6ea3 | ORPH
powerpc64le  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/9cd23863be837b514736fd0307052048006cb875 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
