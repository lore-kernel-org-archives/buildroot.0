Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D514C35FE5
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 03:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC2AB400EF;
	Sun, 15 Sep 2024 03:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hhBGVvgjTTKK; Sun, 15 Sep 2024 03:18:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1B8C40169
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1B8C40169;
	Sun, 15 Sep 2024 03:18:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0399A1BF8A8
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 03:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCDEF8415F
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 03:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDYRTp4dcgVI for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 03:18:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8A61784118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A61784118
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A61784118
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 03:18:48 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-374c3400367so1835782f8f.2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 20:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726370326; x=1726975126;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N99XNe0TnCboHIs0Ke5YIFGUmCUmq93R9C64tZVQA54=;
 b=wTebN6+RABF02QbM6kqcTQjHD2pDoB1ns9UO0keW/mKSD5bVSV6jm605bNQD8hmzZz
 UTbaf6nD0lUlX1iEE32XdV219CZ8TITLat6W8BjyE4/1DMMgOoLcHujw6Ac1XtcQ+8JR
 DGaXxmq6k2L3AiP+o5b7E2iU4RdVv6SYGgZFr6frGXPkiCgHEnJYhD9ec9GshVrnlht4
 T8zZJW4MaHbPCJK0CkzDSMq7nfLDIHOiaxfxNjHHpGtVVATuiIn88gEgBOHn8ee6s384
 ScN4I8snlcLvn57aohntSOT6NiyBr1KS56vFuV2dWO7CTRsGaFKWGZVe9J6s3Jh+fJ9Q
 UGzA==
X-Gm-Message-State: AOJu0YzNGUG92mbJxhflcpRYn4EEGiDz+bkMXgf7tiVoHzh356k3ihim
 mqQJcqiM45s/9S4ChKuZxILMbNTVh4bU0i5WOof4Cbp1V23rX68Ji/EosQ==
X-Google-Smtp-Source: AGHT+IGJ4Rok4C4xToESlRsmvssB4/twodN7MpeN61XwwGsVEwgqRnLXEP5Un0o9Cw3HsJYfGH59Pg==
X-Received: by 2002:a05:6000:1292:b0:374:c231:a5ea with SMTP id
 ffacd0b85a97d-378d61d4b4emr6048754f8f.5.1726370326106; 
 Sat, 14 Sep 2024 20:18:46 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e4b99sm146195266b.173.2024.09.14.20.18.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 20:18:45 -0700 (PDT)
Message-ID: <66e65215.170a0220.243184.3a8c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 15 Sep 2024 03:18:45 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726370326; x=1726975126; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=N99XNe0TnCboHIs0Ke5YIFGUmCUmq93R9C64tZVQA54=;
 b=McSg2fUhPW6nvbBHA+NHQN9AIrKvab7bT+VN1Va4qkkot8gOsxgwPYSqa+2ZLx5nil
 BFcGQpyydX5oRzNHZH7XvKNB4khi5wmB4LTNoJ1Ht0sv0urlBNmnFp5dajxXx9vEp7Hw
 3b4PxqlP8KAm/UHB/P2+OezAB1noAboL2JSpskokD7ciSMVD0HYb8fAtWNwj5citkbdj
 tile2DqfmyogAovB2cIYQ3U2720+SZLZ33NQa3xlk/a4wIomD8yIeyJAB+x84/JVqbqU
 px0h+FyZuQg7z4uwYgyypMztPMajOqyuwU96GCRnZgloPl5p8rbtpY8TRyKVS23iI6rQ
 luMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=McSg2fUh
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-14
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

Autobuild statistics for 2024-09-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 16  |  4  |  0  | 20  |
  2024.05.x  | 10  | 18  |  1  | 29  |
  2024.08.x  |  4  |  5  |  0  |  9  |
    master   | 11  | 307 |  5  | 323 |

Classification of failures by reason for master
-----------------------------------------------

                  linux-6.10.9 | 24
                 libssh-0.11.1 | 23
             bluez5_utils-5.77 | 22
               procps-ng-4.0.4 | 22
aubio-152d6819b360c2e7b379e... | 16
                  bind-9.18.28 | 12
                 libssh-0.11.0 | 11
          cryptodev-linux-1.13 | 10
               linux-pam-1.6.1 | 10
                  ntp-4.2.8p18 | 9 
              host-rust-1.80.1 | 8 
                  libsepol-3.6 | 8 
  gobject-introspection-1.76.1 | 7 
           host-librsvg-2.50.9 | 7 
          linux-5.10.162-cip24 | 7 
                     file-5.45 | 5 
glibc-2.40-18-g564178076272... | 5 
         gobject-introspection | 5 
     linux-5.10.162-cip24-rt10 | 5 
               pulseaudio-17.0 | 5 
           at-spi2-core-2.50.0 | 4 
                    bsdiff-4.3 | 4 
               ipmitool-1_8_19 | 4 
            linux-fusion-9.0.3 | 4 
