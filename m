Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A288ACF649D
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 11:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88B7B81004;
	Mon, 30 Sep 2024 11:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKhHzLJYv3NJ; Mon, 30 Sep 2024 11:05:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3BBC80E92
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3BBC80E92;
	Mon, 30 Sep 2024 11:05:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E97751BF954
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 03:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBBAE40270
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 03:19:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x6Ku9nd4d4ca for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 03:18:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE97F40105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE97F40105
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE97F40105
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 03:18:52 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d100e9ce0so384825966b.2
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 20:18:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727666331; x=1728271131;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Eu1SVZDy3oKYWJyiZU+142OvQWMHy7YAzWsFXM/TPc=;
 b=j3zmKr3/yZAgI4Ju8FozntVspibHysaplk10iINcw4DYqZoz2vhAXlnWYltP/HdM5g
 S4YdolxUDq5mwRdlSMN0dXZpfSoqqr+acY8XJaDaJHoujotX2WcCFl9RFLyyrK7e1GV1
 O8lDoeyUEy5M1bCxPBYceh5X27/En6O/ikGgwkYHQcysb7BKekHlw8/470sl39iyy9dq
 3qtbd+ZJcwAcAyyVboiTLjNcaQ69DQyQyAIvkB6qAhef/fNq5tULf3xbHQBseKx+uL66
 IDFrPAdiSttSJzYWpjFnnPkAGb1SJUdTZ276KCjyCPkvY7bbfe32XB/bTrHmp3h1Q95e
 KANg==
X-Gm-Message-State: AOJu0YweE0jvRtuypIc+n7w/Hgk6hvwg3N1XTDKio/D0A3tATjNEiEWp
 aNFpcsrA0CVehj8sBlWTZH5zrGpy8wbImun2nidnsv9I4/FzhNhDP23xdA==
X-Google-Smtp-Source: AGHT+IHXd2uRJ2zCKvwmZUUN94IPl1rKHv44Y4kkiWUGB28ly+4adw53IH4mqtxJMu00PNYbwutZmA==
X-Received: by 2002:a17:907:7f15:b0:a8d:2359:3163 with SMTP id
 a640c23a62f3a-a93c49655a5mr1108791366b.31.1727666328933; 
 Sun, 29 Sep 2024 20:18:48 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2777220sm462187566b.39.2024.09.29.20.18.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2024 20:18:48 -0700 (PDT)
Message-ID: <66fa1898.170a0220.3763bf.ff93@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Mon, 30 Sep 2024 03:18:48 -0000
X-Mailman-Approved-At: Mon, 30 Sep 2024 11:05:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727666331; x=1728271131; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2Eu1SVZDy3oKYWJyiZU+142OvQWMHy7YAzWsFXM/TPc=;
 b=ZepWapBJ/1SUdTa5IPJEVh5HJdfY/oijveATCGjIlKGlpIEnw1Yx4FGVEQbnjDFK5/
 +PNp0s4c/gqoWrz4jeKoAYf9c2Lh5bJha6lumEZpJJq5Mq8/C6/ewjTXpERQZXgOAn+a
 NUdAkMAeFxFQiQV5Umg/ud6/K2g3KCDesuVyTuStVACykjUXIDx1hgqryj5KdgrAMNfA
 okqLbEsShJkksgEUyM/S6mu/RItWFroqt9ZfBHdNT6Zyw3WZ5gNjj8+FcZPUP13FcgAN
 pQPbWLHcZj9pQHOit6pOQyURWS/DEbTMcrER444IRMlSazix5n78tl4qsWvCAjMTQPct
 VbsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZepWapBJ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-29
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

Autobuild statistics for 2024-09-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  2  |  0  |  6  |
  2024.05.x  | 21  | 26  |  1  | 48  |
  2024.08.x  |  3  |  4  |  0  |  7  |
    master   | 18  | 436 |  0  | 454 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 88
             bluez5_utils-5.77 | 44
                libcurl-8.10.1 | 31
                  linux-6.10.9 | 19
                      at-3.2.5 | 15
               procps-ng-4.0.4 | 14
         host-b43-fwcutter-019 | 11
           host-checksec-2.7.1 | 10
libbroadvoice-f65b0f50c8c76... | 9 
                  ntp-4.2.8p18 | 9 
                  bind-9.18.28 | 8 
                    bsdiff-4.3 | 8 
                  ffmpeg-6.1.2 | 7 
            host-binutils-2.42 | 7 
           host-doxygen-1.8.18 | 6 
                 apache-2.4.62 | 5 
 host-binutils-bare-metal-2.42 | 5 
              libopenssl-3.3.2 | 5 
                       unknown | 5 
android-tools-4.2.2+git2013... | 4 
             batman-adv-2024.2 | 4 
                elfutils-0.189 | 4 
                     file-5.45 | 4 
    host-python-greenlet-3.1.1 | 4 
              host-rust-1.80.1 | 4 
                  libsepol-3.6 | 4 
          linux-5.10.162-cip24 | 4 
               mariadb-10.11.6 | 4 
                  cairo-1.18.0 | 3 
                 coreutils-9.5 | 3 
                  evilwm-1.4.3 | 3 
            gettext-gnu-0.22.4 | 3 
         host-libxcrypt-4.4.36 | 3 
     linux-5.10.162-cip24-rt10 | 3 
               linux-pam-1.6.1 | 3 
                 openssh-9.8p1 | 3 
                  assimp-5.3.1 | 2 
           at-spi2-core-2.50.0 | 2 
                    azmq-1.0.3 | 2 
          cryptodev-linux-1.13 | 2 
glibc-2.40-18-g564178076272... | 2 
               graphene-1.10.8 | 2 
                  jack2-1.9.22 | 2 
libilbc-829b08c7902ceb87a26... | 2 
            linux-fusion-9.0.3 | 2 
                 pixman-0.42.2 | 2 
                  snmppp-3.5.1 | 2 
               alsa-lib-1.2.12 | 1 
aubio-152d6819b360c2e7b379e... | 1 
                  bcusdk-0.0.5 | 1 
                   bird-2.15.1 | 1 
                 c-icap-0.5.10 | 1 
          cloudflared-2024.6.1 | 1 
                   cvs-1.12.13 | 1 
      docker-cli-buildx-0.16.1 | 1 
                   duma-2.5.21 | 1 
               ebtables-2.0.11 | 1 
                   eza-0.18.22 | 1 
              fftw-quad-3.3.10 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
                  fwupd-1.9.20 | 1 
                 hddtemp-0.4.3 | 1 
                 hiawatha-11.2 | 1 
          host-binutils-2.43.1 | 1 
            host-ccache-4.10.2 | 1 
 host-softether-4.30-9700-beta | 1 
                      iwd-2.20 | 1 
             libapparmor-3.1.7 | 1 
                libesmtp-1.1.0 | 1 
libg7221-dbfc29d4806ecdace5... | 1 
                 libgee-0.20.6 | 1 
               libglib2-2.76.1 | 1 
                libglvnd-1.4.0 | 1 
        liblog4c-localtime-1.0 | 1 
libsilk-4268a02240c35c6055b... | 1 
                  libva-2.22.0 | 1 
        ltp-testsuite-20240524 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
mali-driver-d40c57d81c9cf4b... | 1 
                memtest86-6.20 | 1 
              mosquitto-2.0.18 | 1 
            netstat-nat-1.4.10 | 1 
               pcsc-lite-2.1.0 | 1 
         perftest-24.04.0-0.41 | 1 
               pulseaudio-17.0 | 1 
    python-cryptography-43.0.1 | 1 
                  quagga-1.2.4 | 1 
                 rtptools-1.22 | 1 
          sphinxbase-5prealpha | 1 
           v4l2loopback-0.12.7 | 1 
               valgrind-3.23.0 | 1 
            vorbis-tools-1.4.2 | 1 
wilc-driver-linux4microchip... | 1 
                 wolfssl-5.7.2 | 1 
               w_scan-20170107 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        alsa-lib-1.2.12         | NOK | https://autobuild.buildroot.org/results/306936f924091439c3e396c6eac0c6bc63635965 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/25a540a8b9abf6b2138cbcd8d66fbcd5d58cd245 |     
   mips64    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/220b5dd5630623376ecc9315e783d7050702654b |     
   sh4aeb    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/43bd0375b6e6ab3872e28911e8f2f0984413ef2f |     
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/8dbfddad64307073e0c1ee739c8e96b2a59b1a8a |     
 powerpc64   |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/65b8d76dbce7ada4f0e05903652ffa5b01566fc5 |     
powerpc64le  |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/9eff37cc2ed8933e9bd8c9632fde9e0d5d29dd5a |     
    or1k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/8b1478df7466f731ade7a73ad4948e7f317ed0be |     
 aarch64_be  |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/66c55d0eca737f48a55f5d5bd361e7f55652aa7d |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/9c6fa4fd508f1939370babfc500a4ff1476cd9b8 |     
    or1k     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/cd1e972300ae9cd75a5bd80a96b7be8ec768efde | ORPH
   nios2     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/55decb71c9203613aeff56237a531766e176f6b2 | ORPH
   sparc     |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/b5aac43ceffb41e5e154d555348009423a511ab5 |     
 powerpc64   |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/7de854999687835d42f25cc7a7129a4fb8ac837a |     
    arm      |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/62098e4702e7fffec750ba264ea7675bc76e76bd |     
   sh4eb     |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/40f1e62d159ddf22aa276ebbb1b86c3a9cddf287 |     
   mipsel    |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/f5b8a46aeadb3fb3f406e847d3d48dc4001e54b7 |     
    arc      |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/50f14ecd013fc740d97b85f376563c5834a179d9 |     
   mipsel    |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/d7332dffa07c75faa91a2bc64a886ec7590749aa |     
    arc      |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/e4fd14005f6900aa69bf128fac4a08600a2c9a87 |     
    mips     |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/d1ca34e5e16023edecb255ed54b0f6ea5b183c6f |     
   mips64    |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/5657ecbe7292378eab5b73a849339808ca3db01a |     
  powerpc    |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/d427c7f2157cb1c4b2469b072ba25f5456af733f |     
  riscv64    |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/1965f7ed3567d05b54a005222a106ea94daef13a |     
  aarch64    |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/ecec712e5b29ba15fadf9a81a95d447227af4fd5 |     
   sparc     |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/b6b04bded4f27276087ed372243991a85c4ea059 |     
   nios2     |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/7b20b4f11ccd619f21661433ca3d3d8178b28de0 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/dec538d6f8bb4b1edc90d7c4c1a1eb273b3bcb54 |     
   x86_64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/69f2b924251b66a3a1a90bc64d55b351985dde4a |     
   sh4eb     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/f79f51ae2c5a28460f88e0133ba5c7a8c110f5ad |     
 microblaze  |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/3a97d20dd8f04a193688d29a1c303516c5839f1c |     
    or1k     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/895724241b251f28ab4cea5924aabcc0ac5fa3a9 |     
    mips     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/0ead1c128554bb4f53f0de790283a26f0417dab6 |     
  mips64el   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/4458eb7e28635e30baf24a32e24bb488caac3d16 |     
  mips64el   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/5e5e9170063236ac16e48b219172de91c2dbfe13 |     
  mips64el   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/57da7fd23da0ad7550af32e2a2073b9a8816ee0e |     
    arc      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/d18ebb93a9f57e2c55137dd6e970280d6e381f02 |     
  mips64el   |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/6d0505de3d2748988c0dbd82bc51522c3af63c8e | ORPH
   mips64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/6eb1cb9bd27b0a63fd4c963f06dfecda320b802d | ORPH
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/1d039d6dea70a63495236790f9aacf76988231b1 | ORPH
   mipsel    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/c77accb1e55f2db454d472a60fc838dd847e97f9 | ORPH
powerpc64le  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/f852cb3089e4abf0c3c5fcdc1fa4964781c335f2 | ORPH
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/d6d907d50c9d5d2334590423b00beeba0966adb9 | ORPH
powerpc64le  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/211d5f07c37ff5e1d554d3a3d3592501a606e3b7 | ORPH
   nios2     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/2a5f0770fa79a198486c647ead9bc596dd48ab0c | ORPH
   sparc     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/1472ea4d9fa14012d60427af271a4c8e06153fb8 |     
    mips     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/fccfe67d3c60216ac4ac9da7ceb106774b1c1784 |     
    m68k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/2aff0e0e846ad25dc322217729287dcde4781aa7 |     
    m68k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/37e0c9ee2e31833794d7402e4eb062d54180a03f |     
   mips64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/a6dc6103d68c63b156cb5d6cc42c74db87208811 |     
 aarch64_be  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/98aa041f72473893e91e81d95d7dcb381cd4665a |     
powerpc64le  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/d8d1ae50fbcf713dd0c8711f29fb180f41bc09bf |     
    sh4      |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/2f9e4439ed8e00e9b2b7efba1ebad2b3af475f57 |     
   armeb     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/9eb858858119df8124f6f14d52fcf0cad3ae11b7 |     
   x86_64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/0286dc679b7dde7aa6539a6d62c9bc256044c84c |     
    i686     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/9a0f5a2f110a56a2848d729953cf6778da10a4fb |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/b75c484324b2750b446803f9fb9cf5e93efb4b85 |     
 microblaze  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/c3babedd09de4cf0b75a3bb03c4dc2b05a44b1ff |     
 aarch64_be  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/51023b9aa11c8eb962e54d98ce8073521a6a929e |     
    or1k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/5359d6f1997763464a87701966b5ab9f871bb5b1 |     
    i686     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/7ce52e04364287780d281967ad3f256427155be4 |     
    or1k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/864f4aa014918d4abeab6ab71a68d5186238d812 |     
   x86_64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/1f037ab1af163b59b3bce5d0e6691dc1aeb4a438 |     
  powerpc    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/d50424f7ffe1095f0745953f27687f7629892829 |     
 aarch64_be  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/d51951d7a7e4d052057b463dfdaf5d89dc7d4bc1 |     
    m68k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/41561fdc99b858018437223037c0ab2a72854d75 |     
   nios2     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/159bdfc66a1c0d9b93cc4ccc02d8f20e6cb5b791 |     
    mips     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/f0ea0eab9e41e94d3d383a5f6cd6c6d4a273b36d |     
microblazeel |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/954274dbf52b8c4486beab48e996edf89df60c60 |     
 microblaze  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/095069cc551831e0ff5fdcb248dc97e399de616f |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/c13b537f6a3c131c7d0b6e2f6dd7843d513f8e6a |     
 aarch64_be  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/12e3f243a09eeeaf2e7b0c17499a4d6efbb1233e |     
    i686     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/89f6ba2eaf67f7e67fb58eff57982a8089294010 |     
microblazeel |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/e67f5d4549d34f644a81935c1a0c7d0443910aba |     
 aarch64_be  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/23573b835d20a2d2856a51cb491b0a7e7d4bc992 |     
   arceb     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/2a9c585b81b8f48937e9bb25ab0dd3a592895ffd |     
powerpc64le  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/e86bb9e1b96b398e83c44416078b528239b53197 |     
   sh4aeb    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/efbb2a1931e27b20bdb826697d2695dbcce11a01 |     
   sh4aeb    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/8e8368da615d4af7a800450b5ab6488040b48ed8 |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/430ecca6e114ff70d2b3c70ad4d4fcee475f705b |     
   mips64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/c0f847725fbe0f6c5223b6f1fcbe03bc7e93a3a9 |     
    i686     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/28f9c1cad6628ec864a7e37ca4a995d86a250a93 |     
    arc      |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/7f9f43057bf366b3762f9c8b3c3eabe3b668a37b |     
    mips     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/757ff5bd0bc2df9d6fd8d179f87567a6f3b489b3 |     
 aarch64_be  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/29c7bef1a602d93fdd944a5061f4252fd620785f |     
    or1k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/37c2ecb307c0db28b5d5599536638ecdee7c7fe0 |     
  sparc64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/9137e2836821de44c65029c9835c1b0022bedb3c |     
    mips     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/caafaa3315d23b9e7ff78a5830b92bdc27c107b9 |     
 microblaze  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/5ee3e6abd8203dd86afc1d48e4e1e8efae978a97 |     
 powerpc64   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/ed11095a9156085eae3b426ae890bc3ad870e73a |     
    sh4a     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/252fa3192a70e396ea20715bc342212f3a6db394 | ORPH
   arceb     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/5a68cbe8989e7d971dc13cadb751085f68c58ea8 | ORPH
   mips64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/e595416b3355ff006b9e4d77d9248f218d4bea8a | ORPH
   mipsel    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/a0f22bedc6ca67ecaf4f732f773c5c4605d241bf | ORPH
    or1k     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/87671f844ec4ed21a65f7d97ffc3883157d7c90e | ORPH
   arceb     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/36d322772d61416d0ea54dd8bc0b1b6b13e68997 | ORPH
    arc      |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/82baa163cc8b312aa439dcb9078a671ceae9b093 | ORPH
    mips     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/57f97765ee9f21e6569d5cc4c9cde8e6ef0cab4d | ORPH
  sparc64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/0910294e90ebe85d793412988f20f431a3e2637d | ORPH
  aarch64    |          cairo-1.18.0          | NOK | https://autobuild.buildroot.org/results/c56c4bb8f30f566b2ec27a065d53ecf65d3a7dda |     
  mips64el   |          cairo-1.18.0          | NOK | https://autobuild.buildroot.org/results/b366b79a8c472153bae68ec3877556c4a801004a |     
   mipsel    |          cairo-1.18.0          | NOK | https://autobuild.buildroot.org/results/ee0d9f2dd484147c4c4ccdf7e326328534051b92 |     
  riscv64    |      cloudflared-2024.6.1      | NOK | https://autobuild.buildroot.org/results/325dbaf7ae273da06fbd89675aa26218069b2bb1 |     
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/1200a6772eb5d827a468a008e554a87897555e35 | ORPH
   mipsel    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/efa629ebc42a92b0d0d2c62fb11eca987df62a21 | ORPH
   xtensa    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/741a7aedf980d9a34751526986a0df5d0d4bde5b | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/38ed58b568ce6d236a34cb74594d5318e4c0d362 | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/e6499776b2db073e6f5d7766256bcf507b22758c | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b858841ff9e4ef3a5af655b9085f8b216f9c00a6 | ORPH
   s390x     |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/48884ce1f167917d2cb297e8971b418c24bf72c2 | ORPH
   mipsel    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/c2144dc9ef6ecbdcf2a44a1dc90a597415e7b8bc | ORPH
  mips64el   |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/d896dffe395d9be1084a54e57ffbffa6bd57dc09 |     
   mips64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/58f7286337d2741eaf37babb76626c7be0056f25 | ORPH
   x86_64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/2f01c4b8b0ffcf8afe472c354b6732e2a073310d | ORPH
  riscv64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/5c6e894c0740745ac979c23aed6c6576acceef81 | ORPH
   sh4aeb    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/31485c3422d1e71abdabcafb9db8d39b5679b2e2 | ORPH
    sh4a     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/64667171d8117e9273b5aed7dc1e437bd97bc005 |     
  sparc64    |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/6b3d5f6494df77004aed54f211e313aafc486424 |     
   mipsel    |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/0a8f31d5f0b4f845e5d1dd5abe8b84c7c7538fce |     
