Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA3ACA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 09:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79D1961312;
	Sun, 24 Aug 2025 09:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iARGmyW5_bfc; Sun, 24 Aug 2025 09:20:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D2B261407
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D2B261407;
	Sun, 24 Aug 2025 09:20:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3E1CCA
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95B8161101
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUlvOCtkRLLw for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 09:19:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D225A60A71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D225A60A71
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D225A60A71
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:19:56 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-afcb7a2befdso489061666b.2
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 02:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756027195; x=1756631995;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ORasQ5LgzuAYuWYP4J5R4kl6uMqifjCC9Fw7rGtP7ks=;
 b=c1wCZ6Nv61LhXMhHK6IPiJCovIEBRaOoGSz7F04/TkIBiwmer94BWunPCdgeRhf9bb
 kUC5mSyTr3BaYQQRh6Uv9fWLo61k7gM2AE+FjIJtRi+hBHWD+QlFiaSGv3xRY555CujN
 KcIzooW3i3o6EEqc42t9+Kb+mUmyvFmg4R6GoJfb5kZftq4FLAIkQlBLLmALdUvhKx8c
 UlNVwAE1RWCu7CTvdJzkDNO63ShpAP7EabslX79b2mUCpbVaNt2AvuvSrQ7v9fshrtd1
 hh6Ytgdr54ZJtwmnmECsU8JxVv0DmF+a+D/HSUeMXOgze8YiRs5Sb0HG4cfvTPGuV3XH
 e65w==
X-Gm-Message-State: AOJu0YxxU58eqjD0/5QiIsUtlpWjsZEb9jj1T5g212kEYgaeN/q62R1M
 0dYUkeg3W/l3+0Ey/mR1QGoXOURkZuP2dtJQhvud2rP1Xym4+TvO/wlfdcNtMQ==
X-Gm-Gg: ASbGncssb85JJdIaDbEbRkG8IvhXdarWQn333BT5mSTrSVmbRmipYpYn0Ys4DbI0KsD
 TFrYv+pd+JsA0T4ZXQpaJR/3y/UqazYEAb9+BJHyfitnTbbqNTbLwSaOsWR+LjFcBh2iBalaWho
 RubnELAFmrghvqA6xmcQJT+gG3KqSYfXY+sKRKAOFOp1nPW4rtEP068bRoPB14PwMetfDcWR5CD
 snl5GnMxjB/GqgUhhQG81VHDyg16zIgZqDuFcU5j+3/gcXDdW1DTqDhRVisSWxUB/E0p9aqMVov
 i5i9k6KQy0qSgboIC8P3jf6Okansh5ysuB3b87j29PUkv0XIldC4+tQA6N2omkkpGTRmcjYwTL/
 b/9rhpBGcLmMDMoOUW9QUKZMvnktGZ744bY9EvkuBtVrDp5MJfrI=
X-Google-Smtp-Source: AGHT+IEIeDpCkvra2CBdaJSusFux2OKjlkrwHdxBlkoypnVGPI6YPu53owlK/3YCfpzi0DRxsvZbDA==
X-Received: by 2002:a17:907:1c93:b0:af9:d80f:645d with SMTP id
 a640c23a62f3a-afe29793340mr771712566b.57.1756027194382; 
 Sun, 24 Aug 2025 02:19:54 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe4930fb2esm332654466b.77.2025.08.24.02.19.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 02:19:54 -0700 (PDT)
Message-ID: <68aad93a.170a0220.4d4c5.a687@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 24 Aug 2025 09:19:54 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756027195; x=1756631995; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ORasQ5LgzuAYuWYP4J5R4kl6uMqifjCC9Fw7rGtP7ks=;
 b=OGi9oVSNb4byu+GdMBhxxjCeSTHwg7unSZ7iXqeZXtUzx7CL9SD4jk23pQ9wtDN+F5
 tKgbh4SvltxC5V0TkOk2yG73Fnz0PMGt4XE8/j6oJC0tbhcJy0G9Huf9/o4Y/66Bk7V/
 U7icDnWU/0BVpDnnKlS0XCtp3gk0tqfokeXycLecaJduq14IUnwotzq6n+KT0r07zzYB
 e5TzlP/X5GWdbROYiNYofZJNkQOKA+r8iAJWZBbeouq3NVCOaXUxQWgrhmqx4DGjGwnB
 rtIf+YWApED8HN8Bh7f5+flq3UjNRjPRW9rmF9yMCLt3vHI8tuL4dmLxeWLJh+bBCWCf
 VHIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OGi9oVSN
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-23
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

