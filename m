Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F6DC021B8
	for <buildroot@archiver.kernel.org>; Tue,  4 Mar 2025 04:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05F2B605A3;
	Tue,  4 Mar 2025 04:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UHAS5JlWP7lH; Tue,  4 Mar 2025 04:15:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7587A605EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7587A605EF;
	Tue,  4 Mar 2025 04:15:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 59F28C5
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 04:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 487E7405C9
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 04:15:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MlnVhW3sqLJ for <buildroot@buildroot.org>;
 Tue,  4 Mar 2025 04:15:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D813404AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D813404AF
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D813404AF
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 04:15:03 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-abf45d8db04so460657366b.1
 for <buildroot@buildroot.org>; Mon, 03 Mar 2025 20:15:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741061701; x=1741666501;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ijDOMyWOMymDo6XwNsSUIzkBv8LodImG4/WC3fXeKiE=;
 b=Y8H2PDwc+LI3cfr6oCCUB2CEYGWyPkbEv+6CF0brctMtisRomxOHZzF5kwsUp2jTBK
 vCxRiHme+ksPJPESCylooVAWwBrF6fIy6i6ewbV8QvDUtsJlYd7zSPBC0ZyomAVi1YUV
 5YPQRrZF2IoBwZZhs0LK1JR7aSz/c8TDdRq5RdFdiPtZSrLYblQuklR3xOmtmAowJV9J
 L5Ilg7weEFG2iJan0Zh4YtiOjhcSANwUYF0680vFx5MWd5n8vKphT8bxtCAwEOZDJ4gp
 tBVqZ1tBcQtw2dn752a8ODHkpIckLjSTzWasluxpTOITXUwVwf7WjJ+heKb2KbIB9lJ0
 KTug==
X-Gm-Message-State: AOJu0Yx07N7Lhqwy6lG99yA2QrIJ2HNgaxqBJ1KGdRHZvni2ojHvOFr8
 tSZrMET1gTc1evRjwgyYeezPlHMAofC84E1kxyZWkoVmBv7n9sqLcMiyyA==
X-Gm-Gg: ASbGncsTjTbhrFOrv1K+NfPln7HCfrTh0dAW5BVVOOHVsQ9YPRkgiOKhFdlqFvx4EYO
 ElVsK0tPpwZeroilqCz/B3ypiBzeRZlKG05UCPiz5zGkxWCN/3HCSCg0T8/oA02dxxPCEqGpJKN
 LIrOwR8EgYrUAZyLr8Z2Y1VlxeYwwH+CL2iJa2FHuGoMjZyBUMk1yWxgsG5fW0oNK0yi8Lmgwwl
 GKjrfskBlqR2aW2UYehlkFTqOCRS5CiYIb084EJh9lUDupXEF6PcCxPLkEn+/OZEVpeozVrcyka
 W0xqImcOMH63Op/ObtJoycPkgokjYWw+yRS4+nWNXdtf8Plt
X-Google-Smtp-Source: AGHT+IEVzkRVVXTv2vBWzfu9Rcole43BEFVb3vLl0w6C7qcRxg7xJ9KfovkLtqxghx0jTMYSsKaxQA==
X-Received: by 2002:a17:906:6a17:b0:ac1:d878:f877 with SMTP id
 a640c23a62f3a-ac1d878fb5bmr483888666b.49.1741061701054; 
 Mon, 03 Mar 2025 20:15:01 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf6cc43d00sm367384066b.85.2025.03.03.20.15.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 20:15:00 -0800 (PST)
Message-ID: <67c67e44.170a0220.1b6953.bb74@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 04 Mar 2025 04:15:00 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741061701; x=1741666501; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ijDOMyWOMymDo6XwNsSUIzkBv8LodImG4/WC3fXeKiE=;
 b=bPCercNXhd6i0X/bDXtHBli2KXMJV9W/Yx9xEjUtllKEekOHdMEJokEi7o5xwd8vWD
 9cpwNUi4xD+OJcL6Jr8GWx/ll46mvwrKSihpenxr46dewwBaodUnvAEUiiIPk7TkyFd1
 yFlNMcx/kltmTl9lq530+MdC4HAfTflqewWrwR6Uobh65j0xM+X1R2iWM9FO1sQj8HJI
 ekH/gfUNuM90MNMrLg017Xs6eR3fyNPX2M4/nrLDUlxegDqzbgBGgMcB/I8yqT32Dsb/
 JMnCKK6WnYRW9qwdHiy8av4OcpJ2wLjLJI3YEeTTvwYOnw2Hp+6v+xeic1H65VfT+tfv
 XF7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bPCercNX
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-03
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

Autobuild statistics for 2025-03-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  7  |  0  |  8  |
  2024.11.x  |  2  |  4  |  0  |  6  |
    master   | 14  | 65  |  0  | 79  |

