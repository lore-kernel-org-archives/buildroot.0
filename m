Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39A3CF9C6A
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 03:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33A9360619;
	Sat, 21 Sep 2024 03:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1x7EAgEslDge; Sat, 21 Sep 2024 03:17:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDF3760622
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDF3760622;
	Sat, 21 Sep 2024 03:17:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F1B01BF591
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 03:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A7664030A
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 03:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s84Dcx_s0z3e for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 03:17:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AB37940300
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB37940300
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB37940300
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 03:17:37 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a8ce5db8668so5885066b.1
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 20:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726888655; x=1727493455;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9YpsAn7UBrprUnW3Cc6tZFq2t9xCriu5PMLjfmbW0Ko=;
 b=NiFkBzboPEXYlnc/hXpsrR9t7n/DtQJ4ILfSV+di/7lrUTsknf2S2HcIImKoi9c1/L
 HFxsA2K75XudMldvK3zYWZY7HstdPJC7b6R23Fo1hgWUN7NIkP6raTYKwcph62LQaiXk
 wI/hBP1hnGQH53uys+6R+oQKmIed/B16rdkZSaDhJ2oSlOsQkNRC4CJ53b5S3d+4xm+6
 q0NCnCCmIs8PXCqxQzN0z7XGAGKUckzK8Rdeeo8js42JuuNMNAZzjC5Wn93soLPDetBd
 21YjIoPIUv6u0pp4Lb7Z0/d8v4WV5xXCo8/JnfyFEiDu8jptfSGAlJFMo9sCt9/H+DRW
 ssNg==
X-Gm-Message-State: AOJu0YxIPgpJEWgU7Mqw9ov53zYG0Bq+SZQneUq+E+dIblnesLlZ1LzJ
 lspXtqm48IiovX0YPawbBjgMHI74A1ZrVCAl7XRfdIlxixGemwn8WokGcQ==
X-Google-Smtp-Source: AGHT+IHsyXFvMiZNGATVUrNY+i9PLs7yfeevUdJjiXrMSuNC7AbwdopX1e6+aL0xUibZbcgy4dhTjA==
X-Received: by 2002:a17:907:e656:b0:a80:7193:bd93 with SMTP id
 a640c23a62f3a-a90d565bf4cmr453111166b.25.1726888655225; 
 Fri, 20 Sep 2024 20:17:35 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612df563sm920235466b.151.2024.09.20.20.17.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 20:17:35 -0700 (PDT)
Message-ID: <66ee3acf.170a0220.28e99f.061f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 21 Sep 2024 03:17:34 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726888655; x=1727493455; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=9YpsAn7UBrprUnW3Cc6tZFq2t9xCriu5PMLjfmbW0Ko=;
 b=HiBL5EsKc0abQtc5HiyoGoTG6KWrZ14ZAfZEWDnP7Hj+tDXZFKAtGxKT7SJApZlmTO
 MFmiA8OWULcVfUHO0HUEUCTzTtvglvgfTXHmoQjIeo6IMuSvmGQfkPztq/1Gto1ktHu3
 h70/fbbAJhxc4+ixZmlrKl5IziKBT+2R8uS2XIYKzLScD8C7nx4ENGw+dGkSOFSx4B4R
 OS/D1mz7f4/J9Cf0QwShlFAlhFh9ZUGapKzA8HtQS6uwXO65OxUh5F8+ftNf6dU3sFLH
 xQnjWL+qOMIAajLJsUz1QFHd1s0wNf2+pVpIesn3MbME3zuShrriIJwCFc4nOJPgbc3N
 4Ciw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HiBL5EsK
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-20
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

Autobuild statistics for 2024-09-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  3  |  0  |  7  |
  2024.05.x  | 19  | 21  |  2  | 42  |
  2024.08.x  |  3  |  6  |  0  |  9  |
    master   | 18  | 36  |  1  | 55  |

Classification of failures by reason for master
-----------------------------------------------

             bluez5_utils-5.77 | 5 
               procps-ng-4.0.4 | 5 
                 apache-2.4.62 | 2 
  gobject-introspection-1.76.1 | 2 
                       unknown | 2 
aubio-152d6819b360c2e7b379e... | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
                  evilwm-1.4.3 | 1 
              fluent-bit-3.1.3 | 1 
                   foot-1.16.2 | 1 
                 fwupd-efi-1.6 | 1 
         gobject-introspection | 1 
                 hddtemp-0.4.3 | 1 
           host-doxygen-1.8.18 | 1 
           host-librsvg-2.50.9 | 1 
         host-libxcrypt-4.4.36 | 1 
