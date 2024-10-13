Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82852CF258A
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 03:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E238E81EA1;
	Sun, 13 Oct 2024 03:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4r8FMl_rRETX; Sun, 13 Oct 2024 03:17:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E54C881DE5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E54C881DE5;
	Sun, 13 Oct 2024 03:17:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DFB4C1BF5B5
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 03:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C22344013C
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 03:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-vI-kNfOjLA for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 03:17:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1DE1B40022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DE1B40022
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DE1B40022
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 03:17:53 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c721803a89so4525131a12.1
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 20:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728789472; x=1729394272;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jue4PLkfJY+PtzjX4rESSUbm/aBp4c7vArR/34ded/k=;
 b=VZpU3bxd1XYsNSNyGpZIDS9we9IoERyjQTTO65hIAZaejZcUbAaNNSp7mxQRtcVe/9
 V3H9at5WIj+iDtQuZgvJZKsikI67aPcJj3G1HtuZBhGf2xFBaYCayrJUH3flvYdYk8qC
 MVIFclTXeROV4HhEC3zzgbZNu6gUtDfogB6TmdS06XWBrldGO8edezE6GIhN4lDj9PoE
 38L4cVwkmaJtqKAxwTTFgeaF9aWJqol5yD+BPa4/LkZ/npz9IFPmjMVkqbmCOzykG+2U
 I0B7m/uNuQNZQymVVNS3LSVMzTxpGvQ8WI/Iu8f/302FUfR76NA59eeRWpbzxqrZUSh3
 +Ckw==
X-Gm-Message-State: AOJu0YyUG16MB3LtMeNArQG6BB5gJs17CZcpFjv/+vgInGe4kRqmwNO2
 sFAfAH68POEytf2hR5KYhgAS0DCoWxx26Qs0Rz/erV/ewByY80y5ZGBLAA==
X-Google-Smtp-Source: AGHT+IHy2cyeA+477ra8mLb22cvCn63IBtsdMtQTONLEkgsYRfUZExc6p1KuMnFSrDAMDVghvU1QNw==
X-Received: by 2002:a05:6402:35d3:b0:5c9:2a18:9814 with SMTP id
 4fb4d7f45d1cf-5c95ac0986bmr1873314a12.1.1728789471389; 
 Sat, 12 Oct 2024 20:17:51 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c937260964sm3342527a12.69.2024.10.12.20.17.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Oct 2024 20:17:51 -0700 (PDT)
Message-ID: <670b3bdf.500a0220.1edb8b.d7a6@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 13 Oct 2024 03:17:50 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728789472; x=1729394272; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Jue4PLkfJY+PtzjX4rESSUbm/aBp4c7vArR/34ded/k=;
 b=b2WLaCyIWWdzfm7nPyxJxGwxaB1k9uBJZzL12pKI0eKro7SjzO1ZR5KssII3fmvSuk
 x0RoK826Z8ua7+smV7UZ8riR3tT3FGym2sXLfZZCw6JoBK7UJ3C2tsmIyvcMsYlq+KEb
 +nswC6otbc5yuDyLybgkxZi/BxyC8QLUOvw+axbph4xUwcu2EIkz/y04l46hVwlJRGy1
 YLAwf/HnURiBFCzMFVBJZTmgCnIc1iR/XVyllY8vZ5mcQNhQRtbFX73JjyzzwgSsmx1W
 TD+iKCdMCbdH9uldIotiLZ/uDh9rl2X2Jp02glzsfxLL4viA6zAK0YW6z/oiQ2NecUz6
 /RrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=b2WLaCyI
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-12
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

Autobuild statistics for 2024-10-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  1  |  0  |  4  |
  2024.05.x  | 18  | 20  |  0  | 38  |
  2024.08.x  |  1  |  8  |  0  |  9  |
    master   | 19  | 281 |  4  | 304 |

Classification of failures by reason for master
-----------------------------------------------

                libcurl-8.10.1 | 27
               procps-ng-4.0.4 | 17
                 linux-6.10.10 | 16
                    git-2.47.0 | 9 
                  bind-9.18.28 | 8 
              host-rust-1.80.1 | 8 
           host-librsvg-2.50.9 | 7 
                       unknown | 7 
                 apache-2.4.62 | 6 
                 gnuplot-6.0.1 | 6 
                  ntp-4.2.8p18 | 6 
                 coreutils-9.5 | 5 
  gobject-introspection-1.76.1 | 5 
         host-libxcrypt-4.4.36 | 5 
