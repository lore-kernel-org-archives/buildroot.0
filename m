Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2ACEC0219B
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 04:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EC0B84997;
	Sat,  8 Feb 2025 04:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92kVkFS2gJ_s; Sat,  8 Feb 2025 04:14:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 286CA8499B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 286CA8499B;
	Sat,  8 Feb 2025 04:14:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 120A71B5
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 04:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF8678499B
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 04:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GP3qSIBzY8w for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 04:14:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9149C84997
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9149C84997
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9149C84997
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 04:14:49 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ab771575040so509030066b.1
 for <buildroot@buildroot.org>; Fri, 07 Feb 2025 20:14:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738988087; x=1739592887;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=25Vfn3OmCsXY7h/Y7j3hh2AVWf5wfJYV6zIdZ6MamyQ=;
 b=QCJ492isRh1qkYgickGSFZbmArVkqJ3HhmDQZ0I8I7ttTLvGk2lPsxyaf4jR2uWZG/
 f2ZgMnMOs1HUK6pQSh9H1b6cBuZJsi/e50NG0ONdjVkcILWl72Balq2G7QkcxhS+mK86
 15TIDBBHiQJPV5FDnwt9R5g98z5d0NtCdYg/v59feOqU9u9iLb6uTV09ib6EVhmmDT4R
 J1STNxp9lQR3A7H3TxXc45d8EHGzqBwY4kosN3QTYHA7K++tnGX8BojghaWMHFXSjqEp
 Yy92NVOaJaHjefvqJmg0qUumh31kMeYyfEwNB0/4o83xORqcpT562LOC1oB2n2kYkWmL
 eRyQ==
X-Gm-Message-State: AOJu0YwrHtEqJlbPnWURitLxrnZMgevm8IvoQIvi9j62jjXlo87EoSVr
 gjqnXvK1mrs1O3HgJ1V8keXTisrEmh6F1e4hubXMRRQQEpRgw5QfDMmUzA==
X-Gm-Gg: ASbGnctke8MjVqMawF5jjW4EkUYYM/8FZ2b4ZQKHaxL8ToH1En70zkdc7cQwutXYxbq
 r2uuBNxMqYwucJS5aOB+s5iSuF7Z+3cbxyDpNhvpv9pBggRAyDTUOAZKvdraxJjziHBqVIt/ou4
 A5z/doEXpLROT/hV0ePNRKlcrFDUPUS18rIZ9flD8kdnCCfKWnjIrzbfBq9wSfSl5NOFP8gx5jz
 x1eBWQvH/nnlldGxmSQcM2GrX48t/W/W2GzmZ5HfzfgrS4eaH6WxDiBZzfMcSCpB+pQBur/2eI+
 88bPIjjsjulCr4O8hF8=
X-Google-Smtp-Source: AGHT+IEaDVVv/0O8dA+pKY5L7ZL9ltzDGNHHb1XvyOT0L5T0o7ZjFADKqwvHNCDITxko0NLl9aKL8Q==
X-Received: by 2002:a17:907:9719:b0:ab2:f255:59f5 with SMTP id
 a640c23a62f3a-ab789b4a40dmr656931266b.16.1738988086913; 
 Fri, 07 Feb 2025 20:14:46 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab772f497c9sm388038466b.7.2025.02.07.20.14.46
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 20:14:46 -0800 (PST)
Message-ID: <67a6da36.170a0220.15dee9.b1b7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 08 Feb 2025 04:14:46 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738988087; x=1739592887; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=25Vfn3OmCsXY7h/Y7j3hh2AVWf5wfJYV6zIdZ6MamyQ=;
 b=gjP2Ye3UXeaBeVd7c0f5Pjf9d/xdXtS0lM658A/lrPfwOrIoyxcez1NqjYfRcwXa9A
 +1892ZKm2t6rxwp47432hPwBy5NwoDYIZv8bQkxaVVs8WOVR5b4OuPXVR9k7hun0vmSO
 zeeOsdS7fnmmvDxFEkbMvKVMJgC8drczemf90EYVPnecyw6zeT1PJ9vVy2IHToeQLxTg
 ZPiIaUyAbFJEoYbLdNgRAz6NYUI43V1N2V2rmy0nlgjwfi2EuHbkt0pSKuRLmZJjTc1t
 UXL9jNO8HMEmoo18i4InH8LHA7jOxhHCxX869uoe3rAIgoDlemQTp7JKbMyyz5LWaUZL
 lrBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gjP2Ye3U
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-07
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

Autobuild statistics for 2025-02-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  3  |  0  |  4  |
  2024.11.x  |  0  |  6  |  0  |  6  |
    master   | 13  | 348 |  0  | 361 |

Classification of failures by reason for master
-----------------------------------------------

               host-qemu-9.2.0 | 64
                elfutils-0.192 | 21
                 libcdio-2.2.0 | 19
                     gzip-1.13 | 12
                   host-go-bin | 10
                  ffmpeg-6.1.2 | 9 
             fontconfig-2.16.0 | 9 
              libopenssl-3.4.0 | 9 
                  ntp-4.2.8p18 | 9 
                    mpir-3.0.0 | 8 
                 openssh-9.9p1 | 6 
                   perl-5.40.0 | 6 
                 c-ares-1.34.2 | 4 
         host-b43-fwcutter-019 | 4 
    host-mender-artifact-4.0.0 | 4 
    host-python-greenlet-3.1.1 | 4 
          linux-5.10.162-cip24 | 4 
        s6-linux-utils-2.6.2.0 | 4 
             util-linux-2.40.2 | 4 
               valgrind-3.23.0 | 4 
     bandwidthd-2.0.1-auto-r11 | 3 
                   bird-2.15.1 | 3 
                 coreutils-9.5 | 3 
                   cvs-1.12.13 | 3 
                 libv4l-1.28.1 | 3 
                 linux-6.12.11 | 3 
        ltp-testsuite-20250130 | 3 
            netstat-nat-1.4.10 | 3 
                    polkit-125 | 3 
               pulseaudio-17.0 | 3 
                       unknown | 3 
           v4l2loopback-0.13.2 | 3 
                 apitrace-10.0 | 2 
           at-spi2-core-2.50.0 | 2 
                  bcusdk-0.0.5 | 2 
             bluez5_utils-5.79 | 2 
                   duma-2.5.21 | 2 
                   foot-1.16.2 | 2 
                   fwupd-2.0.4 | 2 
            gdk-pixbuf-2.42.12 | 2 
               graphene-1.10.8 | 2 
