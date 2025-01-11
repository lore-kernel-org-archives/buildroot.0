Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E54E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 04:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01B958380E;
	Sat, 11 Jan 2025 04:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WK1jDpq_X63A; Sat, 11 Jan 2025 04:14:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B9EB837C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B9EB837C9;
	Sat, 11 Jan 2025 04:14:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D2A576C
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 04:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB8E040978
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 04:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqm4ecXl9rXF for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 04:14:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E5D9940925
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5D9940925
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5D9940925
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 04:14:32 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9e44654ae3so409283366b.1
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 20:14:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736568871; x=1737173671;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vKWmL5L0x7z6McuNCwEkOwBIxv6mldAp9PqMZeGkLgA=;
 b=AC0vxuYRzJWl0/GozttfusTvU1gQs6aBge8lUTpFy1KI77/s2qJ8o7svSEkFN09yWd
 VPqGzX/+CYMrdTWgSok5EZ83p9nDeA+a80ELsDUUVgFUMzOlvxUIch8QS4OheopdD64o
 d6WFszLTz+yemAEW9sKrihHx1p0xzhoG3oob35xIcO1hxtjKBFyqbT16izYeMFvDaWgb
 cpXA2BM51eiako4nHRg0BjOy7xMOkFrWdUJOtCUuwMGRvq3HDJhEw041+tyfz4p/XRqX
 OCm9oBTSoatpFIRJt/ZGNMOzoA2RAYQiiRUhIAR4F9NxPtHiZafS/yzMK6FkyI2c4wJ7
 39Hg==
X-Gm-Message-State: AOJu0YzHFeJAkq8Bkb1fty4H8JnSZF0O2aw+tp9DI3kJPu2Z4y3/ORxU
 vyV4URf3w/5iFVW7safCp22BbpMCwJ1FDe1Ibpa5F/5N0HPv/bcmegn4OA==
X-Gm-Gg: ASbGnctBGk6qGqGPuuY1rn47BH9PF7x8W01vuFm7z5JUpv/hsW5Nink6Vdc/QUFIn5E
 Tj5N+PRBfvH4FttTMNNQAABf7Qwvnx4tDln2XTz4ZdjDvTOu1alc97TVxZjOpef288K/EWmANTR
 uxb1EevgemMAqGluMTuD03dT+Z7TI/K9qBHX1mGTAGKRhlDqEVphyLjB6nBG/ZaCSIcW4D/nGcw
 s1MaBcJIKrzLFPi4jUe3ozG6AtDtBQhrHtEdH3N613znt/ICXIRGhFdH4i3
X-Google-Smtp-Source: AGHT+IEpHm65eW0va7cAZqSBsKGhqxGP1tp9lzQLfa4RGLvT67lgHmP7hxW66eEocPH2CuiZaFRe7A==
X-Received: by 2002:a17:906:dc8f:b0:aa6:a21b:2a9 with SMTP id
 a640c23a62f3a-ab2abde5fc9mr1309497966b.57.1736568870620; 
 Fri, 10 Jan 2025 20:14:30 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9564873sm229084966b.111.2025.01.10.20.14.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 20:14:30 -0800 (PST)
Message-ID: <6781f026.170a0220.99d21.9ea0@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 11 Jan 2025 04:14:30 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736568871; x=1737173671; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=vKWmL5L0x7z6McuNCwEkOwBIxv6mldAp9PqMZeGkLgA=;
 b=djGQsJlDrm0xMtB9Y1ptFIyBCDb7I5V58gb+8nW+XXCvCBezwgAw7tJLN9xqcmm2WD
 nSKIaFouG0Ldn37iIfLcR23eKZDK/fVcItzvZMVw8US8tU5N5Txn8c2evow+NEQtJFRd
 fiDWMZSJ9b/Ty+0AKhCVu0QxwgDxZTrfBI7aVU6i4pYmwPUbGtyvJjXmc+EnAYWdhMW5
 vux7cE2mO974KrdYa2uh++ZOlgfYV7noZoeWxrU9RoJUSIycrL56edVEVE9oWVm5FhJ+
 5wpfhsno5gpUGti2mu4g4VJv8EpouPdn5F43of2kqeYHYOdZDDOJRiFcj16h3ld5tVCT
 Zxsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=djGQsJlD
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-10
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

Autobuild statistics for 2025-01-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  2  |  0  |  5  |
  2024.11.x  |  5  |  2  |  0  |  7  |
    master   | 13  | 53  |  0  | 66  |