android-tools-4.2.2+git2013... | 3 
                  ffmpeg-6.1.2 | 3 
            host-binutils-2.42 | 3 
            host-ccache-4.10.2 | 3 
               mariadb-10.11.6 | 3 
                 pixman-0.42.2 | 3 
             batman-adv-2024.2 | 2 
  binutils-arc-2023.09-release | 2 
                directfb-1.7.7 | 2 
                   duma-2.5.21 | 2 
              fluent-bit-3.1.3 | 2 
            gettext-gnu-0.22.4 | 2 
                 gnuplot-6.0.1 | 2 
              libopenssl-3.3.2 | 2 
                libxml2-2.13.3 | 2 
                memtest86-6.20 | 2 
                   sdl2-2.30.6 | 2 
              skalibs-2.14.2.0 | 2 
                       unknown | 2 
               valgrind-3.23.0 | 2 
                xenomai-3.0.10 | 2 
                 apache-2.4.62 | 1 
                 apitrace-10.0 | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
                   bird-2.15.1 | 1 
                  boost-1.83.0 | 1 
                   bzip2-1.0.8 | 1 
          cloudflared-2024.6.1 | 1 
                 coreutils-9.3 | 1 
                elfutils-0.189 | 1 
 host-binutils-bare-metal-2.42 | 1 
           host-doxygen-1.8.18 | 1 
         host-gcc-final-13.3.0 | 1 
         host-libxcrypt-4.4.36 | 1 
                   httping-2.5 | 1 
                  jack2-1.9.22 | 1 
                libdrm-2.4.122 | 1 
               libglib2-2.76.1 | 1 
           libmicrohttpd-1.0.1 | 1 
                  libsvg-0.1.4 | 1 
            libsvg-cairo-0.1.6 | 1 
                  libva-2.22.0 | 1 
                  linux-6.10.8 | 1 
             lirc-tools-0.10.2 | 1 
              luabitop-1.0.2-1 | 1 
                   pcre2-10.43 | 1 
                s6-dns-2.3.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/ca378d9b607474e1ae303f313471a174b58c8728 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/d50bcc36239183f9149d3d6cb5543fc314321fa8 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/179c3a06282fd34df46269c6089d130d460aa6ac |     
   x86_64    |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/1a157397ef56a5837f1d6654e634cabda408e0c1 |     
    arc      |         apitrace-10.0          | NOK | http://autobuild.buildroot.org/results/88c0e891d534ade88ad9950cd062904404495e3b |     
   xtensa    |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/5f01e68b1920afe97c71239cbb04deb3f0cfb0e2 |     
  powerpc    |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/55898217c7eadd8beadeaa569094acde4cd5d1f4 |     
 microblaze  |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/096d487ac73b4a5e2c0bc6ff92902d003a6b7d8f |     
   xtensa    |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/47044325d3e784aad98d0adce55e647dace8990c |     
 microblaze  | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/0438837069e49862271ec6c980b8acf5f266a121 |     
  powerpc    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/dead6a4c81e47f2eaee77b211e2e8da049be9872 |     
    m68k     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/aff0995a996f9e8f776b81a1ee2bbcfaaedbcd5e |     
   sh4eb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/560d786151801feeb5b93ea0950dc229d566d77b |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/b025cf1c08dd58fb59265ac1793dd272e2652969 |     
    or1k     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/76dd5ac5ea31caadf33d1662da034dfbb871e53c |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/029608fbbb23984a49100586f502d83016ecf8f6 |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/2dc0b0447a7f4c1d726e8e7d61c3e4fe7726ef79 |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/a73a727487416b28e7328b56dbffb82c708850b6 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/1d9403f17fd18ce86fb26f238531aba0c21e0857 |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/87e8d017ac37b8bd6614add58509117832debce6 |     
    m68k     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/cd8c3e200a7ae97170307861d862d5dffbccb7e0 |     
    mips     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/de18c9fc3768c8d2f4afc6044694f3c253637128 |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/efc8fcf4c975f29f6cb872952fc12ba87edf64dc |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/c062eda1ca73a173dbbd13262a2f62def337f1e9 |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/8e2d9e54ff2db401aaf8141183234c077b1cc857 |     
   mipsel    |       batman-adv-2024.2        | NOK | http://autobuild.buildroot.org/results/6b2123715baedb52b99205eb5e99a58b79555261 |     
  mips64el   |       batman-adv-2024.2        | NOK | http://autobuild.buildroot.org/results/82c5d80a7395b32e0826d082bfd8b06a23e86032 |     
   sparc     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.org/results/bfb31cf3055bfe6037b972459cec2a055c822eb4 |     
  riscv64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.org/results/37220272bbc4ee793afb0dce302f8be00f418cde | ORPH
   sh4eb     |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/2374ed24a386181ccd7b6c11b8d28b9f971506d0 | ORPH
   armeb     |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/4a71b40545cd637c68dc760eec6865fc257440a6 | ORPH
  mips64el   |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/45e3c6f94610fa189e2b59891a4bf50566249f74 | ORPH
   s390x     |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/e5c99bee7e0a3d3f7390632903b43b69f124ee5c | ORPH
   s390x     |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/d152a795fd13404952ed27856fa4c57f243065d9 | ORPH
   armeb     |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/978bc8b0b6fb71cc2f48664390a9249b8708629c | ORPH
 powerpc64   |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/ea4548afdeab15f318e20eb828b9c89571122fac | ORPH
   sh4aeb    |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/f8d429db34209821e072cac580f0a07a395a1764 | ORPH
   nios2     |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/96df363e995451fb86ec0d7137ed0b73d672f855 | ORPH
    i586     |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/5dacb169c7c4257769585d71360aedc322dca14c | ORPH
  mips64el   |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/8bcce555a9910a5e17ab7ab44f2e3db0f54cb2c6 | ORPH
  aarch64    |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/3a7dd540b78fa30a1b0b68016870355cbf1eca5c | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.org/results/80e922d21f92a67aae9d49d1d7afa1c666dc8bf1 |     
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.org/results/8f2887ba3221f9b2bdf0039db177ca7dbb32a8aa |     
 powerpc64   |          bird-2.15.1           | NOK | http://autobuild.buildroot.org/results/e4d7ea4a53109038e1f72f83cfb4486de56ed3ed |     
  sparc64    |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/2969e49a8c3fb41796df22b9c7a1f7d5154776a1 |     
    arc      |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/fbc4e95931780b1f403505c46259816ed09359c4 |     
