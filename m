Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5DBCA1016
	for <buildroot@archiver.kernel.org>; Sat,  6 Sep 2025 03:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A53961270;
	Sat,  6 Sep 2025 03:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmlweeB6keYb; Sat,  6 Sep 2025 03:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 214CC61506
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 214CC61506;
	Sat,  6 Sep 2025 03:20:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6522DE0E
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 03:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 573088145A
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 03:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1p4NDhlJGPJy for <buildroot@buildroot.org>;
 Sat,  6 Sep 2025 03:20:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A5EAB81352
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5EAB81352
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5EAB81352
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 03:20:09 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b0449b1b56eso415453166b.1
 for <buildroot@buildroot.org>; Fri, 05 Sep 2025 20:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757128807; x=1757733607;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kg7is5YgRAWliFjABADttDXAMlb+er7eET7z3H4kH+A=;
 b=G04OsT1924ylXsMjbLGqGDIZRIDuLNqoONNqeHGvo5BWkB23Pa4oETVWhvP1P0Cvrq
 ylssn17+n0k3U9mFPubAh+WDbAYS7wRleS2Sza90+2sSHjQjVcbsKjsXN7x16vGGurRt
 P7LJvBbA42ywqapM6gtoAuEbisWUAyEmhptN3tVF/gg4OMlKUxnZ7Nq9bIcaWX3Mh0bs
 g/qNa/BUmTqxNbz+SpxAj6SZ6uusSSJ1kvBsyFaUzMxLckeJmMglRso/IS8uNNqJl+EJ
 bozg8xDAGYiRC57FWuqR0FRUKFPV+4Z8thVT4V4imxeaL3qxSuzn82JLmo8PSMYFfEMB
 tPfg==
X-Gm-Message-State: AOJu0YzcV8Nq2F9zAc738TvcyVuO6xQp4mS5gczQNSqz9nXvJ7nWTsiA
 mghCm11FD7bsD1MxNk+0y7885ykLh3urbHWKoMB3Y73Cty5QPohxVfhwafF2YQ==
X-Gm-Gg: ASbGncvLMMejcQP+l1+rujzdi08TiyWSM3afPpjTs85pX0x5y9GgFEkXxLQTddiC2R+
 0BkBATCFl5/GG3V3LYpck1JGRNSnm2plFHBYMmkA9b8Ouex1rVfINBjZT77tsd6QiraHwWwn3Ix
 Ts4Kd6sQxY4kZaoEN3mIO04WoBRO99FOp1We9JcUUVKLKH2evys+9bt6FMjFPaXUFRT1ZXo2xc5
 VvNHpEzJ31l3fsygDQX+JFYvKILKicI4clMr5r4ZwXAC9UKsNA2yfnCnTas5HRrYAltNuIvSRYh
 XiOpWZX9JkADe5lYANnzH0x1JJdcOKJ2oGmQ7qfuVUaurhl+bxVTJUmTgq5TpOGP3UniTMdkubg
 3mT7Bq20+1iByocY3P1SaolE7PhVXRA==
X-Google-Smtp-Source: AGHT+IGk92QpC9k4AE+M6VSNDr+rmazdMOiDUypv4IAqokmbhfC011g6Su1UG4o1I898XPMnaCocaQ==
X-Received: by 2002:a17:907:9484:b0:afe:d1cb:6327 with SMTP id
 a640c23a62f3a-b04b1736474mr85016866b.48.1757128807264; 
 Fri, 05 Sep 2025 20:20:07 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b041770913fsm1519135266b.107.2025.09.05.20.20.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 20:20:07 -0700 (PDT)
