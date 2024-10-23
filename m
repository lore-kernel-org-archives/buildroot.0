Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02334D2E00A
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 03:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EAB060733;
	Wed, 23 Oct 2024 03:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jP4pb0egF2hf; Wed, 23 Oct 2024 03:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7F4A607A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7F4A607A8;
	Wed, 23 Oct 2024 03:18:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AFEC4C2A
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 03:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0548A401B1
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 03:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogiVdi77yptp for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 03:18:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B6BC5401AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6BC5401AF
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6BC5401AF
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 03:18:29 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9a0cee600aso787546166b.1
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729653507; x=1730258307;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B5K2C6cJKxsbgOrhwgrTj1bdQJlR1bjyBWbXgKlv5s0=;
 b=ak+wMbSgYpW6J79+na+LREx0VOGp/P8Ao+UIasjHsAfbKIggDT6cukKshHfFmNHWoU
 s+gx10CM21zP3zcmh7G05a7Gzd5D+45z1/Cs/sW6aAehhj/9pbki74o/EN/StX+ui7Vj
 OgkngzCipaFyeUWjMtpZWyYtf2KVqLtij7c1psShDYUqCbYFlBfXf+7wKQw74obIg1Tl
 m1tRgNQnV3ivBz2I/Gl2s/aDrKf2exiommVVDy2C4Mg1gRPMVQ410/KHe5i8n+YYSRGh
 Rl8GWeseK8vXlG2jytp25RRkHWYF6snb/Z/rew3jpsvCOFUB1/uWYVNLWzJEU2+DKAV3
 gppQ==
X-Gm-Message-State: AOJu0YztIhvU7ao0BOyhSPiRSoGeQV+LbwrOjzZP76KTlseE5ERTD4Ty
 6a8BJng3O9tPzKm4JCcYNxIwDyY98uMoz0Eaa6yJJvgO6p76CgDszlGCaA==
X-Google-Smtp-Source: AGHT+IFA/qP/cwJ5py8OBvVrB4MJP4HWcAY4Eae3JY6SaEYAUYgJwFBXc/DGpUDt6XxHaDOnxNA26A==
X-Received: by 2002:a17:907:72cf:b0:a99:cedd:4612 with SMTP id
 a640c23a62f3a-a9abf8938ffmr86026066b.22.1729653507078; 
 Tue, 22 Oct 2024 20:18:27 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a913705eesm413300066b.137.2024.10.22.20.18.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 20:18:26 -0700 (PDT)
Message-ID: <67186b02.170a0220.1ccbf5.febc@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 23 Oct 2024 03:18:26 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729653507; x=1730258307; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=B5K2C6cJKxsbgOrhwgrTj1bdQJlR1bjyBWbXgKlv5s0=;
 b=iIchnKOG218VHs/YH4dyZ5TnmEcIlyMxmuEiMBP/C1ic0bCwCot77DDwkk4mE6TaVB
 Mp6AAIcmgl634+3A3OwcjMs3Q2BMpZyFJsWCO39Oo8seM6EscR6imCDhweu382GZwvSx
 CrLTI+PD7mKChzu9yOUw1juvEu/Q+fIVZyPXW3YmpsB5v7xNI1Ywj+lRo/P90ZiigioV
 a4gzB/WF5I0i7D8Hx2g4El0wR0B97JOQ3MH8KNzMcbO6UnnftvwSrw/iwspL8scJqSp1
 4bHR/bZy8NgYmvgAUu303cBMm6qsOgzc7ZOm3dAquBR6wX4epIsp7RkZdobAMHg6f8CM
 ooDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iIchnKOG
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-22
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

Autobuild statistics for 2024-10-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  3  |  0  |  4  |
  2024.05.x  | 20  | 21  |  2  | 43  |
  2024.08.x  |  2  |  1  |  0  |  3  |
    master   | 13  | 86  |  0  | 99  |