microblazeel |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/5b16248c2215916f4e97f05a22b5c792bb60aedc |     
  sparc64    |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/37d56d5ac85b64dfc53af4aa9590ab5b239b60ad |     
    or1k     |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/d6d7cdbfeb3c43863a3b7a342db07a2bb7868f17 |     
    m68k     |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/6adaf68b716af556ec053a0bcab2251cb3a372f5 |     
    or1k     |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/777d89f68ec4eba9616bd220b36d2b994ca19d8c |     
  aarch64    |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/6afbd23521304c93240935e081408a7af7acc904 |     
  sparc64    |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/7257e1b18526b149023d36b548193709e4200c2c |     
   mips64    |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/ee3b4a02724d390275199193bcfc5e20e9c31a0e |     
   mips64    |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/3efe5718f95549b89c70042b1b89718e9073d678 |     
powerpc64le  |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/031967b77ff8f0bfe418916eeaaa36c943b9ad73 |     
    i686     |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/fc53c9054905b9f68f5eda14ce2c9d08e1e5082f |     
    mips     |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/ac7de2b37dafa63199d8a603711b845a3f883e2d |     
    or1k     |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/2166da8cff8d2b5d86daf74cc501b39c3d5c7d95 |     
    or1k     |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/d31ddcf822a4347a8568322f31b630969bbe541e |     
    m68k     |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/4bbee5bf8a2c9a0ee8616c63c62721ac19d0c4e8 |     
   arceb     |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/faac114995046198621d7c31456ba211769c8e0e |     
    m68k     |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/1319e3309eee66456849bb4cb69aaea779516f4b |     
  sparc64    |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/5f951f02e75a7af8a7c5c2270ea64e1c2ad474c0 |     
   nios2     |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/cddc353bb81b59fc24b06688c817c8749b816046 |     
powerpc64le  |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/1730e0887552916570f88d092d146ceebbb7b7d5 |     
  riscv64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.org/results/6ffa5a59568ad08b0655b0d6573bf0a868fb70ec |     
  riscv64    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/e4338ca75fe807bced94646af24bc04c0673cb54 | ORPH
  sparc64    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/447293a1c2ba6770e0f80bb92340a60f45ee98b2 | ORPH
   xtensa    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/ff6a61187a416664210e755a5a57380e47c040da | ORPH
  sparc64    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/618f9b719d5487e44e827abec41cb17a6da04143 | ORPH