host-heimdal-f4faaeaba371ff... | 2 
                libdrm-2.4.124 | 2 
           libfreeimage-3.18.0 | 2 
                libglvnd-1.4.0 | 2 
           libzenoh-pico-1.1.0 | 2 
                   linux-tools | 2 
              luabitop-1.0.2-1 | 2 
                  motion-4.7.0 | 2 
                   pcre2-10.44 | 2 
               pcsc-lite-2.1.0 | 2 
               postgresql-17.2 | 2 
               procps-ng-4.0.5 | 2 
                acpitool-0.5.1 | 1 
             batman-adv-2024.4 | 1 
                  bitcoin-28.0 | 1 
                 bitstream-1.5 | 1 
                  boost-1.83.0 | 1 
                    brltty-6.6 | 1 
                   bullet-3.25 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
          cloudflared-2025.1.0 | 1 
              containerd-2.0.2 | 1 
           crucible-2023.11.02 | 1 
                   crun-1.18.2 | 1 
             dahdi-linux-3.3.0 | 1 
                     daq-2.0.7 | 1 
                 enchant-2.3.3 | 1 
esp-hosted-927a34f99724bb74... | 1 
                     exim-4.98 | 1 
              fftw-quad-3.3.10 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
       gdb-arc-2023.09-release | 1 
                     gdbm-1.24 | 1 
           ghostscript-10.04.0 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
                 hddtemp-0.4.3 | 1 
              host-bison-3.8.2 | 1 
          host-libglib2-2.82.4 | 1 
 host-softether-4.30-9700-beta | 1 
                host-zic-2025a | 1 
httping-0e26c53d5fe504eb720... | 1 
           janus-gateway-1.1.2 | 1 
                       kmod-33 | 1 
                   libcap-2.73 | 1 
               libcap-ng-0.8.5 | 1 
               libcgicc-3.2.20 | 1 
                libesmtp-1.1.0 | 1 
                 libgee-0.20.6 | 1 
                  libnss-3.107 | 1 
                  libsepol-3.7 | 1 
                libshout-2.4.6 | 1 
                libsoup3-3.6.1 | 1 
              libunistring-1.3 | 1 
               libunwind-1.8.1 | 1 
                  liburing-2.6 | 1 
               linux-pam-1.6.1 | 1 
             lirc-tools-0.10.2 | 1 
         lttng-modules-2.13.10 | 1 
              lua-utf8-0.1.5-2 | 1 
               mariadb-10.11.6 | 1 
               openblas-0.3.29 | 1 
                ramspeed-2.6.0 | 1 
                 rtptools-1.22 | 1 
                     shim-15.8 | 1 
                  snmppp-3.5.1 | 1 
              tinyssh-20240101 | 1 
        util-linux-libs-2.40.2 | 1 
wilc-driver-linux4microchip... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/24993b936232191cf294b9cce32a30c742879427 | ORPH
microblazeel |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/60491e8ff84cc9f0b1453d485b250d6f3c74aeef |     
    arc      |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/898a3ee814d07d6cda6084819ad434d230ddbfcc |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/fd690d15bbfc3b5c9ed9d09125779394a8828927 |     
  mips64el   |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/2bec6427c06012787de0b6a87bf2aba6c3bec3be |     
  powerpc    |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/32ea24a821e755dd5422139bff825dd89fc9e1ec |     
   mips64    |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/b547fb4d5437338d1c4f10867b9c4b72c0330845 |     
    sh4a     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/cff57273397c3ddc26054b79b460ff432a2503e7 |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/fcb1ed3afe0dd8d743378ec26171aab913578b49 |     
    m68k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/c61867ce7aed1570499c6c355a9fb04b91683202 |     
   sparc     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/bfa26c3e8301fdfcaccf769d4493da076f11f9b3 |     
   mips64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/53515728b0173c8c02f45cb63755a13952dd5636 |     
 aarch64_be  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/f4bb5871f110d5400449f1189ea6791de593703a |     
microblazeel |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/30f2858bd90805a09a1332e402fc236db0e17c4b |     
    or1k     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/0b5e822c237285f37933a7655a79a786691209ec |     
   sh4eb     |         bitstream-1.5          | NOK | https://autobuild.buildroot.org/results/986471f7fd5fbbebfe47a247c88034dd20ed34e4 |     
    arc      |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/9e69953675919a2a76b47c5bc74cbc8837e0ae97 |     
  mips64el   |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/251fc72e9c3445fd2bb7275c00ae762e99077753 |     
   s390x     |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/501a4cbfd139226da1018a0bd5189faacfeab2c6 |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/cf882be58f15a5f91813ca1e4676a198484d9a5a |     