android-tools-4.2.2+git2013... | 4 
            gdk-pixbuf-2.42.12 | 4 
         gobject-introspection | 4 
    host-python-greenlet-3.1.1 | 4 
              libopenssl-3.3.2 | 4 
          linux-5.10.162-cip24 | 4 
                  assimp-5.3.1 | 3 
                  bcusdk-0.0.5 | 3 
             dahdi-linux-3.3.0 | 3 
                  ffmpeg-6.1.2 | 3 
                   foot-1.16.2 | 3 
                  libva-2.22.0 | 3 
               linux-pam-1.6.1 | 3 
                 openssh-9.8p1 | 3 
                 pixman-0.42.2 | 3 
                   bird-2.15.1 | 2 
          cloudflared-2024.6.1 | 2 
                elfutils-0.189 | 2 
              fftw-quad-3.3.10 | 2 
            host-binutils-2.42 | 2 
 host-binutils-bare-metal-2.42 | 2 
                host-go-1.22.8 | 2 
host-heimdal-f4faaeaba371ff... | 2 
httping-0e26c53d5fe504eb720... | 2 
                      iwd-2.20 | 2 
                  jack2-1.9.22 | 2 
                jemalloc-5.3.0 | 2 
                 libv4l-1.28.1 | 2 
                libxml2-2.13.3 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                   linux-tools | 2 
             lirc-tools-0.10.2 | 2 
               postgresql-16.4 | 2 
               pulseaudio-17.0 | 2 
      python-autocommand-2.2.2 | 2 
                  quagga-1.2.4 | 2 
                 rtptools-1.22 | 2 
           v4l2loopback-0.12.7 | 2 
               valgrind-3.23.0 | 2 
wilc-driver-linux4microchip... | 2 
                     ace-7.1.1 | 1 
                acpitool-0.5.1 | 1 
               apcupsd-3.14.14 | 1 
               asterisk-20.9.3 | 1 
                    bat-0.24.0 | 1 
             batman-adv-2024.2 | 1 
             berkeleydb-5.3.28 | 1 
                  boost-1.83.0 | 1 
                  brotli-1.1.0 | 1 
                   bzip2-1.0.8 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                     crun-1.15 | 1 
          cryptodev-linux-1.13 | 1 
                  curlpp-0.8.1 | 1 
                dbus-broker-36 | 1 
                   duma-2.5.21 | 1 
                  evilwm-1.4.3 | 1 
              fluent-bit-3.1.3 | 1 
                  fwupd-1.9.20 | 1 
                      gdb-15.1 | 1 
            gettext-gnu-0.22.4 | 1 
                  giblib-1.2.4 | 1 
glibc-2.40-18-g564178076272... | 1 
        gmrender-resurrect-0.1 | 1 
            gnuradio-3.10.11.0 | 1 
                 highway-1.2.0 | 1 
          host-binutils-2.43.1 | 1 
           host-doxygen-1.8.18 | 1 
   host-mender-artifact-3.11.2 | 1 
 host-softether-4.30-9700-beta | 1 
            igd2-for-linux-2.2 | 1 
                latencytop-0.5 | 1 
             libargtable2-2.13 | 1 
                libdnet-1.18.0 | 1 
                libesmtp-1.1.0 | 1 
               libglib2-2.76.1 | 1 
                libressl-3.9.2 | 1 
               linknx-0.0.1.38 | 1 
                  linuxptp-4.2 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
              luabitop-1.0.2-1 | 1 
       matchbox-keyboard-0.1.1 | 1 
   openvmtools-11.3.5-18557794 | 1 
             parsec-tool-0.7.0 | 1 
                    php-8.3.12 | 1 
                pipewire-1.2.2 | 1 
       riemann-c-client-1.10.5 | 1 
          sphinxbase-5prealpha | 1 
    start-stop-daemon-1.20.7.1 | 1 
                   swipl-9.2.7 | 1 
                 uclibc-1.0.50 | 1 
               xwayland-23.2.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/cf0c6aa16c6ae517beae57d2cdbec23a4ca574bc | ORPH
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/864aba5b71cf311d38e91b354b38aee4e4349a05 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/cd80b635eb1ab9dedb93d948f8d3d08bb2669717 |     
   mips64    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/9fb30409ee4373724f9302052f0a0bcf326bc415 |     
   arceb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/689f42d8fd322317471dc0aa021832b125d0ceb0 |     
  mips64el   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/0a683141504a136564ec1f67501eaf15e83ed27d |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/aab9cbd37148a180518c1b963da491b42a47c8a9 |     
    or1k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/c7d6a28350fc1ea418a3d37687446394647672fe |     
    arm      |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/f4a57b5d6e513e6d2112a668cb67051a52d8126a |     
   mips64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/bda61d2e7d2b96121eb0959302c7b360a2459981 |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/1b221049b11cea85f322c76e1e640d66cbd71156 |     
    m68k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/de157e3a910defde72ab020ba3cc697ead6d1f1f |     
 microblaze  |        apcupsd-3.14.14         | NOK | https://autobuild.buildroot.org/results/6c4501076d1141167177cd11533a6ec8e7b9552b |     
   mipsel    |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/14f5d6ea61ecdd1f36efd6f324085fd43a18f6b6 | ORPH
   mipsel    |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/0ebdbc53167525cfafad05ff64728170e1b2bfe0 | ORPH
  mips64el   |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/6a466e296abd7bc0f770df1bd6b605deec255033 | ORPH
   armeb     |        asterisk-20.9.3         | NOK | https://autobuild.buildroot.org/results/4d6807020abae88eac4d5a5a184b3f42d45ce4fa |     