Classification of failures by reason for master
-----------------------------------------------

    host-python-greenlet-3.1.1 | 6 
                   linux-tools | 5 
                elfutils-0.192 | 3 
                 linux-6.12.17 | 3 
                       unknown | 3 
                   cvs-1.12.13 | 2 
                  ffmpeg-6.1.2 | 2 
                 libcdio-2.2.0 | 2 
                  libsepol-3.7 | 2 
               openblas-0.3.29 | 2 
           at-spi2-core-2.50.0 | 1 
                    azmq-1.0.3 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                 c-ares-1.34.2 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                   duma-2.5.21 | 1 
                freerdp-2.11.7 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
                   fwupd-2.0.4 | 1 
                    gcr-3.40.0 | 1 
                 gerbera-2.4.1 | 1 
           ghostscript-10.04.0 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
                 host-gdb-16.1 | 1 
                 libcddb-1.3.2 | 1 
                  libnss-3.108 | 1 
                libsoup3-3.6.1 | 1 
            libtomcrypt-1.18.2 | 1 
                  libva-2.22.0 | 1 
          linux-5.10.162-cip24 | 1 
             lirc-tools-0.10.2 | 1 
        ltp-testsuite-20250130 | 1 
             matchbox-lib-1.12 | 1 
                     mtd-2.2.1 | 1 
            netstat-nat-1.4.10 | 1 
                  nginx-1.26.3 | 1 
                 openssh-9.9p2 | 1 
             parsec-tool-0.7.0 | 1 
                   perl-5.40.1 | 1 
          pkcs11-helper-1.30.0 | 1 
               procps-ng-4.0.5 | 1 
pthreadpool-560c60d342a7607... | 1 
        python-selenium-4.27.1 | 1 
        util-linux-libs-2.40.2 | 1 
wilc-driver-linux4microchip... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/01a68caf606d408416b305205afd571436f84bf0 |     
 microblaze  |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/aafc6a85f04895039fa4cb774198bac8a9faf167 |     
   mips64    |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/31a78013b5c8fc932996c4638991cbda25647570 |     
   arceb     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/3e2f2686c622349d24d82266c62818a86a436e92 | ORPH
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/c475763122d5209c9c1bff80c0f1df2d4af7bf40 | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2e2c4b15fab4056a029deeefeb8388aba2ac509a | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/983a2f2e259c15f25d62b8356e4f29a2ad764db3 | ORPH
   mipsel    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/bf2770030690958a1c88cade3bce695989897db1 | ORPH
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/8d1a941d243a27afbea374ca7078a83658946ba4 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f12235396d3b0e66b28bf92233381c0ddf7a8d04 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/95a95273db4e35cab5e7567930d9e85dc7ba3076 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/b5bcc00f7585fa70aeb019bd6a4171f4d6633509 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/c03aab6cc0461073a6703f66876ccc9ed3607342 |     
   mipsel    |         freerdp-2.11.7         | NOK | https://autobuild.buildroot.org/results/ba0beae13e1be2573878ee50b1566f4427b269a3 | ORPH
    sh4      | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/a21895466fa498cc56880b13ceab3f86e6b3ece9 |     
  riscv64    |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/40ba79100e3997d2b4c05ff5078a7317eb3e1f20 |     
  mips64el   |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/1db9afc96ff3da224740b98c151f7d8abb162eb6 | ORPH