Classification of failures by reason for master
-----------------------------------------------

                 linux-6.10.10 | 7 
               procps-ng-4.0.4 | 5 
                elfutils-0.189 | 4 
           host-librsvg-2.50.9 | 4 
                    git-2.47.0 | 3 
  gobject-introspection-1.76.1 | 3 
                acpitool-0.5.1 | 2 
                 gnuplot-6.0.1 | 2 
                host-go-1.22.8 | 2 
              host-rust-1.80.1 | 2 
            linux-fusion-9.0.3 | 2 
               linux-pam-1.6.1 | 2 
                       unknown | 2 
           v4l2loopback-0.12.7 | 2 
                 agentpp-4.6.1 | 1 
android-tools-4.2.2+git2013... | 1 
                 apache-2.4.62 | 1 
           at-spi2-core-2.50.0 | 1 
                    azmq-1.0.3 | 1 
                   babeld-1.13 | 1 
                  bcusdk-0.0.5 | 1 
                benejson-0.9.7 | 1 
             berkeleydb-5.3.28 | 1 
                  bind-9.18.28 | 1 
                  boost-1.83.0 | 1 
                   bullet-3.25 | 1 
                 coreutils-9.5 | 1 
          cryptodev-linux-1.13 | 1 
                  curlpp-0.8.1 | 1 
                   cvs-1.12.13 | 1 
                  evilwm-1.4.3 | 1 
              fftw-quad-3.3.10 | 1 
                    fmt-11.0.2 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
            gettext-gnu-0.22.4 | 1 
           ghostscript-10.03.1 | 1 
glibc-2.40-18-g564178076272... | 1 
            host-binutils-2.42 | 1 
          host-gcc-final-8.4.0 | 1 
         host-libxcrypt-4.4.36 | 1 
                jemalloc-5.3.0 | 1 
                       kmod-31 | 1 
                libesmtp-1.1.0 | 1 
               libglib2-2.76.1 | 1 
               libgtk2-2.24.33 | 1 
                  libnss-3.104 | 1 
                  libva-2.22.0 | 1 
          linux-5.10.162-cip24 | 1 
                  lvm2-2.03.27 | 1 
                memtest86-6.20 | 1 
                  ntp-4.2.8p18 | 1 
               openblas-0.3.28 | 1 
          perl-net-ssleay-1.94 | 1 
      python-autocommand-2.2.2 | 1 
                ramspeed-2.6.0 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                  scrypt-1.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/8f53667d9edfc21db2e4591c9b79f2c2c958a4e8 |     
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/a765f0183a68128828f59aa7e04eb6edb2c603f4 |     
powerpc64le  |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/84d4b11e73352c35db4c9daeea17534661566608 |     
   xtensa    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/a546ea2a4f2f45c91972422c00599e221fbebf6a |     
   x86_64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/88a0fd4a07a3bea3a3b164c61505fb44b887314b |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/a2d597a80e1ba17ccb01208454b7f16f0e047d33 |     
    m68k     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/be935eba8d4c322e7b5c340bcd2bd5219559b882 |     
  aarch64    |          babeld-1.13           | NOK | https://autobuild.buildroot.org/results/f43adfcf8b5e6c88f0f30ac4048579fe20f27f48 |     
    or1k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/f215ec719a7dbddb6f565c5010b349460a0a5706 |     
  powerpc    |         benejson-0.9.7         | NOK | https://autobuild.buildroot.org/results/450b8d8c46f697afc1c6193fc35c46afa5dd2638 |     
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/5c0ca6ea267ab5cecaa9349e33e75c68d405055a | ORPH
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/38ab10b62e88d68a7c5cb3e146c57d4c8b16fd13 | ORPH
   mips64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/906b1ddc27f59ee62de7f6c82bd46f876dd22369 |     
    mips     |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/6626862c48585f469f1da7c9d5566318df8c1631 |     
  mips64el   |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/f85e96e50fb5f95215906479ddb56d02591a705e | ORPH
    m68k     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/de72e2acfc9a8f391969c1c64d3debf7b8800b48 | ORPH
  aarch64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/0362ab2cb094f7ffd9d96692a452672f35811dda |     
    sh4      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a171821c35055884ae8867026508ec46534582f4 | ORPH
   sh4eb     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/27bae6f9df77184e0e1e4dd67d0d63208ff5b712 | ORPH
   mipsel    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/1ad898ee0af90705949432f7c0ae0bcb2be93e58 | ORPH
    sh4      |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/dec0c7572fdad03cc62a6e26f34d611666bac254 | ORPH
   mips64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/cfd14fa3493414e0757a38e820ef6d26687f2068 | ORPH
 aarch64_be  |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/736c7223ed44aad2bb64c77e66a9b644c35116b7 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/3a38907e6df727ad4626d69dceb93ddf0e7fe441 | ORPH
 microblaze  |           fmt-11.0.2           | NOK | https://autobuild.buildroot.org/results/b13426ce28116bffe2b73568e9d99444916f12a2 |     
    arm      | fs/axfs/axfs.mk:32: /home/a... | NOK | https://autobuild.buildroot.org/results/4b4c629799a8b9182fad1533674a642e75a97eef |     
  sparc64    | fs/romfs/romfs.mk:32: /home... | NOK | https://autobuild.buildroot.org/results/5fc3fb3df7bc80e518b3693963f07df011dcd776 |     
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/550cd2c1e798a8ec7fa6757677576f99ce86d38e | ORPH
   sh4aeb    |      ghostscript-10.03.1       | NOK | https://autobuild.buildroot.org/results/37227dc760daeeb568c05fb7870fc9a7d78c79db |     
  mips64el   |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/db39e5d518791726e13b4982bbb4a522a45bf02f |     
  mips64el   |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/090cd2f0a099f2127030fa96ed39847008c84ecd |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/199ba1076e52f0d34cb76686d19226c73d8246bd |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/70b99e83a113e825704094287d11c17275c0bf17 |     
