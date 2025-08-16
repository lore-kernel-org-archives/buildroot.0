Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6B9C87FCF
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 03:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3BF583C64;
	Sat, 16 Aug 2025 03:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lz-CMmI0rsLI; Sat, 16 Aug 2025 03:14:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D10C783C5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D10C783C5F;
	Sat, 16 Aug 2025 03:14:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 634D8223
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 03:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 400A740E7C
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 03:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aEUXxx5nrfj4 for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 03:14:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0238B41011
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0238B41011
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0238B41011
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 03:14:10 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb78fb04cso400840866b.1
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 20:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755314049; x=1755918849;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7pR//11JqLUSzbxv50eh3o3s8PgVB4chfiUkuNaWv/A=;
 b=OCgdczFawkgoe8TgfDxJ6N+eq/BFOfxVFqLc389t/TkEC+uUr4QgH4iBE0Mjq+CFpO
 /VTpOuVO6zj5JwNA77fnmKrJAjCL8b/5f1j0kILikUOjFlkjCTfoJ8bflb020SKtxsZQ
 or1RikjbqJCFRHlOr0YOGux8hmi0cSUSH+NuWIu02x6rB/bs8iUkhWwsM4vTBARrHh1e
 wgm4QrDK43SWUIqKmsYVR6xmdW1vLukEwzcYJpa56p72fwwfyMLnZaL6xXZ2iAXcMtvz
 y4CZ3QR3NlEurGjTQxgEoV6QJ4wcqkfY0m0xg5pWzPDQmMq8xCXIAkEQ/cP1UElRInat
 JOxg==
X-Gm-Message-State: AOJu0Yyj5veqIrkfPeaK8AdUp6eUoAuAW4Z0Sjgukt5F3Z2hH1+07gLa
 xwWZtlvQ+YKCQIuk0sCbTILpajfhr26iyPu+CtGGMMxn2dhnY46QaiIQO2lx9g==
X-Gm-Gg: ASbGncu04cncJhCt4jEL8wgJ7qTLvyLuWhU1c3ruEc9cU/04z4K+jzJoMchzp2Ztoeb
 GiZtGK54jaENrGp/By55tvYm0YR31nH02Xo6lmp0xXPZHqx5wxUW80YttaV71WSh7hukoXdkR9/
 ffXA3mb2G5c3/+8jmqult6eMTOdHMnuDE0MKJi5ZQaRfAiAo7LXIO4rC3dbFOD4tCSh5dlZGNwx
 CGVFXyuxpU6kzAynw2VKlneUT0ntLIvgo2xbihLqfxzkTChbc3vpnQRJ3rxbohcVT6RrERm3fY0
 b7ia54+sCHEl2GBsWMgOFThLobSJxz/CgSX/us73T9h5Ja/xvNC6bit34p7LdKKKTqauPhP/35y
 VF8IF281A3PyktmbenZ5X89W6HA==
X-Google-Smtp-Source: AGHT+IFAC7eZ4QrM2lRguNCpm/2nuNyK7MjBD6HSCQnsDo2W46hSJheJ02+RrY9wfM3WSVaEu9uCaw==
X-Received: by 2002:a17:907:da9:b0:ae0:686a:870f with SMTP id
 a640c23a62f3a-afcdc08014amr397528666b.15.1755314048175; 
 Fri, 15 Aug 2025 20:14:08 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdcfccd75sm276301566b.61.2025.08.15.20.14.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 20:14:07 -0700 (PDT)
