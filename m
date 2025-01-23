Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B81BC0218C
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 04:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E35DC6FA7A;
	Thu, 23 Jan 2025 04:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgn1tzHnkdBf; Thu, 23 Jan 2025 04:14:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 926A46FA77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 926A46FA77;
	Thu, 23 Jan 2025 04:14:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C011CF08
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 04:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADF9084A55
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 04:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDAj1lR2CMSx for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 04:14:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2176A84A4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2176A84A4C
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2176A84A4C
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 04:14:39 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso94682266b.1
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 20:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737605677; x=1738210477;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZAxvSxbf7iHns0l4J6tTWFEFGoIO3FB7BhVxD7Wxs5c=;
 b=G/cLS2Hai17iaGpAP9XXrbLIG3uhNiw94z6aYfZDXi5AhVP7UgGsyndtfahAijMwV6
 ziiTjPrvMQiurD8s4eh3+9bwN1lhDsXkpV0gs/c7pvcm+xt/Ag/4DuhykxW1DwGzwyIx
 QkWwCIXP6Yj2QMKPr4B8xdN5EtBRghu253tEJKEwohatOOZqJbyfo5cHVjcUpLkPcfxs
 jJ6NGMkQc8DxrcC77lqCb1Kkaw5ca4IdmK8jAg/P1NHHYcX8D3OtswiXGV9uRg3EbOkG
 0PyCoj4r6ZUmQAjta0gKefQwDCcehIQOBhakzksm2O98JLbQBBekQrS5PQAyTP4Soiwg
 HYeQ==
X-Gm-Message-State: AOJu0Yy9s5yRpGk3XZ2HSUMq4ssBgWkhKsX7j/+BOP/guNuhsQw5b5oU
 7TivLXS0RgvnEF5Clt+dSAGOcAkCVyRukNldgil8IC95JPEKBqx9aBR4tQ==
X-Gm-Gg: ASbGncvq1LIfVGnXfukYf8YDpi08lEmMAf1m4MeWkkJnZqWWft9laC6zuqQL/RHw4u2
 jeZgQ3zw5/1UCF177/Xt0uemkGkWCNoImH+icoxzyjssCSUGEbDFDyRE9SwFkSSKJmEgXVtoO5M
 +7VS7lQuOheUS4q/x5qQ9z8QdRA0MKnny/YZ2B4JSqe2aGYjdjWGwTgJ9CVYlhUmPmpXtmoHBqt
 bk8+bLVsPHlMaS7zvnye77hvLoNk7QFcCsaYj8IUFJ1VlpKBSXaDxM9wNWpk9Lg1kP0YH5OZeJq
 D8lA5SzK
X-Google-Smtp-Source: AGHT+IE9Sqqz3yzNTnSTExRAtpmfnSayfd8LuYtntwJYBvz3oyYJgjl6k9ZLgbeZ6/ubf+U4I1edIA==
X-Received: by 2002:a17:906:c143:b0:aab:9842:71f9 with SMTP id
 a640c23a62f3a-ab38b10ffbfmr2022900366b.22.1737605676694; 
 Wed, 22 Jan 2025 20:14:36 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384ce208fsm1016101766b.65.2025.01.22.20.14.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 20:14:36 -0800 (PST)
Message-ID: <6791c22c.170a0220.81f3f.14ee@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 23 Jan 2025 04:14:36 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737605677; x=1738210477; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ZAxvSxbf7iHns0l4J6tTWFEFGoIO3FB7BhVxD7Wxs5c=;
 b=TLMR/oE7qet0Xgqy+LZ7mpYR83xp0QK40dxLRctZ0LyY7c6MIU3f9BFTmqDe9gj3KW
 1CEJs0fEzLXWhXvj30M8X6PXt8A9hSPxRyB1CzB7eHKJbYuLDKH2MO+Wryz6DgUHJHlf
 Y+S15SThdT1METULt+c4M6wvfig3GDxDM/Hy57N7/4yIN2Z/t6yimYeRbpwUhZy03Z8D
 POSjc8MbQ76EJ8f0HXJJGiX1A5HicYwIUDljCOJOoSV6/7Wa/81zgkxkIcdqmMtK/1NG
 9rQ4n+NZVPr5f7qW0H8yEmHpFtcEe+O1TTZlv7MsYwZFNkd8Jon8Biqi4YP5/qKAnSnA
 iJoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TLMR/oE7
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-22
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