microblazeel |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/327d4b1b0ae3f5fcd38cbf26e30e9303f3dbd677 |     
 microblaze  |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/94b84e0a45175b6bca479b470661befaf72fdffc |     
   sh4eb     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/f896aade16abfa74fd65df64137735fac9d63a93 | ORPH
   sh4aeb    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/f95d0412f4b09e166011778f5d9037cadafd6d9a | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/85b66dfa945832c7afd3c87cb4e96d1896e7cec1 | ORPH
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a7f7ac316e40e5d9b82396033263f464a43692a8 |     
  powerpc    |      host-gcc-final-8.4.0      | NOK | https://autobuild.buildroot.org/results/1e085c8abb81e184e235d36beffa91fa3d49c960 |     
   xtensa    |         host-go-1.22.8         | NOK | https://autobuild.buildroot.org/results/57f9662016ee9b424454641e514a69f483fd9f97 |     
   x86_64    |         host-go-1.22.8         | NOK | https://autobuild.buildroot.org/results/eed91b7c2692032db8f65fad6e3d3b6f0914e3cc |     
    m68k     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/44d77fd464500cc7e29fe97457155ff0eccbbe62 |     
   mips64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/e6f09b41de17a95486b95fdab1d07957b7655931 |     
 powerpc64   |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/bd86ba335c489c4a453a947e9197714551b1ca20 |     
  powerpc    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/bbdbb18eb0a69c4d0c2b8f1c4da6ca4885d08c34 |     
    arm      |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/bdf66fc6404fd266c4164565fccfc1db5c3ae5ac |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/6297385a6fdcff1a29999709d908f418cf428f98 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/6631a1bf452d67240000191d821f3a9302b08384 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/bd53ccb283253a4bf0c023ca397bd6c324c5e794 |     
 microblaze  |            kmod-31             | NOK | https://autobuild.buildroot.org/results/c523fec1766297f6a8f205674a488c154cfc2f4d |     
   x86_64    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/b128a45ff3e856f1be9289ff5a03440f1a67f162 | ORPH
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/be501936810371a3e3a798e43b591605c68a9446 |     
powerpc64le  |        libgtk2-2.24.33         | NOK | https://autobuild.buildroot.org/results/2d2957b705c5071dc0ea5d66de774fa8c0ff53e4 |     
  powerpc    |          libnss-3.104          | NOK | https://autobuild.buildroot.org/results/34ccce4506f9af2599a9ae470d69f0f804962286 |     
  mips64el   |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/e3441121b1e1c62863d31cba52e843ff2aa33040 |     
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/d71b54ed0e351d28de345d0d93c0922929b29ee6 | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/2146e7118beb25f05923a9497805f648e98097d4 | ORPH
    arm      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/cac3d594a2058718e5943d212d4dcfec0882dbd3 | ORPH
    mips     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/94b6b31969a01a8db6109b76f1f14e644cc3952d | ORPH
    mips     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/38c1a217307fceafcdf27d319ab6bfb2e293888b | ORPH
   mipsel    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/f690508f128b0d1c77b4e23e799ae7cb8ea33f62 | ORPH
 microblaze  |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/14cf2a44d32ee22adc4c3016495cddf2f7669e58 | ORPH
    m68k     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/9092c1d94442270998f261189c3dc3f3c66ac21c | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/5967a0c07e2eaa9e780cba681e5f0d22af8041c8 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/23e37b99a52bfc4e490613b44d5ae67e47b921f3 | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/75a869f5723df14ca7f0e92d1f3085d0498238d6 | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/ce6e57286a8a63d0d645d5e06d33f6a6d1c37694 | ORPH