Message-ID: <68bba867.170a0220.1403ab.b6b2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 06 Sep 2025 03:20:06 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757128807; x=1757733607; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Kg7is5YgRAWliFjABADttDXAMlb+er7eET7z3H4kH+A=;
 b=JGr5KiKL+eEOHoH2dYz0zomLwamMI7LQiCiPmFcQje662SXsgiGgiJq0rsxTM0RgFS
 qgcz/kOY1NK0/1RIIZX1qrBe0sUgqkpbUXBr9lUKzn4eoxgMZqEcsfDH9i9Qm80GwBwY
 7TA1NQU0CfUkdOtw95ee6cEPdYORREP9WW+lh9KnRMH0169/Y4st191HOTSokqL6n20B
 3Fvfb5H2UnNKeHUCYpWIabb8qeA25o9KBjRk/p38NB6z/aU8g3Reu/uCqFpY9bVvb7Ca
 EDv6WgHHyH27x0vg7W2dd2hA84Ub/xgEaBxIHqJClQeZDWPHphUUWAVIiErw8AIimlBa
 cRMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JGr5KiKL
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-05
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

Autobuild statistics for 2025-09-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  | 10  |  0  | 16  |
  2025.05.x  |  3  |  4  |  0  |  7  |
    master   | 24  | 96  |  2  | 122 |
     next    |  0  |  1  |  0  |  1  |

Classification of failures by reason for master
-----------------------------------------------

libdbi-drivers-0bfae6c43134... | 5 
                 logsurfer-1.8 | 5 
                   perl-5.40.2 | 5 
          linux-5.10.162-cip24 | 4 
                       unknown | 4 
  gobject-introspection-1.84.0 | 3 
              libselinux-3.8.1 | 3 
          aardvark-dns-v1.16.0 | 2 
                   atop-2.11.0 | 2 
               bctoolbox-4.4.8 | 2 
             berkeleydb-5.3.28 | 2 
                 c-icap-0.5.10 | 2 
             dahdi-linux-3.3.0 | 2 
           dmraid-1.0.0.rc16-3 | 2 
                 host-gdb-14.2 | 2 
                 host-gdb-15.2 | 2 
        host-sentry-cli-2.20.3 | 2 
                  libsvg-0.1.4 | 2 
                 linux-headers | 2 
                    mpir-3.0.0 | 2 
                python3-3.13.7 | 2 
        vulkan-headers-1.4.317 | 2 
               asterisk-22.3.0 | 1 
                 babeld-1.13.1 | 1 
             batman-adv-2024.4 | 1 
                  cairo-1.18.4 | 1 
          chocolate-doom-3.0.1 | 1 
                   cvs-1.12.13 | 1 
             drbd-utils-9.21.4 | 1 
                    dust-1.1.2 | 1 
                 expect-5.45.4 | 1 
               freeipmi-1.6.14 | 1 
       freeradius-server-3.2.6 | 1 
                 gerbera-2.4.1 | 1 
                    git-2.50.1 | 1 
glibc-2.41-70-g1502c248d58c... | 1 
              host-guile-3.0.9 | 1 
    host-llvm-libunwind-20.1.8 | 1 
    host-mender-artifact-4.1.0 | 1 
              host-swipl-9.2.8 | 1 
                  iozone-3.506 | 1 
                jemalloc-5.3.0 | 1 
                lesstif-0.95.2 | 1 
              libgcrypt-1.11.1 | 1 
                 libiconv-1.15 | 1 
              libopenssl-3.5.2 | 1 
                libsolv-0.7.30 | 1 
                  linux-6.16.4 | 1 
                 mbedtls-3.6.4 | 1 
                 netsnmp-5.9.4 | 1 
               openblas-0.3.30 | 1 
                openssh-10.0p1 | 1 
                openswan-3.0.0 | 1 
               postgresql-17.5 | 1 
procrank_linux-21c30ab4514a... | 1 
python-remi-2022.7.27-37-g1... | 1 
                   s6-2.13.1.0 | 1 
             strongswan-5.9.14 | 1 
                 sudo-1.9.17p1 | 1 
             util-linux-2.41.1 | 1 
                wlroots-0.18.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/b2af8e8f7e25fc735a8ddbbf34ef47b7c50ba105 | ORPH
  aarch64    |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/a29e2931db3fe0c80b63103b5ab33a3a404df941 | ORPH
