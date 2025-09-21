Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAF2CAC5A8
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 03:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 459A960A82;
	Sun, 21 Sep 2025 03:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZyBe2-YuuR2; Sun, 21 Sep 2025 03:19:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0A1960FD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0A1960FD9;
	Sun, 21 Sep 2025 03:19:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FB62219
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 03:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD5574010D
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 03:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRQj0gkjK1Do for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 03:19:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E0A740339
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E0A740339
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E0A740339
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 03:19:47 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45f2c5ef00fso24621305e9.1
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 20:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758424786; x=1759029586;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1c1P3hdZKBktrFJ4wvG16HlXCVBuWY4uG+UXavCm9Lk=;
 b=YQ/JKpWzVHpe7WiRwnP1dw0bL3oXCJaxBk0wPbvKwp8INb/X3r54yHsCbkmGFqJ6kk
 kOn0W664ZMtEeB/q6cR/5aQzp7sURJbXCof5ZgD+GKCWEXwiZ4F/T8a0uq7i3CQpzAmz
 3z6S4CSzbkzOXQ3hA7D8wijRilfl3zIK5aPuX9NeGjCqYhttrYhasUB4es5PafeCWWVp
 EtpycCPItvhzkXNRZIK7TBabhgTNWdvVCuc5kk44mPOpwM2OpVYLztaDvE0/gJdvyeqt
 uE0choh+lUKQxBr3N/J4876ajA0Fz/mgogm5E1GO79Skj7UPWpenzs/yCkSDDSZM1W66
 a3+A==
X-Gm-Message-State: AOJu0YyS3IDPc06HceFU4mNajuIdCZeCsOxxXt3JSELXYVdMtpGhu/4V
 lEaGqTf20hxmvEWgwiDQpVgKyZrxLsEPifsdfCJ/QLD2nQLQY+49YcNizqH+2w==
X-Gm-Gg: ASbGncu4fRlL2gIzr1XKaaLsDTL/y6dqyULjEHbpB9vAhYspNo8/TlYgD0enfA/VSIz
 q0YECi+SDTWT0JWvKRF0OlDYzM1/QHtg+EYouDOpbwOJ2rBogaGXO5junK+nraJjBcENh3TYaQL
 7NAblelHNvPMCWDQwyqcxWIydoVQJvp6CxEYfCFvWwJd2w2OzxsHrZJDzjBqjvdVLMwCBV10Evv
 wruGo2vIain3wn3jd52yEVLtp0CcqRsNS68EYx3bYkWFJ8ku1xLRy0MR/PKRTrOwubBFAUSk+sc
 KZICE1LVMnHM4d/tMhh8frXqsyilRC9M21SF9JEvF9n+Iht38LllmAbHVJF594//zVV1ImB7/+t
 ecEfJUAA1PAWuuulcqSDtxZgF8AdudZPrgJdf
X-Google-Smtp-Source: AGHT+IFUvV0FjtqPNoexwnABUTSCKOGuKEEKaOiFbhp+C2dLysrKoeLE2v1j9OeRjjmRS2jAIMBCcA==
X-Received: by 2002:a05:600c:b8d:b0:45d:e326:96fb with SMTP id
 5b1f17b1804b1-467ef72d771mr77948725e9.30.1758424785441; 
 Sat, 20 Sep 2025 20:19:45 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3f1549285c9sm7361396f8f.52.2025.09.20.20.19.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 20:19:45 -0700 (PDT)
Message-ID: <68cf6ed1.df0a0220.3943e8.993c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 21 Sep 2025 03:19:45 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758424786; x=1759029586; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1c1P3hdZKBktrFJ4wvG16HlXCVBuWY4uG+UXavCm9Lk=;
 b=Wh0WWFv32Vk1rqs7qdYot7Zy9+3VG0+Sgag1UJdnlq1kbc49JGehjci9zIUSqLZjTK
 54qsT049NtX8U0KyJ4sEDrJ2Y+YaHQMckyRNQ6ppwDDbiZ9NVLbWD83XwdDc+NE4SbG5
 NJhegTYfyvRyXBgGLhknlDsl4DepIIZvy8yksWhr122Gp/agb5bupnC8RGLSV5E3AClw
 ZMocsRpclaK/0AakKnUd/j9odng1n2zDadE9+c3Cx4lpCy2m0EXHRmsU5APHtIbv3YXV
 wiDrcnO0FAGZBB5cYKDcxWQRMGNiJzP2GnD/OPbwOp3gf7nspeG5drZSa+tbZpdcE2Ep
 l0Lg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Wh0WWFv3
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-20
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

Autobuild statistics for 2025-09-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  |  5  |  0  | 13  |
  2025.05.x  |  3  |  1  |  0  |  4  |
  2025.08.x  |  2  |  4  |  0  |  6  |
    master   | 31  | 100 |  0  | 131 |