Classification of failures by reason for master
-----------------------------------------------

                  curlpp-0.8.1 | 3 
               iproute2-6.12.0 | 3 
          linux-5.10.162-cip24 | 3 
                  msmtp-1.8.27 | 3 
  gobject-introspection-1.76.1 | 2 
            host-binutils-2.42 | 2 
              host-rust-1.82.0 | 2 
httping-0e26c53d5fe504eb720... | 2 
         python-remi-2022.7.27 | 2 
           v4l2loopback-0.13.2 | 2 
                    azmq-1.0.3 | 1 
                   cvs-1.12.13 | 1 
                elfutils-0.189 | 1 
                      fio-3.34 | 1 
                    flac-1.4.3 | 1 
                   foot-1.16.2 | 1 
            gettext-gnu-0.22.4 | 1 
                gnu-efi-3.0.18 | 1 
                   grpc-1.51.1 | 1 
            gstreamer1-1.22.12 | 1 
host-binutils-bare-metal-2.... | 1 
host-heimdal-f4faaeaba371ff... | 1 
 host-softether-4.30-9700-beta | 1 
             libargtable2-2.13 | 1 
        liblog4c-localtime-1.0 | 1 
              libtracefs-1.8.1 | 1 
                  liburing-2.6 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
           libzenoh-pico-1.0.4 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  ntp-4.2.8p18 | 1 
           oath-toolkit-2.6.12 | 1 
                 pkgconf-2.3.0 | 1 
               postgresql-17.2 | 1 
               pulseaudio-17.0 | 1 
         python-pycairo-1.27.0 | 1 
  python-pypika-tortoise-0.3.2 | 1 
                 samba4-4.20.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/2f4335bd313d7c4e7ff7979c85de50b333d7e5d0 |     
  sparc64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/e48cc836cccb539ddfddc0b0feb6ee1555656e15 |     
   sparc     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/35327d2d1dd1812c75c76cde3826e5209c915b19 |     
   x86_64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/05fd84e09e2c2ddf00fc91c65fc4373a15d7bcd2 |     
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/9ced8b0d0a64d9f126e0dd32c578c6b95bac3f88 | ORPH
   armeb     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/62c0c5d5f99929817c47ef73c4db35a6cb29158d | ORPH
powerpc64le  |            fio-3.34            | NOK | https://autobuild.buildroot.org/results/31ebfb8c7a774a0aeb738f11137e0d09b0b59d9b |     
    sh4a     |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/2bc1e6ae0bb69b4657f8ab7cc9b3c22cb39cc14e |     
    arm      |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/cbe2b498779b5e46e2616976a30f60c5e92bf47b |     
  riscv32    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/deff0fa46a3f00b85c24ebb77b3f4560ad79afcb | ORPH
  riscv64    |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/8b2f5b38284e70dde8c5619e5050e7f201a0bcc3 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/e4fa741a3ac27b1c56520b4afe84d2d1239b792f | ORPH
    sh4a     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/a405e87febb43da3b80334d35931da2fe32ea314 | ORPH
  aarch64    |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/d1c67e21ad31ef420160ff24e41497c5b22bf442 |     
   x86_64    |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/2b03f8cdcf8c47a2fc92159ac004585c8b4b1ead | ORPH
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2499dd5c306a7cabe58364c374d1cc67073c09c8 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/83da92214a3996bd68e3e16e9f33d54b311474e1 |     
   xtensa    | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/4c8e9bd5b4efd8b46463419edc0b428b7b18a7e9 |     
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/0a1e6edb962e5611e177084c9d1c70ffe0284f66 | ORPH
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/16e8b2643cb60df27c94571a8e3ab115e3526121 |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/ed40373e3547a2f67815a5bf4b92a0a8a65439b1 |     
   nios2     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/9b8cbfbd77d764c9ac4bad32470b431ab1da84c0 | ORPH
 powerpc64   | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/f52f10b052f17029adebe56bb78374d6a2f84926 |     
  aarch64    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/b630204b43d384e79063a8aa7d01afd0f28a994c |     
   s390x     |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/cee3ad29e2742c3449fb7a6a47bb4b0d68bc4c2e |     
   x86_64    |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/5f58893ec9be9566725e716234671280766d0993 |     
   sh4eb     |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/2a755f211200a077cf0735009c62ab10af3b72cd |     
   arceb     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/1a808560f27264d15d976c696dbe9ee1cdcf7508 | ORPH
   sh4aeb    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/9d1247ac5fd867cf979f525e8d15df3adaf836ab |     