loongarch64  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/6fbd30fb7d92223734693f413575a8b71b456d0b |     
 microblaze  |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/907baba713a2e6648f4e7e6a009158924f31b643 |     
  sparc64    |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/cd6ed2eff4ef32665493bad239636fe91fb7e7f7 |     
loongarch64  |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/a913ff2fe791b08b2550f388417059b31d59467f |     
   x86_64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/40354cb8d95d80b9bc1e3525dd2b55c45ac7820e |     
  mips64el   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/58a2b513aa89811abb72ce0276055d12f38ad095 | ORPH
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a8896c43159d92991eabd3b488c9e9accf58debd | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/b3f3d7b83b111121de74f07537beda9e53e33af0 | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/ba3ad7fe7c407c9e7dfebfae2817540b7d9f00d1 | ORPH
    i686     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/cbab48a151f01880ae94d954bafe758176593704 | ORPH
  sparc64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/3ded37b7c009dc49c52213481d496f0a1ee5ea94 | ORPH
  aarch64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/e1868d718fb83a7dff126ef04fd5fd715adc2913 |     
  sparc64    |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/a28ca50c4647e7756a5def7bdfc89b0da248b87d |     
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1f2c77bd776bf60fa9e2f02edfe8b23f7bdbaabc | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0d6da01c338507f88c0ec5c89d50a04108cae4a9 | ORPH
loongarch64  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b2d62db896f4e3996cae384725d81c885b420ca2 | ORPH
  aarch64    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/68805372aa32035389985a11b3d0c3b2d2f4f790 | ORPH
powerpc64le  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/2df8d73810f27d1dcf0025f566ab9a51e4def62c | ORPH
  mips64el   |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/bc8f8c76546bf63978ee32fee85092410f062e4d |     
powerpc64le  |           dust-1.1.2           | NOK | https://autobuild.buildroot.org/results/021382bdd56f8cbba1d3fb23a061f8da437d1a56 | ORPH
   mipsel    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/bf590f7c8c202a0195667495dffc5667292d94ca | ORPH
   mipsel    |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/cd616b5890015e4b6cf538f64605609fd14ea78b |     
 aarch64_be  |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/a6f3467c04d4322ce1729c321d9a19780f5b1051 |     
 microblaze  |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/6a5a0ae4d5edfea2d144924a30792abeb2130aeb |     
   arceb     |           git-2.50.1           | NOK | https://autobuild.buildroot.org/results/5aa285fb5aba5940c58e8865fdab4dd7a01fc41f |     
   mips64    | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/04f2c28887c9afac888752a52f02cae390901a04 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a784b68b05677d0120a70a3ef3a4dbc1009cd3d0 | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a11a8e627e80037294305a1f5a1b338248451e8b | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/188a286c2db169118f94bbde833d392d8bfb50c5 | ORPH
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/bb831df171906bcac5c7401b8af73e0c7826011d | ORPH
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/e336cf39cfdef1b422938743d721797536e50483 | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/05b6e899e7af1bf339eb8b9e9654ee34b340d520 | ORPH
loongarch64  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/f97bca8b6fd3696903e36da9e9a05cf7c1d2b15f | ORPH
   mips64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/0c5b5b7a8677b009204428b7fbe73e618bad2fb1 |     
  aarch64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/a25e5b608319bbf3a36719c40d0271bb22764988 |     
   s390x     |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/1d26a40ed784abed3fa6567eeb55a422023a251a |     
powerpc64le  |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/5807a7c6a182951c56656c7d6c0aa4b8c3a2f48f |     
    m68k     |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/c633fb22340de3b61db1982c169b14af80d9065d |     
