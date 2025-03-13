Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B94C282DE
	for <buildroot@archiver.kernel.org>; Thu, 13 Mar 2025 04:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1FAF411CE;
	Thu, 13 Mar 2025 04:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mE4M6n0qeivR; Thu, 13 Mar 2025 04:14:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A306B410EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A306B410EA;
	Thu, 13 Mar 2025 04:14:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD690128
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 04:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B034060817
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 04:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBHrhQGUGR_9 for <buildroot@buildroot.org>;
 Thu, 13 Mar 2025 04:14:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 126E9607C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 126E9607C7
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 126E9607C7
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 04:14:45 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5e5b56fc863so623810a12.3
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 21:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741839284; x=1742444084;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mI8Vxxi6qilqASqgBfwxjk9+6z9sr0jhdyLTUCRrOlg=;
 b=MLwSiu/AMK652xCbp0rGyd2ZDL80kqYDwX8dTbRPQ2sKcTAE46iVk9eQaxrxDQS8QR
 Ov/NA/9R020mV5lk3uy0OrcOK3nAAiGqU+iZ7eIFzc6sRSd2/o8A5uh79D8Pc2eTzsDN
 D1HxK+DM/4WumlhOyNzxwc/1fTnzdQH0rk4JH/Znl0t72FctQXdSV2XzCJffXPPYVjYU
 fEjAw1A8EsDbsGWCJvh7/wYGQHPl3wRdncA21Wlzr93/7xvXXir2jmjBOBcassM9yhLK
 Fzc459V/ru1bsHh5WKL2L/zKex8D5zdLLVu9orKH/Po0fxwYO9b+zuAegBf9xgDOCZ8z
 lGdg==
X-Gm-Message-State: AOJu0Yy7Sv2iCEzyv+9LkwdMwmbAH1VoKs8nA7X/ihyn7UUnJRe+oSgF
 dk3Q8+Cbyk1rmgsgJxP10c9H/L1+4Bt+90+JrbvVnyLAu8Rf+GYVEIEAxg==
X-Gm-Gg: ASbGnctifbmWpDnave7jdBZiaRpoFXrBE8/u4D9PGRppAxMOVkZgnVwS7p4XB/hqfst
 bcW97UHLxflbGbZQZtwGyZBMrFLD7r+CL6l7XquJtkrUmxRi+rXXk4LF+TVzPPdp7T7gheIKnHp
 71n98sYSewZJUMx/PDmdy4YWDQXDnXIRUPUgaslJlgQVGveegyowVHVGlW+0V+X7Z0C0knpnyuu
 pUAL94rgGsJpCtAt3eXy4KN8dhATjBpN0/zs5dxMWFVEDS4pCREclCpHmETqXPXvRblJh+TY/np
 Ds6nBBlZZEbEvxWjszjB3MBZWOdesie0aOGOfOvx2kXJ9NQT
X-Google-Smtp-Source: AGHT+IFTifooTVCWNJssRFB+qvuzuy0IFigII33cwqSF3TB9BvbfTn4zkUfEfa+GbO0IwGC2B+X8WQ==
X-Received: by 2002:a05:6402:400e:b0:5e7:88d7:41fe with SMTP id
 4fb4d7f45d1cf-5e788d7424fmr11768507a12.25.1741839282270; 
 Wed, 12 Mar 2025 21:14:42 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e81697509csm251855a12.30.2025.03.12.21.14.41
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 21:14:42 -0700 (PDT)
Message-ID: <67d25bb2.050a0220.26f3af.0fc7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 13 Mar 2025 04:14:41 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741839284; x=1742444084; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=mI8Vxxi6qilqASqgBfwxjk9+6z9sr0jhdyLTUCRrOlg=;
 b=H108n3IzWRBnzHeY68t7r/Xlkj5cT5LZNZfJdoiy4GGxuhCSHP82BfOzrtiuxBhzpx
 d+tAJUV0Nx1pn+eI7FPdEiXlDoQx4WR7A1ZjAP1Sq4esrt2yZA5kIuyvZc4TZHhZjdwg
 9ldqBt5oEHEeCyIMFTt7RstJV6rbzhfhPqD66wES7yWmMaRo30q3oqhjQJUzR8vuM/DU
 8uML6NtVEWUvy+JALOMjN92kpGGWhbPYC4OpVJcZJSo+lZrf4+ZC1CWqNukL8A7Ikkz1
 ntTFnCQd8fzB7M3GmvxyOyx5jB3gflEB3/xjybhr+2jum+9EjcpxRUrlVMv/MPNaNP/w
 GVHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=H108n3Iz
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-12
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

