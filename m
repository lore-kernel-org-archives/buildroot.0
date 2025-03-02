Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A05C19F32
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 04:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CF0260787;
	Sun,  2 Mar 2025 04:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CRse73K660th; Sun,  2 Mar 2025 04:16:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23E8F6080E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23E8F6080E;
	Sun,  2 Mar 2025 04:16:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C973B1BC
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 04:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B58D984A0C
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 04:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJY01UPMQSOe for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 04:16:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CE2784A0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CE2784A0B
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CE2784A0B
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 04:16:41 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5ded1395213so5652276a12.2
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 20:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740888999; x=1741493799;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cKeDelaHXBF+ABI0D3oOctVftkLiTOkvSAPYKcmzSNU=;
 b=oWB3Ue69KEbHdOUIOPPyT/dYusHvGJnO/mV40KnqKlJRgSnJYTtVPiEn4AkTy+sKTf
 GgWxRyl2r6uDrmmbIjdtdOk6kklxiafpga/moKJF8R2NRsMNEU1pWh8D4BQF+AZsQ7gG
 LgdSpNRukok8zWw01xJRAWx2vrOA8uf7cSjjyjL4yhHqf3tvXpPefKb8RIaye5vY3AeM
 AgOcJzNSb7QENMye2MOXYY3arP1YJL7ntBL6PSpZuCKmN6339kOTjlmWJ0UVv6JKurHE
 uB3crcrVnYbwPDodF/Vc+U2zMNcftWU/HhE/3S2N1i8Og2xAQxnkYblJ92Qtp9E4rUFQ
 1Uuw==
X-Gm-Message-State: AOJu0YypGW2szwsKrb9JVVX061eNbAVz4JZNFxA9QlHrkBpvVdM97e6Y
 SIJkJUW4MZT2hojsHlSbUBQrTXmSGY9ZJjuaA10jxfAAq1RxL5dTxFqqKQ==
X-Gm-Gg: ASbGnct1n5+ipjGi+cAmUBvFrsVjlDsO6BTg2ZPI84Oeb3WQhfrl8wUPJ2M3sZ8gd8H
 HOt1mNsiERFBTuNh6/UqQU2Sygg7sofAxVBhQJtYxnoZ1oXbGUx0JuW9cyZpVFHKtl+QZEyunmo
 d4WsdyZJoI8haxa8qeu84najtKUGyXog3R1js1cqE8arCBrJjlU0aZkNs4NXt82JnCTll3ZLgVd
 dxKuDlJ7hFov1Pk2wjdwLoRJwLB4Z0knTZhhcW88/FOIBtW78D9/m3dNvVNh3t4kkWyon8l8mGO
 Fr/AZ/2fY+EkBvxVLz4sTGf0x9G9u+firc5jK8hXxh7tiEbI
X-Google-Smtp-Source: AGHT+IGgNabH91+noyCZU9TiIQLgoWjfxmFOQpkdvkfpIA2RkjbuvRwN5Q4bCRbaNu6SVN2gdEQyOg==
X-Received: by 2002:a05:6402:50d0:b0:5e5:3610:8b7a with SMTP id
 4fb4d7f45d1cf-5e5361091f8mr2874655a12.17.1740888999159; 
 Sat, 01 Mar 2025 20:16:39 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e533a89a21sm1052152a12.60.2025.03.01.20.16.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 20:16:38 -0800 (PST)
Message-ID: <67c3dba6.500a0220.1d46fa.2698@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 02 Mar 2025 04:16:38 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740888999; x=1741493799; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=cKeDelaHXBF+ABI0D3oOctVftkLiTOkvSAPYKcmzSNU=;
 b=GViTYYkC6Eb5yURkhH//xYbG9Csb9hUgl/OyHNSxw2Wr2oUrz8ppoFQv31TOdR8aVT
 0OdaRT46j/RTFwNBFYYNWRU7eqd/6I5yWGGdsbq5G0yN7PV1R1zL6YVqNq7XJGyTgT0N
 LnixDTp0jRC94IZtvDoZFnu7Qzw9E6Ny5Kvn8BgMdQ0GXhWgp6JHLeS7ys7PvRptCIDQ
 D2FEouMXAyUO6Rzo3ewutu/H6ueeFkHYlVSoaqAm5gVauF0WFgZGHJTmweXDqqELd3v+
 WBkk2BFsXg/XEv1a1RfACugd12mX3nVVNS3TWKgQBpwA7mhHSXUnVeHZiKAYeve3dzOk
 /J9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GViTYYkC
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-01
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

