Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5806CC2D0CD
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 03:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4495607C2;
	Sun, 18 May 2025 03:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0eKfXuEj6ldb; Sun, 18 May 2025 03:11:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E459B6077B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E459B6077B;
	Sun, 18 May 2025 03:11:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76B1CE4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 03:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E3BB4026C
 for <buildroot@buildroot.org>; Sun, 18 May 2025 03:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1QNz_JEAMFU for <buildroot@buildroot.org>;
 Sun, 18 May 2025 03:11:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 850F6403DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 850F6403DC
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 850F6403DC
 for <buildroot@buildroot.org>; Sun, 18 May 2025 03:11:09 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a361b8a664so1825235f8f.3
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747537867; x=1748142667;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X98PEs+d0BlUo3ceyf813518ms7+dHeS74pTEDNqs1g=;
 b=kN9XC9ZyNEKpZdcR90GUToFqThm2UwfOIN50LmH1LKn3Qm9HFJjqZAAKvmHNZWl5KL
 J3Cp7ST035WIMT1ZRbIn53cidWGy6KXSU3NgmvpjxY3cL+I1a0Kf6q9jSMgrk4lmc4sG
 cc/QHp8dCPZjaXZ3R/iCOuZSxE3VhRBJuGGKNKDsHT8YMYnD+RQtd+aVWp9/X9V8NpOH
 DXLZGgJ0Qk1O6EF8WZ+6VbEybVI3oxA28ZDPs2FnrqxNMRDkK4rPGHqBkH4wYH3SYDhj
 UUsP8KRsGta5lTBEL/2oRV+f02FRK1E1REZ8Mo6IJ9oRYmiPNNS74vP0GyQ8HdwlQRdI
 WGFg==
X-Gm-Message-State: AOJu0YwGB/Myru5jt3UIpLXNq/9/P0MoQsVNCBBHGODQ4lxYniFRs3Yj
 wpSHRrrgxVv6x3a9JtxAFqsrg3r62p1euITqEntW1T3rYpNvBkCScEU3Bfq1hA==
X-Gm-Gg: ASbGnctEeFzaGiySCwPzUzz0J9sSadhptYWxoNRCcfrOJU/jS/kqL1tfJ1CHNLYCIUD
 N41zo8ZHQP87QamVX7BFcWubg0r0/GEB8z9QU11B5TgkxWLrgWYa0y1yL11rAX+E6p4kO4n59br
 wVorhwK3rMCAtqRBmb4F+fw2H0WMgIDz1kNRMEK3YWNe5e/ECJfQaeUbKTTrD2JXYIzdIoCnZyo
 YMPmkmhe8+DkGvFgm3NRbooXGjjm6FSAeEEaovycwelL71tRZ9Hml3/t0AwuxDQC1lpKivIj2e0
 WoofnyVwgMLst+NHNs5TC7koon8Xm9qAD5hi4yOFwDNpuZ1du499mi8=
X-Google-Smtp-Source: AGHT+IHSctjfTBp1nPNSl+vlWRTI6hPC5s+HEPp5q+S/oY7WIQQnofBoQphTIJi4Mxto7xxa12EQ5w==
X-Received: by 2002:a05:6000:4020:b0:3a3:64c8:1fa7 with SMTP id
 ffacd0b85a97d-3a364c822admr4181532f8f.55.1747537866713; 
 Sat, 17 May 2025 20:11:06 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca5a8cfsm8150261f8f.37.2025.05.17.20.11.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 May 2025 20:11:06 -0700 (PDT)
Message-ID: <68294fca.5d0a0220.2978d6.51e5@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 18 May 2025 03:11:06 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747537867; x=1748142667; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=X98PEs+d0BlUo3ceyf813518ms7+dHeS74pTEDNqs1g=;
 b=RBCY2pveULSszoFuvsYjiO/fJ3N0yxPVfJz5qKgxqOHi5EXWF0edX6C1tseOP1yqct
 lnl9zWN/uc2/U9m9HB19fnqGWJv2k6UDN+6QxfvypZH7K1ZbwypkBVdO239EBm6mUHwV
 88xbEGZmNHCozR91q7BTH6AC5Bpg9j0+LOpykfQncyROdzW77FmJgR/LPEOw2TtjmtXg
 z4ZZPQta58D+K8FF4tFxWsYQHxPV5zmvBcKKf+SofIweVlsDds1aIlqlmk9pizvr4EZE
 I1tgQC14cPqyxTrFbuSEgUSFpfTWU+dvkj8G79bTHVVkOTjSQS1sutrdNACnQJN6JXwz
 dFfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RBCY2pve
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-17
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

Autobuild statistics for 2025-05-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  7  |  0  | 11  |
    master   |  9  | 527 |  0  | 536 |

Classification of failures by reason for master
-----------------------------------------------

                 host-lzo-2.10 | 91
          host-binutils-2.43.1 | 47
                       unknown | 40
                    flex-2.6.4 | 39
            host-cdrkit-1.1.11 | 39
               host-vde2-2.3.3 | 25
                elfutils-0.192 | 23
host-go-bootstrap-stage1-1.... | 23
                      lzo-2.10 | 22
                  bcg729-1.1.1 | 11
                    bmx7-7.1.1 | 11
            host-binutils-2.42 | 11
  gobject-introspection-1.82.0 | 9 
               bctoolbox-4.4.8 | 8 
                 openal-1.22.0 | 8 
          host-oniguruma-6.9.9 | 7 
host-binutils-arc-2023.09-r... | 6 
         host-mariadb-10.11.11 | 6 
              libselinux-3.8.1 | 6 
               asterisk-22.3.0 | 4 
                   perl-5.40.2 | 4 
          cryptodev-linux-1.13 | 3 
glibc-2.41-5-gcb7f206537240... | 3 
host-am335x-pru-package-5f3... | 3 
              jpeg-turbo-2.1.5 | 3 
                  libftdi1-1.5 | 3 
          linux-5.10.162-cip24 | 3 
     linux-5.10.162-cip24-rt10 | 3 
                 apitrace-10.0 | 2 
           at-spi2-core-2.50.0 | 2 
             berkeleydb-5.3.28 | 2 
            gettext-gnu-0.22.4 | 2 
              host-llvm-15.0.3 | 2 
   host-python-glslang-11.13.0 | 2 
              libebur128-1.2.6 | 2 
                libsepol-3.8.1 | 2 
               linux-pam-1.6.1 | 2 
                     mtd-2.3.0 | 2 
                 netsnmp-5.9.4 | 2 
                  ntp-4.2.8p18 | 2 
                python3-3.13.3 | 2 
            xlib_libXau-1.0.11 | 2 
          aardvark-dns-v1.14.0 | 1 
                 agentpp-4.6.1 | 1 
             bluez5_utils-5.79 | 1 
                  boost-1.83.0 | 1 
                    brltty-6.6 | 1 
                   duma-2.5.21 | 1 
                   eza-0.20.19 | 1 
  ffmpeg-n6.1.2-27-ge16ff06adb | 1 