powerpc64le  |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.org/results/59d5de15c5cd55478f8454bf25fcf7a555cb1256 | ORPH
   s390x     |      cloudflared-2024.6.1      | NOK | http://autobuild.buildroot.org/results/0e024045756e4193e05bbd2dd09b6b44ee4fa23a |     
   s390x     |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/572e881434a5afe1c9c0646c2d5709e84b2fbd9a | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/895172835e61d02aa09bfc75eb36648ca39682ff | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/fc1762a89024f8e461200358f0de304df81c72ca | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/6c92905f227e54d29954154f303eb61ef91d9000 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/7e11e88a9882c89c40f90106125fff3a819dd048 | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/da20915789eae2c308421d7f2ec081852de93010 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/0cb723c9f8df3dc70da39b22e430ca5b7dd9e3bb | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/704ed14f2750467991c85886258f3aa3c8d9467b | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/f6098dee0b1e1c51ec89ff40332986f8855d3538 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/49c6a763a585233d9a0789ee1823586684f7a586 | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/b1d70883ff900987ea4871d736664e4c3a68ff5e | ORPH
   armeb     |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/fc2078cd01acafede05af4f6a844fa4a538ee8c6 | ORPH
   armeb     |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/10fbadbd6dbf98af259eb18130a8d6dc83c3b8d0 | ORPH
  sparc64    |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/85b2da1307e8c3a74a6423420dfedad6ce6d245b | ORPH
   armeb     |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/3850407006d1ae22e5d3e3a82effa1e89bc3aff2 | ORPH
  riscv64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/5ffdfd834330b2ae153767d53c65a23e5e21b291 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/d950de1681cd175542ac93a7bbab3aeca81fde86 |     
    or1k     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/765d38a624180620ce925a01c16d085e22fee4dc |     
   armeb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/f5f2d16226ad9500ecf046779d5282ee071a54d3 |     
    mips     |           file-5.45            | NOK | http://autobuild.buildroot.org/results/c237a029b8188b7632b8b669adc1c7e7520761f6 | ORPH
    i686     |           file-5.45            | NOK | http://autobuild.buildroot.org/results/52330c7e21a36707ac230a310f903774f967d99d | ORPH
    mips     |           file-5.45            | NOK | http://autobuild.buildroot.org/results/821f77e2e993d238a441c5861c09decfcd5fc4af | ORPH
  powerpc    |           file-5.45            | NOK | http://autobuild.buildroot.org/results/8f78f04513bb1e15dd6687cbed3426096e364116 | ORPH
    mips     |           file-5.45            | NOK | http://autobuild.buildroot.org/results/9d1be469e0b32771051d38b09e7173ec27ff2231 | ORPH
   sh4aeb    |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/8fa1fd7823293b1ba89b7efe0ff563c0f9cc4d08 |     
    sh4a     |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/374a0fa0d1fc1d49277436d4cc88f41dfbcff344 |     
    arc      |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/b18780f05ebc3c43654602a13329207d550da3f4 | ORPH
    arc      |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/e9b60f12f15c2e315ab1214f3901efaa11de9ed8 | ORPH
    arc      | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/136517ab3887c482788c14ad2287b33254501d20 |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/94d0eddd0938c9e5f97f5290dc763f7aa47e076f |     
  riscv64    | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/a775b292869eabf99a964eba9206b52a5848789f |     
    arc      | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/4136363fa2f53b16f04ab11b7e58f133f5526bcd |     
    arc      | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/8845d4ad2d2e75fced131d6fa3dedb906d9d23b4 |     
  mips64el   |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/4e809f836270ac1025c5787ce3738d69b45f657c |     
  mips64el   |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/3a2e20b71f9774429d5519136af030dc404cb064 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/42ae448c40fd9f6d483676c388252256624e74b5 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/485aa86a3851776f4a98f023cce7221a353ec7ab |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/2045f25307fce779fbad10e28bdb214416ea056c |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/aa7ba45ac29ddeed8b10554fa3f392b9f04adf9a |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/34947dce1be90783b7c3d07d56ce5c79f13252b3 |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/2dcc79940918c9d575c0272a44ab988028275c8b | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/cb2baec7ebff9c4836690c5caf53a7a072f40e2e | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/ee0eaace4798a00213ff40fa06748b6f1a5d707e | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/3124eff0c1f152b60d7154286610228bfd1d1b31 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/f18101f7b61968eb71aba52f7b1f14b4b2d0fa86 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/7d869fdbc8cc12d515120cd7b8c7650439feb6b5 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/b36ef3e2da70261146a0279e822886307bb8755d | ORPH
  sparc64    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/751eab7900fa169dcf93423a12f6ae02fcc88bc2 |     
   s390x     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/8970730d6a53f85e7f94d89d98152f59580c029e |     
powerpc64le  |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/9f5e8d1a703db3e77d617317acfb3f8781aeabdc |     
    i586     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/99ac536625964624232ac54933aa77caf4eec8d6 |     
   x86_64    |       host-ccache-4.10.2       | NOK | http://autobuild.buildroot.org/results/8817a45baab267de1b49167914bcf6abfe179fb3 | ORPH
  riscv64    |       host-ccache-4.10.2       | NOK | http://autobuild.buildroot.org/results/f528c08121fd86117f301fb4c026d5fcf709809f | ORPH
   nios2     |       host-ccache-4.10.2       | NOK | http://autobuild.buildroot.org/results/226354769388406f4aaa0d534fa4a1f56870968a | ORPH
  riscv64    |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/98e030596630539ba80021fb57700a9deb0691f6 | ORPH
   arceb     |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.org/results/20d7cd187231baa10350fd88b66124c6b9719a36 |     
 powerpc64   |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/a9f3634c843e84486aa11bfe2e7ba9fa5cf77273 |     
powerpc64le  |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/10a690847cf1807e9f97636351ce737603a25b34 |     
    mips     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/bfe6ce412ca9094a342e96017ed2e6bf77cf180a |     
    arm      |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/fc5c0ed9412a352a16f9885110e64d4a3309041e |     
 powerpc64   |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/a88ba68100f44d9fcc0dad72e588f1980ea62069 |     
    arc      |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/a1e07b59f51fb5029111e414371954a94148f6d9 |     
  sparc64    |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/f053be19fc262c879628748db5af5fe586aa4069 |     
 microblaze  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/81f2dd6878539f78401c4f158784ac563ff3fab9 |     
powerpc64le  |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/55d58ad1c3338aa50e3f66c4c3ac7a41d77a7364 |     
  aarch64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/dcee4c52d7103b9dcd2fadb83d35ec3f248fd1d5 |     
   s390x     |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/f3109139793858344a7a4536441d4420a3485c6e |     
  sparc64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/3a5f4859fb7a5018c1b87749e0359684e385a214 |     
   x86_64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/b718e626383637c3b41265ff1562d85366fb3b8d |     
