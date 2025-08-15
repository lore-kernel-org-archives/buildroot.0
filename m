Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24576CA0ED1
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 03:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9787E40923;
	Fri, 15 Aug 2025 03:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DNFRxL08hds; Fri, 15 Aug 2025 03:14:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D6E540925
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D6E540925;
	Fri, 15 Aug 2025 03:14:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 373271BA
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 03:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 296C960B51
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 03:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vc3J2FRajg1H for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 03:14:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 20C5A60B48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20C5A60B48
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20C5A60B48
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 03:14:27 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb61f6044so284409566b.0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755227666; x=1755832466;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m3hG1QMr8UDU9QvNPEUXDUGXni5e8NMAXiwkS0Jfs68=;
 b=iqRTkn25+7833p/ljhqU/wV6D+o/BavybYKZ6TEnPUTbabmZBB70mMcWI/F77hE7me
 wOdSzfZhsAvukbjkgtCqzn5GOATuH0FUgU2XBAw9kjHDpu+sinNVeohBpR2cLDmy3ISm
 cGsiCMk+tpK9VxMjzyriLG4J2Zz0LhQeoNe8ReztTOstu8ReeafacbCj4cEr76ZKKy/k
 tW1K1hqSUQ2jjDV2YuLLspqawWhkhuE+CgAiSU4H+8iWulMfsU8oSxMAYDF7zRS9gkF7
 3yDnMtF1JKcfSMBDeaC0OWXdVUCLOoZ/sHzNJzXgsNPHlAlnV5W2DNffrjLxvazssHJm
 lSxQ==
X-Gm-Message-State: AOJu0YwHkyXpNdeBOe3meWXVXB16yCmbHv6smLSiWAe1w4NmIuO3MQR0
 s5ijnKHXuM4+s9hF+iKawzi5DM8pz9rdU78t6xNVs8/kh6lY6oEQ2YHMqakkmQ==
X-Gm-Gg: ASbGncsqs/BI5G4E3JEfSUyGXoBE8DDxbpT4As9ymY1kAMdCyGix8kE5Pjn203Aydoq
 fNTNFqnChTp7oYWKl0fylM1nQkoeOiGVuFN1UPLOVUNnsoGZYpZVTcAPZATnETtve4lUlScWCsW
 arJ6VDdUKI9jXs4pWAPtlY43uN57mMBOqTC6nuGP8QwmC0dlAAbVqwVeLZYYx4rYk5wFrtbb2Jt
 RzGF78gHCQED0neLkE/rGeTnEdSNd7QcNcbjhFjZZ4JLw86TytmrOHUVKNQ5dzJlllf+HoDSjtH
 ohKYkYp0dfMKJycNWg2L88ZCayvYWsJusSzL1FLBPtZPNgaEggU5B0HZAublVo585xiaYwgeuH4
 iZBrEOMqQ9TBC0ZHs9BkL3l1Dvg==
X-Google-Smtp-Source: AGHT+IFnCi6nwwSYXBTnu4m/q66mxZ5gn4lOry0FNP5mMbaID1N4ne1MGQUgtB4Uk6iH1bjEgBysDw==
X-Received: by 2002:a17:907:3faa:b0:af9:479b:8c80 with SMTP id
 a640c23a62f3a-afcbd5cc6b6mr473275066b.4.1755227665720; 
 Thu, 14 Aug 2025 20:14:25 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72da1sm26135866b.51.2025.08.14.20.14.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 20:14:25 -0700 (PDT)
