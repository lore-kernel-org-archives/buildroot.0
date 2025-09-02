Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF2ACA0FFE
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 03:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA611811C4;
	Tue,  2 Sep 2025 03:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZM-m3FgTSSKY; Tue,  2 Sep 2025 03:24:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2585E81204
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2585E81204;
	Tue,  2 Sep 2025 03:24:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E29510E
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 03:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51BD6412D3
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 03:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hoekrtd8SJZ4 for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 03:24:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7525340621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7525340621
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7525340621
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 03:24:34 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b0418f6fc27so261655966b.3
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 20:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756783472; x=1757388272;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ymx+5lRa1vtr7VhTwOYCJkTvKc2/5OlFgllOzDRp7MM=;
 b=r5maEhf0LODmgc+HctZlG34YWAPZ0xwLtl1HpVfeW6m8C/M3pi21lAkFew18hQ7ZB6
 rzPdX/PjCLzgaBly86z8VvxgKMOJXvMn3r0ZH8mRRfdjaiOh4D6m/WFGb/OOQORKUj1p
 MMJEKU4QqL7lRhjblsSw1V/xGSVKoknP8DmWSkSoBuNQHS1n63EGssAvD9W036NNltOp
 67t3bR0eIevo18iEGerTEFAyKjLV/KfoPMWs79QGWvLEz7jw7ZqtWi4+8nUdxMhfdeD0
 xAtsBwpeoLUCDyrhdsD6sKUcjAHQRXBbpSpv53FyEBNGcRQXiLBqfd1kI69dM9McMLL6
 DgMA==
X-Gm-Message-State: AOJu0YyTPf2pKQuVSW6OJgijFwG5NvEo0lna+ZMqRRnoKMu9CKnBxD7D
 IO/CykKPDSSTTYD04aInW52borXqUmsXFdlSy7hj4FemqxWgTbyiiasNdQ2/sw==
X-Gm-Gg: ASbGncuCor6mEUGD8nfvMHKFVQsUmF+5NAgc8A16JC++t380jMZ9COj/P5blsw4vWH0
 009u2QweQtskude3YlTEMZIRjCcIiigsU3RqMwCAUBACNPB+W2OujqIUOjaHdUd2MnilT5ubNql
 T7RnMmqbuajBuX9h2Vs0QFw5ABGYV82Ca5/zSVY0sX7A+wgKJAy60MXEDJFSQQR/ZWAGPaFEuBP
 lwwa1Ugymi8FwfOkANjM2w8Y0u1nI9JEGv0mAN/nkMqekSvk0CwTiWWhCH6e5xJaByyuxyInz4C
 SWh7m3q6Sy+bPH7dKtiS7Amy/Wi51gAy25aCCCBGFF22y7KyrWLc4RdzAg3m+hy0Lcikb1Qjoz5
 1IJf4M3WufLGYIdzM9c3ERrDT13rlAHQQ3DuEJqXF
X-Google-Smtp-Source: AGHT+IG5K49ReekJNxRBQcBfZNaJmliRw94rovYQSlkJx/0i7pa8YnBKm5n8soUMn+Eq+L1dxvY3vQ==
X-Received: by 2002:a17:906:dcb:b0:b04:8f3:1d03 with SMTP id
 a640c23a62f3a-b0408f31f7emr885016666b.54.1756783472110; 
 Mon, 01 Sep 2025 20:24:32 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b043fd772bcsm221581666b.14.2025.09.01.20.24.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 20:24:31 -0700 (PDT)
Message-ID: <68b6636f.170a0220.47bdb.8abd@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 02 Sep 2025 03:24:31 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756783472; x=1757388272; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Ymx+5lRa1vtr7VhTwOYCJkTvKc2/5OlFgllOzDRp7MM=;
 b=Lx8oYTJg10NCdkjsM1fd6/Qmj6WkB0yuUqBUIc9kYTok23SNZMtJfetHt4iad99CXi
 wuaAKQw3OibSkS53EiOBfDlcvhrt/5Qi1C5wJVaIc/0cS1Q7J4gte3J3t96faRKisZnY
 iOiAauabjFqh9IHHPsxJLcPB4yEJHs4tUukh61qCV8mnTnfuPjZzKBZFu1Z85yku4iHS
 JG79Fv/O6lFn8ntRun78/t9DB+k5TBGAnY+C+EWJyrsUAldMc+Yslqp/zaOtdfs3e6X7
 sWrsoKXs2v5hNMLq8q+hTG/rWd2yR+EbYEceoD8X23mHFE/EBGBFoBNy+C2x502uWsOA
 mKJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Lx8oYTJg
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-01
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