powerpc64le  |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/0a3ced794de3d20b1452d6f1014251a54d0f5040 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/57609eded0446d85b5e6d25a59a1d53e7d13a823 |     
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/eb7a0715aadbdcaf327d0cbfdf11d351e0d8a7e3 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/1c7e050fa0fae5fdb25d5c452c47eb119b85f682 |     
    arm      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/dd61d8f1d13b4cb02d2b2948b3aa692e3c3e0d36 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/958dbb3993f427e6921372243763f4529594413f |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/db95058c1def3b3f7734eca4c1e1fad3ad48282b |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/4942cee9e41ccbc9eb05e0d5b4a4e6792afa93b6 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/edf3011f2f6d986a4a2c2ea0407ccc29a6f08fc7 | ORPH
   armeb     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/613fceb5125d358eeae1e24f705b7d2499ce39c8 | ORPH
   armeb     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/5db95b759e899a8a41009ed8f79e6b6f198a87d9 | ORPH
    i686     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/fde6188d4d318908038cbbff558bd380df71c050 | ORPH
    arm      |           file-5.45            | NOK | https://autobuild.buildroot.org/results/1e41adf426cf89649de10535164c2e0e81f09e53 | ORPH
   s390x     | fs/romfs/romfs.mk:32: /home... | NOK | https://autobuild.buildroot.org/results/f971f7d1d20edc9b9babd223a54c50be577d366b |     
   s390x     |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/4be66408061f3cf003fca68b33d6b428dc84f011 |     
   arceb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/e42261bc523ccb37c906f486a2c64a835e6a8c73 | ORPH
    arc      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/d469f6888da5e15be3510aa1619a9644c0c790ac | ORPH
   arceb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/78bc406d26239284e7012f4ced491b7487995f53 | ORPH
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/df5179a8c3bb5ca76b58312c7ca2ee640afcf00f |     
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/cadcb6ae26b380a4372c67e83bc1c52b8a78d311 |     
   x86_64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/d93cea32b2ffd0aa1c28528cc3cf5b97c815bdc4 |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/f98ccc436ce4121e261e53cda0b06efa6ef92047 |     
   s390x     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/caaaed3aa5125b7a9adea5adff2c50eb397e2f11 |     
    or1k     |         hiawatha-11.2          | NOK | https://autobuild.buildroot.org/results/7bf138b0f5ee6a27535f1a8ec41445efef3c038b |     
   s390x     |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/a45ec2d3462da231f5483485f56758d19237fb5b |     
 aarch64_be  |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/981858f277c8fcbfe51bbff73d6d16c543953856 |     
   xtensa    |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/6e376a730660f52a46f1956a5edb77282d136db5 |     
   s390x     |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/32cfddb7456a155bec20e5361793dc12769270b5 |     
 powerpc64   |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/0cb682596a9c3b8218c73e0517705599b3031646 |     
   sparc     |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/e69112dce2345451c0bac00d2737c97d29deb7a2 |     
 aarch64_be  |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/11d08e1f4ce2f662789b9594d214df0a0a1d7109 |     
  mips64el   |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/ca58ef61443fa63e7002b82b195139dc2ee8676a |     
   s390x     |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/4aa73882b88f5c2a140d80736785d31701dd50b8 |     
   armeb     |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/eef59d057b856b54aca79ac6376f158a2ffda4f5 |     
   nios2     |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/b69240db2e48dce4a7f96790c239c7fe4c7c9a8e |     
  powerpc    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/e04f32b0de3432228b96016d8886aa8c5bb99ae6 |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/0c715837da1b97cd7e3c74cda2805d2863b18da9 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/cab0ea459a13a1216f9a05faf4ed68d4026f3a06 |     
  powerpc    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/1003aa395dce41fad1bc227af98994014eefa157 |     
    m68k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/380f5dcbae4269289603cc178228131afb48c6b3 |     
  aarch64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/404d42da56112ddef16ab4d60cb94e49402bb27f |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/47498c0e26ce197dcbabbbd8c9a1026f5de6758d |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ccf091f4a0d9f8b22fe5cac1818f1e2ebe9e9c64 |     
    mips     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/052a7562e1770b9b41c7672009b2482c6ad6751a |     
 microblaze  | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/8a7e8e77051a1becd9a2661ed617e4a6b6d45d61 |     
   mipsel    | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/a5cb65b1e715055a7cb94a4d1b3803cc879f6572 |     
   x86_64    | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/8583fca752d988c659f4515c7f7b56d69ceda6ec |     
  sparc64    | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/6d7cfd682cb3c36a0f1e8d14f197889d4a25f0a6 |     
    mips     |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/f8f9f02e22025710783fe13f0055992cc5a7621f | ORPH
    arc      |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/8eac36b84fb443204b6a07729dadc0ffec199fb5 | ORPH
 powerpc64   |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/e2c258b98914fdc97b289de2144df0ba37f195bb | ORPH
 powerpc64   |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/1c5ff8e8cb8a56733d3a3837be96b3152042c8ec | ORPH
  mips64el   |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/b640d0899f5c40bae9e42215f131d27bc97e0e39 | ORPH
   sparc     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/6d23564563c6f8dbb0cd68cff6c1933c39ae0a84 | ORPH
   armeb     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/c02f2b0f7cd03ebd0b3b65d898ef4f8bc04d5412 | ORPH
   armeb     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/b112748c36945ad63899626cba540095038e40fb | ORPH
   xtensa    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/f52ab8ba04bf4faf321ac9580f429bc69b7cd124 | ORPH
  riscv64    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/878fdf93f2e2cd2fa7c1e273146ba5a96bc2888f | ORPH
  powerpc    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/06274a01b4c46c55908495e94164dfedda500bb5 | ORPH
   s390x     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/2b7cc79e4cbcf7459885ca45385d81160d19f7f9 | ORPH
   mipsel    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/a819b99079c23aedf1e93dbe2c88b0beab967cf8 | ORPH
    m68k     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/e188f715e283f5ffe88839bf718b11686d1775a8 | ORPH
 aarch64_be  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/f4d0d3669cdaa8e4cdfc514d10e431876a45d993 | ORPH
   xtensa    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/3414635705c47888fea93aec80484697037a4c56 | ORPH
   sparc     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/73e021df46dbf4f8d7b824aa6ca7da51a264a184 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3aafeafe69bd74432e4b6bfc55ca6a1580cca9cc | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d51b792e48412314c0afdfac87076cedc12ee169 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bc9f0e65faf678d2619d49a039a35923a267e5f1 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1174445495c876639ffe14a91a0b9ccd5d8e2cc0 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bececf0c133fd2f890466c8da4e8a6b28d2c07e9 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4e167c5b34692f4dc246c31a8a132d29c9c89047 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9710c2ffcf8755fa0026d0715636f9b513cfe459 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8859330ae0e4149eab76352cec8de5c938cd3a78 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/512e11cf4d528daa029d27b7b90b640585ad9528 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d12e51fe021bf8c799e5fb483b205e4542648fca | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/79f0c9d3029067ea7d81f8f6815e6d5bdbc78383 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/89d8f34de74992a247e95d27768bc11ac6ba5749 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f7fdae09af9d31a84485cb8fe927a59dba01c207 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b2f0d5088e9d1ffb7dad86df00486f94a19bc690 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a25086000443f8125100cca02b399347c4c705cf | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/42c06abd55caca478f0eaba49d692bcd1e80f03e | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6583303a3829782922d56272dbd9680235249621 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6c04c3e9609881ec0a6116e1d18b7615a318b1b2 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9319f7630f28d9f1fb90d83fc5e5724639954313 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/36f0aa677f4f3046854bfdfa217749ed0928b4c1 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/abe620e1bca21bad626aefc2b6fff5d3c13b9e7c | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e5792394a17612c7dae41d1bf73d10963d3b0942 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0ce0e2b13a3a0aa847382c9c5421d85e8c85b1d2 | ORPH
  riscv32    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9d77f8fecd103ba8bd0c49cf242867104824c5b2 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a97935be6045c452301eee18da13a42ea8082688 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/67015497aed4da21dbd604fef02f346d6dc30460 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a52f104bfa254ce998128f02fff90595b89b0802 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8b477791c2e0709741229a7d6fb959842f883cd8 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/282731f1b8f35bdf70fcd258c06b3861aed54b94 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/039b185ec0916f7055284ce6678b0e65b9996907 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/22279c6df77a5adc3cee54404989da2129ed6a9e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/64cc00b76ead0d3cef7c4b8342db63ad2717caa0 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d54cad43555bcf8fdd08c40c0944f5eb5928cb93 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e2638436973f95f94a32bc81c700e9969c06eef8 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4fc7d60ab888c63e02616ca7f40308e49ec121a6 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/674258c15b63b516c209964ad85d739e68f7f479 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/aec31b46cb606b9bb035a58397e27f838a5501d5 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7fe82451b1f612a672c77c73044d51fa067b07a5 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/864d6889b7398818a1cb2a9618c5672005bd111a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1201373138a2622d916c0077e854d22530eb3e61 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b13e041b8b8fd8b6ab4b18a62889d43c2d1aec7c | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/df9ace215e4c01f1f4e9c011ecc96e31eca83d7e | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3008a5fa5b020dc12c627e19f6b4effbe107e35f | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b01be4cab1b5270757091723271c5cf4f32827d1 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9fdae98ce895fc419142da6222c4b9a9a0ca6517 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f84f3ffcb3f24af42a7f0cc2fb021e04e38c0ec1 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/63f3194b8fd8c9506ff1867b672460eb8a28e846 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/55851cf3af06e8c68d200159f4c7e91f9fc5fe60 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/606f53db989f0997f6296d529aadd8c68fe35f82 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/179e18729614ef4e04135124233f0c76312e2996 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5613011d6d3ad492f05086db89d69d16002d23dd | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9bb2f9555884aeabf3086f50c19b7fa6ff3ab04f | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d201494711028b00d25f33e957835eaecc89f397 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1d39183af68f84539e4b3ca8b20dfb1285aec444 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/477dfe0c39069d73a0bf87c8331e05a1d5902aae | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/638c67a0a53e3c447eacdca13390a356f5da51b4 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/811ad5e62115a12ce3625f762e4315804c52b927 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a57c2ea5ca61948a45d1bf03de9c79fb3170e087 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a60e70a7ed76782dc7ecf1ea632970a49c865082 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ba85ae41146ebaab028bc92968948da44ea03699 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ac550fe4d70c6d282b05e93db5711f84124bd2d6 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cb02dba65fc48968655fef79354c54f82f264f52 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/18152978e8b2887c447e10afba2c0296f2abe1c0 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a54b427f55a921837168aa81e71828f0ac261a43 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6a35912faba6844ed8a0c119053d8be13e3c8a10 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/aff029c5381f3735df9c5844f2b6f90561679ff3 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/86d0623bb052b870719a3338e72967e1a84f8078 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5321ce31a5e1e6cf810588f98421d0193f2aba96 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6d1e6676f0906277dff33702a19a6f782a197f34 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/31c2aa9478f5c813abee542864aa8fdb3424afac | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c26a554eb2ab2384ac0f83646d1f3761904eb94a | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0b13d13e50b1ac84f5678c0cd8d7540a47b0b135 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/552542788c50c11886f926d555a988261d6e0b39 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a94dfff11113cba19ca96c28fee5dde5321f32b7 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3eee46dbba13ef400fd56ecc0033a39f9702f5a4 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a8088021a36db07943bcf8d994a67d40adce1fbd | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/80c49058bcbc06eeb67b75fa8d344855a534ce62 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/78bee23378972ffd5011d59581e4cd7910ebbb3f | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b5312c622915be0c4b929706a971229ffff5ca68 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9957b1222156f8980cab65567afa6457eb04b203 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8e1ec27c937eb25d22ae22c972645c4e98ec3332 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e5cd9f867f68bf88f20810fd7eb1230ded82376d | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3a092619f528c74d4dbd605c46e94b7d61be3c5b | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8f903cdf5ff719719b61eb5f61a2c4c1d2fa9799 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2d79c33b47338b896fec39455d94415d1ef77716 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7864a84886185b49172a499a16c196cb86c7dae5 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b8370b8ea7ecc1cb3bd022058d20e27b974a82a7 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2eb3ce357b9825389b5ffc5038e8420306a99c66 | ORPH
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/156d0ffe6a14cd61e29cbb27ddfcf3640a5f7a41 |     
    arc      |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/86a0aba993c857fe575002463edd0d18f15b6bf4 |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/e5cbb7471d28f832b02672220694d3cadd596ee5 |     
   xtensa    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/49a927fa8387031403dfbe0dc120434296c808e9 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/2595b47a54bb3de88e0ca48b3529a3c1946bddcf |     
 aarch64_be  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/9553a09fa96914ed8fc01f605da16dadaf35c826 |     
 microblaze  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/57c7686fd9ae86018fb2335641e032775aa90207 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/badcd55571fdbd539cbbd3b8ed4028ce2ec4a986 |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/b5461d8e8a390478b7033f87c85f642525ac5e1d |     
   s390x     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/a68e14338691fffe532faeeb135bc44f46e0265a |     
   x86_64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/c17c1114112d280f3b401818f6c603d52ae764c3 |     
   armeb     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/ed624048d2c8b2c3531656fd77d666c3052f0d96 | ORPH
   mipsel    |            iwd-2.20            | NOK | https://autobuild.buildroot.org/results/c1ae77e6bbe41afa12d6820d3308e747711b10fc | ORPH
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/0ba80a4f4847086ea908bc3bef9d980d057baa8a |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/73adbc443635309cc3027af9f9fe27d5246b86c3 |     
   x86_64    |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/3ed7c2faabfc775138c774082f6160040af76a93 |     
   mipsel    | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/86e310f428599cf4563d999638ca7915e21283d4 |     
    mips     | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/2fab19fc4fc1c6dbe521a361266d84fe3a63222d |     
 powerpc64   | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/3d8fe6e20153f1ce2896d08176b6e9aca03b2943 |     
 microblaze  | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/54a81059fbb9accbbbb1cee1d564b2aafe6e5fef |     
   sparc     | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/25b02259f108b48855d1c265af1180756d2ca47d |     
   sparc     | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/bf2499dfd41e9ce8c37c358a63ad28ae5fbba903 |     
   armeb     | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/f67c5d5e04823013acc33fc090863d0e4f536ee9 |     
   armeb     | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/7d0ee96a7714fe89cab31f853f968ff55ad19367 |     
   armeb     | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/48df7b9676ba5f5b998b6a123fca49609d9cd287 |     
   armeb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/a9d03e1204b289084bd75b5ee47f97a165f715b5 |     
    or1k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/61888a53272e0de5979dbabfd1f388b73650c2df |     
  sparc64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/4354de23fdff919bd143f6506b3249c4e042eebe |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/0c3488d3d7ac45063ea90b7ef31ebbc6f0419681 |     
    arc      |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/30c74fc4d9de1a7f093eb26b0ec6fc578e5fb8f8 |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/881e69d46104a363dff81a47c0d553669e3bb97c |     
   armeb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/157c229b5847e77393d5259fa90411e820ccaaa3 |     
   x86_64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/474f7ad3da0107bb71aea2acebc87c8930ebad4a |     
powerpc64le  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/ab1371e6e4eb92dcdf08881547f0149fa6efda56 |     
  sparc64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/deb43e92dd9f3a7e37d7647d2f86126999860603 |     
   mipsel    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/c6eef0e72fcb48336b1391d7e120719656379dec |     
