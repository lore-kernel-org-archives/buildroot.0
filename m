Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3B0CCD1BC
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 03:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5890C40F54;
	Thu, 23 Oct 2025 03:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5EWefBY1Ng8Q; Thu, 23 Oct 2025 03:23:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3F9640F56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3F9640F56;
	Thu, 23 Oct 2025 03:23:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47A20DE
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 03:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3995041614
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 03:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJ6vC6Bo6zlG for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 03:23:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 82B6D40642
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82B6D40642
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82B6D40642
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 03:23:46 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42701b29a7eso115943f8f.0
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 20:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761189824; x=1761794624;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BVsXF38cc7OSUYZbChVRbaNllcQo8TlBUsjLbBKo1WU=;
 b=XM92YdZ2zr65iS/CP3NXiqItZTaFGfCqlA1HXenWmx+MgsiQ5LBaA2BcG/axeCUHT6
 5F40oIjKcNxoOiXzyWik+z/ewfeCWesVoO0hAJ4cJDsuW3GcEAZh+cjaEpcL5iYhqUkV
 MgTy3O6QttFi+ScFpHeBcqOMgZqhnH1gVn5wdNlh4XlU6bYMqfdiM716aM+WUcMGPM8F
 EsULJ8PU4re/trAx5aQIhSxmKEphxoHxCgQ/pa+JXuJf4XOS9U7a48oNt5b91GKoIfZP
 SezChnGGdOaZ2tPP4JhGw8VjbzEPcxvX2SYHyFOUKV/KW+/VXcDnzY4DkFp4XN5SuX6s
 /oQg==
X-Gm-Message-State: AOJu0Yzkx4si9/+5d6TC7hKrO562jphX6QtN3JW68aI6ydojE4U5zWw9
 JFkQQamUT8FMSrDFgd8ALYS9AtSSF4p7FFA7c43gzGWo4fjOLPsan7S0fc39Fg==
X-Gm-Gg: ASbGncu6lQcPgrH1avA6d+h6JSnT/LpxqQH+hernJIOZeDS45dXe+nsoUzL0WL71NBW
 atAooYc3EmvhnGcjbcvGlV53uLMChdpszW2Ne5lrgzlGdQKEhPgXpVq7ILj1Rxzdi6ywaUfZhfs
 6sIzPZysJN40vvUoruOhs0V3IxrRzr+TBa0kYP4ZCiuM4WcSbModDwHTHKQqiI8EKdqwfNlCVzH
 2jDi5ND/XRDX372tPAleMSihjKrcLraiFrangG+1JMK+/m/Unwy7LjBGlkytg9Cb1W+Q3WN7utC
 xPr23VE2pkDUVkdiACwvg3kblUFxjBNxUowvDlIk02F5VhxJvwNCdJzC3PUxvLYHTy2NyPmhKJ3
 Bc2zaGCdDqtKTVaBa2/UCg+n/AbBNAj1bnZykMioLlyGQYGxyjv8KUmOKr8OOLiuuNTzs8Fi0nq
 9f9vWxXN4=
X-Google-Smtp-Source: AGHT+IGI6w6yrhP/MFLES2Jt0CsP+kyFWhvIiZg/Y9LQxRpsVWV22ElbpNM2PbqdZWA+sGfk5O2LOg==
X-Received: by 2002:a5d:64c3:0:b0:429:8b4a:c3b4 with SMTP id
 ffacd0b85a97d-4298b4ac583mr76121f8f.5.1761189824104; 
 Wed, 22 Oct 2025 20:23:44 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475cae9f292sm12629855e9.5.2025.10.22.20.23.43
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 20:23:43 -0700 (PDT)
Message-ID: <68f99fbf.050a0220.250465.25fd@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 23 Oct 2025 03:23:43 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761189824; x=1761794624; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=BVsXF38cc7OSUYZbChVRbaNllcQo8TlBUsjLbBKo1WU=;
 b=aNi6Op+lB2cIABnewj6KRsGBqvyivxVJr09omfMA966s8Aw6CoBPwgbpLA3OUrzCNe
 spIhWnCCNR0WXdPPA668ATCvLElx+vK2yQ91Hri8RBAri1AsmcaRmgtoikQ6NA/LQrx/
 D9phaX8UhLuX2TA8iGL7GAmxwyyD4xgmu+bjInRfQzreAj/QHeyUkzbXbDX3ASWreCO0
 ahG73M4k2BXns/SN3roABcMLMHvAqc0MYQWfZ5CzHgtScyVBV1QlzxJTwu4ym75c4oxE
 vlIH55Ui00iKpbLUgojxLCGLdfNS+qcLqpf46vMvBcdYDktHWNziO9AdFheYQex/akYn
 xBXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aNi6Op+l
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-22
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