Message-ID: <689ea611.170a0220.19e6d8.0431@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 15 Aug 2025 03:14:25 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755227666; x=1755832466; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=m3hG1QMr8UDU9QvNPEUXDUGXni5e8NMAXiwkS0Jfs68=;
 b=XzlZxSdCa04k6o3AyBSHkaqsNQF/rBhG5zPV5NUJRE3YTxl1u3+x6Dehv8V9RwZUFl
 2dabScbYpHME9yAgronoy/3D3CSj2mms/xQkTK5Jq/fhm2HDTlO8VSQsCPYsNMcRqPQc
 P+tbvrg5k/Uwhva6ZAMCQaonC5vMri4Pk94MP5OC8+tMn4KbMJem2HejcoEn0g9NIL85
 Zgt+IgdWNzEqROLeyx3kaEGgHnvzEJLMFyoguvZZkuz1CrHn6y8gL4FvIA7d1ghZKPzu
 lGDWaGpBw3ZTdX4L4ZhmPVk14EKO5v3obNVKy3cRGwY0wORB4hSAYRry49AduYG7XcSo
 BOxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XzlZxSdC
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-14
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

Autobuild statistics for 2025-08-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  3  |  0  |  5  |
  2025.05.x  |  7  |  6  |  0  | 13  |
    master   | 21  | 147 |  2  | 170 |

Classification of failures by reason for master
-----------------------------------------------

    host-gcc-bare-metal-15.1.0 | 17
host-binutils-arc-2024.12-r... | 5 
libdbi-drivers-0bfae6c43134... | 5 
                 logsurfer-1.8 | 5 
                   bash-5.2.37 | 4 
                       unknown | 4 
                flashrom-1.5.1 | 3 
               host-vde2-2.3.3 | 3 
                 libgee-0.20.6 | 3 
             libgphoto2-2.5.27 | 3 
              libopenssl-3.5.2 | 3 
              libselinux-3.8.1 | 3 
                    linux-6.16 | 3 
                    mpir-3.0.0 | 3 
            python-yarl-1.18.3 | 3 
                setserial-2.17 | 3 
                   avrdude-8.0 | 2 
brcm-patchram-plus-15bd6638... | 2 
                   cvs-1.12.13 | 2 
             dahdi-linux-3.3.0 | 2 
              fluent-bit-4.0.3 | 2 
           ghostscript-10.05.1 | 2 
                 host-gdb-15.2 | 2 
              host-guile-3.0.9 | 2 
                  iozone-3.506 | 2 
                 linux-headers | 2 
                   thttpd-2.29 | 2 
                    wipe-2.3.1 | 2 
               bctoolbox-4.4.8 | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
                    brltty-6.6 | 1 
                 c-icap-0.5.10 | 1 
                 coreutils-9.5 | 1 
                     crun-1.22 | 1 
           dmraid-1.0.0.rc16-3 | 1 
             docker-cli-28.3.2 | 1 
                  dpdk-24.11.1 | 1 
                  dump1090-9.0 | 1 
               dvdrw-tools-7.1 | 1 
               ebtables-2.0.11 | 1 
                 expect-5.45.4 | 1 
  gobject-introspection-1.84.0 | 1 
                    gpm-1.20.7 | 1 
                   gvfs-1.57.2 | 1 
host-am335x-pru-package-5f3... | 1 
            host-binutils-2.42 | 1 
    host-llvm-libunwind-20.1.8 | 1 
       host-nodejs-src-22.15.1 | 1 
 host-softether-4.30-9700-beta | 1 
                       jose-14 | 1 
                    kmon-1.7.1 | 1 
                 lcdproc-0.5.9 | 1 
                  ledmon-1.0.0 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                libglvnd-1.4.0 | 1 
               libgtk2-2.24.33 | 1 
        liblog4c-localtime-1.0 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libsvg-0.1.4 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
         linux-headers-5.4.296 | 1 
        ltp-testsuite-20250530 | 1 
mjpg-streamer-v1.0.0-1-g310... | 1 
            netstat-nat-1.4.10 | 1 
           oath-toolkit-2.6.12 | 1 
                openocd-0.12.0 | 1 
                openssh-10.0p1 | 1 
                openswan-3.0.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                pipewire-1.2.8 | 1 
                     pound-4.8 | 1 
