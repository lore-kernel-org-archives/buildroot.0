Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34F6CAC581
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 03:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32900818A2;
	Tue,  9 Sep 2025 03:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kEQgl7UqcXzz; Tue,  9 Sep 2025 03:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7B4D817FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7B4D817FF;
	Tue,  9 Sep 2025 03:20:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B54A186
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 03:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41E3440760
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 03:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2iiTpDw_xiv for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 03:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79D2B4070A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79D2B4070A
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79D2B4070A
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 03:20:01 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b04b55d5a2cso481860866b.2
 for <buildroot@buildroot.org>; Mon, 08 Sep 2025 20:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757387999; x=1757992799;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dgM5BL5dEfO7Sd+G6DgiyWpJJrRaJxxi0EbcfqExuq0=;
 b=kQu29G7WULPZS+rzdR+hA503iQa8QyqSqrxZYkyr63SBXZudPOvwCAjhGA87/xkOB4
 YIQVHmgUeHVnBH/I0lVPS+mFUma4PzBFxEHHpPQcpPuL2ZKwV/Cp7cpN/zspuWo40Ixv
 ZaAgwK04xl8v3JcnwrzAkpsR0OpEN5nKxc2cjU8VQ8CySJETjs8WLbMkU7qEbpVmPRmP
 vvV1eaTJm6TLPxVcjleovh650blA2TgLJZU2UITMAS8ISg/0fvP9xvawM8MarBpmIYRr
 9IjiqaD9qMnXOhZoODTQllfVzXXrEOse7Zjvb4vW1ZEGfYCjCpQX5oGqDTe5XiPhKASk
 UY/w==
X-Gm-Message-State: AOJu0YzxMXzY4FSylRA/HzC+nbnxvoB+qFp8+r1f2nLTlDT17sNxtqy3
 b8tA4g8ciN0igwHf9HYLdJ9jsrH9kVhUUYets2qtEtY1+GiJsmYeL9cXJVgx8A==
X-Gm-Gg: ASbGnctrE5LzV8eiNin+XaHmLfacCG8lhWq/4T02hFMr1BQW6EIKiWqK5yFYloLdHqR
 wJSmjA/lqZZuyWueV5BiRUCEk9uS0Gd6fXuS72tGUW1+tCgr0/Z8ZJJLHR6DWodcEAmdr+PvTBl
 qJbbExf9r8VrFsbNvbn6CjgwEZfd9r76affAwTVZrWeazDlyKKpenusMt1lZFKtbz0oKM0Mh/7K
 1SUXVvBiI6PVJb3ezguMYFn8zsMOBEFCq5G/EWt5k2yiMsRuhGH24iWqOI3qBW8fwRtuTCLDzkF
 q+MzCu7yLhA6COALfwqSPVxsU5kY4iSwiYFt4s0lKcoL18cVwGSKQvlDLN8Mrx1qwKNifdKQqWw
 J7AF8Lvqu48gZ85fOx4vI0tCHiCxRiA==
X-Google-Smtp-Source: AGHT+IGSKLfOxL2uqvM3q5QTS1+Q4leGIprZP3wPLM6klDShGkh3uApVDttPYdlfHjhMmlF6F8+/TQ==
X-Received: by 2002:a17:907:3d06:b0:b04:4786:5e02 with SMTP id
 a640c23a62f3a-b04b16dc6e4mr945195966b.45.1757387998773; 
 Mon, 08 Sep 2025 20:19:58 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046b783722sm1410354066b.97.2025.09.08.20.19.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 20:19:58 -0700 (PDT)
Message-ID: <68bf9cde.170a0220.1585f8.569c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 09 Sep 2025 03:19:58 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757387999; x=1757992799; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=dgM5BL5dEfO7Sd+G6DgiyWpJJrRaJxxi0EbcfqExuq0=;
 b=NFM77dXlRO6gtWiNQrObWAChTBH8mhMp4Q8MrKAk3gcMhZ6I9vPMKnDdHrD/Rgx0XV
 zaIqZ27sqbei3T0xScbeYNYVaAJWt6IZDs5ATDEU9kQAMrbRCWW9jzM+qXJXXqa5jkOc
 oOicEACYlDLG32qLqs3wV6wa4ctGy0OGhq4iKU0X8tyj/QhVaW1L4nb2LrPCjwbO9+SL
 Gi6/pW6EFQPaMKe2nQ1P7eOmQZnyjqAYqrZrt7NAFx1rN5GEkWVTaY0rr3TnHYsd/dmk
 tRmr7o+FDDTXiDyp7TYLEf3krSzet7bgW5nvQMPkg8ejvf7J+Dbu7Xij1IPPgRWpxh2D
 fcuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NFM77dXl
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-08
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

Autobuild statistics for 2025-09-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  9  |  0  | 13  |
  2025.05.x  |  3  |  3  |  0  |  6  |
    master   | 35  | 310 |  0  | 345 |
     next    |  1  |  6  |  0  |  7  |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 31
              libselinux-3.8.1 | 17
                    yajl-2.1.0 | 14
              host-json-c-0.18 | 11
                 logsurfer-1.8 | 11
                 libsoxr-0.1.3 | 10
         host-mariadb-10.11.11 | 9 
                     gdbm-1.26 | 8 
                   cvs-1.12.13 | 7 
               bctoolbox-4.4.8 | 6 
                 libgee-0.20.6 | 6 
              libopenssl-3.5.2 | 6 
                python3-3.13.7 | 6 
                       unknown | 6 
             batman-adv-2024.4 | 5 
                       cfm-0.3 | 5 
               dvbsnoop-1.4.50 | 5 