Autobuild statistics for 2025-08-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  |  7  |  0  | 14  |
  2025.05.x  |  4  |  3  |  0  |  7  |
    master   | 16  | 115 |  0  | 131 |
     next    |  0  |  9  |  0  |  9  |

Classification of failures by reason for master
-----------------------------------------------

                    linux-6.16 | 7 
                   perl-5.40.2 | 6 
host-binutils-arc-2024.12-r... | 5 
libsvgtiny-ea9d99fc8b231c22... | 5 
                 host-gdb-15.2 | 4 
                   cvs-1.12.13 | 3 
                 host-gdb-14.2 | 3 
         linux-headers-5.4.296 | 3 
            python-yarl-1.18.3 | 3 
                       unknown | 3 
                 apitrace-10.0 | 2 
               bctoolbox-4.4.8 | 2 
               dvbsnoop-1.4.50 | 2 
  gobject-introspection-1.84.0 | 2 
    host-llvm-libunwind-20.1.8 | 2 
               host-vde2-2.3.3 | 2 
libdbi-drivers-0bfae6c43134... | 2 
                 libgee-0.20.6 | 2 
        liblog4c-localtime-1.0 | 2 
                 logsurfer-1.8 | 2 
                   thttpd-2.29 | 2 
             18xx-ti-utils-8.8 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
                   atop-2.11.0 | 1 
             batman-adv-2024.4 | 1 
             berkeleydb-5.3.28 | 1 
brcm-patchram-plus-15bd6638... | 1 
                 c-icap-0.5.10 | 1 
          chocolate-doom-3.0.1 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                     crun-1.22 | 1 
                     dtach-0.9 | 1 
                espflash-4.0.1 | 1 
              fluent-bit-4.0.3 | 1 
                    gpm-1.20.7 | 1 
                     gzip-1.14 | 1 
          host-binutils-2.43.1 | 1 
         host-gcc-final-13.4.0 | 1 
    host-mender-artifact-4.1.0 | 1 
                   iotools-1.8 | 1 
                  iozone-3.506 | 1 
                       jose-14 | 1 
                lesstif-0.95.2 | 1 
                 libbson-1.9.5 | 1 
libdill-32d0e8b733416208e04... | 1 
                libglvnd-1.4.0 | 1 
             libgphoto2-2.5.27 | 1 
                liboauth-1.0.3 | 1 
     libphidget-2.1.9.20190409 | 1 
              libselinux-3.8.1 | 1 
             libstrophe-0.13.1 | 1 
          linux-5.10.162-cip24 | 1 
  linux-headers-5.10.162-cip24 | 1 
        linux-headers-5.15.189 | 1 
             lirc-tools-0.10.2 | 1 
               lrzsz-0.12.21rc | 1 
                 netsnmp-5.9.4 | 1 
            netstat-nat-1.4.10 | 1 
                openssh-10.0p1 | 1 
                p11-kit-0.25.5 | 1 
      passt-2025_06_11.0293c6f | 1 
                     pound-4.8 | 1 
         python-web2py-v3.0.11 | 1 
rtl8821au-d0a49ba401a8661ef... | 1 
                 rtptools-1.22 | 1 
                    sdl-1.2.15 | 1 
                 systemd-257.7 | 1 
toolchain-external-bootlin-... | 1 
            vorbis-tools-1.4.3 | 1 
        vulkan-headers-1.4.317 | 1 
                 weston-14.0.1 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/1f69a1d6d8c8b4107c7396ccc0dbdf4092530676 |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | https://autobuild.buildroot.org/results/318070f8b44a24d876df49c010ef3912f084865c | ORPH
 powerpc64   |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/16ace9feb4a1478878120eebe0eac3653c2e9a12 |     
   x86_64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/9949fb13c2ec118f65768ed39808c6ca388fdb4b |     