Autobuild statistics for 2025-03-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  5  |  0  |  8  |
  2024.11.x  |  1  |  3  |  0  |  4  |
    master   | 19  | 57  |  0  | 76  |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.192 | 4 
                 openssh-9.9p2 | 4 
    host-python-greenlet-3.1.1 | 3 
               pulseaudio-17.0 | 3 
                 host-gdb-16.1 | 2 
                   linux-tools | 2 
        ltp-testsuite-20250130 | 2 
                memtest86-7.20 | 2 
           oath-toolkit-2.6.12 | 2 
           at-spi2-core-2.50.0 | 1 
  binutils-arc-2023.09-release | 1 
                    brltty-6.6 | 1 
                cifs-utils-7.1 | 1 
             docker-cli-27.5.1 | 1 
                   duma-2.5.21 | 1 
                espflash-3.2.0 | 1 
                      gd-2.3.3 | 1 
           ghostscript-10.04.0 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
  gobject-introspection-1.82.0 | 1 
               harfbuzz-10.3.0 | 1 
         host-gcc-final-12.4.0 | 1 
 host-softether-4.30-9700-beta | 1 
      libabseil-cpp-20250127.0 | 1 
             libapparmor-3.1.7 | 1 
             libargtable2-2.13 | 1 
                 libcdio-2.2.0 | 1 
        liblog4c-localtime-1.0 | 1 
                  libnss-3.108 | 1 
                liboauth-1.0.3 | 1 
                  libsepol-3.7 | 1 
                libsoup3-3.6.1 | 1 
           libzenoh-pico-1.2.1 | 1 
                 linux-6.12.17 | 1 
                 linux-6.12.18 | 1 
                   ltris-1.3.2 | 1 
               mariadb-10.11.6 | 1 
              mosquitto-2.0.20 | 1 
                  ntp-4.2.8p18 | 1 
          perl-net-ssleay-1.94 | 1 
         python-remi-2022.7.27 | 1 
               valgrind-3.24.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/b28a500372f163363885662a3ae74794a696c2a9 |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/3c8a492b5cc9dcb3b2ec83ac48fb2e0ebed16393 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/e2d5a9876d9f36114b599e28b9a6519d85b621da |     
   mips64    |         cifs-utils-7.1         | NOK | https://autobuild.buildroot.org/results/fa867a50125776701400b2400ce30983a6487114 |     
   x86_64    |       docker-cli-27.5.1        | NOK | https://autobuild.buildroot.org/results/bea0951a410e15e26b2bed454dbaeb1a8fc5bc9f |     
  aarch64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/fb30e97cf770ebb1668f28cb4987a10ec939c334 | ORPH
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/9787ca60e8282409715e7d002bc14f4ad42394d5 | ORPH
    mips     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/50c1ad63f440de3bb264b364b0e5ee562bc72f5f | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/920f9931430b44c0fd477d1c08d3b33fa3a9d5f0 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c43876966e394e672f2c712ee33deaa4c5078f06 | ORPH
powerpc64le  |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/04aed3169a71656a2aaaf76d9db68062f9945105 |     
   mips64    |            gd-2.3.3            | NOK | https://autobuild.buildroot.org/results/12b3f4c14f70d382c473fe2371607107a28920e5 | ORPH
   sparc     |      ghostscript-10.04.0       | NOK | https://autobuild.buildroot.org/results/6b622b80b7c6c4e2af90317947014b50206aedf9 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/ceb1858ec75de5f8c3899c2b0bdac18f03c8136e |     
    mips     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/1f168c52ead9510a10966dc2d7e66187aa12a281 | ORPH
    or1k     |        harfbuzz-10.3.0         | NOK | https://autobuild.buildroot.org/results/5bbdef2da5eb38ee8c068ba628a748f1ae45ff6e |     
   arceb     |     host-gcc-final-12.4.0      | NOK | https://autobuild.buildroot.org/results/2fdf632897043820ee5ec95739b7a3120cd9169f |     
 aarch64_be  |         host-gdb-16.1          | NOK | https://autobuild.buildroot.org/results/c27c5bdb31ebcd544856bed99d916557f05eca41 | ORPH
  powerpc    |         host-gdb-16.1          | NOK | https://autobuild.buildroot.org/results/6483e0915bcbb59de5c4f4174a45c44991f840c9 | ORPH