alure-14beed2a86d5a36030e90... | 4 
             dahdi-linux-3.3.0 | 4 
              fluent-bit-4.0.3 | 4 
libdbi-drivers-0bfae6c43134... | 4 
                  linux-6.16.5 | 4 
               pulseaudio-17.0 | 4 
          aardvark-dns-v1.16.0 | 3 
          linux-5.10.162-cip24 | 3 
                openssh-10.0p1 | 3 
                   perl-5.40.2 | 3 
             util-linux-2.41.1 | 3 
        vulkan-headers-1.4.317 | 3 
                 apitrace-10.0 | 2 
                 apitrace-13.0 | 2 
             berkeleydb-5.3.28 | 2 
                 coreutils-9.5 | 2 
                     crun-1.22 | 2 
               freeipmi-1.6.14 | 2 
glibc-2.42-3-gbc13db7393773... | 2 
  gobject-introspection-1.84.0 | 2 
host-am335x-pru-package-5f3... | 2 
                 host-gdb-14.2 | 2 
    host-llvm-libunwind-20.1.8 | 2 
                 libiconv-1.15 | 2 
                libosip2-5.3.1 | 2 
                  libsvg-0.1.4 | 2 
libubox-3868f47c8f6c6570e62... | 2 
                openvpn-2.6.14 | 2 
                  pdmenu-1.3.6 | 2 
               procps-ng-4.0.5 | 2 
toolchain-external-bootlin-... | 2 
                 agentpp-4.6.1 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
               asterisk-22.3.0 | 1 
                   atop-2.11.0 | 1 
                     avahi-0.8 | 1 
                    azmq-1.0.3 | 1 
  binutils-arc-2024.12-release | 1 
                    brltty-6.6 | 1 
                  brotli-1.1.0 | 1 
                 c-icap-0.5.10 | 1 
                   ccrypt-1.11 | 1 
          chocolate-doom-3.0.1 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                 dc3dd-7.2.641 | 1 
                diffutils-3.12 | 1 
  distribution-registry-v3.0.0 | 1 
                   duma-2.5.21 | 1 
                   dvblast-3.4 | 1 
              e2fsprogs-1.47.2 | 1 
                 expect-5.45.4 | 1 
                    ficl-4.1.0 | 1 
firmware-utils-86739f2b3ae9... | 1 
                    gcr-3.40.0 | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.41-70-g1502c248d58c... | 1 
              graphite2-1.3.14 | 1 
              hackrf-2023.01.1 | 1 
 host-binutils-bare-metal-2.44 | 1 
           host-doxygen-1.8.18 | 1 
               host-gawk-5.3.1 | 1 
              host-guile-3.0.9 | 1 
                host-odb-2.4.0 | 1 
              host-rust-1.88.0 | 1 
                  iozone-3.508 | 1 
                 jasper-2.0.33 | 1 
                    kmon-1.7.1 | 1 
                 lcdproc-0.5.9 | 1 
libcorrect-ce6c17f1f988765a... | 1 
           libfreeimage-3.18.0 | 1 
             libgphoto2-2.5.27 | 1 
              libmhash-0.9.9.9 | 1 
libmodplug-d1b97ed0020bc620... | 1 
     libphidget-2.1.9.20190409 | 1 
                 libpng-1.6.50 | 1 
                libsolv-0.7.30 | 1 
             libtorrent-0.13.8 | 1 
                 libusb-1.0.29 | 1 
              luabitop-1.0.2-1 | 1 
                 mdevd-0.1.6.5 | 1 
                     mtd-2.2.1 | 1 
                  nginx-1.26.3 | 1 
                  ntp-4.2.8p18 | 1 
                    olsr-0.9.8 | 1 
                 openal-1.24.3 | 1 
      passt-2025_06_11.0293c6f | 1 
psimd-072586a71b55b7f8c5841... | 1 
       python-flask-cors-6.0.1 | 1 
             python-webpy-0.62 | 1 
                 rtptools-1.22 | 1 
          sane-airscan-0.99.33 | 1 
                 siproxd-0.8.3 | 1 
             strongswan-5.9.14 | 1 
                 systemd-257.7 | 1 
                      tar-1.35 | 1 
                 uclibc-1.0.54 | 1 
               valgrind-3.25.1 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/2f1c45b6c458c96ee9a714c80fde5ab9700521b1 | ORPH
   x86_64    |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/0075411cfe6fdbe46b55d4e18ccd67eac7beb8f2 | ORPH
  aarch64    |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/d48c63d55dcec7c9e4de280b1a5a1a6bd0fba7d0 | ORPH
  mips64el   |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/eabaea976dd79ee0098a1d88f58d76964b9d933b |     
 microblaze  | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/ee9ab8354857ec9d15696b3b9260cfb605458c00 |     
 microblaze  | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/d5a275f2d282c9dd2e3053667c79be11d48e918d |     
    arm      | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/b55be423b713559f2ed9e6d39d98ab4b92691401 |     
