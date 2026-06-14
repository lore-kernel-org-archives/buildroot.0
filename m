Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A47BCD98CF
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 03:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98620841E8;
	Sun, 14 Jun 2026 03:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCw321W58Wgp; Sun, 14 Jun 2026 03:27:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32E55841F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781407665;
	bh=22xVndabvt5MR8hfLbleKxXhMFWTOTy10lneicpxqow=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M2k+TiU2zPZqDljwnvWWWkAuQGxiEXmxPUu+x9DiYACHDldYMelskFXQu/QL+kr7m
	 YwSXLCq/I01fICgUPoDzdFAERHWvHnbhHLta51I0hfWXQuHxRTx2Uxt7RReoxT+27z
	 uNbrOaIMmR8cu/elRy0t+3iszMFKkJgfNqtD0kt0qAnDSCNlHiaiFk9U3Blja6W/pe
	 MkkX86gFwgo2Qnx5wRR8RTKI7z21Z3AoNTpBYNoqPrnIu3UMV9NzOJb8sqoUTUqgoX
	 wbNFmZ8X5YtYzQE1H+gEXIS3Oj5E71oOVbDSIjZSvFp+pbGlI6h/bCP+N8yYua8opD
	 56T3iL5rzwD/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32E55841F0;
	Sun, 14 Jun 2026 03:27:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ADD202EF
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 03:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FB68410B1
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 03:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8MmfK4v-pY94 for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 03:27:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D5C79410AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5C79410AD
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5C79410AD
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 03:27:40 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-45eee266c6cso1914328f8f.1
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 20:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781407659; x=1782012459;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MTIwbdkrkxmE0GQG3aupto18V+xPZavjnZ3h47jahVU=;
 b=SUZqXEsSXhbdrbAEsptwkyVUk1/Cm6QbRKfyJ/S2XpGrBUOMuGpBejYl47Uck6dIiq
 1WVjW6QAiFHDJnNxOnc2clNiFmAm7QF7P6wo/VGecTbtlDFBRG0HdTXaFso/kXWMXxwh
 B0EzdZ7dauqwqvw4fMlBt9hiyEzWTGmN0HkQ31xRpFQsQPtZjWObb/XqnNrRsu77Jba5
 Ft4QjiaXxfIvJ0d122iru5Z7Me2yVwhyE0R0UogOTqObB6fJPdtfeO5bDRhaJltxoPOI
 hAbOCGon4gBEifbWCbSMw+kp+5BKgJY+T2VKciTnuFqpfmzM1N5JRwdNJFIqFoISTyMO
 1A0A==
X-Gm-Message-State: AOJu0Yyd/zlhU1QqZonlPw+J/l6jRkr2Xd+I4YERjFFrEAp4qWqrKZVL
 s+NxdkCyVky9lVJE+kB75IRfUmFcvaMH21UB22+F14gyytpamDiswDs1+f6+rhUt
X-Gm-Gg: Acq92OGDO/xDRUAgFHBfnu7g5peiUH4nGwSdRzF5iQEzSBX01nVgZBQMrhMCtrE61AC
 MqvajE9QseRkGSxwB91Uflph4HXeEW0KZIdVUUbUE7COX15Vr3bjmOUXiFJ0WLtVdQcX9cVFo6/
 3UuFtG5aWavEUEPY2aABhSTxEUKPiCyz/hMNPlE3A5Skje04+c5aY9pk1cbVs54taPHUg3+3Tby
 fRfk8t57iiFcFWI4gU+X6Tlgd0sEAcw9ERgGoufDcCt0uJjmvAw16Q1CVmgZVQLEf6ZhLYySLBa
 ntJeqJvYQzCwKquJPUmVo6O/xMyzdMQ2Rq8N4cz+i5rFGgsrXzYDuT92AMapqYGMrsk6A/rB+KM
 4m2JFL2BX5ZVlwc86q3M7rjndGqtrTBZe71TVq3oG/xBQ5hsnDyM9G4sj+LhnqAD9YqdYIIECxL
 pB55mV8H8a6kDk6wX8qgLPsOrejQ==
X-Received: by 2002:a05:6000:1868:b0:460:3210:4349 with SMTP id
 ffacd0b85a97d-4607ec0bfccmr7366742f8f.42.1781407658188; 
 Sat, 13 Jun 2026 20:27:38 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26392esm20854352f8f.3.2026.06.13.20.27.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2026 20:27:37 -0700 (PDT)
Message-ID: <6a2e1fa9.fc4d66b3.38d513.e0cd@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 14 Jun 2026 03:27:37 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781407659; x=1782012459; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=MTIwbdkrkxmE0GQG3aupto18V+xPZavjnZ3h47jahVU=;
 b=NaK9/hOgqRkFVwfUnrtC2vFb7V0xWkkB5NjSgMpcfzr1392krQtksjeljW+N8stfD4
 J/pHUfTQToXMQWY6ExWwFjY6jRI2hJ2Gy0a2mz512+8a6HAEhy50v/SWdrMm2WdgZk1X
 6QnU31uthMl7EGdSgcnK94dNxOweffXMFy2UCAjuhcL5gMO6JO7MBP4W6eodqb7RTGYV
 fLrMI7NkSWrX5G3xBKfJcHDRvjKpC/edBXsqvobSx+v0xJD9cn42XphWaontyOC85ugl
 07e/z1PeSnad0dL5x8MxqpHa1K1O74dp5FVXsL15937noB7rjXgixIEpWKr13XviptbH
 493w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=NaK9/hOg
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-13
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