powerpc64le  |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/c2f1467c6c836568bc3f01d98450e2fd8c06a1aa |     
   mipsel    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/74476cdb53b3effe923290ca787755de5d5dd9f6 |     
    arc      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/61b7a20fb52e46da088f0de7cad0898441382d01 |     
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/0a067986ef2059859239b888e4ec847cbd0955fd |     
   mipsel    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/2a3e8ba1cd88a5a297f577ab7477c857502317b6 |     
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/81dd5ff48da103dbb6afdce8205412471b9537e9 | ORPH
  riscv64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/b15e9edcd1c70d481a90aec02a9eb8dc2993b1dd | ORPH
   mips64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/28d6db51e591bded79dd8a1672c68faa49642309 | ORPH
    m68k     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/ba3a3a08676033b1100c4f3ae72319940d919494 | ORPH
    or1k     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/573323dbf99c59fd1ac2ace88ec07a98614a8fd1 | ORPH
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/45eafc5b588333cee815b938c73d9fa6ee6b436e | ORPH
  mips64el   |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/eff0db3fe99795aca7b021c1dad688c6434b7e93 | ORPH
microblazeel |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/53fe208adbed6e7623cbc7f615a3c254279ec905 | ORPH
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/253a9aa453738c3b7088780ff7d41d36c50600b1 | ORPH
   s390x     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/01a1a81392501046ae3c037e3dbce6c7ecb8758d |     
 aarch64_be  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/ac43b3ca95c4bdc20579c06bf12f5e7b2a7d2ba5 |     
   sparc     |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/b8ab430659a4ae7061cffd5823a03227b8e0fb98 |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/a8850e1c4dc02e28aeb27d8cf11e063ec6a61a43 |     
powerpc64le  |          bzip2-1.0.8           | NOK | https://autobuild.buildroot.org/results/2b6dbb79db107503afb1e4015bc58f559accd347 | ORPH
 aarch64_be  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/ede3130d5bfb017efd76e6a3c84fe962a83a34f2 |     
powerpc64le  |      cloudflared-2024.6.1      | NOK | https://autobuild.buildroot.org/results/b57a2dc85a1561e85d8b121d50bd90d64d98e1c9 |     
   x86_64    |      cloudflared-2024.6.1      | NOK | https://autobuild.buildroot.org/results/805b62e2db27d6270ddaf78eec5ac429b45bb436 |     
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/f052f1178c5dba6a2e4baaa372b7373689e31b2a | ORPH
  powerpc    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/158895265c595f403d6bd24c6918f0e59e36f963 | ORPH
    arc      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/e9123c3e747d5cbbbb375da7a90dbe427490021f | ORPH
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/fb9daf4c705a6ba2325df34881aae35b014e6ece | ORPH
    arc      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/a43a88055b556586e575f864b2eb82c9b75d8f06 | ORPH
   x86_64    |           crun-1.15            | NOK | https://autobuild.buildroot.org/results/2d03e96bcc817346eb40181965945daca070f9bf |     
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/fc3dc380ebfdfe71b7c09a2887493eb83997cbbf | ORPH
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/5f84724bc9b4b012824af12001c62da73328e5f4 |     
   xtensa    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5447a7ae97294a462929651b8d2dba5438f4f62a |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/19c9ec96b3c10edf4ab10e08f068e6c5f3ff03d3 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/754a8bcf8db945e6f0042f09d6e6d4192afddf4f |     
  powerpc    |         dbus-broker-36         | NOK | https://autobuild.buildroot.org/results/7a7ab62cc8e8b6297baedbf08c0c989068468c2f |     
   nios2     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/6ff3838a7616e420d1afa83805c20101640ced38 | ORPH
   sh4eb     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/a0bac9107af64b1ac4abe7c60ceb0b604a7c2905 | ORPH
   s390x     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/ad628cbc699e9718f7df1b6fdeb0349184a5ffc2 | ORPH
   mipsel    |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/96847891ebdb96a409b14c106234e1d3717c2cd1 |     
  sparc64    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/9409176303ddb1208b54fea9ffc3e2169ff7ea2f |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/9ebc406aef1f57d54b00e45b11b29e70647c9faf |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/25731fa93a3acccc77bfb50fc607b56631d4a88b |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/880e82b7f7adefde38d452afc823893dc9c30cca | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/4738beb9705d93c50fb143ac97f62edc0d4076ef | ORPH
   mipsel    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/0bc907693f147ed46b56e6d7270bcccfd0c3fbca |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/a18a59da5d3aecd88469bdf039ebe11d4b717ea3 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/f6aaec5923ba3917acf4ef29b969d3ffa8891f09 |     
    m68k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/3586fd29db4e78d3f97947c1838379da7af58df2 |     
   s390x     |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/0947c8ae307785be70e1ac793fd6e7c128309b8f |     
   sparc     |            gdb-15.1            | NOK | https://autobuild.buildroot.org/results/36f6b8d5320290ef390c3560a269fbb7de94d5b8 | ORPH
    arm      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/a9a8463491d6d9539d7a696b6b3ba070e5fc26e7 | ORPH
  aarch64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/deac7e67b27e80448bb35dd69c7f3165bd6ae736 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/7bd5d85e4b2d409a4488940689ef726f6a33bcd0 | ORPH
    sh4      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d95224d9316e5cd9b05479d679e5d13e196f4060 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/6d002795eb09d9645b1b6b3dad49b0575f87c4b2 | ORPH
   armeb     |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/0c1c447c0d02eebd2353fa4ceb55c069ff04a4f6 |     
   armeb     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/9c5dbde0587d1165fe7dc92128af62c209cd331c |     
   sh4eb     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/9c2602b60f515a1759bb26db50e9250ed15dfd7b |     
   xtensa    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/b3f2730d9032606e4e99578cc0848154f456c721 |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/784fa31f308d35c58c180fa470510cb6d7fee53c |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/7c532984788ad1904505efcd8e2ae104540ebc83 |     
   mipsel    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/ceeba18e2d3bcbf346d8df4c466b6033a341629d |     
    or1k     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/208ffc451f59211a657114e0a4c11abe7337725c |     
   xtensa    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/3a4beb6fc3dd7ef8536276829d8aa07ddb8d3562 |     
 microblaze  |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/a67e749465572b90d454e89d5adc625b46db81a8 |     
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/b85a65c41804839e6d3f8e38105ffe1872f5247a |     
    mips     |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/3e3b90fd0f6c033a95551eae30a6106651530e9c |     
