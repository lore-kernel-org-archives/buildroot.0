Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F79CF9C69
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 03:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0067607CF;
	Wed, 25 Sep 2024 03:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZC9TQPpRElcQ; Wed, 25 Sep 2024 03:17:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F382260E0F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F382260E0F;
	Wed, 25 Sep 2024 03:17:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C5431BF3D6
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 03:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AF2684138
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 03:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWiy2N_xerPc for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 03:17:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 28F7884116
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28F7884116
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28F7884116
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 03:17:39 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-535be093a43so7759814e87.3
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 20:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727234257; x=1727839057;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cUQNUhUsc7qS/dACok02U3j9SJXZotg2j/ubeK3RdPc=;
 b=ffuNHD2OwO19raM4w65HlGv7bXBMM+HHHOP7JovD9sqGdOvs7m2pQLbObz+mxUGf2V
 UVlOZJuC9/5mBYuMuZ1yKUjcCwu98q3bqdJZ3jIzdtEnilUM2TiGqwHN53/u4DocUuF/
 l0bGTZd0o1Oto8aeJi9WsiWFf48o+TOjWdoIv8IPuQXNVBaAQ9bpu1ovEAun/uHt1d+q
 zMI8iXkdnwE3T5BY7Ahh1EHAnLVGxRuwf8VQGNUo5cbZaLFa5HauPMn3MDCLgHn+9wVH
 NzOUWPUse/JlaG3roM5FtKjhhXyEfCLAKG/wowLxk6kBXRwmlX4ZvW+nbxtrs1yqC/Fu
 gCPw==
X-Gm-Message-State: AOJu0Yw1AIKgVrrnOtkvEopT1xhMCgO8bFXwhTkGL8mAxPH0F4qoEp1h
 sVQSiCZWg5qP4SfjrkS0RuNuXn76pjwy/LSscd55IFYnFyPHhK3+5zynKA==
X-Google-Smtp-Source: AGHT+IHR/17jP3p+INmO+DWRJ7traL1TLvglNX0enQ/NvIP54DKUbBtAd9TRZje0HkdncxKgZpILiQ==
X-Received: by 2002:a05:6512:2209:b0:536:54c2:fb7c with SMTP id
 2adb3069b0e04-53877530edfmr609870e87.25.1727234256182; 
 Tue, 24 Sep 2024 20:17:36 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9393138ac4sm158867866b.216.2024.09.24.20.17.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 20:17:35 -0700 (PDT)
Message-ID: <66f380cf.170a0220.26382a.6083@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 25 Sep 2024 03:17:35 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727234257; x=1727839057; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=cUQNUhUsc7qS/dACok02U3j9SJXZotg2j/ubeK3RdPc=;
 b=b2RGIaq2GXUfUDa76J5a4AFLvmSHgjAJTyw3i4LbR16BJuhAFCylIQdBc55o6Fym0S
 LJONTPmmBXtu4EpolIRwWq4iU3t2BkctmSz9qvcN5+xc4mvoLm6Wt4WAdArAr7FtpQ7m
 fRMgBqcR5tSxjiezfXJNhPAUaYYFLQpBbn9zdX7z3uusiL990fsC3iEyKiP2sgsrcSCl
 b7aF2U7bhdvgUYe3E1+wl1/lRuJJCLPL6B/G6CKRnygy6+ZXEujnBlx9xZ5WAglOdbIi
 p5iV9DaW123QZNFE7wgz66sYzTGV7nIm1274jaqK8fNsctQ5vnKJAGZWVc9E8MxyNeyc
 Dy0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=b2RGIaq2
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-24
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Autobuild statistics for 2024-09-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  2  |  0  |  5  |
  2024.05.x  | 26  | 24  |  0  | 50  |
  2024.08.x  |  1  |  6  |  2  |  9  |
    master   | 12  | 87  |  0  | 99  |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 12
                  linux-6.10.9 | 8 
                libcurl-8.10.1 | 6 
             bluez5_utils-5.77 | 4 
           host-librsvg-2.50.9 | 4 
     linux-5.10.162-cip24-rt10 | 3 
           at-spi2-core-2.50.0 | 2 