rtl8812au-aircrack-ng-c3fb8... | 1 
                 siproxd-0.8.3 | 1 
              skalibs-2.14.3.0 | 1 
      softether-4.30-9700-beta | 1 
       sp-oops-extract-0.0.7-1 | 1 
          sphinxbase-5prealpha | 1 
                    sslh-2.0.1 | 1 
    start-stop-daemon-1.20.7.1 | 1 
                 sudo-1.9.17p1 | 1 
              tinyssh-20240101 | 1 
        vulkan-headers-1.4.317 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/2b8122135351719f78738df119b3f25f2e36c4d1 |     
   x86_64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/ad09aa5fa2db8c4bf27c468a4d6e00c36a4052fb |     
    arm      |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/4dc59d27f85e6dcce198857ce6a88c43a49e68d1 | ORPH
 microblaze  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/f9e934e83ef1e8826a61b603a39bdac9febe1840 | ORPH
   armeb     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/01f695e38c7fc26ecff1628274d4b86437d99321 | ORPH
   s390x     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/0c0aea6653d25c4dae58e9011ffc80a2450fb13b | ORPH
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e76c3a20ac1d5ab4ad821c98797ec0b0e6c632ab | ORPH
   s390x     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/c178cb8edfa188f9cd33dd1f39cc515e5e51fa70 |     
   sh4eb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/677e9f96f4c922a946dd037787874155db93ea80 | ORPH
   sparc     | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/48646e46763e5f17f3ece824525fa30dc52a88d9 |     
microblazeel | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/2e79c49bbeb2ea4a76d291ad350a1dfa10516453 |     
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/0a554fda877273edcf7586c627644ea2bbd4beb5 |     
   mipsel    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/959e111d0edff088bb9a946a79d4013e43581205 | ORPH
  aarch64    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/39020e39def4ee8ffacec6fe4abeda19bc964c27 | ORPH
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/15c3516483245887572ac04e00884e05224414f8 |     
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/373797e9ca33c380a94e66b709fb44e883a67156 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/596b2e65a7914da90e39716e1c9f7f891c240def | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/aa0a3704b2b9a30e6e5384d5114e5f413681fb90 | ORPH
    mips     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8a7267c8c08cf3877e16faf952f0f46ce86162eb | ORPH
  aarch64    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/eabdfa24aa344641391b0af2cb9d7efd1b68c104 | ORPH
    arm      |       docker-cli-28.3.2        | NOK | https://autobuild.buildroot.org/results/78c8571e897d316d97c34796754ca1c4c10e5fbb |     
   x86_64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/f1e01a3c2ee54eaf79654618870ac149e08780f3 |     
 microblaze  |          dump1090-9.0          | NOK | https://autobuild.buildroot.org/results/752e5d3df2179b487f4e5963efdc0aeaec07b81f |     
    or1k     |        dvdrw-tools-7.1         | NOK | https://autobuild.buildroot.org/results/d089f5fef402a4258b6ac20e457878bb4bed3b37 |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/3cd8d5e542eada415218101756acd174d4c081a1 |     
    or1k     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/299678dc527eae1a63382e11aba8cfaa66c69cf0 | ORPH
  aarch64    |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/3a860ea62252497ebd2d05c1c82def1583c103f7 |     
  mips64el   |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/b7bf15be3415aa80adbdb043116910c45e09ac46 |     
  aarch64    |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/3600a9b7f323b4610ac67feb7171c0e10b6383d7 |     
   xtensa    |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/770e9106a0c92f02e0f699505e69b35ac0e6cd41 |     
loongarch64  |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/3c935a64c81e074d6525f601924ef314aed1253b |     
 powerpc64   |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/6873c4cc8d2566d8ed695ea7270a5fa2cba442e1 |     
   armeb     |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/16337823aebc296c62ec5822896684cb157af1b8 |     
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/581872ac3582fdbd06cbb56f6137838ab69ecfec | ORPH
   x86_64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/2d6df3ddb3c782f1b2df2b6e4ef56e7a39f758e8 |     