microblazeel |        libtracefs-1.8.1        | NOK | https://autobuild.buildroot.org/results/52c041faa27f1bbe38752922fc577a77ef859fae |     
  mips64el   |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/af810b694ee6b5d02852e062aeec8f6b55b4d2b3 |     
 microblaze  |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/8310f6cc98f5cb10aef2ea7ed1a8e11acc24b719 |     
   mips64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/863ce42e0e2131d0d33a41328dddf9b18290270b |     
 microblaze  |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/d47d60d7d63a46285588d643cbc61bcddb566c1a |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/170b876aa5420c9dbc118f1449bf0adf14ce13e9 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/d7ecb1f544df58fade83e84da603299c3517cdd5 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a51ce5b8101fe944db68a527faca9ad423a14a24 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/fbda8a5fb27442d6ee9c4217d1ff0f4706293ead | ORPH
    or1k     |          msmtp-1.8.27          | NOK | https://autobuild.buildroot.org/results/1e2d9f2c6a408cd17dc7654dccf660a94829e83d |     
    i686     |          msmtp-1.8.27          | NOK | https://autobuild.buildroot.org/results/00e4a1cb88aa336e8c6a3415c11beec7a1cf9d07 |     
 powerpc64   |          msmtp-1.8.27          | NOK | https://autobuild.buildroot.org/results/b7b6dbd5fb642786ba1b06fef08a27a6714f46bd |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/4a0f28ff17dd0bfeda84006e441af78bbfb84c32 |     
    m68k     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/29e744b2e7e317c5762567058c72bfb5aafc0ed8 |     
  riscv64    |         pkgconf-2.3.0          | NOK | https://autobuild.buildroot.org/results/2bcd6d3c0e757a1e34e1bf77fa11dc2e16041c5d | ORPH
   s390x     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/7ddce019ba2f760ee341884848a01809b9650365 |     
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/bb1340bdcf06bc59d8e07cc2ce87f3663d1ace92 | ORPH
   nios2     |     python-pycairo-1.27.0      | NOK | https://autobuild.buildroot.org/results/96945b6e7e4361f15bafa25fc5f9282bd7c28fd6 |     
  aarch64    |  python-pypika-tortoise-0.3.2  | NOK | https://autobuild.buildroot.org/results/2d391221a0bb79754765de2a22ad4954f3ac7275 |     
 microblaze  |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/b546cda98b6d4c516a41270252bd758c29432639 |     
   mipsel    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/61a28c1eacdefde073ba2c0cdbf7761f15cae4f2 |     
microblazeel |         samba4-4.20.6          | NOK | https://autobuild.buildroot.org/results/51042f9cb3e0260b05838e6b1c852e2df01dbf36 |     
    m68k     |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/c82901bcdedd4df322ef0180ce64094ae0ff9e85 |     
   nios2     |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/3c0ffd537beae2b667a838964f195dc394b41110 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

             cni-plugins-1.3.0 | 1 
        host-python-lxml-5.1.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/ec236ccf75420a7bdd5fc71fe492d1c84014ef80 |     
    m68k     |     host-python-lxml-5.1.0     | NOK | https://autobuild.buildroot.org/results/e8022a72b81ad7f1040809c8e624e780d3036c01 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

              fluent-bit-3.1.3 | 1 
            host-binutils-2.42 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/82a2bf6cd5206d74fb8d3c8e0fc3341738e45259 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/7eba7b30ea6541754d4db2bdcb754ad6e3a71cbe |     


Gitlab CI results for 2025-01-10
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801993817  |      
                aspeed_ast2600evb | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801993836  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801993840  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801993841  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801993842  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801993843  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801993866  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801993880  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801993891  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801993895  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801993900  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801993902  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801993907  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801993909  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801993910  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801993912  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801993914  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801993944  |      
               imx6ulz_bsh_smm_m2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801993983  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801994003  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801994193  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801994207  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801994220  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801994326  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801994359  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801994508  |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801994725  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801995268  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801995345  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801995363  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801995367  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801995407  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801995411  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801995420  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801995425  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801995429  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801995433  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801995442  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801995444  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801995454  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801995476  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801995483  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801995541  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801995544  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8801995550  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