Autobuild statistics for 2025-01-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  4  |  0  |  6  |
  2024.11.x  |  1  |  2  |  0  |  3  |
    master   | 12  | 56  |  0  | 68  |

Classification of failures by reason for master
-----------------------------------------------

    host-python-greenlet-3.1.1 | 4 
             bluez5_utils-5.79 | 2 
cegui-00b4e1fe174da53b7ed72... | 2 
                   cvs-1.12.13 | 2 
                  ffmpeg-6.1.2 | 2 
           oath-toolkit-2.6.12 | 2 
                  ramsmp-3.5.0 | 2 
                       unknown | 2 
             util-linux-2.40.2 | 2 
                 agentpp-4.6.1 | 1 
           at-spi2-core-2.50.0 | 1 
                 c-ares-1.34.2 | 1 
                 c-icap-0.5.10 | 1 
                   crun-1.18.2 | 1 
              fftw-quad-3.3.10 | 1 
                 hddtemp-0.4.3 | 1 
               host-runc-1.2.0 | 1 
              host-rust-1.82.0 | 1 
httping-0e26c53d5fe504eb720... | 1 
               iproute2-6.12.0 | 1 
                libdrm-2.4.124 | 1 
                libglvnd-1.4.0 | 1 
                liboauth-1.0.3 | 1 
                  libsepol-3.7 | 1 
                  libva-2.22.0 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-tools | 1 
       matchbox-keyboard-0.1.1 | 1 
                   mimic-1.1.0 | 1 
                   ncftp-3.2.7 | 1 
                nushell-0.96.1 | 1 
                 openssh-9.9p1 | 1 
                openswan-3.0.0 | 1 
             parsec-tool-0.7.0 | 1 
                   pcre2-10.43 | 1 
                   perl-5.40.0 | 1 
          python-tinyrpc-1.1.7 | 1 
                 qt6base-6.8.1 | 1 
                 rtptools-1.22 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                     shim-15.8 | 1 
          sphinxbase-5prealpha | 1 
        util-linux-libs-2.40.2 | 1 
           v4l2loopback-0.13.2 | 1 
               valgrind-3.23.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/89395174cb002f9f28fc43c7dd60037d78280532 |     
   xtensa    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/ac93c17b637d1ddc1e4c8a3e6573a838e45c87f7 |     
powerpc64le  |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/2b97667ef54847390136fddc5ce0231f22de2bcf |     
   s390x     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/a88670d0a71c80747046800b975e4021cb11769f |     
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/5c014f663c7b0a42919ef5613ae93049aca71bfc | ORPH
   s390x     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/777e6fe3936a51228b3ccee1098992e4cf80cfc0 | ORPH
   mips64    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/9bf278b2f6f7f1dcf6cc5ca29f8634c04fc6fd05 | ORPH
   armeb     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/e2e0e30ed3796bda6a74cc016c6fcdc905849c02 | ORPH
microblazeel |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/238f1327b912336c44d95f70a27665505739bf5e |     
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/cca67d5416eb4c0e2e6dd6f1f67321d86de29a38 | ORPH
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7ea52566b8b55fcc564f1052491cee1626c2cba5 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/0e03dba1abd8fb2a01878a64b5bae066c2130f74 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/34fd1dc244c54aca134f6dd741219fdae0308a92 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/38861f5e1d9577df4e1416fa8ad6f705374b21f1 | ORPH
 powerpc64   |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/37e35972ff294c4b29956a5c5437b290db4e4ab4 |     
    mips     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0580d10eaea1e6da5815eb1c74cd922db40e974a |     
  mips64el   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/5fddee97d7286cf46b599be165aeaafb36d5246f |     
    arm      |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/dda4921e24816f5aeca1327deeb9f65e356f04c1 |     
  riscv64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/b4cc8ea4ab25a90dd01656f60ab8f1e40febab24 |     