powerpc64le  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/972c6873e43da6511d3d420cc18092f2fecb606d |     
  sparc64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1da20bbe58da469b5de1dc98fd5c534394686d9a |     
   sparc     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/5c580f2080e6de1513b44be2ea23015588e4d6d6 |     
  powerpc    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/a317025e849c6950a8f2fa7e6975e575604d8ea0 |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/91205d1b65bb6aa2959d6a262d6ad7ea98f799b3 |     
  mips64el   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/8609ce78d9774b8e1df3fcded1a199f26cb512ec |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/90435d64d263b5b642dfefec98a04f7333140237 |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/922f587ad2251508a95201c72e1910b23d906b0b |     
   arceb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/292a8459d72f0f6a6fbe9c7134b90d3c040092d5 |     
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/410610c6b450b025dedfbf9350603e455289145e |     
    sh4a     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/728ad664eff239119ec4c4c3904c8bbf30a08319 |     
    sh4a     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/360fdd72d52649e766cf52d9763398a4bbeb7700 |     
  mips64el   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/d721b9e12bd51f1392c8ed7918830e9a4e4f3192 |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/e8c39d83fd92919820cc90d4d686cc3cad939c3d |     
   x86_64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/a14f86f14669e419f67934248abadab09afb88cd |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1ce50839542a1b22589a14b671831447a49c8a08 |     
 aarch64_be  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/ef71f2d71e37c8b6902849d2f7cdaa4db26eb386 |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/9ac47b00b8f089d86ca038bce91480a2d719da37 |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/26749f7a8b84fb26f6de4c55351d6eaf7848f965 |     
   sparc     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/0cece0399db09ded4fa2400d47f08785f8a19ff4 |     
   sparc     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/056cd5a87e0a710dda7bf2703d95deb32bb506d5 | ORPH
  powerpc    | libg7221-dbfc29d4806ecdace5... | NOK | https://autobuild.buildroot.org/results/2d91a89b7a74fb5c5a9ffc5129db4e21bea61d20 |     
   x86_64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/646ed5a1dc232fedb6e3c1a0f1bcf05e03b108ac |     
microblazeel |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/91b11f136e6fc08ff6e19da48d641d877325ef88 |     
   mipsel    |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/fe7ac142ac811c8aecf4f7dd8815638786ff68f3 | ORPH
 powerpc64   | libilbc-829b08c7902ceb87a26... | NOK | https://autobuild.buildroot.org/results/37a051787d2da92baee26d644a5b259ee7630ea0 |     
    or1k     | libilbc-829b08c7902ceb87a26... | NOK | https://autobuild.buildroot.org/results/f7a18d2f627538815ab67da6568dcf27914e8e8c |     
  sparc64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/080096f5d87300efd0f872e927c346d2a61b5346 |     
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/a79a312e52c4870692c1eac85b3b5289bcd5148d | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/b4e564e9145a9547d4009973c4033703f08994a2 | ORPH
   arceb     |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/c7929e44a7d832a919ac277cfc85dd58a1435826 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/508f304932e0235b04589ec3b8d776f38733b7ef | ORPH
powerpc64le  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/d7d1e4149d210102d0bab90faea59fd13a759d08 | ORPH
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/75b78574ee4c569385fe0144ca41895a408df753 |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/0c3da28de9fd38ceb8257eaf34a87f5ec38de1f4 |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/3eca38ac4d21efe2cc05c58977a614ba61247192 |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/5fb80a1ef375774c5c1f3077c0c32f0c89f0c8f4 |     
 powerpc64   | libsilk-4268a02240c35c6055b... | NOK | https://autobuild.buildroot.org/results/605b404b72cfe00d47b2e4d235812d09d4e7851e |     
   mipsel    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/234913ad16b5b628ccfa51bcbe1183c006ccb330 |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a667a7ca7e6898885b4dd2d7dfc48a08bd3ee121 | ORPH
   xtensa    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/658d966e38515c7226221c95864ffddce0a35fb5 | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e78f8ec5d59235b194072f77c8e69b1cfb0a8dc8 | ORPH
    arm      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/fd1f896ea07adc160c09c826af9bde63fa05bbc8 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/d58b377a782ef2bdde7b7980c800efb57749bb5e | ORPH
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/4bee35165de0b514a23d1ec3912c2f29960f4098 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/4b9aa95297d3f030297fc3027d05adbcb9c78c36 | ORPH
   nios2     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/545be4200a8216adbc911c3a184d292707d9aa31 | ORPH
  mips64el   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/aaf41ed08ad76214c11f09507705599a3ea410ea | ORPH
    i686     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/ce2b35fbafeca9a0e2cb225c3ba4838278e3b7be | ORPH
   nios2     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/93861f936aca919010736a01bcd57d6eb3255dde | ORPH
   armeb     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/069e8beb212b24811f2c47bc1ce63a53a9372950 | ORPH
  riscv64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/d14cabe5df1129f50f34414e2cacab29f5417dbc | ORPH
   nios2     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/97b3a0854f8c0c21196ea888869669210b51e2ad | ORPH
   sparc     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/97e2b4b84cb1d33854edd6a81766aa61452a6ca2 | ORPH
   x86_64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/60fd6f796ee7e6b9ef5445204afbd81589b7d230 | ORPH
  mips64el   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/fdfeea3e1128c33637155b58c8d3436f50c92276 | ORPH
    arc      |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/1678b99f6fbdc7b21f412222009f5075c7abd4b6 | ORPH
   arceb     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/ce4eb93767a3203c1f7f7114d13877bacad5ec8f | ORPH
    sh4a     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/3b1bb14cfcfec295de317a224b00586bba81c636 | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/8c07797de6f788158ac504b80839b693bd318aba | ORPH
   mips64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/33fe002bcd8d9300bc5d757bb56ad3d57fbb6082 | ORPH
   nios2     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/71f75216ec74b55ab210d3ce365bc9f9ba0ee651 | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/a3ac17e35f1f59ea3812436f25dbcdd2dbdba7e6 | ORPH
    m68k     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/8255b4368d58b726a5e8987078c9769680131460 | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/f5239fd1e9ec6173f87930072f54f2969c32a66e | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/8ece89c0e6fb1188b02acfdcf0d7d99adfce9387 | ORPH
 aarch64_be  |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/78813ea504bb275395e61f762359f13306119773 | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/5e4cdfbc4244df3cb687230394fc0b6c8a48a828 | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/5863573b80b2b4d399171581fd782f0036becccb | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/dc51ffc4344280a872e559efc0a5aedc55e99818 | ORPH
   x86_64    |     ltp-testsuite-20240524     | NOK | https://autobuild.buildroot.org/results/131ca6dc6313b5b2a4fa447db31203b3003b1744 |     
    mips     | ltrace-82c66409c7a93ca6ad2e... | NOK | https://autobuild.buildroot.org/results/2ebd17974c4635995b1c0b9068aa8b17557ff143 | ORPH
    arm      | mali-driver-d40c57d81c9cf4b... | NOK | https://autobuild.buildroot.org/results/30da870c8c93c4b09091bfac48d623b3385a3daa |     
microblazeel |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/28ffa4727415f49cfb44dfd7e17a903d9ef26bde | ORPH
   arceb     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/df91f04feb67e0d30e0a49749f43b64dd10a9f16 | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/729aa3aa88eb32615707ab8ea9d16e327a93c8ed | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/3792f8512af6808b0b701313f3b70189e8d15959 | ORPH
    i586     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/3d52c9b9f11c9637d832efb8bd5c104864bc9cd9 |     
    or1k     |        mosquitto-2.0.18        | NOK | https://autobuild.buildroot.org/results/c4ee0456efac8edab06daa1f0b207df7e7ba75a0 |     
  powerpc    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/b519d8e128af5ef841cf3e2db8c2ba8b9098d608 | ORPH
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/22526cff4568acdfb552f74f12fbb6e3559cc943 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c9d8350088894ca7a0630545045b096013a52db7 |     
    mips     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/dd28dde69eeecad17a1d609b50e245be42278fb0 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/25c9d93619849d2febc9d25f409f654c58d43735 |     
   sh4eb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/fd160ea938b013f789b470d5f4ee0c95e2fa56d7 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/2a6f1c9140f8190778429b8e57d3f6af6d2a390b |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9a48e4b27ce59159dab2b9bddf634710f639dbd9 |     
  powerpc    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5d0cd136ba496ff418296820be67796e9c57f8f2 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/aca08b1ed3a9d911972e0ba98ab1ad3d72262c05 |     
   mips64    |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/796af9913bd7eb91f9add505b78ec48a498334fd | ORPH
  mips64el   |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/6841656859b8eead00c5162c260ee0b69ec4bef4 | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/d79cb3d544490e473006af7db7957655355ba82d | ORPH
microblazeel |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/550ec8f0178668b2c3d04debd24ecba6bfbb4d23 | ORPH
  sparc64    |     perftest-24.04.0-0.41      | NOK | https://autobuild.buildroot.org/results/415bb4463d427c752f9dc0bb94686e11ff7c1f98 |     
   x86_64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/791c3581fb78aa3d1e277f1f2c08c91b821dfbba | ORPH
   armeb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/8262eec2b249ba1d50626deea1b77b207875f271 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f0ad2453e21bc9fbcdfa4540b90125cf89d7a42a | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/44363e8659a5c39778ae421bec146ec5087e91e7 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/86f84f787300c020f1c3734ba80ed18b8cc4ba2c | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7602ca8830d811f0a9404de051603905be4a1581 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/add7eb1f799d652274d53ecebea07d091ba46461 | ORPH
  aarch64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/303d517b1a761c8507cc607e71e97078f7cf5810 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a0c238a31bb00f72857f45a6c02c03c7ac2f0032 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ed2f741794a4e3d2d4dda73b7fdd97298bff0290 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/acc87080396f82817f5c63b5cefd453e45486dc0 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/fccfd69aa465271c5402e4dcc7df68363c509271 | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/286b3d15f8f732db946cea491e1b3fc2ba3c76d2 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/82702c3aaa767700d5dae736ce12776b3ec73f4a | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a1d6b63f2685d52ab6ad46c52b65590f8b9b0351 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/cbdde16d828f67cbf28f4c0a93ff70de9ef7854a | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b57799e01e875f105a38f2486b1547109a9da6fb | ORPH
  aarch64    |   python-cryptography-43.0.1   | NOK | https://autobuild.buildroot.org/results/39331c4083efb4e6c27413ac7933e963917bc126 |     
microblazeel |          quagga-1.2.4          | NOK | https://autobuild.buildroot.org/results/1c85097760eae287f436be6d483340b617d216ed | ORPH
    mips     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/44fc485239cb8159b903dbf8538546fbe74fe301 | ORPH
 microblaze  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/71432f282be6b5bfca8b9171ee72993bef9de9e3 |     
 microblaze  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/43c9934ba81e32869489de378300bcad6af83ff0 |     
  sparc64    |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/536f21beaee53b8164f66ebb719ef6916a0e1367 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/31e7098267522e0b1d4f98d007aabd17d3d56c5f |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/5a6163e6be49de2972d6cb78021666531f82d0a8 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/1d7eb23c723a81c2872c9d972b7076fb77ab765b |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/bddda93f6de734610680487e5f46815372509a2d |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/ba8869bdf9d68998fcde241afa822018fdefa324 |     
   sh4eb     |      v4l2loopback-0.12.7       | NOK | https://autobuild.buildroot.org/results/93cf496f7c22e01ac72bb218f5e8ee5ac0ace150 |     
   mipsel    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/4419421973db824879c2b96a1a7b8071ab8f8e3e | ORPH
microblazeel |       vorbis-tools-1.4.2       | NOK | https://autobuild.buildroot.org/results/f1f587a802166256db3f70f09bb1f4d19ae8afcd | ORPH
  riscv64    | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/f430b0171fd33dffd04805d23a23764a8cc642ee |     
    mips     |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/e08a7973e1ffa7df66ee79fd66200972a106242d |     
    arc      |        w_scan-20170107         | NOK | https://autobuild.buildroot.org/results/b5d1fff408baa4beca0a5e32d970ac462fa67758 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 1 
                   libnss-3.97 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/186c25815715e433c631182904206ee0c735b7e4 |     
microblazeel |          libnss-3.97           | NOK | https://autobuild.buildroot.org/results/ee66bb3f6d2f3189127d8080ff6675972b321af3 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                   bzip2-1.0.8 | 2 
                       unknown | 2 
              cache-calibrator | 1 
                 dc3dd-7.2.641 | 1 
                  dhcpdump-1.8 | 1 
                      fbv-1.0b | 1 
               freeipmi-1.6.14 | 1 
                     frr-8.5.4 | 1 
            gdk-pixbuf-2.42.10 | 1 
                gnu-efi-3.0.18 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
                host-go-1.22.5 | 1 
host-go-bootstrap-stage3-1.... | 1 
         host-libxcrypt-4.4.36 | 1 
              host-rust-1.74.1 | 1 
                   libcap-2.69 | 1 
                  libffi-3.4.6 | 1 
                libressl-3.8.4 | 1 
                  linux-6.8.12 | 1 
               procps-ng-4.0.4 | 1 
           python-numpy-1.25.0 | 1 
         python-remi-2022.7.27 | 1 
              skalibs-2.12.0.1 | 1 
               valgrind-3.22.0 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          bzip2-1.0.8           | NOK | https://autobuild.buildroot.org/results/3aa4c00e5e4a0d6c540402c574ab6a79525523b8 | ORPH
  riscv32    |          bzip2-1.0.8           | NOK | https://autobuild.buildroot.org/results/ee5253a917fec092c05b4a41996dc3f408e7821e | ORPH
 aarch64_be  |        cache-calibrator        | NOK | https://autobuild.buildroot.org/results/d5a5d35cebd9057ee3534ce85cd837957e8f93d9 |     
    arm      |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/63efa9ad8ff1dd5a3ec0b62d0de1d9ac897f7717 | ORPH
  powerpc    |          dhcpdump-1.8          | NOK | https://autobuild.buildroot.org/results/1e8635d10f550e67f4e3d56bc0a4d0b837bdc932 | ORPH
   mipsel    |            fbv-1.0b            | NOK | https://autobuild.buildroot.org/results/a66d7f41b9a9a27aa304786d1ec2e1c929736629 |     
    sh4      |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/50c4d5d9eceb0bb22c1f25d763e08ce7c40fdd67 |     
    arc      |           frr-8.5.4            | NOK | https://autobuild.buildroot.org/results/726383a396010732f5c6e9500c79b6199a14ebbf |     
   sparc     |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/7d557b08c8c728cb33f49a63e5f7592c6f8bb94b | ORPH
   armeb     |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/a93e15e75354ea972edd58f4f86d43aff65b7bf3 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/8e8a2f9454489fba03d75f68f2f16fee1e9efa4c |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/d98090a3ef2097ac451d949986e7d9c066c367e7 | ORPH
   mips64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/7f843496e930c6769b909037956d111262cf0e5a |     
   armeb     | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/5fa87d12004d97ac2168c8d474374e00ef7a6033 |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/899c72cdeb50438c2fa236f6a46e50ae5889e624 |     
   x86_64    |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/3eb63b14e934b596b6c417bec1ca98f6636671be |     
microblazeel |          libcap-2.69           | NOK | https://autobuild.buildroot.org/results/3bc491737071f4d8b529efcf234ecf7b61028e60 |     
    arc      |          libffi-3.4.6          | NOK | https://autobuild.buildroot.org/results/086fea452998236efb8fcacb56361f69969466e0 |     
  mips64el   |         libressl-3.8.4         | NOK | https://autobuild.buildroot.org/results/65ff044ba1282ffbf76af88cfbc54624727ae374 | ORPH
    sh4      |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/6b06a2a6e687ffc3e0f237beec90147c52cfbbaf | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/5c6bdbfc0e21c83696494d4dd2efebaabf921de1 | ORPH
    sh4      |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/bb44ed5e7f4fb2d0e428f733952c69a17bf59972 |     
   nios2     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/d949d7a70aca6565b0e554eb7e0f7fc3977d4875 |     
 powerpc64   |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/e5f19877ed9701d6a334324ed70a8a527713d417 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/736b682b5c17128d0db95afe23431f754577c2ba |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/bd30a41d5ee79df9b788b8da69d409eb77454805 |     
    mips     |        valgrind-3.22.0         | NOK | https://autobuild.buildroot.org/results/47f7e71f4e0bcf24f1fb7b31b6542fcf23876a67 | ORPH


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                  ffmpeg-6.1.2 | 1 
                  fwupd-1.9.20 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                    mpv-0.35.1 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/8732330f2616dd3831e2cac3eb762b35458a2b59 |     
 microblaze  |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/e9ee4e8292fbbb490b7ea32227e4e4e77c63977f |     
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f90c6a8305cb92028c4f6afb6064e2c4dfa5b93b | ORPH
   armeb     |           mpv-0.35.1           | NOK | https://autobuild.buildroot.org/results/a40c385b3282c6bce40a2fff527ef3bf80b756df |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org         |   version    |   upstream   | orph?
