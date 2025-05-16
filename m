Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7E0C2D0CD
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 03:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AA4183B5A;
	Fri, 16 May 2025 03:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id llVmpBNMojjH; Fri, 16 May 2025 03:11:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9E1C83B79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9E1C83B79;
	Fri, 16 May 2025 03:11:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C30E13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 03:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77EDC83BFE
 for <buildroot@buildroot.org>; Fri, 16 May 2025 03:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jnH1KklNEZ58 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 03:11:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A6CF683B5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6CF683B5A
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6CF683B5A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 03:11:03 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-442ccf0e1b3so18581975e9.3
 for <buildroot@buildroot.org>; Thu, 15 May 2025 20:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747365061; x=1747969861;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lmxdQdWVr1ev/FRcsQP6JLAm35yFYgAFqPa3K9pvtdg=;
 b=PB2ZwPcv2s0Tw7HOSa3ZTq2fptn3sJUy7WNoq54HA0m4SGi9Zy4pOtaGunC8mgDUfV
 bwpZDL+NvhgoXWfhvyx6iiTtzzDMdjfSy3VRWVTljbQvfHKW0siyM7rhP3lHmZNN0gc9
 O/Bam4JbtVUC7smM2Pako2lZUX3JvJMOADNpwum1tbXOl0SWdaQ5WbwAotNqeay+6upu
 nrh0eTfMyX1XejgZYfqjHXJTMNBb1i8uuK8Q2uP3t60UPPvyQ3kMTe7yCmDRArz9m0Gz
 ORzUOpUenAkeL8vqG61tyrd7FTR433MifIuZzdcKF9ym7Tcxf/TRlvPFhNnKIPh1+Mo4
 ePUw==
X-Gm-Message-State: AOJu0YwG/mtdTqnW1juVD4oShDQ3vzmHgMTD0P9HnqX5eWBmt/OuDcze
 9o4LRsi+BQwhDaQymDvBzbsUJGMXo7JCNyjhMLqr8I8H1kjt4DbQxsPDdZ/jHA==
X-Gm-Gg: ASbGncsw7ELtJKZu8VYg8Cgfqqj8HuqODfZLoQZ8r2NJMck2pwxf/sbMNW1VHQAhAOf
 ttc/UA8jh9cVKiCbQp8sNg6GF1Wbs8Zx25UinxAHmtc16dEQMNQerDRD0ql0LokFgzchoeSbpLy
 zGTFu5Niv1Xfc7DQ4FEFD+LWrBxbPIZvedKCNRP5SkzjRWKeikYwQWTrfIqkXYGR1T9zx3YPZsG
 KrktAJPrKwi464DSckJqENpyg0qNVvboogSovsoKI9jneOs5MdX2JTRL1IgzFB6SLkGdCyVJSES
 EeRnuXOJhwr24f+cI7qAM8BJ7C8TWutBd539cSI+IYU8gRV+xpi8EsU=
X-Google-Smtp-Source: AGHT+IEZxjWf5OBXB1Ry7WcAg3Jq1OGIk5UmSjVpGJUvXNR1YFch2tzcit8sdz7IH6NHagNQa1c3pg==
X-Received: by 2002:a05:600c:3554:b0:442:ccfa:fa with SMTP id
 5b1f17b1804b1-442fd671f7emr14721515e9.27.1747365060644; 
 Thu, 15 May 2025 20:11:00 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442fd594707sm17044015e9.33.2025.05.15.20.11.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 20:11:00 -0700 (PDT)
Message-ID: <6826acc4.050a0220.29038c.44b9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 16 May 2025 03:11:00 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747365061; x=1747969861; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=lmxdQdWVr1ev/FRcsQP6JLAm35yFYgAFqPa3K9pvtdg=;
 b=ZHir7C94jGJ2AnFOf/xocMevfw+YQioHooiiLR8SpJeEkYu31/5fqMrOitabTUsmSJ
 gwK6Qp47ZcZvPdNZMJS9jOtAPLXKpd4gJAENbLzNkEmuMebrGAh23MoCB6q2VscFaASC
 gmb8E9TQmkDoZtxJeYruLF7GcqIi1oRbPV5J26dDbzIfY1E+RVmtt/nYoxQPl0o3IILf
 vOhjFtaBYExhTVF2sZCdDoZe1suzWGuhjIewz4vvetr7WWldRllGx49OQ7iDkkWGw2mS
 kbqjcvFG9Sz6EqL6EwPzgi1KL2M+Ih1RYEWJ9R75uHHF+cHnvp12v3UJtF511wKa4iVU
 CWeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZHir7C94
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-15
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

Autobuild statistics for 2025-05-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  6  |  0  |  9  |
    master   | 11  | 495 |  0  | 506 |

Classification of failures by reason for master
-----------------------------------------------

                 host-lzo-2.10 | 63
          host-binutils-2.43.1 | 44
                       unknown | 42
                    flex-2.6.4 | 41
host-android-tools-4.2.2+gi... | 34
            host-cdrkit-1.1.11 | 34
               host-vde2-2.3.3 | 24
host-go-bootstrap-stage1-1.... | 20
host-binutils-arc-2023.09-r... | 17
          host-mariadb-10.11.6 | 17
                elfutils-0.192 | 16
                      lzo-2.10 | 15
                  bcg729-1.1.1 | 11
          host-oniguruma-6.9.9 | 9 
            host-binutils-2.42 | 8 
                 apitrace-10.0 | 5 
  gobject-introspection-1.82.0 | 5 
                  linux-6.14.6 | 5 
               mbedtls-2.28.10 | 5 
              jpeg-turbo-2.1.5 | 4 
        host-berkeleydb-5.3.28 | 3 
             lirc-tools-0.10.2 | 3 
                openvpn-2.6.14 | 3 
                python3-3.13.3 | 3 
          aardvark-dns-v1.14.0 | 2 
           at-spi2-core-2.50.0 | 2 
             bluez5_utils-5.79 | 2 
fs/erofs/erofs.mk:69: /home... | 2 
            gdk-pixbuf-2.42.12 | 2 
            gettext-gnu-0.22.4 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
            host-libp11-0.4.12 | 2 
                  jack2-1.9.22 | 2 
           libfreeimage-3.18.0 | 2 
             libqrencode-4.1.1 | 2 
                  libsepol-3.7 | 2 
                 libsoxr-0.1.3 | 2 
          linux-5.10.162-cip24 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                 openal-1.22.0 | 2 
      passt-2025_02_17.a1e48a0 | 2 
        util-linux-libs-2.40.2 | 2 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
                  boost-1.83.0 | 1 
                  brotli-1.1.0 | 1 
          cryptodev-linux-1.13 | 1 
             dahdi-linux-3.3.0 | 1 