microblazeel |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/4bea124f7d2473d6a4b3cf50545b778f9e61a64e |     
microblazeel |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/c8f90625541c24f1e3d48c24472e8cfef20246dd |     
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/58d6cb5c2e8d2b441808e12e53339d23716891bf | ORPH
   mips64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/aa40c2b462c9c0f7dccbf77f11e75efcc61d5e86 | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/45d7b42a73911f8c4510375aed3eac83dfbbf5bb | ORPH
    or1k     | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/14468f990d9ec2f22cce9d01463bebc016fc5fe8 |     
    m68k     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/eed3ed84c374b1fbd0810867ee5d73d9325fda59 | ORPH
 microblaze  |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/437228662f76d7e5c64d98e565de2a5c5881a495 |     
  aarch64    | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/0dedc2f52cca1c2badb8a31f6e540bcf8e4b4c69 |     
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/634e7acca0db0d39994eb883b85252c98f3fa2a5 |     
  riscv32    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/52116f82581c264d984ed05196271bc07b35cdf7 | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/3596ad0a43bb03425ab204956ddbf597d2ba9492 | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/348628aac622c6751d638f43d7ca1f570860a5ff | ORPH
  mips64el   |           dtach-0.9            | NOK | https://autobuild.buildroot.org/results/a6a86729f3b808e0e9b3169feec881e498b81ed0 |     
   mips64    |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/a1a1b31610f1f5d37b690477bbea16ccf0db0890 |     
  sparc64    |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/bc3d68194bee459ade95ce76d39137fa295866b1 |     
powerpc64le  |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/99b9c89c1fa7c68fd569fcca7739824f533ab5e5 |     
    i586     |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/84452a667dcde83beca3cf6efdbbaa92ae88a0c5 |     
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/9a17617dd23d8e0734f519b947dd2a1a3d5da94e | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/56d0edddf78e14846c89378d96ed3f415d6b17cb | ORPH
    sh4a     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/ff0bc5c59e1a3c7c37d8ba9a28bb6f429ab83774 |     
    i586     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/c2ef0ac9b9abecb0877257dbec80b5393c4e1074 | ORPH
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8c354004107e38752401323c9d93e03190992c18 |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/d1ae7b31fef8e9f2e9fdd7dbc428e0c08c51912b |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/c47d1bb2fd649b62bed203c8b161eb0a17e9ae7a |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/e0e3f772ebe95c37642a6213aa2344dc1cac4b7f |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/2af449bddd46ee8269709cf2bf33e23176614295 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/f74d823c4af79656e02c8e396c8dbdd8d884bffb |     
    i686     |     host-gcc-final-13.4.0      | NOK | https://autobuild.buildroot.org/results/55ac7dfb2b60c3abb2bbcc5e60a930006d637682 |     
   sparc     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c71f8b4711310bbffd9bcae9bbda306b984e3031 | ORPH
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/fd37d86451313f5378fd0696509f72591e093bff | ORPH
  riscv32    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/bb01fb4bc69df2ae8bcff011129e9c42c0218306 | ORPH
loongarch64  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/a0cbcc4cdfe39af3f9718f2a7f4b4d84546d6160 | ORPH
   armeb     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/451f1df5fb9cdfe2020037b025a53881f046d072 | ORPH
 powerpc64   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/e707f654ed7f5f9d2efdc90a69066053e992d96b | ORPH
loongarch64  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/ea95d28dcd109df202e73f4cd43fba8aa73f6a22 | ORPH
   x86_64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/34a66767e131a781130a6468bce39d7e3d69d902 |     
   armeb     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/bad5d4b5a72c7381cc94e492fda0c1c5316aa09c |     
  mips64el   |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/39b2b56f1d85460920c1667458f775f376a230bb |     
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/29d3bcf1fbac884c7322dc7839f842c8e6545f17 | ORPH
    mips     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/f37c885e2c46c44babf4d8084aad89fd45cfcebb | ORPH
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/e464a62de6ec94852cee8d93ffff31c102f2bc68 |     
  mips64el   |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/695a009c2b34376cc5876fb434704bfa702a6f68 |     
    arm      |            jose-14             | NOK | https://autobuild.buildroot.org/results/56e4da8d144d3c1ee60cc03a04bd0465bed010f7 |     
   s390x     |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/93b0c2cc42e29e2b62501a113ad5bc4f81a9fc57 | ORPH
    mips     |         libbson-1.9.5          | NOK | https://autobuild.buildroot.org/results/3097dbca71529db9f45dee3346dcec0302047f86 |     