powerpc64le  |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/22274e57a8a508de91ced32a8d14c15e086b4e98 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/ba74dbf4075271e7e74ced47bb09c2897da7983a |     
  aarch64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b3b9691d73d315b02120eaebbcb94adec395ce7d |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/bf0b772a05b6d9e63a31b5d54a9ba498f99812df |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/331286f8872bdaa6d9649166a347deadab84bdf0 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/23e923e7ef2bda25cb3b2289f20a127d1c5fa572 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/39e7f778799a8312437250d00b16106252f98696 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/904ea1687b8ec6a9f3af4b1dfe834e8d0833cd62 |     
    arc      |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/cced466640ff7869c504f1638ee5bd9c6b55e46e |     
   x86_64    |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/20dd6332ada5c74e98909b472c1ffc8ae9118ad5 |     
    arc      |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/a13765f11c80f868050d0d442130bb66604409b8 |     
  riscv64    |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/d109fcedd96b10b24962ecc6a3b07396bd68e8b9 |     
 aarch64_be  |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/1d5c8c11d95f9ab2ea0c8ae300b16b9c7c69f952 |     
   mipsel    |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/3bcc1b04f3a6d0ef3f0424b1df77dbccc13b276e |     
    or1k     |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/6ac9280d739f9ee4cd100f1041f2835092522de5 |     
   arceb     |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/a3165ec275ac74828b0cae391e11bae4c23c9408 |     
loongarch64  |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/56dfba0f209ec813a60afea0bcafc71f45fc9afd |     
 powerpc64   |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/fb280501b24c8e0d6b43f8e97fb430a3a807a365 |     
   sparc     |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/7779bb9bdc884a16d8ed798468eb9a718d1d1f1d |     
    or1k     |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/5e93eeba760228c3299a0b2b025300c7fb4ee53d |     
   xtensa    |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/fcc3cafd63ab2e77016e336b1b3ebcac8cfbce20 |     
  aarch64    |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/fdd5e2b2f56cbbdb442cea1b52482d06239242af |     
  powerpc    |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/c13c4613cacae0844f1f97a0e8b8c3c52476e1d1 |     
    sh4a     |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/fa37338d021cf70290739b3974f9f0760fb9b973 |     
 aarch64_be  |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/bad40bc29052f22e218f41cfa7aadfbb32565db6 |     
powerpc64le  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/df6fd8b9023895f6498dca6797e401b74466a2b1 | ORPH
    mips     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/2dc1977b2c25351a8eb1699a9aef5e8493a780f9 | ORPH
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/efcd3c120ff11cddee7bdea5a4f588e39da82403 |     
  powerpc    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/2c41e155e7e3a01620f4fef1d956b8b620261c1c |     
    i686     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/d0345338c4ba2d3e851f9cfef2ee6949bdc58932 |     
   s390x     |    host-nodejs-src-22.15.1     | NOK | https://autobuild.buildroot.org/results/9285391a994a4d4b4e959ca38af55c2478a8c963 |     
loongarch64  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/64ea21b2d7f6f6fb8ec5fdb0c29b2b9bf345212b | ORPH
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/5457cb7a7d703f870910f886a594f0d7ffb8f237 | ORPH
    sh4a     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/61d785c8266f762331ab9a9be4ccf99d4b850688 | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/25673223834d66e70bf00713c7fbb40ceac63827 | ORPH
   s390x     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/eb4719d70cd604d820f4ed8d3e5331c45a70521e |     
    m68k     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/c7e75348981199ef83a84bec24769ff015cacb2c |     
   sparc     |            jose-14             | NOK | https://autobuild.buildroot.org/results/6b4063ee2cceb2ae6e1ba411d3a42dbff816975d |     
   armeb     |           kmon-1.7.1           | NOK | https://autobuild.buildroot.org/results/cfba498b256e0b3cb8a9a940929350993ade5e23 |     
microblazeel |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/d84bb5e92d5e0a31ac2461f0cdef12d25efbf1da | ORPH
 microblaze  |          ledmon-1.0.0          | NOK | https://autobuild.buildroot.org/results/9ce6395107e8b2ae824c21dabdcb09c80901cfc1 |     