microblazeel |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/538590fe248cc9acb7c408c8b351cb54ac606f8c |     
    sh4      |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/4947854c152981c81705a9ee5b26fe8a828ef0c3 | ORPH
   arceb     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/e557d0b4b26f3223dce1e7c4a60599ecee28f99d | ORPH
    mips     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/fde87d2a8783168ecee532288da3ef852b234268 | ORPH
  aarch64    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/fac2fd66c3cceded117abe4cf2a79c4b032801aa | ORPH
    or1k     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/de85cf548a2e97ca27e3a20949ec58a7f66c35a2 | ORPH
  riscv64    |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/00e2bd65044f7beab27f3a7e17915607ad393baf |     
powerpc64le  |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/c4f1cae50ddb23619b62197ce8848d8d17c033a8 |     
    sh4      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/a24186b129d28690e101d50a64e10839fbd5fde1 | ORPH
    arc      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/d2e98168652e50a736b9dbe0a012577d38ef3b66 | ORPH
  mips64el   |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/909c6814e4dd8e56112586be78984d62a1060e04 | ORPH
  riscv64    |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/53ec1c388c84afbb9b5cf4507a72fac7769a28ac |     
   arceb     |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/70685451c4dcb750b3d3032b2cd0c25e38f28af7 |     
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/02be5e1e2b7cd0e37d84ea1210cee8f14c1dfa89 | ORPH
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/3ac120c8deb3ba67bc035fe71e107b218669b967 | ORPH
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/3063fbfd38f7c838671a3d7d75167084b8e381ac | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ef015d39eb5dffe44b5c42cdc558d218fc549e5c | ORPH
 aarch64_be  |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/d668b25ab534ccd492d39de725d916df05dded00 |     
    i686     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/2bd2c288d576b2e579697f64dd447fe86de85cf6 | ORPH
 aarch64_be  |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/996181eacc45209361adf89811911133058a15cd | ORPH
  riscv64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/fe2c63542e72ef379f72431b8228f61b0ab09d00 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/44dab9f3b3571a900f9e8d49d940bbf04f692b73 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/87f3723232a4bb1122c7b7c66f5554514d24f580 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a67b2e8d540d644a32b830c1f80c6475d90d4e1e | ORPH
   mips64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/332e5a0fd2fdde154ef0b5762271d007e130d956 | ORPH
   mipsel    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/fe8cffb33cc1610370220a23290324a7ca82dbd1 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ace4ef679e6f02e352d70de2926207904f29f2f1 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/21fd93d77cfb23e820bf0cb1d7df3f152f63fa94 | ORPH
   mipsel    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/bb6fd1dab9c3e946290f420272e8f473dbf472fd | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/252951332e34f66258f878a6ef40220d595dfb13 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/6e70854b36dd8cb518385197e292372afcd85271 | ORPH
    mips     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f7765c6df971ef03f449d03951926a242f0205b9 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/52d583864de5460c51b8de52e98577681cbb3ef8 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/1de8be1d4bd46156b50710b432ae08e48c5c310e | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/386414cdb3f6ba94a5880cc8de95c73050aabe76 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a141da98cda785b7be5c16ff26a92d0a934e87e3 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/31077f2f19177347053bb4c48e80863755343d3a | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0b97244f90b72e52bdf32134f94ff20ed7f02743 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/4e088a0ba40e07b558a1d463614bf338b349cacc | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b1aabb8e74d4bf8bc9d22bc0b3dd8d920016804e | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/075b4639be6f861dece3637359389f5c0cf2a181 | ORPH
   sparc     |         enchant-2.3.3          | NOK | https://autobuild.buildroot.org/results/4b70fcf08000607bfc24e8c80b065bc94c36bc9c |     
  powerpc    | esp-hosted-927a34f99724bb74... | NOK | https://autobuild.buildroot.org/results/eaca76c4d69b93fbdbc0987bf9f4245d0498f760 |     
   armeb     |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/b490927a44563e091e23b8400d4007d65454d7d8 |     
   armeb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/845976ae7a6dfffddc617e066e69380d512b768c |     
   armeb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/ce6df352abce9f67df1a8e689a8b05e8448f95f2 |     
 microblaze  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/94ac814aef2750aa847e62f7a1b8f3295dfa5d41 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/b06c8554e0f31520ae3755563220be6355fde9d3 |     
    arm      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/96f1025bc21aa1c0600b1724201f1f7146294ce2 |     
    arm      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/1d1c63381998aca8c6ba994766e08b3ae4e14678 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/624e623d786d91276d8da272fadbb111512a988a |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/58935ff8d973cd781781c7c1224c2bb5b62b282d |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/7fb4c78f450d7d8af4f16d634427476b16d2c76b |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/da118c9c1ce1c7e41d2f6233e44b64b9eaa49f25 | ORPH
   x86_64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/582f2f0576fad5db6edb3dbc7926d556f4f2f3d1 | ORPH
   x86_64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/4098df8c591ce9d3f2ddbfef9a40e55a9a85b2ba | ORPH
    arm      |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/101e5d886a105af16a8c4c7777abcecce8be44d9 | ORPH
  riscv64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/56c496d2d20ace08ead5a2ed0a188bf1488e1f8d | ORPH
  mips64el   |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/f9625ec94037e7f2bd956f673751003dc96a0a93 | ORPH
  mips64el   |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/66ab2de7b4c8e45aa1369cfa9350a8f3f5c40fbb | ORPH
   xtensa    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/4cc92c42b68c18cbadcae7ea045c1ff3aeae0203 | ORPH
   mips64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/5f0c716c20788ba49a3a9f185251ded373a764cd | ORPH
    arm      |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/0ceeabf0cdaf6875541cb186ff731c1024d7bddc | ORPH
   mips64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/0967ed9fb43e7894b66980b31058cc65d2a4b36b |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/5f60e57e53108cb1968a7ee0ad722fa6a20aee09 |     
 aarch64_be  | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/2e15ea3bfd6aca00ed85e036624272bbbb21c59a |     