Autobuild statistics for 2026-06-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 14  | 29  |  0  | 43  |
  2026.02.x  |  4  |  7  |  0  | 11  |
  2026.05.x  |  2  |  3  |  0  |  5  |
    master   | 64  | 283 |  0  | 347 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 24
              host-pahole-1.28 | 10
               host-dracut-110 | 9 
                host-odb-2.4.0 | 9 
            host-go-src-1.26.3 | 8 
      libabseil-cpp-20260107.1 | 7 
                   perl-5.42.2 | 6 
                       unknown | 6 
             dahdi-linux-3.3.0 | 5 
        edk2-edk2-stable202602 | 5 
              host-guile-3.0.9 | 5 
           libmicrohttpd-1.0.5 | 5 
uhttpd-15346de8d3ba42200249... | 5 
            gdk-pixbuf-2.42.12 | 4 
          host-binutils-2.45.1 | 4 
                  linux-7.0.11 | 4 
python-remi-2022.7.27-37-g1... | 4 
            18xx-ti-utils-R8.8 | 3 
amazon-ecr-credential-helpe... | 3 
                  ffmpeg-6.1.5 | 3 
                    frr-10.5.4 | 3 
  gobject-introspection-1.84.0 | 3 
                    grub2-2.14 | 3 
       host-gcc-initial-16.1.0 | 3 
host-vboot-utils-7dfa482d6a... | 3 
libfutils-c326ce0cc2a735438... | 3 
               linux-pam-1.7.2 | 3 
        ltp-testsuite-20260529 | 3 
                    olsr-0.9.8 | 3 
   openvmtools-11.3.5-18557794 | 3 
                 systemd-258.7 | 3 
                   ccrypt-1.11 | 2 
             cni-plugins-1.7.1 | 2 
               collectd-5.12.0 | 2 
              containerd-2.0.7 | 2 
                  delve-1.22.1 | 2 
             docker-cli-28.3.3 | 2 
 docker-credential-gcr-v2.1.30 | 2 
                enscript-1.6.6 | 2 
glibc-2.43-27-g4070d808bea1... | 2 
       host-gcc-initial-15.2.0 | 2 
host-google-breakpad-f49c2f... | 2 
                   i2pd-2.59.0 | 2 
            igd2-for-linux-2.2 | 2 
                  iozone-3.508 | 2 
                libsoup3-3.6.6 | 2 
libuci-f3fc0b76040685829191... | 2 
                   linux-tools | 2 
                openssh-10.3p1 | 2 
                  pdmenu-1.3.6 | 2 
            resiprocate-1.13.2 | 2 
           sane-backends-1.4.0 | 2 
                     shim-16.1 | 2 
           uboot-tools-2026.04 | 2 
ulog-0389d243352255f6182326... | 2 
x264-baee400fa9ced6f5481a72... | 2 
                     apr-1.7.6 | 1 
                   atop-2.12.1 | 1 
                     bc-1.08.2 | 1 
                  bcusdk-0.0.5 | 1 
                   bird-2.15.1 | 1 
                  broot-1.57.0 | 1 
                     cpio-2.15 | 1 
                   dante-1.4.4 | 1 
                 dmidecode-3.7 | 1 
docker-credential-acr-env-0... | 1 
                   duma-2.5.21 | 1 
              erlang-26.2.5.15 | 1 
              fftw-quad-3.3.10 | 1 
                      fio-3.42 | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
                     gdbm-1.26 | 1 
                  gnupg-1.4.23 | 1 
                 gnupg2-2.5.20 | 1 
                   guile-3.0.9 | 1 
                   gvfs-1.57.2 | 1 
                host-acl-2.3.2 | 1 
            host-binutils-2.44 | 1 
          host-binutils-2.46.0 | 1 
              host-bison-3.8.2 | 1 
    host-gcc-bare-metal-16.1.0 | 1 
host-gcc-initial-arc-2024.1... | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
                host-gmp-6.3.0 | 1 
    host-mender-artifact-4.2.0 | 1 
            host-mfgtools-0.02 | 1 
       host-nodejs-src-22.22.0 | 1 
         host-ti-cgt-pru-2.3.3 | 1 
               libglib2-2.86.5 | 1 
                libmpeg2-0.5.1 | 1 
               libselinux-3.10 | 1 
             libtorrent-0.15.3 | 1 
           libwebsockets-4.5.8 | 1 
                libxml2-2.15.3 | 1 
          lua-lunix-20220331-1 | 1 
               madplay-0.15.2b | 1 
                  mender-3.5.3 | 1 
            minizip-zlib-1.3.1 | 1 
                    ne10-1.2.1 | 1 
                  ntp-4.2.8p18 | 1 
                 octave-11.1.0 | 1 
                opendoas-6.8.2 | 1 
                 opensc-0.27.1 | 1 
                openscap-1.4.4 | 1 
            optee-client-4.9.0 | 1 