flashbench-2e30b1968a661474... | 1 
              fluent-bit-4.0.2 | 1 
           ghostscript-10.05.1 | 1 
        host-berkeleydb-5.3.28 | 1 
                 host-gdb-15.2 | 1 
                 host-gdb-16.3 | 1 
     host-python-maturin-1.8.3 | 1 
              host-swipl-9.2.8 | 1 
              host-uuu-1.5.201 | 1 
                  jack2-1.9.22 | 1 
                 lapack-3.12.1 | 1 
              libarchive-3.7.9 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                libdrm-2.4.124 | 1 
                  libnss-3.111 | 1 
              libopenssl-3.5.0 | 1 
                 libsoxr-0.1.3 | 1 
                 libusb-1.0.28 | 1 
                  linux-6.14.6 | 1 
             lirc-tools-0.10.2 | 1 
              mariadb-10.11.11 | 1 
                 mdevd-0.1.6.4 | 1 
package/mender-update-modul... | 1 
      passt-2025_02_17.a1e48a0 | 1 
               pulseaudio-17.0 | 1 
    start-stop-daemon-1.20.7.1 | 1 
toolchain-external-bootlin-... | 1 
             util-linux-2.40.2 | 1 
                 xenomai-3.2.5 | 1 
                    yajl-2.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/f7ef8d37b0642c580ee0baea3e8f651eb6715835 | ORPH
   mips64    |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/70c566e60d093b2861051961a9229e7dca6df3d6 |     
   s390x     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/b1ff475d3aa77db556f57e4c5b99e6d5f105a4be |     
   s390x     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/e9956e763380ead7b5ff07e0ee1243a62caef6d0 |     
powerpc64le  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/72e804dccc2b18e3841ae94d74d3c536d19ce50c |     
 microblaze  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/b214e2ae90a1ce0bb2290593ca0966a91f976956 |     
 microblaze  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/9c0c05f091ba0bc97cd7805283d71f8defe9447b |     
  sparc64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/e6a5235e88cb2d01ef07c71916ca9526cb37158f |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/1c7db467bc71679ea1b0a0ee80ee67a283ca86db |     
    arc      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/c45fd09323dc3ea0dc516d820b187c30eb10a6af |     
   xtensa    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/339cc3ef17ee96c802bc3ad3f4649db30e657ba3 |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/763f569eba6d87375cf8785ca62f35f252ba2ed0 |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/5dc5bae775f9c398ce4f7a8546a431c00a4374db |     
    mips     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/26232891a12504594f6149cea5b16f8ea41a8e6d |     
  mips64el   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/b6f3b722c2f00ca1638691e90ef5ced8dadbb8a8 |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/99c0f68295079311bb8a18dd3d5c108c6f8c10ac |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/9a4fdbde178d61615a28ab35c09747155184d1fb |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/27352665ab798b1afff09e6d8b7688bb788cb77b |     
   xtensa    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/f065945d787e775b3fbcee11f8301b3b43f9669e |     
  powerpc    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/5c1af709291e66d217687c97b98d163505cbf152 |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/52b7f7628d2d330f9a8ba3f6f33fd53c33364d9d |     
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/b67e364f859bcd72ac86b5f73ef994875eaecaf6 | ORPH
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/708ea77e0d93ebf922ffec30eced39da9a90326f | ORPH
   s390x     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/4e3184d0d1bec5c9df9ce87f11424172af0580bf | ORPH
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/59b32531a175bf75f7aea859a938ae47fc0dbb51 | ORPH
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/3f1f68bdaaac4940106eb5036d3852cab9b9248b | ORPH
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/5b682b11406e9f4de6be8027cb8b05ca1bc4bd6c | ORPH
   mips64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/008f00e8e8ddf2896f3b2ddda865152b0054e655 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/524044bd7c52619c8d4e79c09105bcd6cb4a4839 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/3d01a52e71539005cc49cf20707c273d339389e9 | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/07715dac1743fb09c91a846f2285b5d89c378b00 | ORPH
 aarch64_be  |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/18fc8966097465b148fef28cc90d070d979ca162 |     
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/d5399ab5332b436ef85a71054295fe2132305d7e | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/a93a8fece22a1b7155c981ba14ba7bca40435b9d | ORPH
    arm      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/2aaaaf38fca3564a347ac82726467ea8c69889c5 | ORPH
    arm      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/00843a2bbcd1a992f15a115558f9551bc29d1d94 | ORPH
   sparc     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/8cc2b10780dfca587b11cdb70bc08d9d4f0ce420 | ORPH
   sh4aeb    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/a9c3c233dc08b9db626982cccfd6ef33f15f54c5 | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/977ae8351cea8f951384554258dda3d0b1adddfb | ORPH
    i686     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/10f9b02713226f972f46c5e0fa7068405ede5f94 | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e55768c2b2f3e404e9f381262f38bf8fd8516be3 | ORPH
  riscv64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/0d6dedb43568f789b4a22ae881ea666ea20ea12e | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/eb5c7ffb07edb6dd9f20709ae7bb22a74bcd0aee | ORPH
 aarch64_be  |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/ad6817c7d5c8d1fa84bce0637e5a719d2c558ad8 |     
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/ef31be0ffe504395348e0ebbfe4170168e7ffb06 |     
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/a361c41a6c55df47c736119b19c95c3bcf8e153f | ORPH
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/a591decbc578ccc5af5535bf5ab7f7ceedf989b6 | ORPH
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/1eb7766a05e0f854888df050cb4b8591b1b1c40e | ORPH
  powerpc    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/5b89062c4a3a90a44923c852411b8d12162fb75e | ORPH
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f1f1c6e4333e743803ed683639ac4735fb6a884f | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/bd35eb974599dc37c59b54ce66b50c587162b193 | ORPH
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f080040a22f3e62e1da6400dabd087cce13ff2c7 | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/59c3e2baab3a75f1d921e41d33b8f47ac73e9231 | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ee30e0657dbe62331c339f023acdc2d0d92d77f2 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a8b9609fb494ac7ce1932ee571e5223a5f73a14b | ORPH
  mips64el   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e4463db688256c4b3ce82e505a7dd1f5f4b6acd4 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/1a38fa4fbea90ada1019e4bc201d3e4adead4c6e | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7e7dfe26c2fa6b0ee22cc618c969b2e592cd05ab | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/403dddd9ee396ca0112091f47a4cf9e2c55c86b7 | ORPH
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/acadd4a58b444c659cd84e4f5b1c2e03958b4f6d | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/4fb364dc05e41748f959af08d09ea877939b0cff | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/cbf7163a75a21d4dc571422baf090c72b245b8b1 | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/bdf32c4da2c4018e5b985169f89187de7b8104cb | ORPH
    sh4      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/dbb9ea4d9f3678bfa1e9d8cb598d725be2536068 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b9dfb1506c7211bc28f4950bfe6f5264cfce62b8 | ORPH
  powerpc    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/d5ada3a405db5dca2aecf0b0fed0bd031e4f7f4e | ORPH
   mipsel    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f489c3ec73402739e908fe002017cc546a42c835 | ORPH
    arm      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/84bbab49165faa7256b1806e3d635882f55b4de6 | ORPH
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/30653dce156e9fda337f83da1c3fdbb2c5337b41 | ORPH
   mipsel    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/8771d0de9c9c3fac18f2cb14136b2466bd8e6f32 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/1eabdcad24ad27c557091b29155fd8e5466d6a47 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/fa2e57cd7148475522991c91aca3ddd8753ea641 | ORPH
  aarch64    |          eza-0.20.19           | NOK | https://autobuild.buildroot.org/results/c16c90f1dd1c38f5322ae8ac615f292d2b22b03c |     