microblazeel |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/7f96cc4c2a48b508956be081db5beb9d1d4dc13a |     
 microblaze  |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/432bface322db6093f27e53d9601913dddeae1e4 |     
   arceb     |    gdb-arc-2023.09-release     | NOK | https://autobuild.buildroot.org/results/a62095772ad863d36926c0aa18dec1c68b91ef9e | ORPH
  sparc64    |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/f1a2fc953f9f05c10d765825a4a1366130e2a2b2 | ORPH
    m68k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/a8fb90683f5b9035328985c61ee7f0050f3b7d9d | ORPH
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/4d72bde8615f6ab1f1b97c8e1686daf312a243c1 | ORPH
   armeb     |      ghostscript-10.04.0       | NOK | https://autobuild.buildroot.org/results/dbed5989c0f2128c75cb4de7069ac5c07ccdf816 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/cb5a51470ae7fc8ba5847650d01ff6febb90414f |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/36fdbd035daab7f9401452bd8d1591ada6f554ad |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/d4a2fec1ee4dd8556af206f950f5397f86f7bb83 |     
 microblaze  |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/ef1044ce420832b96cb62f2f506c8acb1bb327eb | ORPH
    or1k     |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/68e524bfcaff4241bd562c9c13b3ceb534c435c5 | ORPH
   sparc     |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/8ebafa78087822b834d1133684771cfb00924838 | ORPH
    i686     |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/20c17427c039554c996a5c15e411d715b03bf72c | ORPH
    arc      |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/e153c55a2e1cfb4e8742db5071d7f620a81beaed | ORPH
    or1k     |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/d99b653ea1ed5d39bd7d906d5dcf9994798705b2 | ORPH
 aarch64_be  |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/1825d1eeedaab60d6b4e1a0225b8be62550ad416 | ORPH
  riscv64    |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/1b5d74903369ad4b6ea803ea8a7d3fd05ccc5312 | ORPH
    arc      |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/1d97e3f0c626421fdae45e794f02c560d1b9080c | ORPH
   arceb     |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/56083310acedba31dccc1f6594f814347bf21caf | ORPH
   x86_64    |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/fbf31c8c09496cd3fe02e8ed55939dad5c1cbaec | ORPH
    arc      |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/1894432e9b4a30dc4d063116581fbb99f7863d02 | ORPH
   sparc     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/3242115b7b9a92469aca4f1ff04d5fad2aedf280 |     
 microblaze  |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/bdd334c68da0eea10a8b5a22f43d5b8d344cf290 |     
    i586     |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/c75e6bc9c2756fb350b15d3a950263728ec4ae14 |     
   armeb     |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/6409c251d44b021bc3d3ea8344dba5d0ae37c72c |     
   armeb     |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/fc70830be808329742a0534a12d68be2c807c957 |     
microblazeel |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/2ac2c9ecd5395061f2ff44e1f9465f45266eb47d | ORPH
 microblaze  |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/d8dfdb0b4bbf5bfc8078260ce98ed727cce71927 |     
  mips64el   |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/ec36e04ca7c11099cf194b7273cc1cb4a2855b12 |     
  aarch64    |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/abc9f673eafb3b701bd0ab7465232c7a3605a1bd |     
microblazeel |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/ba9e2807738a35b5c0024be3e2f4b6ba1931a545 |     
   s390x     |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/8f141f51eb72cb22bb8d6c65cefc574cc4a16746 |     
 microblaze  |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/5fa69965f5a0d4664666ddbb682d90cf1a2592b4 |     
  mips64el   |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/26cb745243f36a06dd8f63984fab18f77ed1d019 |     
  sparc64    |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/28d45e46db5d2783176ef4d0e6a0801448f5d9c1 |     
  powerpc    |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/ad34e60978e42c1cfbf13d8119bf92d5ff3ece7e |     
  powerpc    |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/433e1222d12a6f359e28486337896c4cf7cff788 |     
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/973242725641d288f99a5a3187202a71400f61c9 | ORPH
    i586     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/0cc7dfb588c177b8fb9f514d6402aeb21da6c5ed | ORPH
  sparc64    |      host-libglib2-2.82.4      | NOK | https://autobuild.buildroot.org/results/561f253d49ed1d0cf81c8e23ef25d1f9ecfd0c32 |     
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/0bdeb49f9d1aa00b09926283a54d235ecdc55e19 |     
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/29f650da913bfe3d58d87a7dda5134fc8f034053 |     
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/9a07ccfd1b6cd0716702072f15c9ed4def4e0a68 |     
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/fa7d9fe6e53511e8810d2a07b29a9947a1eafc71 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/39186be3c5143c4056a9729617ae360c662a1580 |     
    arm      |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/d24a92787c55ece5efbd6970cbe7c61ec37d0d9a |     
  riscv32    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/94415d5c20b50488deaf9f128ad87549db475b60 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/d1b4f30467079523e3ca663b8461627a0dee9223 |     
  sparc64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/46f70a4ed3974b11396e6c732aef074313a8394a |     
    mips     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/f7797ff8815df809fb92edd3912d2f5c8ddc195c |     
    i686     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/88f8ea0bea2b167506b692aa0908047cb2518213 |     
    m68k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/b3162c130dbeb0b18d37206797c0e1f97fefe800 |     
  sparc64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/51de2440601886457f7d30e0074cd875c0e5cfef |     
   s390x     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/01a20e509e2aa18047d9312930dbf63b28ef6b4e |     
   mipsel    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/dd5ba9764cf1b1a0f5cf1bac018b0c806c0acca5 |     
    sh4a     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/d34bcee8b019129593fb335464c0835e874d70c3 |     
   s390x     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/c28f540ae9c38d2747d29e53e785c887a1f50a18 |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/3aa3b5c95b468440cc5fee6701095f40a4e78ea7 |     
    m68k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/9accb389677ad5a4aebfa3e27950f1dd17156b35 |     
    m68k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/8644acdb3b8ccfc34dd971398d595d02f82068a3 |     
   mipsel    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/1486eb799302006ddcbc15e4a8491a967a0eb456 |     
  powerpc    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/a6fac5761622461bf742ad11a8b78231e39b5b65 |     
