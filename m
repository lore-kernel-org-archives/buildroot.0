Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FF8E77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 04:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE33B40707;
	Tue, 31 Dec 2024 04:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-ynKiwNO4Kw; Tue, 31 Dec 2024 04:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77A024076E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77A024076E;
	Tue, 31 Dec 2024 04:14:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 65170E0F
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 04:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52B5A6067B
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 04:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9seN_XUD4UmK for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 04:14:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4954C605DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4954C605DC
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4954C605DC
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 04:14:42 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aa6a92f863cso1602911066b.1
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 20:14:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735618480; x=1736223280;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iELIpsIxcCpsXFwE1bKT/28abwYAHF2oPpxkt8hIv3k=;
 b=ic3MnyreGfzmyL7Q236aJmzwHrSDEro8qAZUK7D0rMQd7Ta/Jhyi869cMTsi2c8yth
 nqthcvfljrcFA2uN092TethvVbe64bEdWjx0jHE0nAkzOz7xhDUyj7p4gYChuvD8GwsM
 0L3D+MYAEEihQXnQDvcg2hee9sieq09zZW1D8+X9p0caosR/jidM5lOwmQ/MaOorHaQ0
 CqPo6os1S9xE0xPVgtgJU3xX27Q1L7Ad6kdeI+nnZ/QRUgIymZ1GWt0mgNhtA6K4hE5A
 IwWeZe9d55sDdJ2Z6gpkt5TBOMa5uTZSr93kiWVQgiyNZcxFamiBX7km8QcjpKElR6Vh
 mFtQ==
X-Gm-Message-State: AOJu0YzRXNrglexu7cePX2gsmCgtWue456XsPe3njhbFpg6OcXSzm1z9
 vOLCVk/TARWXKk32NH5UPpoKwAbqyHG5uY/2/xIdOdypHJ1cRUFizo1X3w==
X-Gm-Gg: ASbGncuX90Cso/VOC91rFAuY3ynfkxMPDOZBT08JsTbU6E3wp8uHNY7GYTaWx57hL7O
 PNYrLOKRC7YMNw3BfDU++wmV/DwBsk1WfkEpEJN+FOmhEWXc20hSCygoNxNItDNC6by+/u3AsK1
 sJJiilklN3TQbWbEYN62CPrGVIDAoJLQjYhMey6gAlM7z6fdsQI2M6B4oKQf8Ec6qaHrapL/O10
 Dyncl8r6A7wWb8m+NTwCSVQycqxcju0fO3OWpOsbrJuTR8eo0GTeLvykGyh
X-Google-Smtp-Source: AGHT+IFcWnvFmioHr/8QZQExrAvYpUmPs7iXxoWCGu+kcyx/MsvTpgrYqccaVcdFir9Q/PiT6XUgkQ==
X-Received: by 2002:a17:907:2d29:b0:aa6:9503:aa73 with SMTP id
 a640c23a62f3a-aac3378bb24mr3257602666b.51.1735618479827; 
 Mon, 30 Dec 2024 20:14:39 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e830b9esm1534427166b.36.2024.12.30.20.14.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 20:14:39 -0800 (PST)
Message-ID: <67736faf.170a0220.125091.e945@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 31 Dec 2024 04:14:39 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735618480; x=1736223280; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=iELIpsIxcCpsXFwE1bKT/28abwYAHF2oPpxkt8hIv3k=;
 b=GTETYt9yYC5Kiz+15PLZrn/Kl16yiFBuiGEJil9qa3iWCMOqI8xLyh8SgxAmKEynCq
 3cCceNPsqxp3p4Qu0ybt30HrP9uFh5A6y1N0l0thZ4QKeclSsPIsViyPaBUQYcldOe1N
 QWjrLghfmZP41pqVm/qEMxFVSnqOoEqYoJJdDW5cs96sTDRY32TA732raANb1blolCx7
 iZP79GzkXtN/88hE5bnAoWk4w+6M6iQPbpNN6D12C8a4vRsS7m2pLJimz2keaeqxP3tR
 EbYWXDKBbqSc/241i9ElDzWPhtJx6vtnFuf5P5Vs8p7cmhGzOjsoQPfkSGWxA3muggG6
 gkdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GTETYt9y
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-30
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

Autobuild statistics for 2024-12-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  3  |  0  |  7  |
  2024.11.x  |  1  |  6  |  0  |  7  |
    master   | 12  | 97  |  1  | 110 |