flashbench-2e30b1968a661474... | 1 
           ghostscript-10.05.1 | 1 
host-am335x-pru-package-5f3... | 1 
 host-softether-4.30-9700-beta | 1 
                   iperf3-3.18 | 1 
                jemalloc-5.3.0 | 1 
                  libftdi1-1.5 | 1 
                  libjwt-3.2.0 | 1 
libmodplug-d1b97ed0020bc620... | 1 
              libopenssl-3.4.1 | 1 
           libpciaccess-0.18.1 | 1 
                  libva-2.22.0 | 1 
                  ntp-4.2.8p18 | 1 
                opencv3-3.4.19 | 1 
                   perl-5.40.2 | 1 
              skalibs-2.14.2.0 | 1 
                    snooze-0.5 | 1 
    start-stop-daemon-1.20.7.1 | 1 
toolchain-external-bootlin-... | 1 
                 watchdog-5.16 | 1 
                 weston-14.0.1 | 1 
            xlib_libXau-1.0.11 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/060f586f3a3403f5897e35c55e8122481dc460d0 | ORPH
   armeb     |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/d46c9b3d68499b3e35ffab5355eb92631c4bbff6 | ORPH
 powerpc64   |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/8f2560f59cc827087f21d2c266f975c8e3a0eeec |     
   s390x     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/066154e5d73dbfc3d86393ad31228f34b5a4e9fa |     
    or1k     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/1d51b710b77b7b0623234d6d69d26e1a319559bf |     
   sh4aeb    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/51a0421a85e0f471b69450978038dcc9235b214f |     
microblazeel |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/96ace301b6ffcc3554a38724b50269301cedea0d |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/9454ebf21897cbdb73acf11ee59e062771ad687f |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/36a392ccbafb8ad998e6b7bc2b006550a9583015 |     
  sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/42925b977c99c02d6aabe294e611a963ab27b47b |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/66d97b763f0556db0ef02d39f07c4271c001f615 |     
   s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/b108c755c928446af1a6793db40674723e751d9d |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/bb0dd149a355b4035349047dce9c4ac9767282e7 |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/acf2b3d6e04cb33c2475aed1ce724f0e06e0fde9 |     
    m68k     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/3455dd65a1a38f6042a8eaec2ce5450415c2c32f |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/f0b5a5c21bbb59a4ef88282e864f62ec187c93f8 |     
   x86_64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/b0248d141ad4ffbfd3cf89a4d0a23b7b0eac7c9b |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/c919ee486cbfac5941c8e256bdc06b1858d186a2 |     
powerpc64le  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/b68221f209c5eb132542134852876db44062ae3b |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/acd086d78684c1b657369c1a6caef8607edb029e |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/f6c8aced638b60acfa3216a76034e087c443cb6a |     
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/c7a8539d9310bfeae65dbb166bbbc3f15e0946d9 | ORPH
    arc      |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/d011e62ebddedff88359d48bd987728667f64c11 |     
    m68k     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/aed330ccc64c7602c911377ebee01e935be87370 |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/72d0e74f962cf3c642526d3f3919419c0f83ef3b |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/1272576914ed46d70579534e10da69ca42ce5502 |     
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/c64dede33d2b04384bb4241af79b08abaa17d2f4 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/24751af39b40ca60431e75918c863b7578ffda87 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/d84b430d29cff7d7a67f4b45f748d00a75da1728 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/28ec2508ead3f0d7eb221d2a1a08ea9ec960d5c4 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/416381308b68ac1b7fb331390ee26d435876a7ca | ORPH
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/d87e0175d5c10feb737d0307b45861d3262b80ac | ORPH
   sh4aeb    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/396c5164d3d4c1ac2bd4de6e63195ec012ef634f | ORPH
   mipsel    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/2931503644fee8be179d45a0b1f6bb0645512702 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/971435ff2b04a47cd6ea20e3b84a0e04f4642cdc | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7ec5fd0a449bef884a6a36aaa41c3c450d1ac610 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a2f4a0b0477e2ce47bb4b4b519ea47aa1e8643d3 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/91e82ad0ac680346d081b8b13649021a4c9ef8c2 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/4aa97883d47d8696395d61f5b3e1d55fe9dd3c36 | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/5dc54022fd436a28cc91aacf0bc77c4bf9af9973 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/3c7e14997077fdc80523dcf2047491dec3624969 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e69bf0534edb6c1ef836b55a393e7650baa8a8f9 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/4d784f0bbfe1e51438bc3bb6810b645e0f382b6a | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/86a003ddf35cae8e300880109f78f327ccd7aa96 | ORPH
   s390x     | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/38eb43df301749389e024707d2b2a326ad9ab170 | ORPH
   xtensa    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/c1ae9fa7947f44f58112f0309b7508f3e4248e23 | ORPH
microblazeel |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/fe6b7b878efe7c7ad415f985c7f465cefc367ae0 | ORPH
powerpc64le  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/dd164a6bcfad57b56e183e663a4f2ea9506b228a | ORPH
   armeb     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/7800b85588ea75f85d5f0badab0e156213be3949 | ORPH
    sh4a     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/08d5f43503fbf406d2153eb3689d8516eb833092 | ORPH
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/bbe9e1abe1d30c2c96b50b5a2a626037dddbc1b1 | ORPH
 microblaze  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/b5d02b3881f4b18760c9b3b217afa5e5ea6dac35 | ORPH
   sparc     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/d17e2c49b4ca7c2624d789b61bad73dabe2f2b7d | ORPH
 aarch64_be  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/e76c25eba446d92a737cf7a1360592ebc2ddc82c | ORPH
   x86_64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/76a877a6d56fcd38db3b5209c0fafcbfd63d146a | ORPH
  powerpc    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/44b079872ece43bc52e6ec97ff97e62c07ea3a3e | ORPH
  sparc64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/10b5cb6b5757b20e0e9076a671436922ee5a332e | ORPH
 powerpc64   |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/eabda36596bd992283efd6d6edf0592b2bfc3148 | ORPH
   sparc     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/eddb8293e5e74627c0c7d06fb8f88e0ec197ee8a | ORPH
   s390x     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/7e62f50bb61faa274555d39d3bce446defbcd122 | ORPH
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/5067723eba8cf4c921eb3e51e0acd0ed1076a21d | ORPH
 powerpc64   |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/a43e2b91cfadb2e0c5c58bb8ac8a065c37b07620 | ORPH
  powerpc    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/6bc23fae3a1ea96801b390c489dad46de938158f | ORPH
   sh4eb     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/f5525630539eee308885762f2860fe261eb2aeea | ORPH
