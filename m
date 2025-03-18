Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4AFC282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 04:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33259820EE;
	Tue, 18 Mar 2025 04:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ytmun7xwXxBW; Tue, 18 Mar 2025 04:15:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7818A820E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7818A820E5;
	Tue, 18 Mar 2025 04:15:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30CCD16E
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 04:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E0CB60B11
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 04:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TlG04Q4aIlk for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 04:15:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F53860638
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F53860638
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F53860638
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 04:15:31 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-abf3d64849dso847683766b.3
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 21:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742271329; x=1742876129;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y187gNGRl4VrbiPlKW+khB5j5FZvBWzQPMjd4cFZ47Y=;
 b=Z9BnOlEJ4qOZRkUQPW7M7lZGa+WxAVmDc75Yvv91QZy4fiE6UeUwj0zYeKpysCl4Lt
 iS4760Yoh8Yn9Z3luHXik+b84rlFv02SCJFnqvNEZb5P33fKxlgSePQitJQ+JzrFdvib
 WNWEe1Vny+zvQnFA2VbVb2japmci7vWCF2wegcttMpGuw3N6nWXRUbhAqw1t3z4vXGHz
 NdHmRoG5HMhnm4fJ3fwWql/vs0cvvnydA3mDnFAVX9LwoX/u/xNzkawJO65ViStanEWl
 pnrcOTRzT/Oq90BAhLmPt7q6wz140KPS+pycmBUNw7sCb8McJnPIQHYqSyPvzIXIkK+X
 YFgQ==
X-Gm-Message-State: AOJu0YxnXdgTtA094E9y3IYY0fDHILjMa+nWRth8jon1veeyHRpBBN/K
 PJBKMhwTQBiMed/I72XpZkBHuNnHCeOqDO2umXpaDIpt2j9+msVRddCf/w==
X-Gm-Gg: ASbGncukFc/PU2FJT0FvFMg4C1XY1/Bvbe4Fu7EKkymBAnCKwISxT7EkesqQE/d4alr
 jPD8LPIkqpvB9hJyyRVcY/hw817mRIuJ5F/Y7UjodrmFE5bWTCSP5EsczQ1rHU8dNPvLG9crfNN
 1yXN0aHm/UW3g2krZkRQfUorpNT+cd50/ZOX8tbUw4FPfzwq2JkvsfbVcfPZI9c/gCrz9sTALL4
 PzI1QoI79qxUSbklzBKA40DvehDkji5CXv7CthgRICpQ9LC1atd0YI8Je7V9KHKoVTbKNfF8lX0
 08DWQqsHBbzN5kfpRGdIZPYFnm5+NaWY9CwUwjVuGjFmtzS9yW3y2Bn9IP0=
X-Google-Smtp-Source: AGHT+IGBTESNTwSMUrcyOroqXP4K9+F5ddlp2aIdq71tCeLp0VQgdWysd20BT1F93GKkJPRiaEy8Nw==
X-Received: by 2002:a17:907:9487:b0:ac3:121e:f2cb with SMTP id
 a640c23a62f3a-ac3301e4be5mr1540617966b.1.1742271329146; 
 Mon, 17 Mar 2025 21:15:29 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aeadbsm763403566b.29.2025.03.17.21.15.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 21:15:28 -0700 (PDT)
Message-ID: <67d8f360.170a0220.29ee8c.a0da@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 18 Mar 2025 04:15:28 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742271329; x=1742876129; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Y187gNGRl4VrbiPlKW+khB5j5FZvBWzQPMjd4cFZ47Y=;
 b=iX2RNQxd8qP41TrayU7nsVKZrgl2rwM+gbqn/JAJbc/KPO/GNpRcoga8fvVAUU7Vrn
 wYJlBDSh6Wbn6jE/kiseTTfszdugKX0Tv6vmxx/qSSWlGQm1IdxogEi3QcmZKyBcvG+C
 4cWXeYRlM0gdYeKmiBgOEJEbqrmiiiT2thtD/xRgWU2tSdO2UYyzweMX8jn0N2aztgoY
 hCwh97PeN2F+eWTDhXRRtHbSJx9d6u0OW3MCNZocS3HYF4hIJFJsxQhv6TS3NCLjRUps
 G5Yia9QX3hHUTuTLCK7Rc7aOMFUNdZGfbgFPYCyGl95cBUTdEZSy25yJH6wmLzAmEwCq
 GGkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iX2RNQxd
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-17
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