Classification of failures by reason for master
-----------------------------------------------

           libzenoh-pico-1.0.4 | 5 
               postgresql-17.2 | 5 
             util-linux-2.40.2 | 5 
                  linux-6.12.7 | 4 
             batman-adv-2024.2 | 3 
                elfutils-0.189 | 3 
    host-python-greenlet-3.1.1 | 3 
                       unknown | 3 
             bluez5_utils-5.79 | 2 
                 coreutils-9.5 | 2 
                   cvs-1.12.13 | 2 
                    emlog-0.70 | 2 
            gdk-pixbuf-2.42.12 | 2 
         host-libxcrypt-4.4.36 | 2 
              libopenssl-3.4.0 | 2 
                libxml2-2.13.5 | 2 
                memtest86-6.20 | 2 
                 opensc-0.26.0 | 2 
                 openssh-9.9p1 | 2 
                acpitool-0.5.1 | 1 
                 agentpp-4.6.1 | 1 
               apcupsd-3.14.14 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.15.1 | 1 
             dahdi-linux-3.3.0 | 1 
                  evilwm-1.4.3 | 1 
                  ffmpeg-6.1.2 | 1 
                  fwupd-1.9.20 | 1 
glibc-2.40-18-g564178076272... | 1 
        gmrender-resurrect-0.1 | 1 
         gobject-introspection | 1 
            gstreamer1-1.22.12 | 1 
            host-binutils-2.42 | 1 
host-binutils-bare-metal-2.... | 1 
 host-softether-4.30-9700-beta | 1 
            igh-ethercat-1.6.2 | 1 
                   iotools-1.8 | 1 
                  iozone-3.506 | 1 
                    kmon-1.6.5 | 1 
                latencytop-0.5 | 1 
                libdrm-2.4.124 | 1 
           libfreeimage-3.18.0 | 1 
                 libgee-0.20.6 | 1 
               libglib2-2.76.1 | 1 
                liboauth-1.0.3 | 1 
                  liburing-2.6 | 1 
                 libv4l-1.28.1 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
             lirc-tools-0.10.2 | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20240930 | 1 
               mariadb-10.11.6 | 1 
            netstat-nat-1.4.10 | 1 
                   perl-5.40.0 | 1 
                 pkgconf-2.3.0 | 1 
               procps-ng-4.0.4 | 1 
               procps-ng-4.0.5 | 1 
  python-pypika-tortoise-0.3.2 | 1 
                python3-3.12.8 | 1 
        s6-linux-utils-2.6.2.0 | 1 
ulog-0389d243352255f6182326... | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/71ec2bc01694e7f7c9419db83bc68a591442c9d1 | ORPH
    arm      |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/80c0b2a2f78c72e497fb3fcc4ee3e32502c1c8c0 |     
microblazeel |        apcupsd-3.14.14         | NOK | https://autobuild.buildroot.org/results/bed1821fbf4c4e7406760aad430169c55ad50416 |     
    or1k     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/bb0565b5920fac4ea41a8bf7c8f927f927c8a565 |     
 microblaze  |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/d77125114a3cb87b1abbd4699fa24d03523cf78d |     
 powerpc64   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/ae544cd6955fb4fe485658706d0ce78c7ebcd5c8 |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/82ba78a8bb06368b8312ffbb757189806d804c83 |     
 aarch64_be  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/68c5dd84585a7018ad57ea3e7134748c08858ef7 |     
  aarch64    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/312a63b8fee536d345e0e5cbbb0b0c155d81635e |     
    mips     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/dfb31420d43f23c5e5c4d8db618cbdce4e9f3bd8 |     
   sh4eb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/8776a02ca6604dc2617a901a646e0e4303be4403 | ORPH
   armeb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/126789c026d712865086008379cdb277d376d442 | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/8f6ef940ce7d62d546a0efae26334f25b4834c20 | ORPH
   nios2     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/734db51c613e69709f72283224bc9b8b060f0f91 | ORPH
    m68k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2ae1e0e745de2d434254d624342ea1be1676422a | ORPH
   s390x     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/7d2c063632044a87752fc72712a6381a7d15da13 | ORPH
    or1k     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/9057e89991093c1358b50ee45f984488bedfa3a0 | ORPH
    mips     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/6c7b30901cb0bc8579bda985705594accbf9104a | ORPH