Classification of failures by reason for master
-----------------------------------------------

                    mpir-3.0.0 | 7 
libdbi-drivers-0bfae6c43134... | 6 
               bctoolbox-4.4.8 | 4 
                     nvme-1.12 | 4 
        vulkan-headers-1.4.317 | 4 
             dahdi-linux-3.3.0 | 3 
                 logsurfer-1.8 | 3 
                   atop-2.11.0 | 2 
             batman-adv-2024.4 | 2 
                     crun-1.22 | 2 
                   cvs-1.12.13 | 2 
                   foot-1.16.2 | 2 
glibc-2.42-3-gbc13db7393773... | 2 
  gobject-introspection-1.84.0 | 2 
              host-rust-1.88.0 | 2 
                  libsvg-0.1.4 | 2 
                     ace-7.1.1 | 1 
               arp-scan-1.10.0 | 1 
                    azmq-1.0.3 | 1 
                     bc-1.07.1 | 1 
             berkeleydb-5.3.28 | 1 
                  cairo-1.18.4 | 1 
           crucible-2023.11.02 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
             drbd-utils-9.21.4 | 1 
               ebtables-2.0.11 | 1 
             erofs-utils-1.8.5 | 1 
                 expect-5.45.4 | 1 
                  ffmpeg-6.1.3 | 1 
firmware-utils-86739f2b3ae9... | 1 
            gettext-gnu-0.22.4 | 1 
               graphene-1.10.8 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
    host-llvm-libunwind-20.1.8 | 1 
            igd2-for-linux-2.2 | 1 
                jemalloc-5.3.0 | 1 
                  kexec-2.0.31 | 1 
                 lcdproc-0.5.9 | 1 
                libcurl-8.16.0 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                 libgee-0.20.6 | 1 
              libgeotiff-1.7.3 | 1 
               libglib2-2.84.3 | 1 
             libgphoto2-2.5.27 | 1 
              libmhash-0.9.9.9 | 1 
                libsolv-0.7.30 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               lrzsz-0.12.21rc | 1 
            micropython-1.22.2 | 1 
mjpg-streamer-v1.0.0-1-g310... | 1 
                 netsnmp-5.9.4 | 1 
               openblas-0.3.30 | 1 
                openvpn-2.6.14 | 1 
               pcsc-lite-2.1.0 | 1 
procrank_linux-21c30ab4514a... | 1 
                python3-3.13.7 | 1 
                s6-dns-2.4.0.0 | 1 
                    sdl-1.2.15 | 1 
                   sdl2-2.32.8 | 1 
                 siproxd-0.8.3 | 1 
                speechd-0.11.5 | 1 
                 sudo-1.9.17p1 | 1 
uclibc-ng-test-132c6134d691... | 1 
                       unknown | 1 
             util-linux-2.41.1 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/50548e8b78727dde43ecc37f882cb2ac0a9a1cce | ORPH
   arceb     |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/fa1f8f47ec005eec6624e19850fdd2d0c9fa6e12 |     
   mipsel    |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/669dfcd8ed2ded82b47552e49a2954d785c5aae5 |     
    arm      |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/9b9db53e40aa8059c0e8dab6bc3258a9c7faef3e |     
microblazeel |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/c5aa9aa14706dfc1944e980491df1457aeebdd81 |     
microblazeel |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/730521abb8b4d6f21dcc3c56d8f1ba1e54279016 |     
   armeb     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/e206cd7b1e7b0bf62b94ae3307fb17ca863a585a |     
   mips64    |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/b11add391b39928a49348bcee5e3afeb5f76d934 | ORPH
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/ebb3147025e6153b0e50e241944ccca9183aeda7 | ORPH
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e39a8e1c12e94438b2784b45493aef09712cf691 | ORPH
    arc      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a146d1c23f68e407ce5a0778a6b66e751324341b | ORPH
    arm      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/3031067b12d3c8c4c5a1494158c4f56dd55e48fb | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/4e910e3dc2cf4a24d5a07c2cc4a6fc1c1db7c833 | ORPH
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/fe2b7f3e2b5acf70ea83d0727f8c532e1efa1352 |     
  riscv64    |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/24b3b177fd5c4c51da199714ddaf17b6c5198314 |     
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/ebe1ae43ba7fff2fc1888c4a380cb116cb197df1 |     
    arc      |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/cbd8d7b50b2b3ca986f5c2fb1826d4bfaaf609b6 |     
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/98d88dc641058af53f03e33d7228045f526cb99a | ORPH
 microblaze  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/10de731d0b6b7dfc4bea0e5037f712e135d1353f | ORPH
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6baa33bf0ac1d8b16373ce693d9c4af5148ef910 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/cee74b33c340e1408d2f55d920598864c3c01e15 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/87e99716d7745660348caeac2c40a7b034f45c01 | ORPH
  aarch64    | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/07879c8426807691cab22722c50f4d35608f534c | ORPH
    mips     |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/a55f915e8c11b6ae2289bffd18f19d323af4d6d5 |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/f2eef01676ae849dbb427d0f3cba363c83705204 |     
  riscv64    |       erofs-utils-1.8.5        | NOK | https://autobuild.buildroot.org/results/66676906f587a6323c2ff5a65113631198f24e13 |     
   mipsel    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/361d415364576cf5ddf36fdbb430af591560479b | ORPH