powerpc64le  |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/e5414b92a4dd4d4d7a84acac182622cea5ea2b28 |     
    or1k     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/63d12231d684b91cab56163d98812ffe187a94a3 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/dc6e9a20e1e48ad919a7387bb4b91a3d5063833d |     
  aarch64    |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/90436dc5f5429ca6830bc554e35bea364d1a3b35 | ORPH
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/5fc62df0d8345fef1b91967f9db52113e3033720 |     
  aarch64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/455fa9de1e48ae0287d20201737cbffdde5aecb6 |     
  mips64el   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/d31f580701b0f122165583f45997c408c0992f46 |     
    arm      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/3b7773c04f54f20d10344a3d3234eb9048b0bf3e |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/9386142900524d62393c8c7e3c973a9911253b45 |     
  riscv64    |        libgcrypt-1.11.1        | NOK | https://autobuild.buildroot.org/results/cc69e2e5576b96f459fe1a940d27979d13934931 | ORPH
   sparc     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/c195953094b800d7b5a771f4c7a087fe3c64e726 | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/ee7eed1e597d98994254b72d8c5905899f1ea38f | ORPH
   mips64    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c0b7cf55d568c302374073918de28e8d6a28cdba |     
  mips64el   |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/cd1f4b1eb04f919ccb85a4ed3fe52f5f7b1c49bb |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c382ddb75d42144932443557bfc9de35618b9c57 |     
    sh4a     |         libsolv-0.7.30         | NOK | https://autobuild.buildroot.org/results/0c307bc0ad13543c06f9a62db288f1c7c9b74253 |     
 aarch64_be  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/b199107590512c422ebec826ca8c6bc5bfe66357 |     
   sparc     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/6a28b62773840b36ecd9ab7dafb92c84b45c17c6 |     
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f4996d4a251defecec8b2c8340cf5a5cc3f376b9 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/36d927ebde912bf23045e2750ace8fd724fb8629 | ORPH
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/8abfb34060be63dc69cf2a8779d0c24795c1c828 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/405773fdc64fcc2f774150cf23f234f38124765b | ORPH
 powerpc64   |          linux-6.16.4          | NOK | https://autobuild.buildroot.org/results/71d018003ed302f14c4f3d8b06bee8e3195f887a | ORPH
   x86_64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/6d0d5836d2fe681d650d81aed08ca25c4f4d512e |     
   x86_64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/f57de148814d67aef4eaae0869e34c997ca509e8 |     
  sparc64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/e527b0611c473c1a306f9d491b03df64256b5dbd |     
    m68k     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/19a416a7eef1929572697fc7e967dec4ffc48baf |     
  mips64el   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/6466aaf0d8afec611f5fa40d9e26e6fc5e016b12 |     
   armeb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/7428008934afc76777398df8b3bcc5913fe9b136 |     
loongarch64  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/16a52ccf86d5723b0cab787206b58d87c6c294d5 |     
 aarch64_be  |         mbedtls-3.6.4          | NOK | https://autobuild.buildroot.org/results/e3d038e004e6aa6135e0341ae88e9b4578db9390 |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/888836cfb15c0e14e812427c6abfb679a1a934d5 |     
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/c146aa36f9f11193e8b4eee4fd7d7413389ec074 |     
powerpc64le  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/f206b9d342edf30edd02ad866eaa91f285a44354 | ORPH
  mips64el   |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/596daf1ca158acff9f3ba0ca987318f3292a5895 |     
 powerpc64   |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/188acf33cb7157d69b54943400f61f50f225c87d | ORPH
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/85dbb7fcd166d6d75022f872696e40bf6beb9ea8 | ORPH
  aarch64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/2187f86728bf3cc93236cd498aac1e7c76255cae |     
    arc      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/fcefb7dae2659f6ad4b2826e3a1206315a9e22f4 |     
    sh4a     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/1cdc464b6c61de0d1b1bf43f6e8cd59b56414ee8 |     
  aarch64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f880d2ca122e9efa924ff294d1d2549a0f9c380e |     
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f33d12a2d2c981e6ec53fc13aed1716d6bb7a011 |     
    arc      |        postgresql-17.5         | NOK | https://autobuild.buildroot.org/results/99ae8b53cc2691dc53e552204a1cccb3b2d3b160 |     
   arceb     | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/4127a4797c94ba0d1f619ede42f5104e4aceee43 | ORPH
  mips64el   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/34ab72fa2c83ab30909d7cb5f2461da4996884e9 |     
   sh4eb     |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/2a46f1086bfd01945b402c6e3919a532f708ee7e |     
    sh4a     |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/f16026b9ecd9f9c56f2da508e3755d1c41d2476e |     