powerpc64le  |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/9233db6ca0e70d8e90a3ef59e521d1398724502d |     
 microblaze  |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/d412a0793cda76685942027a092afd63615c07d3 |     
   nios2     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/5d3b02fe2acc56d5ed41460337131b7a2f6ff73d |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/c335c99d67ad107ba61ed0ecadaa3e1ccebd118f |     
  riscv32    |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/db86337455c19c0dde4aa0d7c9f61d3af7113196 |     
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f49d6c81ccf19b13d5f6eeb55ac7c616dcccdd78 | ORPH
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d455357d9684e742e42a18ac502c978e34b8b520 | ORPH
    arc      | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/23a19a1534b865880d59a11db9ba238026b51fd5 |     
  mips64el   |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/d701bcdb88348ff847bbfd6df77394549966502c |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/5368c002ce85f7407896cb1d34d204cc499f5fa2 |     
    or1k     |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/e0110a09c8a35a20b92fcdfd763e33d22272820d | ORPH
   xtensa    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f0de02acc893077182651298a4d38abe7b20295b |     
  mips64el   | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/ca6cb500c17a5fb63dc5482898850f09efca9902 |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/58e18bf67dcf8fc39f8017c6addcd38c1b7fba74 |     
   mipsel    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/d4348d7f872ccd734795a1d071960a696148ed6a |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/284a71773c94b8ed3f96b9e5aeee1eb64722a896 |     
    m68k     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/bbb11375285fd89da6bed9c82b25d5c10eb2fe64 |     
microblazeel |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/cdaeb4033e2732ef4aae6a5b0809a207f8f8fa87 |     
microblazeel | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/c970397ac6dca377be36b5ce70a7e4fa037083ea | ORPH
  riscv64    |       igh-ethercat-1.6.2       | NOK | https://autobuild.buildroot.org/results/1bb799f4ae6140b67c4eb28c04aa45ccbd296b31 |     
  powerpc    |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/55b791da1220703abb3008b82cab44d2c7b47275 |     
    arc      |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/92f734c26657d595f5f397bdc2afa0290d15bd35 |     
powerpc64le  |           kmon-1.6.5           | NOK | https://autobuild.buildroot.org/results/3d9d49739513204724f4080ff714e06d5bc2e091 |     
    m68k     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/ca2f2f6cedb24a6197748d542b0d28397bd17848 | ORPH
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/569a741ac09decff44a13c022bdb1add4a175aea |     
 powerpc64   |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/3d4ba97f97edbf81253efdda0c82677792279da9 |     
  sparc64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/e476b2f94becaf34daa716db812b32939e1e8b08 |     
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/6b2f85d9ab232bdd2117dfc342c68a5a591e6e40 |     
 powerpc64   |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/2b2ae19f05e9bb26a38e032775a12f8e7184e4eb | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/5c4ddbf2af30e66c78400adfc36bf29e32772e73 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/cedaa615afe975f8d6273a78a25289d39e377f7b | ORPH
    arc      |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/34abc17893e17f288ec12d48fcc1526d6a1cec6f |     
   arceb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/615684ebbcee328aa35434432256d3adf9afe415 |     
   sparc     |         libxml2-2.13.5         | NOK | https://autobuild.buildroot.org/results/fd4f8d2e8d8ee68d9e18f761ceff350188e55a87 |     
 powerpc64   |         libxml2-2.13.5         | NOK | https://autobuild.buildroot.org/results/a8a580fd6fffd96eab1ed88263b701f26b5f29ab |     
  aarch64    |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/e31499e663174cd2886651f0c9e6ac84b89a013e |     
   nios2     |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/ed42d30bb25e2f0b5ba35adbaf6aa2c5fc24ec42 |     
   s390x     |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/7e448b10dc657a6aa69ec2fafa147b3e5c176f9f |     