libdill-32d0e8b733416208e04... | 1 
     libphidget-2.1.9.20190409 | 1 
     linux-5.10.162-cip24-rt10 | 1 
            netstat-nat-1.4.10 | 1 
          obsidian-cursors-1.0 | 1 
                 pixman-0.42.2 | 1 
               postgresql-16.4 | 1 
    python-cryptography-43.0.1 | 1 
        s6-linux-utils-2.6.2.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/5917e1ce77b2e386583de614964978bfa9c52fa9 |     
  aarch64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/ec2133e730d3fbbb97a026ea1d528edc4c14ff9b |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/e15561e0858c8d344bf61277467c5be746302aca |     
    m68k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/c394fa7c3195f5ad5a0c08b850a4fa17656b6839 |     
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/61d18339fb6dfdcd0223f27e027275ab9e2cb594 | ORPH
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/deb52d05d7503616397c195a2ff2edd101120bb3 |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/664f13ce8aee9ca5ff89339db52041402f3a69da |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/e9b5fb0eb769416e89db3d02d94e5009278b5dd1 |     
    i686     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/87e819c55e574c29b8cdea064ce542be30b63ae6 |     
   nios2     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/cbe235a115a89fbb03712f9c5183a205ed6fe3ca |     
 aarch64_be  |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/cf9acff7014c24c5e26e03b9f6af521e5b64e49f |     
   mips64    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/87391c6b9edeb2ddb0ca85d4aea64ab6be5c8bea |     
  mips64el   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/11bf4cc391390cd8934883b9b6efaedbe4256ddc |     
    i686     |         fwupd-efi-1.6          | NOK | https://autobuild.buildroot.org/results/df420c76b3b1e73d46e6ce38332cec22f2221222 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/8358d9223426292ea3b0b7b1e5dff6e9d8d5778c |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/7a89b41daac57023b69f9fbff0c2f2b53cb5324f | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/abc60be71bb9c5ba951c5d07b3dc117235d24c82 | ORPH
    or1k     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/735450caa0c15547bb6cfaab6f3e0c21aa3e6953 |     
  sparc64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/c75e43c718c80f045f31262874234eec6263ea57 | ORPH
   s390x     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/6e49e11b80be4ae9c7af7c6ee1b65e436afd5c3d |     
  mips64el   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/e794639482febd51c41055eaa7762846810a4e96 |     
    i586     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/cfb9acb02f6d4bc5f7f81ece310a2659c30a1221 |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/3267eac1e082dabc3e06c738545fbf7fe4710803 |     
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/81de8e06516393a10f62ec93fa13cda3d96f3832 | ORPH
 microblaze  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/2e069c08cfe57e320bf0023b57630ce0a5e0f64b | ORPH
   mips64    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/968952b70004dd4a440caa4ca77663dc37071572 | ORPH
    or1k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/69653cfdba600b80eed92d4c2cbafc45d806e6c6 | ORPH
   sparc     |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/f3cd0c8970ece5c7b8c398b194edf155eb0b56e9 |     
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/591be063d3678f196fedd6ca96c9d2cb45b460f1 | ORPH
    arm      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/2fe2c3ce5b8c4e9ea72a27c2a6b833df63213571 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/607b32907dca637961bd5beaeb66401f533f6d33 | ORPH
  riscv64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/339bd7fab9a31582a7a540502938ae39d612dd08 | ORPH
    i686     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/78f1edeae4d9cd09363684547c754f54a20762f1 | ORPH
   x86_64    |   python-cryptography-43.0.1   | NOK | https://autobuild.buildroot.org/results/1ac2ca3e66bd1453a05af16d53b2ef58976c63ec |     
   sparc     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/d648aa9bda621783d254c77a8d5384c69c829ec5 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/fc75194b9fdf3ec8f387c9217e7b2a46743ec526 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/b1f5cff43842d153902527070ebe9d420bc061ab |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 1 
                  ntp-4.2.8p18 | 1 
               procps-ng-4.0.4 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/69fb85aca6306e4f975a6bb8bcc9c8198c0a77d8 |     
    sh4      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/07b4357ce25aa9229f9a90cf78593f329a28ff23 |     
  aarch64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/2f369b247fa6eea3c94cf41dc6f2c989c50e77bc | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