aubio-152d6819b360c2e7b379e... | 2 
                  ffmpeg-6.1.2 | 2 
                 gnuplot-6.0.1 | 2 
           host-doxygen-1.8.18 | 2 
    host-python-greenlet-3.1.1 | 2 
                libdrm-2.4.123 | 2 
               linux-pam-1.6.1 | 2 
                    mpir-3.0.0 | 2 
               procps-ng-4.0.4 | 2 
      python-autocommand-2.2.2 | 2 
                 apache-2.4.62 | 1 
                   bird-2.15.1 | 1 
          cloudflared-2024.6.1 | 1 
          cryptodev-linux-1.13 | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
                     file-5.45 | 1 
                    flac-1.4.3 | 1 
              fluent-bit-3.1.3 | 1 
            gdk-pixbuf-2.42.10 | 1 
                  giblib-1.2.4 | 1 
            host-binutils-2.42 | 1 
            host-ccache-4.10.2 | 1 
                host-go-1.22.7 | 1 
              host-rust-1.80.1 | 1 
             libargtable2-2.13 | 1 
                liblinear-2.45 | 1 
              libopenssl-3.3.2 | 1 
                  libsepol-3.6 | 1 
               libunwind-1.8.1 | 1 
          linux-5.10.162-cip24 | 1 
                   ltris-1.3.2 | 1 
                  ntp-4.2.8p18 | 1 
             parsec-tool-0.7.0 | 1 
                s6-dns-2.3.7.2 | 1 
                   trinity-1.9 | 1 
                 uclibc-1.0.50 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/fb38fe9ecaecaae5295f93493ecbd997ebe42c97 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/df09e4fcb2586e4f065e3c4d6a069d62f738fc2c |     
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/f49433c73c4f3a81527ae1a1774b98bad8712c97 |     
    or1k     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/93368dcd571a57b2e149efd644f67a806a8fdf96 |     
    mips     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/5b50018e2286601fbd011d3efb1fa7feaa172aa3 |     
   arceb     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/f6d3f3660ff41eb94ba05bc7e07c831a7138809f |     
 aarch64_be  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/94ba4a0784008e095028861a244d93b2f483fad4 |     
    or1k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/455df2ff69cbd47fae353faab7f03981f7cbff84 |     
 aarch64_be  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/13e4a1e5ed77f7db72f4242594205cb91cd4b5ad |     
    arc      |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/cadb9de70fdc40b17c61a5c32adb0dd615daf41a |     
    i686     |      cloudflared-2024.6.1      | NOK | https://autobuild.buildroot.org/results/f341533f3c65ffd6e00bc4141ba7e8714112861c |     
    m68k     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/b2726d5a1c602a36825d3315afd2fd2c31336c85 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4f9ecf2d980c6ff667bf368c979bba21ae4c75b6 |     
    or1k     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/0e347b31c922ef8e3f6a6b9e7e75e664dc650f80 | ORPH
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/084658c9ac63736151994d88b6bcaa35e8311fbb |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/461f6707b115eb4406b33e761fc7898dd12b52c1 |     
   armeb     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/a3e11a608ba36f5dff3725f338a5792267116421 | ORPH
    sh4a     |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/16dc68f2f2244465751e1c0af48bbadaf814f6ab |     
    sh4a     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/70d7faad6014314594a941b82e77046e49eecb8f |     
    sh4a     |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/de2cf88d998a70fdc0c1215a8e3fc1ce429ec7e9 | ORPH
 microblaze  |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/a0b8aa3bf793f3272ad19b25360c9a6e5cea6a44 |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/0a152cbfe23703bc5012098864d7fd5608775882 |     
microblazeel |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/bf30762e45be3d969b8adea1ab3ce6831bab7da7 |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/632403d869aa934ab84f75d8faf00d861f6ee8e5 |     
    arm      |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/53f10294cad04dcfb4fb31ec758d1cfa7e2742ba | ORPH
 powerpc64   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/68d52f54a9169ceca45bd793c38f082a7245faa9 | ORPH
microblazeel |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/bff1558889ef5c00cf9a0fce9adde50c9b9236e9 | ORPH
   x86_64    |         host-go-1.22.7         | NOK | https://autobuild.buildroot.org/results/efe2cc7a128cab0a77e08954f40a0a76678d2ab6 |     
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c4c78adc4f7b418a68a256c6e2f2482c33e60af2 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c2191ed46b00d714b61ac7a841be96cbb54a7f13 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d177c99ba0f84c68df3d69007d3da742690c8c87 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d1e902b35edbd878862815797b6445c8bc0bd30d | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3f32db33580978c6312b20eeaa72802300a32bce | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/03986e02bd3b74e26995976d09e4735ce22b2d8c | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/00129b568e4d0adbcd595af7fd6699523e400788 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/30963ec1700eaf8001bd7570d5c47e93ee1b199f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a539690fbc2a6564a98d0aabf7f21f70c6ba020e | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7e4de4e1d09ae213fb3b49da3dfcee8d91369be1 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/28ffc5529e5aac621d35cb04b38094f00d168556 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/49182202099333313fbdd7d5742881903310ca42 | ORPH
 powerpc64   |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/609f41e429a3e4e5ffafd6e269071050f2618f00 |     
    m68k     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/4a558898d7cd0f966ab07a538b9b98fc88ae3d9d |     
   xtensa    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/e93dc37c88d91964e9617f8cafad281709e5bf24 |     
   mipsel    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/5be317c238358acdddb1ddc9c20e4fcdaecaee2d |     
 microblaze  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0872d0ffa2e9b19ff43481f24df12a2e83c6f676 |     
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/d4a0ba9c4c5766de4f56573dffc092c79e5a9ff5 |     
    i686     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/514d212be87c41a2e2069589434b7e0723f59eb3 |     