powerpc64le  |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/92f1b76410d1755c019d92ca5e51b49643ed91b0 |     
powerpc64le  |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/7ff37c2305300744ed66713108c7ca433f4acc84 |     
  sparc64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/3ecd8efd5ed349e9d6eb41cbcbf7cb2becf8f814 |     
   armeb     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/30574da8a612d8bfc938569090f6edf57b0193ec |     
   armeb     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/1cec06809ce3865cc95ab0fa6a204e3a32d25d97 |     
   sh4eb     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/613afe384435ca6c1ce09a8c396e8fe7dece52a7 |     
  sparc64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/99c17f41017f6f756d4d0d040aaacdee54cb892b |     
powerpc64le  |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/776d44ff05747dfbcd4986eac33926ca56b2bd6c |     
  sparc64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/a2724829320f3c5d947e559dd1a708101a5c20c1 |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/4bf6f7cfcf938555e3915030bedac1369931476f |     
   s390x     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/f05a6cd38096d62382a529c2f9abe054d53a7696 |     
   s390x     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/c64eddffe220b8affb27e52fb0182e508bcc1640 |     
   x86_64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/88757a1311e4679b8330dbf251ebc4093a3f3851 |     
    sh4      |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/bb93ef9ece8f6158c62be80a71e3c863876d6220 |     
   s390x     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/b7b7ea84c337ae314884681fde2577aa68bc3c73 |     
   x86_64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/1be6eee506db929ad9454248b15c55bfb1b97777 |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/2fa8dfe417b5dc8d7d511bc4f9b3da5dc4474635 |     
    mips     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/a2e039a4eb1f0466955c70cbf7aab31d7ead419e |     
  sparc64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/e6dd7b1d8b5409565490096caeed2e4f83e9df15 |     
   sh4aeb    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/fb9c36338dc8e72ef4cac417eda3751ccdc8ccde |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/0590c43ef451ad5aecc893cdac8292e9d57bcc1d |     
   mipsel    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/644441d270b3961c2a9e000695c13cd88caeab3e |     
    i686     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/eb7826a43d478ebccbd115cea03067fe93c60e8b |     
   s390x     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/cfcd8f4c28364a56517ce12e1856028cfe5a8c83 |     
   x86_64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/e50896930ccc1b6d9b61bbbdb3db8171a1040880 |     
powerpc64le  |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/1df320b1645cbf09a3ff8b358f445a363fb786c4 |     
  riscv64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/7e0e46276b9facd1660a7bca1e6b596ffd240068 |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/b0ff99eaede3e3c0bdd57a5cdc104b7ce09016ce |     
    i686     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/405bb5bcc7f43060f220fc95681d0f795802864d |     
    i686     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/b3329213fffd5aa729ecab6f09b9b970c9ed68e4 |     
  sparc64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/7c3f613cb3af2ff6cfe6100747e60002696310ee |     
  sparc64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/b8fdb0f864f082b4ddebe12419d36a9ecd1ec8c8 |     
   armeb     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/0fe04c6ee3eae535f151f341d664868950afbedc |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/d1add4c52be1ff1f33d6ba1ee35f367fd7f2631d |     
   mipsel    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/fb09634c73e03bdbb6aa435754ca5e6222f7301e |     
powerpc64le  |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/17c890babe935754dc49a69f7cbccbfa32c431ce |     
  sparc64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/249ca695ce751343dbb46beb2db244fc504ba9cd |     
  powerpc    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/aa539232093ac349b0de40a02010c9217aa80ce5 |     
   mipsel    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/4e99c08a37b7445634813ea2404068827b4afede |     
   sh4eb     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/6660b5cb429734ce6608b98fcfe4177c5e7e270e |     
  sparc64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/a25f8025f16f720503b9bdedaf653601d13d9e94 |     
   s390x     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/30936d9670af64f735467c48b8926de9ac4d2a47 |     
    m68k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/747ba9280196cedcfe69a3e6208b4285cd14bf08 |     
  aarch64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/2085e72156b625580ebb04e465824bd74a0ec9c7 |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/11e877b51c3b954e77df1a8374e84bed7a897ed5 |     
   mipsel    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/f46d9cd61cf0073325019f4eb55e8800b24fb071 |     
  aarch64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/ee543928dd0863588da7f95bab74d55d2d136469 |     
   x86_64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/c5db04c73843286eed85055df633b2b02a6ec2b6 |     
  sparc64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/d391e1212e8817a902637f1f7e08ab0ae79e7072 |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/e1d3c077e446004f184782f7a5fbdc90faa2953d |     
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/19fb9293931ad08c8734a15688bd53037e827b81 | ORPH
    m68k     |         host-zic-2025a         | NOK | https://autobuild.buildroot.org/results/bce8ae6311fd7c7eab3509c67235d350911a3443 |     
 powerpc64   | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/e97b1567f7402d628a11371cd25d3e3c48a1c620 |     
   mips64    |      janus-gateway-1.1.2       | NOK | https://autobuild.buildroot.org/results/3a62a769bd8d81cb2209ee49a0475f004ad7ab14 |     
 microblaze  |            kmod-33             | NOK | https://autobuild.buildroot.org/results/2f04966b664f44bae47b288b75b7bb909f9a6db4 |     
 microblaze  |          libcap-2.73           | NOK | https://autobuild.buildroot.org/results/f0f3d4d5d96d4577e9656738742eff2283785926 |     
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/4f5c63ec1245595209ebed49438edfe6636723bb |     
 powerpc64   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/25edc356351a2627ffea4296188dc1e56e78a54a |     
  sparc64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/fbadab660777bb6774c1855b066d5bc08dcee2bc |     
    sh4a     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/e3b46e88716c8c6eb1b4ca397aa5a1e906171001 |     