Autobuild statistics for 2025-09-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  | 11  |  0  | 16  |
  2025.05.x  |  1  |  3  |  0  |  4  |
    master   | 35  | 79  |  2  | 116 |
     next    |  1  |  2  |  0  |  3  |

Classification of failures by reason for master
-----------------------------------------------

                   avrdude-8.0 | 3 
                   cvs-1.12.13 | 3 
             dahdi-linux-3.3.0 | 3 
              libopenssl-3.5.2 | 3 
                 logsurfer-1.8 | 3 
                  mbpfan-2.4.0 | 3 
                    mpir-3.0.0 | 3 
                   perl-5.40.2 | 3 
                       unknown | 3 
                    wipe-2.3.1 | 3 
               bctoolbox-4.4.8 | 2 
  gobject-introspection-1.84.0 | 2 
                 host-gdb-14.2 | 2 
libdbi-drivers-0bfae6c43134... | 2 
              libselinux-3.8.1 | 2 
                 linux-headers | 2 
                    sslh-2.0.1 | 2 
        vulkan-headers-1.4.317 | 2 
             berkeleydb-5.3.28 | 1 
                    brltty-6.6 | 1 
          chocolate-doom-3.0.1 | 1 
                 coreutils-9.5 | 1 
  distribution-registry-v3.0.0 | 1 
            ecryptfs-utils-111 | 1 
       freeradius-server-3.2.6 | 1 
                 host-gdb-15.2 | 1 
              host-rust-1.88.0 | 1 
            igd2-for-linux-2.2 | 1 
            igh-ethercat-1.6.3 | 1 
      input-event-daemon-0.1.3 | 1 
                  iozone-3.506 | 1 
                  libjwt-3.2.0 | 1 
              libmhash-0.9.9.9 | 1 
     libphidget-2.1.9.20190409 | 1 
                libsepol-3.8.1 | 1 
                  libsvg-0.1.4 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.16.4 | 1 
              mariadb-10.11.11 | 1 
                 mbedtls-3.6.4 | 1 
                    musl-1.2.5 | 1 
                     nvme-1.12 | 1 
                 openal-1.22.0 | 1 
                openssh-10.0p1 | 1 
                openvpn-2.6.14 | 1 
      passt-2025_06_11.0293c6f | 1 
                 rtptools-1.22 | 1 
         s6-linux-init-1.1.2.1 | 1 
        s6-linux-utils-2.6.2.1 | 1 
          sane-airscan-0.99.33 | 1 
               syslog-ng-4.8.1 | 1 
              udpcast-20230924 | 1 
                     unzip-6.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/dcafc719f4fd799160990e5628e45b59310caaa9 |     
   mipsel    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/11287a87a1dfc0d50aa7ea8174f2ae9366e9f53d |     
   sparc     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/d540074fc04324213fde252e96e4999dc1014f1c |     
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/197f63426f447cd9f498a9001374fbde87161c3c | ORPH
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e53591571cf7a1d10f1b501234200c45c06472f4 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/ab1fa7b02eb41eeb116ad63ffc1c491ee73f918f | ORPH
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/cf4a0218c4e2e8928d8e34d71bb613af27cf74d9 |     
 aarch64_be  |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/f79c734fa5768f1214a983e037059ea5166d9d4e |     
    i686     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/827c8aff9d8d6d1ddb4219a478768c393844bcce | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/01278a21de0ff64ed5bb890eab85da04a619f4ce | ORPH
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f7e5135921f6426973a78aa74760bac8d0e5380e | ORPH
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1030dccda0efcb3ca0abb0ef8aa2f13d9778d536 | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/02b3b4f5a25646ec0c057681db9cc89eb465de7b | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2287ad2efd92884c9819b681a19a93ed07836e7c | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/cac1dccad5e294ede58df18abf5fbe0d7d1db1ec | ORPH
    arm      |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/7380bdfcf89cd3eaf2c645095f737be8810e5081 | ORPH
    mips     |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/228e41acfc8966da8fbbe617beda0d0670abcdaa |     