Autobuild statistics for 2025-03-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  3  |  0  |  5  |
  2024.11.x  |  9  |  2  |  0  | 11  |
    master   | 11  | 60  |  0  | 71  |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.192 | 8 
  gobject-introspection-1.82.0 | 4 
     linux-5.10.162-cip24-rt10 | 3 
     bandwidthd-2.0.1-auto-r11 | 2 
             berkeleydb-5.3.28 | 2 
                     daq-2.0.7 | 2 
          linux-5.10.162-cip24 | 2 
                 linux-6.12.19 | 2 
                  ntp-4.2.8p18 | 2 
                       unknown | 2 
             util-linux-2.40.2 | 2 
        util-linux-libs-2.40.2 | 2 
                    azmq-1.0.3 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.15.1 | 1 
                 c-ares-1.34.2 | 1 
                  cairo-1.18.2 | 1 
                   crun-1.18.2 | 1 
                 enchant-2.3.3 | 1 
              fftw-quad-3.3.10 | 1 
                   foot-1.16.2 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
glibc-2.41-5-gcb7f206537240... | 1 
                 host-gdb-16.1 | 1 
    host-python-greenlet-3.1.1 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                libglvnd-1.4.0 | 1 
         lttng-modules-2.13.10 | 1 
                memtest86-7.20 | 1 
                   nanocom-1.0 | 1 
                   perl-5.40.1 | 1 
         python-remi-2022.7.27 | 1 
                    qemu-9.2.0 | 1 
ulog-0389d243352255f6182326... | 1 
           v4l2loopback-0.13.2 | 1 
               valgrind-3.24.0 | 1 
wilc-driver-linux4microchip... | 1 
                 wolfssl-5.7.2 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/1bdb7b65154f9c2a4385aa6ea441d02f7b59acbc |     
    arm      |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/331549821269f3f93480f4c3f55f8816d225c36d |     
   s390x     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/729498756007dd54fda3c5384bbbeff5e765cd59 |     
  riscv64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/2a0c7f06c5e92a20a90dcd9ad523c0e10b8b956c | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/10b49edb3b3c579fc29f3981946a59775bf66509 | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/f51d0c580d0325500b49a9304535b5ef7d0cfa35 |     
 powerpc64   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/4bcae799c74b97a40f47242327b6721c5d1cd5a7 |     
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/4bb6c3c957fa2f014427322e703963905bcb75a9 | ORPH
 aarch64_be  |          cairo-1.18.2          | NOK | https://autobuild.buildroot.org/results/7c16ba259d7991349eb1f71b3665f496175f7c72 |     
 microblaze  |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/4600d7ec11544f0895934f625d421dd66e5b6e2b |     
    arm      |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/0139bf590a21dd284d307fdbaa1bf28c66924ec2 |     
    m68k     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/01d70c4f3fe624fdff0d79961a6444d8c662526c |     
   mips64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/48eba041eb93a6459a83b92b83cb3fc946f4f047 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/63829995c5d4c981799fd0d6f65af04c895d9dac | ORPH
    sh4a     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/4fe8ed56a4abe308c29f826e4a6c13246d1ba3b6 | ORPH
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a2cd218d3c8b358a0b0f97ad5dbeda77e8b09e05 | ORPH
   armeb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a63df2eafd54f350a8ac48b0cb035b6375719e49 | ORPH
  mips64el   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c6251c0247558d1046b7e0166753838893ae7318 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/1be7c91f0d68173e8152b5dafa2c6f6ac82e0e9c | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c63c493f49078027b6f835bb4f01cea0e5a3824f | ORPH
    or1k     |         enchant-2.3.3          | NOK | https://autobuild.buildroot.org/results/d4b84fdc185ed961048c5c5fb647095e6fef78f3 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/cb913b3c9a7752c6c2326e59dcc36d46544228f6 | ORPH
    m68k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/933352338cb115486ebe73f2e3febacab1796f4b |     
    arm      | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/28913d4fa24b1372bd9a6eccd407d9ba769de942 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/c995c2adb384bdb60734bfb0fe7d5ff8d4095a3a |     
    mips     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/87ad1b10178113029a7a7b6dc948386b17880da9 | ORPH
    mips     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/8a4103b8cc7baacc68dac4e387894539dd6ecfa7 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/62b99280658cd340d254257af3694ded9923fed2 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/8593c36c196c525cfc891eede661dadd7b19301d | ORPH
  powerpc    |         host-gdb-16.1          | NOK | https://autobuild.buildroot.org/results/960adcc2f6c64454bd60d1fe31fa26924bcaeb2c | ORPH
    i586     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/2cab85e636defe88340e266fac16e67f43cee803 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/b49e72ad90e78cf7fd7874103726f4dbec3f05ce |     
    m68k     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/42a1a7ca3d2dc1df3acfae4472be9e472e8d4b0a | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/d2a6221cf89eea27b6dfdfdfa6a148b34a8c9d79 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/dfda52ae1f57396780b8a47228e545e6f668d608 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/be4376c0e399092f85a9aa5060ac2b7e77e8ec3d | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1ee4d046d7d7730d85c58415f92592e1bd0baac5 | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/79715e8ff20683de0ea025c5c04ed74edcfb936d | ORPH
  powerpc    |         linux-6.12.19          | NOK | https://autobuild.buildroot.org/results/096101feb6d0347b7e72b7618652a742068771db | ORPH
   sh4aeb    |         linux-6.12.19          | NOK | https://autobuild.buildroot.org/results/b12769b9e79a8df08ddbb0f5027043eaecce0426 | ORPH
  aarch64    |     lttng-modules-2.13.10      | NOK | https://autobuild.buildroot.org/results/a29d38c4523cb9f346534d446354114fa31ceadc |     
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/a3777635a17b12885fad5aec2e394545efbfe766 |     
 powerpc64   |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/da7df57c65329183de2074b22bfa39e63e527e25 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/624181f44185e99991d170105e2084309f11b3a0 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d509c588813fb63975b74cdbb13a4cfb45160ed2 |     
   mips64    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/8e45561849b56bbeaa04c6d2ae111e4574b2e922 |     