microblazeel |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/d7dffbc8c286f2225de1025b520410f09fb31a14 |     
 powerpc64   | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/03ad989c631a259b056eaea4ce2294308456a31e | ORPH
   x86_64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/82139979eccde76c1ac7b6f7063f1989cdcd6e40 | ORPH
powerpc64le  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/c3b92128f04961bd5c12ee022d4f263839c5027e | ORPH
   armeb     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/0e0bbd3d96f8adc5b94fd45995660a42a81f8ef5 | ORPH
   armeb     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/09d6c14846aeb0272ae8eabd1c6d6733b72c7af2 | ORPH
   armeb     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/0986a4f2915922fa9d190d11e132d63d25ecc958 | ORPH
    arm      |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/603ef3e1ed13ac3013c4c58fff9de5a5cc008814 | ORPH
  sparc64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/64f1ad64f81365b0884d203ece0eea57e86f086a | ORPH
   s390x     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/d645897c9789477c65f7d3e50c8c8acd6b4a86f9 | ORPH
   sparc     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/27acb48f15e6e9448ff0f8b65bdff34e04eb1681 | ORPH
 powerpc64   |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/45cf1e4a5e6f1a4b4d8e24588ef76412c3f0c8f7 | ORPH
    arm      |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/303364ff0e100398b832f306168956ae86613bc6 | ORPH
microblazeel |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/891f4d4d349a9e5531fafad1737f4df6b8be2def | ORPH
   sparc     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/2ee4a3ae84b5a1b419f6e4c834a4a5c2437fddfc | ORPH
 powerpc64   |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/8bacf7a56e086852c3cd9e0a4f08494a7717a2da | ORPH
 microblaze  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/8486613470d0347cce33e7e7bb1231eebbd7d4ff | ORPH
    sh4a     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/e064cc595df228d95c0be056bf18fad25d7a2459 | ORPH
    arc      |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/9651cd4cb298fe9ea6e648b962a6f9a38659289e | ORPH
  riscv64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/42dea2bfa5a5d48a17fabf307b8f98ab76042e17 | ORPH
    m68k     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/6d2fe4aea808addee239be882402a67316a7ab5c | ORPH
   s390x     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/fbb3406a3e318611e60258b5629a75e2a29d2627 | ORPH
   xtensa    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/7411bacfb2dd0b6bc91f82dd8f52cf38310a2e11 | ORPH