powerpc64le  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/d24547ced74ec603e2f57416a4f43f5e5ca6e60b | ORPH
powerpc64le  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/e9e55adb51d44bd7d7d22677c723adbdf204d398 | ORPH
  sparc64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/4167738509a19a9d235855e071c5b49619d87a51 | ORPH
   s390x     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/d7927ec74f593b5d1cae272606451e767038caff | ORPH
 powerpc64   |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/ed7fe510eda391a7781f2105440bce58071c979f | ORPH
   s390x     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/85f14937ac0f07fd59ac26d19269d106b1d4e6d6 | ORPH
   armeb     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/b52422b5ed86017b0bf517514a6236689a44a036 | ORPH
  riscv64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/b1365d001ac1b7418ed22617bf72d0c7f378034d | ORPH
microblazeel |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/9de15069fde1ad5e54623bd8d13428847812e526 | ORPH
 powerpc64   |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/db5ca0b77f2b0bbbc0ca943266979340109c28da | ORPH
 powerpc64   |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/dbfb6a04d179af69acf51ade3345ccd5e893bab4 | ORPH
 powerpc64   |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/369fde50160f6d76b741c9d9b1dfc85ba1deb934 | ORPH
  riscv64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/5ce238caf5a122b0e2b2db6e3b4324a7ed71a432 | ORPH
powerpc64le  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/8ee444fe4150ea4d52ed87edfe0a147fd5139a33 | ORPH
  sparc64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/d19aaea7ae4cb3de575da4dcd16912f45e0fb61d | ORPH
   s390x     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/19bcd6cdb0c0c0fba364fd37af743aad5db5754c | ORPH
 microblaze  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/daa7996b4dfea45dfafc4ee909c201bdd4d25297 | ORPH
    m68k     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/05bd218c31de746f3906aaef81c237a0af2d8787 | ORPH
    arm      |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/b869de9da62fa2b892e690ec2a8a8b7987c8d22f | ORPH
   x86_64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/c40467aed8379d97398e31a86c63e3cd210b7084 | ORPH
    or1k     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/f3d50123594bbd26de03ad28b359e021809f7b99 | ORPH
   s390x     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/0de2b269c540a224187e61f18d421d837183bddd | ORPH
powerpc64le  | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/f7efe7a3f74c130e04d5e2f3a5df75b510b08026 |     
 powerpc64   | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/8ad9fb84da66afa0779e4c070eb6a5a97756208e |     
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/908a14207ae32d445d53c2fb1b23ea85d7e7a597 | ORPH
   x86_64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/b49977cb280e5a02620fd82371b7f1f27330265c | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/65e45f9ffb846b4dd594135d7dab8ea17c5d44ce | ORPH
   x86_64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/488228a9b9f278eb2260a3a003d33d714aa6a591 | ORPH
   xtensa    |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/788eb8ade7263ff02967d192dc4c10a6b693b346 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/ddff19e85b1e78bcad27bb8cbfd3f4d83bca1948 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/b0733c6abd49c052724213cf5bc97284ea412eaa |     
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/39d22c8252a752dfb5bfaef5653032e0778aa659 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/2c14c9716fd47810ebcd7b4c4dbf6374715c9281 | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/c9b5ebfede00dda25cbc75da0e951c446896a15d | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/02a135bfa9e1574a24bdfb50fd3cdccae9d932ef | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/137f8dd9b393cc87e536a31d55d87c49c35a36ab | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/8b75b657e0988f6e8f78f5b89681ab0e938ae420 |     
    or1k     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/a54ac10900185aee48e327fed58aa71a5937a06e |     
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/918b3f33bae7a8780b3368f00afb094458e0463e |     
  riscv32    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/72cd167b2901fe6e812e24e08a4a59476016de28 |     
  sparc64    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/ac6492f62c6f5c6dde6847dfa9aeedf64ac8f987 |     
   sh4eb     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/e4dd0d59d7562750412f4997fc2f2cdaaba75cc9 |     
   sparc     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/1c896e66385686af2f27b0f2497799767e455edf |     
    m68k     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/7f69788fbbf54875790bef74ca0cab46bd1d16aa |     
  powerpc    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/02b029bef3a7e9145e2b626b4e811f4eaed0fd56 |     
 microblaze  | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/89fee951c778ab69ae00ff953a33cf48d8c29cfe |     
   xtensa    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/fe96449be7321533a195a9c8fe171f13baf23482 |     
    i686     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/105f8e4d7f737865af19e0602bec46c1637e1a23 |     
   x86_64    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/bdb81361f33be9200ae63da5d8757642f2afa10b |     
  sparc64    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/a1653069e0982eaac9b77e86828af8b8f9f24692 |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/4aeb233bd91668348ee4ad539f08111741f234b7 |     
    i686     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/98b5675c2d646135118989833c93427bd8982f80 |     
 microblaze  | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/13ff146eb64baa1144b8c05e247a9dab21ad9c1c |     
   arceb     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/a522be0767f24b3ef849eb680efa85ca775ef7dd |     
