Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAEBCD4F2F
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 04:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B15960F06;
	Thu, 13 Nov 2025 04:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_fX5CC4yyJf; Thu, 13 Nov 2025 04:23:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0591F60F22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0591F60F22;
	Thu, 13 Nov 2025 04:23:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1146342
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 04:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D348A40CA5
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 04:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8D-u3wA7b9LC for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 04:23:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F4AB40C98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F4AB40C98
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F4AB40C98
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 04:23:26 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477632cc932so1355135e9.3
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:23:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763007804; x=1763612604;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rDgaAS0JQ/6KNIDXLwhe1hJMaFH7DsD7vGCK5ailErc=;
 b=nQ/CvoxNH4hzqXpLhyfdb9qVDWuR19OOk2M6ByqtFR5/stNirqlBGpLU1qeSgLsjb8
 aD+UK8j+S7BuumfqsJtfmMQWBSANpp1V2elN/40W7bkQBbqd68AzOmNMEvHBAaGXH1LG
 89Z0QHQgxZQWpPy5jftj1ObPegOVkVrrOQurX38pE2qS6PjM46ONGMHJ2qUVQxloGicS
 dsevyIMcnLj//gDSs9LRL4aVyWGmmS7S6mUtDWElutHcXotHhGy0NbX2DDuJk45+FRNr
 Y1VUcufuJGaJbv/j5JXIbnPis/ltgnfx2lFFwJvGZcbEK/aTonPGOg/6rc7n6cQymTGH
 mVOg==
X-Gm-Message-State: AOJu0Yxx7irgHweFLbjC6dj8MrArHTz/rp3YFF0b+9pJ8bUK1eksnwfC
 7YEH7goJfmywU66AOAv/4W6qFiZmGt3BsH7hdkrndyzqc0J+EYwlZCQ65dHgrg==
X-Gm-Gg: ASbGnctvEjXPJVw+RmNRXkMkzDg66gNQ5MEMWSbHgWY703pcVywWX+kOOoAhGSEcVK8
 vLXax0AFHP5Y5zc23n+F+aaqTLOAUuo97BIG9t2HUtD3M5SSQ2yJsKICEZiE0RWntoio7SavQtq
 AkKPixbOl5k75DP/IZsOpEvihOwWmQ8triFKyYr/4P4cv/U3IK+3z6VgveihAtYVS5vNg8skbjI
 rvLJk8FyX4MlwZmo1Y6oHXLUT/2VnCico1xEQ4y9hmKNj9j0/1d5j5oOG/hpHftRrAqDQt7FMaF
 CSjQ8ipfFM4b6MdLzo/7mEFlqsFG5fhG463FPk/YHIWN3O6ZX4HCLuE+3zlqaFeiuhe0O7TLcBZ
 /bgR0kahqakOvfA4KziBHt6O50pyGoHGGaZaHdD0pQSal7ZRkuGDjOgvAbczpxUszyW2yzSsfOD
 Z5XewU/iA=
X-Google-Smtp-Source: AGHT+IGUpv4XF7+JC7OTjEoudAA0cxgpLreaLa4Rd3Pp49BgUeVCB/MSGAT+0MWyx4lwkO+1FMEX8w==
X-Received: by 2002:a05:600c:3546:b0:477:55de:4a6 with SMTP id
 5b1f17b1804b1-477870710d4mr53188775e9.3.1763007803814; 
 Wed, 12 Nov 2025 20:23:23 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b57asm1319227f8f.27.2025.11.12.20.23.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 20:23:23 -0800 (PST)
Message-ID: <69155d3b.050a0220.2a372.2e40@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 13 Nov 2025 04:23:23 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763007804; x=1763612604; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rDgaAS0JQ/6KNIDXLwhe1hJMaFH7DsD7vGCK5ailErc=;
 b=W8R9lKQXdKgpO+21igw6Vg+9KKPXGJY3oEzWEVacoJnFhnNp30OxrqXAy4ko0uNH++
 ZAc1VOvVBVPHpNizeDLvMTVJD70Od/2MshszXRS1vpig9iYcvN2pp3Vn3XaU03JlTvW2
 qtJHSuoEny8pXxEjfdYGBEpLggdYuNLulRIRMzg+QuFEQkuu+/z3gt/qPfaL0vE2mRrY
 WsTl1/bL7ZbTf0aJUg6qTXYSO1omqK4gPpO82dIBOrnJajoHgdEmf50emQK4iAoL4ORn
 yzbN9bNYdqpnARDiQlTZcRWNp0RdcD0MQTZxt/NhFakhM7trIWsYqXZpUhBSitpskWwR
 T7Ig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W8R9lKQX
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-12
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