powerpc64le  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/b6853efdd77c3e3e0ed6f56600e5b3be83c43b47 | ORPH
powerpc64le  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/6d00f5a932955e3d7dfc7c49cdcec0db62ca92d8 | ORPH
    arm      |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/509a8aace86356320d3f4fb51cc4e4a0c5db0b1e | ORPH
   s390x     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/81c5482d43c5906c74e887d00d1d9dd4fc6ec00c | ORPH
    sh4a     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/bfb9f50d550d28f98bb3407513bf8c5717360de5 | ORPH
    sh4a     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/5591b224f1c4062170b144719bc149a2dbf32e58 | ORPH
    m68k     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/ca65037429a55628b1b200b77d77eb54ff44fc66 | ORPH
 microblaze  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/df8d37dbb9a3bf6859c94facd168ce932eafc1b9 | ORPH
    or1k     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/af11f7c62a2a366e3b3c6a1ed7d4349ca4f9fc5a | ORPH
  powerpc    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/f0f8f3e1b8eebf83d4728f89fb576503da5bff31 | ORPH
  powerpc    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/22e3bcf82922333fbab37f38bdac4f4275152658 | ORPH
    sh4a     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/8f6b311326ef817cd9d193771ae4c918290a513d | ORPH
 aarch64_be  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/c838424d1120b423be8a4080760f17a14a7d3129 | ORPH
 powerpc64   |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/3b84cf15d3d85e3b54ae50e1a0470189466cd62a | ORPH
 powerpc64   |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/a17ea1bee5c2283f8807dd57bcda631d30142534 | ORPH
   s390x     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/070007dd2f7de7313cdefc81e150cec148908f8d | ORPH
    arc      |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/e751db11b5eb4f570f2c3401f74ea1608b416308 | ORPH
 aarch64_be  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/bb20d858f4a374e6a687585e9445c1148d479f2b | ORPH
    m68k     |        fluent-bit-4.0.2        | NOK | https://autobuild.buildroot.org/results/d83a975beebfbd8e97ae4b51b8c5ba7e7626db3c |     
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/570a57d4a584501916cc101f7884c0603838c89a | ORPH
  aarch64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/d1e801bbe2a2d1e86024f1a0a39dd44522fe890d | ORPH
   arceb     |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/86d0a36aab7fa9cfd867e60ade45a16abcd8c7de |     
    arc      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/11cdd77e6277ae4ce48b9a412490438c51e8dddc |     
    arc      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/05afc457d00bd0ad6b7477c4cfbb6411d00c4721 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/9fb307bb1c402b441826f7232bb9df88ec8a58da |     
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/d7b4e52676bbcda09841d1440efb9b0767b19e9d | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/c927e1b42ec024f95c07f0a627ec18f1c6d6b69c | ORPH
    mips     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/b53a758f1894d797294f598278a8a6c1ad87cfa1 | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/837f7e36828756eb289002ffeb7c72da368cdbe0 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/aa35f846ff2bb91ffdf8c6af1395c41997622aab | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/f3b3b1a806ca80157748f7b9a79a6ab697bb8546 | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/b7fcfb52b5f1ed675d91b644618d2c8e2fc28628 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/90d7f66db3e5c1a27974bee50d24a6b6755ea312 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/46481b094cb49944c73b06d1052222cc1fe1e622 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/adbcc95b7c6d22ffda708ede44506d4f9d7b5583 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/1501fd5981edcf67d2aa793920696a3c3e008409 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/4022c1f2c0861de00df7f48ad1ada7c0e5c0abdf |     
    sh4a     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/ffcb903ca77be2677d6db20e3d53ca32bb04179e | ORPH
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b005fdd0ed9d1a059f1ac14555e7ed6444dabe34 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/16ae02cf639e1df562c0e71a95756455835799aa |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/8e6e22deb47242457b89dd93626e0e6e20343cdd |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/d7230cea83a7002aa8ab088ea411c96c7792a810 |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f17f8e19db1bbf6e2f3152b23ac09a8be2ff7b29 |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/551880a32c58d8dc14aa004aea37a3cd1c4e7326 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/9587e4547893b9e8b6df76c1251c64c5a2030342 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c1fc9491d87141c967167f618f473545d535ba77 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/3ebc40f69321affccfb2cb57d33c23aa05d6b8df |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/1f2ec053d597ca79e4b78085fe57d7178122569f |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/61540a8c023c646b49494b174ad705f260608564 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0e8d3d97a7115c6eb254ac96340088ce93dc613d |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e75d184ebad3820e064c7f2a814d5cc9fdb96d34 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/abb4c4279ecf06c9f6d86175645aaceb6ba6dc8e |     
    i586     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/32da3470e071d204109ecbc46c3716380f8ee579 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1dccd71185dd7944bc26d6f310a44c0d9b5446ca |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/eb15721d6d5cee418ab5fcc96337f26a3b6c2b7f |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/accb43b153fbe1f47a5633dfde3f43a069de242f |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/875deec552f88a836c4b82747d94a6be7a11c5b7 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cd5f55884d3dce179eca64ca616f593894bc2c91 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/74edca40cd3680d0433431d1b13d27e849c05368 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bc13de202b0b2f6390997105652285cc149b9c25 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/459a2730bd46e72259d84f56570753ee7a770180 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bf09fb85d4f76ef056aef889537728107fc387c8 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/06bbe7920960a64ec86006a9054f4ae30db81077 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0ae4cd0d5998285f0bb067a390b5a317f88fe63f |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/03e6a890b401bdf52051583283a505efa1adba7d |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0983e8f75fb6359a51bbc1e75fe7b1623dd25efc |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/32ad29b6013a94850bbc374104751d90dcf1a621 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fe81abd4ced04953214d223eadde46434b9f3873 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/805d8ac693a56198bad3dc7be46c25b362e1a676 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fb3c296b6009c91b0a2a4860d83108640c4111f7 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ef190e0ed5d6e55c3fdfcf48d56eab54f8c6f6e0 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3adf56e6a28ef30967571de60a3432816939bd8e |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/27bcc1f63e133cc1e54afaafbe60efc0e05c5d59 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3ad109f6a6774051bbcdfb35897fe8f9f932dc56 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f9576e6315009dfb902229c06ce3cbc562efe76c |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/071cd37a4b214962668d1700ff047c4a16005dea |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b6277869e963166933efd3e581fc443622f0dae0 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/edd35df31a31168a4d206790f7970c825f8dbbd8 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cfb9601bf3b8d650307df774bd3a216a860aaa84 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e5e4b1251aab8c98ad0b5cd8fa698e52bc6953c5 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f918441cac86cf0963d875454518101e31e679a3 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a12caf5ce02f531ed12e9561e924ba78fe5a2645 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f31dff84b36031ad29ca8f2a21b7da12649ae574 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9ebce561d31f9361acd8eeb482ce2942e9137b15 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c8895b0b60b912d47e66e204f5306bdb54bd5386 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b86554a51420ffb3411934c9062bc982eb80b99a |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e8a37f30383d862d45cc7439d4f803a5733d089a |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6577c47896bea5e16de9d59931d83a1dbacb54bf |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a2ab8e2ad264f0faa81ecd7bd2d6420ba124c238 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a37bdbb820abf8302ddf50a9223a8ab70077ddf0 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2e1229994f61a2a98bd1ded4cd3f93832d312417 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/322cff00fe3c79d22af868f35403680c0eb8a2e6 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/83982f02fa38e6501ea7ca18e33355718e9e187b |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/13b64dbc2c39bffec7c973f27688467546965ca6 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e889d965289a0ba4de723395e9ac17e6c3acda79 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9ae2d7d268690da4159daca3e1ae07b0e94a48a0 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/3e4775d146efe5ed372a38a63295ddb32775969f |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/851c0c75ae6c83751482ed71ade3c77902c31655 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/bebd3d10815beff02b57e71e9fb8e703862258d9 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/72b575ab88fea25c82b095fdb3419570aab63eeb |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/16c85c83d9de2a6dae14b05bfb9b10fb16e1aec4 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/9b392e8e855a7b9da9facca227cb811569c8820f |     
   mips64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/b33766227bf46957e6b3882f77b353107f4f3604 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ce6629a7c0d3c37b954eced3ba6c05877c5be4d9 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/faef57ccf286bb9bf57e2054e79da693442cb236 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ec18bb0bb7c49f58f6be38a8ace0da5605365f85 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ca45db1b662a160824675c17b6d8b004fe32568f |     
    arc      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/d3a2a5fc798a6a0a8fb6bbc4519652f7afbd4a2d |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/cf64228fdc638d1581add103e89331aec400950c |     
   mips64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/7ab4c01dedc9477f50e5071833c2add110d9e472 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/4fc394c7ce77d24d108cb5f9bc689abbd03b6995 |     
    i686     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/50c1c6d9c4679351a44c852531e7c16e981f1b57 |     
    sh4a     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/f71d49f299964aa8c90fc12c8533f5cc3f9649d3 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/4564809fb189f08cd65a915ab64a3ebaff8421f6 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/4d23798aee8d76e95bf34dbf419afb912a0881ff |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/a2c74c915e8103d925cac705c5f52b3081f4f98b |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/aef8c4e71e236f8bd9af3c89a31d28a557a52884 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/02f19c283b7bd5036669c25dcd1e98385d059e4f |     
    arc      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/9004d909b0fdcbb6acc9b516f272fc60885e749d |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/c10bff251ceca22a773a9fd11c457d5be7ed84b8 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ee4b5db09c22e1fea4b0b6f7613e1a78b0a33cee |     
   arceb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/fcf61b1cb4ed7368016b016de32b187aa820ceaf |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/1d7d71a32a4dc82d5d465bec88a89507ef1fbf24 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/06550040ddb74996b3bcbdd2f2982996406fc703 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/23896e0c6fe93201aeb451522986b4b889cb4a99 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/7880e8083cae8381d028d3875065f5b81f960882 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/7b17b6cb51dd307184349d514805f769947ad9d8 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/0062beffc673351e09842b881e43b0005104d7c0 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/d09814df93b5a08e8084068bc5345eaad076f28a |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/dfa66b66fa3794f8c3cf7450eab51598dd981768 |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/d085b5d5bf0478a0cefa4aa29256197975d6a65e |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/70a66ff39553fa4f4c88b2c2ffdf3d34a55afa8d |     
   mips64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/072eee61e32b9d630049801287eba71db66ff0f0 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/b617f9eadbc92bed0fd68e53212ba47fbe89b797 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/81737a308537242bb23630e38dbeeba5ffab8e7b |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/eba6cc732842551e9091664fb0cf6a8217bc1ae8 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/7490df51698888f79edd5837bc775c4349dff1b9 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/83edb83c1a3cf7a31c69bb9df00ff293e02a92e0 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/264a98e252ac89968b06dce3111f1d79fd9ef90c |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/c41dcb5a6caee18e885542bcaf5d19fefb5ac30f |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ea6c8f4ae3584742baa75261dc9fe68cb84b6835 |     
  sparc64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/755022ddb4577ee777333d7c65cfc38af558ccd4 | ORPH
   sh4aeb    |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/0fcf43f878ea05652fcc890476b39ade555adb73 | ORPH
  aarch64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/436804ca7b55301ae953ce0e53782f4a94abb79d |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/cf2a6b9389adda048369215633d8607f8c4f08bf |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/db4635c0194ca693f6eccd3946a0f7b6edd4a5bb |     
  sparc64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/48e951ffd18b9cefe1c9a1f1b0736bb40b2f6b4f |     
    i686     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/05287ab807ae5fe7dd450347e04f9b76791ce723 |     
    arm      | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/a19aef1ecdfc5a91a19d270c339117bd8e916b9e |     