glibc-2.39-74-g198632a05f6c... | 2 
         host-libxcrypt-4.4.36 | 2 
               procps-ng-4.0.4 | 2 
             berkeleydb-5.3.28 | 1 
                   bullet-3.25 | 1 
                  fbterm-1.7.0 | 1 
                gnu-efi-3.0.18 | 1 
         gobject-introspection | 1 
host-prelink-cross-a853a5d7... | 1 
               ipmitool-1_8_19 | 1 
          libcamera-apps-1.2.1 | 1 
                       libcurl | 1 
                libressl-3.8.4 | 1 
                libsolv-0.7.25 | 1 
                 openssh-9.7p1 | 1 
         python-remi-2022.7.27 | 1 
                   trinity-1.9 | 1 
                   uhd-4.3.0.0 | 1 
                       unknown | 1 
                    vlc-3.0.21 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/5313b6dd8d0bf0e7eca0e48081c87af7c5a2add8 | ORPH
   xtensa    |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/d9ee29eca24b3cd5010f2618765f569a7a862d04 |     
    sh4      |          fbterm-1.7.0          | NOK | https://autobuild.buildroot.org/results/9f56cd65e630d9d5397a636f50c8996e5d21bbaa | ORPH
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/ca519f87d11617c259eead61475fbcefcd0c9c2c |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/0240ce14bfd901d1800e3f3bd263d52b615b00ff |     
   armeb     |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/e906a2721aebf0d340a5ff965b0df6220995725a |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/80f2970bb9e5909555424a80919d0af56eeae85f |     
microblazeel |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/78f4cfc5d136bdfc463215c42cec6c8e356c2b5d |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/8c51f2b2b6396ac353f57ec5412f77202ed37f58 |     
   x86_64    | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/6d00c2f5a643430989854259ad7864148d8cd620 | ORPH
   nios2     |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/c84c642ad704d4816271f98f3752debce49c51f9 |     
  powerpc    |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/d10c8028a3205969ce7ca1a5ed813576b35005ef |     
  riscv64    |            libcurl             | TIM | https://autobuild.buildroot.org/results/00489c3d2566c75724d325099fc58c24abe09029 |     
   mips64    |         libressl-3.8.4         | NOK | https://autobuild.buildroot.org/results/5ff74acb3bf3c1133e2115511d60997c2e390234 | ORPH
    sh4a     |         libsolv-0.7.25         | NOK | https://autobuild.buildroot.org/results/9d27f8d873db3128c53373a0a510d1084d9fcc06 |     
powerpc64le  |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/eb712a7e6aefa77810f8eeb7f6adc663aa41354c | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/4759588dca487fbf85887d82b970c8422f1bf5c2 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/af666f25dfbba0e1a46f1d61a9f4dc9c6bbffe17 | ORPH
 powerpc64   |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/47816876c39ecccacf48822309c11bd6adaed4e9 |     
  powerpc    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/cc306f52700d4c0729666769b21d2e0ccb7e14d2 | ORPH
   xtensa    |          uhd-4.3.0.0           | NOK | https://autobuild.buildroot.org/results/1f894643c72eea311c25caf63ebc8e7154142b26 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/35e8257526b3b9faf41580fd90444256aaf92322 |     
   sh4aeb    |           vlc-3.0.21           | NOK | https://autobuild.buildroot.org/results/1d83406fe9b6176bb0e00b3f5bfca5f35347cfa0 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

              fluent-bit-3.1.3 | 1 
            host-ccache-4.10.1 | 1 
                  janet-1.35.2 | 1 
             parsec-tool-0.7.0 | 1 
               procps-ng-4.0.4 | 1 
                  ramsmp-3.5.0 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/7153f77b19de86723a5c9da0ab8f5d275e38163c |     
   mips64    |       host-ccache-4.10.1       | NOK | https://autobuild.buildroot.org/results/f2ef02a52b74092bc10032f42ca37beaa05494de | ORPH
   mipsel    |          janet-1.35.2          | NOK | https://autobuild.buildroot.org/results/534137ab5fed24527c58cc4cf36398b4bf180ed4 |     
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/b421be319a65d3e13ee270dcb2a2a30fb8b486fd |     
    mips     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a97c92541fa555ec80d24a05add6768e2b439229 | ORPH
    m68k     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/6fb5c343858921d27cc5ab3b1f0b6396323232f6 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