microblazeel | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/f37fe001b050eb7f71cb5d2f99cc4a4cb1f0f699 |     
   sh4eb     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/3713e17457381c52171259e355201857b29778ca |     
   mips64    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/7e59079b10f3a71baca2ccbfae640ed19e591f54 |     
    or1k     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/cad8be73e4eff2a2856cf3497877fedb4dfd7c07 |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/64c90fb17a737fb690c0a36756db3c9236449c73 |     
    m68k     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/cdf7f6294e946787d8fe4485bccb94045c36e8bd |     
 microblaze  | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/157330e5b9691f2c753bada49937d8cbe88a9398 |     
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/27488d08365aeb6ebd33f208d58119a4b75dc648 |     
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/b1f9f6e58c37b4dae536d170408b9bcd43738c78 |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/50e01fab9f52f35fa6f9bc8faa532ff02563ef70 |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/97deaaa0e164a495816ebbb81175a07d2e972333 |     
   x86_64    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/ffdeeae1941bec671ca78d3603a662b9efa7228d |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/fcd42ed0f80a6093e36cc18cb54c829e5573e956 |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/12da34dc890cc6f693f7d9ed22357dd70f7ab962 |     
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/4bfc654103ab73bf4bd7d7a2090fa447a4ae4777 |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/d7207ef8e9616c47e479d2a259467ce834c044a1 |     
   x86_64    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/10908e9eefbb4611923d966041fd7569038ee579 |     
    m68k     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/bbb4c127e01fd733641dbdd02336b91fc1fbb756 | ORPH
 aarch64_be  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/85573a6449542fcff1bc74afa449706b66dd9a06 | ORPH
    or1k     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/eb9c9ed39248505c32cb84bdc6aac03ef35a2ba3 | ORPH
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/93350804fe307f543bbce79df2e7a60ce17a7335 |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/0903d1b97977a37c75f6b1f8cb5e851bea33a348 |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/47acd2910b305f47ad863ce946f687ab7aa68cea |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/492ca6d39eb2f421e029756b0f7a2b6abd4a7b0e |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/ba180ed130b0ecf09cb171a5c1f1a6560d3372ef |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/d11d96c8af483b247b16af5703f8835f847e1525 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/8669e141d247b05805e22ee28afe0f030abda65c |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/aad0e2480d870b3e3c7b562c35f5417c8c044947 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6ab51e06e281f397095d49391d9fe7cf9649952b |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f4728f560d3ed03836880e526bf8c882b0d81424 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/68f8225e60d70dd7abcf5c5285182bfb91034839 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5e22674fc744360416b1786a2fd5cb6900a71d62 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7bc8f9a872c275fcbdec316c6f05532ad6d14341 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/51664ff056a1c128e2f7cfe596e25c0393889a2a |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ade3bfeb4049fa6f23732ca1283c96896087ccab |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/22bb23f876790c8b71119c4a6756b97bad29ee11 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/28dd281ac2c41d26493d320fec1732469fb710e6 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8683dac3696e68e791c3015431b9ab2b7981badc |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6fa1280c8be23d30a2b7026810a67658803c2213 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ff4bd793aff1e29f4185afcab9911af2c711daeb |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/577ca91ee00d60ef9a2b4010ec845f4187fdf696 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6aa1bd96e5ca32b4cd15a631e2aa170fe8f2f37f |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/94416444d52fd595f561e7de03d0b842d50782bb |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b6c7ea1b4755669e5408d76bad9a588c6e4a79e7 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/794a0d97ad82763916e34117abcd29d9ff5fdc8c |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7cdd350bbfa2c7fa007402ee69a7a3bbc072713e |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0f31dd9ffeb64e4ade7923cfb2b5f8ee5400f632 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/72cf6954dfc37cc3adf39fb8f1a600a811c88541 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/080170c3b4dc4312487c4af968e709d795a8a0af |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e670dd5422dc474f831994757336e1d39dd01518 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/580ead8bc89941e181b1433ccf92eb002586aaa4 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1f006fec0615cd1d3996104948a8d616d5cd8639 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/91b13f106f7a3a55c2778bb354a388e46d6e816b |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e258d7177278f7643463ab0d01bb813581fe937e |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/832ac1023e2d881f8776b1d29d97b6d0943123b5 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a4fb12d61e6b998276b0c8d713d82eb25bb0d2ba |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/769a7d4969109bc1544b94f603d396b8db12fc78 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/176c2f1a70bd8db7589eefc0a154265835005429 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/26807931fcb5cf83c8bdfb6a3f053651ff5b6d3a |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d7f8d2f9fff55392729b88a4223b3b979c356b49 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a09fa0794d12f337f95508146d35dcc729bdbe21 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/905a875aa9dfdb582b637e792e6123c1dd21e083 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/05b12c8787ead13eba6c0508dcba0a454d775656 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8da4d2720c6abd92384a26d8ce663b08fac66683 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/93470f0b4ab753c7387a4772189681b5358bdb24 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3c0dcac371cfc32aa952c3a38bad285b944c6d14 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ff8765334d6c3af21c95449d2aac1cdf0c7b5710 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1b83c2b15541de19f07c13e78435bf40aa44a0b1 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/63839eaba0ddd711fac9ebaf5c1582b8939fd890 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9f9c34a94ec11c6a6619f41dc99623b0a197e739 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0af1d7b256bdb24552c75ddaf81ec45e50ed6243 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b03e7255ed698d3a081cfbc4d1c8a98db160a04a |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/b3757d7055eda4227c1bb8f20fcd1bda2b2fee0d |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/59b53d1482a051144bb463d08893166f8a892584 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/95694b4faab286571e53740e60079e6890bf3f1c |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/03f75a9ed19b9a0ee4ba40707019fd2030949c07 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/771f11536f8994faf463e4fb5e3972f2373074d8 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/8151fe52198a4b464a0541265d4012886e4019e8 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/3265aba4ad1d181c778a17e16edf1c1f0d1040ca |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/292b48f6b707158d5934e0f3a8aff16a153f88b4 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/a563722b78c7bb9c378fe3eb734f58f6d3e19083 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/f5cbb5211f3228a349adb073bbb4b06fdf0f9720 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d7589b088b219e09632da0e8077bc719c7ea06c4 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/38c18298a171de345d35d101f6df4617247b40d0 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/4ad5ac169c9da9490d27a2ee7b0d77b8e157f0b4 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/ef451fa3e0d778375f4a379e79a1cb18f25fea21 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d7b60021d6f296b92571b044fce6a6036db6985d |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/1f6e4a2aad170ed0f6a3fb5fca2c0c9052d1a725 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/0d63b9b4075c43801f4162b5f8df710917163a60 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ed5efd41bfb5ef3bcc8768009b44ae793d27571d |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/e5a778151377a10f1e72b1feb5e05de88f26f3fe |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/53205b01c5c44bee03dee485b2e9487bd16dbe50 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/dbcf32d47ee9ff61e02ed0e32ada542f6af9b0c3 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/8f0157b6cc012a65e355ddaa5f0ccf28fdd7cc4e |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/2084cc3f099560887f5cac4e16c2111b4f8e3337 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/acefcdb5e4e983ef6c074ffa355d2c8a94053aad |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/1d96678287678575dcd3065a00c9d5df75b3af2b |     
   armeb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/c3f95a53b26f9671532094aa578e31be0aa7e4ea |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/2d3e234909ddf022e50476077560230080c337a3 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/37cc4392e034d3cd3b0c994be450ffe6f3a8fd9e |     
   armeb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/af715e3ea062ee0b367056f7dd5547d9103ec267 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/d90e508bb624a860315894189145cdafcb5b6aab |     
    m68k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/2d89da09e336e8a1ac43b48813ced4728e8eacd2 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/e6f60424506d512cf1b411df8a98697688964fee |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/72926b2d5f47d3dca44aa079d6d03b79c03dd829 |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ff7bca9f8cd1376a19e712b264c665506e2c2ece |     
    or1k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/78b6fb9e2831b0444c5c7b188976c00e25d0873f |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ed75769623fe1fe79a30e299f12b24d1050f9dbc |     
   sparc     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/d3549c36576603d6a4e5dea968da9b76986dcf81 |     
    i686     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/64ce262893729670a80b933179e4f1fe756f8c33 |     
    arc      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/759c4d6cc81d02e35e3c4b71f7a3f535b285ba94 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/48a7c6844c532be721227069cbf0775af4ec4432 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/f8c632bddb421ef036392ff21e6c6c13f2ebe942 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/5a3dfc8dc8ad0f01985c99aa8cf1dd68fb4327b5 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/cac7e0fd4b156c4fd09cfe15ff475afa72c6cb71 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/dac8c561105244fb87deefd3fcab0f35e99f066b |     
    i686     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/8937dfc060176126785041e802a400d38c0aa36e |     
   arceb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/c4b0d13c6d618c1c863637bbf6c8d3384bfb58ae |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ab627bccbae9b03e2f14277a5c8a43b0b8fabd02 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/2b853f094a481a25e717a3b2cb4ec72b0c18af00 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/c8a9c1db3b265380993a88d8cd926960b1f441a5 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/1d599036257832b9b0a3a8e2cb39ec7730759b99 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/1030753d89eaaedf33eab55049fbed1a5caea3d9 |     
  aarch64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/b6cd746932446756b2233e0b6aba2b11ae1b894f |     
  riscv64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/c37352a7687455266ef581df5e3e1eafb9a7863b |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/a689242d8c813ea7772378574a77d03cbb6c56db |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/847d1926a8df186db8491d732e95e807d16537df |     
  sparc64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/470745fb23b600d7b880c5a9b69758b0fc60167a |     
    arc      | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/6e28fb4cf669c3ef18702184f62fed0ed8aca810 |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/0624d387182c1a1ec84a2861d9a1163dac281a20 |     
    i686     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/98ac2e9045fa398e16dcc9e760822572f83f0f5d |     
  riscv64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/8110e169c615c11b5d9a22393dce9e5e4677b607 |     
    i686     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/d6704c590266cf4d936a555024626016c9f4d919 |     
    arm      | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/abb23d6a3ce10e96a9b2f06d91ec120ace1865b9 |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/79f0ee28cc899b0b19cc1a50b9bb8f7bc13f6a07 |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/52bf02a549f69cfc97453115b0f09a0c196baa22 |     
   mips64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/2fd448ac79a3f8c2a7ad9732576010bb3dc17f1b |     
    arm      | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/cfe9cdf1cd6d69f6bb318b18b8878d3c49a12708 |     
  mips64el   | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/3462f737183e5d51f072653ac62357e68354bc29 |     
    arm      | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/47a6c252911161c3a16b8451e4b883d5096e8ac0 |     
    i686     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/f33583d1a5704788ce9fe48d25abc482ec8875a1 |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/53a5669e0883a626e1c1c85bad1af8d9b31fd3b2 |     
    i686     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/918af8452cf4d6db9282da02cf3c487ae5204add |     
    or1k     |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/486dd4a7bf39a24890be79c2bfa40f965dc71357 | ORPH
   x86_64    |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/e1eb53a8ce0c2b97f743a2544d9ad0202316b9eb | ORPH
    arc      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/64ec80d1743c043906a17da233049dbe554942e4 | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a5c71b1e78be1620da00583a31123334d0f6c4a4 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8ac5a709fd83cd1db30c312c4d2d59c1ed679a7f | ORPH
    arc      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1bd74cbe8fcea715f97139dcfc8f06921b788364 | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/3b7f30a275978f034e7981bc9b6997afa5c470bb | ORPH
    i586     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/10bd49cd0109a553efe39e4c0358bd007b5ee90a | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e05caddea4dbd53da6c6a668c440e5c3b329eb8f | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/01c232ce30930a314834c64a2880ad82a6a2c380 | ORPH
    arc      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e66c783de4443b0ec9a8e5a4f1b4414bac10bf61 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/2f9b054ee40cfeeca168df84fbe6bc2f3186a4af | ORPH
    sh4a     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/eef29c501652d0e69db9bb2578baf72cdc8de32c | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c10e053b2771d10dff3279bd2663ed250058b738 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/af00593b9b3a4d5c683403c686b37bc67abf236a | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/bda9ac50dacb4164aaddfc0a2bc3cfdfa9aa63b1 | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6f16d4a028291b05bbbbca27caf905c7e40743ff | ORPH
    arc      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/fe65fb3511e41fb9a3d19520f151266ea8b28f31 | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c50e029858b792b5a42265bee3f9477c5c9f62d8 | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/3bab719284aeaae99be26050b501a4f2db8344ce | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/36bc518d92b5d8f0d8819c297a82a3c9a6529ca2 | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/47bfdc103bf7d09e75c30d23e2a7dac8064f680e | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1985dd3ab727f6fccff16dd4997d9e928b48a474 | ORPH
   sh4eb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/835ddf6354343e08adc79a26e8bb9550a72a17fb | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/3ed6014368d9695454cd259246f8e58a87f08224 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/465f6452b120810151e258c29f8b1d6d5206cee3 | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6bcbdb0c7ba10998f8df595a181c03f64f81334c | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7dd346d7b67e898db82e85182e87f958a740171b | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/074159fc8950aee0df462e7d42a88bc127d567ff | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ac048b1efb64bdb772ede320479a9d3f17350f33 | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5e7b98b73340623d9230e4022ec3ccf62fe2ba32 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/be6fbf4af64b13bc5c44f57af623a3a323635d75 | ORPH
  riscv32    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/2b7ff1cc28d9ff6f3f87066f0cdd09dbeb0f51f0 | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c5027a54a8893eb8ea17e4ea6587544067d2586d | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/19cc3aefc637a735328662dfff9b5fcf00a6137c | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8441f31add0ce4b4c8cb51f205f56f09e368df3a | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c66fb20f55f054cc7ee20b7281d6da7310983357 | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/d6b096212a2a3c47c212d7cce346c142a32ab859 | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0d6285815e904be4308a1d9fd9d4a8ac8e996990 | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f112d56c05b2654dce4f465553aeac3c79075c06 | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a2d7752486c358a87f7ca164d19963a815a89ef0 | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/be90e14ad501332883919f52d7b95a4b9b3528e9 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ef7681d937c88757c030a2154cbd5693344e9c7e | ORPH
    arc      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/142c6f055e1c131ea36cfc3b7d5344bd3575a30e | ORPH
    sh4a     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ef5c3924afd15cd4c282272d8d6acbb903834aa0 | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/2b328dbe6e05ca98a77cc2fee36bb9bb19f056ee | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/706861ee7f9a0bb60bbcfa877a5e7b22b0fb0827 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6c4f57f44f0ac0e1bcf484de7f65f8858cccbbc1 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/973fbd67e1636f9f2525316ae591c52699e77fb0 | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/688f48f90a2962fe36afba1e6c3a32e8d80bce46 | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6f3d21940f22a2c271cf12e4b64699d5c79278b3 | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/2949557a39106cdb9b1d0e71a8c1fc50ff764481 | ORPH
   sparc     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f7d8d04c8130f7221046873e6773817d1889e2e8 | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6edfe6c4511e144d7064db4001006d86e9b4ac77 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/73dbc0353e7a7db60791f0ef129b90acae08ae6b | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ae609d8e0bdceb4cf1976a9b641563154e64b8d2 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/78f8b3e576de568ccb2821db69d9d2ce149e382a | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/fbb41971d3e7f721740e3ef92739b5042a088c5c | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/27bdf6ad5b89a8fbff0bb165ce21a6410ade5117 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/2f8daa19f5da37cb9a0b0689ff66bae77b11c492 | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5fe000b86c431418ad6d54c28417b53096974cb1 | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0742ce9e5f35e0406edc363166c75b511ac94b9f | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/180610c8dd70ffe08232f1a1838ab2e5aa7f869a | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5d05f05e317b0c2bdcfb96c08cb9affe4867a913 | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/cb38e2fdd7b995f61f81467ada4c5dfe7ae7580b | ORPH
    or1k     |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/40f015c06ae7dda12b748168e806c8a603096934 | ORPH
    or1k     |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/e6c1bce1f3b7101863c26e3361b927336ad32d68 | ORPH