Autobuild statistics for 2025-03-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  4  |  0  |  5  |
  2024.11.x  |  1  |  6  |  0  |  7  |
    master   | 14  | 53  |  0  | 67  |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.192 | 3 
    host-python-greenlet-3.1.1 | 3 
                       unknown | 3 
           at-spi2-core-2.50.0 | 2 
                 libv4l-1.28.1 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                pipewire-1.2.7 | 2 
     bandwidthd-2.0.1-auto-r11 | 1 
                  bitcoin-28.0 | 1 
             bmap-writer-1.0.2 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                   crun-1.18.2 | 1 
              fftw-quad-3.3.10 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
fs/erofs/erofs.mk:69: /home... | 1 
        gmrender-resurrect-0.1 | 1 
  gobject-introspection-1.82.0 | 1 
    host-mender-artifact-4.0.0 | 1 
imx-lib-3f777974c0c146817e2... | 1 
             libargtable2-2.13 | 1 
                 libcdio-2.2.0 | 1 
                libdrm-2.4.124 | 1 
                libesmtp-1.1.0 | 1 
                libshout-2.4.6 | 1 
                libsoup3-3.6.1 | 1 
           libzenoh-pico-1.2.1 | 1 
                 linux-6.12.17 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250130 | 1 
         lttng-modules-2.13.10 | 1 
              luabitop-1.0.2-1 | 1 
                  mbpfan-2.4.0 | 1 
                  ntp-4.2.8p18 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                    polkit-125 | 1 
               postgresql-17.4 | 1 
               procps-ng-4.0.5 | 1 
               pulseaudio-17.0 | 1 
rtl8189fs-94cc959d56c1425fb... | 1 
          sphinxbase-5prealpha | 1 
                   trinity-1.9 | 1 
        util-linux-libs-2.40.2 | 1 
               zxing-cpp-2.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/4f71ffc1e3fc8e2ed7b9561c66d5be4e71c8acf4 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/b723d850c6d3c74a1a62945f93084d5c574f535a |     
   armeb     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/de7ce1328a35bc4e3eb141bfc243fe4ba999f8aa |     
  powerpc    |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/cebb82cbd0ed804fc76f3ea46e8455205ce5cf05 |     
microblazeel |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/baf4cf2d08e5db7a1acb9e2dcbd5466fa403b772 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/0b1389694f38a2aaf8ea1884a6feebe2e56ec298 | ORPH
  mips64el   |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/d7c3c0806989f954178eef06699bec0aa802bfc9 |     
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ae97355e4b3d894ba97e1ad5a428567a16e291b1 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/44bd53bf7eba13405da0dfe42bdfe3ac2d3d0834 | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7e0f06b7a2a60e8ed45b5252fd1ecc2f35331f60 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/713fce08081835ec297f5f1a12359f1f68169ca7 | ORPH
powerpc64le  | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/28e158d5d01b890f1d1b5e08b73ff2f237e90970 |     
   s390x     | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/465c91eb4b5a8a9bf6914da5db512ddbe145fbbd |     
    or1k     |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/783b140c66fb4022658ed582739b502317e4d534 |     
    sh4a     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/434dbffdf022862ca01c6eeb53256a513a1a2f33 | ORPH
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/bfd491611483d0dfcc28c57dcda1a29edcc8ce7d |     
    mips     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/4fc1322030453d9985e935e213c5a8836f4df887 |     
 aarch64_be  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/1ce3a015e3303edd82912df94c3e1a228e3600c0 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/e7859d69ca7b92a2ef1a61dd6be4884a20d1b30a |     
    arm      | imx-lib-3f777974c0c146817e2... | NOK | https://autobuild.buildroot.org/results/41a519c2964fa74bd7525405705e82c40a7af9fc |     
  riscv64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/c9bddd8093b83bcb2069db8a8a2f3cd3c4c1a164 | ORPH
   x86_64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/7bf0d4b8cb75e64542a24a830097c4f112b82714 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/f7407fdf97a8de8f16ba2dcc5a90a532f381a5b0 |     
   x86_64    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/6e2d81530e48367dfc135227af90625720a74baa | ORPH
 aarch64_be  |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/02fe159c42f7441e58b7f42934b8f36ab5a8e0b7 | ORPH
    or1k     |         libsoup3-3.6.1         | NOK | https://autobuild.buildroot.org/results/ac7229af7b3a0a45133a8f20c49134aeb587bfad |     
    sh4      |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/34169d5c9e475926318fae330e2e62b53f36ced4 |     
  powerpc    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/39419b727037f5b2a497e68642db025075a278c5 |     
   s390x     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/bcceff314f1549507e38411813eab052743e60d4 |     
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/76d0862ed33019b421d6d6c37fcd00b12848c663 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/d6e76e43edf58b2ae94a6d41ceee7d6d66b3ebaf | ORPH
 powerpc64   |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/a9ece56f0195ec0e278a609ae10d58f6813453aa | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/db0c8cfbba593cc57b0c539535b8ace22094e4f8 | ORPH
  powerpc    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/b0d1e8b144772e56d0c19d02122973fc1718872d |     
    arc      |     lttng-modules-2.13.10      | NOK | https://autobuild.buildroot.org/results/88d9a8bc0fca7844b00e705e929e3897560f05e8 |     
    mips     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/68b87f488c5765287911b70d37227458677f925d |     
   arceb     |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/3d623a6202f32d08cd26e2a4bd6f34aa3a1ce959 |     
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/6b825da84a6b7ecb7a9b4dc14566c26556d7c93a |     
   sh4eb     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/a2995151e66a233a06c99599a024f39194fdc295 |     
   sparc     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/570d72e9f594146ca3b6612e5fa0ba13607471ed |     
  aarch64    |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/07e92c8ba586c3685b5bad935baa6321185ef3a3 |     