package/mender-update-modul... | 1 
      passt-2025_06_11.0293c6f | 1 
               pcsc-lite-2.1.0 | 1 
                 pixman-0.46.4 | 1 
               pulseaudio-17.0 | 1 
           python-zlmdb-23.1.1 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                  snmppp-3.6.5 | 1 
               snort3-3.11.1.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                  stunnel-5.78 | 1 
             superiotool-24.05 | 1 
              tailscale-1.78.1 | 1 
               tcf-agent-1.8.0 | 1 
            timescaledb-2.27.1 | 1 
                tinifier-4.1.0 | 1 
               valgrind-3.26.0 | 1 
            vorbis-tools-1.4.3 | 1 
                    which-2.23 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/5b473e51a76e585b2260f4dc84570696390affec |     
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/f22a6eae99187d076fb551557f88ba3c5db79fee |     
    i586     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/0d74bc15d43469ce5e2ac608486f7d81204feac7 |     
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/3f1ba83b28667d500d77c6b2d67a378aacc7d444 | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/52527408ddc411aa1eea7e7e6876e94b8886c47a | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/967475aa689ded0a6a7639d3717e4bb4905ad79f | ORPH
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/c539ed9380e1e740f33b47fdfea83d774a953b51 |     
    i686     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/bc42cffb717e262e14d51848bca65fbb562ba872 |     
   sparc     |           bc-1.08.2            | NOK | https://autobuild.buildroot.org/results/0d7f426522ef9bb811bdca932fb0618a90a73990 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/82a7ef721e97300d20af19a7202ea177b6facb19 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/c5e9f66b3428f2b453e30334fd061d2c837b0c5a |     
    i586     |          broot-1.57.0          | NOK | https://autobuild.buildroot.org/results/4f5c885dfefa3cf9f1b31ededac7a230ef6b3273 |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/a2dfa63e4e5685465c8d630056b1f65eaeb7f4ce | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/cbf15ac8345c8398f536c3fc6669798acb099a0a | ORPH
    i686     |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/4c13866e53087adf1e78ac0230b22fdae5c92d69 |     
    i686     |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/de215545918c2cc8419dd195615ead9163e38bb8 |     
    i686     |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/16a052b8902c3a47edf61586cf99f2b0b681793e | ORPH
    i686     |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/5e0969368ff0443c5f10bf0061211c2afa1b58b4 | ORPH
    i686     |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/26f94c5b77c6bae5654317c7db17a9c7948cf283 |     
    i686     |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/6b15fc2c969f68dc0ed185dd59c3e745cd85217d |     
    i686     |           cpio-2.15            | NOK | https://autobuild.buildroot.org/results/6687ce76fae9418f35a534b8aaf09744a5fe7520 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d3b7b0dc178ee2412550d2850ab7621b73d1eee3 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/492e979922b1a53950216efac3bc1604b0955a5a | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/57a0761d68ab329bbe714d09cc48a6e8b7c714e1 | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/87dac9dd2860abc40853085db7a5acf9da7a6034 | ORPH
  riscv64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/48318fb8b0a06439c575bfa8de8e4ac1515373d2 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f464f25593e4266545561866ef5a67c56b8c4f22 | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/2df033d1d14123a2f6560ab722f2d35f1ffe443e |     
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/b8d3e76ce64d5c47abe1213eb4d1f04b96ecc7c8 |     
    i686     |         dmidecode-3.7          | NOK | https://autobuild.buildroot.org/results/805c6bcca4425dd26fe1f99ddafcc062f26b2db1 |     
    i686     |       docker-cli-28.3.3        | NOK | https://autobuild.buildroot.org/results/846bb126d5cf48717b02f6521c7ef1730417ab37 |     
    i686     |       docker-cli-28.3.3        | NOK | https://autobuild.buildroot.org/results/06c48b0793e0b0c766a336edf2951f0be1e228a1 |     
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/f964a37039d76991faf74c9ab5c4c1f14b524837 | ORPH
    i686     | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/0584fd704ed53f50e06f52a0db860e8f68e2cba5 | ORPH
    i686     | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/fa7ef407458dd005c19fc053472972e0e9f63e56 | ORPH
    arm      |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/2f86c2c4f3ea7185076a79ed2861da8135e0bc72 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/4d8744ed67a772d0bea931eac1b150320dabebae |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/149f86eacc50dc848eef6d1aa7be534865d59f09 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/f8c1f10dbb579137ccb14279042c7dc2cb4236c3 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/bed931941510347032e3263348d7c193849e7f92 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/32428c435f159351c2c39a4afff7763c8257a850 |     
  aarch64    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/3b807dc55596fbc83a6cc229685e4a188359c290 | ORPH
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/8df1640cac809cd71228f95838b234619dc76775 | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/82aa00cef9a1534a6c45cfcc35169ab6076f6a00 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/09c263d34ec94054051650471baf697cbce57971 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/d6aa73919ccbc51cca451189c4a58a4fbc68f61f |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/448cd04ca1fd52746be206dc6b75a209aab61c79 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/9f33a35df02ee583a54a2920dba9b28b7542e4b0 | ORPH
    i686     |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/3f58a6138e5cc3e503582ff6cd2ffcece8974164 |     
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/a7625aa717d8808564c65d90d4c0e00794a4cddc |     
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/411b469f701733a46170a63212a8f8472647e992 |     
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/40adab52550c58976a013fe87c31f47fa9822fef |     
    i686     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | https://autobuild.buildroot.org/results/9c933a24931296815b3ff20b16577e90c1d4957c |     