microblazeel | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/5b02caca0871351c4440cf7f0ed03234099580b2 |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/42a1df55fb1f457a39bf93462dec701336942403 |     
    mips     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/953e256e2307a632062363cda55fbd1e608207c1 |     
    i586     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/58562cb303ef9f8424242f6bd9a6953f833fdfa5 |     
    m68k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/661c259b02e42e71e03fec6e9161b95fb3695eb8 |     
  mips64el   | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/8d50f96713cbbba69792407c2cacecd691d90e4b |     
 aarch64_be  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/b84781c149477aaf4adcc543796c81d428c17557 |     
  mips64el   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/0ea19a113bb8c2b681b0724f3528def05d69f4f7 |     
  powerpc    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/a0a6d393c8c0bdc638d935714f18680af1f2950a |     
  mips64el   |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/89119347db094c1baa4ef5ab9258eb9118167f75 | ORPH
    m68k     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/075466c94706b1ba380f17e7fb07401718553f18 | ORPH
   armeb     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/b7bb56b4cbd430c1de00bddd797a2ae8e1fd2380 | ORPH
   mipsel    |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/f08d3a96b6fd33ae1407c2ddebf57920ae496a5b | ORPH
 microblaze  |        libgtk2-2.24.33         | NOK | https://autobuild.buildroot.org/results/217c43795e730ec7093a1cc3fd32acaa66fc6b91 |     
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/6870882bb14a15dd2d7453113a30ea219d39c151 |     
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/9abbb5bbe08d00423d72219865fefb34346c855a | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/dabec0f7cbb03507c683e9d2e98160d830ca71cb | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/7eac13e3559b98a6a8b37f5484388755a7dbfd14 | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/164132cc369eefd69576982eda56e6a9a8a3a055 |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/9adaccb72887ae62e95067b3228c5d2b3ce157be |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/55bc3258643a7928fad1ea8fb7a335b4aefa25ba |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0867bffc614e754b76543cd3a895be08bbb7eeb9 |     
   s390x     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/290f3190faa0ada9d17241924cab0d68afda3433 |     
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/c183b129beab64e56138fc7f5204b53576c2f4e9 | ORPH
   armeb     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/1d9336aee411f5b6e7367fc3cd416d6481d92ff2 | ORPH
    arm      |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/3a3029ba6a78e8c121dcdf1994062f93b136657e | ORPH
 microblaze  |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/2ad0d38da18f66ac1a4bb65142746e8410eed01a | ORPH
   xtensa    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/71fa2b7d2b421631fb29cdf2cd912524cc5e4acb |     
   x86_64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/df61d8172239eaa5240933712428ea9239bcd10a |     
loongarch64  |     linux-headers-5.4.296      | NOK | https://autobuild.buildroot.org/results/68e18d419059795ed1e9ef27d586a0e195553b6e | ORPH
   x86_64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/1e5057e93414a77902b5b5c44ed61accefe83aa6 |     
   sparc     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/6b98b34d6749334926a8f3b4ee755fa54cfc9acd |     
 powerpc64   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/e1310e7db3fbc2d9027ad8c4a91130c41baf9b52 |     
microblazeel |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/31959b940bd39f473842c84d780871bec6ccbcf4 |     
   mipsel    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/7ceb9abf942877c075edd41092699ec5b1d26db3 |     
   arceb     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/b83195e1fb09cb398435d1feca3424b40e7b3399 |     
   sparc     | mjpg-streamer-v1.0.0-1-g310... | NOK | https://autobuild.buildroot.org/results/687bb3af0c72175a66592648a106d30a1aefce20 |     
    i686     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1abf47b15f4215b26b1b6126ef00826f56075f5a |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/0370192623bd7919cb58a1c52e91c144b030feb4 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/81a20a74e9638f3c6716cd313958752ce0029e9d |     
   armeb     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/316a7d9403a3458a9db373d7a64b5d3f0d1a7304 | ORPH
   s390x     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/98ef5ed4e9fd38722974699568ec7e2d699df3c9 |     
    arm      |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/fa662aa895e9cc77a8596b609028247b154c885e | ORPH