powerpc64le  | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/2a3392ed6d56ff413efde9eb7e9d73716fb8ca05 |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | https://autobuild.buildroot.org/results/49082f07575f9fd7da4d19ad0c0a9b8067491663 | ORPH
 aarch64_be  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/19e7576d37ee7147470c4e39014a5bfcf667a59e |     
  sparc64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/1a0663d532bd3f0bfeb17df5698c6fc3091ae832 |     
   sparc     |         apitrace-13.0          | NOK | https://autobuild.buildroot.org/results/41a4d2cb49b561da5b4b852e8a63abb18655d416 |     
   sparc     |         apitrace-13.0          | NOK | https://autobuild.buildroot.org/results/63a38bd942cfb95384a0ea18c6ff48964d6ecafb |     
  aarch64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/95b4174cdc7e78f467c7f27724eeda33484d369e |     
 powerpc64   |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/3467db55bf2b4cbd3fd8778d72697937aa256e9b |     
   arceb     |           avahi-0.8            | NOK | https://autobuild.buildroot.org/results/0df499f3a6b16dc8659fa06d1432f483aa6bd1a0 | ORPH
loongarch64  |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/cfc6f1323ab031551fa3a1ab3da4141fdfd108fb |     
   mips64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/fc56851ba905277503ae237339f744a477d15f1f |     
loongarch64  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/e4d2fba79afb072ed21253919d304571cf73de7d |     
loongarch64  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/7b0d586ee3fd7abad140095c4253db9c54a632d3 |     
    i686     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/298aa72b26c4e76fd380a640af3b3ccb7f6f64e0 |     
    arc      |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/54732359ea354c8ca9634aba4cac46bac7db3f18 |     
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/2133727c1f387e370c5666b1b28fbfba73bcace8 | ORPH
    sh4a     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/fb5afefb85fd0561ecab83e3bcc9f698cbebb98f | ORPH
    i686     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/b26c66478c68e51c0070f113caa5f5565b63385e | ORPH
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/7dc34c2b57911dbfb77d4f312e63d9ea76741a22 | ORPH
   mips64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c9a9c256f024decb7d4c8a9ac815978e4c16e14b | ORPH
   mips64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/dccd4617e7869f832bf0fb262cf4e413d923bc33 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/a30cae42d694e1494fde69ea4248d411e791599a | ORPH
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/10765d954149993b0c4d1caa4eb40884c18a05ca | ORPH
    arc      |  binutils-arc-2024.12-release  | NOK | https://autobuild.buildroot.org/results/afd35e1590fd0183ebcc765e95a41aa5d7b30a70 |     
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/26b1917a6e89f4dd8d378aa860a099bf253dbf6f |     
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/590f43d627fd365a462e2128e1221623f8a4f72a |     
powerpc64le  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/1f0c47c21b5c2f2a838478699b559908d3e3ff75 | ORPH
  aarch64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/34a706c8259c047d1e9c0a9aa8356d6049179775 | ORPH
   x86_64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/bf4ec2fdc19b608fc3b68734d13081e1a02a404f |     
  riscv64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/bb0d0022c361d4ce31774a3fde42fe181939b4cc |     
microblazeel |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/8c664acebec4102465a59741027fd64dcf0ff556 |     
  mips64el   |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/d1a46d5318905f097b724f3758285941714da5a1 |     
 microblaze  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/635b1bec208d6d9867612bfc705f5359b9c456ff |     
loongarch64  |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/90a01c5925e7f5f50b3ea06d6ea7b0da66814a15 |     
loongarch64  |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/fe090aad7dfdf4e42f309d7e8f9d1831ef747d13 | ORPH
   xtensa    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/29e32c1629536c2cd87f4f6645ed97fe64683d76 | ORPH
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/f58902f35d8f7c43e669705014143435ee9ad444 |     
   arceb     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/718a5bb0526194dd34ba8480d72a0adedcfea860 |     
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/bc6264f6507dc03cc2645185f76f25bbeea821fe | ORPH
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d074e6d44834cee0c460779df784afe3d4b98be8 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/702376cbdc16131662be45f8dbfd22be2ca37e41 | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/93fa20933522161be06f13772cbf49a7b899ad30 | ORPH
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/363060fb42e582ce36764f386a434133f72b74e1 | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/97d03d036ed3d06786880c399d342ac4112af612 | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e7f93ba01c5a7d31690b8dcc32c05af7fa88ef03 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1c196eb93300704d56de75f4472764ba23fa8399 | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/027c31a778645ed30e9af6ee44322ab1c6a05664 | ORPH
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0da73d6dc9f4191c9d19c5283084ffbb992e9245 | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ea7a36d3a50802d7bd8545099537d2e29003fe6f | ORPH
loongarch64  | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/7ef92444841760d1a653fd679e459fa983958b8c | ORPH
   x86_64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/bd09dc8fca9a540f3bcdefdb83d6f896dffd0e1a | ORPH
    mips     |         diffutils-3.12         | NOK | https://autobuild.buildroot.org/results/8cab45e7399f29231e7e83be692d06fdf46c2282 | ORPH
   x86_64    |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/573c44197118a28846450c31f465c01588f9b91c | ORPH
 aarch64_be  |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/14b9433a312f199565a8f7140be9e39097c9d691 | ORPH