microblazeel |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/b44b53c8d690b17a6166fdec7e8ad403a98b4dd9 | ORPH
    or1k     |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/705a5cebe27f2cfe3f6f65ee2ed05d1051d9c6d2 | ORPH
 aarch64_be  |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/321ec8df317773e028e88158b53b00b3d925fcd1 | ORPH
 microblaze  |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/4a54ee2199fc2b152a4f5438a9c38407eaa26130 | ORPH
    or1k     |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/59e37dd65d5641a2ec06aaed2dac5ecc4dbd3f7e | ORPH
    or1k     |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/551d5c1706a72ece05103571f46b831ef37e4dfe | ORPH
 microblaze  |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/3223ab45168c20ab67a477038f1b5e2c01c8c736 | ORPH
    or1k     |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/d5f4eea5da5b6f2dac2c33bf65420ac584f05d09 | ORPH
    or1k     |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/6c9f777934527bb681dd7694dbeace2ff9eb662f | ORPH
microblazeel |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/473a3454ee29da57ce47b2f8577ae01f53c9254f | ORPH
 aarch64_be  |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/be0b460bde25fcf2cc5183471b71d8fb5d48dc14 | ORPH
   mipsel    |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/d8737a44d33daa65948cd06b996b3a06bdc06546 | ORPH
   s390x     |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/c4420054b13b9844ce1a111f2f235fc0b597441b | ORPH
 microblaze  |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/a1fe83e06c6b02e50ba06e1262c7e285c5f59b6a | ORPH
   mips64    |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/6823bb09630eb8d83fde2e66ae19cf53c9fc627e | ORPH
    or1k     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/4024219186f9c819fa86c18f2c4464c3afd672ce |     
 powerpc64   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/c968d1a079f7199392ce1ecfb353db723ddf94b8 |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/3fdf3ba0b20476f9cd9a4ca9e35790154e74635a |     
 powerpc64   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/e750f1fef36d75182abfc6fc554a1541906dec98 |     
  riscv64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/5c6cc93ae069117f3a7e97a88b55bb0a768d450b |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/72b516a9882d0a520a8c509b6438aa628af73b06 |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/f5ee331b6ea13ee44fe03ab87c17ee22e0831aa5 |     
 aarch64_be  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/5be4f65015ba0682e5739d125c28604c654a1b78 |     
    i586     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/299b8ec5bd0549f7f97c767897e16ddb0082fc7d |     
   sh4aeb    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/5a50c47eaadb2c3e249ae469efb842227077e8ea | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/790401e40f9ce078068681987941082c9ccdaf65 | ORPH
    m68k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/3e461b84018e0ca766c5a493837809f1c8ae4d49 | ORPH
   s390x     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/6757fd80fc460ab8b4f5e8cd674dc145afb3c241 | ORPH
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/d3f56d6d351660f6d5c323b3523bd958c03c3cef | ORPH
    m68k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/c5a59b264ca373a687cac4d88e1ba34cafe3478f | ORPH
    or1k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/49650aa0f68ff6564f16ade2359ea43ec268af6b | ORPH
    or1k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/1f7d5535b3e91280532f638af1faa3a75147dcdd | ORPH
   s390x     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/9b0767e14248f15e2bc1f0a318c70f2bcd8b7cb6 | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/ce3898374d9153c6377807d6b94dbb37a518951e | ORPH
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/de3b8294d5909fcd073d5c95d7444e48008358f1 | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/4d569c1fcd26d0a9275c65c23b8e4a51843d02ff | ORPH
    sh4      |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/1777fe69a0f67842afae0be14830509a3a34d1c1 | ORPH
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/fdb21ae9f73209abc3fdeb1e1a3d0c1c3a40c54c | ORPH
  powerpc    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/8f6ed0d8e08188a0cfd6a5360823837073818322 | ORPH
    arm      |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/fdf0302f8559560a5969c8dc89f07b6ad236e56a | ORPH
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/bc4b4bad5c000d570d403a875c8fef6a8bd2ba09 | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/13b87dceabfcdee54fb1a990674bac37fd3179c7 | ORPH
    mips     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/1f58c1f662bedf322f06c16d0d2c57f4bd0d0acf | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/899bbdcff16c23ab5ccc05f192ef4c4db39d3c80 | ORPH
    m68k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/de6fec7ee7d0ec1bc51b5abc7736d6ea4629f1ad | ORPH
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/d3e86d6ccec38584c582c81af1697319ea0d6f60 | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/a5b5ba722b774300d486ca64feadff0defabbbf8 | ORPH
    or1k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/d4292bc8db5e3da83a29931a8ffbce6ec87428c7 | ORPH
    arm      |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/dc4432c4dcde5eea90dc8071bad6c5adef74b670 | ORPH
   sparc     |          iperf3-3.18           | NOK | https://autobuild.buildroot.org/results/1ede352662c779e54303bc79bf8410fc7732532d | ORPH
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/3c137dd79b0936b190aef670fc88e0edc99ee2f3 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/2c12e638a4050a359e4ead95959b6ed9f489374e |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/d9fb7eeec219351bc951a77c938c3a015394e96e |     
 powerpc64   |        jpeg-turbo-2.1.5        | NOK | https://autobuild.buildroot.org/results/37a604ab272b2c61c9ecbd0fa696ad1e8c9506af |     
    arm      |        jpeg-turbo-2.1.5        | NOK | https://autobuild.buildroot.org/results/2e3e6d577626e0b812154379b1892463f5392d23 |     
 microblaze  |        jpeg-turbo-2.1.5        | NOK | https://autobuild.buildroot.org/results/4145a93440e7890bbb09ace59f1f9787414d66a5 |     
   armeb     |        jpeg-turbo-2.1.5        | NOK | https://autobuild.buildroot.org/results/aaf31fb75a33bb0dee9d599a36bd6b90c80f86d7 |     
   mipsel    |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/a1cbd781fde151a9e3808e9f479c815c0fe5c39f |     
    sh4      |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/f26aadc1d4b8f43aaf6b1ae6acce889892e42f25 |     
  sparc64    |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/608aac671e517ce149d111ae4059c7a3b3df3ed6 |     