loongarch64  |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/e59682ca79b45f54bf19f80d5835ee2abe847f47 | ORPH
microblazeel |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/20aff8b22b381c31bf72d6f90efeed2fe7412b23 | ORPH
  mips64el   |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/ee66bc0d5eada91b0aecc5d457d2ff0c01289dea | ORPH
microblazeel |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/e4805171ae75089aa7102599568cdee6f0c2b4f3 |     
   mips64    |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/678370dc8fcd1d1928e3820b0eaa085f9f44e752 | ORPH
    mips     |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/a0b04cda7226904f71df9bc4bb052284bffc57ad |     
    mips     |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/0e385e8e56233da42f9613bbf2f4c07941007b85 |     
   mips64    |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/c5d106d63f33ae129600ad550c7a170ae0e87198 |     
 powerpc64   | rtl8812au-aircrack-ng-c3fb8... | NOK | https://autobuild.buildroot.org/results/7a5b5f3e8d34e3e8ca155ffe168768275256c17e |     
   armeb     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/054d68b7740c1f4996d679738c669b79048fdd32 | ORPH
loongarch64  |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/0fe0ff85acaec85f2068d2a998aa872c33f12f16 | ORPH
 aarch64_be  |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/62f65e07b8084870e0cba74926e22d267e3c5f5a | ORPH
   xtensa    |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/8b4c8f36bbf608d4272eca5e6462dbe0c9e84c1c |     
   sh4aeb    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/b29693cb0445e7102be18c143d87ba0d158b9396 |     
    i686     |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/918dc58d72dcf8c485c6eacf3a92bef70d401936 | ORPH
 powerpc64   |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/9c30e941bd4914668e9a612e535636e7eb34faeb |     
   mipsel    |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/b798003cb49de03e39708b80a11585735aea772e |     
  aarch64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/da0ed4c68c9ab50a9a2e84efa1a7c86e3983de4a | ORPH
   s390x     |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/899cf26530968884e872e6f4d254f7324bc1571b | ORPH
   mips64    |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/98299f9a48cf757acabaf95617473a58e2500519 | ORPH
   sparc     |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/f5bae69baafe962836693057ddfb81f8b650148a | ORPH
loongarch64  |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/989a2e18abd382ab355c2b247c0c494573203cc4 | ORPH
    i686     |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/a920606bcdb1398c1f7dfac770ffd68ab1cedbcf |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/620fa7e65e8b9af9171f60fff7415095a6a47012 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/ac9a6604432636f4380ed7e168266a22bc025518 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/ad29c4662a701d23f2be7caf1d6fe0dcc56012db |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/cd31a2a6567fa5a0e7a4d7b26594027bf1828a54 |     
   s390x     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/b65ecc501fc5926be38d0245ee60ea11ffb386a7 | ORPH
  sparc64    |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/af8c791a91d97c500124b48cd9abc518fc34e48f | ORPH
 aarch64_be  |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/474fd9f120415421f0ba8e83c010ed52924f7fd6 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

  gobject-introspection-1.82.0 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                   perl-5.40.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/d540eb6f50023a5dae689d82451b5ff4ced74bd3 | ORPH
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/83d1799b81dc2283bb9c3679cc6844a62e751070 | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/d27613f5ecb62cd5d30b4b2bfd383b2d2b736889 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                   avrdude-8.0 | 1 
            host-binutils-2.42 | 1 
                 linux-6.14.11 | 1 
                     nut-2.8.3 | 1 
    start-stop-daemon-1.20.7.1 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/a715d5b456b9efacade6d63f065f06576292c58f |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/7cf52019f87625c73ef3c4ca0b6270e20a4ab768 |     
  mips64el   |         linux-6.14.11          | NOK | https://autobuild.buildroot.org/results/c4a7a0bda42414d2581ee2ddc3d9943305cb97d7 | ORPH
  sparc64    |           nut-2.8.3            | NOK | https://autobuild.buildroot.org/results/2a12e25db10c9d85b48fdfd3297b91a19657b475 |     
   x86_64    |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/2e75d56d194229930f54b69f161eec3cbba47f6b | ORPH
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/3268f94d46ec68be9d0d994bfa6f3fd030009b73 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