loongarch64  |          dvblast-3.4           | NOK | https://autobuild.buildroot.org/results/d35dfd607bd13e0252033dad7045e21d39cb85a4 |     
 powerpc64   |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/13ce800aa709ebed883aa6fe9069438c93bec392 |     
  sparc64    |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/165704947a9cf9e857087cd6896fc5b2e2bf6d0e |     
loongarch64  |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/a84d1f8018bd400f17573a7ed6b7da0c41ed3928 |     
    mips     |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/ca71e89faf7b04bcb1450e0534da45e2bca266e1 |     
   sparc     |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/67567789715bd05faa9cff0779ddc76b39340d7a |     
   xtensa    |        e2fsprogs-1.47.2        | NOK | https://autobuild.buildroot.org/results/022795caf3cfe2df67a91c578d6d6ac16e1a32d1 | ORPH
   sh4eb     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/d19fa5d4462876d95e71dc52209607d9a8ce2e64 | ORPH
  mips64el   |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/43b42618549b52ced3f90559ec2899702a76d1b3 |     
   mipsel    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/2074a94272d27f72c2a71c417d65deaf2024054d |     
 microblaze  |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/0d8e4163a95cc9b7ca22be6e29f527795b2b4317 |     
 aarch64_be  |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/99f9ee96b3e919885b7bf87700df64bb6b7eaee0 |     
    arc      |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/e8c40be73d47b45ae8616fe25fa394c3eb846598 |     
  mips64el   |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/3020f304af214cacaf627619810f3d74a3591add |     
microblazeel |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/db8357525222e4f363e2f5a719c9ddd09869a627 |     
    mips     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/77141e5d12a7f1fa4a5950a1b39a7514fa254feb |     
    i686     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/77d9b190682f5a73596e86a58ccf5eecbc63c623 | ORPH
    m68k     |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/24e4063546444ec9512247fc451fbcfd35dd2884 | ORPH
  mips64el   |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/0a7bf87124a325a42d6719bedf3b0beacb1e1942 | ORPH
loongarch64  |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/0a78303430bbb38c65391d5233e1919a20c09fac | ORPH
  sparc64    |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/6ecb8ce1b82909b7ebafc74e34a41adf721eab9c | ORPH
    arc      |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/3fe5a8610ad0ae5b9163fd60b93e3d452d1b34f4 | ORPH
 microblaze  |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/751d8a0e177402ad59e02d2bc73a4f95e65a0422 | ORPH
   mipsel    |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/915bd414e1795bc10ad8a5dfb363962fa00f0c1d | ORPH
   xtensa    |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/59d438e1d29a0420fcc2a9c8febd5a468850c219 | ORPH
  mips64el   |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/22adcb9693a8458f2ebe66ef4a11e3178919ca51 | ORPH
    arc      | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/1fe5bc638fa800162883859661755cb65318905f |     
   mipsel    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/14c4a1a9dab3d51cced8de413e63c5148ad41446 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/fdb986dddc9ac073c076951267d2daef3c880f2d |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1ef47b0f869cc1ed5447baa25b14a421936a4ba7 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3273b41b6cb4d2319d5194d2ac7ff3c3ff3f4420 | ORPH
    mips     |        graphite2-1.3.14        | NOK | https://autobuild.buildroot.org/results/987fe3cb7b22ae7f668ae805c450c1f3700c72de | ORPH
    mips     |        hackrf-2023.01.1        | NOK | https://autobuild.buildroot.org/results/0c40978e085010b6ecac36fcdc303b4a88fac069 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/f9ef9ea9f96cedeefa36bdc4e09e95639e80e4d2 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/4ce7546f548c2b64df724337d6dc7d399ca4870d |     
   sparc     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/2449103e9fe6e7a17015f055fbd469b8fa187d5d |     
  riscv64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/b4035aa4d5174d19f249945984f66c8117826081 | ORPH