powerpc64le  |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/2efac444c733cdb05c4b5a4455ad3bafd8b12985 | ORPH
   mipsel    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/076310a07f8f6d2e15b9f270280be3148f9b8405 |     
  sparc64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/a9e5769c5aecfa7a50cf563fd6787a90e7c635d9 |     
    or1k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/39b419aceabbad5dc44b42714c4b0e5235dec6a8 |     
    i686     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/8654037beac843278a983c2f00049e6088aa6a94 |     
   x86_64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/da3d04818f883595026c12acc41402086638c42b |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/c44eceaf388d148c8ae55ac78e1272027bcd3f10 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/6842aab999598ac5577da832f8861ef3a4b48c86 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/3082151330a84c40afaf9026e8baf0b7cbe5b091 |     
   arceb     |         liblinear-2.45         | NOK | https://autobuild.buildroot.org/results/8cb103cf54a1050461076102cdeac785b825b3fe |     
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/353282aa54b0abff889a219776e87e4ba2d91463 | ORPH
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/4ae636b24b3b21845559311c66cdb87db632d487 |     
   mipsel    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/131187b100360f6267da20624cf99c48a4c065de | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e117921ce6cd56586901c00942646b15e04f35b6 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/489f602ca76f4fd3bab0b9dce13e09dc732dfee2 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/b9607ec19a6efa37cd4637781ad9cf7881ab9c20 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/bab062367c62d91bc7d05f9d646fcd03e5995f1d | ORPH
    i686     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/bf5d21cb39198e57ea0d8a63f66d6ffdf57787a8 | ORPH
    sh4a     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/69f186756e92dbd50919204a58dd13de28c23e32 | ORPH
    mips     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/a55cbe045f6b15f96794d1c662f6be2c0604c624 | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/a6c37f25897f58d1bd77f3d2a8fcdba325bedd9d | ORPH
powerpc64le  |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/55d2783449f78d826e7781470785c51d1b29949e | ORPH
    arm      |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/c50266870f8cfd2b5272221e11205dc6c5771a76 | ORPH
   x86_64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/f06d14a59059f959462a6a08af8184d4fa1f297d | ORPH
   x86_64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/f1cfda146e990a4a6baf2182bf02da4e63189996 | ORPH
    arc      |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/221de07b05aab3a7e52d247e345b1555b56bd2b1 | ORPH
   mipsel    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/3818cab534a32621413dc26b4103e1d525d76e70 | ORPH
   arceb     |          ltris-1.3.2           | NOK | https://autobuild.buildroot.org/results/4e7dc2648d969ec20112979e86e1e6174ec1cec8 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/38efe26528e72d5670f22dca881915d36119192a |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/cfbf6a55db29c0407dca106bd94a1c7c6fe96cf1 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f79575a54b2e9647c025551f0e077012aff2448c |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/c5e2184881b562dc2aeec9fc5e5b9e90377b56a6 |     
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/35d4209352bdc92ec4fb64cf862b0c59aae8d4fc | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/8b23e1f207f9222df513f0b1272b5a893231f228 | ORPH
   armeb     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/57b103bca7048cb35cb5573b8a4b69e1b84bf506 |     
    arm      |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/9bf455b89f6b95d9cddcd1e3481771738173a3f1 |     
    or1k     |         s6-dns-2.3.7.2         | NOK | https://autobuild.buildroot.org/results/7814e974eeb46ccc3cc449353a5bae3fc64457e3 |     
 powerpc64   |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/eec9797a307d983fa8807b62306b5b719cbdedc7 | ORPH
    or1k     |         uclibc-1.0.50          | NOK | https://autobuild.buildroot.org/results/5ea68835d63d9533ec34b396796cd271a6db04c9 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/533a660df0194d6f4778688624026bd382333a82 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

            host-cdrkit-1.1.11 | 1 