microblazeel |          lvm2-2.03.27          | NOK | https://autobuild.buildroot.org/results/5bb283eff4b4a2b17d1028bbe0b3e1bea8fbeba8 | ORPH
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/1bd79fc1e0ab32af68f3ed556ffa208954e4cf93 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/019f9494bfad04755b25483bb09bdc3ccbf5283e |     
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/21a69e26f969a0759190212e680d941c62d2e784 |     
 aarch64_be  |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/0f4057ee3454796406a622615dc77ee594c408a2 |     
    i686     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/8f8ffe628c3117215b2c9b9874708701f791faec | ORPH
    arm      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/33bbf819bad812930ca4d54e6c653de088e6f592 | ORPH
    m68k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7dce33b7b44e3e38b2e7b372b57ed5ddc2ad8bfd | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/470fe64e3913e68c3f55ba7f4be8ab1d6ba771da | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/80d9e6a423d4f5e8dc1f034224e9c9dc5c3a7a14 | ORPH
   nios2     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/c5595bea25ed70a22dfd29110b78925f045ea37d |     
  aarch64    |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/c4eaa1246921d936f9a221a1221552db60adb9e5 | ORPH
   sparc     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/6ce628d2b4b0bba8f2f5695bb4c7a7ecf7591e7e |     
microblazeel |          scrypt-1.3.2          | NOK | https://autobuild.buildroot.org/results/b24bd9d4db3b1508c759363a926e72f578d1cca7 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/a54b8b7ce5b66c26d00b34f0dbcca670b74b1af4 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/8129e4316da1375ce9ba9d1e16e5aabd6d7165e1 |     
 aarch64_be  |      v4l2loopback-0.12.7       | NOK | https://autobuild.buildroot.org/results/4661a55816a2ca0330e0fc9894aceb84d74fcaf2 |     
  sparc64    |      v4l2loopback-0.12.7       | NOK | https://autobuild.buildroot.org/results/ddba9a7912a3822918779030216bf71d93d8d798 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 2 
                  linux-6.6.51 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/34746ffbc150a60f88a812456cc6bd624b738a4d |     
   nios2     |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/b95f0a62ede5ea517361846b129cf9d7dd3571b5 |     
 aarch64_be  |          linux-6.6.51          | NOK | https://autobuild.buildroot.org/results/34c444c8a4f89e66f65c752731d496a2d7043b3c | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 2 
host-prelink-cross-a853a5d7... | 2 
                  acpid-2.0.34 | 1 
                  dhcpdump-1.8 | 1 
                   duma-2.5.21 | 1 
                  ffmpeg-6.1.2 | 1 
                gnu-efi-3.0.18 | 1 
         gobject-introspection | 1 
                host-go-1.22.5 | 1 