loongarch64  |        host-gawk-5.3.1         | NOK | https://autobuild.buildroot.org/results/5c03258e7bc5528ce0738709f312353be8f831cc | ORPH
    arm      |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/b08f539f8b0891106ea5de7415718c89de61848e | ORPH
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/2c1ba028713584d7e0c485751b0ff1f6353fb966 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5c0fe944b3b610e9a94b28794a47370bf544940a | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/63c04accccd42d9895c1caf22d25cf321cc06fcb | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0d3619d4fcfa024a24fad895c2c14aaae1bd96d9 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1821a4530d9d95251b411c32dc560a21945d4501 | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2a9374aad9fcd4b438d0603427f9b542334467a5 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0fcd2a04d6fc2bafa170a9e8c1658ae7d2588adf | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8f9ec8ef0f1ddfc049d229a6a36e2e535300074d | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/42caf7c9c147c81b295d4fc44345e20af0b0ee14 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6d9c45eb5b729ea2a43890f46db6f2afde9789a7 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6446f5ff8b9bf0b17198f5aa4eeedbfa04780a5c | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/716c6075ad01269a20017dbadb7934ce7c0a98a7 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/586129da39a066fe0609a86f2fea2aece4e0ea6c | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f25b4f3ac3f82ab8718965a4544037c55b54dbd0 | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8fa0e876c328b5fb3e2faea65d6e525becf4255d | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1b931e242bb594ff331d6b71c79deda1f5918baf | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/00d2b80f23de535b80ea69de6533a6986468e0f4 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/75d9fa2f3a4f3a03818b697120811bcf7efe4379 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b7ec0626141349760415a852081d3b2ca1ef815c | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a1c53cc191eb5c7cac13a33dc15b69a7a5ede38e | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/321ca8d77a0e09141df0e8426e105f53f05c8720 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c55e76efc4afa36f016ccba61df1d4d02d2b776b | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7fcc73094756b57b5bd2dc07410ccb6044b1f22a | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/42e5c4d67002da63aec303d2aa6f067841c8be32 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/948f73b59b663297a14aa2bc7b6c3b197582134a | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f24045003445e689c9e52c2258c7f945afd09b19 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ca0c0c2d042f24f04dd8a32fe2b10e3daf49d6f2 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/08fb8e6bc348b46e87228d0d8202e7f43fd9f703 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3026975fb67d6520781a76dc58c400ec4da19366 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/14d29de56abaff51562a3a4d4e4ab002c0a53092 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f9d20239a22575509066c7d839fbc1bd7b4ec77c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c4efea9915e963d873cb734b49ba2439ab95dfb7 | ORPH
  mips64el   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/e434a2c6d8c819f525ed122cc490d0983941928c |     
   mips64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/e85d9fe7080691efdf3821713c3934b3bc5f960d |     
   s390x     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/e1267f411469847d15ba0958da37a7feaf492c0d |     
   armeb     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/3489da4cdccecaf0f8140d2017b0f55fc7f1f70f |     
    or1k     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/43de72f6ef3b3052b2c7e714e6aca5050cafd368 |     
   sh4eb     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/0edd74e5be7bbc89b15ac727a30d52449a975697 |     
 powerpc64   |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/b9f19572c9bc096d21eb145e359c2ef06573481d |     
 powerpc64   |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/5a1adfce705bf20be2bc0faaf2612981ada678c7 |     
  sparc64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/12c534f0fe40d35a52e540fe29cf9683f78b9d71 |     
    arm      |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/e29307c85ffd838e8bbf8d5a31b3bab5e0e1df81 |     
  powerpc    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/dcf72922750a830901279e8eb8fc2def95d35e01 |     
   x86_64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/5a781002cf701aead37671ac13db22244e7dd72c |     
   armeb     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/9dee062e38f62a8587288b4d052c5f63bc146186 |     
  riscv64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/86c1933e3a3458b80058f71867bba1ef953431d7 |     
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/f29b982eec70689371ed97825da65cd69a5d3a16 | ORPH
    m68k     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/3236c713d971353c427aeb97d876e4a00fbf46c6 | ORPH
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/f0877659d9cb9aed70de0605c2af48a9b0e02ff4 | ORPH
    sh4      |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/3895eafb17a8012481b9d9b0c9319a5bb3c645f6 | ORPH
   sh4aeb    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/a8c3f2fa404ab32b7fe53bdb4bd668fbf914cc1c | ORPH
loongarch64  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/02c1b56c84563f4f90d818df23b4ea9b9c23397d | ORPH
    m68k     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/eea50098b11e2fb3e059548ededc018df3a7d741 | ORPH
   x86_64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/1de0252e57630996fabb16cc74a96306949868ae | ORPH
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/7dba878a8799d0a48a9d854606bff1dad53a4fa5 | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/f1855d01130a6da05589531c8c013e1a9f26ebda | ORPH
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/436c283ee3db89c0a00c1f343731c9e2859cfb3b |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/236c82063ea7ab2e19244673803cfeb7d7de724b |     
   mipsel    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/233d62ee385098ada034345f04d037446ca80999 |     
    i586     |           kmon-1.7.1           | NOK | https://autobuild.buildroot.org/results/51642d59543b6fc7509ef68f52c2d8146f4aad1d |     
   mipsel    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/9a28d1318bbc6ba249a3f24a5d2467c72884d107 | ORPH
   armeb     | libcorrect-ce6c17f1f988765a... | NOK | https://autobuild.buildroot.org/results/198ee6799862775931cfe9f4093cb450efd1facb |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/5b8732bd6bfd0b4f457be971c02532a36c1db2f1 |     
    m68k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/b71998b3308f24ade675ca3711cec825b32f9b77 |     
microblazeel | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/f60a7e1776eee7ea46f6f178ad0ec541c83323fc |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/8efb50091357c9ad9c82096c3b9cb3ce6f20ead7 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/10cd492515667c0201400fc76fc7f5225cb134e2 |     
  powerpc    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/5005278c7e1874b8e662e74120fef43ef7d6dec0 |     
microblazeel |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/00c606a070b558599abef23b8a4c73fbf0a6637b |     
 microblaze  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/0d2e3b2cec6e39b10b5a690f88726ef7c1891073 |     
   s390x     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/b46369345c3fd274cc55008f24905ad51797e354 |     
    sh4a     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/b72e1a9c2a4e7b96c1d350a4104067beb2701531 |     
 powerpc64   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/89554b75d8e45814a30e381f3623d0252031f28e |     
    i686     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/73b52fad62e7a67dd3d900d28d2ebf4e21ae9698 | ORPH
    arm      |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/9a7eb160d1d6c3162da748d8786aa1eafc81387e | ORPH
    i686     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/9e36e45034ffebec11385a300ac5acf4f38dd111 | ORPH
 microblaze  |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/2cda2d35822a372da7cd5e23b77e64e1502d7fec | ORPH
    sh4      | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/4996eee00da69431ab4dfc21b064d6c11d50ec72 | ORPH
    arc      |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/c0bc6252c7e96f6b51792d2d7c11f12cdeff10d2 | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/6286252ac91630cabe5b99ad4ab04e7e9e45d310 | ORPH
    arc      |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/c98cc7e3e39d5d0f2c25bd1305cafb8049e81426 | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/d8a30d1cc5c72c90baf571bc662a08e746162745 | ORPH
   arceb     |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/caa80f031cc2835f02498ab269f648cf2a123677 | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/db67c649260ec815b3daed007dafefc4a3284942 | ORPH
 microblaze  |         libosip2-5.3.1         | NOK | https://autobuild.buildroot.org/results/df6b8c10434f8fe965958627d9cd3db69b4a82d5 |     