microblazeel |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/ded8eea11ceb8f15662ae4559d3cf3eeb28b6cfa |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/0ce4e77ef1f3e88fdce407f9820c2d6b248c615a |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/a164f441874c6d5502b9c872af9950d10bdba04a |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/8c2c0b40c02f8a2fd5dde056293343aad6b90b5e |     
   mips64    |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/8be4d31e032d2005d86d29c630aa581729ec0eb6 |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/97cae6aaf070bf88c95388e85174706bd18b7e27 |     
  mips64el   |       gnuradio-3.10.11.0       | NOK | https://autobuild.buildroot.org/results/fb1e0b6464624c26e9961e8a9e6440e3fb050cf7 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/bc6e686b517d3e9190f607e68c23866db8639369 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/302d78365c879c099d18f2a657b3d2aa15fe692b |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/c11d2d88405efdc288eac590a88a823a7e6e51f9 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/fd4d6c21e08a800cb69ae8cd8be6d5cdbbe5781f |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/8be151c29349690d170ae9566f3629c28cee75b8 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/3966deac0dd78c5b36fc62f51a7ab0263e5f9b57 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/881435004f90da4b055b875450f6bea48ad20659 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/32dde58847b927799fb337d2343ce957052159b2 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/34c1770bb58d07defce5ea8334968692f31c9ddb | ORPH
   armeb     |         highway-1.2.0          | NOK | https://autobuild.buildroot.org/results/c20d9c16537de0b8da586f3a0e176fc6ee55d09b |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/ddae6e70c458cae4dd48df2cd2a179b3160ef3ee |     
  sparc64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/5481b1b7b4345505ef3ab085530e7c6610228e54 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8594073a0ea7329fef9491f9af0b7ac4178080bd |     
 powerpc64   | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/5915eee542e538532173df84429ad2729a6b2bed |     
    mips     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/c311ac996eff4404ae83c4c4b6e2d6e153f342db |     
   mips64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/aca487a0a6a9ba40651903ea46da55349eea3e5f | ORPH
  powerpc    |         host-go-1.22.8         | NOK | https://autobuild.buildroot.org/results/c6979e0403b78e85e88cb6f79eb6d304a8a01ef2 |     
   sh4eb     |         host-go-1.22.8         | NOK | https://autobuild.buildroot.org/results/d9ac2a22f9263d05ad18d8a0445aa4718b4da025 |     
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/8ed756924cf6eafd6ded3fc1120809ca95a80a34 | ORPH
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/a8e934ecca99648796a4e0e7b9863c26685633ab | ORPH
    arm      |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/7be480c653fd374c7f9e32ba28413c9c2c144c29 |     
   s390x     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/b58c6e8672fab2bd81e82de9ff092fddfeb0bf42 |     
   armeb     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/2ea5510287e818f5bf07a9f468afaa4b12331c97 |     