Autobuild statistics for 2025-10-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  |  6  |  0  | 15  |
  2025.05.x  |  3  |  4  |  0  |  7  |
  2025.08.x  |  1  |  5  |  0  |  6  |
    master   | 40  | 83  |  0  | 123 |

Classification of failures by reason for master
-----------------------------------------------

                openocd-0.12.0 | 7 
           host-openocd-0.12.0 | 5 
                   perl-5.40.2 | 5 
                    mpir-3.0.0 | 4 
                       unknown | 4 
               bctoolbox-4.4.8 | 3 
glibc-2.42-3-gbc13db7393773... | 3 
  gobject-introspection-1.84.0 | 3 
             libgphoto2-2.5.27 | 3 
                  linux-6.17.4 | 3 
                     crun-1.22 | 2 
             dahdi-linux-3.3.0 | 2 
libdbi-drivers-0bfae6c43134... | 2 
              libopenssl-3.6.0 | 2 
                python3-3.13.9 | 2 
             batman-adv-2024.4 | 1 
                   bearssl-0.6 | 1 
             bubblewrap-0.11.0 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
           dmraid-1.0.0.rc16-3 | 1 
               dvbsnoop-1.4.50 | 1 
                enscript-1.6.6 | 1 
                  ffmpeg-6.1.3 | 1 
                 hidapi-0.15.0 | 1 
                 host-gdb-14.2 | 1 
    host-mender-artifact-4.1.0 | 1 
              host-rust-1.88.0 | 1 
 host-softether-4.30-9700-beta | 1 
                  jack2-1.9.22 | 1 
                  ledmon-1.1.0 | 1 
      libabseil-cpp-20250127.0 | 1 
                  libdex-1.0.0 | 1 
                 libjcat-0.2.3 | 1 
           libmicrohttpd-1.0.2 | 1 
libuci-f3fc0b76040685829191... | 1 
                   linux-tools | 1 
            live555-2021.05.03 | 1 
                    make-4.4.1 | 1 
                memtest86-7.20 | 1 
                 netsnmp-5.9.4 | 1 
                openswan-3.0.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                pipewire-1.2.8 | 1 
procrank_linux-21c30ab4514a... | 1 
python-remi-2022.7.27-37-g1... | 1 
          sane-airscan-0.99.33 | 1 
                    sdl-1.2.15 | 1 
               syslog-ng-4.8.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/f6a29ab25d8150cbd3275bb59b87c8ff5d6612db |     
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/7cccba841f661dd73fbe7b2f7af9ec286420be0c | ORPH
   mipsel    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/da4c2454d641c73414e136079587c1759866af9e | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/2cb6adfae12b8ff42db6fa4db5895c0a676b91cc | ORPH
   mipsel    |          bearssl-0.6           | NOK | https://autobuild.buildroot.org/results/0428200c5a203a0ecbab132b02a2a86f3986be55 |     
    arc      |       bubblewrap-0.11.0        | NOK | https://autobuild.buildroot.org/results/f196f2bdba410ce5e08495c14774643acf5c4cae |     
    m68k     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/5698f086ff5445e751ea4ea565ebecba98069a00 | ORPH
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/af5180f7e4b63c8f0962beb0749bc794991c2b43 |     
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/a680707b6ea221eaea0b2be49bdaf7b9d7f13c57 |     
  powerpc    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/22318156a4839d3d4d10ae7798808104971af770 | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f64fd20614e4700a265f47f1dd755744535ea859 | ORPH
 microblaze  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/6305cb23e12bf39cb38d6c099e53cec63fff8d29 | ORPH
 microblaze  |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/ca0961b959071e6f44122babd3588caa1fc394aa |     
  sparc64    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/c173715bea6f0d1cdeab2dd8dfdd999d8df6be00 | ORPH
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/d2cee60e13d5ba899427424ac96d6e76a2929d44 |     
   mipsel    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/96dc118a9662f7c5dc9910a03092f3063a26b565 |     
   mipsel    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/3b37278fc0323656e2c7f637ab7c0280b39ceef5 |     
   mipsel    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/11137fc8b9343efa1f4a4a163553486093f69b71 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d680d6211164303183dbaa34c4e1a3c43f050e10 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/23116b2086837e60a2d796a92b3444fad34c2ad7 | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/51c5a13ec62194dcb7ee612fc295666f8dbdf524 | ORPH
    m68k     |         hidapi-0.15.0          | NOK | https://autobuild.buildroot.org/results/01511eb7d4c1c11c0692e349994cd49241eeb3e4 | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/4f9f2cc61b72a053db699fced0285d4a29ec5900 | ORPH
  mips64el   |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/410f638872ee985aeecd3ea0e356b87e847d8878 |     