microblazeel |        host-runc-1.2.0         | NOK | https://autobuild.buildroot.org/results/159f3f442357aeb39d9b17e3e80e6952749f46b3 |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/b6ebae8e11cb198559c79242862692bdc4e26bef |     
    or1k     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/b880fd68ba69df94592961bc9c998a1ad5df6eef |     
    mips     |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/abc095b0d2c5e40bae5e8ebe1a0da6758cc2684a |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/4529209fe432aa23603a4fdd285e00d0a7e306bc |     
 microblaze  |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/30bb97b983740ba8f8728bb347a87e8733bad980 | ORPH
 aarch64_be  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/c4494e7d72eba12862a5c367d2cc9e751f151a71 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/64d95d2fb5b4d8f39dc2c536a04cfb1905fec8dd |     
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/4f4178c03199d55f701f3ab59ff36c7ea787ff17 |     
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/561f01580eeaf9e22decd29b42421ee6595850ac | ORPH
  riscv32    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/663cdf2e2a933725905e930223a8b030cedadee4 | ORPH
   x86_64    |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/c90f143debc8406eb291c737285ef5070f9a1d8d | ORPH
  powerpc    |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/ae87ba1f5c2fcba8d503707216bab7e5dbf1ecc8 |     
    arc      |          ncftp-3.2.7           | NOK | https://autobuild.buildroot.org/results/a1e0089ec8c6d58f8e991471f601bc304d60de69 |     
  powerpc    |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/e772008d50bd1c609ac0a2240a2c3a96dc07c75f | ORPH
    m68k     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/9cfc69e30e78e4da512287a589102fead74c7032 |     
 microblaze  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/0fb6ef573c4ce277441bca43548780ab4c95b025 |     
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/14bcc40b3512b33f697e64ee06aa8de48995bb42 | ORPH
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/7c5d412d650ac129cd11f13c36f64d4da1448c89 | ORPH
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/aa9080fef7c37e6a16c9f022dc04f38963f5e8ef |     
    mips     |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/b1db792b7b8b4350604f1fe51951f5564cbf0b5d | ORPH
    m68k     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/c83054102b547b60a1e3ca4d4813baddbdfd3a12 |     
  aarch64    |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/432922847d3de8e53960376c959428efc6976809 |     
    i686     |         qt6base-6.8.1          | NOK | https://autobuild.buildroot.org/results/62f670aaa8e17fdd8df226afb2b0abc256a0a7be |     
   s390x     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/daf531b850ea5fedd16864ebaa7b5cdb2c43b3c5 |     
   s390x     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/39286963f6eec12d3455f469fabf8e405f64704d |     
   armeb     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/ba6823d75dd70f2626fb37f70d6a111a2211162d | ORPH
   sparc     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/85deb44f3f08488103842ec9a64e5f3c867c47bb |     
  aarch64    |           shim-15.8            | NOK | https://autobuild.buildroot.org/results/b9af89cc97c3670779518fb321767d088586736a |     
 powerpc64   |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/3e6fa23076ce07ad414d8f0526714a8d6cdf1b39 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/8c7165e71779062d92b59446f497c45e93b96571 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/cb860131d9fade03d3f60695b8c77355e66125b0 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/06e8ab8f90a957e352b92a410f1505b000b1b793 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/0a2281e50b5b76dea0b6dfe158bf9cd344b35d5e | ORPH
  mips64el   |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/977044f0ba1539ae5f9eed5fcb5c255c00b63cfd | ORPH
  sparc64    |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/6215d73cec5f53eaa63b3c499772ef7584162ffc |     
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/446ebfadebd8b56a9533a35c0de2374bab41f4eb | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-prelink-cross-a853a5d7... | 2 
                   libnss-3.97 | 1 
         s6-networking-2.5.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/22290312c86aabddfccad70a9f091b30b725fddf |     
    m68k     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/502015c65fe523e375c93c3cfb9bfc930df396fc |     
    sh4a     |          libnss-3.97           | NOK | https://autobuild.buildroot.org/results/630c0e97ddff7ac42a04fdbfc13a062b0387e61a |     
    i586     |     s6-networking-2.5.1.1      | NOK | https://autobuild.buildroot.org/results/70413b2d5c525c56b6cfbf5be781c30888610a93 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  curlpp-0.8.1 | 1 
                 libv4l-1.28.1 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/7c94b53f00de8747528b2a65a4e5c6e00e5dd6f1 |     
   nios2     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/ab0fd10263a180343be94a338845b6d0cf118572 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