Message-ID: <689ff77f.170a0220.203acc.649c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 16 Aug 2025 03:14:07 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755314049; x=1755918849; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=7pR//11JqLUSzbxv50eh3o3s8PgVB4chfiUkuNaWv/A=;
 b=XK+SJsI4u9te04kJF9u2o3766aPKygGX+XVfmo1j7D4S3NG/7GbpJ9uWiGA59wq3t/
 cqPDaZqlDOXbVbpPAKMleAdIrKAZWk3D1+C6kYzy9kFVARNCqei/hHf1Q+yX5pfGHspa
 4yI5yqh+TTP7JomDcnYzDEkS5kI+0cbl7pskeG9/obawoXNnNocw5UO2cIId+QQot5pf
 qWZpl+hiEVTzQf/xAiUIUO2FGrS43e2PT+eNFMVaneXxJRzVtBctH/k9KKYkGdvAgB77
 bTy64PQBmgAjTXgbs8neDN65Qb2xeTVjpXxxD7d1r/cjF4V0+tzAg6DVfSKALuu+1vGP
 /5UQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XK+SJsI4
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-15
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

Autobuild statistics for 2025-08-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  9  |  0  | 12  |
  2025.05.x  |  2  |  3  |  0  |  5  |
    master   | 23  | 156 |  2  | 181 |

Classification of failures by reason for master
-----------------------------------------------

    host-gcc-bare-metal-15.1.0 | 18
                elfutils-0.193 | 6 
host-binutils-arc-2024.12-r... | 5 
                 host-gdb-14.2 | 5 
                 host-gdb-15.2 | 5 
        liblog4c-localtime-1.0 | 5 
                   bash-5.2.37 | 4 
                liboauth-1.0.3 | 4 
                 logsurfer-1.8 | 4 
                   perl-5.40.2 | 4 
                       unknown | 4 
                   cvs-1.12.13 | 3 
libdbi-drivers-0bfae6c43134... | 3 
                setserial-2.17 | 3 
                    wipe-2.3.1 | 3 
             dahdi-linux-3.3.0 | 2 
                 expect-5.45.4 | 2 
                  libjwt-3.2.0 | 2 
              libselinux-3.8.1 | 2 
          linux-5.10.162-cip24 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                    linux-6.16 | 2 
                 linux-headers | 2 
                     nvme-1.12 | 2 
            python-yarl-1.18.3 | 2 
                python3-3.13.5 | 2 
                    sslh-2.0.1 | 2 
              tinyssh-20240101 | 2 
             util-linux-2.41.1 | 2 
                 apitrace-10.0 | 1 
                   atop-2.11.0 | 1 
                   avrdude-8.0 | 1 
               bctoolbox-4.4.8 | 1 
                   bird-2.15.1 | 1 
          chocolate-doom-3.0.1 | 1 
              containerd-2.0.2 | 1 
  distribution-registry-v3.0.0 | 1 
              e2fsprogs-1.47.2 | 1 
               ebtables-2.0.11 | 1 
        edk2-edk2-stable202505 | 1 
                     fd-10.2.0 | 1 
firmware-utils-86739f2b3ae9... | 1 
              fluent-bit-4.0.3 | 1 
  gobject-introspection-1.84.0 | 1 
                    gpm-1.20.7 | 1 
               graphene-1.10.8 | 1 
                   gvfs-1.57.2 | 1 
       host-gcc-initial-15.2.0 | 1 
    host-llvm-libunwind-20.1.8 | 1 
    host-mender-artifact-4.1.0 | 1 
              host-swipl-9.2.8 | 1 
      input-event-daemon-0.1.3 | 1 
                  iozone-3.506 | 1 
libdill-32d0e8b733416208e04... | 1 
           libfreeimage-3.18.0 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
             libgphoto2-2.5.27 | 1 
                libheif-1.20.1 | 1 
                 libiconv-1.15 | 1 
     libphidget-2.1.9.20190409 | 1 
                libshout-2.4.6 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
        linux-headers-5.15.189 | 1 
         linux-headers-5.4.296 | 1 
              luabitop-1.0.2-1 | 1 