microblazeel |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/8ffddc484b95272281c0b4c4585bde21df5bdb43 |     
   armeb     |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/6745d23e82dc1bc4ada8bb5ce23c507ca980443b |     
  mips64el   |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/0697acea01992de37b3f4242d528270d8feff2bd | ORPH
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/841aab3ecd112bd6d835599465cfdbbd3b78ab3a |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/037646a3b6563e7d9a02c095c419db2c7d7c03d8 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/718afde40ffab52d6d567d640505de30572affa1 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/9ecaa97271a738ae22510d35e9cc389bf9f1c4fe |     
  riscv32    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/ff2bf866f0ce3ec5265ff679d09096edc138782a | ORPH
 aarch64_be  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/80ab304aa22c9d9fade17106ecae1937c9c26524 | ORPH
   sparc     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/a537730ad75d7a63bf225f03e8b5a2f2b9222534 | ORPH
  aarch64    |         wlroots-0.18.2         | NOK | https://autobuild.buildroot.org/results/8e411df4db9cb11c9060c4856ea7649b52995ccd |     


Classification of failures by reason for next
---------------------------------------------

                   bash-5.2.37 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/cf54a49175531372f7988c10dd64411b85891088 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              host-rust-1.82.0 | 2 
               bctoolbox-4.4.8 | 1 
                    brltty-6.6 | 1 
        edk2-edk2-stable202411 | 1 
                       jose-14 | 1 
                  libbpf-1.5.0 | 1 
                 linux-6.12.44 | 1 
                   perl-5.40.2 | 1 
              tailscale-1.78.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/1a70a3ed411e482864a91ba5021bfb3545468cd1 | ORPH
    mips     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/9c9479d65d70529261610729c989c6025c1f351d |     
  aarch64    |     edk2-edk2-stable202411     | NOK | https://autobuild.buildroot.org/results/26f0d7e819544117b713f36195d768aad9584298 |     
   armeb     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/e60ea24ea31b88204e0119e2ccf4a413d5d2ac6c |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/7bebffeba51e156c2b451240e244cec6111f3f1d |     
   armeb     |            jose-14             | NOK | https://autobuild.buildroot.org/results/adb77a2fc685c7fc37111b2729bea449a1a4e6d2 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/16398bee7decd269ffad3302d884a3a433d116b0 |     
    mips     |         linux-6.12.44          | NOK | https://autobuild.buildroot.org/results/9bcc6e3c33cc7927df643e618a8281e13f938a58 | ORPH
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f6a7dfc4aa851f6a34f96b8e4a14a00cc1c2bae9 |     
  riscv64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/3be8c43ef66c8420b879efdc10f7e501998f9c8c |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

 docker-credential-gcr-v2.1.26 | 1 
                  ffmpeg-6.1.3 | 1 
 host-softether-4.30-9700-beta | 1 
python-remi-2022.7.27-37-g1... | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    | docker-credential-gcr-v2.1.26  | NOK | https://autobuild.buildroot.org/results/c77d14288ef5c7b78d3d62ff317d98770f5b7b61 | ORPH
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/b5623ae28b17602bee198726da5f3de7a1a8d890 |     
  aarch64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/f124c0a09eb07cce7f3b55121f5988a3d2cdfb94 | ORPH
 microblaze  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/c61249b95bd997808ff984a8c3b9488152de9cd8 |     


Gitlab CI results for 2025-09-05
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/11238021355 |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/11238021436 |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/11238021554 |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11238022000 |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/11238022126 |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/11252564080 |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/11252565198 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11252566624 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