host-prelink-cross-a853a5d7... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/743a4ced742674b8147ec41286b4b497698a201d |     
   armeb     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/088796307da5e7c071d8ceec2c39aebb5132bb9a | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                       unknown | 3 
                    4th-3.64.1 | 1 
                 dc3dd-7.2.641 | 1 
                  ffmpeg-6.1.2 | 1 
            gdk-pixbuf-2.42.10 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
                host-go-1.22.5 | 1 
host-go-bootstrap-stage3-1.... | 1 
host-heimdal-f4faaeaba371ff... | 1 
               ipmitool-1_8_19 | 1 
          libcamera-apps-1.2.1 | 1 
               libdeflate-1.20 | 1 
                  libsvg-0.1.4 | 1 
               libunwind-1.8.1 | 1 
                  linux-6.8.12 | 1 
                  mupdf-1.22.0 | 1 
                 openssh-9.7p1 | 1 
qt5base-da6e958319e95fe564d... | 1 
       riemann-c-client-1.10.5 | 1 
              skalibs-2.12.0.1 | 1 
                   trinity-1.9 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |           4th-3.64.1           | NOK | https://autobuild.buildroot.org/results/8b36d1d00c3b8a78bf07b31fcff4b70b9a6e7117 |     
microblazeel |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/963429a45d0de4b004a7a1c8c63f242bcdda4419 | ORPH
 microblaze  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/2f727c357a2464e333786bad40ed216089054369 |     
  mips64el   |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/0c897e3b4182343525e2adcbf76d4342e0a8093e | ORPH
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/6e71103b4624069b49acca2933bb10e74867b5e2 |     
   mips64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/5bb4140f9b28c7f6fc198bd8791a5bcd3f9d6dd0 |     
    arc      | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/53e5540bc8d72fd56c833a047bcbbf47d42c9cd7 |     
    arm      | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/9243579ff2c5ebeedc110e90cc539df193f33448 | ORPH
   nios2     |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/edc1b3a59c71e5ba3cf013464c8527100606b571 |     
   s390x     |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/0b509dee4139e8edab0c7af587893c30d889086e |     
  aarch64    |        libdeflate-1.20         | NOK | https://autobuild.buildroot.org/results/91b66bd8e19b6ba4dabe7c3d5bfa29740784ff64 |     
    m68k     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/78baf543f701436f3e7638156be70b58e95b1463 |     
   mips64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/491482a19eb5f3e1b70426f4d9c9a31295222087 | ORPH
    or1k     |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/adecc8e6ed68b60ed340072eb834899840422b70 | ORPH
    arm      |          mupdf-1.22.0          | NOK | https://autobuild.buildroot.org/results/5e75badf7ad1e5d2e69d55bcb0a704cc11cd3e93 |     
   mips64    |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/335c586c1d6b389d9ad0012f62d5efaf3c0a09eb | ORPH
    arc      | qt5base-da6e958319e95fe564d... | NOK | https://autobuild.buildroot.org/results/0e8e43c9b9840239f4dfedaf5f4c9f67bb371b8d |     
 powerpc64   |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/57362c334558237c10799c3ae35bbeb41c7a108a | ORPH
 aarch64_be  |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/33524ed03a1b69c0fbbd915a757686749497ecdf |     
powerpc64le  |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/ce0ae9b249371fb828b7436cfa1e711348a7e050 | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/7e8416fe944d71b5bae62bb61d85f25a7467d47b |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/21e76b9a23015cdd16e3e8e960a50721add5b3bc |     
    i486     |            unknown             | NOK | https://autobuild.buildroot.org/results/42a4fac14006fcee01fc148af8436b9305d01c80 |     
   sparc     |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/c05067c558101950a243ec03e66632e69c4d965f |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

         gobject-introspection | 2 
                       unknown | 2 
  gobject-introspection-1.76.1 | 1 
                  linux-6.10.9 | 1 
               popperjs-1.16.0 | 1 
      python-autocommand-2.2.2 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/13b684b9d2f9f7cebc8f5479e3027bed3efef1b1 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/7837acc4abc43c2dcdf20664cc311e8d77a14a0a |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/ec7f9c002fe51b6734fdac22abbf6393d786b53e | ORPH
   mips64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/6ef4610a5feee5be3f76501aa2deeae39af73715 | ORPH
    m68k     |        popperjs-1.16.0         | NOK | https://autobuild.buildroot.org/results/1d00044caf6f1c08167a16abc6ed8715539e262c | ORPH
  aarch64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/7fce29ef5ebb42ecf0218d306ea1721d9c39184e |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/44962277310502432b9c27deacfe03533f3e9feb |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/e3a51e13199c614e5e4b9bc83ce0bdaa9138317b |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