make: *** Waiting for unfin... | 1 
                  mbpfan-2.4.0 | 1 
                    mpir-3.0.0 | 1 
            netstat-nat-1.4.10 | 1 
               openblas-0.3.30 | 1 
              openconnect-9.12 | 1 
                p11-kit-0.25.5 | 1 
               pcsc-lite-2.1.0 | 1 
                     pound-4.8 | 1 
                  prboom-2.5.0 | 1 
                ramspeed-2.6.0 | 1 
                    sdl-1.2.15 | 1 
                 siproxd-0.8.3 | 1 
    start-stop-daemon-1.20.7.1 | 1 
                   thttpd-2.29 | 1 
        vulkan-headers-1.4.317 | 1 
                 xinetd-2.3.15 | 1 
                  xl2tp-1.3.18 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/a27365c31f4c55933a81e9815924a2765599ed95 |     
powerpc64le  |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/2f1a7c65ccec827e740aa1888ba095d8cd21c8f0 |     
    arm      |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/aa310e389297549d0449bc1b206e6d8868daca04 |     
    m68k     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/8b087b7f6f9b0b64ee9702643cd27393796cc5ea | ORPH
  sparc64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/7a24ee18f99682a7a5fa0afe64afdad91725844f | ORPH
  sparc64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/0cbfe22fdaffea0e6723197c1feac04fb2da2d7d | ORPH
loongarch64  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/1b181cc8bd99236e67e14850b13cbd5dc87fc792 | ORPH
   s390x     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/874ecbacbb078a0a3da53b922af0d1ee14538291 | ORPH
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/6ac7fe4012e1b7b8280ee345c72a4b85d5af26d8 |     
    arc      |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/4cacf21b1f462afed9606776841f526dcc345406 |     
    arm      |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/43bc239edb38943aec4f57790c51e9df64ab3581 |     
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/cbd724a596ce0322dc42eaf5df7fba7e0018a5fb | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c6335136f79a736abc885874797e0bbdfb304572 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/392b83b8d7384bca1a945a5147b7ec7830b0e686 | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5aed8904ed55c4ba0b6da2c07e5e991cf2a6f64d | ORPH
    mips     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b42ccd4b3df03cc35d03d3997ffc4a6b267c3e60 | ORPH
    i586     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/de3b668020c41e65fce1189116df6643df0a4594 | ORPH
   xtensa    |        e2fsprogs-1.47.2        | NOK | https://autobuild.buildroot.org/results/95c8dac722a818a7d8a4d6c6310099d00f163d5f | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/a89b52ae796fb690c973b3c18541cfbd0b4b8336 |     
   x86_64    |     edk2-edk2-stable202505     | NOK | https://autobuild.buildroot.org/results/6d02b1c56ebc4f2a7699cdaf3e4543e5ed17fa72 |     
microblazeel |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/b8828b32ddb433caeec2c6fc715d7be1f95c07df | ORPH
    or1k     |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/e6a5cec9a02cb873cbf6d0ac28c8410c94d48fa9 | ORPH
    m68k     |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/ffe68fb3f1183668d65c75bbebff58d09b4d63d3 | ORPH
 microblaze  |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/79754091986ecf414246b49f5b20388a2eb41b60 | ORPH
   mips64    |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/931c3c0110c3374cdc2408ad674c1ef3ce6554c4 | ORPH
    sh4a     |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/3966e31d70f3d50c1c8174207b3d10bdb32e04be | ORPH
  mips64el   |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/f1ce67601e959e0ab98e93e3f4d5627753a3d47b | ORPH
powerpc64le  |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/4a6bc58deea350a6fd99fe700c18611a612bd4b6 | ORPH
   x86_64    |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/4dc9b3cd02ad88a5ccbe7c8a89f04f3b2e5225e4 |     
   arceb     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/6a8a533520197ef031a7f14a8660913fff599bf9 |     
  aarch64    |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/c0a844fca59a713be4fc414ffaa5ee69ea57c5d6 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/bbe505e9ca589272eb07d7eb3b39116081a449d3 | ORPH