powerpc64le  | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/0823fdc4c3244c6f2ebb3c209fd99ad4e8a32e1a |     
    i586     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/aeb911c431befe4cd7a27e41e6bc32a7861185b3 |     
   mips64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/56b90d93755a3f6f319066049e1756bbf8edaf2d |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/4b46543d21cca909b841ec1bf916264fdb7db999 |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/a86a40b0a61d14d845c03230b8a8b2152bcd9852 |     
   x86_64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/dd703ebd8ac48f375579332eb8ee9062180a13d0 |     
   x86_64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/403239aaf306e001bd51b3cb469ac42799cb8206 |     
    i686     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/0c96c9a74bc69dc6a85b7b1199d761078fb5920f |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/03c88bab2b47d54d864065a185d8dae9fe974a7d |     
    arc      | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/63b5821318dceee304adedf56b01208130aac40b |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/f31b0a86690561c69ea3a804feb540dd025348e5 |     
   mips64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/5ef50534be95040f26ad8c7d218c46124204c401 |     
  riscv64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/f956ae665f9c5742a779a8f06e2f7f932bb87a24 |     
  powerpc    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/d0cfd6126865a57b038c8f9bdb9b7be1c7f8c1bf |     
    i686     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/96b93426814206efc87fbcabe2e7d10bd05aee1a |     
   x86_64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/1c6dd246b54fc6350b69eb4a64bb46d8f051e6a8 |     