microblazeel |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/61b32269102c34f6500422b6cba0cebebd920947 |     
   xtensa    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/d0ed5fff7ae82b81c784366e7745991cd31d95e9 |     
   x86_64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/b70884033d158b16a25500c521205fac0eeddb0f |     
   x86_64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/a6baa1469b43a149bca541d92af9484c6edd0b2b |     
 aarch64_be  |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/08f89dfe13ef470d48c3d3ae66a5572e9c5afd1a |     
   sh4eb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/6ffbb4324c1f8454a8ef573643889457b919bf03 |     
   s390x     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/e9ad441658d020e91565e9e35d966898d48a57bb |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/6ab34d9600b3ce429f6961638664255901411198 |     
   nios2     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/080625bb3e77e55e00640722969b55cd1275c663 |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/fb16bea47dd3682c4385b70f75edb9260da55477 |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/00dd18b46f3a2b0b99f72da0d682e2f994c7c7d8 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/e6b04c7f498e4b376dd59bf8de9d09b2a053be6c |     
   nios2     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/9bd5f6be349598a57f3f029e1aa5a7ec4cb6d498 |     
 aarch64_be  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0a3179de700cb2bcafe0e0edb01a0da0e61450c9 |     
   x86_64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/ab7ff93eb667cbcf6c5a36a81caa849a118c12b7 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/305280df5360a1a10e9d71331a2c36dd98e48e5f |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/a5b352b33cf24a55397a2d7b2dff2c4c39254f76 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/a205c2adb7d90f318ce56410864f90ef3555af04 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/7bb0ec7b3264e9fa6f3b522759594c4620c30e50 |     
   x86_64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/1e7f144c580c4c02206d83f4536f425966359edf |     
   x86_64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/92869485076ccf665b30dd169b896e304bb10c99 |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/12e9a03c1468b74f0197ac9cba2ad14b48263424 |     
   s390x     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/9e08fe7b22dc06df539ec9063667e97e0c7d7db1 | ORPH
    mips     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/00be20621c0ee190d6ae5730cf977efffa9a57cc |     
   arceb     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/7a269857802c22978e3f32e06d375f76838baffc |     
   nios2     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/3c7a950490c34c6bde32727be22b9d7c037989d9 |     
 aarch64_be  |            iwd-2.20            | NOK | https://autobuild.buildroot.org/results/9809f18714eda9dd6fb8091947b4845052479602 | ORPH
    or1k     |            iwd-2.20            | NOK | https://autobuild.buildroot.org/results/fb1c2e746ba364e16599b6b2cb8d6be7f8da7bd1 | ORPH
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/bdcd912f4be97fb3ffbb4c91ca635b38674e9a3a |     
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/c63dcb01de8d7633c37264b7f05bc00411584416 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/1d7afb744a1543ea07fc52688d1b00d5bec52f30 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/0ff753431684f400158d2ffbcea9faf749a86ae4 |     
   mipsel    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/1cf73664cff86c04090330067acd088c8bb0b18f | ORPH
   nios2     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/5060a5f5ce18bf4957cbfc3d49f67a33d1b96b02 | ORPH
    mips     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/7cfa67a8641294b9d26ec7dafeb60d3866aa8b9f |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/5e8ee085403a969f16e5087f2a286b6d64b6595f |     
   x86_64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1e6ac56d7e26c2822f5efaa8c8bfe8715fb3e638 |     
   arceb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/c33d340a145c2c45903dc6344038d533822de304 |     
    sh4a     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/78f57f15c1ed6045f2137fe266dd88077a50037d |     
    i686     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/75eadd95dc4fe9f49b1d68181087c69a9536ae78 |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/edd08d834cf703dc6438307426d81cb7d47fefb9 |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/53fc7919bb28009f8780d538c98cc744ab84f0a8 |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/a19f0ec7cb99c2c17f09af7f2832238fc8c4c217 |     
 microblaze  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/155b48cd50199792eabf974393a10bf1602e5e98 |     
    arm      |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b2947463393a5c03c2118930c8348824c6e303ec |     
  sparc64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/23bf65d29ed33f45fa97137e5ba13e3e3e618d26 |     
    mips     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/324528adc3b1de1aab8f728939718dea1f576d5c |     
   armeb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/9a29b998963a74767fb233f92135b692ea67de30 |     
    arc      |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/74bda2343bc6949928ceb2e87c986073dcd70040 |     
    or1k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b847ec80584db55c5b5d15d0005b403bad269ebc |     
   sh4eb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/067a80b85aaa7da93e7404e7fa77f42efb958780 |     
   armeb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/f55e7d2cf0f2a1b8173011143a167f516a5cdf2b |     
  powerpc    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/d014a49a447a08aa9e6dfb75106bd7684e108f23 |     
    arm      |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/d6f9deefe2ce87664556ff12fc90aee74298e411 |     
   armeb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/ad34e8ee7d674d826850d0b00d9f5045574649f7 |     
   sparc     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b7fef412f7f488d36cbd72b1d4dd94cc7425b5ce |     
   armeb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/087d1e29f04a1b204441504bf3b6680abd440d8d |     
  riscv64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/eac98ee163a75296278f922090f3c442947c77d9 |     