microblazeel |         libosip2-5.3.1         | NOK | https://autobuild.buildroot.org/results/00085b3d247f883501674e816b39829bf09063f0 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/554eed6223fcf504e5ced3eb06b0e795dd99e614 |     
  riscv64    |         libpng-1.6.50          | NOK | https://autobuild.buildroot.org/results/d7fdd457f13599629995f0e7f21ea9200d06e449 |     
    mips     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/adc35aae559700683e81ab0e699456addeaf4515 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1ad7515f5aef67c03b6367b5c0ea0e11f89e7528 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c8321be687201937bd5eb48b31dfabac12f4e9ea |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/835283900447ff8469722ede72f9c23f5a228f38 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/cda436b5b8234c04fbf851fa78c5cdcce20eeedc |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4b6cd06a624a8556da49b63f150f5baddc6615eb |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/2224f30fd68001edebd251d8d20a6cb57e8124c3 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5bcb161afb0bc3c354f4e2af962c336004359afe |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4c28747e9edc6895c4938884e0288beec1da1b4f |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/00a1ab30cc6b7af503aa96384ba4c4444c217401 |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a7c0a29f469e51d9542407f833eb3141164ddda3 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5ff3418afb0da7b14f89116d1a32b6d77b8bc57e |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/53db10f4c9cb0911299b551f4c9af8dca69861ea |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/38e5b21f88b84196c7c967669301449d56e6c6f6 |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/69cd451f1e5dca11649b2d6ec2dec945377bc476 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e3bceb5b616972fb6710aa6b29afbed2e8524a19 |     
    sh4a     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b866542468c6fb3106f78b89691a38e8a4fc6e38 |     
  aarch64    |         libsolv-0.7.30         | NOK | https://autobuild.buildroot.org/results/eded8dfb8788942da29807b38db67b14eae9b926 |     
    mips     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/40af2a7a22719aee428cb364029a8c974d316cf1 |     
 aarch64_be  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/62c25a8186f417610679457d06d7644375a4ad24 |     
   s390x     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/18b8c33d2834b0963155ce56cc5eb5ac7bc2af7f |     
powerpc64le  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/04b9b83b177b2ced524be7eaf7bb899383893a07 |     
loongarch64  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/cccd0af5da3545e392935dc4a507fe9410a3b409 |     
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/f241272d8602b72fbdf245fbfc2350a14f7316d0 |     
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/64361ac13335e8af808adfee67e420105fe566ad |     
  sparc64    |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/af02796df11f70c84c6913f546b87c3d32f2059f |     
    mips     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/9a36515274a9b728b05e92a719d60d6228c081d8 |     
loongarch64  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/8159faf19fa99b39593a3a86804f607a3498ab6a |     
    sh4a     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/db0ad1f684bf04186df3d58a9de2ccbd4d0caed3 |     
    i686     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/34e4cba54e987c57ff09022fb25f3dccfe2cbcdc |     
    mips     |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/e243512f37a0f86eb06bee69cc23f9ac3f11c753 | ORPH
loongarch64  | libubox-3868f47c8f6c6570e62... | NOK | https://autobuild.buildroot.org/results/46d82ad0e041fcdcbd989241bbff91e1e3c7ba4b |     
  mips64el   | libubox-3868f47c8f6c6570e62... | NOK | https://autobuild.buildroot.org/results/c337ec627c7cd9dedbbbabb9211100784a1fb451 |     
   arceb     |         libusb-1.0.29          | NOK | https://autobuild.buildroot.org/results/6d4a83b28b7cce4e2296a1d7b5ab8cd6bb1a7550 |     
    i486     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/48cfa621f1708d1ca1d0c59d6c257e2ce84985f4 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/71e9e321a6646ac5966b73d1dd4b34c26c08d6b9 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e005898f16218dc062f7db7b484a11357426533a | ORPH
    arm      |          linux-6.16.5          | NOK | https://autobuild.buildroot.org/results/affb38db701d9a5178f3006fe2d3d61abc60ab9e | ORPH
powerpc64le  |          linux-6.16.5          | NOK | https://autobuild.buildroot.org/results/daaad180b74378f25a37d69773fe8adf0e988b57 | ORPH
    m68k     |          linux-6.16.5          | NOK | https://autobuild.buildroot.org/results/000e5ecc4dea1601236ddfbac00c3d35fc887ee8 | ORPH
   armeb     |          linux-6.16.5          | NOK | https://autobuild.buildroot.org/results/08a48f76a4f50bd631b4716178337378672f9d92 | ORPH
   mips64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/9dd741998c84adf162ef398c25fe7a906825a332 |     
  mips64el   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/813dd40c98f20c1ac3d144d8218ba3113ee324b6 |     
    arm      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/3ba5dece7c7702944f0dd48d4eea90a3856b7b25 |     
   sparc     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/5b0863920dbb4a89b94118855563d85ba6f3212c |     
   mips64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/91e823526fb7ad5f2640866153101ed76bf9d16f |     
  powerpc    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/deab09c3a930d7fd8bf14431380ee4864a54b719 |     