powerpc64le  |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/291943726f45076fadb4db8e6296517fafce156c |     
  riscv32    | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/9d9f18181d4e7b6191173b36988156a3735c55c1 | ORPH
    arc      |        libopenssl-3.4.1        | NOK | https://autobuild.buildroot.org/results/ca078a1d7a845e7fd0a3c39252000ff2cb046c80 | ORPH
   x86_64    |      libpciaccess-0.18.1       | NOK | https://autobuild.buildroot.org/results/806643b35313bfb39ba0a786961bda8fdb3dd987 |     
 powerpc64   |       libqrencode-4.1.1        | NOK | https://autobuild.buildroot.org/results/e234fceed6bb6dd383bd07428399380f791e054e |     
    arm      |       libqrencode-4.1.1        | NOK | https://autobuild.buildroot.org/results/3fba5a62617051aaa9300f117252fd42ebf993d5 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/656853a9e19ccd3b38422bb83aecd5fa76a46b6c |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/36b0149eeba8e35ad6639c765367d67ee12f99ec |     
 microblaze  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/bcba5142ce87f39750c9336d93c7f1b0d1215d1e |     
 powerpc64   |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/273745fd85db1aeafea1b5683f724d6c7dd6adb3 |     
  aarch64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/0f887f494f3e0c799c5868c00bb1af1a73bfa5d9 |     
    arm      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/4fa3b3d12070e33c6dfb21fc1641c5f788013cf1 | ORPH
    sh4a     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/baaaabd2a7a320805e931d4fc380c834f9a7b58b | ORPH
    i586     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/e35bef11d3d72e6f836dc3ec674a4b56541e8934 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/47b9e77bf1685d6ef6e599afa04c128db5678380 | ORPH
  powerpc    |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/468c943e2833d46591713c2ba3165b795fee3cd0 | ORPH
   mipsel    |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/7430b7c2f3ad13fcec449828cf83c3b6834dd9f8 | ORPH
  powerpc    |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/cbc8da8f408e836cc18d0149c625aa311d568c61 | ORPH
    m68k     |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/17c539693147f5cba2f22d8531b3eda18b1a8909 | ORPH
    m68k     |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/95a7f74297210a76e046caf809b51a1b3341db86 | ORPH
    or1k     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/856146116daae41a735a71e928cde4cbba84a8b0 | ORPH