microblazeel |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/f51e9883fac2a378c58bcd7e81576dd7ec332e65 |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/7bdd15ce24136b1018142b215bc9ad14c1f1eeb1 |     
 aarch64_be  |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/856b0c398e995558c21bd041c387b44abd4db439 | ORPH
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/d27d7ac8f731037acedfc8d0dd5d413be82530f7 |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/6c2262f6e94ad781daba989b39277b262062ef6b |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/c84e6d1463482d620b115e647cce22c8b88fec5c |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/a4a1010d9a7f28b45ab9c87a5fb8e7de4f70d566 |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/102854db5bc055eb5dc98a2b3d280451885a2544 |     
microblazeel |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/93607cac87304897c397a8f01307669d025e617f |     
    mips     |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/0aa9b4d111c3d2bb00fe29d3cff0fd42d602e63d |     
  mips64el   |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/71e288b676e918ffbdeaee5f87aa0fc1d296bc48 |     
   arceb     |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/cb88d1957910a4d284552d186bd67ef7bfcc30e8 |     
   armeb     |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/50bad0e5fa8f2093423fd57e4d57fff8f79f636e |     
    or1k     |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/4104b8fbcc9f870f2ed1a8f62d990287d8a1bdf3 |     
 microblaze  |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/817034a93396bd3d621e379c1260ac0c701f607b |     
   armeb     |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/d240d98b3ffd25a62d695de5d0056da38c041a45 |     
  sparc64    |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/97639c970c5e4f21e65f7ee354c4a1d6c59ca031 |     
    arm      |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/306fc21f8cd163cbe8cf37d593943fe6480c9783 |     
  mips64el   |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/6b3bb978d87df287034873cb82c45804d39d91dd |     
loongarch64  |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/8dd3a8b13fbd0d2eadf73a44f0f35ebd65ad743b |     
   arceb     |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/95b909a183c8fe63d6cd832ab6c46c97d0afee7d |     
   sh4eb     |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/6b2efcf7f13562f9196a1b0507c0897888834f94 |     
   s390x     |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/2d66751ee644a76eff0420777e817cdbfd456ab8 |     
    arm      |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/f8abcbf54c3a952bba53ffe765947b9e4b99a4e6 |     
microblazeel |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/80258c53527bf1cd0e7c48ce9bc9e597271a1bbe |     
  powerpc    |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/f8b599d7acabd776fce132264b70e47204e35922 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/e3148c3ad81e6f597bb192241b5ec89a18f53061 |     
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/10ef41a17fb754178306b2ab633d21acbc29226f | ORPH
  aarch64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/9bd66dd37fe857dedede6528cb8aed90f233223d | ORPH
   armeb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/aaaec61a527e7f619f3fe2fd7ce1f91d88d7b31d | ORPH
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/526a34afdf64c91121ca2d32011a8cc08a1da0cb | ORPH
   sparc     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/1c23e382330f434f8455d89133b0b7074be7c33d | ORPH
loongarch64  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/9ebcc434bceebe1c8c40b9fd4a5c167c6c2c8ca7 | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/654bc89304f81d3ce54fdf3363fa0b62f725b7ea | ORPH
 aarch64_be  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/619b4b1c7a73b7f49de240877b09375df934880c | ORPH
    i686     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/cc5d271044103cb194bb73a0e5f56f021ea76c25 | ORPH
loongarch64  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/da6b206d23b6e0ec3ff8be5ed8cd02cbf786e91b | ORPH
  aarch64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/3e2a64aa15c845080edcd65d67be2bc4f713686d |     
  mips64el   |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/4b88b706c71f98f8c6f810ed896ec4c37b9ba0db |     
    arm      |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/b28b15bc9156abcf8ee163415dc116fe2b5ead45 |     
   x86_64    |    input-event-daemon-0.1.3    | NOK | https://autobuild.buildroot.org/results/5bcbc5ba3789970e442ce9030ded40baf0c40539 | ORPH
  aarch64    |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/f08720370258e790e364cc6f5a3aa61bfd9dbfe9 |     
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/d3d2bf2f98dfcfccfbd5b5e10665547f6bbae952 |     
   xtensa    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/eeaa6188af7709902e874594d7e8d98513dd379e |     
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/ec3d04691b1253250b11c1d73ea413a92f70a034 |     
 microblaze  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/65c1bd19c4120be0b28588ed3d5e49ab3784b3af |     