loongarch64  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/7d271c54916b45104f5095376876a4e5390f3701 |     
   armeb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/99104fef5291963d364f1f0c5526de64e39c4022 |     
  aarch64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/0d1634375c4607a934f9df5c8323c41bb9c3a5f3 |     
  powerpc    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/9c58a49fd77e18b0674d6c3c29fa241e74ad36a2 |     
 powerpc64   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/ae3b3f75766cce0116d5583e96c1d53738cebda0 |     
 powerpc64   |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/d75701627e49ed3b11f1c13e8cd0fbc81baef491 |     
loongarch64  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/624243f5229b9937b4c15360c550b0ad9a4e4ad8 |     
 aarch64_be  |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/653c352e82595d1b7753a64d976713e0f7136dcf |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/71047a4c7df454b93c0e8b224c009ae9c6e7fada | ORPH
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/821f017dd1568fc9c692511dea2b15ea420c7881 |     
    arc      |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/be60a5030f5fe8e5fd369aa8aca644d0caa6768e | ORPH
   sparc     |         openal-1.24.3          | NOK | https://autobuild.buildroot.org/results/b0301025b00f24d1dd5380e9b3b81cb1e8608e32 | ORPH
powerpc64le  |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/021846637ac57c44d38e7b2c47f88b8bf85ff275 | ORPH
  powerpc    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/dbab860c6ca2271bc2a13a50ee1efc8cf15720db | ORPH
  aarch64    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/a1c0910905862b6c7258f9159965f43d7b588231 | ORPH
  mips64el   |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/cf805ab5b5f5c3f19af952eb3720da945e8be281 |     
microblazeel |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/2809ec917289d80f427066b25b4214243fda6044 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/6c7455643b1ec7b6471e086da451c48851829ca8 | ORPH
   x86_64    |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/cf53477a6b7a5c6094fdd2c2eda3ed365ca01941 |     
   sparc     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/f3955c81cb4efb627973b919e79cd107e0704a10 |     
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/1b4e2b3e94b39878f90c7047affdc36546812081 |     
loongarch64  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/b119fb844b8796b6d3b5e04e741a5dbd67286642 |     
   sh4aeb    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/383594201730e1eb86ce4306ee1bffe44e73afec |     
   xtensa    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/364f20abc5753acd0a894d52f738de15a63c8d04 | ORPH
   armeb     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/1b1c537314b275eb3be28c9cbd65450dedce9b59 | ORPH
   armeb     | psimd-072586a71b55b7f8c5841... | NOK | https://autobuild.buildroot.org/results/13084ca4df5ae91d72f46ef51873676b05398ec9 |     
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c2dd6055a38c8128cf7896e7ba95070183f7994e | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/18b8f1aa8bb5bbed2310a9841b1f7468a3b99937 | ORPH
   mips64    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b1d0c3ca726930f95f9ee43ec2e2fcdf6c08354a | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c434a7b07b044fdf692b601e3b65b5adaa2f7c83 | ORPH
  aarch64    |    python-flask-cors-6.0.1     | NOK | https://autobuild.buildroot.org/results/bcc27cc1b95dbb7134e62f708abdc8af5b57800d |     
   mipsel    |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/8c4690a55735521904c2ad02c88faad4a6702f0d |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/8f7688f2b068387e348ea53f8ba05e932799279f |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/3e96fdd72b55e53e8d64967c34b1c6400ab2c1e4 |     
    sh4      |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/5e1ce828a816af32e4d1de720173ae8f99ce5191 |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/712851c6faff361c8d0347c61f531fa43c1c57f4 |     
   sh4aeb    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/a0224d3de2318612de69076ba9998bd780b7a4b0 |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/96f4a9092ac11699ed20c6d6533a569e59406adc |     