-------------------------------+----------+-----------------------------------------------+--------------+--------------+-------
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.1        | ORPH
                        acpica |  DISTRO  | https://release-monitoring.org/project/000018 | 20240321     | 20240322     |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/015661 | 1.1.10       | 1.1.11       |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/013117 | 3.37.2       | 47.0         |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2024.2       | ORPH
                 android-tools |  GUESS   | https://release-monitoring.org/project/013989 | 4.2.2+git... | 15.0.0_r1    |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/021321 | 1.8.2        | 1.8.3        |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/006170 | 10.0         | 12.0         |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 3.1.7        | 4.0.2        |     
                           apr |  DISTRO  | https://release-monitoring.org/project/000095 | 1.7.2        | 1.7.5        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/007006 | 9.900.2      | 14.0.2       |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/006988 | 5.3.1        | 5.4.3        | ORPH
                      asterisk |  DISTRO  | https://release-monitoring.org/project/009838 | 20.9.3       | 21.4.3       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/007841 | 2.50.0       | 2.54.0       |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/007962 | 2.36.2       | 2.36.3       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/015225 | 3.1.2        | 4.0.2        |     
                      automake |  DISTRO  | https://release-monitoring.org/project/000144 | 1.16.5       | 1.17         | ORPH
                       avocado |  DISTRO  | https://release-monitoring.org/project/013385 | 98.0         | 107.0        | ORPH
                       avrdude |  DISTRO  | https://release-monitoring.org/project/010751 | 7.2          | 8.0          |     
                        avro-c |  DISTRO  | https://release-monitoring.org/project/059411 | 1.11.3       | 1.12.0       |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/000154 | 1.13         | 1.13.1       |     
                   babeltrace2 |  DISTRO  | https://release-monitoring.org/project/007137 | 2.0.4        | 2.0.6        |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.44     |     
                          bash |  DISTRO  | https://release-monitoring.org/project/000166 | 5.2.21       | 5.2.37       | ORPH
               bash-completion |  DISTRO  | https://release-monitoring.org/project/005667 | 2.11         | 2.14.0       | ORPH
                  bcache-tools |  DISTRO  | https://release-monitoring.org/project/021397 | 1.0.8        | 1.1          | ORPH
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/021323 | 1.73         | 1.75         | ORPH
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/014746 | 4.4.8        | 5.3.86       | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/014378 | 4.4.8        | 5.3.86       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/080042 | 4.4.8        | 5.3.86       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.10      | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/014923 | 9.18.28      | 9.20.2       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/007981 | 2.42         | 2.43.1       |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/013618 | 26.2         | 27.1         |     
                        blake3 |  DISTRO  | https://release-monitoring.org/project/369414 | 1.5.1        | 1.5.4        |     
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/010029 | 5.77         | 5.78         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/010029 | 5.77         | 5.78         |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/000211 | 7.20.2       | 8.0.2        |     
                         boost |  DISTRO  | https://release-monitoring.org/project/006845 | 1.83.0       | 1.86.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/021578 | 4.3.1        | 5.3.3        |     
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.1.0       | 7.4.0        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.19.1       | 0.21.2       |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/000227 | 6.10         | 6.11         | ORPH
                       busybox |  DISTRO  | https://release-monitoring.org/project/000230 | 1.36.1       | 1.37.0       | ORPH
                        c-ares |  DISTRO  | https://release-monitoring.org/project/005840 | 1.32.2       | 1.33.1       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/021325 | 0.5.10       | 0.6.3        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/021326 | 0.5.5        | 0.5.7        | ORPH
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/009026 | 20230311     | 20240203     |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/000247 | 1.18.0       | 1.18.2       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/007959 | 1.16.2       | 1.18.0       |     
                   cairomm1_14 |  DISTRO  | https://release-monitoring.org/project/369459 | 1.14.4       | 1.14.5       |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/021403 | 1.0.0        | 1.1.0        |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/010888 | 0.0.25       | 0.303.1      | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/011515 | 0.10.4       | 1.0.2        |     
                        catch2 |  DISTRO  | https://release-monitoring.org/project/007680 | 3.7.0        | 3.7.1        |     
                          ccid |  DISTRO  | https://release-monitoring.org/project/002612 | 1.5.2        | 1.6.1        | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/085785 | 3.9.1        | 4.4.4        | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/000276 | 3.6          | 20200710     |     
                chocolate-doom |  DISTRO  | https://release-monitoring.org/project/008547 | 3.0.1        | 3.1.0        |     
                        chrony |  DISTRO  | https://release-monitoring.org/project/008810 | 4.4          | 4.6          | ORPH
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/000287 | 6.15         | 7.0          |     
                        circus |  DISTRO  | https://release-monitoring.org/project/021726 | 0.16.1       | 0.18.0       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/000291 | 1.0.7        | 1.4.1        |     
                         clang |  DISTRO  | https://release-monitoring.org/project/011811 | 15.0.3       | 19.1.0       |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/020578 | 2.3.2        | 2.4.2        |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/010503 | 3.0.21.02.21 | 3.0.23.01.25 |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/021332 | 3.14.1.3     | 3.14.1.3+... |     
                   cloudflared |  DISTRO  | https://release-monitoring.org/project/186920 | 2024.6.1     | 2024.9.1     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/000306 | 3.30.0       | 3.30.4       |     
                        cmocka |  DISTRO  | https://release-monitoring.org/project/011779 | 1.1.5        | 1.1.7        |     
                   cni-plugins |  DISTRO  | https://release-monitoring.org/project/096794 | 1.3.0        | 1.5.1        |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/000330 | 4.3.2        | 4.3.8        |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/021882 | 0.9.1        | 0.10.0       | ORPH
                   compiler-rt |  DISTRO  | https://release-monitoring.org/project/017705 | 15.0.3       | 19.1.0       |     
                      composer |  DISTRO  | https://release-monitoring.org/project/009710 | 2.5.8        | 2.7.9        |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/096793 | 2.1.8        | 2.1.12       |     
                       connman |  DISTRO  | https://release-monitoring.org/project/000337 | 1.42         | 1.43         |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/000338 | 1.4.7        | 1.4.8        | ORPH
                    containerd |  DISTRO  | https://release-monitoring.org/project/016460 | 1.7.20       | 1.7.22       |     
                      cracklib |  DISTRO  | https://release-monitoring.org/project/000362 | 2.9.11       | 2.10.2       |     
                          criu |  DISTRO  | https://release-monitoring.org/project/000366 | 3.19         | 4.0          |     
                          crun |  DISTRO  | https://release-monitoring.org/project/096792 | 1.15         | 1.17         |     
               cryptodev-linux |  DISTRO  | https://release-monitoring.org/project/021409 | 1.13         | 1.14         | ORPH
                       cukinia |  DISTRO  | https://release-monitoring.org/project/138119 | 0.6.0        | 0.7.0        | ORPH
                          cups |  DISTRO  | https://release-monitoring.org/project/000380 | 2.4.7        | 2.4.10       |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/005541 | 1.28.17      | 2.0.1        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/021335 | 2.11.0       | 4.4.0        |     
                          dado |  DISTRO  | https://release-monitoring.org/project/058442 | 1.8.3-1      | 2.2.0-1      |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/021412 | 3.3.0        | 3.4.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/010252 | 3.3.0        | 3.4.0        |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.9        | 3.0.16       |     
                     darkhttpd |  DISTRO  | https://release-monitoring.org/project/000391 | 1.15         | 1.16         |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.13.4       | ORPH
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.3.6        | ORPH
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.2.2        | ORPH
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.4.1        | ORPH
                      dbus-cxx |  DISTRO  | https://release-monitoring.org/project/242464 | 2.4.0        | 2.5.2        |     
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/000402 | 1.2.18       | 1.3.2        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/015086 | 7.2.641      | 7.3.1        | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/021341 | 4.11         | 5.20         | ORPH
                         delve |  DISTRO  | https://release-monitoring.org/project/040149 | 1.22.1       | 1.23.1       |     
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/000421 | 0.26         | 0.27         | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/011429 | 10.0.8       | 10.0.10      |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/000431 | 1.3-20220117 | 1.3-20240619 | ORPH
                         dillo |  DISTRO  | https://release-monitoring.org/project/000438 | 3.0.5        | 3.1.1        | ORPH
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/021076 | 27.0.3       | 27.3.1       |     
             docker-cli-buildx |  DISTRO  | https://release-monitoring.org/project/325723 | 0.16.1       | 0.17.1       | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/006185 | 2.27.1       | 2.29.7       |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/000447 | 27.0.3       | 27.3.1       |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/021342 | 2024.4       | 2024.7       |     
             double-conversion |  DISTRO  | https://release-monitoring.org/project/007454 | 3.2.1        | 3.3.0        |     
                        dracut |  DISTRO  | https://release-monitoring.org/project/010627 | 059          | 103          |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/000462 | 9.21.4       | 9.28.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/021844 | 18.32        | 21.27        | ORPH
                      dt-utils |  DISTRO  | https://release-monitoring.org/project/021419 | 2023.08.0    | 2023.11.0    |     
                           dtc |  DISTRO  | https://release-monitoring.org/project/016911 | 1.7.0        | 1.7.1        |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 0.9.0        | 1.1.1        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/017392 | 1.7          | 1.8.2        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/017770 | 3.1.7        | 3.2.1        |     
                           efl |  DISTRO  | https://release-monitoring.org/project/006128 | 1.26.3       | 1.27.0       |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/005679 | 0.189        | 0.191        | ORPH
                           ell |  DISTRO  | https://release-monitoring.org/project/017781 | 0.68         | 0.69         | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/006601 | 2.3.3        | 2.8.2        |     
                          enet |  DISTRO  | https://release-monitoring.org/project/000696 | 1.3.17       | 1.3.18       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/000698 | 0.25.4       | 0.26.0       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/000707 | 26.0.2       | 27.1         |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/009302 | 0.6.14       | 0.8.0        |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/063188 | 1.8.1        | 1.8.2        |     
                      espflash |  DISTRO  | https://release-monitoring.org/project/373490 | 3.1.0        | 3.1.1        |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/000763 | 6.9          | 6.10         |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/000767 | 2.6.3        | 2.6.5        |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/000769 | 0.27.6       | 0.28.3       |     
                         expat |  DISTRO  | https://release-monitoring.org/project/000770 | 2.6.2        | 2.6.3        |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.18.22      | 0.20.0       |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/012048 | 1.34         | 1.36         | ORPH
                            fd |  DISTRO  | https://release-monitoring.org/project/373722 | 9.0.0        | 10.2.0       |     
                           feh |  DISTRO  | https://release-monitoring.org/project/000790 | 3.7.1        | 3.10.3       |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/005405 | 6.1.2        | 7.0.2        |     
                     findutils |  DISTRO  | https://release-monitoring.org/project/000812 | 4.9.0        | 4.10.0       | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/000806 | 3.34         | 3.37         |     
                     firewalld |  DISTRO  | https://release-monitoring.org/project/009989 | 2.0.2        | 2.2.1        | ORPH
                          flot |  DISTRO  | https://release-monitoring.org/project/007184 | 0.8.3        | 4.2.6        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/000823 | 1.3.7        | 1.3.9        | ORPH
                    fluent-bit |  DISTRO  | https://release-monitoring.org/project/267335 | 3.1.3        | 3.1.9        |     
                       fmtools |  DISTRO  | https://release-monitoring.org/project/021435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/000826 | 4.7.0        | 6.6.0        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/000827 | 2.14.2       | 2.15.0       | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.16.2       | 1.18.1       |     
                       freerdp |  DISTRO  | https://release-monitoring.org/project/010442 | 2.11.7       | 3.8.0        |     
                      freetype |  DISTRO  | https://release-monitoring.org/project/000854 | 2.13.2       | 2.13.3       |     
                           frr |  DISTRO  | https://release-monitoring.org/project/018555 | 9.1.1        | 10.1.1       |     
                    fscryptctl |  DISTRO  | https://release-monitoring.org/project/270981 | 1.0.0        | 1.2.0        |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.13         | 1.14         |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/017383 | 24.07.00     | 24.09.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/021438 | 1.9.1        | 1.10.2       |     
                         fwupd |  DISTRO  | https://release-monitoring.org/project/005833 | 1.9.20       | 1.9.25       |     
                     fwupd-efi |  DISTRO  | https://release-monitoring.org/project/326081 | 1.6          | 1.7          |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/011801 | 3.40.0       | 4.3.0        | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/000881 | 3.8.2        | 3.9.2        |     
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/009533 | 2.42.10      | 2.42.12      | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/067634 | 2.5.5        | 2.8.9        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/018420 | 2.2.0        | 2.3.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/000898 | 0.22.4       | 0.22.5       | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/001157 | 10.03.1      | 10.04.0      |     
                           git |  DISTRO  | https://release-monitoring.org/project/005350 | 2.46.0       | 2.46.2       |     
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/011337 | 15.5.0       | 17.4.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/021353 | 2.76.0       | 2.80.0       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/007960 | 2.76.0       | 2.82.0       |     
                    glibmm2_66 |  DISTRO  | https://release-monitoring.org/project/369440 | 2.66.6       | 2.66.7       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/001181 | 1.0.0        | 1.0.1        | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/008732 | 0.7.0        | 0.7.1        |     
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/001215 | 2.4.5        | 2.5.1        |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/001221 | 3.8.6        | 3.8.7        | ORPH
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/001223 | 1.76.1       | 1.82.0       | ORPH
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/021085 | 2.3.2        | 2.4.0        |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/009771 | 2.15.9       | 2.17.5       |     
                    gr-osmosdr |  DISTRO  | https://release-monitoring.org/project/021447 | 0.2.4        | 0.2.6        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/005410 | 6.2.0        | 7.5.0        | ORPH
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/001248 | 1.3.40       | 1.3.45       |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/019117 | 1.51.1       | 1.66.2       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/013139 | 45.0         | 47.1         |     
                           gsl |  DISTRO  | https://release-monitoring.org/project/001267 | 2.7.1        | 2.8          | ORPH
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/021845 | 1.22.9       | 1.22.12      | ORPH
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/021856 | 1.22.9       | 1.24.8       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/021846 | 0.13.1       | 2.2.0        |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/021848 | 1.22.9       | 1.24.8       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/021849 | 1.22.9       | 1.24.8       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/021850 | 1.22.9       | 1.24.8       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/021852 | 1.22.9       | 1.24.8       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/015187 | 1.22.9       | 1.24.8       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/003881 | 1.22.9       | 1.24.8       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/021853 | 1.22.9       | 1.24.8       | ORPH
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/021855 | 1.22.9       | 1.24.8       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/001263 | 1.22.9       | 1.24.8       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.22.9       | 1.24.8       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/311572 | 3.24.8       | 3.24.9       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/007724 | 3.24.7       | 5.14.0       |     
                         guile |  DISTRO  | https://release-monitoring.org/project/001277 | 3.0.9        | 3.0.10       |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/001281 | 1.6.6        | 1.6.7        |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/001285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/005496 | 1.48.1       | 1.56.0       | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/006136 | 2023.01.1    | 2024.02.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/001298 | 2.6.15       | 3.0.5        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/001299 | 9.0.0        | 10.0.1       |     
                      hiawatha |  DISTRO  | https://release-monitoring.org/project/013375 | 11.2         | 11.5         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/001327 | 3.17.10      | 3.24.4       | ORPH
                       htpdate |  DISTRO  | https://release-monitoring.org/project/132187 | 1.3.7        | 2.0.0        |     
                        hwdata |  DISTRO  | https://release-monitoring.org/project/005387 | 0.385        | 0.387        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/013501 | 2.9.3        | 2.11.2       |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/021355 | 2.50.2       | 2.53.1       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/016134 | 73-2         | 75-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/021670 | 2.9          | 2.14         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/021673 | 0.8.41       | 0.8.44       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/001372 | 7.1.1-31     | 7.1.1-38     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/021676 | 1.7.3        | 1.12.3       |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/008864 | 3.20.2.2     | 4.23.9.0     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/020342 | 22.5.1       | 22.5.2       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/020341 | 24.3.3       | 24.3.4       |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/020614 | 20240531     | 20240910     |     
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/001392 | 6.10.0       | 6.11.0       |     
                         ipset |  DISTRO  | https://release-monitoring.org/project/001393 | 7.16         | 7.22         |     
                       iputils |  DISTRO  | https://release-monitoring.org/project/001395 | 20240117     | 20240905     |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/001402 | 1.9.3        | 1.9.4        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/001404 | 1.4.4        | 1.4.5        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/013286 | 0.26         | 0.27         | ORPH
                            iw |  DISTRO  | https://release-monitoring.org/project/001410 | 5.19         | 6.9          | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/018380 | 2.20         | 2.22         | ORPH
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.35.2       | 1.36.0       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/015715 | 1.1.2        | 1.2.4        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/001421 | 2.0.33       | 4.2.4        |     
                      jbig2dec |  DISTRO  | https://release-monitoring.org/project/001431 | 0.19         | 0.20         |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/001459 | 0.81         | 0.83         |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/029701 | 3.4.1        | 3.6.0        | ORPH
                            jo |  DISTRO  | https://release-monitoring.org/project/018855 | 1.6          | 1.9          |     
                          jose |  DISTRO  | https://release-monitoring.org/project/011761 | 11           | 14           |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/001648 | 2.1.5        | 3.0.4        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/013910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/021681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/059395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/021815 | 1.13.1       | 1.14.0       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/021816 | 1.10.4       | 1.14.0       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/021817 | 1.19.5       | 1.21.0       | ORPH
                        json-c |  DISTRO  | https://release-monitoring.org/project/001477 | 0.17         | 0.18         |     
                     json-glib |  DISTRO  | https://release-monitoring.org/project/013144 | 1.8.0        | 1.10.0       | ORPH
                       jsoncpp |  DISTRO  | https://release-monitoring.org/project/007483 | 1.9.5        | 1.9.6        |     
                           kbd |  DISTRO  | https://release-monitoring.org/project/001492 | 2.5.1        | 2.6.4        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/001504 | 2.2.8        | 2.3.1        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.6.0        |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.6.0        |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.6.0        |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.6.0        |     
                          kmod |  DISTRO  | https://release-monitoring.org/project/001517 | 31           | 33           |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/021462 | 1.12.15      | 1.13.15      | ORPH
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/012418 | 2.2.0        | 2.3.1        |     
                        lapack |  DISTRO  | https://release-monitoring.org/project/001534 | 3.10.1       | 3.12.0       |     
                          less |  DISTRO  | https://release-monitoring.org/project/001550 | 643          | 661          | ORPH
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20230802.1   | 20240722.0   |     
                         libao |  DISTRO  | https://release-monitoring.org/project/007629 | 1.2.0        | 1.2.2        | ORPH
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 3.1.7        | 4.0.2        |     
                    libarchive |  DISTRO  | https://release-monitoring.org/project/001558 | 3.7.4        | 3.7.6        |     
                     libassuan |  DISTRO  | https://release-monitoring.org/project/001559 | 2.5.7        | 3.0.1        | ORPH
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 1.1.0        | 1.4.6        |     
                        libbsd |  DISTRO  | https://release-monitoring.org/project/001567 | 0.11.7       | 0.12.2       |     
                   libbytesize |  DISTRO  | https://release-monitoring.org/project/007869 | 2.10         | 2.11         | ORPH
                     libcamera |  DISTRO  | https://release-monitoring.org/project/301902 | v0.3.0       | 0.3.2        |     
                libcamera-apps |  DISTRO  | https://release-monitoring.org/project/328456 | 1.5.0        | 1.5.2        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/001575 | 2.0.3        | 3.1.0        |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/021471 | 4.3.4        | 4.3.5        |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/015531 | 2.10.18      | 2.10.19      | ORPH
                      libdecor |  DISTRO  | https://release-monitoring.org/project/312806 | 0.1.1        | 0.2.2        |     
                    libdeflate |  DISTRO  | https://release-monitoring.org/project/242778 | 1.20         | 1.21         |     
                        libdex |  DISTRO  | https://release-monitoring.org/project/328356 | 0.6.1        | 0.8.0        |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/020540 | 1.13.1       | 1.13.3       |     
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/012043 | 0.99.9.1     | 1.2304.0     |     
                   libfreeglut |  DISTRO  | https://release-monitoring.org/project/000846 | 3.4.0        | 3.6.0        |     
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/000857 | 1.0.15       | 1.0.16       |     
                       libgeos |  DISTRO  | https://release-monitoring.org/project/013493 | 3.12.2       | 3.13.0       |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/001174 | 2.6.4        | 3.40.0       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/001180 | 3.3.8        | 3.4          |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/010024 | 2.76.1       | 2.82.1       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/012098 | 1.4.0        | 1.7.0        | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/012558 | 2.5.27       | 2.5.31       | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/020640 | 1.6.5        | 2.1.3        | ORPH
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/001563 | 1.10.0       | 2.2.1        | ORPH
                       libgtk4 |  DISTRO  | https://release-monitoring.org/project/013942 | 4.14.5       | 4.16.2       |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/007735 | 237          | 238          |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/007981 | 2.41         | 2.43.1       |     
                       libical |  DISTRO  | https://release-monitoring.org/project/001637 | 1.0.1        | 3.0.18       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/010656 | 1.15         | 1.17         | ORPH
                     libid3tag |  DISTRO  | https://release-monitoring.org/project/021478 | 0.15.1b      | 0.16.3       | ORPH
                   libiec61850 |  DISTRO  | https://release-monitoring.org/project/141617 | 1.5.3        | 1.6.0        |     
                        libiio |  DISTRO  | https://release-monitoring.org/project/015689 | 0.25         | 0.26         |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/021479 | 0.10.3       | 2.3.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/005781 | 1.26.0       | 1.26.2       |     
                        libjwt |  DISTRO  | https://release-monitoring.org/project/242868 | 1.17.0       | 1.17.2       |     
                        libjxl |  DISTRO  | https://release-monitoring.org/project/232764 | 0.10.3       | 0.11.0       |     
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 2.0.5        | 2.0.6        | ORPH
                       libldns |  DISTRO  | https://release-monitoring.org/project/014817 | 1.8.3        | 1.8.4        |     
                     liblinear |  DISTRO  | https://release-monitoring.org/project/021363 | 2.45         | 247          |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/021483 | 0.31         | 0.32         | ORPH
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/007470 | 1.10.0       | 1.11.0       |     
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.12.10      | 0.13.1       |     
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/001986 | 2.2.7        | 2.2.8        |     
                libmodsecurity |  DISTRO  | https://release-monitoring.org/project/068638 | 3.0.12       | 3.0.13       |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/016827 | 0.10.1alpha  | 1.11         |     
                        libndp |  DISTRO  | https://release-monitoring.org/project/014944 | 1.8          | 1.9          |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/031639 | 2.1.28       | 3.5.1        |     
        libnetfilter_conntrack |  DISTRO  | https://release-monitoring.org/project/001675 | 1.0.9        | 1.1.0        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/001683 | 0.1.21       | 0.1.22       |     
                         libnl |  DISTRO  | https://release-monitoring.org/project/001684 | 3.9.0        | 3.10.0       | ORPH
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/075209 | 4.2.2        | 6.2.0        |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/002503 | 3.104        | 3.105        |     
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/021365 | 2.4.0        | 2.4.1        |     
                    libopenmpt |  DISTRO  | https://release-monitoring.org/project/141468 | 0.7.9        | 0.7.10       |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/010899 | 2023.8       | 2024.8       |     
                       libpeas |  DISTRO  | https://release-monitoring.org/project/006871 | 1.32.0       | 2.0.5        | ORPH
                      libpjsip |  DISTRO  | https://release-monitoring.org/project/015701 | 2.14         | 2.14.1       |     
                      libplist |  DISTRO  | https://release-monitoring.org/project/011675 | 2.4.0        | 2.6.0        | ORPH
                        libpng |  DISTRO  | https://release-monitoring.org/project/001705 | 1.6.43       | 1.6.44       |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/011042 | 1.6.0        | 1.6.1        |     
                        libraw |  DISTRO  | https://release-monitoring.org/project/001709 | 0.21.2       | 0.21.3       |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/005420 | 2.50.9       | 2.59.1       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/010717 | 2.0.5        | 2.0.6        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/013150 | 0.20.5       | 0.21.4       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/001717 | 3.6          | 3.7          |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/001718 | 3.6          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/001719 | 3.6          | 20200710     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/007961 | 3.4.0        | 3.6.0        |     
                      libsigc2 |  DISTRO  | https://release-monitoring.org/project/311642 | 2.12.0       | 2.12.1       |     
                     libsodium |  DISTRO  | https://release-monitoring.org/project/001728 | 1.0.18       | 1.0.20       |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/007908 | 0.7.25       | 0.7.30       |     
                 libsoundtouch |  DISTRO  | https://release-monitoring.org/project/115722 | 2.3.1        | 2.3.3        |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/004864 | 1.9.3        | 2.0.0        |     
                       libtool |  DISTRO  | https://release-monitoring.org/project/001741 | 2.4.6        | 2.5.3        | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/004166 | 1.2.19       | 2.0.10       |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/021371 | 0.8.2        | 0.9.2        |     
                   libucontext |  DISTRO  | https://release-monitoring.org/project/017085 | 1.2          | 1.3.1        |     
                   libunibreak |  DISTRO  | https://release-monitoring.org/project/326564 | 5.1          | 6.1          |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/015849 | 0.21.0       | 0.26.7       | ORPH
                       liburcu |  DISTRO  | https://release-monitoring.org/project/007134 | 0.14.0       | 0.14.1       |     
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.6          | 2.7          |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/010784 | 1.48.0       | 1.49.0       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/005097 | 8.10.6       | 8.15.3       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/013830 | 7.10.0       | 10.7.0       |     
                        libvpl |  DISTRO  | https://release-monitoring.org/project/242664 | 2.13.0       | 2023.4.0     |     
                        libvpx |  DISTRO  | https://release-monitoring.org/project/011083 | 1.13.1       | 1.14.1       |     
                        libxcb |  DISTRO  | https://release-monitoring.org/project/001767 | 1.15         | 1.17.0       | ORPH
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/001780 | 1.4.0        | 1.7.0        |     
                       libxml2 |  DISTRO  | https://release-monitoring.org/project/001783 | 2.13.3       | 2.13.4       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/011129 | 5.2.0        | 5.4.0        | ORPH
                       libyang |  DISTRO  | https://release-monitoring.org/project/018554 | 2.1.148      | 3.4.2        |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 0.11.0       | 1.0.0.9      |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 0.11.0       | 1.0.0.9      |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/010649 | 1.10.1       | 1.11.1       | ORPH
                          lilv |  DISTRO  | https://release-monitoring.org/project/001818 | 0.24.12      | 0.24.24      |     
                         links |  DISTRO  | https://release-monitoring.org/project/001822 | 2.29         | 2.30         | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/001823 | 4.4.8        | 5.2.6        | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20240709     | 20240909     |     
                      linuxptp |  DISTRO  | https://release-monitoring.org/project/021114 | 4.2          | 4.4          |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/012414 | 2021.05.03   | 2024.09.29   | ORPH
                  lksctp-tools |  DISTRO  | https://release-monitoring.org/project/021497 | 1.0.19       | 1.0.21       | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/001830 | 15.0.3       | 19.1.0       |     
                          llvm |  DISTRO  | https://release-monitoring.org/project/001830 | 15.0.3       | 19.1.0       |     
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/010135 | 0.1.19       | 0.1.19+nmu1  | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/001835 | 2.1.0        | 2.1.1        | ORPH
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/015330 | 1.1.0        | 1.2.0        |     
                     logrotate |  DISTRO  | https://release-monitoring.org/project/010567 | 3.21.0       | 3.22.0       | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/011671 | 1.0.1-1      | 1.2.2        |     
                      lsqlite3 |  DISTRO  | https://release-monitoring.org/project/011649 | 0.9.5-1      | 0.9.6        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/000155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/007135 | 2.13.1       | 2.13.8       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/007141 | 2.13.10      | 2.13.15      |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/007136 | 2.13.8       | 2.13.14      |     
                           lua |  DISTRO  | https://release-monitoring.org/project/001847 | 5.1.5        | 5.4.7        |     
                     lua-iconv |  DISTRO  | https://release-monitoring.org/project/011668 | 7-1          | 7.1.0        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/013887 | 0.15-0       | 0.17.2       |     
                           luv |  DISTRO  | https://release-monitoring.org/project/021510 | 1.43.0-0     | 1.48.0-2     | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/005354 | 2.03.23      | 2.03.26      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/001860 | 5.0.3        | 6.0.2        |     
                          lzip |  DISTRO  | https://release-monitoring.org/project/001866 | 1.23         | 1.24.1       | ORPH
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2408         | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/001887 | 10.11.6      | 11.6.1       | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/001893 | 1.5.26       | 1.5.27       |     
                          mawk |  DISTRO  | https://release-monitoring.org/project/001953 | 1.3.4-202... | 1.3.4-202... |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/013824 | 2.28.8       | 3.6.1        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/015518 | 20220418     | 20240929     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/008093 | 194          | 200          |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/021746 | 4.4.8        | 5.3.86       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/001965 | 1.6.29       | 1.6.31       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/001966 | 6.20         | 7.00         |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/001970 | 24.0.9       | 24.2.3       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/001970 | 24.0.9       | 24.2.3       |     
                         meson |  DISTRO  | https://release-monitoring.org/project/006472 | 1.3.1        | 1.5.2        |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/015392 | 2.25.1       | 3.52.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/021519 | 0.02         | 2.8.0        |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/010539 | 1.22.0       | 1.23.0       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/021521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/001978 | 5.6.1        | 5.9.1        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/021522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.0.7        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/021100 | 2024.06      | 2024.09      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/010267 | 20221107     | 20240407     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/020836 | 0.11.6       | 0.16.0       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/068638 | 2.9.7        | 3.0.13       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/002008 | 4.2.18       | 8.0.0        |     
                         monit |  DISTRO  | https://release-monitoring.org/project/005483 | 5.33.0       | 5.34.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/006360 | 6.12.0.182   | 6.12.0.206   |     
                        motion |  DISTRO  | https://release-monitoring.org/project/020616 | 4.6.0        | 4.7.0        |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/011578 | 2.5.1        | 4.0.0        |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/002019 | 4.1.1        | 4.2.1        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/012413 | 1.32.6       | 1.32.7       |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/005348 | 0.35.1       | 0.39.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/012278 | 3.3.0        | 6.1.1        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/002024 | 1.8.25       | 1.8.26       |     
                           mtd |  DISTRO  | https://release-monitoring.org/project/002026 | 2.2.0        | 2.2.1        |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/008868 | 1.1.6        | 1.1.7        |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/002028 | 4.0.43       | 4.0.45       | ORPH
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/000424 | 0.9.8        | 0.10.0       |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/002034 | 1.23.9       | 1.24.9       |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/013545 | 3.3.1        | 4.0.3        |     
                       mxt-app |  DISTRO  | https://release-monitoring.org/project/373381 | 1.38         | 1.40         |     
                       nanomsg |  DISTRO  | https://release-monitoring.org/project/014540 | 1.2          | 1.2.1        |     
                           nbd |  DISTRO  | https://release-monitoring.org/project/002052 | 3.25         | 3.26.1       |     
                          ncdu |  DISTRO  | https://release-monitoring.org/project/006045 | 1.20         | 2.6          |     
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/002055 | 0.49         | 0.51         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/002057 | 6.4-20230603 | 6.5-20240928 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/021531 | 1.0.7        | 1.0.8        | ORPH
                      neofetch |  DISTRO  | https://release-monitoring.org/project/016261 | 7.1.0        | 7.3.11       | ORPH
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 1.7.7        |     
                      netatalk |  DISTRO  | https://release-monitoring.org/project/002063 | 3.1.18       | 4.0.0        | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/021534 | 1.218        | 1.226        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/011046 | 1.33.1       | 1.47.2       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/021917 | 0.7.3        | 0.7.11       |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.1.49       | 2.2.31       |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/002062 | 5.9.3        | 5.9.4        | ORPH
                       netsurf |  DISTRO  | https://release-monitoring.org/project/005386 | 3.10         | 3.11         |     
                        nettle |  DISTRO  | https://release-monitoring.org/project/002073 | 3.9.1        | 3.10         | ORPH
                          newt |  DISTRO  | https://release-monitoring.org/project/015129 | 0.52.23      | 0.52.24      | ORPH
                     nfs-utils |  DISTRO  | https://release-monitoring.org/project/002081 | 2.6.4        | 2.7.1        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/008651 | 1.58.0       | 1.63.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/005413 | 1.26.2       | 1.27.1       | ORPH
                        ngircd |  DISTRO  | https://release-monitoring.org/project/002083 | 26.1         | 27           | ORPH
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/008251 | 20.15.1      | 22.9.0       |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/008251 | 20.15.1      | 22.9.0       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/021539 | 2.1.9        | 3.0.0        | ORPH
                          norm |  DISTRO  | https://release-monitoring.org/project/021540 | 1.5.8        | 1.5.9        | ORPH
                       numactl |  DISTRO  | https://release-monitoring.org/project/002507 | 2.0.16       | 2.0.18       |     
                       nushell |  DISTRO  | https://release-monitoring.org/project/031106 | 0.96.1       | 0.98.0       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/002511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/021843 | 390.151      | 390.157      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 560.35.03    | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 515.48.07    | 560.35.03    |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/009074 | 1.12         | 2.10.2       | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/016859 | 2.2          | 2.10         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/033334 | v1.12.12     | 14.3.0       |     
                       omniorb |  DISTRO  | https://release-monitoring.org/project/021545 | 4.3.1        | 4.3.2        | ORPH
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/010861 | 2.1.9        | 2.1.10       |     
                     open-lldp |  DISTRO  | https://release-monitoring.org/project/115714 | 1.1          | 1.1.1        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/016896 | v1.3.12      | 1.4.4        | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/008172 | 1.22.0       | 1.23.1       | ORPH
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2023.12.14   | 2024.05.08   |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/021548 | 0.1.5        | 0.1.6        | ORPH
                       opencsd |  DISTRO  | https://release-monitoring.org/project/368613 | 1.5.3        | 1.5.4        |     
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/006615 | 3.4.19       | 4.10.0       | ORPH
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.11.0       | 0.12.1       |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/002549 | 2.0.34       | 2.0.36       | ORPH
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 17.0.12+7    | 24+17        |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/006847 | 9.2.4        | 10.2.1       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/002554 | 4.1.5        | 5.0.5        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/011687 | 0.52.1       | 0.55.1       |     
                        opensc |  DISTRO  | https://release-monitoring.org/project/002559 | 0.24.0       | 0.25.1       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/010998 | 11.3.5-18... | 12.4.5       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/059397 | 0.6.2        | 0.7.0        | ORPH
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/059396 | 0.6.2        | 0.7.0        | ORPH
                          opus |  DISTRO  | https://release-monitoring.org/project/011081 | 1.4          | 1.5.2        |     
                           orc |  DISTRO  | https://release-monitoring.org/project/002573 | 0.4.34       | 0.4.40       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/021691 | 4.4.8        | 5.3.86       | ORPH
                     osm2pgsql |  DISTRO  | https://release-monitoring.org/project/002575 | 1.11.0       | 2.0.0        |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/002582 | 0.25.3       | 0.25.5       | ORPH
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/021376 | 1.3.2        | 1.4.1        |     
                       pangomm |  DISTRO  | https://release-monitoring.org/project/007958 | 2.50.1       | 2.54.0       |     
                   pangomm2_46 |  DISTRO  | https://release-monitoring.org/project/369412 | 2.46.3       | 2.46.4       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/010309 | 0.7          | 0.65         | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/002598 | 0.13         | 0.18.0       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/002601 | 1.3.7        | 1.3.8        | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/005832 | 10.43        | 10.44        | ORPH
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/002611 | 2.1.0        | 2.3.0        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/021378 | 3.5          | 3.6          |     
                          perl |  DISTRO  | https://release-monitoring.org/project/013599 | 5.38.2       | 5.41.4       |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/011930 | 2.33         | 3.04         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/002743 | 0.02         | 0.21         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/002807 | 4.046        | 5.009        |     
                      perl-dbi |  DISTRO  | https://release-monitoring.org/project/002811 | 1.643        | 1.645        |     
    perl-extutils-installpaths |  DISTRO  | https://release-monitoring.org/project/011849 | 0.013        | 0.014        |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/012660 | 2.77         | 2.83         |     
              perl-html-tagset |  DISTRO  | https://release-monitoring.org/project/002971 | 3.20         | 3.24         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/006175 | 12.50        | 12.97        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/006569 | 2.080        | 2.089        |     
             perl-json-maybexs |  DISTRO  | https://release-monitoring.org/project/011953 | 1.004005     | 1.004008     |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/011868 | 1.20230630   | 1.20240923   |     
               perl-mozilla-ca |  DISTRO  | https://release-monitoring.org/project/003136 | 20240730     | 20240924     |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/003147 | 1.46         | 1.47         |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/003163 | 0.72         | 0.74         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/014338 | 0.52         | 0.61         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/003527 | 2.0134       | 2.0210       |     
                           php |  DISTRO  | https://release-monitoring.org/project/003627 | 8.3.11       | 8.3.12       |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/015603 | 2.0.0        | 2.1.2        |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/011010 | 5.1.22       | 5.1.24       |     
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 2.2.5        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/021742 | 1.4          | 1.4.1        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/013302 | 3.3.1        | 3.3.2        |     
                        physfs |  DISTRO  | https://release-monitoring.org/project/003631 | 3.0.2        | 3.2.0        |     
                      pico-sdk |  DISTRO  | https://release-monitoring.org/project/373461 | 1.5.1        | 2.0.0        |     
                      picotool |  DISTRO  | https://release-monitoring.org/project/373463 | 1.1.2        | 2.0.0        |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/057357 | 1.2.2        | 1.2.5        |     
                        pixman |  DISTRO  | https://release-monitoring.org/project/003648 | 0.42.2       | 0.43.4       | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/012753 | 1.6.3        | 2.3.0        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/003674 | 2.18.0       | 3.0.3        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/005418 | 1.13.2       | 1.13.3       |     
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 4.2          | ORPH
                        polkit |  DISTRO  | https://release-monitoring.org/project/003682 | 123          | 125          |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/003686 | 22.12.0      | 24.09.0      |     
                       postgis |  DISTRO  | https://release-monitoring.org/project/003694 | 3.4.2        | 3.5.0        |     
                    postgresql |  DISTRO  | https://release-monitoring.org/project/005601 | 16.4         | 17.0         |     
                         pound |  DISTRO  | https://release-monitoring.org/project/005436 | 4.8          | 4.13         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/010715 | 1.3.11       | 1.3.12       | ORPH
                         procs |  DISTRO  | https://release-monitoring.org/project/076458 | 0.14.5       | 0.14.6       |     
                          proj |  DISTRO  | https://release-monitoring.org/project/021570 | 9.4.1        | 9.5.0        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/003709 | 0.11.14      | 0.12.4       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 21.12        | 28.2         |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/006499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/021825 | 6.0.1        | 6.4.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/003721 | 23.5         | 23.7         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/003726 | 1.1.0        | 2.3.1        | ORPH
                     pure-ftpd |  DISTRO  | https://release-monitoring.org/project/003731 | 1.0.51       | 1.0.52       |     
                            pv |  DISTRO  | https://release-monitoring.org/project/003736 | 1.8.13       | 1.8.14       | ORPH
       python-aiohappyeyeballs |  DISTRO  | https://release-monitoring.org/project/373934 | 2.4.0        | 2.4.2        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/006713 | 3.10.5       | 3.10.8       |     
        python-aiohttp-session |  DISTRO  | https://release-monitoring.org/project/021250 | 2.12.0       | 2.12.1       |     
                python-alembic |  DISTRO  | https://release-monitoring.org/project/003766 | 1.13.2       | 1.13.3       |     
                   python-avro |  DISTRO  | https://release-monitoring.org/project/059411 | 1.11.3       | 1.12.0       |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/029737 | 1.35.19      | 1.35.29      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/008748 | 1.35.19      | 1.35.29      |     
               python-cchardet |  DISTRO  | https://release-monitoring.org/project/014813 | 2.1.7        | 2.2.0a2      |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/020163 | 10.0.1       | 11.0.0b3     |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/019734 | 1.1.30       | 2.0.0        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/012679 | 0.29.37      | 3.0.11-1     |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/003816 | 3.0.1        | 3.0.2        |     
               python-dateutil |  DISTRO  | https://release-monitoring.org/project/005621 | 2.9.0        | 2.9.0.post0  |     
              python-dbus-fast |  DISTRO  | https://release-monitoring.org/project/287975 | 2.12.1       | 2.24.2       |     
                python-esptool |  DISTRO  | https://release-monitoring.org/project/011619 | 4.8.0        | 4.8.1        |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/085010 | 2.0.7        | 24.3.25      |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/007388 | 4.53.1       | 4.54.1       |     
                python-glslang |  DISTRO  | https://release-monitoring.org/project/205796 | 11.13.0      | 15.0.0       |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/013158 | 3.42.2       | 3.50.0       |     
                 python-grpcio |  DISTRO  | https://release-monitoring.org/project/018429 | 1.66.1       | 1.66.2       |     
      python-grpcio-reflection |  DISTRO  | https://release-monitoring.org/project/030542 | 1.66.1       | 1.66.2       |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/011771 | 2.4.1        | 2.4.1-1      |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/051611 | 1.5          | 1.7.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/020165 | 4.0.2        | 4.1.0        |     
                python-maturin |  DISTRO  | https://release-monitoring.org/project/042653 | 1.7.1        | 1.7.4        |     
           python-meson-python |  DISTRO  | https://release-monitoring.org/project/248985 | 0.15.0       | 0.16.0       |     
              python-multipart |  DISTRO  | https://release-monitoring.org/project/018463 | 0.0.10       | 0.0.12       |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/002509 | 1.25.0       | 2.1.1        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.1.5        | 1.05a1       |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/008742 | 3.0.47       | 3.0.48       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 21.12        | 28.2         |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/017320 | 1.23.22      | 1.24.10      |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/015558 | 3.12.0       | 3.13.0       |     
        python-pyproject-hooks |  DISTRO  | https://release-monitoring.org/project/320474 | 1.0.0        | 1.2.0        |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/020104 | 5.15.6       | 5.15.11      |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/021589 | 1.2.9        | 1.2.10       |     
                 python-pysnmp |  DISTRO  | https://release-monitoring.org/project/012027 | 7.1.3        | 7.1.4        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/004104 | 25.1.2       | 26.2.0       |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/003992 | 5.0.8        | 5.1.0        |     
               python-reedsolo |  DISTRO  | https://release-monitoring.org/project/081160 | 1.7.0        | 2.0.13       |     
                  python-rtoml |  DISTRO  | https://release-monitoring.org/project/062048 | 0.10.0       | 0.11.0       |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/019641 | 2.1.76       | 2.2          |     
                  python-scapy |  DISTRO  | https://release-monitoring.org/project/004764 | 2.5.0        | 2.6.0        |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/004768 | 1.11.4       | 1.14.1       |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/013626 | 4.19.25      | 6.8.6        |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/012729 | 5.0.0        | 6.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/007203 | 0.6.1        | 0.7.3        |     
                 python-spake2 |  DISTRO  | https://release-monitoring.org/project/019872 | 0.8          | 0.9          |     
              python-starlette |  DISTRO  | https://release-monitoring.org/project/036570 | 0.38.5       | 0.39.1       |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/004076 | 5.7.0        | 5.10.0       |     
         python-urwid-readline |  DISTRO  | https://release-monitoring.org/project/084198 | 0.14         | 0.15.1       |     
                python-uvicorn |  DISTRO  | https://release-monitoring.org/project/028526 | 0.30.6       | 0.31.0       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/005341 | 5.0.2        | 5.0.3        |     
                python-webargs |  DISTRO  | https://release-monitoring.org/project/024711 | 8.2.0        | 8.6.0        |     
                  python-webob |  DISTRO  | https://release-monitoring.org/project/006181 | 1.8.7        | 1.8.8        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/012895 | 1.9.2        | 1.13.1       |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/012681 | 0.123.0      | 0.135.0      |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/013254 | 3.12.5       | 3.12.6       |     
                    qbee-agent |  DISTRO  | https://release-monitoring.org/project/372328 | 2024.23      | 2024.36      |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/013607 | 9.0.2        | 9.1.0        |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/021737 | 2.4.7        | 2.5.0        | ORPH
                          qpdf |  DISTRO  | https://release-monitoring.org/project/005542 | 10.5.0       | 11.9.1       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/015198 | 0.35.0       | 0.39.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.7.3        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.7.3        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.7.3        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.7.3        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.14      | 6.7.3        |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/007927 | 6.7.2        | 6.7.3        |     
                qt6core5compat |  DISTRO  | https://release-monitoring.org/project/007927 | 6.7.2        | 6.7.3        |     
                       qt6mqtt |  DISTRO  | https://release-monitoring.org/project/242923 | 6.7.2        | 6.7.3        |     
                  qt6serialbus |  DISTRO  | https://release-monitoring.org/project/007927 | 6.7.2        | 6.7.3        |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/007927 | 6.7.2        | 6.7.3        |     
                        qt6svg |  DISTRO  | https://release-monitoring.org/project/007927 | 6.7.2        | 6.7.3        |     
                     quotatool |  DISTRO  | https://release-monitoring.org/project/004146 | 1.6.4        | 1.6.5        | ORPH
                           qwt |  DISTRO  | https://release-monitoring.org/project/004147 | 6.1.6        | 6.3.0        | ORPH
                         ragel |  DISTRO  | https://release-monitoring.org/project/012105 | 6.10         | 7.0.4        | ORPH
                     rdma-core |  DISTRO  | https://release-monitoring.org/project/012907 | 52.0         | 53.0         |     
                      readline |  DISTRO  | https://release-monitoring.org/project/004173 | 8.2          | 8.2.13       | ORPH
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/021663 | 2.20231002   | 2.20240916   |     
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.5       |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/016520 | 3.6          | 20200710     | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/021389 | 1.10.5       | 2.0.1        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/015461 | 14.1.0       | 14.1.1       |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/015560 | 6.20.3       | 9.6.1        |     
                       rrdtool |  DISTRO  | https://release-monitoring.org/project/004214 | 1.8.0        | 1.9.0        |     
                      rtorrent |  DISTRO  | https://release-monitoring.org/project/004221 | 0.9.8        | 0.10.0       | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/004223 | 3.3.4        | 3.3.5        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/007462 | 1.1.12       | 1.1.14       |     
                          rust |  DISTRO  | https://release-monitoring.org/project/007635 | 1.80.1       | 1.81.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/007635 | 1.80.1       | 1.81.0       |     
                  rust-bindgen |  DISTRO  | https://release-monitoring.org/project/017910 | 0.65.1       | 0.70.1       | ORPH
                         rygel |  DISTRO  | https://release-monitoring.org/project/004751 | 0.42.5       | 0.44.0       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/010714 | 2.33.1       | 2.34.0       |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/021385 | 3.7.1        | 08032024     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/004758 | 4.20.4       | 4.21.0       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/004760 | 1.1.1        | 1.3.1        |     
                         scons |  DISTRO  | https://release-monitoring.org/project/004770 | 4.7.0        | 4.8.1        |     
                        screen |  DISTRO  | https://release-monitoring.org/project/004772 | 4.9.1        | 5.0.0        | ORPH
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/004779 | 2.30.6       | 2.30.7       |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/004782 | 2.6.3        | 2.8.0        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/004778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/010262 | 1.0.3        | 2.0.2        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/004787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/015203 | 1.20.0       | 1.49.4       |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/001717 | 3.6          | 3.7          |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/001717 | 3.6          | 3.7          | ORPH
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 2.20.3       | 2.36.3       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.7.10       |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/021655 | 4.3.8        | 4.6.2        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.14      | 0.32.2       |     
                       setools |  DISTRO  | https://release-monitoring.org/project/008951 | 4.4.4        | 4.5.1        | ORPH
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/021384 | 3.3.9        | 4.3.4        | ORPH
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/005524 | 1.12         | 2.4          | ORPH
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.0.9        | ORPH
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/021653 | 4.11         | 4.12         |     
                        skopeo |  DISTRO  | https://release-monitoring.org/project/009216 | 1.16.0       | 1.16.1       |     
                   slirp4netns |  DISTRO  | https://release-monitoring.org/project/096795 | 1.2.3        | 1.3.1        |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/004835 | 7.3          | 7.4          | ORPH
                        sngrep |  DISTRO  | https://release-monitoring.org/project/017075 | 1.7.0        | 1.8.2        | ORPH
                  snmpclitools |  DISTRO  | https://release-monitoring.org/project/031640 | 0.6.4        | 0.7.2        |     
                        snmppp |  DISTRO  | https://release-monitoring.org/project/021318 | 3.5.1        | 3.5.2        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/013263 | 3.1.40.0     | 3.3.5.0      |     
                         socat |  DISTRO  | https://release-monitoring.org/project/004848 | 1.8.0.0      | 1.8.0.1      |     
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.12      | 0.16.16      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/010152 | 0.7          | 0.8          |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/005388 | 1.6.4        | 1.6.5        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/004871 | 0.15.0       | 0.15.2       |     
                   spirv-tools |  DISTRO  | https://release-monitoring.org/project/334920 | 1.3.261.1    | 1.3.290.0    | ORPH
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/011213 | 4.5.5        | 4.6.1        |     
                        sqlite |  DISTRO  | https://release-monitoring.org/project/004877 | 3.46.0       | 3.46.1       |     
                         squid |  DISTRO  | https://release-monitoring.org/project/004880 | 6.10         | 6.11         | ORPH
                        sratom |  DISTRO  | https://release-monitoring.org/project/014903 | 0.6.14       | 0.6.16       |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/006184 | 2.0.1        | 2.1.2        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/008127 | 1.20.7.1     | 1.22.11      | ORPH
                    stellarium |  DISTRO  | https://release-monitoring.org/project/004891 | 24.2         | 24.3         |     
                        strace |  DISTRO  | https://release-monitoring.org/project/004897 | 6.10         | 6.11         |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/012538 | 0.18.02      | 0.18.04      |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/004901 | 5.71         | 5.73         |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/010925 | 6.0.19       | 7.0.6        |     
                          sway |  DISTRO  | https://release-monitoring.org/project/011497 | 1.8.1        | 1.9          |     
                          swig |  DISTRO  | https://release-monitoring.org/project/004919 | 4.1.1        | 4.2.1        |     
                         swipl |  DISTRO  | https://release-monitoring.org/project/236197 | 9.2.6        | 9.2.7        |     
                         swtpm |  GUESS   | https://release-monitoring.org/project/116461 | 0.8.2        | 0.9.0        |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/005718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/016898 | 0.29.3       | 0.38.1       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/004930 | 4.7.1        | 4.8.0        |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/021649 | 46.0         | 47.0         |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/034820 | 2.2.150      | 2.11.7       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/004931 | 12.7.5       | 12.7.6       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/005440 | 256.4        | 256.6        |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/011774 | 233          | 235          |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/021648 | 3.04         | 3.10         | ORPH
                        taglib |  DISTRO  | https://release-monitoring.org/project/001982 | 1.13.1       | 2.0.2        |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/008217 | 2021.12.0    | 2021.13.0    |     
                     tcf-agent |  DISTRO  | https://release-monitoring.org/project/021833 | 1.8.0        | 1.9.0        |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/004941 | 8.6.14       | 9.0.0        | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/004942 | 1.2.4        | 1.2.5        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/004943 | 1.21         | 2.0          |     
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/013716 | 4.4.4        | 4.5.1        | ORPH
                   terminology |  DISTRO  | https://release-monitoring.org/project/004951 | 1.12.1       | 1.13.0       |     
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/004954 | 5.3.4        | 5.4.1        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/014500 | 2.5.6        | 2.5.8        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/005581 | 0.14.1       | 0.21.0       | ORPH
                          tiff |  DISTRO  | https://release-monitoring.org/project/001738 | 4.6.0        | 4.7.0        | ORPH
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 3.4.0        | 4.1.0        |     
                           tio |  DISTRO  | https://release-monitoring.org/project/020587 | 3.5          | 3.7          |     
                            tk |  DISTRO  | https://release-monitoring.org/project/011426 | 8.6.14       | 9.0.0        |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.1.0        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/004980 | 3.3a         | 3.5          |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/021640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/016819 | 2.3.3        | 3.0.0        | ORPH
                   tpm2-pkcs11 |  DISTRO  | https://release-monitoring.org/project/018777 | 1.9.0        | 1.9.1        |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/018790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/012683 | 3.2.2        | 4.1.3        | ORPH
                    traceroute |  DISTRO  | https://release-monitoring.org/project/014877 | 2.1.3        | 2.1.6        |     
                        tzdata |  DISTRO  | https://release-monitoring.org/project/005021 | 2024a        | 2024b        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/005022 | 2021.07      | 2024.07      | ORPH
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.16         |     
                       uhubctl |  DISTRO  | https://release-monitoring.org/project/017364 | 2.5.0        | 2.6.0        |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/017617 | 2.1          | 3.5          | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/015848 | 1.5.12       | 1.8.17       | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/005056 | 0.99.19      | 1.90.6       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/013737 | 4.2.1        | 4.2.4        |     
                      usbguard |  DISTRO  | https://release-monitoring.org/project/011151 | 1.1.2        | 1.1.3        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/016012 | 0.13.0       | 0.14.0       |     
                     ustreamer |  DISTRO  | https://release-monitoring.org/project/314869 | 6.11         | 6.16         |     
                    util-linux |  DISTRO  | https://release-monitoring.org/project/008179 | 2.39.3       | 2.40.2       | ORPH
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/008179 | 2.39.3       | 2.40.2       | ORPH
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/010956 | 0.12.7       | 0.13.2       |     
                      valijson |  DISTRO  | https://release-monitoring.org/project/018452 | 1.0.2        | 1.0.3        | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/005069 | 2.6.5        | 2.7.2        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/005080 | 1.8.0        | 1.8.3        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/005092 | 9.1.0145     | 9.1.0747     | ORPH
                   vis-network |  DISTRO  | https://release-monitoring.org/project/270536 | 9.1.0        | 9.1.9        |     
                        vnstat |  DISTRO  | https://release-monitoring.org/project/007283 | 2.11         | 2.12         |     
                           vte |  DISTRO  | https://release-monitoring.org/project/010895 | 0.66.2       | 0.78.0       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/089353 | 3.4.31       | 3.5.10       |     
                  vuejs-router |  DISTRO  | https://release-monitoring.org/project/234796 | 4.4.0        | 4.4.5        |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/088835 | 1.3.262      | 1.3.296      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.3.262      | 1.3.296      | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.3.262      | 1.3.296      | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/005116 | 2.1.1        | 2.1.2        |     
                        waffle |  DISTRO  | https://release-monitoring.org/project/021633 | 1.7.0        | 1.8.1        |     
                       wavemon |  DISTRO  | https://release-monitoring.org/project/005120 | 0.9.5        | 0.9.6        | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/010061 | 1.23.0       | 1.23.1       |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/013997 | 1.36         | 1.37         | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/005355 | 2.44.2       | 2.46.0       |     
                          webp |  DISTRO  | https://release-monitoring.org/project/001761 | 1.3.2        | 1.4.0        |     
                        weston |  DISTRO  | https://release-monitoring.org/project/013745 | 13.0.3       | 14.0.0       |     
                          wget |  DISTRO  | https://release-monitoring.org/project/005124 | 1.21.4       | 1.24.5       |     
                         whois |  DISTRO  | https://release-monitoring.org/project/005128 | 5.5.14       | 5.5.23       |     
                          wine |  DISTRO  | https://release-monitoring.org/project/005134 | 8.0.2        | 9.18         |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.5.5        | 0.5.6        | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/005137 | 4.2.6        | 4.4.0        | ORPH
                       wlroots |  DISTRO  | https://release-monitoring.org/project/018357 | 0.16.2       | 0.18.1       |     
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.1.0        | 3.4.0        |     
                wpebackend-fdo |  DISTRO  | https://release-monitoring.org/project/017547 | 1.14.2       | 1.14.3       |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/017557 | 2.44.4       | 2.46.0       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.41.0       | 0.43.0       |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/007275 | 3.5          | 4.0          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/015919 | 1.4.24       | 1.4.26       |     
                   xapp_appres |  DISTRO  | https://release-monitoring.org/project/015053 | 1.0.6        | 1.0.7        | ORPH
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/000191 | 1.1.0        | 1.1.1        | ORPH
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/017160 | 1.0.8        | 1.0.9        | ORPH
               xapp_fonttosfnt |  DISTRO  | https://release-monitoring.org/project/021723 | 1.2.2        | 1.2.3        | ORPH
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/015048 | 1.0.9        | 1.0.10       | ORPH
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/017161 | 1.0.5        | 1.0.6        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/015047 | 1.1.1        | 20240910     | ORPH
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/015043 | 1.2.2        | 1.2.3        | ORPH
                  xapp_x11perf |  DISTRO  | https://release-monitoring.org/project/015035 | 1.6.2        | 1.7.0        | ORPH
                    xapp_xauth |  DISTRO  | https://release-monitoring.org/project/005253 | 1.1.2        | 1.1.3        | ORPH
                    xapp_xbiff |  DISTRO  | https://release-monitoring.org/project/015034 | 1.0.4        | 1.0.5        | ORPH
               xapp_xclipboard |  DISTRO  | https://release-monitoring.org/project/015033 | 1.1.4        | 1.1.5        | ORPH
                 xapp_xconsole |  DISTRO  | https://release-monitoring.org/project/015030 | 1.0.8        | 1.1.0        |     
                 xapp_xditview |  DISTRO  | https://release-monitoring.org/project/021262 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xdm |  DISTRO  | https://release-monitoring.org/project/005255 | 1.1.14       | 1.1.16       | ORPH
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/005180 | 1.2.3        | 1.2.4        | ORPH
                      xapp_xev |  DISTRO  | https://release-monitoring.org/project/015026 | 1.2.5        | 1.2.6        | ORPH
                    xapp_xeyes |  DISTRO  | https://release-monitoring.org/project/015025 | 1.2.0        | 1.3.0        | ORPH
                 xapp_xfontsel |  DISTRO  | https://release-monitoring.org/project/015023 | 1.1.0        | 1.1.1        | ORPH
                      xapp_xfs |  DISTRO  | https://release-monitoring.org/project/005256 | 1.2.1        | 1.2.2        | ORPH
                  xapp_xkbcomp |  DISTRO  | https://release-monitoring.org/project/015018 | 1.4.6        | 1.4.7        | ORPH
                 xapp_xkbutils |  DISTRO  | https://release-monitoring.org/project/015016 | 1.0.5        | 1.0.6        | ORPH
                    xapp_xload |  DISTRO  | https://release-monitoring.org/project/014992 | 1.1.4        | 1.2.0        | ORPH
                 xapp_xlsfonts |  DISTRO  | https://release-monitoring.org/project/014964 | 1.0.7        | 1.0.8        | ORPH
                     xapp_xman |  DISTRO  | https://release-monitoring.org/project/014962 | 1.1.5        | 1.2.0        | ORPH
                 xapp_xmessage |  DISTRO  | https://release-monitoring.org/project/014961 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xmh |  DISTRO  | https://release-monitoring.org/project/021718 | 1.0.4        | 1.0.5        | ORPH
                    xapp_xmore |  DISTRO  | https://release-monitoring.org/project/018845 | 1.0.3        | 1.0.4        | ORPH
                      xapp_xpr |  DISTRO  | https://release-monitoring.org/project/014959 | 1.1.0        | 1.2.0        | ORPH
                    xapp_xprop |  DISTRO  | https://release-monitoring.org/project/014958 | 1.2.6        | 1.2.7        | ORPH
                 xapp_xrefresh |  DISTRO  | https://release-monitoring.org/project/014955 | 1.0.7        | 1.1.0        | ORPH
                      xapp_xsm |  DISTRO  | https://release-monitoring.org/project/005259 | 1.0.5        | 1.0.6        | ORPH
                     xcb-proto |  DISTRO  | https://release-monitoring.org/project/013646 | 1.15.2       | 1.17.0       | ORPH
               xcb-util-cursor |  DISTRO  | https://release-monitoring.org/project/005166 | 0.1.4        | 0.1.5        | ORPH
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/005782 | 1.3.0        | 1.4.0        | ORPH
         xdriver_xf86-video-nv |  DISTRO  | https://release-monitoring.org/project/021711 | 2.1.22       | 2.1.23       | ORPH
     xdriver_xf86-video-savage |  DISTRO  | https://release-monitoring.org/project/005235 | 2.4.0        | 2.4.1        | ORPH