microblazeel |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/e16af203a3e01c3d0689616746c6a468d54b046d |     
   sparc     | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/2c7fd08998c79aff775923052571607bd48f829e |     
    arm      |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/62628ee415e1fab1e31dd07a27f4e0737f5e6b95 | ORPH
  riscv64    |         libheif-1.20.1         | NOK | https://autobuild.buildroot.org/results/4302ebdd6c0aa4ca7e4ed972862d1ef86f2f4560 |     
  powerpc    |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/ed48e556dac80982db1bfb9551a9c2386c3ad511 | ORPH
    arc      |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/d47a8718de694012cedb6eccea4329856c8364b6 |     
    i686     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/efeb29d94e1d9caac5a1c3e126e7c1002bdb4a51 |     
   s390x     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/d72a1d59cfcb1c6d5bb86d77e993ebc551895381 |     
   mips64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/8457e0e7e6a9f1431e7114791b2ebb14c99d29b1 |     
microblazeel |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/9753d9f1e5bf17b25d6fcf00ff93ac8b1044d21d |     
    mips     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/aafab71016ca441acaa07771a24c23f7b63876a5 |     
  mips64el   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/fb6d4c7e0630cfe418472f85aa4b083166522315 |     
   x86_64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/195545408b6f8270d2972bfbd04ff3cadc9f844f | ORPH
  mips64el   |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/7a4b26ae428f4944f0e7cf850633ea0139d92c2d | ORPH
   x86_64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/62aac61a1332a4f4b83a5e29c22cef3a81011187 | ORPH
    m68k     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/e33d54d6d2dc2d5077322021877783458177d299 | ORPH
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d7eff82315be535d7c6f366b784c2a0e56ef3b11 |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/db379889cebf27a8792f8fe2ace9b2aa2572f333 |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/67bd06e583c579b573b418e910440bc7ad0faede |     
 aarch64_be  |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/11952136cebbaa041a2ec40a0d7d60d302b4e6bc | ORPH
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/518caa7bb7499909e573f926258582b058d1d333 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/ebc6256b7e0dc8bd047267089ee636c331d0f6a7 | ORPH
   s390x     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/583a49d23dbb47b0d6bd14223ea43c327afff4e0 | ORPH
    or1k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/e9d80a7eeec9ee01d1adb1813d9b5256ec60038a | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/e8cc8bcd92fc1d18142bd6067242c95a8d89d4ba | ORPH
 microblaze  |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/53c7b8505fa9b2987c326dd7c8daa5d32bbbbcf6 | ORPH
   xtensa    |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/e3e8f3560ef6c887ed1ba79c6fa2bd995a418021 | ORPH
microblazeel |         linux-headers          | TIM | https://autobuild.buildroot.org/results/02f0e97ce819f356c1f40c90ab5b359ccfb1ee89 |     
   s390x     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/91222debfa05c678388bf464a7f9bf5c1e864cba |     
loongarch64  |     linux-headers-5.15.189     | NOK | https://autobuild.buildroot.org/results/642ba4c8fea2f5d54c1b048d65b8b0595a105977 | ORPH
loongarch64  |     linux-headers-5.4.296      | NOK | https://autobuild.buildroot.org/results/d68e4772b342b5b6ea331e58dcf34ae440692555 | ORPH
  mips64el   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/cf34fb7e56926ce9b27f8c97e36d36a6a8dd2061 |     
   sparc     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/9197b7d33d1fa7abcebefcb21d7ece145d47b7ff |     
 aarch64_be  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/35c174acac931ef177851d3fb1e325b555016d99 |     
 powerpc64   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/f0ea64df32da82e708266126d542de753d5a708b |     
  mips64el   |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/dabef928b71c995e244dafe858514cd11a11a117 |     