powerpc64le  |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/38ae6521835832df536f9fe8fbbe12910bfb1edd |     
 powerpc64   |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/e970d0c615c843bc9ee8f6990a6fd4d53a4e8de7 |     
  sparc64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/c3d4beab168184b8fb82e97694449d41f672b7f7 |     
  mips64el   |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/13b72983491affb877802b3a14b169fb41878444 |     
    m68k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/fe649a67bcee1ad22f4c9d41d2677f466909ecb7 |     
  sparc64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/f166d6489e1eecd1e396ebe5200ae967f333e33c |     
    mips     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/51e55b859c223c8e17704318e7f394b230a44b72 |     
   armeb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/7bf83e83da74fe63cce0f9b3f9b16bed480888fc |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.org/results/73e1c7dc1254616cca145f87bc9fd99c3035cf9c |     
   sparc     |         libdrm-2.4.122         | NOK | http://autobuild.buildroot.org/results/f80fbe45b8ec0d26dc05ec8bd347e8503b5977fa |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/bf50644777560791221bdac1bd4489a764c950bf |     
   sparc     |      libmicrohttpd-1.0.1       | NOK | http://autobuild.buildroot.org/results/37c8a5c539dabc3c621cad7de22c7a833977f5f9 |     
 microblaze  |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/12fe2a964f99acd1cb5c0e4826047650e86bfbaa | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/79adaaa4ff577d6f61391ae9d1c0bebdad12e5b6 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/f3dbff2a52a867977191e27be0b5f8977683940c |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/a97b11277befaed2c2081fb8decd6af9a0bc70f2 |     
  riscv64    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/7794c71ffe8168284b7ac41ccbeeb14b0172ded0 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/1d0917372c7b94e1402304ee66aa12c2152d14f2 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/bc116ccd874eaeb42c685298dca2881271b84640 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/d06b02aaace4b497b998c9dbe7a434ce6bdb0d5f |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/3af3e01d3e5a91aee117ce231ea28be592787bf9 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/9ab8e3a7b44f04c8b6833dba46ca652f1bc6d57a |     
    arm      |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/42bb0cf2aebe5daf77ba25d323b47db30a193234 | ORPH
   mips64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/30a06d313202970b0a27748da5cd9ee9ca103a2e | ORPH
   arceb     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/638921d7b8d755dc940178ec12bb01f001214e58 | ORPH
  sparc64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/161e285ee51ff4e182b3773e71f02a06048146c5 | ORPH
   s390x     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/f74985fceea2b5614ec35286548ba80dc59f4eb6 | ORPH
   sh4eb     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/8a7bea00ba9aebe89f507a12e792524fce982832 | ORPH
   s390x     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/868f82a8d9c09d4bd5230a70926cad41e043019b | ORPH
   s390x     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/8498f2c0eb52b3e0897f391a4a5b8833e7a6fafb | ORPH
   nios2     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/6340fd03c6d91c376c45a680345398e628dc0a93 | ORPH
  riscv64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/6fbadf864a04dc8a1caf93e5f57d110c78117db8 | ORPH
  riscv64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/b55e659cf845bed7a43da4c1e7ed1e9a9b99834e | ORPH
    or1k     |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/bc7fc2bdf6aefd4ce98afb848499160b44b56027 | ORPH
powerpc64le  |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/683e4eeada3c3291dc09e096dbd9edeed3fb1eec | ORPH
  aarch64    |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/72cb803d6e26cf14c17c2797aadd17a9be9fefd4 | ORPH
  mips64el   |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/59c9e1bc8ece509546a0fd0166772ea7d8c6d57a | ORPH
  sparc64    |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/2540d367349a6eeadcf5f9d20c66082df6e99787 | ORPH
 powerpc64   |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/83a7f8a166bfadcbf530fbd76f38ae196a7bee16 | ORPH
   nios2     |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/26e420a4b362849f20d57f29fd7a4e1f9b38e343 | ORPH
  riscv32    |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/89d5fa62e085abc6d3a18b0920d85316bbdb7b40 | ORPH
  riscv64    |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/a478dabcb5fadacf9620cefd3f95a3c77402d931 | ORPH
   sh4eb     |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/3cfefaecbde936dfb390b9216da407d9bcab75dd | ORPH
    sh4a     |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/fdbd3dbac9ef496de403b37b19ba4f618be5a9af | ORPH
microblazeel |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/91e270cedf59cdea36d4dc92c631fd8aaff5b18b | ORPH
   mipsel    |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/922fe00d25da821fc4f04eb3327406b16dc657ff | ORPH
   s390x     |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/50359831e24e6e9508f9605cb21594ababc61fea | ORPH
  powerpc    |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/cfc59f98091bc66985b08fd61a2862887f75d768 | ORPH
   s390x     |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/623c70b470f9e12207264ff8892c9ac6893c155f | ORPH
  sparc64    |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/ed0b2f3f50d8ac345c50f4f99b31f747f40ea77d | ORPH
   mipsel    |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/a5bf33f13563a5f9ebc74a2858d3c910ef49a313 | ORPH
    arc      |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/7e4ea27dab8bbc07eba40ab1795a071825e75f44 | ORPH
   s390x     |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/f76a022f922ff9a905faeebc5c6c36ee9ee56d90 | ORPH
   xtensa    |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/755a3e7bbcadf90d27e7d46d0909efb58eafcdeb | ORPH
   sh4eb     |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/8ce91dcd32bebcbbd65438dca9b5c7914b71885c | ORPH