xdriver_xf86-video-siliconm... |  DISTRO  | https://release-monitoring.org/project/005236 | 1.7.9        | 1.7.10       | ORPH
                           xen |  DISTRO  | https://release-monitoring.org/project/005181 | 4.14.6       | 4.19.0       |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/005182 | 3.2.4        | 3.2.5        | ORPH
               xfont_encodings |  DISTRO  | https://release-monitoring.org/project/015051 | 1.0.7        | 1.1.0        | ORPH
 xfont_font-adobe-utopia-75dpi |  DISTRO  | https://release-monitoring.org/project/017200 | 1.0.4        | 1.0.5        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/015055 | 1.4.0        | 1.4.1        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/005188 | 6.4.0        | 6.10.1       | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/006382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/005191 | 2.38         | 2.42         | ORPH
                    xlib_libFS |  DISTRO  | https://release-monitoring.org/project/001618 | 1.0.9        | 1.0.10       | ORPH
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/001764 | 1.8.7        | 1.8.10       | ORPH
                   xlib_libXaw |  DISTRO  | https://release-monitoring.org/project/001766 | 1.0.15       | 1.0.16       | ORPH
               xlib_libXcursor |  DISTRO  | https://release-monitoring.org/project/001770 | 1.2.1        | 1.2.2        | ORPH
                 xlib_libXdmcp |  DISTRO  | https://release-monitoring.org/project/001772 | 1.1.4        | 1.1.5        | ORPH
                  xlib_libXext |  DISTRO  | https://release-monitoring.org/project/001774 | 1.3.5        | 1.3.6        | ORPH
                xlib_libXfont2 |  DISTRO  | https://release-monitoring.org/project/017165 | 2.0.6        | 2.0.7        | ORPH
                    xlib_libXi |  DISTRO  | https://release-monitoring.org/project/001778 | 1.8.1        | 1.8.2        | ORPH
                   xlib_libXmu |  DISTRO  | https://release-monitoring.org/project/001785 | 1.1.4        | 1.2.1        | ORPH
                xlib_libXrandr |  DISTRO  | https://release-monitoring.org/project/001788 | 1.5.3        | 1.5.4        | ORPH
                  xlib_libXtst |  DISTRO  | https://release-monitoring.org/project/001794 | 1.2.4        | 1.2.5        | ORPH
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/001796 | 1.0.13       | 1.0.14       | ORPH
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/001613 | 1.1.7        | 1.1.8        | ORPH
               xlib_libxkbfile |  DISTRO  | https://release-monitoring.org/project/001781 | 1.1.2        | 1.1.3        | ORPH
                     xorgproto |  DISTRO  | https://release-monitoring.org/project/017190 | 2023.2       | 2024.1       | ORPH
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/005269 | 6.03         | 6.09         |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/007736 | 3.24         | 3.26         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/005272 | 389          | 394          | ORPH
              xutil_makedepend |  DISTRO  | https://release-monitoring.org/project/013528 | 1.0.8        | 1.0.9        | ORPH
             xutil_util-macros |  DISTRO  | https://release-monitoring.org/project/015037 | 1.20.0       | 1.20.1       | ORPH
                      xwayland |  DISTRO  | https://release-monitoring.org/project/180949 | 23.2.4       | 24.1.2       |     
                           yad |  DISTRO  | https://release-monitoring.org/project/005280 | 0.40.0       | 14.1         |     
                            z3 |  DISTRO  | https://release-monitoring.org/project/007812 | 4.13.0       | 4.13.2       |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/005492 | 7.0.3        | 7.0.4        |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.5.1        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 7.0.2        |     
                       zlib-ng |  DISTRO  | https://release-monitoring.org/project/115592 | 2.1.6        | 2.2.2        | ORPH
                          zlog |  DISTRO  | https://release-monitoring.org/project/021624 | 1.2.17       | 1.2.18       |     
                        zoxide |  DISTRO  | https://release-monitoring.org/project/098400 | 0.9.4        | 0.9.6        |     
                       zziplib |  DISTRO  | https://release-monitoring.org/project/013802 | 0.13.74      | 0.13.78      |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                     angularjs | CVE-2024-8373    | https://security-tracker.debian.org/tracker/CVE-2024-8373   
                     angularjs | CVE-2024-8372    | https://security-tracker.debian.org/tracker/CVE-2024-8372   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                           apr | CVE-2023-49582   | https://security-tracker.debian.org/tracker/CVE-2023-49582  
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2024-40724   | https://security-tracker.debian.org/tracker/CVE-2024-40724  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2023-42366   | https://security-tracker.debian.org/tracker/CVE-2023-42366  
                       busybox | CVE-2023-42363   | https://security-tracker.debian.org/tracker/CVE-2023-42363  
                       busybox | CVE-2023-42365   | https://security-tracker.debian.org/tracker/CVE-2023-42365  
                       busybox | CVE-2023-42364   | https://security-tracker.debian.org/tracker/CVE-2023-42364  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                         expat | CVE-2024-45491   | https://security-tracker.debian.org/tracker/CVE-2024-45491  
                         expat | CVE-2024-45492   | https://security-tracker.debian.org/tracker/CVE-2024-45492  
                         expat | CVE-2024-45490   | https://security-tracker.debian.org/tracker/CVE-2024-45490  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-5118    | https://security-tracker.debian.org/tracker/CVE-2016-5118   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                   imagemagick | CVE-2024-41817   | https://security-tracker.debian.org/tracker/CVE-2024-41817  
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       libcurl | CVE-2024-32928   | https://security-tracker.debian.org/tracker/CVE-2024-32928  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2024-37370   | https://security-tracker.debian.org/tracker/CVE-2024-37370  
                       libkrb5 | CVE-2024-37371   | https://security-tracker.debian.org/tracker/CVE-2024-37371  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                       mbedtls | CVE-2024-45157   | https://security-tracker.debian.org/tracker/CVE-2024-45157  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mupdf | CVE-2024-24258   | https://security-tracker.debian.org/tracker/CVE-2024-24258  
                         mupdf | CVE-2024-24259   | https://security-tracker.debian.org/tracker/CVE-2024-24259  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                      netatalk | CVE-2024-38439   | https://security-tracker.debian.org/tracker/CVE-2024-38439  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                        opensc | CVE-2024-45618   | https://security-tracker.debian.org/tracker/CVE-2024-45618  
                        opensc | CVE-2024-45616   | https://security-tracker.debian.org/tracker/CVE-2024-45616  
                        opensc | CVE-2024-45615   | https://security-tracker.debian.org/tracker/CVE-2024-45615  
                        opensc | CVE-2024-45617   | https://security-tracker.debian.org/tracker/CVE-2024-45617  
                        opensc | CVE-2024-45619   | https://security-tracker.debian.org/tracker/CVE-2024-45619  
                        opensc | CVE-2024-45620   | https://security-tracker.debian.org/tracker/CVE-2024-45620  
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                           orc | CVE-2024-40897   | https://security-tracker.debian.org/tracker/CVE-2024-40897  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2022-4900    | https://security-tracker.debian.org/tracker/CVE-2022-4900   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                       python3 | CVE-2024-6232    | https://security-tracker.debian.org/tracker/CVE-2024-6232   
                       python3 | CVE-2024-7592    | https://security-tracker.debian.org/tracker/CVE-2024-7592   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                       qt5base | CVE-2011-3193    | https://security-tracker.debian.org/tracker/CVE-2011-3193   
                       qt5base | CVE-2012-6093    | https://security-tracker.debian.org/tracker/CVE-2012-6093   
                       qt5base | CVE-2014-0190    | https://security-tracker.debian.org/tracker/CVE-2014-0190   
                       qt5base | CVE-2015-1290    | https://security-tracker.debian.org/tracker/CVE-2015-1290   
                       qt5base | CVE-2017-10904   | https://security-tracker.debian.org/tracker/CVE-2017-10904  
                       qt5base | CVE-2017-10905   | https://security-tracker.debian.org/tracker/CVE-2017-10905  
                       qt5base | CVE-2018-21035   | https://security-tracker.debian.org/tracker/CVE-2018-21035  
                       qt5base | CVE-2018-19869   | https://security-tracker.debian.org/tracker/CVE-2018-19869  
                       qt5base | CVE-2018-19871   | https://security-tracker.debian.org/tracker/CVE-2018-19871  
                       qt5base | CVE-2018-19870   | https://security-tracker.debian.org/tracker/CVE-2018-19870  
                       qt5base | CVE-2018-19873   | https://security-tracker.debian.org/tracker/CVE-2018-19873  
                       qt5base | CVE-2020-0570    | https://security-tracker.debian.org/tracker/CVE-2020-0570   
                       qt5base | CVE-2020-17507   | https://security-tracker.debian.org/tracker/CVE-2020-17507  
                       qt5base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt5base | CVE-2023-32762   | https://security-tracker.debian.org/tracker/CVE-2023-32762  
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-38023   | https://security-tracker.debian.org/tracker/CVE-2022-38023  
                        samba4 | CVE-2022-37966   | https://security-tracker.debian.org/tracker/CVE-2022-37966  
                        samba4 | CVE-2022-37967   | https://security-tracker.debian.org/tracker/CVE-2022-37967  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                          wget | CVE-2024-38428   | https://security-tracker.debian.org/tracker/CVE-2024-38428  
                     wireshark | CVE-2024-8250    | https://security-tracker.debian.org/tracker/CVE-2024-8250   
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2024.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                     angularjs | CVE-2024-8373    | https://security-tracker.debian.org/tracker/CVE-2024-8373   
                     angularjs | CVE-2024-8372    | https://security-tracker.debian.org/tracker/CVE-2024-8372   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                           apr | CVE-2023-49582   | https://security-tracker.debian.org/tracker/CVE-2023-49582  
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2024-40724   | https://security-tracker.debian.org/tracker/CVE-2024-40724  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2023-1972    | https://security-tracker.debian.org/tracker/CVE-2023-1972   
                      binutils | CVE-2023-25586   | https://security-tracker.debian.org/tracker/CVE-2023-25586  
                      binutils | CVE-2023-25585   | https://security-tracker.debian.org/tracker/CVE-2023-25585  
                      binutils | CVE-2023-25588   | https://security-tracker.debian.org/tracker/CVE-2023-25588  
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2023-42366   | https://security-tracker.debian.org/tracker/CVE-2023-42366  
                       busybox | CVE-2023-42363   | https://security-tracker.debian.org/tracker/CVE-2023-42363  
                       busybox | CVE-2023-42365   | https://security-tracker.debian.org/tracker/CVE-2023-42365  
                       busybox | CVE-2023-42364   | https://security-tracker.debian.org/tracker/CVE-2023-42364  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2024-0684    | https://security-tracker.debian.org/tracker/CVE-2024-0684   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                         expat | CVE-2024-45491   | https://security-tracker.debian.org/tracker/CVE-2024-45491  
                         expat | CVE-2024-45492   | https://security-tracker.debian.org/tracker/CVE-2024-45492  
                         expat | CVE-2024-45490   | https://security-tracker.debian.org/tracker/CVE-2024-45490  
                        ffmpeg | CVE-2022-48434   | https://security-tracker.debian.org/tracker/CVE-2022-48434  
                        ffmpeg | CVE-2022-3341    | https://security-tracker.debian.org/tracker/CVE-2022-3341   
                        ffmpeg | CVE-2022-3109    | https://security-tracker.debian.org/tracker/CVE-2022-3109   
                        ffmpeg | CVE-2023-47470   | https://security-tracker.debian.org/tracker/CVE-2023-47470  
                        ffmpeg | CVE-2023-46407   | https://security-tracker.debian.org/tracker/CVE-2023-46407  
                        ffmpeg | CVE-2024-22860   | https://security-tracker.debian.org/tracker/CVE-2024-22860  
                        ffmpeg | CVE-2024-22862   | https://security-tracker.debian.org/tracker/CVE-2024-22862  
                        ffmpeg | CVE-2024-22861   | https://security-tracker.debian.org/tracker/CVE-2024-22861  
                        ffmpeg | CVE-2024-7272    | https://security-tracker.debian.org/tracker/CVE-2024-7272   
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-5118    | https://security-tracker.debian.org/tracker/CVE-2016-5118   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                   imagemagick | CVE-2024-41817   | https://security-tracker.debian.org/tracker/CVE-2024-41817  
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       libcurl | CVE-2024-32928   | https://security-tracker.debian.org/tracker/CVE-2024-32928  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2024-37370   | https://security-tracker.debian.org/tracker/CVE-2024-37370  
                       libkrb5 | CVE-2024-37371   | https://security-tracker.debian.org/tracker/CVE-2024-37371  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                       libpcap | CVE-2023-7256    | https://security-tracker.debian.org/tracker/CVE-2023-7256   
                       libpcap | CVE-2024-8006    | https://security-tracker.debian.org/tracker/CVE-2024-8006   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                       mbedtls | CVE-2024-45157   | https://security-tracker.debian.org/tracker/CVE-2024-45157  
                         mdadm | CVE-2023-28736   | https://security-tracker.debian.org/tracker/CVE-2023-28736  
                         mdadm | CVE-2023-28938   | https://security-tracker.debian.org/tracker/CVE-2023-28938  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nano | CVE-2024-5742    | https://security-tracker.debian.org/tracker/CVE-2024-5742   
                          nasm | CVE-2022-46456   | https://security-tracker.debian.org/tracker/CVE-2022-46456  
                      netatalk | CVE-2024-38439   | https://security-tracker.debian.org/tracker/CVE-2024-38439  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                        opensc | CVE-2024-45618   | https://security-tracker.debian.org/tracker/CVE-2024-45618  
                        opensc | CVE-2024-45616   | https://security-tracker.debian.org/tracker/CVE-2024-45616  
                        opensc | CVE-2024-45615   | https://security-tracker.debian.org/tracker/CVE-2024-45615  
                        opensc | CVE-2024-45617   | https://security-tracker.debian.org/tracker/CVE-2024-45617  
                        opensc | CVE-2024-45619   | https://security-tracker.debian.org/tracker/CVE-2024-45619  
                        opensc | CVE-2024-45620   | https://security-tracker.debian.org/tracker/CVE-2024-45620  
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                           orc | CVE-2024-40897   | https://security-tracker.debian.org/tracker/CVE-2024-40897  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2022-4900    | https://security-tracker.debian.org/tracker/CVE-2022-4900   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                       python3 | CVE-2024-6232    | https://security-tracker.debian.org/tracker/CVE-2024-6232   
                       python3 | CVE-2024-7592    | https://security-tracker.debian.org/tracker/CVE-2024-7592   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2023-6683    | https://security-tracker.debian.org/tracker/CVE-2023-6683   
                          qemu | CVE-2023-6693    | https://security-tracker.debian.org/tracker/CVE-2023-6693   
                          qemu | CVE-2023-5088    | https://security-tracker.debian.org/tracker/CVE-2023-5088   
                          qemu | CVE-2023-3019    | https://security-tracker.debian.org/tracker/CVE-2023-3019   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                          qemu | CVE-2024-3567    | https://security-tracker.debian.org/tracker/CVE-2024-3567   
                       qt6base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt6base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-38023   | https://security-tracker.debian.org/tracker/CVE-2022-38023  
                        samba4 | CVE-2022-37966   | https://security-tracker.debian.org/tracker/CVE-2022-37966  
                        samba4 | CVE-2022-37967   | https://security-tracker.debian.org/tracker/CVE-2022-37967  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                          wget | CVE-2024-38428   | https://security-tracker.debian.org/tracker/CVE-2024-38428  
                     wireshark | CVE-2024-8250    | https://security-tracker.debian.org/tracker/CVE-2024-8250   
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2024.05.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                     angularjs | CVE-2024-8373    | https://security-tracker.debian.org/tracker/CVE-2024-8373   
                     angularjs | CVE-2024-8372    | https://security-tracker.debian.org/tracker/CVE-2024-8372   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                           apr | CVE-2023-49582   | https://security-tracker.debian.org/tracker/CVE-2023-49582  
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2024-40724   | https://security-tracker.debian.org/tracker/CVE-2024-40724  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2023-42366   | https://security-tracker.debian.org/tracker/CVE-2023-42366  
                       busybox | CVE-2023-42363   | https://security-tracker.debian.org/tracker/CVE-2023-42363  
                       busybox | CVE-2023-42365   | https://security-tracker.debian.org/tracker/CVE-2023-42365  
                       busybox | CVE-2023-42364   | https://security-tracker.debian.org/tracker/CVE-2023-42364  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                        clamav | CVE-2024-20506   | https://security-tracker.debian.org/tracker/CVE-2024-20506  
                        clamav | CVE-2024-20505   | https://security-tracker.debian.org/tracker/CVE-2024-20505  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2024-0684    | https://security-tracker.debian.org/tracker/CVE-2024-0684   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                         expat | CVE-2024-45491   | https://security-tracker.debian.org/tracker/CVE-2024-45491  
                         expat | CVE-2024-45492   | https://security-tracker.debian.org/tracker/CVE-2024-45492  
                         expat | CVE-2024-45490   | https://security-tracker.debian.org/tracker/CVE-2024-45490  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         grub2 | CVE-2023-4001    | https://security-tracker.debian.org/tracker/CVE-2023-4001   
                         grub2 | CVE-2024-1048    | https://security-tracker.debian.org/tracker/CVE-2024-1048   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-5118    | https://security-tracker.debian.org/tracker/CVE-2016-5118   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                   imagemagick | CVE-2024-41817   | https://security-tracker.debian.org/tracker/CVE-2024-41817  
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       libcurl | CVE-2024-32928   | https://security-tracker.debian.org/tracker/CVE-2024-32928  
                       libcurl | CVE-2024-7264    | https://security-tracker.debian.org/tracker/CVE-2024-7264   
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2024-37370   | https://security-tracker.debian.org/tracker/CVE-2024-37370  
                       libkrb5 | CVE-2024-37371   | https://security-tracker.debian.org/tracker/CVE-2024-37371  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                       libpcap | CVE-2023-7256    | https://security-tracker.debian.org/tracker/CVE-2023-7256   
                       libpcap | CVE-2024-8006    | https://security-tracker.debian.org/tracker/CVE-2024-8006   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                       mbedtls | CVE-2024-45157   | https://security-tracker.debian.org/tracker/CVE-2024-45157  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nano | CVE-2024-5742    | https://security-tracker.debian.org/tracker/CVE-2024-5742   
                          nasm | CVE-2023-31722   | https://security-tracker.debian.org/tracker/CVE-2023-31722  
                      netatalk | CVE-2024-38439   | https://security-tracker.debian.org/tracker/CVE-2024-38439  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                        opensc | CVE-2024-45618   | https://security-tracker.debian.org/tracker/CVE-2024-45618  
                        opensc | CVE-2024-45616   | https://security-tracker.debian.org/tracker/CVE-2024-45616  
                        opensc | CVE-2024-45615   | https://security-tracker.debian.org/tracker/CVE-2024-45615  
                        opensc | CVE-2024-45617   | https://security-tracker.debian.org/tracker/CVE-2024-45617  
                        opensc | CVE-2024-45619   | https://security-tracker.debian.org/tracker/CVE-2024-45619  
                        opensc | CVE-2024-45620   | https://security-tracker.debian.org/tracker/CVE-2024-45620  
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                           orc | CVE-2024-40897   | https://security-tracker.debian.org/tracker/CVE-2024-40897  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2022-4900    | https://security-tracker.debian.org/tracker/CVE-2022-4900   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                    postgresql | CVE-2024-7348    | https://security-tracker.debian.org/tracker/CVE-2024-7348   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                       python3 | CVE-2024-6232    | https://security-tracker.debian.org/tracker/CVE-2024-6232   
                       python3 | CVE-2024-7592    | https://security-tracker.debian.org/tracker/CVE-2024-7592   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                          qemu | CVE-2024-3567    | https://security-tracker.debian.org/tracker/CVE-2024-3567   
                       qt6base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt6base | CVE-2023-33285   | https://security-tracker.debian.org/tracker/CVE-2023-33285  
                       qt6base | CVE-2023-32762   | https://security-tracker.debian.org/tracker/CVE-2023-32762  
                       qt6base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt6base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt6base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt6base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt6base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt6base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-38023   | https://security-tracker.debian.org/tracker/CVE-2022-38023  
                        samba4 | CVE-2022-37966   | https://security-tracker.debian.org/tracker/CVE-2022-37966  
                        samba4 | CVE-2022-37967   | https://security-tracker.debian.org/tracker/CVE-2022-37967  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                          wget | CVE-2024-38428   | https://security-tracker.debian.org/tracker/CVE-2024-38428  
                     wireshark | CVE-2024-8250    | https://security-tracker.debian.org/tracker/CVE-2024-8250   
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2024.08.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                     angularjs | CVE-2024-8373    | https://security-tracker.debian.org/tracker/CVE-2024-8373   
                     angularjs | CVE-2024-8372    | https://security-tracker.debian.org/tracker/CVE-2024-8372   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                           apr | CVE-2023-49582   | https://security-tracker.debian.org/tracker/CVE-2023-49582  
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2024-40724   | https://security-tracker.debian.org/tracker/CVE-2024-40724  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2023-42366   | https://security-tracker.debian.org/tracker/CVE-2023-42366  
                       busybox | CVE-2023-42363   | https://security-tracker.debian.org/tracker/CVE-2023-42363  
                       busybox | CVE-2023-42365   | https://security-tracker.debian.org/tracker/CVE-2023-42365  
                       busybox | CVE-2023-42364   | https://security-tracker.debian.org/tracker/CVE-2023-42364  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2024-0684    | https://security-tracker.debian.org/tracker/CVE-2024-0684   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                         expat | CVE-2024-45491   | https://security-tracker.debian.org/tracker/CVE-2024-45491  
                         expat | CVE-2024-45492   | https://security-tracker.debian.org/tracker/CVE-2024-45492  
                         expat | CVE-2024-45490   | https://security-tracker.debian.org/tracker/CVE-2024-45490  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-5118    | https://security-tracker.debian.org/tracker/CVE-2016-5118   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                   imagemagick | CVE-2024-41817   | https://security-tracker.debian.org/tracker/CVE-2024-41817  
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       libcurl | CVE-2024-32928   | https://security-tracker.debian.org/tracker/CVE-2024-32928  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2024-37370   | https://security-tracker.debian.org/tracker/CVE-2024-37370  
                       libkrb5 | CVE-2024-37371   | https://security-tracker.debian.org/tracker/CVE-2024-37371  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                       libpcap | CVE-2023-7256    | https://security-tracker.debian.org/tracker/CVE-2023-7256   
                       libpcap | CVE-2024-8006    | https://security-tracker.debian.org/tracker/CVE-2024-8006   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                       mbedtls | CVE-2024-45157   | https://security-tracker.debian.org/tracker/CVE-2024-45157  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mupdf | CVE-2024-24258   | https://security-tracker.debian.org/tracker/CVE-2024-24258  
                         mupdf | CVE-2024-24259   | https://security-tracker.debian.org/tracker/CVE-2024-24259  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                      netatalk | CVE-2024-38439   | https://security-tracker.debian.org/tracker/CVE-2024-38439  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                        opensc | CVE-2024-45618   | https://security-tracker.debian.org/tracker/CVE-2024-45618  
                        opensc | CVE-2024-45616   | https://security-tracker.debian.org/tracker/CVE-2024-45616  
                        opensc | CVE-2024-45615   | https://security-tracker.debian.org/tracker/CVE-2024-45615  
                        opensc | CVE-2024-45617   | https://security-tracker.debian.org/tracker/CVE-2024-45617  
                        opensc | CVE-2024-45619   | https://security-tracker.debian.org/tracker/CVE-2024-45619  
                        opensc | CVE-2024-45620   | https://security-tracker.debian.org/tracker/CVE-2024-45620  
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                           orc | CVE-2024-40897   | https://security-tracker.debian.org/tracker/CVE-2024-40897  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2022-4900    | https://security-tracker.debian.org/tracker/CVE-2022-4900   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                       python3 | CVE-2024-6232    | https://security-tracker.debian.org/tracker/CVE-2024-6232   
                       python3 | CVE-2024-7592    | https://security-tracker.debian.org/tracker/CVE-2024-7592   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                       qt5base | CVE-2011-3193    | https://security-tracker.debian.org/tracker/CVE-2011-3193   
                       qt5base | CVE-2012-6093    | https://security-tracker.debian.org/tracker/CVE-2012-6093   
                       qt5base | CVE-2014-0190    | https://security-tracker.debian.org/tracker/CVE-2014-0190   
                       qt5base | CVE-2015-1290    | https://security-tracker.debian.org/tracker/CVE-2015-1290   
                       qt5base | CVE-2017-10904   | https://security-tracker.debian.org/tracker/CVE-2017-10904  
                       qt5base | CVE-2017-10905   | https://security-tracker.debian.org/tracker/CVE-2017-10905  
                       qt5base | CVE-2018-21035   | https://security-tracker.debian.org/tracker/CVE-2018-21035  
                       qt5base | CVE-2018-19869   | https://security-tracker.debian.org/tracker/CVE-2018-19869  
                       qt5base | CVE-2018-19871   | https://security-tracker.debian.org/tracker/CVE-2018-19871  
                       qt5base | CVE-2018-19870   | https://security-tracker.debian.org/tracker/CVE-2018-19870  
                       qt5base | CVE-2018-19873   | https://security-tracker.debian.org/tracker/CVE-2018-19873  
                       qt5base | CVE-2020-0570    | https://security-tracker.debian.org/tracker/CVE-2020-0570   
                       qt5base | CVE-2020-17507   | https://security-tracker.debian.org/tracker/CVE-2020-17507  
                       qt5base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt5base | CVE-2023-32762   | https://security-tracker.debian.org/tracker/CVE-2023-32762  
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-38023   | https://security-tracker.debian.org/tracker/CVE-2022-38023  
                        samba4 | CVE-2022-37966   | https://security-tracker.debian.org/tracker/CVE-2022-37966  
                        samba4 | CVE-2022-37967   | https://security-tracker.debian.org/tracker/CVE-2022-37967  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                          wget | CVE-2024-38428   | https://security-tracker.debian.org/tracker/CVE-2024-38428  
                     wireshark | CVE-2024-8250    | https://security-tracker.debian.org/tracker/CVE-2024-8250   
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