microblazeel |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/bd285b77a1f82f4145d0afac30f5da79a3ce248d | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/db686e4a283bd51bcee81791597004aec889a8e9 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/7e5e4c98ad6c4a981fa20b76c0d53b523bdbcb26 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/3147d6d6cc1320a34f1c5e6cb9a11b5348c9dc5a | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/2e54dcf3afa1863d13f82548b73f5410d69c7df5 | ORPH
    mips     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/fdb484b044aa3a8aefd0352c6c7fcc480714632e |     
  riscv64    | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/b3ac1e8663ca5bea9893812d013b14adef785648 |     
    i686     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/c01044d0eace3eef8cd00cd8e9f2ab763115ed6b | ORPH
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/021e6eadc20b4bffa634e7177b71bc04c9d76512 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4929c9904fc6ad5e8af9c4930b858acbbf442cca | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7aac1ca3da6a3a94a931ed1a12e8c8a13e13cefa | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/01bdfd3a0cc36a65a72e3e5e2371d7f968d0602d | ORPH
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/fdffb7723daece356e3ba408ce3f5254f91622cd |     
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/98b104cfc71c24c14ffff4628c3e7213fc3fa367 |     
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/202d853b4f3da712373066abe6b4b7718f7c76a7 |     
powerpc64le  |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/75e277dd6717441ebc474d24046b8aae0af20d58 |     
powerpc64le  |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/c161819d14fbe3d999c9dceaa990095bff8f6529 | ORPH
    i686     |         host-acl-2.3.2         | NOK | https://autobuild.buildroot.org/results/7d01e6a15e90847afab89b880a661e92643d182f |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/43e46275c6a9fc35e6d564adb13a25fc82a1f84b |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/2356014ec2bd42d9bacb52880d01e921efce8ec0 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/68351b6b8304aa77c8a1fd8f7dc9a6759fb2d1ba |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/ddb5a27fbfabebb6934db1b82a995fb042568772 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/cf9eb983865ba013b6aca189ff80c85ed4e1c6f6 |     
    i686     |      host-binutils-2.46.0      | NOK | https://autobuild.buildroot.org/results/bd596f65b28997857c526a44de6bca1b4e67ec3f |     
    i686     |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/2d6ecd3793867886e41a1d32d819cc886eb58161 | ORPH
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/91b63ef644c27c68cd13bd68b3cfff918a070750 |     
  riscv64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/63267bb952865d8082d9f0e9e378f9aaf5a8e690 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/21d6bf6062ef6c39e388fe269c078ad0a925c84f |     
    arm      |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/cfb7a376d9ca8041419f45b5fec8f8a94f5aeab4 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/157b88e6f7cd58dc20b6ec7a6f11278ba736a7db |     
    i586     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/f5bb05a0a438cdcc2c606826ed86896a2cf23fc7 |     
   x86_64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/5a6501545f567d4767b84b144a7239f3f974e2a0 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/b1b7a054566badade6ad6d5432c4828fe937a85e |     
    i586     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/e82f92284a09ad1b697e25791dd62d9eb0582d54 |     
    i686     |   host-gcc-bare-metal-16.1.0   | NOK | https://autobuild.buildroot.org/results/1d9c3b0d17785b5cfe8651ee54f65bbe0deb6905 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/4a6650b70725e7bda9e76d11ee8767df1775e485 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/d4aeac122bf5a4e7778b66b5537ab248e167d60a |     
    i686     |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/6d12f6477e3b04afb8db2cc2ed41b6fd82b6ddf2 |     
    i686     |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/9343cd5eab2ded942ce6c75cbc04d41564ce732b |     
    i686     |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/bc40e9fa0f16b7e69fe6f3eff2c80470a7d0de31 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/240436e248a70bea07a6ec5aeeb3acd924cb2248 |     
  riscv64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/b6626fe9a95089b558a0303e1963d00a184c3c3f | ORPH