microblazeel |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/5b30e287eb2c06b33e07d826b1c4a6dea631a08b |     
   sparc     |      ghostscript-10.04.0       | NOK | https://autobuild.buildroot.org/results/b7cd1f16d3572152d40f6e80453998d4363fddeb |     
  riscv64    | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/cd0bcb008711aa8d2f0f0043e03d8cbd869ed67a |     
   s390x     |         host-gdb-16.1          | NOK | https://autobuild.buildroot.org/results/68c008671276fb36f72c8c71f9033f68b4803a86 | ORPH
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/d3b34d3cebf09c81dbc8abe9a6b0382aa98571b6 |     
  riscv32    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/34f18620bb0bd82008d7b69f4b0f07650be76919 |     
 microblaze  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/9851720b98dc8d246b8220f04a21ed01fc2e7844 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/5af909f54eec60d567313f3d8798d8dfe6163a08 |     
    arm      |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/df57ac3f301faa46053e7cc0106d4ebfacdd5a1c |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/7bac2681555920a69585504ad6b3e2118afbbd2a |     
  sparc64    |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/bcc8046f10c653ddb0fc69fcbf6d92766b38e9ec |     
  powerpc    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/1bf842ba7ce0c6d41ef4761cccd3c97e9f88b678 |     
   armeb     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/bc930934da04f5db7367ec6e16727bedc81b5d29 |     
  mips64el   |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/2d143b2e9fc7f446fd9826aed4ccce949ec96384 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/6e06165b2f9bad830c913282ffc299b48a1231a1 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/e5f04b7770de99f100465ba4b49d752ad118c3e7 |     
    or1k     |         libsoup3-3.6.1         | NOK | https://autobuild.buildroot.org/results/e927ef8b901cf1d8e199c0cceffcfc210526912d |     
 aarch64_be  |       libtomcrypt-1.18.2       | NOK | https://autobuild.buildroot.org/results/de23fd8a907a860f98f9ef54e5faa5ee216543f6 |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/c5185835d76c1ba2278ca9e8ff43b4a5db20f4ce |     
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/aa7ea8dbbb10cfbedce4f64b38a5c08f5b4af259 | ORPH
   sh4aeb    |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/5a3ee6429a7d3685ccdbc0d84da65adf780e1824 | ORPH
   x86_64    |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/9644dc451f598eece7b61c82b3911130e9a26e4c | ORPH
    m68k     |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/1b0a579de3645830d45ea99b416258103569fcde | ORPH
    arc      |          linux-tools           | NOK | https://autobuild.buildroot.org/results/8fa4a014a40f7e776b2d06b51b9c123a9c40cf46 | ORPH
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/cd5e880575cb5518d8dd98f4e097584b512c7eff | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/757d42da572d0b355d65ec5c08a88396d8e4f973 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/63887e17a4c444f3a06fc27e92470dcac0c5fb80 | ORPH
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/18967973be2752cfda168583da65636a50f07c93 | ORPH
   mips64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/77b682617d46ff8006f9c4b3e5306000a4c991f4 | ORPH
    mips     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/268eef8da695402430b8318816af3a11d49d9090 |     
    i686     |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/3006b56359d99bce49e284e0cc3b5ce3c1658be5 | ORPH
    arm      |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/f7aa95436c30cc4c4489ac8194ffea5d01467850 |     
   mips64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/358421f245652a9f2fd234a350fc97d3a14ff025 | ORPH
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/9a0ab2f0f02328c9bb97949a89e778688d3ca564 | ORPH
  mips64el   |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/70c3afc7498f306292a6b4fa981ed9213ff450b7 |     
  mips64el   |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/5dbf1365f830fe709bcf9a8c2775eb44bb831ad8 |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/e0e126d941f8ae7f9a5d0973aeeaf989191edce2 | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/cde9ebc72fc91bb56d198d3656a1a715bb15d152 |     
    arc      |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/16611f7b36c1e6a49a6e21a51f8f085b711faea6 |     
  mips64el   |      pkcs11-helper-1.30.0      | NOK | https://autobuild.buildroot.org/results/381fc5bf241b85cc800ad39adda7c322d6529b99 | ORPH
    arc      |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/5fb079327da03eafecb9198b4ad9f61cb618a6bc | ORPH
    arm      | pthreadpool-560c60d342a7607... | NOK | https://autobuild.buildroot.org/results/d44c1b88a48fe3dc857e79b17c4b96e0c9497a8a |     
  sparc64    |     python-selenium-4.27.1     | NOK | https://autobuild.buildroot.org/results/678f69b134394d59f865c55f0efb562015599382 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/23353ec9949537bc16cc1972136884e166d845ec |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/6fa779a643b08629a710f77b2d0afadfc6e8f65f |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/0c04e4172f4bfdc8e001c5835bf954cbc384e843 |     
   armeb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/e9686d0212b48c78aec2399ac174b26d2bc8e70c | ORPH
   mips64    | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/d6c2016e312efd6583dfa22e50f9bb43456b872c |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   foot-1.16.2 | 2 
host-vboot-utils-bbdd62f9b0... | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.6.79 | 1 
          python-orjson-3.9.10 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/5942b9bfa7024a7ea3eaddb32cda90aed1fda558 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/eea84873975eb5e74cf229be476a440922d78851 |     
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | https://autobuild.buildroot.org/results/2ce05c726b7ff296bf06d7d8797a32c2e7cf19c2 |     
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/dae76eb8a587f39e93a44ebef5cf3541c73d422a | ORPH
 powerpc64   |          linux-6.6.79          | NOK | https://autobuild.buildroot.org/results/037d3935fbd0420ab0af57a0bce98f881c731750 | ORPH
  aarch64    |      python-orjson-3.9.10      | NOK | https://autobuild.buildroot.org/results/b79047f2826eed89881e0b173a39e1479bcab5a4 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/ca154c62ed3b454ff414e99038aabaeeba0c309c |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                     ace-7.1.1 | 1 
                 openmpi-4.1.5 | 1 
                   s6-2.13.0.0 | 1 
                       unknown | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/5f17fe78b518ff0b985d0ebca56af47314fadc04 | ORPH
    m68k     |         openmpi-4.1.5          | NOK | https://autobuild.buildroot.org/results/4293d4358d8d325829f70b037d2eb71419f58144 |     
   sparc     |          s6-2.13.0.0           | NOK | https://autobuild.buildroot.org/results/9c11798d7360290ccbe0b7c2686b90d14ade8a40 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/b39f243f057f0953e66dc823b088cc83f3a1757b |     


Gitlab CI results for 2025-03-03
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9298525418  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9298510314  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9287569755  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9287569152  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9287568922  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9287568577  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9287568573  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9287568555  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9287568502  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9287568404  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9287568315  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9287568290  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9287568289  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9287568208  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9287568017  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9287568010  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9287567831  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