powerpc64le  |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/9acbf86a7ffe858ea7c4c31634b1a964e976f67d |     
   mips64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/9351c5a5d26059089b45c31c94eaac1db37acb92 |     
microblazeel |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/8c0457c8e02f924906c8059aea24b46ebbae44f2 |     
   mips64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/53bc92538ceb7c52d18d72f1e60fe0e175e9c67d |     
  sparc64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/8c736062da8a56f6d9a8b62f71798fde415c6a5d |     
   arceb     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/fb9a24a8863f55d5a0a965bd17792ed4ebb3c671 |     
 powerpc64   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/11ab9767e63291bdfa37f4d988ea6ac1b980cc81 |     
   s390x     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/334aa4a71003237fac656fbb036f3a82fbabd217 |     
    mips     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/0eb4a591c0d18f95f2b7e42b593fd3db7b5dc0f7 |     
    m68k     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/ff38d39e18b7b5fcd746a48d1ea0b9ce4f5e5b65 |     
  mips64el   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/d945a48da9f5d0b75018afcd1f6efff9cacec43f |     
   s390x     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/d06d6aed6d633dae82ccc3fed00baa7e13c49296 |     
    or1k     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/247c5ee2ab9ea33c1e5715b6f2d7aa0c93769eb3 |     
   armeb     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/67aea21977d248057919fe288ab36b9a5687b31a |     
   sh4eb     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/9e05b877888ed9dfd3377f3ada741b9af94d58ee |     
    or1k     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/b9db20eb7f74a3196a26873d3af3f400822d0962 |     
 powerpc64   |        libcgicc-3.2.20         | NOK | https://autobuild.buildroot.org/results/4ed4efabfec3f37503a00514371e7c8ff4914e41 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/25580b20ecaf75cda104cb80f4e7ebbd768a7b94 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/e2ed3b6cf6178637be38cf05129fdb7b73fc8a84 |     
  mips64el   |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/44dc10acdbd757223fa5247be75751214a6430c0 | ORPH
 aarch64_be  |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/8ce85a8e9be71a3f72655d2d36b9e4f8e789e273 |     
powerpc64le  |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/0deb5f45ce16d0a1e1f505633befef5dad228874 |     
  aarch64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/7be2173d0037fb598dfa7dc57dace745c2f07630 |     
   xtensa    |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/1fb8dd68b61ef0254d74c551135a27270e4ad981 | ORPH
   mips64    |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/35f10f78041a77388b2a5fd2cfde7ca614c4c822 | ORPH
microblazeel |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/2b446b610ceaf6074a7eb32d290c30348fa39a45 |     
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/4243d3bd7e738a8598ab0f9b47f6e01aea561a92 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/3ac4853bbe13a6250abeedc146a041d07728c71a | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/e03ed0b63dcdfa4d90c7ed7cea75fb63dca78e92 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/b0544bd27de82022f405f072ade55707c6ccb7a3 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/3b762607d9368b72522ba01e79dfe68197f9bdf8 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/0e7c53c9d9d75fcc22d637bda7ef94281b7fe9f1 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/d0bbf8faad24e0970c84c4968134224220aba03e | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/14920d2253f85f58b70ab66b1f8e13b035e70e62 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/c66821c667b40792610e80e3be604bb0aaf3e680 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/d6623db5201aea8b50a78dcd345e851e411ce414 |     
    arc      |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/27036e0508f3642542c90e7a49f6685157ecb51d | ORPH
    mips     |         libsoup3-3.6.1         | NOK | https://autobuild.buildroot.org/results/ade5ff5d64815f13bcdfa57bca6b8147ce3984e4 |     
    mips     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/d42a60fb6d0da6e368a0b6c1a18955090c01c9b2 |     
  mips64el   |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/93c6785707db6e53d99773ad32caf9962d5ed637 | ORPH
   sparc     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/53e300fd551139722debc779cc2401ec565f5caf |     