Autobuild statistics for 2025-11-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  |  9  |  0  | 18  |
  2025.05.x  |  0  |  1  |  0  |  1  |
  2025.08.x  |  1  |  2  |  0  |  3  |
    master   | 29  | 80  |  0  | 109 |

Classification of failures by reason for master
-----------------------------------------------

           host-openocd-0.12.0 | 4 
                openocd-0.12.0 | 4 
                       unknown | 4 
                      fio-3.41 | 3 
                  linux-6.17.7 | 3 
                netdata-1.37.1 | 3 
                python3-3.13.9 | 3 
             berkeleydb-5.3.28 | 2 
             dahdi-linux-3.3.0 | 2 
  gobject-introspection-1.84.0 | 2 
    host-mender-artifact-4.1.0 | 2 
                   libcap-2.77 | 2 
     libphidget-2.1.9.20190409 | 2 
                    mpir-3.0.0 | 2 
      passt-2025_06_11.0293c6f | 2 
                    sdl-1.2.15 | 2 
             alsa-utils-1.2.14 | 1 
             batman-adv-2024.4 | 1 
               bctoolbox-4.4.8 | 1 
             bmap-writer-1.0.2 | 1 
                    brltty-6.8 | 1 
                  brotli-1.2.0 | 1 
                 c-icap-0.5.10 | 1 
                   dante-1.4.4 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
           dmraid-1.0.0.rc16-3 | 1 
            erofs-utils-1.8.10 | 1 
                haveged-1.9.19 | 1 
                 host-gdb-14.2 | 1 
 host-softether-4.30-9700-beta | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
              iputils-20250605 | 1 
libdill-32d0e8b733416208e04... | 1 
               libglib2-2.86.1 | 1 
     libglib2-bootstrap-2.86.1 | 1 
                libglvnd-1.7.0 | 1 
             libgphoto2-2.5.33 | 1 
                  libite-2.6.1 | 1 
                  libjwt-3.2.0 | 1 
              libmhash-0.9.9.9 | 1 
              libopenssl-3.6.0 | 1 
          linux-5.10.162-cip24 | 1 
                 netsnmp-5.9.4 | 1 
           oath-toolkit-2.6.12 | 1 