powerpc64le  |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/7d639b6140e128102bfa6e89b36bbacbc1573424 | ORPH
  sparc64    |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/f53f30ae41d36a083b24807c48bdab07a71b3ae5 | ORPH
  powerpc    |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/1ace16b73f74d151ad0882ff0386dfae65040ffc | ORPH
 powerpc64   |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/9dc7a35efaaaf1c939ce5b9761f0c98922d22c34 | ORPH
  powerpc    |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/990b3978737e09261609468f88039e1f997f4bce | ORPH
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/0dff09bfea5a31b0ee49791063d702c75e76bf42 |     
  sparc64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/c72366c97271a269e87ac36bc194274425de7471 | ORPH
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/65ed4b3d4bffb6d533a0e369d8cd0ef969775a02 |     
    i686     |          ledmon-1.1.0          | NOK | https://autobuild.buildroot.org/results/e376d790e3c072154ef7c1cf4889ecd650d7e66f |     
   sparc     |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/56e53fbc1aa92a13cf3c455cd6653bdb9ac03a27 |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/242a483ad2bfd2fa5d36ea220dd4c83f337b553a |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/43c6a8976e505385c6283a224bf485695ca731a9 |     
   mips64    |          libdex-1.0.0          | NOK | https://autobuild.buildroot.org/results/5a94bc71ef8adbd1fb5222ce18c25cccb76b733e |     
    sh4a     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/aa5662e19772851993011a83dc386f3e8c289b20 | ORPH
    or1k     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/18e9443b8bbf9090ff9c6a0f79610a21b29d62f1 | ORPH
    arm      |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/b66ff232cdab21e019c8eec8f0849f9cf8a912ee | ORPH
loongarch64  |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/cf82f658fe850c418f1877ce1c47f6a19de73a15 |     
  mips64el   |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/78a07be6d1b028fa6a5a2d060925d1b88017b16b |     
    arc      |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/9d894859bc84dcad3776c07229779391382779e2 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/1c5e5acbe40114f6ceb28c04ac76dabbc36b3a9e | ORPH
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/e9d806494a3499b4c026cc5807c7da27564ca134 |     
    mips     |          linux-6.17.4          | NOK | https://autobuild.buildroot.org/results/f3c9060777f8df03dca5594de8700833fafcb712 | ORPH
    m68k     |          linux-6.17.4          | NOK | https://autobuild.buildroot.org/results/ca279df431d21c3fc96682e485d84ea618acbb52 | ORPH
 powerpc64   |          linux-6.17.4          | NOK | https://autobuild.buildroot.org/results/044237b8cf8382892388bb224edfb0125ec38d42 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/2d25fdece164d5477c72d5b8fbf2bf95dd405070 | ORPH
  aarch64    |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/01b5deb38fa43b231fc0585bba847269e12cad1d | ORPH
   mips64    |           make-4.4.1           | NOK | https://autobuild.buildroot.org/results/da4655ca79247c2302fdf9bfa2b5da2d4efd2aa7 | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/851aad31bb9a78f858e9d6fcab59f5067d5af0af |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/5bc3bb6242458114988e452bd21d0431c663a561 |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e08d4a9fbdcbb16304405e6481e6e500f6333c9e |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/c7bae9e36d20d4ab2f9adf5e277d1189eef5c5fe |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/58b0d28c1e7f50b42fb8111fe4ecca24d87f5bd6 |     
  powerpc    |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/9fcca73d7a766b313c7a093501a02126c26cee80 | ORPH
   xtensa    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/5024ca34dd05e87bc466fcb2619152dcd8cca4b4 | ORPH
 powerpc64   |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/2e3b9531f88795067ef9a60ecb4dd54058c3ec2e | ORPH
   x86_64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/e04534ba06f0c20472b8524881f59eb2aef9a73b | ORPH