powerpc64le  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/ca93a35322d701cff8c1f265387fc8c8ebc41b0e | ORPH
    i686     |         host-gmp-6.3.0         | NOK | https://autobuild.buildroot.org/results/d406a4a26bdfdd8d3b457223583704224c9972b1 | ORPH
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/50b2bc0536cbf0e92fea1bd02867e1ba1982ae3c |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/8c746fa6c536f1d9155526b4873399b98bf94981 |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/54bbebdaddbbe084338f465fffaa1eb85d8b08ff |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/3d5f7c54850b54eb8bd054dd8aa3a1ec7bce2a54 |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/6a2a9aefb5b290c43701a56fd24218239de37244 |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/fbddaae8f5b5087f9540193c87bb5ba4f9a610b9 |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/9a4b0e5bda0bbfaad200a2effaea3a2070f69fa4 |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/ed82fdb55185b8ac792e5d1ffa315864261cf261 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a55da980b1ce5fc650a6965b1f8cd00b5b94620e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0f1ad76ecbd0aac3f8da724cad20eddce2cb3238 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4f77dd1582ffe751dea60b2d0db64c210da88e95 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/46be65daff8b221bb6eb2b2b7359d88f36303294 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/10d63f55614657b6a9848173c3242b3a11152a45 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0abaa7ceec13eb1ae46f12cf8bab9824a12abcd4 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1f44d1354d33db3c5073ae52fb818c213a62de13 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/19037a589c247703ec9cbb55aace531e453d65e1 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1ec29cfc935d15c1aebc1b582816c7f1d22db392 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1e6bec3018f040b1e2899609d6b5760d99a6f0f4 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5272a6ca0ec34cac98196b27e5442e5cbb9b5d09 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/95d6d08a54f659e5c464b727c493e63a1a1acd5c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/34e95bb8bed780f1d5242ec8107255ca37956e90 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/31a187cc615a48c10d65046a27a50742a374f226 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8ba97c9bd6b8ee3cc865ae83dc944db8b0943902 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7eb6889a3a9f560ce4c896d6757eafcb3a418db3 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/93f5ca179503686bf8b2a587ab3dc4018136958e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9b18cf6ddc314f4bfdebad7e8e6321fcb1a8afea | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7cf98d033289bb9d4a3ded421df48a2d12c6fe64 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/14c67161976feb5fce42ab051351ad2247af160e | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5e94fce0e3842df37fd9bbcb632e53541d81c330 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7abea7a861487e2d9ef20665c0a3dabd69b90ed6 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e4db92a3a7c8854a7ab347e8f4513e55dd579bb8 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/771007c4f54a768d3205b5394e0509ca80e81f95 | ORPH
  aarch64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/3d74d54b8b436c75f103222f1dbc04a305f488e4 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/ea1610e7324cfa8c13377efbc2b98d3dfafea7be |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/b8b980f1090f34d90c784727a4d53306b02a05e2 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/cd220dafdda37815bb4eefd0d8e694965f612a93 |     
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/13f052c146f289dc240803416d6825c05e194b3d |     
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/a680d5aaa7c4e061f4eaa4786ccb21fc4143ff5a |     
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/57729ce9ac4fadd3ee690a356dd5bf5e91ddd1f1 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/4ec0ab367061fb0840ba088fd9bb7a50b41f3c01 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/5130226ee5fb93174b1f8bc6e8f76728326f9489 |     
    i686     |    host-nodejs-src-22.22.0     | NOK | https://autobuild.buildroot.org/results/bd0a38b65d2418c2d3171d41546bd2546fd962ce |     
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/799365d96c20cadb1ff0832758b65836ed3a0391 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/6e9436e83fde5cbb097010320aec2680a2be5c31 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/820dd5dcffb9c9de10a12e81fa0e138c3b2810da | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/d8301ec3bb2cb0d1b54025be245930d0e0e81b67 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/f5a9d89a15e362a60077bebab0665c4446e891c4 | ORPH
microblazeel |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/6d5c5216c2f753901187af0a0203d24247a36cf4 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/675d8c545d253b098ed5d0d34440f258e51e5a7c | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/b72a39401ea4ac8dd8c5ffc83324dc61e60a3ead | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/125d4eea2a2ffec23fd77cf87d4e613fbc0453c9 | ORPH
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/35927f583a7914c0390a6194babb8eab18a63561 |     
  aarch64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/b6d2ea10edf27ebdcd69379d82c5f268e9d8ffdd |     
   xtensa    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/d43398b63460d8013ba76de814ff589c75b4dc60 |     
  mips64el   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/09e6fd51bf68b14a5dbf8b335b627803c42af5bb |     
    sh4      |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/85f836e8fa81051dbaa6b4fdb2f7b730939113d2 |     
   x86_64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/2b2f93239c0fd41010c6aa660f72dfaeb9ce0dd8 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/ebbe1065af23ed4abccf59ef2489373f935e3490 |     
    arm      |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/059553519a911c17fe647e7b0042a9bf6f21930c |     