microblazeel | make: *** Waiting for unfin... | NOK | https://autobuild.buildroot.org/results/62b80bcc4625fb399731d295ec2fb0756fb7337a |     
    mips     |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/54e32cf78fb71cc179c0538b42e116d67c4b5ea6 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b765699e6d335dd0d4a27e6b352408183544bbc7 |     
   x86_64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/77c12e8b775d17ea3fac8e6c901f5566b6e48a70 | ORPH
    or1k     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/176ddb6f2bf8933541fa8366a0654c3b133b834e | ORPH
    or1k     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/04b60288682555f9e8e872f8152b989d8a9e470a | ORPH
   mips64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/1cbac985ee55e563fa6efff8d883ee1975633cc4 |     
  mips64el   |        openconnect-9.12        | NOK | https://autobuild.buildroot.org/results/dca64e5fd9325c27569a7b10fd5be59c92b5ecc3 |     
  aarch64    |         p11-kit-0.25.5         | NOK | https://autobuild.buildroot.org/results/e9c21acdbbac3bac61816786bb4c515a800c0b1e | ORPH
    arc      |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/d74a4d6172eed7d8d22efca7d1182f24e2c9b5ed | ORPH
 aarch64_be  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/18ab23859e86e005b633a9c28b61a38f87223279 |     
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/4ad52f19b69e6c3a358c73db08399734143ba825 |     
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/25f98bf6ad7e5ab737c619fe3a7a1cf90ef90a2a |     
 aarch64_be  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/649742a0927cba7fd393509919ddd79f0fcdc262 |     
    mips     |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/4fb430faa0ec9e4f84b5071687ae25ea0dfb5a1c | ORPH
loongarch64  |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/e43389baa331476ee52940a6e385d919dc4a75c5 | ORPH
   mipsel    |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/2d1493d68ee77e09822cc4a97285d29a7bda16d0 |     
 powerpc64   |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/c2a0d257fc6553c7d5bd37545eb020d1c3c3831f |     
   sh4aeb    |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/cac123ee9f3a6df6263b69dce3ac0d535518ec3f |     
   sh4aeb    |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/e3d5c6346f080cf1ff6d7e240a762ad9f73cc500 |     
   sparc     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/e8b042cbebae544b9ff86aae455735ae1bd98de2 | ORPH
    arm      |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/60a863074999af36f52986b67d10927598c8a0f0 | ORPH
 aarch64_be  |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/a4873c2d31c902af97418423593d53fb5d48dccd | ORPH
   mipsel    |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/bcc69f8235174597e2e7d6eccb7f9ca0d4b367d2 | ORPH
microblazeel |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/dd85aed77bf742280ad11dc1aa261b517a2e13ee | ORPH
   x86_64    |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/ba1ea197421412d75375d9cacd322ca670aa83bd |     
loongarch64  |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/59eef632cd7ec24d30791ff6159aa61695bebacd | ORPH
    m68k     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/adc69626860f0c660dfa5f0d40223d73c7ccc043 | ORPH
    or1k     |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/5de7ca193477bf709f880772ad0dc22d65206b3a | ORPH
    or1k     |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/df106f66d5823b18b386a93ef899e22bdd1ff16c | ORPH
    arm      |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/3848410b6307d5320ca2dbcdad82268075581096 |     
  powerpc    |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/53efdf0b4a5ae0c696b2e878ce601b9dd0c4eb1f |     
    sh4a     |            unknown             | NOK | https://autobuild.buildroot.org/results/cc11518d4625d6caf9a790f590e3db514db21ad4 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/1f369be988fee5feac76f5a9737bd8768da2db09 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/8433fac1a2417df5ad6874b7624fcf16a59253d5 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/ceac2fb0da98db852372cd05cab19ecf6ae59975 |     
  riscv32    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/8f05b91ef746dfce05550ebae18035e726a96668 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/b4485a07f7b65e912cd85c5750fb39582562d716 | ORPH
   mipsel    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/f6b95d566af8601e3407c32bcfa7498332da8e0b | ORPH