powerpc64le  |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/c989cf632b9508ae3b386f0419e5ecbc16615592 | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/dd5fe86281534f5a86dd67f7c55a2b23715e7b2a | ORPH
    m68k     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/3028f2c510fa772c9422c482f0e55c0ba6207948 | ORPH
 powerpc64   |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/48d2fd849b04214c67ea70ba2019942db88f260d | ORPH
powerpc64le  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/ab933e8c3603caeb8f733cee74169e8b083b0616 | ORPH
   sh4aeb    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/9ebc0d17d653fc8d4367baf454e034d03cf3e917 | ORPH
microblazeel |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/a27747aecaafe82bc390a3e47556e1672c5ffe13 | ORPH
    or1k     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/500e89a39313fec20f01f82f20fad1336f683891 | ORPH
    m68k     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/67012ff50986756fbe09e83034752b897882967b | ORPH
 aarch64_be  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/586805033099f7fce53194e3ae7e95b3fa8478bd | ORPH
  mips64el   |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/a151a4867b6dfa92dd8510a11d26be7d535ab438 | ORPH
  aarch64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/dbbe47697056e4dd27215f548695892c6210fd71 | ORPH
  sparc64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/079b7f67060e6ad056bebf42a71c94646db87323 | ORPH
    arm      |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/6f7b4c27e5e9db83bf5d340e27afca0f08918327 | ORPH
 microblaze  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/79fad2429126de24ec01fed6aaa6935b3257399c | ORPH
  sparc64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/488ccae7601d46c37707112e713fe06b3ec0eab0 | ORPH
   x86_64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/0f1ec124fc994554b5ba41a9341ad6c640ef3ee1 | ORPH
   s390x     |        mbedtls-2.28.10         | NOK | https://autobuild.buildroot.org/results/e35c8acc4e783236e4818e42fd26b528ae2f32e2 |     
microblazeel |        mbedtls-2.28.10         | NOK | https://autobuild.buildroot.org/results/8a44749738cf350b9f02350dc90b2bc29278ca53 |     
    sh4a     |        mbedtls-2.28.10         | NOK | https://autobuild.buildroot.org/results/b46ca69d4b236215152ef0f2e06580a9990fea73 |     