powerpc64le  |         libssh-0.11.1          | NOK | http://autobuild.buildroot.org/results/1d41594d0f58a273875c69fdd2df9645108d06f0 | ORPH
    sh4      |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.org/results/64bba636de5e98e8718122c6e6993f0487b43e53 |     
    or1k     |       libsvg-cairo-0.1.6       | NOK | http://autobuild.buildroot.org/results/54bcf1840ab732bbcf7f10f065e25b1a22044ff9 |     
  riscv32    |          libva-2.22.0          | NOK | http://autobuild.buildroot.org/results/3c9942b4e82bb28eb8a1d35870ad30535ce3ad3b |     
   xtensa    |         libxml2-2.13.3         | NOK | http://autobuild.buildroot.org/results/595ce731bf6ce742c9d8ca8cba211ab26b7ecefb |     
   armeb     |         libxml2-2.13.3         | NOK | http://autobuild.buildroot.org/results/07c5bb989f2cc35fe521e681039358b7ebd8fd79 |     
   armeb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/7993022e5c1f89be6b04665c2a03a79d131737b8 | ORPH
   xtensa    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/9a638616716c264bfe781ad12e9400adc730f229 | ORPH
    sh4      |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/e2f458d8a489982c578b81e4b586008ef9878bc4 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/62d58801e8f36dea7eb964d3daf6044a25d32299 | ORPH
   arceb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/2f1737ff08a5a8c78adaf2808a33d8d5caf24bec | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/83e0605857efb79fdf930d8a7e54dae977d2b0c3 | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/07a068f7e52f19a965fe1f806af546d59b0bb775 | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/ae20f4fc9317a7ed199a47ac73907fc2852193b8 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/baa066e324920a605263c82e195685dba843baf9 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/1d613b64e41c998d4b8d6e015904246f486046c3 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/37e7ed67113d2fe2f136ca79871667fbcb6c3546 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/274079f3d15051fab2398466b5ba622ee3d40ab4 | ORPH
  riscv64    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/0c339ea3c7b2a0f5d30c9f29eeb76008b02a74d4 | ORPH
   mips64    |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/94f7b263132fa1cc61d82501ffd389c34fb12838 | ORPH
  powerpc    |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/cf67059fb6dc2976d49bbcc0ac3108181958e727 | ORPH
   mips64    |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/ff7d0af0dd942d005f5fe590613c90721bbb1bbd | ORPH
  powerpc    |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/71d2b2ab0b6ec81a020c83916d2b02a46977a971 | ORPH
  powerpc    |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/a25e4f2ab87a8b6aded3da82e0c01600c6e1ea80 | ORPH
   s390x     |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/404b0fe9cfcd7cd9e1a350084c23dc4afffb0cc1 | ORPH
    sh4a     |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/00aa9cae0ad21b08c65964b95e0b258f27d7ec32 | ORPH
   armeb     |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/0dda8207e28b8dd5029e69589fa941a1f7ccbcae | ORPH
   mips64    |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/b4f34c72acb7ef795fb241efb4c2f9e3db21b80a | ORPH
   arceb     |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/399678962c89a9f3923d693710accb65906c05b3 | ORPH
  mips64el   |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/4f39482cb9cb68e7a04e149bf6be56735f3daae6 | ORPH
 powerpc64   |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/b8cdeb7fab965bab7f2853bb74f63ae1b04df802 | ORPH
    i586     |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/5b97fc98b3f1ee5c3a3add1be678bed9e3f33f6b | ORPH
   armeb     |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/e06dd2cdc93a6a07a7fdaed1c462320f64390001 | ORPH
 powerpc64   |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/ac3d48bf1b24da369e840058f94869ae1a2bf521 | ORPH
   sh4aeb    |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/f71588f00448afcc2316fe7e2896e5d9d9bb29f7 | ORPH
   sh4aeb    |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/5d73414ad068dcdfafe935ec04c26231f4e9ccb4 | ORPH
    mips     |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/9e5b5a107c3df7d1253ffe95862e82bb5344ba45 | ORPH
    arc      |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/b2600859b30b83d9a12b0fab6d7863be17762bf0 | ORPH
 powerpc64   |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/5fe4e085a134e74f56e0be643a6c68ea3e6b4a93 | ORPH
  powerpc    |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/97906c3f3298a94b33305a263277d67341e8f625 | ORPH
   mipsel    |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/4feeea6e6a6ad788a37fcce2cced84db3cf40490 | ORPH
  mips64el   |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/2923c6a142593284f35d68b2aa6b520020803b9d | ORPH
    arc      |          linux-6.10.9          | NOK | http://autobuild.buildroot.org/results/1af1d7cd186e80a41382ece6ab2b4f4f09f78ae4 | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/b7b0b64aa11c8d3f34c9d64d95abee003d1e647c | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/3c9ad4725f88a68b6c926e372db0a6c1901da6ee | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/1fd2319613b92394800002fa18dcec67a10937cb | ORPH