microblazeel |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/711498faa6c7c7ec3478a46503cb216e1329545e |     
   sparc     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/604a3244f8dde50b9752c29fc3e7c31f244605c4 |     
 aarch64_be  |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/7e1d4bf8df9f9b2785cfcf82612f254fa09d9cb9 |     
   mips64    |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/4e563acdb7f8ba9d82fd3ce7630e0a0cc538a428 |     
  powerpc    |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/3844218fb4f5cf7c9c0502018d6d334abbaf96e5 |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f27c8088f984cb49e6b1587b330a8da29d90e849 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/c55a34a6f0f7424699792fc5a779c279a2515357 | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/037cb7c89bff8610b6bbd7b337a557a9a1a89635 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/90111c6dd997ed4f214ab7d171f3858754b19267 | ORPH
   armeb     |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/1bd68cbeece389f295ff971a05b7060a12660856 | ORPH
   x86_64    |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/53a461046bc7d6bb0b621b9d414ee0af82a2f2d0 | ORPH
  powerpc    |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/85db4f6bf2f72a848a03126fc6e516880d2ebe2d | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/6fea0ecaa90b24da4e5575565b88018ea95e72c0 | ORPH
    or1k     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/109ca52da1ae056d666bf278b98cedf6cd91dd05 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/699256bd4f0fdaf8cc80339d001f91f5fb9e149e | ORPH
   mips64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/d9e50f6c8cfd9eb26fbc2ad10ace2c3f8d0eecc6 | ORPH
    arc      |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/609697d89e0c5948842c7c0e5dcec4d93be3258e |     
   arceb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/8814f6f166ad6ddd58e8627964d147ecfff4d76f |     
   xtensa    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/05728d3609553a0b78875d62adb88cccb43e00ed |     
    arc      |     lttng-modules-2.13.10      | NOK | https://autobuild.buildroot.org/results/1b0d8a5c2ef32d4218d52d0044b6c65561d1e0eb |     
 aarch64_be  |        lua-utf8-0.1.5-2        | NOK | https://autobuild.buildroot.org/results/551fb30f1fc6c7dcbcf85c7a0dfc212fe4e9e570 |     
   mipsel    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/95e64886dad42164b5a3b81df0aa05aa2379b866 |     
    or1k     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/7e4fb5c181464c62a05f5d660583e5e3c51628e0 |     
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/76c854f0d89f41451d19b62781633d9421d95f57 | ORPH
    arc      |          motion-4.7.0          | NOK | https://autobuild.buildroot.org/results/a8441bacc2f2473d88c37553d279dd5da04548ad |     
   sparc     |          motion-4.7.0          | NOK | https://autobuild.buildroot.org/results/2c82232740bef56a0d0a9d32e683ae0b0f1dd55a |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a36d47b346df1cc74b1afb97c7e8a8c978ca6bb3 |     
   s390x     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1dcda3305eebb7c5784c17038f060933fd0760e9 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/3cf1b89fbd75505600f787c62920b55aba1286e0 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/c7dec7cd25d844727b77fbea271cd8d8e0c1cf42 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e401a330d7ebb9eb41c52acf99cdbf9d50737622 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/4a5d84cc1ae4bf96726a7d970f0660d85f40125a |     
    sh4a     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/9560198b1817cabd9e57d5ca94f2ef9ae0f95c08 |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/9c1c6cdc9bf2c171722b24cbe76dc28a5b36408f |     
  riscv64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/8b36b395f6a04ecd5bf10d3a49f0ea1f5a88c2d1 | ORPH
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/c8b446c53447f33d62cab5999ddd4601f2ad372c | ORPH
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/f54ac08d036cf490b0189a29337df4dd4144c2f9 | ORPH
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/fe134260d259fa8bca96685009564788e23f1117 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d135075aa01edf6d62908ab52c25d814ee721cf7 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a3c751a336c06cfb88a7bbf227fd238bcfea7519 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/15acda7ce8cdcaae8c629b24f8a667b8c009aa87 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/8f7701ee48565a07613449dfd5d2831facad1e57 |     
   sh4eb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/654537116c124df3b085480484b479c6f921533c |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/816c230ba40f08d04cb8b8cc247d88bcce094655 |     
    arm      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a8e21ec4a6bb4e5017d9f0d36eb386ac8b2778f7 |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5b050808d02afdbe1fad78d0997e73ec2b0ec915 |     
  mips64el   |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/4b53041886ac5e79f13d5f1ab8712a4ccaad1859 |     
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/ebe639ea9cf294e06196951c033373fdcc30fef4 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/3861d9e9cb007b6fa7f377d1242689346eca2b5c | ORPH
    mips     |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/baf8bc34d62523fbef355b4f22ba6b91edc74148 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/8f1c86fc5010094bf6f318a88ac532d22aa01c61 | ORPH
    mips     |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/0734db116175e2bd3bc5a7d1c2e8de59ede4430f | ORPH
 powerpc64   |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/5a39c73e42b5aa49f801154df4ce4ad821e5c3b0 | ORPH
  mips64el   |          pcre2-10.44           | NOK | https://autobuild.buildroot.org/results/ca15945c9bc088418b97002d1b07d20facddd210 | ORPH
   mipsel    |          pcre2-10.44           | NOK | https://autobuild.buildroot.org/results/8fa1e780797140d4a8fff3adc818d1e83fdc5c39 | ORPH
 microblaze  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/03ea3186bb06e9d446d42b915d53ed03edabdd73 | ORPH
microblazeel |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/2cd1b5944c3d9d53dd097da4e1f456fed9eb4c57 | ORPH
    i686     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/4ea96a40610cc5947f99a690ba9e345eca34f927 |     
   x86_64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/c3f42bf1d6c65ba04eb6b6394b5413644747568f |     
  riscv64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/5da31a0131b783accb322591cc8c676819ce5933 |     