microblazeel |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/f427a7c2aae1f8754e7c27000b302738a8165e85 |     
powerpc64le  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1a3e456f2aa29a3ad02aec50ba8f43571c45980a |     
    or1k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/13d7aff32756d0bdb939c6ff8d88d5a10df9882d |     
    or1k     |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/7ce6da4a9f4b4deecb8b02b05603bc01bfec1b33 | ORPH
    or1k     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/216e9f58dce8a79cc94db70d40032fe7331d26fb | ORPH
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/02116141e393b7439c74a41ed88681224da2cdbf |     
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/2c4fcd69b232e65c40e63ed69890d207b01b04c3 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/b715086d5be36643cd36e873d53c3059a0eda446 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/f3aaf9e965a68cbb6862d13a395e085ad42ac1c6 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/33cdbeabd772f9ceb0cfcb079c7a6eca516fdb18 | ORPH
    arm      |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/fa7f386a425b2b6387dfeeea9cbd4323807fa7b9 | ORPH
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/115395000e460e3a02f5ca2806846aa019f06d02 |     
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/3870bb95c58b94b9f8343be15c82b6aa2121da15 |     
  aarch64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/91320c0ef5a6e4bff34a123a56621edb2a85bc7e |     
   arceb     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/01823fc6654c05744839f713d2ac2308934f7f8d |     
   mipsel    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/7d230749f44e0ba05f7585a55108244627b96dc5 |     
   arceb     |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/c56fc0595edc152812c3c8d8597874088b3fba25 |     
 aarch64_be  |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/8b98bfb103dbdd93007b30289920113fdd42f8a4 |     
   nios2     |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/353415cc6eab335dcfde1b231539fd28003e43c8 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/d8442706628636463b768f495413dd9e95112fdd | ORPH
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/22469fed5c9aade8df938f20fe07a0b8482e6990 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f773eb1fe4e8df7d9dfdd16935076b4a32749ade | ORPH
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6e8442e994548e612c045d8d41c2ff8b47c4357c | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/65c6b0e27f159b633af98a3ef81f6dc928e65ba2 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5862c4e549eb41e67238e54344bdbd9883e6be4a | ORPH
  powerpc    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/e554f7d023173f13c015672734bb978fe22f40ef | ORPH
  mips64el   |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/21ff77bd1121a758e6af781e5d25ce8d10b4f2ce | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/f3503d93e20fe3495ca0d186d1e624f18c723cc7 | ORPH
   armeb     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/da80d5309bd379dd478d95960d90aa3526944432 | ORPH
  powerpc    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/ddaf72a607a9755a63a31861feaa0bf8d885cb37 | ORPH
    arc      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/d7e7f675f5ae4c7d4c8acea5fcf45555d7468c10 | ORPH
    sh4a     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/d1401501ce8867bff879648665590fbba17e688d | ORPH
   arceb     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/1695fb1b210b63ef6065776e1f03a315c0f624ff | ORPH
    arm      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/28b50f0fb927ca51650d114eb1f4769d94e1439c | ORPH
  powerpc    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/115421090c6fb6f5816bc909d46ae9938e78c18b | ORPH
  powerpc    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/2dc2f11342ea5b72f9035a77ebd916e78b27ef99 | ORPH
  powerpc    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/cab83587132b281700863c31a930402db59193f6 | ORPH
    arc      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/c4f9cc1068daf432d4ac2b867e35bf8a447b2728 | ORPH
   mipsel    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/e73c9ccda7decd2068f12c36c2e86ecdbbb45087 | ORPH
    arc      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/dd49e8cd1d923cdbb9f2f5b86d452b822a6bcfab | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/94e5d5f7ffc89c7fa62dff62579c926f0e2b710c | ORPH
  aarch64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/91417c7064eeb1a2959405e479e48ee41256c3ac | ORPH
    arc      |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/0619aeb41a42a920472d3a93516851769e3b44ff | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/19bbeda6ca8bc5865735c33df3c5966ad4c1b96d | ORPH
  riscv64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b2d95c6d34667d68b46829d271e08cec534212e8 | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/a6bf1f7f882125dcf7cd9b3982cabdbe86072bc4 | ORPH
  riscv32    |          linuxptp-4.2          | NOK | https://autobuild.buildroot.org/results/9469425e05bdf038f4688cb0b3755acd309457c5 |     
  sparc64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/66710a932371c6431e33802d5da08368e6cc1308 | ORPH
    or1k     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/03b3b699d07f697b331ad261a70c3db12a429ac8 | ORPH
   mipsel    | ltrace-82c66409c7a93ca6ad2e... | NOK | https://autobuild.buildroot.org/results/47c285a005c21dba2783431aa6177c046b5d9a41 | ORPH
    sh4a     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/4f0c0d639479feebe7ce3516173a3eed3f827e80 |     
   arceb     |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/477c8124be43c039346b960a9e8ac37671820049 |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/41b0b80f6ce22b499fad24b4dab8f040306b2e35 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a0ed5395186a0a0bb14eb6c180aa23ba9b4b7ec8 |     
   mipsel    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/cd22c7f69039c8ee08f240954e1de8111a73cd4e |     
   armeb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/01462014822b9212a075ed69842320b50f734016 |     
   mips64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/77953407adeffeeb442e07fd0f01eed982d0139b |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/b47a1671a7cc3f08329cd3d4a595c518285e587c |     