powerpc64le  |           polkit-125           | NOK | https://autobuild.buildroot.org/results/984747dc6d3358fdcb137612835d7aac1daddff1 |     
   mipsel    |        postgresql-17.4         | NOK | https://autobuild.buildroot.org/results/8f4a8a6ef7584a9f817e845adbfd452377798216 |     
   mipsel    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/d532262d3e63358b9f21d8bafcec7f221fe5d553 | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/715fc447019f711c5cdb9e8714c48afc83bcf535 | ORPH
 powerpc64   | rtl8189fs-94cc959d56c1425fb... | NOK | https://autobuild.buildroot.org/results/b998ae20d21042ed599aa12ff58941cc82d3c4bd |     
   mips64    |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/9276a70c8e88e17e337693719938279316cbc0d0 |     
   x86_64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/c6ef10026f25d41af6e94131793e92cd49bef456 | ORPH
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/4036217537ef789b90d5e4ae1bfa21b0e17fe900 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/f5edb14bb22710f41c4d37696fd6d7ded8121882 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/ba9207213a050a529b73b6808798b8e742497bbe |     
   xtensa    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/35f581ed27e61c8b59c2f0dbd501e5887c49955a | ORPH
   x86_64    |        zxing-cpp-2.3.0         | NOK | https://autobuild.buildroot.org/results/20de7501e3044254a4f3d110205ae511a46431d8 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    fcft-3.1.6 | 1 
     host-moby-buildkit-0.11.6 | 1 
package/postgresql/postgres... | 1 
                tpm2-tss-3.2.2 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           fcft-3.1.6           | NOK | https://autobuild.buildroot.org/results/d6226997319d6b69670d61bd77b08e31513a613d |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | https://autobuild.buildroot.org/results/aa021118f101194d2bce6044f278789599204080 |     
 microblaze  | package/postgresql/postgres... | NOK | https://autobuild.buildroot.org/results/f5ea27ac82ba2333a252711bac96ff0a3bdeeb87 |     
    i686     |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/57a79d47b4aa55d43c6f3402ed1977e6ce55434c | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

            host-binutils-2.42 | 2 
package/postgresql/postgres... | 1 
          perl-net-ssleay-1.94 | 1 
              sdl2_mixer-2.6.3 | 1 
                   trinity-1.9 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/9e67d7d6264d2f415a635df400193217322bf3a6 |     
   sparc     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f5e4356403d60046a1e91f1827ef9d0ab0305f5d |     
   nios2     | package/postgresql/postgres... | NOK | https://autobuild.buildroot.org/results/fd569495c56737d3d4b51f1220c768b5465f7ffa |     
  mips64el   |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/eb192e1f645444e19d9edf4254fe016ed62a658a |     
    arc      |        sdl2_mixer-2.6.3        | NOK | https://autobuild.buildroot.org/results/573128b7b5d6c4f85372bbb678c269954d650889 | ORPH
 powerpc64   |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/99b0a7841a88e5918efac6546cb4754566d33dbc | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