powerpc64le  |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/06e5598228a130236ba021f53f986b36ad5a2494 |     
   mips64    |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/6be7098f7a96e2c70cfc2072fc960e4ac625480d |     
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/54af65556c72dc0f7d71c3e8e8df1719eba833b4 | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6f3b7757037774562ce12eac8273ce2432e3159c | ORPH
    arc      |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/2726ad78ca8bdde0d57e659726b7402bf932ba57 | ORPH
  aarch64    |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/375f48cabebddce3b1d23c820bc3a722c8cdd819 | ORPH
   x86_64    |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/70a2cb6fba8c9d7c8673609ce26d5fe8528bbc19 | ORPH
  powerpc    |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/134c0b8144038be470f6721838b642acf89a2ceb | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/e1d76a4e1a5a6e17bd95b1f2bb652cdcd303a26e | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/4185f5f5cee5858f1717d85819a9635c0b1d0a43 | ORPH
  sparc64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/f1c6286689a59e4535bb0f5ff803098491f05b87 |     
   arceb     |     ltp-testsuite-20240930     | NOK | https://autobuild.buildroot.org/results/d3ab4369c9d012143cad825696c632e12d0ea06b |     
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/efe68ba17a1a6c6fb074162e564552740f20ae26 | ORPH
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/fe68bf0080223bf8b0410790f5ba7bc49af75640 |     
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/196e34b1c2325085a5b3e5317998de324f065244 |     
   sparc     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/95c32677aaa81bda35d1aefc2766a7e99c7cdc17 | ORPH
 aarch64_be  |         opensc-0.26.0          | NOK | https://autobuild.buildroot.org/results/5fbb20debe2518c7cbbc01584b1ab05a81cc7d84 | ORPH
    m68k     |         opensc-0.26.0          | NOK | https://autobuild.buildroot.org/results/bfd13b75d586f5da25a6623e400e0d6881857e93 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/549980cdb61295b5c0fda3ef44bb6ef42e7c1af0 | ORPH
  powerpc    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/b0782e4fc928b925705ff5961604e6a897d7f5d1 | ORPH
   sparc     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/14316e1c7d21b2131c13e741ca74b5026d753ab0 |     
  riscv64    |         pkgconf-2.3.0          | NOK | https://autobuild.buildroot.org/results/c5664b92abcb8e06301e2ef0e43a6d9885c1e2bf | ORPH
   nios2     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/821f1418b13c3345fef5e80d9f9b6102f91669a1 |     
    i686     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/ac11c7ffca4fc7d395cdc871f92e3a14f0d3cd80 |     
  aarch64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/7d57ae4cdc43f128d43d589db99525d4ffc65d20 |     
   armeb     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/f35cf441db6a94426d4e5003ddb02f201b95f444 |     
  sparc64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/378027db50fdcb311b420ad6886795dd8c2888f6 |     
   sh4aeb    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/98eb03c4589a0f092fb5b16b56aeea52ca8e21c7 | ORPH
 microblaze  |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/e2183b8bd47a4894ce0c250abf6966438a46f5a6 | ORPH
   x86_64    |  python-pypika-tortoise-0.3.2  | NOK | https://autobuild.buildroot.org/results/7025901662aa8d015789d6e42eb13853c7b1f441 |     
   arceb     |         python3-3.12.8         | NOK | https://autobuild.buildroot.org/results/d6abe901ff2482f865a4c69c980b205ee833fe87 |     
   arceb     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/72cd6ece1d237df43062e0432ecb18d8188b44d1 |     
 microblaze  | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/2813864a2c47739ac10acbffef2b7eeb4e055442 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/98c51ef58869de7d42477c8fb36a2310316d764d |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/94a4e6d23ebf156288e9027c38e7f235b8b88e07 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/938e22bac7710c8bebf8d3674f9256b73ba5669c |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ca71ea35b36c54fbe58ee39d2f749d49706e14a1 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/65b823baee54a3f471fd5c33a25059d8c9fc8da0 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8a1e6cea18843b7bdd185b81223a7b9d79701c5c | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/335501f95968f10aa94d594f9f3c29f47e48b05a | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/fdbfdb3f5c18009a270c0b45c801064a45c86b49 | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/710bcfe716ee60876c3632f6c29b2dda990c9649 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    chrony-4.4 | 1 
host-prelink-cross-a853a5d7... | 1 
        host-python-lxml-5.1.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4a     |           chrony-4.4           | NOK | https://autobuild.buildroot.org/results/59eae5b8fd9eb2c5450fa403ed99c1d35c471117 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/50671dd5b8f645203198a556d632c307a8b1c3a3 | ORPH
   armeb     |     host-python-lxml-5.1.0     | NOK | https://autobuild.buildroot.org/results/369ab5c37815822eaff1f63058df2e4a16266e71 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                     daq-2.0.7 | 1 
firmware-utils-86739f2b3ae9... | 1 
                   foot-1.16.2 | 1 
              libopenssl-3.4.0 | 1 
                  libsepol-3.7 | 1 
                 linux-6.11.11 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/e4f1ef97bc0dd1017345f68508fa872229c31c8b |     
   arceb     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/ebacbc152cf68ad1d090e979570ef7a6df5c8c3d |     
  riscv32    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/deb3bed960bd14b36b15180dafaf02e3cc231f3d |     
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/8a43a3132cc9627503e9a288dff9e8e519322bf2 | ORPH
  riscv64    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/a1ba97cf344ed5b896873a51ddb3da65841127f0 |     
 aarch64_be  |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/fe4feccc0d74cf99c214c7a81b91929a4010597f | ORPH


Gitlab CI results for 2024-12-30
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8738649678  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8738651120  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8738651122  | ORPH 
             TestIpRoute2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8738649964  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8738650207  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8738650364  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8738649707  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/8738650514  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