powerpc64le  |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/d4ceadc4fe67f8391a43e6b666ebf77b362bc9b8 |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7bc2cac168843778b7fdaa0fd57ace004956d58e | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ec1d0490ca0e98a4318037c3abf6ac78221a44d3 | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/619a84e44b242fbb2681bc1da2450c87cdfade57 | ORPH
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/2347b5a073bea1ec48f1b98a17631c28cad42e84 | ORPH
   xtensa    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/190e210dec6caa722d9d2f291f6af3ab6a97eb08 | ORPH
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/5aec4ee6239a94861f115bebd250f92b3655b973 |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/075a4e1d5f94906baf720b7eb348c5950892ed42 |     
  mips64el   |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/3bf482cf321b6ebdecfecd52fd54def96314dc76 |     
microblazeel |    input-event-daemon-0.1.3    | NOK | https://autobuild.buildroot.org/results/7c3556ec16c28b61bda62156a3bee858cf80cd1c | ORPH
    or1k     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/f2698cd356cdbd5ebf049cbba36bba529e1da4ac |     
    arm      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/d561e33ba1c4ec9a07bc3e45844cd14e27dcea79 |     
powerpc64le  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/c5978a3bcd5ece739084ef5a45e4897f123a3aab |     
   sparc     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/674cb82e7289d029c043e1149e485c8bdeadee33 |     
   arceb     |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/45751e7d002d6dfe522c0cd501ddad1c3d67bce9 | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/0c368bc1838f128940db8a8205f9b514dbaae003 | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/e0a2a004eca833b14af5f5a583370ff0b3cc7d8f | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/3058a395e3544cfb9152b48a8cfadfc8ba647faa | ORPH
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/ec3299fe716b673f63040f4d4708e3c1bf9a4c29 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ff8256e5b1489644066416c8ceecb577d28089a9 |     
    sh4a     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/6c5fa579c45280f2144b536c679b42d842f8c86e |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/141752d31e1fb828c2f024b979897118b9dfc026 |     
   s390x     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/3442a93e3dd4fabb06f0e1f91e1cae6788e1057d |     
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/85ac48c94da9fc8d107f76e567b32668d7787395 | ORPH
loongarch64  |          linux-6.16.4          | NOK | https://autobuild.buildroot.org/results/761cf8de239a7e030c34d8532614380b272a771a | ORPH
loongarch64  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/03d3f3e8d639e893bc7297de80b23879d1301faf |     
    m68k     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/b5d833924887e8eb0c3cf2ccace5527407c80717 |     
   armeb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/ece494be1b66fddbfed6699ef5fb91138ac3f1a4 |     
   xtensa    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/7f617dea0ce200b0fe2b8d3ec1f213a48f6fce23 |     
microblazeel |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/96afd93c4b8072368c7e934c3b6049328b12d73e |     
   mips64    |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/bba9465a7a5e30837d72bd5d526b5e1cd262e6fb | ORPH
 aarch64_be  |         mbedtls-3.6.4          | NOK | https://autobuild.buildroot.org/results/359a9f18594222b9c27bd56c84d5969a7624e051 |     
powerpc64le  |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/86ae9a0251e190a052ffab749a7fe981e893d6f3 |     
   sparc     |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/b67aa769ea52c8f426b29268dc12c9390267c8ad |     
 microblaze  |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/d772da6b688637023cdc4ce3307f630dd7237546 |     
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ac8561c3b21bcc17fbff8701876269ee6fbee32f |     
    i686     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/86cf9b7669b236d2680af5081c6ee381d8976079 |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/3e561b7764f4b66ea9046a8c672fe9d7f52cdc4a |     
   mipsel    |           musl-1.2.5           | NOK | https://autobuild.buildroot.org/results/725a1ce623fb208243088f5bc7bdb43a910e1d64 |     
 microblaze  |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/150c044fca190b2d5d711b67bb84269327e252be | ORPH
powerpc64le  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/da3837362ab56c7b96f31710995e01d92e6765a8 | ORPH
   mips64    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/2b8d64342d76cb3c21a4c83d730a78003f91678a | ORPH
   sparc     |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/cca902e69c381d8696a06de979436913c3104ede |     
  mips64el   |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/e113fea5cf5617dde8ca76c7572ea786196cf163 | ORPH