powerpc64le  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/ea52b832d827447ab3a0103a054394ff4740f2a5 | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/c433a03564b2c516491558c0a7f18443b61b6de5 | ORPH
    or1k     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/f8f52687b6a6aa89e6af27a8a12dee41ed37e198 | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/eb51efe5148a62438201cbdd72a130909791615f | ORPH
    mips     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/1a8ed9886529c3a88259adb92745f634de290546 | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/791aadc34c39cfad40385736df3d038357aa6cc1 | ORPH
    mips     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/7a40cb71b118f0ddff9272d452441dda7bea8b26 | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/caa01c2a1a79f4f01f6d3baec65779bfa4994cf3 | ORPH
    m68k     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/b8ce7da8348cc44ca955f10787b747fe4ec57761 | ORPH
 aarch64_be  |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/61476689cd6086d6919b695eda942018fb3d447d | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/277d0fd3812b5a4479ccbcda7d6fd2bbe9da8cfb | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.org/results/afbcee56e030280360f3071155da681df02a41e5 | ORPH
    or1k     |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.org/results/61d80339fe8a2a91f2f5ec9c87eeb346b55116f8 |     
    or1k     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/59e99a4b43e86deb0f1c904614af5c9aac3f176f | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/4bc5193ae10f97e3b57c158e43a6b74923a29a3b | ORPH
    or1k     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/8a1dd737129dbb7a81366797448b8a8aa7323bba | ORPH
    i586     |         memtest86-6.20         | NOK | http://autobuild.buildroot.org/results/73f94bb0f149c0ca5818b9e915281bb907c0e4b9 |     
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.org/results/e623a1ea7647bb7c08dcc65875e7abae94faed94 |     
    arc      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/6c9261d4f4953c693dc15e96c0b9e13ed04c4e36 |     
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/1e1468654be81ae075cc8b7cf825040fff37f932 |     
  powerpc    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/75cd510e55d50a1a2da6e9e285ec7a09201d854a |     
   x86_64    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/68e83cf87ef1f984ea8ee92ed9a89a3bf9db8648 |     
    i686     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/82092dd328168b5605f3944ac8e0cccb81a09d06 |     
   armeb     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/c04d13bd67997cd52dc607bfc42dbdbc580fd3dd |     
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/cb1f3f791d509bdf3231a9448fa34b16c18dc37c |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/6c86888a4a87dbe69820ad3940c806c1ac5bc20d |     
  riscv64    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/56e8bc267adfecdf6afa57828f6314d08149d98d |     
   mipsel    |          pcre2-10.43           | NOK | http://autobuild.buildroot.org/results/fc30ab472d27d630061e944a895496d072fa8b91 | ORPH
   arceb     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/a21ce352c729ecce5a7ddfff704ced8b899b5f32 | ORPH
  sparc64    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/de8f564b39ca003b53ff74c84b1c9d77b4c61958 | ORPH
  riscv64    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/abd2c0f62a136ad77d469b1557b7dc5dd20861b0 | ORPH
    arm      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/4456fe8c3ef3a55d74b52fcd11b012e253269a65 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/f198394145b2a084318913c5b6fffe87ebc273ee | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/d17eca5d3b2131cc84f76fb1f601b5211783217c | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/2d32bb15d36a03e4b0a060a1c5c046b610a082d5 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/37c466d642fcd4f7d4f43bc3f8d1fb5fd6275888 | ORPH
    i686     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/48882fb1db12b38148a7b6659b8e04ad45bed726 | ORPH
    i686     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/0f6120e2a72997a76ddcf1625a86a120866a4d47 | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/f3b07c95a4c5e4182c2626a69cf0d3bfe256df75 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/a155607050b5d7334bdd8d9138cac4db4813ea5d | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/2d1b20e8ccc44d48283c7d428a705dde2dc22aa4 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/da69440b8382b6d6bec0b4df4117253d73586d70 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/268559e1b4785e129809f57e95b49f0f0e557c8b | ORPH
    arm      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/9bc0c100d514bd91a55f2a2a65a8a3e85b4101a5 | ORPH
microblazeel |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/7f306cb4f85449b24956b0ebf7f6c24f6790310c | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/6468768e4d4d1ab8da96087858ea7227f7cd6fb7 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/91facba93ff1210581e7acd1b214b719aac4d477 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/a4de5cadd2e04fda7a2a68cebcd6ab8624841128 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/95a0ce6cc2a9f340c230184397c2454331c50f06 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/9d89f6a99c3a3b67e79e01ffed3db780584624dc | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/2b83feb7d8e3d2d325ce37a6dbcf862047e704e0 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/c9846ba5a9380a6022d9637ec6af2c9832203b4e | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/1c1f16b8e8e11cb427c6295ad681df395e7e2051 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/01f0972e8863d2073cedda371b5c796723d03ea0 | ORPH
   armeb     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/7eb288a2c912e0070ee6e523b84d65eb58c68fe4 | ORPH
    sh4      |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/bf67b3d375e1baa1089fcdb3252262f4a7ef2218 | ORPH
    or1k     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/8c37c6d5f9c89338f8d416fb22943df4f002bdce | ORPH
   sh4aeb    |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/952ab800ffe86d2faf7af8af691a3292837b51da | ORPH
    arm      |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.org/results/816c207ead6c1e1a4e796163d30134c274d0924a |     