powerpc64le  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/29fdd52cc5c8292dcc64fee460f30881f1fa41c6 |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/1ef2db8359cbbd92933191cd575d16d26166fe9e |     
microblazeel | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/72353a2c3f77cb14d2e31eb194202c906b85b37a |     
    i586     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/58898e78373536ea1a8bdf41b2aa80409e86680b |     
   s390x     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/43a621bde8be10407deac2032f3fc7a965ef6563 |     
    mips     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/6a629fa9c51e0deb35106aba720731533abe26d4 | ORPH
   sparc     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/d87ef3fb3b2cbee3f640117b54bd5a043cc00871 | ORPH
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/37e092803a6ca393570e81b2a56a8b2bb6d083de |     
    m68k     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/fadf459f870e90a2a44660d294f6318da52e07f3 |     
    m68k     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/9ffd88ffda851b485ce54cf4da220038fd7cc8a8 | ORPH
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e0ee652030ce0905dd6260c6d793711abff66d81 |     
    sh4      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/cf1361ad94eea0e01e52d182845570bd19693c69 |     
   x86_64    |       libstrophe-0.13.1        | NOK | https://autobuild.buildroot.org/results/0c4f7b4dd441489dbb81c5ae04e2322d7ecbe83c |     
   sh4eb     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/91bbe4bd773062a45db9a1350038d7dc4c1f68bc | ORPH
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/930dfcd93fd05988b2787b3ae245bb9ab10de9d3 | ORPH
   mipsel    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/a8a5323cb055621c4ca928bc0ba4b22d4fb22fd9 | ORPH
    or1k     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/ebb50699401a39da57f619d4fd5078793f2a86ec | ORPH
   s390x     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/32d8033f12e97dcad301c19790a172253f814e24 | ORPH
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/56ab8255d88b874e3582e2566be9beec4a0d209e | ORPH
    sh4a     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/81481a76ef4993a100f80301347ff9613251f377 | ORPH
   sh4aeb    |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/79171c7f952474bd5aab26b7d8833b64c334a731 | ORPH
    m68k     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/45da1538457b18671fa18efe3e1aa57a15561370 | ORPH
 powerpc64   |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/b262fc6f67a9fed55faffcdd580d89f4664e1e16 | ORPH
  mips64el   |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/5ded9bc3399af61d7b52c5f893acfe341953c4a9 | ORPH
   s390x     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/b24983fd91f408de56479b7d7d57fc9fd3333d7d | ORPH
  mips64el   |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/3bcc674ea5a7cdf031200b0cd2f9f71400ba391c | ORPH
loongarch64  |  linux-headers-5.10.162-cip24  | NOK | https://autobuild.buildroot.org/results/eebcf605f8f868a668960152f30c08f700405a4d | ORPH
loongarch64  |     linux-headers-5.15.189     | NOK | https://autobuild.buildroot.org/results/67f9fd15e3a1936b25f8dd48a92499552548ccbc | ORPH
loongarch64  |     linux-headers-5.4.296      | NOK | https://autobuild.buildroot.org/results/1c6a49984179ade1880a9888895efcc0a0dc5d6d | ORPH
loongarch64  |     linux-headers-5.4.296      | NOK | https://autobuild.buildroot.org/results/6088f97ae508696f63e61f67e82d49b5519476bd | ORPH
loongarch64  |     linux-headers-5.4.296      | NOK | https://autobuild.buildroot.org/results/2a28e37ee8500d165137c14945000770346e9541 | ORPH
    or1k     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/13fbf73c1e19089a4c5e0fd1e77f1f7a4c758a52 | ORPH
   x86_64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/31bd90327001ae829207d432210200a77c6253bc |     
 microblaze  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/99f48c2b6709b8aefa4f511db9ca745c8cda2900 |     
  aarch64    |        lrzsz-0.12.21rc         | NOK | https://autobuild.buildroot.org/results/aa77e5a59dd359d52a259ff7c6268453e253c3b3 | ORPH
powerpc64le  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/61c2d880e03d9bb1e8712050bd7333b8ac5a4d02 | ORPH
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/21ff97d6fded3b4db7b555632273bcd1b665b194 | ORPH
 powerpc64   |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/48637ddbe30b873bf3c0e22231222b322637dbf3 | ORPH
    i686     |         p11-kit-0.25.5         | NOK | https://autobuild.buildroot.org/results/a7acbc44429f508ce282f3ae0b17e43918330bd1 | ORPH
   sh4aeb    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/fc88294e6427740bf947c625e5f2a3ecbea6d54a | ORPH
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/d38ca94ded84f2d20168ef5c2d6713c29e9b457c |     
  aarch64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/423f544c7c7e1a7eddb0630530db0922d76cddfb |     
   x86_64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/6d4302e0113e24d6716a487cdf9af6502031ea08 |     
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f68f1edfa1cdffab72fc3f4bcfcbd21705b49687 |     
   mipsel    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/a1ee0461f53e0eb8418ab3ece7b8e3118d36f482 |     