powerpc64le  |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/0204d60e01709dfa5d43bdfd7809b66c9d81157a |     
   mipsel    |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/7d7f8b5a0c3733ab9872e8db6b08c4efb9d711a6 |     
 microblaze  | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/b3945282461c0a22efa860f413bf12870a028e34 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/370b91a8b3f4150e8b44d0777eb68b95429023f4 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/307a98b24f876e870ccbee839fdf3777016c8f15 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/9e0fdfdf9afb27e3740e1eacdf48b03da3f3ac74 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/03193ca18bd1836e67cb223ab69f7713d8f8c426 | ORPH
   x86_64    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/7745091b602761e6233038f91c6011a9668205b3 | ORPH
   armeb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/6dd4b0ca2860d3e0cfa2ef25f9a4a8c6efe8933d | ORPH
   armeb     |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/c2c0d16483164ad70928b91e82ac158d53f88187 |     
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/5615c836686d566d997c878748c3f8404b1402cc | ORPH
 microblaze  | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/cda63b4537f0c18a7a08eff106080ceb2435dc70 |     
    mips     |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/09be95d3f83939f3b0472ad35ff855ef24ed81fa |     
 microblaze  |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/bc865a6770517b7e2c40738411798af656b40b10 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                libglvnd-1.4.0 | 1 
                 qt6base-6.4.3 | 1 
                tpm2-tss-3.2.2 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/2c8e20be196d304e05ebbd89a8ced18e2caa72a3 | ORPH
  sparc64    |         qt6base-6.4.3          | NOK | https://autobuild.buildroot.org/results/7ea6fff0f376c318d765a91a005be9e0e5ec08ec |     
  aarch64    |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/e56b3e5352723e1d0ef7642adb4c3ad59614b9d6 | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

              fluent-bit-3.1.3 | 1 
        python-m2crypto-0.43.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/00454c53f9cbb81e81f1f559994b9328c56b6a5c |     
microblazeel |     python-m2crypto-0.43.0     | NOK | https://autobuild.buildroot.org/results/98ae9be1407230ae6c27daf0f8567fcde2b4823e |     


Gitlab CI results for 2025-03-17
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283653  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283647  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283644  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283623  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283616  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283608  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283605  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283598  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283586  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283518  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283508  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283495  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283463  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283457  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283436  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283412  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283397  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283384  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283371  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283360  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283340  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283336  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283301  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283258  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283230  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283180  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283175  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283166  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283155  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283153  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283151  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283118  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283094  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283076  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283066  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283025  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283017  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425283001  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282989  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282955  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282951  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282942  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282936  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282920  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282881  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282854  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282853  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282821  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282808  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282790  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282770  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282753  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282745  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282740  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282738  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282734  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282731  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282697  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282695  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282686  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282681  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282679  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282665  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282655  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282615  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282607  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282600  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282583  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282577  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282575  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282569  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282477  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282450  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282449  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282436  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282434  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282422  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282343  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282338  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282325  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282318  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282314  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282308  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282305  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282302  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282294  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282281  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282277  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282272  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282269  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282266  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282265  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282254  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282253  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282204  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282178  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282175  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282170  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9425282168  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