powerpc64le  |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/5a678091d762abcdc7d72af41af9b922abb13cd5 | ORPH
   mips64    |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/266efa7e26fde505ca6fd953fee256bbd0e7ca1d | ORPH
   mips64    |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/95c839b42fcd29369d64dfb1787c739b83ffdebf | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/398b3d5b6f7bdff3d898a0a29fb0d46d694760e1 |     
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/28ca958e7b0b7347b2791059015913e1227e50a3 |     
    m68k     |           php-8.3.12           | NOK | https://autobuild.buildroot.org/results/d906e60b6035e051994e5bf1236944cfed58ca3c |     
   sparc     |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/12edf33ca772e0ca3556ed0a88619ae1b9eaccc5 |     
   nios2     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/0da241a1fcc229c184df99d705a510ec3714c782 | ORPH
    arm      |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/a39945ea18cb369a197da1d8e66ccfb50756072e | ORPH
  sparc64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/0849e54c2c37b9ac76dafc5013bde545c3af74c6 | ORPH
  mips64el   |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/208cb64a01a13c5db8858bf443b6d27ca61c7a5d |     
   arceb     |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/97d969448eb460d8f6979cabe89ab73704cf49df |     
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ca04bceb0fc176b9d87c580402330f082b57e80e | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3b8aa7a9e2347a58de8890c6befc297f194c277c | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/40a675818fb0b15680d73465d5cc90606d50640b | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/72bb20658b881a206b071b540e55168d54cee597 | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/87d86345c64ad36abaca0897b77d2cb76cfd601e | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/879ab24a831f49d8697aaa8d9ff50f778c909706 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3e9e264cdf83d200a4d6019a1cea176e295c515c | ORPH
    mips     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b6e1a76f7fa35c4162913d6ed63b12d6cd2e7c63 | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ce822982df3579e5ba79a867590b149361b91748 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/31dd5c8272dbca5164159835cab3022bb8f9fe78 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/fc9e208adbc7b7471dc9afab94969d1daff7545c | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/4b8064f07721843139121c57afd42746ab2f424f | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ff053d824db151aaf4a5153f687c2a9c38c047bc | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7f56db94bcc344aadd065ae533a4347cd426f8dd | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/756e8e2ae87c456341595e462e471c6167f90271 | ORPH
  riscv64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/47c459d84d6ac5f19065566f9a3c7bc718a514de | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ab2640d05adc7c5f355b19cbfd2fa528f8b77542 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c4a32de586a50948cd9250944c586075a601e263 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a401b606f2a6326d3c954f6fd8ae428fcca24061 | ORPH
   nios2     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/0d6a291825495dcd70ea80200945815e3a288c94 |     
 aarch64_be  |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/e9e7716889f630b727dfd64faa534aec4be1b362 |     
   armeb     |          quagga-1.2.4          | NOK | https://autobuild.buildroot.org/results/39dea35751a12a56f616609d0bfde55392110b59 | ORPH
   nios2     |          quagga-1.2.4          | NOK | https://autobuild.buildroot.org/results/5c7de6e0067ff63617c46bb0fa2049f02803c506 | ORPH
   s390x     |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/ec31d8a62a9f6cdabba11a2424929367bcb256bd | ORPH
   s390x     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/8c49788e33e49a0f941eb244f9d918fc3b68e41c | ORPH
   sparc     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/b52b1da0d7b2a315b00494657934da3c8e14bad7 | ORPH
    i686     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/2537fdffc217c07bf4f6af75d6146994bf32fa45 |     
 aarch64_be  |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/86b3b9c3fc5476dc8aa85ff236f6826baf902437 | ORPH
  mips64el   |          swipl-9.2.7           | NOK | https://autobuild.buildroot.org/results/2e119e88d9b248fe2f36de9801331adf92f4c63a |     
  riscv32    |         uclibc-1.0.50          | NOK | https://autobuild.buildroot.org/results/701fd1f201122ae47283fba13e4fb3ca1678abc0 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/9d01bbf7e5c8fa9c91b071e162e7ccb904e9dcd9 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2b9d78352d05c60804e03c81f2aef4c688a3761d |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/72e92cb3571d53c80067527173d81c2877edc0c4 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/3de5efff2684542cba07befd450883b50663f804 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/5bec5a395c50017ac5d5f99a4f210499413d26bb |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/c5d5ff684acfbea28f66cb0158fe0255354c9807 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/ecfcff67bdeb51652ec22e130f4ccd7718fdcdc4 |     
  sparc64    |      v4l2loopback-0.12.7       | NOK | https://autobuild.buildroot.org/results/fd8da0ce15e6b9de4953d148de8e9b4e31c31b24 |     
   nios2     |      v4l2loopback-0.12.7       | NOK | https://autobuild.buildroot.org/results/a7247f92bbf6aa3c65022aca431df8c3aa470643 |     
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/1b9c6e3ca92114435b1db3c2f80ed1c241bfc782 | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/025a713ebe7030a4ccb1bbc0dd042a13edd6e395 | ORPH
  riscv64    | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/ff2c7418754cf49cbeb8edd53984dc099abc5957 |     
    i686     | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/ea786a5cbe1ccaec7008ba53f31bf8a04290c596 |     
   nios2     |        xwayland-23.2.4         | NOK | https://autobuild.buildroot.org/results/ea4278a3db2b9f7eb6200725323b30bbd7c0d465 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