loongarch64  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/ff7b7ac51f45748074aab9c30dc92abda6ee3054 | ORPH
microblazeel |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/7bcf2241fbc305ae8b6649afe444dc4770402aec |     
    or1k     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/d40f1dcaf700ae7c2a663985201f324bd360a937 |     
  aarch64    |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/341440b4b55e7b8b01751ee75e4a74420da0e133 |     
   x86_64    |         systemd-257.7          | NOK | https://autobuild.buildroot.org/results/238aa4744dec883dd8910ba8e71f4303793bd7b5 |     
   x86_64    |            tar-1.35            | NOK | https://autobuild.buildroot.org/results/27d94277a65fee44aeb84e578113497fe7ef0119 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/4306ffa1a10d9a5ddcd1b028401129b2a05b538a | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/4f445c3fd4ce7a204453b1df373a8ba9c0877583 | ORPH
    arc      |         uclibc-1.0.54          | NOK | https://autobuild.buildroot.org/results/8faea2e7766c780fea9d2648a874da5087081370 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f258dfc13fb67099c5a29a7dd0477be589c09fdd |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/b419ac5fce1bbe84a19e2e10574d13cf7fef1e9a |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/72a3a1b2d6ecced6ebbf682a2601c2280fda773a |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d6a5dacc351f413987d99d5735a41e3b63ba4ad2 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/63ecdf9dbe570fcf3a9f6416a714027c9e63df9a |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/3cf897125578c924df579201bc419439c4412a22 |     
    m68k     |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/6f257e43cb6419ffc774d29df32dbeaa369120a6 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/8709c650d44d5732f8986b893e574a66adc79481 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/3f57214d3e0f4725203410ea99a8343b377301bb | ORPH
  mips64el   |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/4714ee8718172a221cf5ea4cb918c47027286ab0 | ORPH
 powerpc64   |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/3f2c0495191dfb74fba39f5de095e2cefb8e8379 | ORPH
   s390x     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/c29ce04b7af44a80aee710443d4c79927b9d481d | ORPH
   arceb     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/7563161117fa8b8ae1cabb1731d21e682d8089b3 | ORPH
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/cab8779aeb6cf3b76dbf1ea7fdacf2a56969d329 |     
   sh4eb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/bfe4f6d0bc63105f28a2df0cb38105c6209f5147 | ORPH
    mips     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/4a3076f5c5437b3aa8570743774aab0158982398 | ORPH
loongarch64  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/4d5853261f03c6080a9e18f2db22afa7c227f575 | ORPH
 powerpc64   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/5cda4d7cda1d64c32eaf3917c30a78eb7639ecb7 | ORPH
 powerpc64   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/34dfeb4314af00b0760e4d2771926fd0c1ac550e | ORPH
   mips64    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/bc09777ba8184d6d1873b7f8a7c98021a653b4f4 | ORPH
   x86_64    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/36adf2f8da3f19f4500495d8ee407aa9a1090784 | ORPH
loongarch64  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/b5f8ef5d908714f41d5d16460ede6879f7e8984e | ORPH
   sh4eb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/b8d0c1c6341649fd0c0557639a2fe1d410c691d9 | ORPH
 aarch64_be  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/7abed02d8817edf3ef88652fbf91d11db8aab38d | ORPH
  mips64el   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/97e49bbc56c0b69a656150ab455cab9ad9a9ae04 | ORPH
  mips64el   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/b0b47c60c722d3d9437eaf188e4d4d841538ec49 | ORPH
loongarch64  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/d5b200453fdbb04f0dab2976a1aaba091fbb57bf | ORPH
   armeb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/e7e068ed4ee2fe74c403d927679272851a270c7b | ORPH


Classification of failures by reason for next
---------------------------------------------

                   avrdude-8.0 | 1 
                   bash-5.2.37 | 1 
               freeipmi-1.6.14 | 1 
host-binutils-arc-2024.12-r... | 1 
         lttng-modules-2.13.10 | 1 
                setserial-2.17 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/91301d6d9f1d87afdba2c310e909efe9a6b3bca5 |     
  sparc64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/4d747e67e64020b4aafbc665eb0d158e2019df53 | ORPH
   mips64    |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/5daa2fdc2c1780c38af2d129f7ec0a6e3ac6e878 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/0d354ce80caa730ca99e5a761071b68fcaeda6b0 |     
  aarch64    |     lttng-modules-2.13.10      | NOK | https://autobuild.buildroot.org/results/7ebb82170073fd07323542cdd21799409858df40 |     
powerpc64le  |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/4404f2e9bb8ddc8ad3fe53b39a28258f62829677 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

jailhouse-e57d1eff6d55aeed5... | 1 
        ltp-testsuite-20250130 | 1 
           oath-toolkit-2.6.12 | 1 
                    ofono-2.18 | 1 
                   perl-5.40.2 | 1 
                s6-dns-2.3.7.2 | 1 
                     shim-16.0 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                    wipe-2.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/79397ca6a96d8e39a91b4369bb05636779ec129b |     
    arc      |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/fb5f70aeee4f8602c5b76686ada6857f788b5465 |     
  mips64el   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/562fd3bdb9707bc98fc1951ba504b900d4e419f7 |     
   sh4eb     |           ofono-2.18           | NOK | https://autobuild.buildroot.org/results/9843828af73b376265a1b6258aa8c73d4a59ea84 |     
   x86_64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/7b94f9f8f4e56bf746202c0cd9e254bca28f90f3 |     
powerpc64le  |         s6-dns-2.3.7.2         | NOK | https://autobuild.buildroot.org/results/8d14709ace2b9a0a0e7e29d73dba8d5d0df12f95 |     
  aarch64    |           shim-16.0            | NOK | https://autobuild.buildroot.org/results/01fe8bf1f928f4cb73fecc3397a153187bb8e5cc |     
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/24538278696c0015ff3ebb135646111b69981187 |     
   mipsel    |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/9fe57e0bd3661514292407b408553faf651a5f86 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               alsa-lib-1.2.13 | 1 
                       jose-14 | 1 
              libselinux-3.8.1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        alsa-lib-1.2.13         | NOK | https://autobuild.buildroot.org/results/193c4fa7cf3102e8597c16e6b84bd5378c419c85 |     
    arc      |            jose-14             | NOK | https://autobuild.buildroot.org/results/5a502e5f848c0f4a7ba92b2942b5f4e51965a97d |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8d0d2195b5d32a16a9edd592f0d72185e71f0879 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