powerpc64le  | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/e201d450099a39b614a4020149bd75b1eab6c468 |     
  aarch64    |        host-llvm-15.0.3        | NOK | https://autobuild.buildroot.org/results/de9890a44916b360656bd4fef9e5382a31c54cc7 |     
   x86_64    |        host-llvm-15.0.3        | NOK | https://autobuild.buildroot.org/results/dd21de0c8ac26c7bd79d38c2279110fa0b2510b4 |     
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/dd22c05a419f89881e97df318943b23f5d5d34a3 | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/2693d68cd155bf9419621e3e1c82e7d0348fc418 | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/dafc0e41a68c8e884efdb4cff8c816cc67a54c8a | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5ab8e40da5ab2ad3549b734d40e4a8d5a75184a5 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c80f169c8e4e8bcb6515fa114a57f404696c3ae1 | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/fa8d4c90279a2bc52a11b66f47d054a0249ac188 | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/55614401342d187e7b5becb5447706d65e08a2c6 | ORPH
   sh4eb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/42cb264af5c50cc6338691296127454354c5dba7 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4cc41512a42d1793394e3446a8f16fa981bafcc1 | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/cfa6c8420867a880b92e1f8bb87f7276e0ac309b | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6c6f63317b3f622356ebd3421b6de0b3dc58d106 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/96bb9ae1c2cd2289451a883c5260834098b07a7f | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c6a890aabd5577013dd7a3ae692c9bfbd9e2937c | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/169d4043530f85ab81b01f95052f0c39d4b6b57f | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6c0bbb208be035cf227f09805448d259797ad5d2 | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b8fece6886ea2e2ee037e0f6c7f6e6c29243447f | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/2df6e81f8d12b13979aa8f6f6aac8c4228a36ae5 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/72808a96107eebd8c0a250d5b19c779f17071ea3 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/32d3b4bfdfb76cf6c5c121ba62745d59cb42fb73 | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/074ba41846eb87d03f08afdbe0f25108285069b0 | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8ab6a15163285e522f080bd1a3509fba231bc41d | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1a1bec2897688c15ff9d079d8133d3553999be1c | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/494b692867de74e64aef51f0eb480e41ac7c7187 | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7e9677e29b4d4e82b49a39b1e6c89eae0c2f2ee4 | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b34eae9f1a3337e0a412a24f78a11f35b79a838b | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5bfbf15e60f269a50a5ddba5154d4f39b90bba3f | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f20b0391039777b3cce8cd7345a4699eef9cdcbb | ORPH
    arc      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0382195fcf30c1be5f4d6266e728115965db946a | ORPH
   sh4eb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/aa71f43c9a1704ed1b8257f6aad5dc81c79a5b8f | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4ff193a2bd7b2db0c5653a05774313f297e5da48 | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e6587c7a6782dfec9046dd5b559427a55891c6f4 | ORPH
   sparc     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/23685e6bc0002c66ab42bb1cfcaa303c50ddbbcc | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/01d2199d4b3ebc159e234c0bf338ebe7e8e6e6d4 | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/23cb54005afe17dd709c3560142960ec6c9ea826 | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/06b7ddd3e9654a7e701e81b4ff438f7dce5c9781 | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/59a1601d0b6c6b6c8ec3d55390ece107ac33f81c | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1d4f4789c3a53e464c270a27dfa1f7c4679c5504 | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/bdbe7ab482516f0bf7c9ad831b61f694e85f2387 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0333fb98fd16763c60a7af5a9dfc8ea9a3fd824a | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/488ddcaa5bdaac5ae7fad40ef2be66b4bdff07d0 | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7c8d31265d0d777955142ae096aca4e06572f011 | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1f37dd3c4ca8588b8a6d358e63c73cf3a6e2334b | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c5899800bd1045a974fd23070e687540b4598127 | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/840bd0374f7ab8434b03fe336e04dd24bd4a8afc | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/319eaaa248c9fd478bacbb77425f6f6d9c00e6ee | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/447299884e092e0b7bb881ea41a9d3e61e55ffbe | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/543d230c0931a5606a4e757be429dc115be8e1b6 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/bcd79f977db7339fc58b371c6ab82e6c1cc34cf5 | ORPH
  riscv32    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8a61a0cfbea474f014e817b33500e683f4533a89 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f7a6543c50de1c85fa1bb4a7bfd375cc4bdaf44c | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6d2de42f999e07cd9ab099016319d9f411127eba | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/48c6044ba70799feff6e3c7069198b4179deab05 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/17ceb3c893dbb5f10a74dfcff52ba3b54e4d952e | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/819d2da25ec31e7bd9314fd4bcb8c165d33836fb | ORPH
    sh4      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/662f4a27b70430695046249c6c337d8c7df9b0a7 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ed09dfd5d797dccf3f3ca65b78dc5d165e5ae524 | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/057e7c78ac370bdc36734fcfe4fa250e52698570 | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c110ad4319b2857928574bca9e272cd5ec9eddb7 | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ceb727f8cf42934f9b44b91385c2fc85fa9060d0 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/02f50ac7075b077221ba16638c99f8dd56842c8a | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/de065ff3eb72ee6dfe01adaa744d1e5a41fc9ce9 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/fdff8f6a2f6ad660088abc7db08e573deabb0fd7 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1a3077c6145e8b3cc9ef1afabe3b67989c6f8215 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/80f3969e56050c5602bbac98230b67f0f3eb0f6e | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b9e6b62b616be7d0584bae4a739c796c7006f565 | ORPH
   sparc     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1b89fb9a4bea3d58f7a830a7471cc76f7d45ec6a | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/81bf5873e54f132a6326220760c8869006b969ee | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b50d4df49c46b0b09fe5ac6a4cd8b789030f933d | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a017192b2be48839149cd44296f266313dcf7b8c | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/19131787ced1ad0e2e6b0290755c218e167cf30c | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/84f7274f6565abbf9b95027c274ce06d9e7e918b | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ef2a4eca3a0ed6a002f995cb341436e64aa8d858 | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/2da438e5349e95b5f7c05f91a87762262f1461da | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/dbb7ae2d69102e405604ef68795da5753596d9a9 | ORPH
    sh4      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/9ad050a8ef1037776649bfebaac3ac83807ff336 | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/47c28bbd730b44d2b8d4de08a610470d57532cb6 | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4a9badcb7309cd218fb24b50164d2a503762c9f0 | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a675bfe32b78de151b56d7957ea8bc5c9121d51a | ORPH
   sparc     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/06c9061ffc63c043c57dcc71a925b6c03769028e | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/903a0b9ae37a3452c66ee6e2329e63f0c7c25363 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/3953c9f06ab8b4bab1825dbc888a2a848086a7b2 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/802dd8a8f7bd8e57642c6f8b16f13c7e70ee55a6 | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ccde11694cd33db93516a304749bcc2f4f120d2b | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/891f8092468da4656970e93c4dbee526e172831f | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/9e43c6f9b00236de91b7f915ce25338968c893bb | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a04422dc8ec039a0324aba0957a2e68762f0bbba | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a975dd6fbb3e4164aded02825f04565d94c98937 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7ddc6376d9265594f65a9a825b94beaa1defb0c8 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/9763ec3f5a80fdd95fce5122d99b5aabadc5f469 | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a3947a92c4d4504573b4cd763966d73f72aeb848 | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0f91343610df0ba6dabc609b422f640a42e81dbb | ORPH
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/00394e3d33dc1bf4981f09fb24b4d06f800b9f80 | ORPH
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/47cc0ef6d30e965e12f67a50bb17f4c0d4baec1b | ORPH
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/dd1da7411f24aacc3cd96be83de5498c01557463 | ORPH
 powerpc64   |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/e3dd5535c8446a1dcee373d8f09a7de37047b286 | ORPH
    m68k     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/d704dbbe986f1612dc973f8927407858de40f525 | ORPH
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/b5ef24d2ccfe87a3731111909c605f05d70a000c | ORPH
  sparc64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/ba91292898a9d1da96ece2413b2a8b614e12f20a |     
    arm      |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/1d3c0416b23176806006a941da3f4c3f12af8b59 |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/eee2b92112d064222b8648752d32ac9fd7c08ba5 |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/569abf028877a8e1b98bf0aa7a6571dc40939d41 |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/79361c712f2d1272e272601f5417feca2cae50a5 |     
  sparc64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/46ae7f92a8f04ed36bd29cb6bf015ed7a51e1ba3 |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/fa64915c5e92668d7e9ed0a969a524590fc8dcc4 |     
  mips64el   |  host-python-glslang-11.13.0   | NOK | https://autobuild.buildroot.org/results/49aa00875d7df0f4fde37bfe7f2e4e805ff61028 |     
 aarch64_be  |  host-python-glslang-11.13.0   | NOK | https://autobuild.buildroot.org/results/73a2c83a5af928278abb2c277320070fe1b57266 |     
  aarch64    |   host-python-maturin-1.8.3    | NOK | https://autobuild.buildroot.org/results/6e82054b10f1b5e42c0ef40460ee4510483c77a5 |     
  sparc64    |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/1986715f357d5bec8a1644af2e1d4024bf86387e |     
    m68k     |        host-uuu-1.5.201        | NOK | https://autobuild.buildroot.org/results/d1f82cae003cddefae0c49f673768cd8601449f2 |     
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/edf32f9ac59ff40ae25d8720163ec2423850a721 | ORPH
    sh4      |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/6776488b3bf7786d9316e13ed3ad42956af7dcce | ORPH
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/fc0a7c4c706d2300fb1d23a4743ecbb149dd6088 | ORPH
   armeb     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/2ee4859da6c3ca847d77d5bda4200b1626823aac | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/11a440d63466a0b58b1ea8970e47aeabb7d18bc3 | ORPH
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/6a627add173355a03590a4c07c7909babf0982c6 | ORPH
    mips     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/a9781e7e2a0ffe27414c8598889e88ee306ccb6f | ORPH
    or1k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/a3f3a24b8a30667fbba8aebf2caef3e0be1a7200 | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/461716c3825c9114e38918a7fc1ed816576fb2ef | ORPH
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/ed7940e65a4ccf03d79d66c8ed7df01a4941e8fe | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/2a4ee1ac313d0ebf01036fba121d3f972eed0d37 | ORPH
   sh4aeb    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/4faf97fa974f1792d3d65ce909d75b098f6bb9dc | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/be5b5eb641ec759750c6ac375641efafae390f5f | ORPH
    arm      |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/e16ffa52250d1da866ffd08251f3f6bde7e382e2 | ORPH
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/e573548d22341f0bf709262871e65617b955cd5f | ORPH
  aarch64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/ddf31f42398a4d1b912ac4d422b90f161f84d2d6 | ORPH
   s390x     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/95021970f46305cd6eb531804be7b8074a5d99d6 | ORPH
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/d2111e2c849851651f5b896fea3eccbb3b729372 | ORPH
  powerpc    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/88d42c5151f66027050b35ec48641c87080fe83f | ORPH
    m68k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/8042bee9f452626d29097e28ecf57e047c3158b9 | ORPH
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/7a53a5a5e2d0531fa6989d42c61a38fbd1ec8292 | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/c04dfa0ef04a4cee61958d4f7cc180b9d7934d7f | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/633785fbe155c5c677dd8e9dfb067f9e5203084d | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/8296bf8ae496653d03ca0b6fd418a8aaed68cd0e | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/ade7ca5b38561b2debd9d53e0c075f2e1fbb9e70 | ORPH
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/79c00d326831fa15931ea4ef014894f15de0e600 |     
 microblaze  |        jpeg-turbo-2.1.5        | NOK | https://autobuild.buildroot.org/results/1c6a3e4439fc075fb3c36a7289733ba9c5d5a0a4 |     
   s390x     |        jpeg-turbo-2.1.5        | NOK | https://autobuild.buildroot.org/results/0a49146d449a895915161a5b72ce92a4e0b831e2 |     
 microblaze  |        jpeg-turbo-2.1.5        | NOK | https://autobuild.buildroot.org/results/0e92e6a535dafb61648c16fe66ac46e99aa0b6be |     
   xtensa    |         lapack-3.12.1          | NOK | https://autobuild.buildroot.org/results/6a70ebbc8f0c73b37d9ee39ff20491ea14efc47d |     
  mips64el   |        libarchive-3.7.9        | NOK | https://autobuild.buildroot.org/results/a0ffd589d63033cb294ce2deba319144147b3b77 |     
    or1k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/1961f97c22aaa3a11963eb4233405336c02a4f9a |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/f95dd610e8025a47c1e0f5dd28a982e5aeef0d0f |     
   s390x     |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/f023684dabe443f02254e6bcc09aed6aaccb341a |     
   mips64    |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/c2d56ad18827f16261030d9b135b3c48dddfdea8 |     
 microblaze  |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/09f239f5e745492e431a2324be7879e045e85533 |     
   x86_64    |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/b90ad972ee86702c7ab84305625ac44fe89bd9fd |     