loongarch64  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/d3ca2ea164f8407341aea5f836bbb50fa47bebae |     
    m68k     |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/5a5132ffbe9536ffa2cc99813dc2bfd16d3502f1 | ORPH
 microblaze  |     python-web2py-v3.0.11      | NOK | https://autobuild.buildroot.org/results/499abb3fb9e902f2591d0803d1094d23f073fe0d |     
   s390x     |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/da1a1995802d600a301af9e08ff6105fda6fa138 |     
    mips     |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/b1eae5f6a310fab825fbe58597a8a418d86a690a |     
   mipsel    |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/206a1c949eba00517197773ab79e1c1057d59cbd |     
loongarch64  | rtl8821au-d0a49ba401a8661ef... | NOK | https://autobuild.buildroot.org/results/588b834b133abfc983945beef37f7f2b0df71c5f |     
   mipsel    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/caa719ea24c9beae50881d06f009f9c0d20ec481 | ORPH
   x86_64    |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/903a8d7e0039c5b2c27ceba4a2f43fb5f522e18b | ORPH
   mipsel    |         systemd-257.7          | NOK | https://autobuild.buildroot.org/results/73b2c57326599ee6ce5bf29817d0ac175b591f0c |     
   mipsel    |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/1959e6685d9ff62e83ef8a1c2d122f063d893e4b | ORPH
microblazeel |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/69d71d7a74075f95033c656ea4408c86d493a0d6 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/821ce449931114840758fb8cd8eb9531ece29c5d | ORPH
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/039f580ed47edddd6e1f1b03e35bf22d2f31a037 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/0a7f0015a6c9b72d364d34cd6293478f55fac558 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/9ab0b3ca978abf01b5d51274c6155009228b80e7 |     
  aarch64    |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/27222e70e02b3f19d1c6d0ee652c5c98db1fc70f | ORPH
   arceb     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/d1f3ffce63297ff045ff84dcd2970951e52fce01 | ORPH
   mipsel    |         weston-14.0.1          | NOK | https://autobuild.buildroot.org/results/4657c953f89fe6d3d6988f04a326161875625992 |     
 powerpc64   |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/46dcd287c62d863e456000a2bb242ad2cabc8430 | ORPH


Classification of failures by reason for next
---------------------------------------------

                 host-gdb-15.2 | 2 
amazon-ecr-credential-helpe... | 1 
                     crun-1.22 | 1 
libdbi-drivers-0bfae6c43134... | 1 
             libgphoto2-2.5.27 | 1 
                 libjcat-0.2.3 | 1 
               pulseaudio-17.0 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/13e67e3d2ce3bc030f851db2ce72562d0665aa37 | ORPH
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/4a2343e1ae425729a98ef915ed5dec8b5ed6d4fe |     
 aarch64_be  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/5bf00711115727aad14e5c37dcbe5268dd2f9b84 | ORPH
powerpc64le  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/faf223dccb291c906f17347a638315a3176a53c8 | ORPH
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/f641bd48540cc32bb8b770f73dbded86f0b166e5 |     
   mips64    |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/3329c8f8973053dc8084f61e6042d9a2bb5f9975 | ORPH
   s390x     |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/94b2943481c1676d461a48ee9e4a822e2c15a2dc |     
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/47335d130e5d9899a7bec9911cdd2e78ab26d0ed | ORPH
    i686     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/2e9e829a544a9cbd7abb103e081f154a472c60df |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           at-spi2-core-2.50.0 | 2 
  ffmpeg-n6.1.2-27-ge16ff06adb | 1 
          host-binutils-2.43.1 | 1 
                liboauth-1.0.3 | 1 
                 mdevd-0.1.6.4 | 1 
             parsec-tool-0.7.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/4e9f985a9e4b1fc955b506bb300778d82d6d0f73 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/c421a69f2cf92bb700c40beb7f514f509a981a22 |     
    arc      |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/98b790b49bd7105ab958fb48034af52c9dbf081a |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/944e1285ca6b6cb6ed54f88ef12abcbda7a67769 |     
    arm      |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/89e46d7e0d600247616ce23a5d7fa23e8ffc6fad | ORPH
   mipsel    |         mdevd-0.1.6.4          | NOK | https://autobuild.buildroot.org/results/15c14233aa89acf51fd3ddcd79faf90fbc0e5b32 |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/0ae512028c05c39493aed86939f2eb2b324cbbe3 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                flashrom-1.5.1 | 1 
              libopenssl-3.5.2 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/1b7081b2e4dfdbe5d7150fb99a968c1b0c346f0a | ORPH
    mips     |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/a382294e5444402633ba3cb376c9fc912610a5c7 |     
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/b1a881c8b8bdd1407ed52f0fe060a641455e511c | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