microblazeel |        mbedtls-2.28.10         | NOK | https://autobuild.buildroot.org/results/c515ba1e14b6c6afe2663df9686dc0e1ce790bcd |     
powerpc64le  |        mbedtls-2.28.10         | NOK | https://autobuild.buildroot.org/results/e3b38cfbe5a3edbeea76a6677385e84dca3cbbe2 |     
   s390x     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/17394378a69a9088d3ac701caa2fbf35bdd5ab6a |     
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/f348805fe09e31fcb3a01f5c29c8250580cbbf24 | ORPH
 powerpc64   |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/0da5294bc5cf79c3da62c5494ebc660e2061b5ba | ORPH
 aarch64_be  |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/e9dcb418f200e283fc553562d989aa59693c0baf | ORPH
   armeb     |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/76456f6760cbdb651ba2ee8190a9bcf3ea695243 |     
  powerpc    |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/36eb09f4471dd20283dc2017122ca620680f3abc |     
   mipsel    |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/d820ea35a38231a39945b36bd3d3994d57e732b3 |     
 microblaze  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/f0fa845db22b9dd78a4af0fa6946ccf19f70a421 | ORPH
   sparc     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/86a506705e86243d137b51a1e7fb6e53998b606d | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/069708ce199988b1f821a955b3c15d652a28d454 |     
    arc      |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/6e850ec6d1e4c6a4f28e4b7fde9cda6abb7732c3 |     
   sh4aeb    |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/e637ec0d69cd5f3e014a90496b88f363152dfe00 |     
    sh4a     |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/40ea6319d8dd564b3d470b1fd579a87e01089844 |     
powerpc64le  |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/ff142a6abfddd963e6ff83bbc24a7788016c7a05 |     
   mips64    |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/e0defe8e09b57a441ecb7116598b5e07b334e944 |     
   sh4eb     |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/ec39e9583726fae86e71dff8ab8f44b92521d16a | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/be61e87fc3da936ff063f79b52ac6d040f8fbc0a | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7f85dfdf729765126c0bce2bddfcf866474d53d2 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/4ac28f46320099946d087dea39f8ee92d8b6bdf4 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/d73608bf19b6ac3bedd4f73756e1e93b83e041b2 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/b204f12a9a09c222cf48e0cf0e68da567d57e4fa |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/e02420b5eaf0afaddd185ae02a5c7cc8425ed9f5 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5a6bf3f2e22c1db63fe9ae93ca053d3bbb7fab44 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1c7f17db5b1f6d24405211acf7b620530446f9f3 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/896a559f0489cc942183fc498d84d24ee254a5fc |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/aceb1e6d88f3a7a5d7937d85b9deaa1fc2ab24fc |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/82faf4602698bc5e9039460e3538297ba586035a |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/a26aa5f13f546d343441ae1191dc51b083551c09 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/b3a7b58c7d27e6a5df2d7247a8a21e3ff08803eb |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/35a040b9e092cb570bbeffbc9830e44a54cbb378 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/e670a5ba9513c837dc656fe199c00ac996b345eb |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/dca6678da5980bb3c3974c02501349440987e623 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/db8e884a2e8955ce01e12d7c23d5d39fba08831c |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/9867e697899dd3cc27681d3475bcbaac683f389c |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/9924688a51058cd2304469f0b8e58ba2e81eed68 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/2bfb1c3d439f9597ff866cb6330f11388c888c5a |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/1eeaec974eebbf2e47670d7309b3afe70a0b248e |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c30c17ff305e46b89c37023d27bffeebf41a5c30 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8656f9aece9f6d577c90d00646ccfade4b365140 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/a6d4a877bbc5f373bfffbe373be4b6b317188293 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/2ff6811ada5b5b270abf3a9d72fc71a71e18401d |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/51dc293297aa2ca7e77e49c166382611f6b75325 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/99af7a8aa84e5ee1fa4f1a2c95f302e7ebe4b7c4 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/675620b5b9cde718c95585943c989d0ae032a7a7 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/9b11eebd50f6089e3d1a52309b9802d3751beed2 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/5dc7a2beb6cd96c92b6c0b650cc04f19dff10ce6 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/80f7c4e79f35540efe32e114833ae512b620082c |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/52f9433bb517d102348daf5a3c3611ada6fa8469 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/b106671c2603a369db0e0adcf204c19d430bad3e |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/0fc2b1a0bcc818c7223cc93a382df59f14906208 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/21dc0c4782ffbc3946115135232db4e30fbc5a3d |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c1edde004a81ddedcf11b13e81a054156ba7c1ad |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/4561d7e7af8ae9adf8d1e8faa7a09fe44e867401 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/af87be7689c0d3d3a3b366222f8807e6829969a7 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/cc639ff58154503b9ea99fe1fe8989c4420efe11 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/954e4b62076df7f17ad583c70bb0a3b55d3c3185 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/cf8df5f0cc1218030db35f644beba07943b9c457 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/2dbfb85f1e75dda2eab360160e57d937c650013a |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/0a8e5ace30c121763fe16984b5b4289a64687cc0 |     
   armeb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/597feeafacb2ab21dd7d20225208af47a79e9bc4 | ORPH
  aarch64    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/5342b81e558a2b0be8983a97b6091be4eb507441 | ORPH
    i686     |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/11554f6345f6aa920b4657b5f55f822d422652f9 |     
    i686     |         weston-14.0.1          | NOK | https://autobuild.buildroot.org/results/9d69aa9f8635bcac598ce7818399f30fc667c8b9 |     
    i686     |       xlib_libXau-1.0.11       | NOK | https://autobuild.buildroot.org/results/47f1bd220c45b8cd4d8b26afd99c608cbd8a0a0d | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                host-m4-1.4.19 | 4 
             fluent-bit-3.2.10 | 1 
                 openssh-9.9p2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/c9fedc8777ece8393988aabefea622254ffae37a |     
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9d22049ee063ec64a7b5aa25b6b07082c57b60eb | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/99e0c3e3abef5221f7e0dcc5d9842cafa0cb351c | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3016ab9f47be5b390d988fee6b00a0cd87bff593 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/78f834ba1f6c28eb7ba82f5076676443bfc2b74e | ORPH
 powerpc64   |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/3c40d87ddb9576f86f0d88c9ac9edfeaf0d2f60b | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