powerpc64le  |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/02a0ba25d304fb14a1c13ad47c4612cb73570bd1 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/019555a78ff7035f4671fc38b44d6a2a3597c5a4 |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/7cd495e0238ea8910386706fc9d261393f8bd1e2 |     
   x86_64    | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/86f6c27f56a5ffb8dd1d9f08444d46d46617d955 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/9e4368d1b4f0f72e200d5c3fbdb694b7b1a4e8d9 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/abd018bf0e02c705f034019bccdc00dce8afb291 |     
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/6b08664d20206baf7ecc242ac0a5405b2ca90373 |     
  aarch64    |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/659befbdbfacba0781b9ba8c694d87d0fbc8d601 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/25e3ea1e60480597178c0a19f0f44491ab138b61 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/c2833ce1f480a31d9d7738ee0cbf6c81e64a4fff |     
    i586     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/64360a8347e2014af758b737056295568cf759fa |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/394d48558c412b756771f75f57f6c584fc9f090b |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/3e8af4bffb2282f32ca10e73a670302771ccbc85 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/91557a389c0ccb68c1c0b583b2e61b5904a3f307 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/51f17b40187c2fa2709de7681a88eca779504be1 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/7d58a62ba87884d3f41e12d9cc1827ace67be1f1 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/9a8b9476d00489b402a1d24857262695777511b4 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/c393748c88a923d320837eb0de2402f20370460e |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/633760647dbe53380c7d44834fa98fafca9a8f11 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/26e1c3ed8468fd4a76941e5f9cd95bd3c288a510 |     
  sparc64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/582d03f2359cadd5a621a0aae045f58b2d478ca8 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/39a9600a05da07279b4233f3606e84ee89c4a163 |     
    i686     |        libglib2-2.86.5         | NOK | https://autobuild.buildroot.org/results/8ca27a6dfd0bc0badd2b2e1f2cbf21ce36a65cdf |     
    i686     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/ddb76fe81a7526ed9305be46a6ff1fde3720ae6f |     
  riscv64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/e7ddf37b139512ab47a7a4a5c4d30af51b6328b7 |     
  mips64el   |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/13702b30b0e2f1b9c55ef7e021485c8655cffe2b |     
    i686     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/d618a9e07adb1f930418d26b626929909ce69261 |     
  mips64el   |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/08261e96102a8bcb209ff5f8c9202ecb4b8a9700 |     
    i686     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/f4bf95b0e8a86e284cf74c0fa2d3e3089e3bd52b | ORPH
   x86_64    |        libselinux-3.10         | NOK | https://autobuild.buildroot.org/results/684a779841c26499f2b28f74edf183c73d12773b |     
    i586     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/c8537c57bb80c5ccd7f077857384d8f32a8e6c94 |     
    i686     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/8f4114bf7513abaaaca4785c9785d1dae86b18bb |     
    i686     |       libtorrent-0.15.3        | NOK | https://autobuild.buildroot.org/results/2495d55630ac31c3b3848079eecfa4d619509ed9 | ORPH
    i686     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/e797b2ce335fcf6ba2219b9333da0a57d7e92a51 |     
    arm      | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/68d16c312c9da48088a638aabad441e69f5e3789 |     
    arm      |      libwebsockets-4.5.8       | NOK | https://autobuild.buildroot.org/results/e4a1838e8bae371a54ec0d3ad60494785b413ed9 |     
    m68k     |         libxml2-2.15.3         | NOK | https://autobuild.buildroot.org/results/bb788256ab775a958572b1ea7402443bb96674cc |     
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/235117082429cf6e3b686e9a192501216b84f6cb | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/0545fef59f8ca46c799f8ec499f471ae241eb16b | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/18ed50464d1cf07937c9ebfe20ea61062d9d3f16 | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/f6de5755e4e2bd8932a834df8b86d3b5a71cdde8 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/ce20c52c8972e9d836d033913d2a913120df4549 | ORPH
    mips     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/95ed946d46e0b6de6b1fee977809dd88fee119fe | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/b5c367d5ef74d9cd2dcb4a799a004ff30511bfc2 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/78fb0a06394076a0d071363073814c1f74841434 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/dca628fbcd182897f582764a470906a9a90d2c43 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/f5f1eff32c2adbafe719d4497e6c2422d4feb4ce |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/2d31852738826d361b39b57b5fe564f950e61e4a |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/50d52b007c55c94896caa891bf93662d742f0cb2 |     
  aarch64    |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/a753b918426347a3dcb064dce42e8221e91d6364 |     
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/047fcc7482fe052fbd60ed62ffe0ff3fd245ef73 | ORPH
  riscv64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/53c20a4bd57455e02b099856772c2b3e96c60475 |     
  mips64el   |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/6a96a1621f17e9e54381368972579db6c26e8f1b |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/07599d434eef4b9c3ce7514f233fddbd3e6bee3c |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/1972c7c525dbe10535b80b75aa64ca9e0e70031d |     
    i686     |         octave-11.1.0          | NOK | https://autobuild.buildroot.org/results/6329bfa8ca618b4efd323939352c761ee5fef4ac |     
  riscv64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/e9a0f595748e1efdc758a527bd95dbf1f2e7b8cb | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/d226dcdccb641169a0b2d94b9257e9dc2f717e5a | ORPH
  mips64el   |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/968a6d28405a729bf18626a65d8f4fd2816d8b22 | ORPH
    i686     |         opendoas-6.8.2         | NOK | https://autobuild.buildroot.org/results/20e6de0a10ade06dd14d83a231465b9e96a8e0bd |     
    i686     |         opensc-0.27.1          | NOK | https://autobuild.buildroot.org/results/d882ca5b6edf105f8c90f61374d1704f0bd0d31d | ORPH
    i686     |         openscap-1.4.4         | NOK | https://autobuild.buildroot.org/results/5e2f8f71e8c34c294665c68ab3f5ca094d57bfb3 |     
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/40c7e71c021cfe387df826a4863223571ac98a63 | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/ff100b0240f22c012551b26d04f4e2708442be5c | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/6e6d6e54bd37a3c1a387d3859b3e1c10e658a0e2 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/a253f98d7cb87b31fa623988c5df6d435762eabf |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/338e012cacf71ad58d6135a88078e1982cc79652 |     
    i586     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/8c6064077187ac2b0a1aa660615dc5dc4ba7df35 |     
    i686     | package/mender-update-modul... | NOK | https://autobuild.buildroot.org/results/6c4c746a9500c08988204eaac36b2c5c9c612b62 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/6e6f67701dbfaa02fa51465cb6daf06ecda805f4 | ORPH
  mips64el   |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/39199d91baf828d33e8c5e2309fcfb7a0bc2768b | ORPH
  riscv64    |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/40ed45d9758c01e3e4505c0fde8175764d83f869 |     
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/fad74ebcac53b40c8d3c06c008425563f5c81b32 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/76e62f3eb08386880c70e0e392b79f720899f0ee |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/91c20bc268c7037024d3f368144f301f224ab379 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/3ecf230816e7618647b41ef154d262517684198e |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/f67a6638a6df07f694dec3b59c5c7a413eb2c416 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/264ff1c31b34ae69e1d03302bc942990fd956454 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/94da0db98649bdb0507f8fc79f84c1f16015b8c5 |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/fdd6e36d84f3ee2ff962ab0d91c356148cae0fdf | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/85f79ea8f053273f08002c6b27991fb6c6394f54 | ORPH
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/75e9baae0d5a4e2bc30351c08344c1d8612512d2 |     
  aarch64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/0db775574cf2d9cad558c0522155feb82c345c3a |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/9234a12fea3a5d7cacc6560113c38231324b1b25 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/20f6581b1e8b6bca0f6a0322fa3330ff3e08ad02 |     
  aarch64    |      python-zlmdb-23.1.1       | NOK | https://autobuild.buildroot.org/results/f93baed827e2ec86f335883c2024b23f9b519863 |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/46b335920cd19a05d6d1c3135362ca11e0f78b60 |     