microblazeel |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/f51f488f474d4c8b05da8365ff75550eeefbc138 |     
   sh4aeb    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0330ba67854c1b09a51f067247df6c0b849ec4a4 |     
    m68k     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/e2800f6fbc1ec9ad43f3e6d9a6c9e70a7bea26e0 |     
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/578d18b7d2238aac03f6bf21a41d1acbaeb71975 | ORPH
   sparc     |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/6522d3c5aa0ff9caaf4bd25c5309afe42b1ae3f3 |     
    i686     |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/e9a040a965bd88feca25a68998acccbf6fcfec71 |     
    arm      |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/483f8c776e94d2a39cecd28051a44d4f6ae5f6b3 | ORPH
  powerpc    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/1ad0a312d78cdc415a317c546abe04402e513947 |     
    i686     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/4e096f70d8889a3b35d66d18330b514dd01f38d6 |     
   s390x     |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/55e94857ba061b10a27db2916788a8925c2df8d8 |     
   x86_64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/8aa5e6cb08b7d382834de258d47ee000f8ae2a5d | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/636e02b311b7fe0f7e90c617725ba0e1be53034b |     
   sparc     |         libsoup3-3.6.1         | NOK | https://autobuild.buildroot.org/results/676fa93d43c05a4f72add4199a09d056c0d3019f |     
microblazeel |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/b0ebbe7562a9c2885225a874a20ba424bd0c9168 |     
    m68k     |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/f989d24ab378ec01f9ca8133a95a8fd234236758 | ORPH
    m68k     |         linux-6.12.18          | NOK | https://autobuild.buildroot.org/results/df7be07adcba41675cfdc02c495c4aa8683b144f | ORPH
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/9c9839d824a1c9de6332c7d40a518f4bd6609324 | ORPH
microblazeel |          linux-tools           | NOK | https://autobuild.buildroot.org/results/5617776eeee8f4127ec949358e5cbe052e03a730 | ORPH
  riscv32    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/c44180d1b2443ce9e98c53475e8b3864a7f81950 |     
microblazeel |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/c467e18b80fd87869ee1a878e2ec76e246f06b04 |     
   xtensa    |          ltris-1.3.2           | NOK | https://autobuild.buildroot.org/results/fd4b4dd2613e0a27440605651d9de3f1ebe4eb8a |     
 microblaze  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/f2b45698a7eff6603ff32aa3f05466aa947dd8f9 | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/b9fab565befa288636f4abb4158e2fce27c8ac30 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/f5ac452602c4125efeaa0abc5abafb43d7572671 |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/0409411347e9fd58c171bc40359f41aaf6a595fe |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/0ea7ec894159ac0d50cf819fa18822493976b4ac |     
  sparc64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/41c5962ff8886aedcb41d3a1c47430f33b1b827d |     
    mips     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/3a21349f87c42bb0d42a45ed269b69f88aaa4f79 |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/5ec4733f7b4890fec71cfece94e48d5f8aa6b2cf | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/49dc33ef3595baf7e878aed6355ee215df407a4b | ORPH
  powerpc    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/4ee95f784c14f88f2ab57edb21ca6e0d44d84ed9 | ORPH
  powerpc    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/9049202c625c011aefa2eee361e233707aaeabe7 | ORPH
    or1k     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/0efedd8b617013c95a31c4d0b90cfe75dcb9b7b7 |     
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/cf00206f4c2d69bec74c2e8755a33020c7f634fd | ORPH
   mips64    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a1b2867a034eb61966195a932e36271f7f5eadfe | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/732d78b4ac6bdadc75c546abc4d409a4294b56d5 | ORPH
   s390x     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/50a15708d661443d9a7dc553cddb9365fc3e5422 |     
    mips     |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/12bb3807a21ceb1605a9628838c0162d6952164c | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
               host-go-1.22.12 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
                     shim-15.8 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/f4eb3278690aecc3881370a413fe11e39939d095 |     
   mips64    |        host-go-1.22.12         | NOK | https://autobuild.buildroot.org/results/9d774765f912a7459f40d05e707a022413f57634 |     
   sh4aeb    | host-vboot-utils-bbdd62f9b0... | NOK | https://autobuild.buildroot.org/results/3d398fa26d1e0c64d41f8307f0c494c20536ec83 |     
   x86_64    |           shim-15.8            | NOK | https://autobuild.buildroot.org/results/eb411a7a28ff22671a3e5e6d1bd08873fa97358b |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/abcab4bdc6b61b201b7e87a703c2fa4b9a00e8c3 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

              fluent-bit-3.1.3 | 1 
                   grpc-1.51.1 | 1 
package/postgresql/postgres... | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/577791d79bcb0656f78e73926b69d61006b57b82 |     
 aarch64_be  |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/728ebb4ac7f17b40b001f64f196ebe310b203934 |     
microblazeel | package/postgresql/postgres... | NOK | https://autobuild.buildroot.org/results/61d0a97a45ee9520cba2f6c8a6715d048b07cb34 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