open-plc-utils-1ba7d5a042e4... | 1 
                openssh-10.2p1 | 1 
                openswan-3.0.0 | 1 
                   perl-5.40.2 | 1 
                 procs-0.14.10 | 1 
   python-pydantic-core-2.41.4 | 1 
              udpcast-20230924 | 1 
             util-linux-2.41.1 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |       alsa-utils-1.2.14        | NOK | https://autobuild.buildroot.org/results/9438ad0dc2574b944f9775904fd42c2bf90c3c5c |     
    arc      |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/9f4614485a7bf7169d1c9dd67e0a459b74dad417 |     
    i686     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/39f35b2754140c33f96c8ecede4695f7001effe3 | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/5dd38044206b6d0c51a36b23438354ea710cbf30 | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/74eb1c1faefb2a43b00b559d08d4cad7044a9ec3 | ORPH
    i586     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/fa6724a911750e148850745e7c651d3f4f788a74 |     
 microblaze  |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/0a17d1e72c7ed29f42a0a296b04f632df5c64c67 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/fbe05c020d54cd9c4be05966c005b42fc511d8eb |     
    or1k     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/17072f4261347490f68d887ed1fbe21cb894d638 | ORPH
    mips     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3779f6a9e978c7157afdca391d799884eb45a161 | ORPH
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/99ef35851a17929782342f024223ed0cb5ba25e9 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/fee3236bd2068027d1d4a059dac952a4bfcc6f85 | ORPH
  aarch64    | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/339be5d05446652b883d4726e9a57687007b9d58 | ORPH
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/6ed2533716b4b1afc199751c0cd6c5d976411fab | ORPH
   arceb     |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/cc0b66a8089437f104c1851d2c25c406a0f35447 |     
    sh4      |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/1f0b82f52e02d3f5222fae60913f932fe83d33a5 |     
   mipsel    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/23e1a645d63f9d9629a76d19c0f0272b9e3c0b65 |     
   armeb     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/ac32da6cf458154f582a7d5ee289aecdb45d8892 |     
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/bd7295680c5fea840de8478a0c0af1f1c0762e95 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3b0f376cd2b577b39f4b4153718511658d9cafaf | ORPH
   xtensa    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/186cc5d8f59d39f9d95c71affb8bcaf9cbfa37d0 |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/784300dd4b335163b0bc2e780a95ac5f52f32b08 | ORPH
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/dc18fd6a262d6f5c90a366cf913899fbd4a9c55d |     
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/7d247f318661b30c072e59b81b4e0f8fefb3d38d |     
   sparc     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/ebef7ce38c6c206cf07397f0643b64735c7b32e4 | ORPH
  mips64el   |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/d23769795a65448b3f4d6ce734cdf74e9fe0ebaf | ORPH
    arc      |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/4d61c58cb257c0ebb419d0f05b95c4a47d8a0135 | ORPH
    mips     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/d6b8fefe4997e484d106dcba7fa4552d4fde690e | ORPH
    i686     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/1ad8db0a78508cf29ab69d8bed0d076fadb6b2aa | ORPH
   armeb     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/c35386e5da3bc2dc175da0aac81f2fdb930fc344 |     
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/095ca5349f6b73024289a6067359483e854309ac |     
    or1k     |        iputils-20250605        | NOK | https://autobuild.buildroot.org/results/38f43f974b16ce1480260acc11ebaae0f651b84a |     
   xtensa    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/0b5809b1d0d5ddd579cd203ddc2701a8284dd3dd |     
    i686     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/5b59cdda738263182366d35d7a66db1854999344 |     
microblazeel | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/ce7974fec06569b40c0abd6e5c0792ef5eb70ee7 |     
    m68k     |        libglib2-2.86.1         | NOK | https://autobuild.buildroot.org/results/15478af40f9ea2f28b54b76e8458a9d9ea7e9bc7 |     
    m68k     |   libglib2-bootstrap-2.86.1    | NOK | https://autobuild.buildroot.org/results/70dfa424e33d0c24c45839a64e73e0c83a49d983 |     
   mipsel    |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/5abd877348a0b40045f76e71240cb1b8fdfa89f8 | ORPH
    sh4      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/322ba036c0a83269b245bace6d4abc5f88f4a41a |     
  riscv32    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/57cb333962525c12186bbaf92375f315c5ac2cb7 |     
   sparc     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/294a8e65c8856193197d9675bd63939dcb312122 |     
powerpc64le  |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/9ea87b4cc0ceef8ba1a86b9ebbb17039f27945f0 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/cfbb4dff06866f7f8f8484ed3559d9dcfeeea509 | ORPH
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/4d870bb188c5c6d1737e9434782c035e56e03a0d |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/ef13e77cb3c1bda0dc270d9d59c8606afea2353f |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/d3d9ec22196995dccea0caeb779424fe857f7abd | ORPH
 powerpc64   |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/26634e27bcfb831285677969e614c3d18bae2cb9 | ORPH
    m68k     |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/cbd34a9b4d2d296682ca7632c707844ccc4a173e | ORPH
    m68k     |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/2a3e07906ecf8716b66161c9814e29a564cf2d73 | ORPH
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/0917aa63099d5dfa1efc99987edeb878386c59d5 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/7e4a4c222812f07eaf99ca32792fba968d232da4 |     
   mipsel    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/7086f14217b5e0606c7a84c87c7fc174e4202066 |     
    arm      |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/70c8121d1dca5ea4e820fa60fcc7cb519edcbe3b |     