microblazeel |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/e52a01933884bffd00fa7857473b7f8900381c4a |     
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/2c932bc0429e54c6278c980261bca2e60453e31c |     
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/eed7763fde7f91c1ce1fc0be6c7afd81c8ffd146 |     
   armeb     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/2705cc793cff8a56ccad13b557efaf58cabc1b1a |     
   mipsel    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/9d21b4ddfa1879d5152310482a3a43b8ed2a2859 | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/b1ac10f2ace109872b05dfae3a59c22def7c6e1e |     
   mipsel    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/ba1283978ef34c70c1d83e19f0fc19713d856e27 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/9de80f5a9d8554113f34d938b9b97b49d098c48b | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/cb212c65b38ea087ec15a9e227309215096093cd | ORPH
    arm      |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/7a46b0c8e2cc0753eef82c6b742a03903f1004bd |     
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/8cf5edd4c2be7e8f561f1dc86d7dc8f750634248 | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/cb4ff35e78ba85ee142f49deac1182e1c1c3f757 | ORPH
   x86_64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/1af41b8fe6f2026509f00dd7a6f4591211d76d55 |     
  aarch64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/ba225f3dff0fbbcf110697092c427c20c36d0d4f |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/e744fe2c08d11147a03cee7058f303cedcb615a1 |     
  powerpc    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/18c66d701b39e952a75a6642b34bfb82026eea5d |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/36e8476ec8bfec74d1e89da7de79159b49de65a1 |     
   mips64    |          kexec-2.0.31          | NOK | https://autobuild.buildroot.org/results/8651ceffcc8559ef1255b0650729c58640a9df28 |     
    mips     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/6e075256c90998afae0955958202303e83405db0 | ORPH
    or1k     |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/0e6f64b4f5fe845bd772564b6a08c3c75185584e |     
    m68k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/ea474e71f6bb4a895f4276f2bca7dc67e20a95cc |     
   sh4aeb    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/c4e75195db4aedabbe12c1e67c4ff2318f1a3ec3 |     
    mips     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/6d8ba1d4561f277dfe9d11661fd3cf029e3e6865 |     
  sparc64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/244ea1be6e475be3fd9115678d703619b077e254 |     
    sh4a     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/f9d00732c53d12d8f46b455795dbf3cd15a33869 |     
  mips64el   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/a0913ff0db238069660a7e291ea84006ca46c892 |     
   arceb     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/d116b3a8445ebab484860e27ba57e6bbfecf49a2 |     
   s390x     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/e53425babb863d05b3bc76512a5e8394f862b244 |     
    m68k     |        libgeotiff-1.7.3        | NOK | https://autobuild.buildroot.org/results/bf3ad2089bed5f8a8c692b8c96b1a2a555e1ff3b |     
    m68k     |        libglib2-2.84.3         | NOK | https://autobuild.buildroot.org/results/c081207b470835693f32e63060d3e2e05a80d74e |     
    mips     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/ba0899906c1d69d0b91f5d35879073aa5e5dc377 | ORPH
    arm      |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/f7d46ef00853275fbbc3e8b755ba2417685d15f5 | ORPH
   x86_64    |         libsolv-0.7.30         | NOK | https://autobuild.buildroot.org/results/f7ffb9f47e251f608fa37062229081e12b0eb4d2 |     
  sparc64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/b104d09977a9baee1856ef57193eaf1a29a0378e |     
    or1k     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/87d0b5789ea9278529c49ef2fa2a2a13ab25c046 |     
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/750647e4295f06ee107917186f8bc36ea6077062 | ORPH
   xtensa    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/c089cd22928344af4e97b3e25fc44b32224fedc6 |     
   mipsel    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/34c6715657158408865c57be79311ed80bd44aa8 |     
  powerpc    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/5a93de4c04f99be43a46faa3dff68de04c68b7a6 |     
  aarch64    |        lrzsz-0.12.21rc         | NOK | https://autobuild.buildroot.org/results/384dba6746f0657dec92af867c8e544f79711b62 | ORPH
    arc      |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/3954d33370aff1ae5b368480311d00f9c09f2ebb |     