microblazeel |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/530b1fea880d1c234e806e71120bf05f3ae449c7 |     
   armeb     |          libnss-3.111          | NOK | https://autobuild.buildroot.org/results/c7768d61d80e1b957c36a082d38905af58dcfdf5 |     
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/bc811794260570841517c5d6a28ba7b9f39d2ed2 | ORPH
    i586     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/de9a0b023b68e88f9c24d441157ed3b266a86eb0 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/efc46b7f237d8f2e21373740470323d5abb6e0b5 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0aeda44d02fb75890bceb25ceb96c8c8f1077186 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3180c5a8288c81449acb820f0d8e66089f941404 |     
   sh4aeb    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/bf9800fb1a4a2df212d501461e43481042dc08c8 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8f336549322aad5141dc802f2f911410127c34bb |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/e1ddbda8f52d3a18381439f28305846fd0ced78f |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/05e2ca807e134e294b0ab5ac55d33b23686e5578 |     
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/99286e731d84d7ec78f79f58d20071bc1769fbb7 |     
   x86_64    |         libusb-1.0.28          | NOK | https://autobuild.buildroot.org/results/8865d2fd09b48fb2f1d90491f130612a8d665991 |     
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/ea236ae7ca7a7cb18a101925be218ab551dae4a5 | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/45c8027581e11b2edb2fef9f213471dfaa5b3a86 | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/d917443454b62ad4e34de7b693c6d3dc5c267d17 | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/2957d4cff98ad733be6d8af88480657457cd8088 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/4ccc5bc71cc3db3be6fef741d22d008935d3f3c3 | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/3fba1e7e8b923d712dc0bb8e31778e9e08b668db | ORPH
    sh4a     |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/ed9f15e6d4709b6b282b99f23e84cce7b52ca1ce | ORPH
  powerpc    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/a42431876a329043e49f4004def63ff73dd48cc7 | ORPH
  powerpc    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/c62a443ee6295a4aec432711e4761de4fc0c3ea1 | ORPH
    or1k     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/7e1f31df0720d562cdd81f59f016248a718172a7 | ORPH
 powerpc64   |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/d860a41234d72acc8adb6764072ebb37fce4c7f6 | ORPH
  powerpc    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/0f72fd8be1915c96149fcf9d83e1c4fa09e2aae1 | ORPH
 powerpc64   |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/43a6c36d6fbb94227ee1c5ef8a48e2ed4857dc74 | ORPH
   mips64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/0d3a34f98c2d8cde25ceb908bd1e3c94b43f6bae | ORPH
    m68k     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/b9ccca7c77c3eaa1e4b06696303ee5107090cb50 | ORPH
    sh4      |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/0c3e5b49909db0fe047f42f604d027f4c7f939bd | ORPH
powerpc64le  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/62137d79eba4a26e4fab6a960799043a8941bdce | ORPH
    sh4a     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/27a36eb00135abb7441c83194ccbf0ec2a13b879 | ORPH
   xtensa    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/0928309ff9bfaea1d4863be8c7f496fe865ca863 | ORPH
    sh4a     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/f7b1916c4970db6c94fd49cd234ac6ce8d3b081d | ORPH
 powerpc64   |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/d94bc34013b4c8ad261538b91780e8124a6a21e2 | ORPH
microblazeel |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/e816756bb40b2875dff7c50242d4427a2bd4389d | ORPH
   mips64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/f69fb79ffb6560825b03bc2f919f30997c9bb794 | ORPH
microblazeel |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/b7cb4cd8d4305a8eb064d9aa9139b6913dfa04b2 | ORPH
 microblaze  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/6abd1ab8fadb8e0372c96034ea199e40ed304f23 | ORPH
   mips64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/5e767a5cd87f9e5d18ab8d40f174fd3accf93399 | ORPH
    arc      |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/0da4af93d4053921ce53f795188dd33f921e45d1 | ORPH
 microblaze  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/ca470d0b27c73d95b9f356f1b3e97f1ac4eff079 | ORPH
 microblaze  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/b78369faeb42d0ef0fac4d2bcb39efe85121fd4f | ORPH
 microblaze  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/2c0c406c2430683336c78b1cc2884b4a910f340d | ORPH
  sparc64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/222d52dfaf80f5267f9564d9e4cd1e34a6aff287 | ORPH
  powerpc    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/102f3911f00f3dc1eb321ec46d8c372beb747581 | ORPH
   mips64    |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/ae8262bc13459860fd5128668f3788b381ffe832 | ORPH
  sparc64    |         mdevd-0.1.6.4          | NOK | https://autobuild.buildroot.org/results/ba995b6e5512d6a902840bdd9db9b131f8ec0741 |     
    m68k     |           mtd-2.3.0            | NOK | https://autobuild.buildroot.org/results/de62e3e120744ab8e971c2988ebee6a7f31ea931 |     
   sparc     |           mtd-2.3.0            | NOK | https://autobuild.buildroot.org/results/f5ece17bb2b436ef7d6a87f314929dc53e26916e |     
    i686     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/fcc4023ba378e1a07b3e0683fe462fcd05fc6e6c | ORPH
    arm      |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/c9c3e0f57c7a73b5be3cbb822b0ed25ff1f33ff8 | ORPH
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/216c5b8d21f9e3dfda035fb1b8e140c1da918aa1 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/1e8d5698f0d01c92bf22869ac53a72767fa55a49 |     
   x86_64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/31fe72a8556258b51d7851ca16fca31671598a9c | ORPH
    mips     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/d1efc45392ffd5fa2738682e0c050135f9bdf9f3 | ORPH
    or1k     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/51fec7d5778d5d01299dd5a3aa0cb0d15d93dd30 | ORPH
  sparc64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/7950a690e1a96186699a989ef97f3e9921ebc02c | ORPH