loongarch64  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/bda631ad5d04fc8eb7e542195da04a0f8c9ba75f |     
 aarch64_be  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/d022201b1de94418cf1b86a2649399bf4499e335 | ORPH
   s390x     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/0eb0c15b6862ca009b56c345d1e48a2c1add7969 |     
    or1k     | open-plc-utils-1ba7d5a042e4... | NOK | https://autobuild.buildroot.org/results/f47694f384ccabf97ca9444de3869050e5e69d3d | ORPH
    m68k     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/34a542b7aa9255ad962ba22f4bf096dc9e7e022f | ORPH
microblazeel |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/d1378c01a10a125f2119319838cb1f846a196bd1 | ORPH
   sh4aeb    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/7ebe01927d5f5b2d656b0ecbbdf3e04df48ac0a0 | ORPH
  mips64el   |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/58fbd0b5d1b2514d449d29e9cc7a712963abe81e | ORPH
  riscv32    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/e4816fc98e0222d080425355485538177a5f74fa | ORPH
  powerpc    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/70dfc379fe472839c22cfed92064d2be7388a444 | ORPH
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/392245febb5cb158713c0a7b4098e4254022c763 | ORPH
    or1k     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/ea505f99160cc39bd9fb9fa94c90d69734bfb012 | ORPH
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/2c06ab3a5a75145205bc7e7e40b4bba1789e0a16 |     
powerpc64le  |         procs-0.14.10          | NOK | https://autobuild.buildroot.org/results/980eef36d1c309e0217d42ee0fc0f78b9ba0f636 |     
  powerpc    |  python-pydantic-core-2.41.4   | NOK | https://autobuild.buildroot.org/results/0454fe8e1c55eab4cefc4bacbfe804f20ef72daf |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/07c63e179aeb12acb5321c0fb8b7215af27f94ae |     
    sh4      |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/31f34a983036b4135c12e5797b5c2258ab33e6c2 |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/9e11174d6a5ce9e8bd270333c6b2087e1cf5f3f9 |     
  powerpc    |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/1ae48c5d021a63eaadc14480929cfbeb3df892c5 | ORPH
  mips64el   |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/717829b4d5b72eabdabd498c983f0a176dcb652e | ORPH
powerpc64le  |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/d179da02f342b50b73f590ff97298c37d668c851 | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8f192a67cf697f2ed67877f9f8f77ca7d8b1ef1a |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/99742819159d5b296cf6506d137d596efa1d3e62 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/13a306159e77db87c112e06a8100b0f907462dc7 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/06baf279a62e7c41e28f45b4f8113f0ba26f6ffc |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/ce524e133bb97cf79e96a2e88681e15ccff1d926 | ORPH
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/24b103cf9dfc3fb2b048196fb19fa5b455b6b4ce | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                   atop-2.11.1 | 1 
               procps-ng-4.0.5 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |          atop-2.11.1           | NOK | https://autobuild.buildroot.org/results/46bbe22f8fd1775b9be5b023dd385f70154e040d |     
    or1k     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/a6d62aabc281e40ba843cb3094179c3663b5ea4e | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   linux-tools | 2 
                jemalloc-5.3.0 | 1 
        ltp-testsuite-20250130 | 1 
                  nginx-1.26.3 | 1 
         s6-linux-init-1.1.2.0 | 1 
               syslog-ng-4.8.3 | 1 
                    uftp-5.0.3 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/2ae8bc38ecfe1ee1c9129a2a052d910482961845 |     
 microblaze  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/7f691de010207ab830f6de8271f944152c9aa0ad | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1a6a58302b295b1700e584437d8c8f2c2053fdb4 | ORPH
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/f58e5e69d19b3d2435abec8961ee3c4893b3f843 |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/e94b5e3b14ecdacb1bf3340c0fefc9f4b49852a3 | ORPH
   sparc     |     s6-linux-init-1.1.2.0      | NOK | https://autobuild.buildroot.org/results/a823258935e2519e692b98a3a95f8edb8485c2ba |     
microblazeel |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/7ed45a1743f0e9d8378557444f60883f0f298a8c |     
  sparc64    |           uftp-5.0.3           | NOK | https://autobuild.buildroot.org/results/a0e32a5520069e6328f7a0fbaf7fa0f4ec67f2c0 | ORPH
  mips64el   |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/dabb7fd26cdc33be161055bf576ee0c7ef934f1a | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/21bc646ad0cfc35b0d7d33294910ad397442e5c3 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