powerpc64le  |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/fd89378c404a879108e34ca2fd63cf8a75b24fd3 | ORPH
    or1k     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/d50b96a507e2b1dbb7b73368fbc8fd75db2387c3 | ORPH
    or1k     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/bbf7ea1aa71bb709ac255da6ddd96289734cb5f1 | ORPH
   xtensa    |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/51302957a1346b80bef1af8ec4dad63b28a04ed2 |     
   xtensa    |          xl2tp-1.3.18          | NOK | https://autobuild.buildroot.org/results/53127fe83b366ed9e24ee01dd5fb567d51d20296 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 2 
cpuinfo-8a1772a0c5c447df2d1... | 1 
       freeradius-server-3.2.6 | 1 
        liblog4c-localtime-1.0 | 1 
        ltp-testsuite-20250130 | 1 
             parsec-tool-0.7.0 | 1 
uefisettings-f90aed759b9c22... | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/80d8b4bee8414e0087f93acf51c61b1a6fddefe5 | ORPH
    i686     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e1a0efa83b7aecc3c46e94c70678b75404243861 | ORPH
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/6455ba24460ec7429e3cf4acbf75e4a1549b29c5 |     
  aarch64    |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/ef18829112b31d9add419026a0021941b641e12f |     
  powerpc    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/78df7efa60613bbece98e050acac4a264dd521a5 |     
 aarch64_be  |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/ed9eabf04d6805806973ae9f1b4d2421d0b49865 |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/ac06d4ca4913955f424a68e9963ed2d0a03dd918 |     
  aarch64    | uefisettings-f90aed759b9c22... | NOK | https://autobuild.buildroot.org/results/a9a9e909b808e97185a1b2627410f83def1e16a2 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/8c9f83155d09832891463a254ea2c8a2e1205bc7 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                flashrom-1.5.1 | 1 
            gdk-pixbuf-2.42.12 | 1 
           oath-toolkit-2.6.12 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/fb5b1b083096ed6d7a42c52bfb6c2d01e4600a87 |     
    sh4      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/7aa0733bd973994eae53741586a333ddf7b9c82e | ORPH
   sh4aeb    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/3d9c6bb79a7e77292583853efa1ea8fd8022d88a |     


Gitlab CI results for 2025-08-15
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272348 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272373 |      
             asus_tinker-s_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272486 |      
               asus_tinker_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272501 |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272515 |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272524 |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272530 |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272534 |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272726 |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272759 |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272773 |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272837 |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272866 |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272887 |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272898 |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272926 |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272945 |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272989 | ORPH 
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273011 |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273071 |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273088 |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273111 |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273114 |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273136 |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273144 |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273145 |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273147 |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273148 |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273310 |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273666 |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273783 |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273789 |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273805 |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273816 |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273936 |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274018 |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274055 |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274139 |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274147 |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274155 |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026769450 |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026769723 |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026769867 |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026770214 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771001 |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771237 |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771342 |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771387 |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771472 |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771505 |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771581 |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771663 |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771885 |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026772887 |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026774072 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026774105 | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026774180 |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026774254 |      
                    versal_vek280 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026774328 |      
                    versal_vpk180 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026774453 |      
                zynqmp_kria_kd240 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026775013 |      
                zynqmp_kria_kr260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026775072 |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026775160 |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026775285 |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026775458 |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026775685 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