host-heimdal-f4faaeaba371ff... | 1 
         host-libxcrypt-4.4.36 | 1 
                  host-qt6base | 1 
               iproute2-6.10.0 | 1 
                  libffi-3.4.6 | 1 
          linux-5.10.162-cip24 | 1 
               mariadb-10.11.6 | 1 
                  ntp-4.2.8p18 | 1 
   python-pydantic-core-2.14.6 | 1 
         python-remi-2022.7.27 | 1 
                   trinity-1.9 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | https://autobuild.buildroot.org/results/e040a7b99fb4e39327d717c2d04ab56ed6d5e883 | ORPH
   x86_64    |          dhcpdump-1.8          | NOK | https://autobuild.buildroot.org/results/bee4fa36589bdd490e3d23672a6b3be818f1829a | ORPH
  mips64el   |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/329f7a5520acb22d9d77c7cc93dc07497dda6c73 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/406a95e1759709391adabd4064b6fb94e8685f2d |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/d52d83d9c2161e9667326c58c17de853729bdb3f |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/97433579b170310936f2cb892d1e6d6e3436f51b |     
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/aa0b42ef8f270a1ed05a07f04f94f026950fdf17 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/d16d5473ca36e59f782f2e261c8db8898188faa4 | ORPH
  riscv64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/9e70108f92f6df8754a46b7e684a26debb06d63c |     
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/1abae2c008470ac0889a2845792fc13fc58582f9 | ORPH
   nios2     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/bf1cf1675b4fbbdfc9153c55c23941d64cf2e270 |     
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/f4ea98efa7445ba090de32b88b2663d7f7f6807d | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/7c802f16fcf738d99f842e6fb2fa33eb79277d47 | ORPH
    arm      |          host-qt6base          | TIM | https://autobuild.buildroot.org/results/917a08b99d5a181f1435b9c51629582db93b41e7 |     
  powerpc    |        iproute2-6.10.0         | NOK | https://autobuild.buildroot.org/results/314b5faee0dc4dd125df759f79a1de774680de71 |     
    or1k     |          libffi-3.4.6          | NOK | https://autobuild.buildroot.org/results/93695d72e1faae60d75aa2844760bfd82e279249 |     
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/212aa8911cd06a004156aa55a9ea6d2f48bc0a54 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/f9aab8a4c31ea94963a4a9a5f537afd78ca37a81 | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/497eb777e8ed0eed4afc9f67c78910e0a63f56a9 |     
   armeb     |  python-pydantic-core-2.14.6   | NOK | https://autobuild.buildroot.org/results/09baa0123c00d4c2ca74970e7771450d299027e2 |     
  aarch64    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/3fd7b494bf1f81fb5b92ce160e4c82528d558e68 |     
    i686     |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/18af9a52a54467101ade6ac8c373c1853d5cec26 | ORPH
   mipsel    |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/f5a9d95d0561ed91fa9cf4c89a454b8c19bb5d47 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                  bind-9.18.28 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/e49583ec11c4a0ecf423dfa754bed8a22dbcd173 | ORPH


Gitlab CI results for 2024-10-22
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157608225  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157610866  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157608965  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157609090  | ORPH 
           TestExfatProgs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157609258  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157610993  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157611063  | ORPH 
...ch64beMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157611096  | ORPH 
...linAarch64beMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157611353  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157611711  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157611865  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157611995  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612064  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612139  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612182  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612213  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612309  | ORPH 
...k68xxxMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612357  | ORPH 
...linM68k68xxxMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612376  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612398  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612413  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612420  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612432  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612443  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612477  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612508  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612518  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612557  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612607  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612644  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612657  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612736  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612806  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157612908  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613059  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613103  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613173  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613211  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613228  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613237  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613251  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613291  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613323  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613342  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613366  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613390  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613414  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613424  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613428  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613434  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613442  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613453  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613479  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613494  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613508  | ORPH 
...90xz13MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613513  | ORPH 
...tlinS390xz13MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613521  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613533  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613538  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613543  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613548  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613558  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613578  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613585  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613593  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613606  | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613622  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613635  | ORPH 
...otlinX8664v3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613641  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613657  | ORPH 
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613670  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613683  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613691  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613733  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157613782  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157610910  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157610969  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157608429  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157608477  | ORPH 
             TestGnuradio | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157609469  | ORPH 
                 TestNmap | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157609671  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157609817  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157609944  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157610481  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157610258  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157610356  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157610539  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157610588  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157608555  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157608706  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157610662  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157608779  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157608853  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157610724  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8157610804  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