powerpc64le  |       resiprocate-1.13.2       | NOK | https://autobuild.buildroot.org/results/0dff04847475e53c30c651cf63952ec100c5ccf0 | ORPH
    i686     |       resiprocate-1.13.2       | NOK | https://autobuild.buildroot.org/results/20ee97606cf58bdb9af56955a1feffa8291db999 | ORPH
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/29b0d27da19a87a817d11793bedde8a9c10497a4 |     
    i686     |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/1804f4f671761733ce86f606da58ac6ea63103f9 |     
   x86_64    |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/d13220fce94d18d24e7d89c9a48278e63401c150 |     
    i686     |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/562dfc96c76256b33a733635eaaedecff0d8ca4e |     
    i686     |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/9a8cc148ffd59403c428cc91392107cdfe8fbcee |     
powerpc64le  |          snmppp-3.6.5          | NOK | https://autobuild.buildroot.org/results/97909de623da780db5d89ab69e596714265e25f4 |     
    i686     |        snort3-3.11.1.0         | NOK | https://autobuild.buildroot.org/results/e8a9d787973fd109c07c185103de1f9f7339d506 |     
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/38859e53e02e1d2b490868cebfb0211e4dd4a012 |     
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/bf3d408836facaab79fcd020fb0d0ba73d61123e |     
    i686     |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/bfc504a5cfd170140cfa71fc17e767b887749eaa |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/bc47876663870693b0b430ee9ee4834905f2ae88 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/893e449d238059b76cbf8f890fc06075083a9ed9 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/84a615ed87bb0941c1658ea229b7e2a830de825e |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/8b8b43c03902458f015e761289422a9f2936627b |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/9392d019dd3f2b5c49699dfb53be85eaf834e545 |     
    i686     |       timescaledb-2.27.1       | NOK | https://autobuild.buildroot.org/results/d1d53dee6997e82eebf40c1a21e969d8cb87f803 |     
    i686     |         tinifier-4.1.0         | NOK | https://autobuild.buildroot.org/results/7fca9c76fa38ab604230fbf18d2962acfa6ade62 |     
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/87539c5d27b310f98a24c3ca51cf40b3b090e780 | ORPH
powerpc64le  |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/c34538c49548d2d0f79a4a4eb97e12ddaf2ae5ae | ORPH
   x86_64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/5190937692d1f34e567b31c0e83a820fdca3d20f | ORPH
    i586     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/65405621a1a929f0f36f7248daacd21c0a9a1859 | ORPH
   sh4aeb    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/d4a6de22267bf3d1c8c851055c291a7030d9dfd5 | ORPH
  aarch64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/b63a347dad945f62227e788828425837e79810ff | ORPH
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/a6031c3e4906f35193e3cf1b5c2cc97f991ccf45 | ORPH
powerpc64le  | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/19974be92f00d8720a865e6decd6657d31f29b8d |     
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/f684ac348fbad2b923a6e989c557d9f1d27dd489 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/dab4f6bedd9c437990ee9647f6a599a76f9aa53c |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/02c244bfce555da45feb5e51960a62535608dd5f |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/55b8e71a658047e9f06106117c43dc2ea4980a7a |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/b7f5013262ef5ee98948d07058800e8e6275d544 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/41b41d24b437b3e8ee7521a1d6274960cf51e34d |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/069b72eb5b6b077000e1d4498dbb72c05f991815 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/34c5f985f24ebb534dfabeaf9c5eeef2ecd4b56f | ORPH
    i686     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/55f6121dac9fd2f33503a4e84303949d68b9ed46 | ORPH
  aarch64    |           which-2.23           | NOK | https://autobuild.buildroot.org/results/cbd31f399a40238c8f866761850ffc396cb3ed51 | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/ba75cc3815e52b268a4fd7d881c669868313d572 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/d92461f0eabc5ef6790fb78be38bc34629e7c814 |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/445c5cb1c2fc2803b49a5e5c43f5dd29ce255b96 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                   guile-3.0.9 | 1 
   python-pydantic-core-2.46.3 | 1 
          refpolicy-2.20250923 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/5ad098e21c7835ef402efd72a06ff4377033f768 |     
    i586     |  python-pydantic-core-2.46.3   | NOK | https://autobuild.buildroot.org/results/b592b1d64f876a566432e35689c6dc1c5c4cbb61 |     
  aarch64    |      refpolicy-2.20250923      | NOK | https://autobuild.buildroot.org/results/765e08a79740c686d6d0d9337eff5172afd91071 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

      libabseil-cpp-20260107.1 | 2 