powerpc64le  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/5064af7b4f20a3bdaa072e9d67b9e9e3c27be4b6 |     
   sparc     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/238fc4b21482ad589b30881700b358ca5b8f9e71 |     
    i686     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/fc7b8625d7795d91f414f3a75fe927dff9470b66 |     
  powerpc    |           polkit-125           | NOK | https://autobuild.buildroot.org/results/fd21bc103257cfe7083c9d38ad624363032e9db1 |     
   x86_64    |           polkit-125           | NOK | https://autobuild.buildroot.org/results/68b082842f021666445d81c0337c1d679e9460ee |     
   mips64    |           polkit-125           | NOK | https://autobuild.buildroot.org/results/5feff0dbff4cb4a5ca70ba0487a1bb48e4b629b2 |     
    mips     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/b1249de161030cb42638de98c33081058eaf056f |     
    sh4a     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/eaf6799ff5a2bbb8e8a0a7dfd6e5e04d33ebb250 |     
   mips64    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/be4892c4ec6759e0b2f2f6f0de0a0ae3dd88b6bf | ORPH
   xtensa    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/40ad69111909f388087c93b456875f1f8287b342 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/ca7bb145e9e9c1497de0d1c3cf493c1841042afe | ORPH
    arc      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/8a43d5e46e57187e31c98b126d900ccb82835e4b | ORPH
    mips     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a71efab676a1cf09a4972ccf88d03af6a2cd75ef | ORPH
   armeb     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/99e04c6c8bde6e429d2ed1dde8e1d6af3a1e0635 | ORPH
  sparc64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/a9ddd4cef98f350038ab3d80760f49cbc31e64f6 | ORPH
   xtensa    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/e0d39108a2e232876427bd75f7dedaa303ab944f |     
    arc      |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/a3d3a4427df0c0842f9cfa26034557b5af38e0be |     
 microblaze  |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/4e1a8996d0771a14e314e21e3813fcf49bf7f68c |     
    arc      |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/288964cf169b52871f3f7082907656ecd215d780 |     
    arm      |           shim-15.8            | NOK | https://autobuild.buildroot.org/results/11799a61611c031f2de051b6edc8ae5ad9e71669 |     
 microblaze  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/e211d06df79c16aa1a3dffca19cd4a0a24b55c91 |     
  aarch64    |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/a8b7b2777bb19745d59757497e7c17c5766e7ac8 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/aa49c284249bddbf250819604a595e519752774c |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/6ddcf9d41d89f4179ef4a5205f9663ed23867f93 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/bda687ab59e0c87483f58811bb90679992a9d671 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/adc546694267e6304f42d2786783831f7270a1d0 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2410f3773139a4a1ca1d10e9c1b89c244d47435f | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/767374e7118f95b8e139ef3bb631465b3b58bc27 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/70e254229b0ef34ab144c33d9a62161913452747 | ORPH
   armeb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/24b055a3e30dabfea70bb262ac9478e4dfbb1da8 | ORPH
 powerpc64   |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/5a89cd37ddb013b4a5036be3d755ee316bc18792 |     
   mips64    |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/084bca2f317a9638d5d2161dd8e70f344ae9e17e |     
 powerpc64   |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/6cff580dc2257a3800a354650be24aee01c80191 |     
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/388c9c3bf314919daca07e2911dd809901859ab0 | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/25df8849ee02524b34830703161c16aa61217375 | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/c543f592f6686d0842d669260fec9d6080aded6f | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/5978dc9d73386d8fba2177127f81d871ce228e25 | ORPH
 aarch64_be  | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/fbfda2a7db2faec64d45c75d2eb9548d7127356e |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-heimdal-f4faaeaba371ff... | 1 
               libunwind-1.6.2 | 1 
                tpm2-tss-3.2.2 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/df654a0c94a5e53bcbff38f3b65358047480c9d8 | ORPH
   armeb     |        libunwind-1.6.2         | NOK | https://autobuild.buildroot.org/results/f2088181c6483d34395f104a6e9ace736c80077f | ORPH
  sparc64    |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/6d367934f9b584bb5ff0e3908afa6968f011fc5c | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

cegui-00b4e1fe174da53b7ed72... | 1 
                cryptopp-8.9.0 | 1 
            live555-2021.05.03 | 1 
                   mimic-1.1.0 | 1 
            netstat-nat-1.4.10 | 1 
                nushell-0.96.1 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/bc7edacf9196dcfccbbae5bf6ba5c1574022c7c0 | ORPH
   x86_64    |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/1cc076cc90c6f38efdf2a25dcad21c2f209274df |     
   armeb     |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/d16b63cacac095e6423d32658da750e845f98b82 | ORPH
    sh4      |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/fdc2f719de74810bdbf6f6d93e43d58de8b923eb |     
powerpc64le  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/0e4d6722d3e68b7b3591c5fa81a49039b191024b | ORPH
  powerpc    |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/70ac40d4216d59e8f4e1b212fbe220d0c6a24256 | ORPH


Gitlab CI results for 2025-02-07
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931386  |      
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931394  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931418  |      
             asus_tinker-s_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931507  |      
               asus_tinker_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931511  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931514  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931516  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931520  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931521  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931531  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931537  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931540  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931550  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931558  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931566  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931570  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931576  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931588  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931592  |      
                bananapi_m2_berry | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931599  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931600  |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931602  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931603  | ORPH 
                   beagleboneai64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931611  |      
                       beagleplay | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931627  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931631  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931640  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931648  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931649  |      
                      cubieboard1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931653  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931654  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931660  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931663  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931665  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931667  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931671  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931759  | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931766  | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931775  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931779  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931783  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931785  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931801  |      
               icnova-a20-adb4006 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931804  |      
                imx8mn_bsh_smm_s2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931907  |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054931957  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932001  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932020  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932028  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932062  |      
                  mangopi_mq1rdw2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932138  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932186  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932214  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932304  |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932328  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932363  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932392  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932399  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932404  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932431  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932452  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932463  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932469  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932474  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932490  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932485  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932495  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932499  |      
                  orangepi_5_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932525  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932532  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932529  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932537  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932541  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932547  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932553  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932560  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932579  |      
                  pine64_pinecube | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932627  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932633  |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932723  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932822  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932895  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932934  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932936  |      
                          rock4se | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932940  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932944  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932947  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932956  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932959  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932966  |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932971  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932972  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932974  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932975  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932978  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932980  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932985  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932989  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932993  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932995  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932997  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054933000  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054933020  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054933023  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054933048  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054933050  |      
                     ti_am62ax_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054933057  |      
                     ti_am62px_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054933058  |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054933060  |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054933062  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054933065  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054933066  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054933075  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9054933084  |      
                zynqmp_kria_kd240 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9067452987  |      
                zynqmp_kria_kr260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9067453038  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9067453065  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9067453095  |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9067453127  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9067453159  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