powerpc64le  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/e5ad303709390cbcbca6a85172dd5c9d708da5b0 | ORPH
   mipsel    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/e796a172f1d5cc87638564fa1f84e4d5aaa0f4ba | ORPH
  riscv64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/c1de6ceeb3368ee38b255151ee89e81a61990139 | ORPH
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/ea0b3fb682dd128c49982301c2b8ff9a25d4ac2f | ORPH
powerpc64le  | package/mender-update-modul... | NOK | https://autobuild.buildroot.org/results/f23d081134a84a5b0f10052a356cf1875c94d5ae |     
 aarch64_be  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/c8a0505e4a52d46987042ff8625ba1bdcd600ba5 | ORPH
 aarch64_be  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/140a59c0e9bfdf1026b9f3ee6cf45b24f2b9e831 |     
    i686     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/d3788eb8cca02e722362b41e2f2c8da20b015cdd |     
    m68k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/9c64406ec80175a90c5888854c522e98786ffac5 |     
   xtensa    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/98845ac098e84f83548ecc5e905963f2b69aafa6 |     
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a7e65d92a291a2b033516037d18f9fd201026763 | ORPH
   sh4aeb    |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/9c40dda809838961f5d9bd73a73c029555b4ab56 |     
    sh4a     |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/3c28c4894f0748d5506e3d145bf53c702f5b643a |     
   x86_64    |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/b7a13a500b5459b7c655894907eaa06af3ab84f0 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/d7dedb2e3e1534550981cc18826dcba53abe2463 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/67473c156d7881dff13a46cc537138285b17c2dd |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/9f7e3f4625b1db9fddebffa51cc20f3e859678c5 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/665ed88479e70b650a02833354dd8ec20ed464c2 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/e2e4f2e176872a22b6fc43e128fc571beffc260d |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/9fd349d6aa0830ce304438d2073ed622e8277e87 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/dbedec3c4d3f3bf62df4e4396ffcbcb30fd56dc0 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/458b62268593cd8c459d55fe46a68176cdb020cc |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/9d6ec484e2f0e1de029681b6e24890d164e1fbcb |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/b4a6e959363ca0281de7ab88e9d13e4dd7ac68d0 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/93c60d49004f67a359bbd92d1009c72123927c5d |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/c0f4367bc988484fc20a6ccc20ae12f0e22f7b71 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/91631f0101d0ab5372ea1984b02c2e25b3e11d0a |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1a321fa05599c2c7c10fc1a1cfe3c1d9b5b72e37 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/7d22c80d5bbc9e15c734ef129b831cc6db21d50e |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/0a547cfe81c746ce1673796802906b3128560a0f |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/ef15799a234d59d2260d37127ef85149e6bfa926 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/e0eca06ded3616a5315df7899738ef04cba342d2 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/a50d8fbf96ccfcba305a2be655183ab404e9c104 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/02aef0e5bbdba35fe05273926010ddabf4a027ea |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/220d6d63b7b202a967dc5c7df8aa86067548ef25 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/567aefc8db9e39040855f36dad8a84ed8504a873 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/be02ecbbf20f05a1c779fc32e93e0b2ea0eb0a5d |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/ed587f9922915116ef7be8b57c53dad26de48b84 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/8b8cadbe315a9aa9ed757e0bb7983b1f7ad32f87 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/3ec9b022f697180f27456f2c8b75bdbb13078af6 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/9d7208bf38595d8397417b058e57c40d3cd56919 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/09e15f5e74bf945457c2007120352c0068043de7 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/a2692c8d16b4f34a6a80a5d60135005e03dd5946 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/c33df339b9b3aaca137dae1a58919a5db33891b8 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/cba4ab243cfab8cc9d9869feff974c77aeb5f6d2 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/56e3905833124e18dfab5d3bbcd4caffa314e9b1 |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/2907d257a850c874964420f2e103a8bdda51a9eb |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/e2dda189fed6155edfb8089772a4423a2a76cbf3 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/876b4a0588711fa3516cf42ea229ab54dc390d52 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/02c296ce1ed7b329dc9c0a1e3d110de68da78676 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/1b9a4055cc4696435e2ca1398d242661de00b4d6 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/fe8878acd0103da8da702f30e72eef8ce80d783a |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3e1198a607b908f88df236d460ed4ac2722729d0 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/07bc98ef07d9f98edca1eb0e3ab8216c7790ad88 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/849d3a171a814fc1bf4e72ac3893078ae51d47c0 |     
  aarch64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/079e9d157f4ca3fe2b19eadc593bd66754a52d13 | ORPH
   x86_64    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/eff11d120b12dd655056a781b7a6ee1a735dcbed |     
    m68k     |       xlib_libXau-1.0.11       | NOK | https://autobuild.buildroot.org/results/3dfbb87cf843d5a7e56c38cb5407a90570223292 | ORPH
    sh4      |       xlib_libXau-1.0.11       | NOK | https://autobuild.buildroot.org/results/2cf3fac4b098a35323c20c8e50370fdfdb4d1049 | ORPH
 powerpc64   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/ab4ce726fb614366b66204c0f09e1e5d864b909d | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           at-spi2-core-2.50.0 | 1 
                  bcusdk-0.0.5 | 1 
          host-binutils-2.43.1 | 1 
          host-dbus-glib-0.112 | 1 
          host-mariadb-10.11.6 | 1 
              host-rust-1.82.0 | 1 
              tinyssh-20240101 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/bb0e67dbe629826a6e8850639fc61d38cabae305 |     
   sparc     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/df4171300ac054b2035f89d15c105c5cf0a7b124 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d8fd20c06e0bb615f744673125827c5b77cc7a19 |     
  aarch64    |      host-dbus-glib-0.112      | NOK | https://autobuild.buildroot.org/results/054e46f7be36bdcc9c4c39c3653f2b5704313459 | ORPH
   sh4aeb    |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/b3498fc8d313c0c5baf03eae9e589363aa173695 | ORPH
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/c027dae66214390ed02af7d223b3058195b4e0cd |     
    i686     |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/d5bdbe3912455139046bc07a1f98d55751453c56 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