loongarch64  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/c1dab318fafaf4de587581a41cb4645739c31bdb | ORPH
    arc      |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/229d1357633675e998e54adecdb0400d362923ac | ORPH
  sparc64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/cc4aedb58fa6d41e9805b4df27bddf7b59e8198f | ORPH
   mips64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/b6a85d379633980f398e552aafcaebea8b5adf96 | ORPH
 microblaze  |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/1107a9f098db6d5977223d0befe662d34a64650d | ORPH
   arceb     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/66fd81d48171d00ede4c35dbbbbc2e08fc600b08 | ORPH
  powerpc    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/66d551e107a687e18c8c7d3cf92f5e5154b69348 |     
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/cc7d4444ee965b17603ffe6590e50a02b1a1072b |     
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/02b0e630c8e7136afe483eb5c7804f63aed464e0 |     
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/ad8cc953d9f56aafb898a89b5874becac993f27b |     
    mips     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/c316c4907d1c2f7fb09f9869bbc99f1c6e28dd69 |     
  powerpc    |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/0e36421a6c63bda9cebf8c36f08dd2fc0b5b8df1 |     
  aarch64    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/bb0505d7423514b848d3c5a7b523c8258566e18b | ORPH
 powerpc64   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/8f5f091d59a44fb93d158a2fdb2e4f57d9baadfa |     
powerpc64le  |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/a1d88593fde280fe0acaca440b7a2d3ffd9efdc0 |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/25bd8abd986d22d96d89ccf8d089af333254ad4a |     
loongarch64  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/e445ade6465ea99cff382e6b323709b2abe23b96 |     
loongarch64  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/182fb94e160db1c18481fb74734a9da18a9b57e6 | ORPH
   x86_64    |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/cb1aa154c1795e83f42bbaa257ca46f9e131c8f7 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/c0c284dc68c9809cd2aa56650f6325d6ad73c17c |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/8960eace03563fdcff01fd735f4fc8e30a1d02c1 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/84313925c4febdac2600015bfb6d1815eb368377 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/98534f5f8925bd57e0ecdeb9e26e8dc5269729a0 |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                    mpir-3.0.0 | 2 
                 siproxd-0.8.3 | 1 
               syslog-ng-4.8.3 | 1 
                       unknown | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/bb582bba05718f5996d236312db95c3295e791e7 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b3b4b891e5dccde9d7245e54ce430d9190b78b43 |     
   sh4eb     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/c3370dd76fbc7e9893f96824a8ba824ab7cf02e5 |     
  mips64el   |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/21e7d6d6014565c39aa514120db4b7163efd1505 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/3217b2955e7f1fb11f3b814413124e8b451c4a2a |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   foot-1.16.2 | 1 
                 host-gdb-14.2 | 1 
            libxkbcommon-1.9.2 | 1 
                   perl-5.40.2 | 1 
                    qemu-9.2.0 | 1 
                    sslh-2.0.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/e6ad609122245a81a9f4b89b3d5900c86b430fd6 | ORPH
    or1k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/abd2d966a4daace0743520166039b505f022c56c | ORPH
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/30858ed1111920f4bff68b0858e147d4ab548da1 |     
    mips     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/89bc509cd4d1d462381b9f4d7a790a5f0729e728 |     
    i686     |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/a1084ebf00177161fc77d7f4767b5e1d6af46450 |     
powerpc64le  |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/555c04f9e135df4f8889a755cd9f0f60755cd88f | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                 dhcp-4.4.3-P1 | 1 
              fluent-bit-4.0.2 | 1 
                pipewire-1.2.8 | 1 
                     shim-16.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         dhcp-4.4.3-P1          | NOK | https://autobuild.buildroot.org/results/30f5cfc3a05ca2e48cd8d2ea9c0307cfc421959d | ORPH
powerpc64le  |        fluent-bit-4.0.2        | NOK | https://autobuild.buildroot.org/results/140239b5705e94a610ee23b49c64b3b8bbadd840 |     
    arm      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/aacd7bd200f7b2fdb05b4ee5ac5eda28ba580c8e |     
   x86_64    |           shim-16.0            | NOK | https://autobuild.buildroot.org/results/ef7407304dc1e35e89568208e2841bfe550f5c92 |     


Gitlab CI results for 2025-10-22
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
            TestPythonSCP | https://gitlab.com/buildroot.org/buildroot/-/jobs/11781378510 | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/11781378492 |      
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/11775560136 |      
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/11768045873 |      
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/11768045869 |      
              TestOpenOCD | https://gitlab.com/buildroot.org/buildroot/-/jobs/11768045827 |      
                 TestLess | https://gitlab.com/buildroot.org/buildroot/-/jobs/11768045696 |      
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/11768045649 |      
             TestDdrescue | https://gitlab.com/buildroot.org/buildroot/-/jobs/11768045624 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