powerpc64le  |          sdl2-2.30.6           | NOK | http://autobuild.buildroot.org/results/e1e926085a8f78e3b0f574f54c8dd33d91416d53 |     
    or1k     |          sdl2-2.30.6           | NOK | http://autobuild.buildroot.org/results/60e7956454bcfcbf5d16483f3df397005405247c |     
   s390x     |        skalibs-2.14.2.0        | NOK | http://autobuild.buildroot.org/results/6cae212eedebe0e6ea633102da352bcd03864cd0 |     
    or1k     |        skalibs-2.14.2.0        | NOK | http://autobuild.buildroot.org/results/e433d56b3e7b4efa30623e89bc5ea0d6197df05d |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.org/results/6a156e31f3841214d9e9fe7f11517b3c1a457aec |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.org/results/7bbfe45393726a61df342cdb8df0377d5b674894 |     
  powerpc    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/21fd9de798eb61a451c7cfd5e55e5fa3c72654ab | ORPH
   mips64    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/3b31ee615fae1af23a09d7f6c11f930058bb4839 | ORPH
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/4fe4dc316709cb58aac4fb35216c5764cbc95ab3 |     
   nios2     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/47b89c0e2cd5d1bce3e6cd3a7e066eb6b4bbc1b7 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bitcoin-26.2 | 1 
                 coreutils-9.3 | 1 
                  linux-6.6.44 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          bitcoin-26.2          | NOK | http://autobuild.buildroot.org/results/7321e6845dee463d5121027af31f264311e2ba1a |     
    mips     |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/c55182c947355906ab02260441d579240beec334 | ORPH
    mips     |          linux-6.6.44          | NOK | http://autobuild.buildroot.org/results/0bf397d8930f97d8d994cb7ce2ed41f3186f206a | ORPH
  riscv64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.org/results/74072481e91cc7ea05479dcc332b030fb47e2e09 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

host-prelink-cross-a853a5d7... | 2 
               procps-ng-4.0.4 | 2 
                    bcc-0.29.1 | 1 
                  clamav-1.0.6 | 1 
                 coreutils-9.3 | 1 
                 dc3dd-7.2.641 | 1 
                  ffmpeg-6.1.2 | 1 
                   foot-1.16.2 | 1 
                gnu-efi-3.0.18 | 1 
         gobject-introspection | 1 
              host-rust-1.74.1 | 1 
                   httping-2.5 | 1 
                libesmtp-1.1.0 | 1 
               mariadb-10.11.6 | 1 
                mongodb-4.2.18 | 1 
                    ncmpc-0.49 | 1 
                       unknown | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bcc-0.29.1           | NOK | http://autobuild.buildroot.org/results/f7d1c7903cf69bd614752a46c593d9ffc00493a5 |     
   mips64    |          clamav-1.0.6          | NOK | http://autobuild.buildroot.org/results/1e4a7a862cf8eb66c6a8b5bd86166e9c16bb1efa |     
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/4136df9393cfc457081982e62fb349987acbfb92 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.org/results/b5dc79611da78cab2a7cc0e55cfcd67b306e783d | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/53703f014a64b8eaff4fe51d5dd0b1cfe362000e |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/0766e0bbbd0b945e05775f2ae0c6ac4b3f5f0525 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.org/results/794bc0d6e55b5e6719ac1e88205233f41b643b7c |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/5d6944d28638b732380ca0602cd19267a666f114 |     
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.org/results/2ee19835a469822a2d94a2396cca7682b0106752 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.org/results/98103074dc390e6a7ab3867b94ab87b88f564ae8 | ORPH
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.org/results/bef8f41468d54bb5c6357e7a7ac792f4a4288f4c |     
    arc      |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/4a9d4457d302af57d123b982796f2989e6cdab88 |     
    arc      |         libesmtp-1.1.0         | NOK | http://autobuild.buildroot.org/results/ff21c437b0e332d65dd4da41356cfca43372a3af | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/868bd7e5731e74bd2e8326d6a544df0129ce110d | ORPH
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.org/results/0390f56224f087ccca2e8888b363f08acf7633e7 |     
   nios2     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.org/results/fe03154a8608ceed78f6839dded9572a34144cf1 |     
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/fd9127bdbe5a88487539f892f475b0cf8a10f47f | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/2bc19b67b5f2106aa2cd6666f344e9993f96081c | ORPH
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.org/results/4c0e4a6b67b7bfa3631ce8320992e525f9bfd677 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

             libargtable2-2.13 | 2 
       gst1-plugins-bad-1.22.9 | 1 
                  ntp-4.2.8p18 | 1 
                       unknown | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |    gst1-plugins-bad-1.22.9     | NOK | http://autobuild.buildroot.org/results/e9af25585ba972500c5f23f43379bfd6e5d16c85 | ORPH
   mipsel    |       libargtable2-2.13        | NOK | http://autobuild.buildroot.org/results/cf1eb48bf2bd0056ded3aba0e5ca0c3b257a118f | ORPH
 aarch64_be  |       libargtable2-2.13        | NOK | http://autobuild.buildroot.org/results/4ccecd7a604cea139977a2a53301411d305546e7 | ORPH
    or1k     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/bc67c35e98d403d52954e38dfa70242abf3c21ce |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.org/results/a3dac12d0516a9f672cfec604f002c28131f73b7 |     



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