microblazeel | mjpg-streamer-v1.0.0-1-g310... | NOK | https://autobuild.buildroot.org/results/c72b57c998ee818d85e50c9539e55ad556b2f23b |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f8fa6ede3c2d791fa6d486b62f54f530c09e99cd |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2a4137e2c1545de481625380a9a6cf810cfb777e |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d302646b6c63d4682159c1b30ec95775a2829a47 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/cdfe88e49af42a3cf910d7524b0ce794739376b5 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e338f56d8368a45bc51c46b7f1c5da6877a7bd9f |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/adfdf818419f42393b6a89b424642ff58119ca42 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/34106c115bed2ae0d3df85213a51984a6d8b45de |     
loongarch64  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/91a3679e5aad97084076e0693b061f91c9225ebb | ORPH
   arceb     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/c3e0ef587f5debcfa09b901eca063e88aa5bd4a3 | ORPH
 microblaze  |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/af972bb4bc6ac77fdfe76655bd16bedefcae9ff9 | ORPH
  riscv32    |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/850062e0378b3728d7f4f2fb7dbd9c8eff65c451 | ORPH
   xtensa    |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/2742deef47e5877ee89d3b27a6d5af1146c3b659 | ORPH
   mips64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/836054f9cf4f8abc91fb9a7bef44603255cf33bd |     
   mipsel    |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/b8fb71e6bbfb44c7bb5211d1e534656462f46c06 |     
    arc      |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/076c4699025a8d6ff05bf6abb57771fbcbc0b49e | ORPH
   sparc     | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/c3e8b69bb75bb8bbe1a938928bf4979ff9679a02 | ORPH
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/6f028cefe14c54f4d2b00a794fc615ff3c5a8daf |     
 powerpc64   |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/d2a50eb20ea99d9ad081852d40341d019d91eefd |     
   armeb     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/b1112d84094a333edf323f1f3728f4c8932583ec | ORPH
  powerpc    |          sdl2-2.32.8           | NOK | https://autobuild.buildroot.org/results/091b6f64df8a017242893c3bb7d89e77b27cb535 |     
 powerpc64   |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/be24d8dc6409007f5fe74cf3db6f71e2e4001d43 |     
loongarch64  |         speechd-0.11.5         | NOK | https://autobuild.buildroot.org/results/ba06df70fac23453f826b5e57d9a7ac7de0f6a56 |     
    arc      |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/8a03c00a406bf4699fe5e8766b4af624d945fe3f | ORPH
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/ceb6d4c475b6a5a6fed799f46e0bdaf35d77a325 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/a2f4dbc59f0063192a4813447aa70bf601ee6732 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/823f6bb7d2f37cea63e9d88eb9f996d841255845 | ORPH
   arceb     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/4fc46cbde927d3a947737b0f0196b2918c1ee4c0 | ORPH
    i686     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/c93bcf01ccf821d316ac39f04df064c2013aa41d | ORPH
 aarch64_be  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/4f8fb86b18e26dec3e00bbe12de4c03dd6409587 | ORPH
  sparc64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/3c58fa613aa070ffe3c534e02e056ca55ca85271 | ORPH
    mips     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/f70fd34db5eb34affacfb0d2509433e749a13a1e |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
             libgphoto2-2.5.27 | 1 
                    sdl-1.2.15 | 1 
                       unknown | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0bd1dc01aa8e2cdc0afc8d00bcc393b79c65fad9 | ORPH
    i686     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/580f0c78b1667ace40845d6cb0e2edf987c4f18c | ORPH
   s390x     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/645ae81ed9a1d6091c1659e9c7e313a772d7626b | ORPH
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/186cebca0c63216092e1fdd410a735ab182873da |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              execline-2.9.6.0 | 2 
               bctoolbox-4.4.8 | 1 
glibc-2.41-70-g1502c248d58c... | 1 
             libgphoto2-2.5.27 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/859d2705d48f06e7c65921e58db022fd3a15569d | ORPH
   xtensa    |        execline-2.9.6.0        | NOK | https://autobuild.buildroot.org/results/226705cefe6b8d77829961832db68945e9ff20c9 |     
   mips64    |        execline-2.9.6.0        | NOK | https://autobuild.buildroot.org/results/19c557fe7390dbf20bb41fb3249b0feb9896b748 |     
   arceb     | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/594ad7ec698580daf978df09df660c5764af1fa8 |     
    arc      |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/380cc4ae5a6bf866b0c5ba9d84683be39ac54eed | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

              host-rust-1.86.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/cf645bc55be356b6159828605bd1002d415aa801 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