uclibc-ng-test-0f303c63fab7... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | uclibc-ng-test-0f303c63fab7... | NOK | https://autobuild.buildroot.org/results/c74493120cf40bdbf315b9960c276ffa4ef2d267 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  ffmpeg-6.1.2 | 2 
  gobject-introspection-1.76.1 | 2 
                host-go-1.22.5 | 1 
host-heimdal-f4faaeaba371ff... | 1 
         host-libxcrypt-4.4.36 | 1 
host-prelink-cross-a853a5d7... | 1 
               ipmitool-1_8_19 | 1 
                  ledmon-1.0.0 | 1 
                libressl-3.8.4 | 1 
           mediastreamer-4.4.8 | 1 
                    ncmpc-0.49 | 1 
                  nginx-1.26.1 | 1 
          perl-net-ssleay-1.94 | 1 
           python-numpy-1.25.0 | 1 
                   trinity-1.9 | 1 
                       unknown | 1 
               valgrind-3.22.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/29bd7a2977d9075ebab79a210ed98a720ed3f0b4 |     
microblazeel |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/d4a31e1fbdafb271fbc473ccabe3dea4f992e561 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/dc19bf1bca96d488fe7f34616f9c809c3f9e4e40 | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4be2b8cc936e683440dd89198a44119defb52668 | ORPH
   mips64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/b9fa52776b9597cd046e4435de90607bb7e997ea |     
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/af9559b9c2fc12080f449ac7c4a469e21d67bd81 | ORPH
    arc      |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/5ee82a27ed1901539e55cabed5320b748349235a |     
   s390x     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/a006ce3d5e4ccb13786eaf0029c7188c64d5af28 | ORPH
    or1k     |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/5d8dcf8e0e0dcd97b357626349d67f0993ea7c7b |     
microblazeel |          ledmon-1.0.0          | NOK | https://autobuild.buildroot.org/results/136d80a369bfa54500f1c8b8221be05f1c902f69 |     
   mips64    |         libressl-3.8.4         | NOK | https://autobuild.buildroot.org/results/1062638029a821b08e0ae82a8aa6aeb222954c9f | ORPH
  sparc64    |      mediastreamer-4.4.8       | NOK | https://autobuild.buildroot.org/results/09c36e3d6cfa3fef517729285c0ccd682fee0187 | ORPH
    mips     |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/9dde83d44d608a8468b0534efc8e50b1732be40d |     
   sparc     |          nginx-1.26.1          | NOK | https://autobuild.buildroot.org/results/31e6ec31901098b9bc533cfc768cceb8a721f496 | ORPH
    m68k     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/ac47fce6606cb8d3d82ea62839e03eb1f48cf8f2 |     
    i686     |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/1be53a8e9aad87d8952217d6de94a93f0f8c9990 |     
   x86_64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/dbd4f8fb4fa3fd2fb030501b0d35b0421acd6e33 | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/9c535ec379403e954846be4f18161cdb26cee085 |     
   mips64    |        valgrind-3.22.0         | NOK | https://autobuild.buildroot.org/results/eff2b0e013b950d46bfca9f51a3ea54d35e9b99a | ORPH
  mips64el   |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/ef07a4a63779228bc21480fed2424cd1b20e72e2 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                libcurl-8.10.1 | 2 
                  linux-6.10.9 | 2 
             berkeleydb-5.3.28 | 1 
                 coreutils-9.3 | 1 
                  curlpp-0.8.1 | 1 
                  iozone-3.506 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/0f0206c8dd91c0b0e1b4e523a8d138974a9b31cd | ORPH
   sparc     |         coreutils-9.3          | NOK | https://autobuild.buildroot.org/results/3a4d9d8993a4c16ed5815fbfdfa82cdcb037fd37 | ORPH
microblazeel |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/2c05789a304079388f622e282c47370167f44c30 |     
    or1k     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/44511662bde4743d63083d560c6d5988736e72dd |     
   arceb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/c1c60ff28480e615e38588d4afc6af7047cdb7ff |     
   armeb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/a29049ea7de660a80699d2ff4318b6f0b57a09f2 |     
   nios2     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/a7ccd11e162f2b664e33b5a471de2f48cb31d015 | ORPH
   sh4aeb    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/7a22a52cc915c33b8fe8c5d721ddf7e8adb309f9 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