cegui-e7a03afc70c6182a091ff... | 1 
      docker-cli-buildx-0.25.0 | 1 
                   guile-3.0.9 | 1 
        ltp-testsuite-20250930 | 1 
          sphinxbase-5prealpha | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/cae4df131b4659d734754144503b2512939762b1 |     
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/b2a62efcd849d834fa52292ef523af39a54958f1 | ORPH
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/3045283709898248280b2289e1e0925fa06b2dea |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/e7c25a6ea9a7692c470e91a411e9791787338ec4 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/47cba179080eef8b2f5c54fd577019e1836f077b |     
    i686     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/6322759adb6eb49c3cd5d72cc81dd10dc395ad67 |     
    i686     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/25101030795fff7a3726c069be7e7eeea3f0d70f |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

  gobject-introspection-1.82.0 | 3 
        host-python-lxml-5.3.0 | 3 
package/linux-headers/linux... | 2 
                   perl-5.40.4 | 2 
                freerdp-2.11.8 | 1 
            host-go-src-1.26.3 | 1 
 host-softether-4.30-9700-beta | 1 
                 libgee-0.20.6 | 1 
                 libssh-0.11.4 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
        ltp-testsuite-20250130 | 1 
            lttng-tools-2.13.8 | 1 
                memtest86-7.20 | 1 
            minizip-zlib-1.3.1 | 1 
                 openssh-9.9p2 | 1 
package/wine/wine.mk:347: w... | 1 
           python-numpy-1.25.0 | 1 
rtl8188eu-f42fc9c45d2086c41... | 1 
                 rtptools-1.22 | 1 
squeezelite-71c012ad9ba102f... | 1 
                 sudo-1.9.17p2 | 1 
                     wine-10.0 | 1 
           xtables-addons-3.24 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/de21b17806585f5b4ff36542ec3663d74bf475f3 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/0f36c49553d9e026361fd8fde3a7323220cc6ab4 | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/74acc59c7576cd509e6f3a0626b5215da57307e2 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/1f3991dc3e19aa77d9b98e99e1fc2ff5d027126c | ORPH
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/a1a642b8f3021651be9c1f3d080bed505d938b61 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/f23e7561dd13e5cbaa247a2112de7dc0e8a8c725 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/7638c4098e21550ad901c716dbe86e5913f910d5 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/32738ca0fadfb81022ba1a9116f086907f49e718 |     
    i686     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/113a87df9fc60c67d88e8847a2374a09da81aa1b |     
 powerpc64   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/9a9ee57f601e6d0274974db171e2fb7fff7334f0 |     
    i686     |         libssh-0.11.4          | NOK | https://autobuild.buildroot.org/results/0315d7065f0f3202359f6f2f97b526f149081a4e | ORPH
    i686     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/9393923e61f7311f38d2bb1e0130e89ad6be4e9e |     
  riscv64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/34a7d53efbfe2df6a6c74d38aeb7592ca391b18f |     
   x86_64    |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/862f6088da076211406ace0e13f2ad1d39952610 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/f1ba48eec0e4b81856faeef4afb3bdde7a45c74f |     
    i586     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/70a9da7363e18d8127ee1cffff389f8625b05672 |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/87b0836271875f5043422e652d01fe4442a7d6be | ORPH
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/99da25a5d4e9e4305646234cf51923dfbd1d6c40 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/ce2d2e1c0fae2b7e04d21903bbef377087e12c89 |     
    i686     | package/wine/wine.mk:347: w... | NOK | https://autobuild.buildroot.org/results/f78e50c48e38cedd465b9025673ec55ccce45a57 |     
   mips64    |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/afa266aea6b9b1ae6776aa8f4ce401f03244a278 |     
powerpc64le  |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/e48aa8b65cc35ea376dd26f99c96c8b4637e2c16 |     
    i686     |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/451980c4e0b139b8c307467a54b5ed74da94f2ec |     
    i586     | rtl8188eu-f42fc9c45d2086c41... | NOK | https://autobuild.buildroot.org/results/653e799ae0f56509c8f70ef458991c642d78912b |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/12a5b4946fa25d5b5ff2691e1f56f9abd2d59267 | ORPH
   armeb     | squeezelite-71c012ad9ba102f... | NOK | https://autobuild.buildroot.org/results/0276a63f15598dd8d56862f7fbb07ebc8381a088 |     
   arceb     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/743de942b7ce1855dd1dc4e4d60964c65ce3cb63 | ORPH
    i686     |           wine-10.0            | NOK | https://autobuild.buildroot.org/results/8409857986d4253a8782f3ec7545069e92b8165e |     
  mips64el   |      xtables-addons-3.24       | NOK | https://autobuild.buildroot.org/results/add75b3b94bbf4b1e2d978d92d655896418287a1 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