microblazeel |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/a91e2b27ec8a7210f4b60a050ffeb0d9724d94c4 |     
    arc      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/a22cdd9bff1d9e3ef69154d352ef86e564f18be3 |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/5983fb843da9df7333334268399b0d5f4ac10bb8 |     
  riscv64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/c09d60cdf89da335d89ea3ded7aabbb1c6a344ad | ORPH
  mips64el   |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/3f9f237af8ed8727cd8571aca4a879db081381dc |     
  aarch64    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/217f6a6648543a1b1eb79d8d3c5219c0a04b8ea8 |     
microblazeel |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/34a5d230ebef7e7320e472e0f425db7b2ac9bd99 |     
  powerpc    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/1824ffdb160a1e4ebc2c946874fd7ce30ecfef3d | ORPH
  sparc64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/6e884baaccbb85ccad5b4a8815b94a86588a1ac1 | ORPH
microblazeel |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/8f804e4fd1a63ac165640befddda284a08be7684 |     
microblazeel |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/54ea2ff4734a5662163675856e64c26b712c3cff | ORPH
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/e4f351285b0003c75efd71d99694ca8f5cbfded0 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/bafbb8a8ad99dc62cab927478a266c362578d7cd |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/f6ea735e6e5330050ef13f44eda82b385ce31ad9 |     
powerpc64le  |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/9a937d2023b9396644c6e8af7c60c1535f89423a |     
 microblaze  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/1edafff1e51ca240884681ee0ebb7c1ee8d8ceef | ORPH
   s390x     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/23730be571a2f4ce366a50a4af4428ff8d77e88c | ORPH
powerpc64le  |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/04c2386a9ac1ccd23a4feff08d37cffb77d210bb | ORPH
   mips64    |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/5e07bba031223218abd67d9ad1c40ba8f3d78f8b | ORPH
    mips     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/e05da031abb310635005d6f6e86b6e2c26e7158c | ORPH


Classification of failures by reason for next
---------------------------------------------

               graphene-1.10.8 | 1 
host-binutils-arc-2024.12-r... | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/2a76cf48cb81498ce639698ac706e2973d07961c |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/348ee68562574764bd38bad638c525e2b2d195bd |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

            python-yarl-1.18.3 | 4 
               bctoolbox-4.4.8 | 1 
            gdk-pixbuf-2.42.12 | 1 
               host-vde2-2.3.3 | 1 
                       jose-14 | 1 
                 linux-6.12.41 | 1 
          perl-net-ssleay-1.94 | 1 
toolchain-external-bootlin-... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9aaa8897e401aea8ed85e1dc3b126eff796d0669 | ORPH
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f593c99d9efd6b25ce32e30f386cf58de435c696 | ORPH
   s390x     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/19eb02a4359a8d01d1c42470af13ac582f343d52 | ORPH
    arc      |            jose-14             | NOK | https://autobuild.buildroot.org/results/bf23e75461877a4ca3a189626f30cf8cde24de36 |     
 powerpc64   |         linux-6.12.41          | NOK | https://autobuild.buildroot.org/results/7cfc6ad132f4c05c90d276a1f2cb1b33d45fdd79 | ORPH
   xtensa    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/385dcebfd1a37c773042a600c47f7e6708308b1e |     
 aarch64_be  |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/4f0abdef4836c9f28dcc3fcc3ebb41cb2b2a9702 |     
 aarch64_be  |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/90b96c021cbe90978f4903d7ef4f1feff9f84cf4 |     
   mipsel    |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/2b2196e18403863161caee0991ca34a8699ac716 |     
    mips     |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/0bd25eb837a8591549349e1aaedb1b041ab70f02 |     
    arc      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/c591ca2ca4cd90510d108ca52b1d17fcd06d479b | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                     fd-10.2.0 | 1 
glibc-2.41-70-g1502c248d58c... | 1 
    host-mender-artifact-4.1.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/194f06c76772b741124c5f29183c7423d3c28d49 |     
   sh4eb     | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/6941218ae965c56cd1f8687de8311cd199e6a37e |     
   s390x     |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/55101b7af2e5cd7f6590dd3a36c0d5901910c005 |     


Gitlab CI results for 2025-09-01
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198423072 |      
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422961 | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422883 |      
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422739 |      
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422711 | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422690 | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422688 |      
          TestMicroPython | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422650 |      
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422639 |      
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422627 | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422601 |      
               TestIozone | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422516 |      
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422486 | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422480 | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422478 | ORPH 
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422467 | ORPH 
    TestFirewalldSysVInit | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422466 | ORPH 
              TestGitRefs | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422325 | ORPH 
              TestGitHash | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422323 | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422292 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
