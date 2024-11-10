Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FE7D5E399
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 04:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2152B606D7;
	Sun, 10 Nov 2024 04:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqfte5tVkGt1; Sun, 10 Nov 2024 04:14:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9384460661
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9384460661;
	Sun, 10 Nov 2024 04:14:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 086AD6C
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 04:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2EE260661
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 04:14:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K123Ggu6j9aR for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 04:14:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F4D06065A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F4D06065A
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F4D06065A
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 04:14:01 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9e71401844so431290366b.3
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 20:14:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731212039; x=1731816839;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Cj7orMyZCzHzYiTDJ7uTY4SBiOJvcTamtZnwS5o288=;
 b=FNDqunS6cIRgC4bJwpP+A2ghStDR9gXUfxfw11yaio0C2mDmimq8zxGZDtEAr4aU5r
 +D/pefNunsm9XUQPn85Xc2nyHVsOGYbs4ShnHydC6wpdIc9uB1R12TS1VsLTj0QTv8+b
 n4nDXqexUbt4aB0FA9q+n8TahukLShzQVd+kOCcxklsYLqal7eTOcQc+l3lmtfsc5WCW
 F54joixmGab7iFm+MvjtwUGXSMQ+cfKzYhVfGbxMA2FmdRRUK6Ky7/6bUNZn//MduIpz
 obte9GVmSRNXEFkBVdwuhPAb+vxnDWbTnildzX1zjqooR/IdFOWZd6y2WVeVrXAvGfSh
 wgsA==
X-Gm-Message-State: AOJu0YxqG8rC/ojjTNSh2RXEopzAsytiZaa9HFMyn6IL1gyORiLbXZR/
 9WqZEFbYbveHCkKQxitKD6Q4xAKwCLR2dFJJE3jbXtTacV5LSZ/2ubzRHg==
X-Google-Smtp-Source: AGHT+IHARqBhguIppyCyYe1YQx551p5rOV9pQ66LDiRCMSFlVwtry29GxyCKQ4qnGl4YJuH0TEw/ew==
X-Received: by 2002:a17:907:9490:b0:a9a:59f:dfb9 with SMTP id
 a640c23a62f3a-a9eefeb2eb3mr746181666b.5.1731212038598; 
 Sat, 09 Nov 2024 20:13:58 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a17b58sm441410366b.25.2024.11.09.20.13.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 20:13:58 -0800 (PST)
Message-ID: <67303306.170a0220.1be52c.f1b9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 10 Nov 2024 04:13:58 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731212039; x=1731816839; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1Cj7orMyZCzHzYiTDJ7uTY4SBiOJvcTamtZnwS5o288=;
 b=SZgHJX2GSfQT1qsdYoHnh0l4SlHZ886QeVFtr2+U9y1jrhq/Z3kI0a2mu2NSS7ikX6
 LUSXVhQSHnUhWvYcLs0xyeiwKPrqlK+akjoIaj/S0N7zEOmQuTGQneOqopwiR5XcPtIS
 trYXmy2+IBlrIaQeAC0OAaLvlVFMPOr95T49FuyLrPLMyXcyfNJ0Rt1d8rrz2xGVlc+/
 JjP6EdsXgfnGvX88tjAHJ066ObWDJ1u9ONrQ/0JNlQaRHKEMlMS6GyFVXhuiaLlVZIJe
 xCG+6/elEoxswP6Jb8AAVohpPB+UiLDPzPT3APD9phQa7wnearIqswfsg7nJ20J14c4O
 KrgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SZgHJX2G
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-09
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

Autobuild statistics for 2024-11-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  7  |  0  |  9  |
  2024.08.x  |  1  |  7  |  0  |  8  |
    master   | 15  | 309 |  7  | 331 |

Classification of failures by reason for master
-----------------------------------------------

 ibm-sw-tpm2-rev183-2024-03-27 | 20
                  linux-6.11.6 | 17
             dahdi-linux-3.3.0 | 15
             util-linux-2.40.2 | 15
                lmbench-3.0-a9 | 12
  gobject-introspection-1.76.1 | 11
              host-rust-1.82.0 | 10
android-tools-4.2.2+git2013... | 7 
         gobject-introspection | 7 
                  bcusdk-0.0.5 | 6 
                 c-ares-1.34.2 | 6 
                   foot-1.16.2 | 6 
    host-python-greenlet-3.1.1 | 6 
               pulseaudio-17.0 | 6 
                elfutils-0.189 | 5 
              libopenssl-3.4.0 | 5 
               linux-pam-1.6.1 | 5 
                  ntp-4.2.8p18 | 5 
            host-binutils-2.42 | 4 
           host-doxygen-1.8.18 | 4 
          linux-5.10.162-cip24 | 4 
     linux-5.10.162-cip24-rt10 | 4 
               procps-ng-4.0.4 | 4 
                       unknown | 4 
           at-spi2-core-2.50.0 | 3 
                  boost-1.83.0 | 3 
           crucible-2023.11.02 | 3 
                  curlpp-0.8.1 | 3 
                  ffmpeg-6.1.2 | 3 
            gettext-gnu-0.22.4 | 3 
                 libpng-1.6.44 | 3 
                 libv4l-1.28.1 | 3 
                    mpir-3.0.0 | 3 
          obsidian-cursors-1.0 | 3 
                ramspeed-2.6.0 | 3 
  binutils-arc-2023.09-release | 2 
                   bird-2.15.1 | 2 
             containerd-1.7.23 | 2 
                   crun-1.18.2 | 2 
                cryptopp-8.9.0 | 2 
                     daq-2.0.7 | 2 
              fluent-bit-3.1.3 | 2 
               graphene-1.10.8 | 2 
             gstreamer1-1.22.9 | 2 
host-binutils-bare-metal-2.... | 2 
host-heimdal-f4faaeaba371ff... | 2 
                  jack2-1.9.22 | 2 
               libunwind-1.8.1 | 2 
           libzenoh-pico-1.0.1 | 2 
            linux-fusion-9.0.3 | 2 
                  nginx-1.26.2 | 2 
          sphinxbase-5prealpha | 2 
        util-linux-libs-2.40.2 | 2 
                 watchdog-5.16 | 2 
               acpica-20240927 | 1 
                acpitool-0.5.1 | 1 
                 agentpp-4.6.1 | 1 
               apcupsd-3.14.14 | 1 
                  boinc-7.20.2 | 1 
                    brltty-6.6 | 1 
                   bullet-3.25 | 1 
                 c-icap-0.5.10 | 1 
               collectd-5.12.0 | 1 
                 coreutils-9.5 | 1 
          cryptodev-linux-1.13 | 1 
               ebtables-2.0.11 | 1 
                 erlang-26.0.2 | 1 
esp-hosted-91b093365cc58214... | 1 
                     exim-4.98 | 1 
                   eza-0.18.22 | 1 
                      fd-9.0.0 | 1 
fs/f2fs/f2fs.mk:64: /home/b... | 1 
                  fwupd-1.9.20 | 1 
             glibmm2_66-2.66.6 | 1 
         host-libxcrypt-4.4.36 | 1 
httping-0e26c53d5fe504eb720... | 1 
           janus-gateway-1.1.2 | 1 
                latencytop-0.5 | 1 
                libdrm-2.4.123 | 1 
               libglib2-2.76.1 | 1 
        liblog4c-localtime-1.0 | 1 
                   libnl-3.9.0 | 1 
                libpeas-1.32.0 | 1 
                  libsepol-3.7 | 1 
            libsvg-cairo-0.1.6 | 1 
             libtorrent-0.13.8 | 1 
                  liburing-2.6 | 1 
                libxml2-2.13.4 | 1 
        ltp-testsuite-20240524 | 1 
              luabitop-1.0.2-1 | 1 
                     lxc-5.0.3 | 1 
               mariadb-10.11.6 | 1 
                 mesa3d-24.0.9 | 1 
                   mimic-1.1.0 | 1 
            netstat-nat-1.4.10 | 1 
               openblas-0.3.28 | 1 
                 openssh-9.9p1 | 1 
                   pcre2-10.43 | 1 
                   perl-5.40.0 | 1 
                 pixman-0.42.2 | 1 
                    polkit-125 | 1 
      python-autocommand-2.2.2 | 1 
                  quagga-1.2.4 | 1 
       riemann-c-client-1.10.5 | 1 
     s6-portable-utils-2.3.0.3 | 1 
                   sdl2-2.30.9 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                tpm2-tss-3.2.2 | 1 
               valgrind-3.23.0 | 1 
                      x265-3.5 | 1 
xr819-xradio-3a1f77fb2db248... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        acpica-20240927         | NOK | https://autobuild.buildroot.org/results/f861aa8ff869453a8fce925403cb6a6ea5050c13 | ORPH
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/20412677190c562560e605256ad7c9e57972238f | ORPH
   mips64    |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/5a7cc6123a183c6a3f55361c52fc5b1dc9d4d4cd |     
    i686     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/d9b3d0741f6011eeaef7efaa08d20811a562e4a6 |     
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/b151be8f1c4509bb64b4614de574625973f67066 |     
    mips     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/f9614b8c40afb3151fe5756dc593c450a2ea9d8c |     
  mips64el   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/3211c877dfafd0d4d8206c455eb4d53245929419 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/863766f4f60e3441fb169952e06fd2626a1f08eb |     
   sparc     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/83048aaba448e9d819ea945971548f595f0d10d2 |     
   arceb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/470e8f34d9b471507a7e1d7ae80365f56824ebbf |     
 microblaze  |        apcupsd-3.14.14         | NOK | https://autobuild.buildroot.org/results/a1b6380646c85e7e4ec66b86633d72041d5ac9ab |     
   arceb     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/d23f5271400ab4b5e225d49da64f42e4456041dd |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/cf0f831b6854e85c0ebcda61cc4df928ab0c78f3 |     
    mips     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/1b9309cebe0c9fce55421dffd19b4d1de8b93fb6 |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/5ca8227f32acc2fa09e861bad71af090dd73f378 |     
  mips64el   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/fa0ce6ef898b3ea3749b2454e71fae8be003422c |     
    or1k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/5ab9e4eecf33d8713dfd4c3a63457137e802421c |     
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/c3d1978a5fba37a9245f95edd3b64da4900769f1 |     
 powerpc64   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/c6f809ce4b8f758afc3b5870d3c1b86d050fdac6 |     
   s390x     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/af6b85a72be9d8cc128d31d019474d09ad1db51f |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/29b4ba4bdcc29d92719a350fde6174503d135438 |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/0709451077bc83f629304716533f2c04c9d2d3d7 |     
 microblaze  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/58214b1b9240bcb4c2a19e3099dafa6ffbbd91a4 |     
   armeb     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/2493d916c087060f5e5cde3b41d179035cacdbb3 |     
   mipsel    |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/ef4968559194202941f2fc4ffcfc389e5132960b |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/1649584efe3d31c3076cfc059400879b40579959 |     
  mips64el   |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/d10bc3b4b07e746f753d0172ed5c1fb50ea9ef20 |     
 aarch64_be  |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/2355bbc57f048bc83dda6da2621281474664e47a |     
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/464d7b1a457df849bd7c88dc03eb5c15c889a2a1 |     
    or1k     |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/58b16b665a183e01ca56561333f6825643fd141b |     
    arc      |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/d418694e45e796fd2415000dbd469779a35e9295 | ORPH
    arc      |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/2c4066389a3acaccd7ba1351fffff6d9f24a6ee8 | ORPH
    mips     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/792f4bf246282e28cbc3e0e0f5077a2c066e8cb4 | ORPH
   arceb     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/0851b859aadb0cefa13dca6f3119e8df2f3746bd | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/02ad60b9da323aac5a5ee20ac36393f5fc39eaaf | ORPH
   arceb     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/1f3b753040de03a32fcd09535b509fc99327220a | ORPH
  aarch64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/74618ae5cd233b028ab1cde9da3eb111948af747 | ORPH
    mips     |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/11fbfa66e2752bc06af9d56fbd28cd5e44d26981 |     
    i586     |       containerd-1.7.23        | NOK | https://autobuild.buildroot.org/results/a663601e68c4471f72f81b407c9bcbf1b453d247 |     
   s390x     |       containerd-1.7.23        | NOK | https://autobuild.buildroot.org/results/cd53ca3593368f094d94e540bb573260cf555f1a |     
   s390x     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/575c0b5cf42207d2c5743883227367b42a7ca9fd | ORPH
   s390x     |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/062ea6797fcb176ad31b07725264fda9f0c3c752 |     
powerpc64le  |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/ed521b18232169a69095c0f46f1da6c15bedf7b4 |     
powerpc64le  |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/d6ad26a6307e661c8f65a2d548088a755a67bea8 |     
 aarch64_be  |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/d054104deb23e0bacf613f48fdc5afede1fb81c3 |     
  mips64el   |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/877f1b5b1def5ff85cf3ccc0f7cfa0c9c8a13e1c |     
    m68k     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/be7ea77aa905e22412a2555b5e7ccd482be3be1b | ORPH
   nios2     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/d540fad12eaf1f4e7818373f4748ca2db141a69c |     
    arc      |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/7bc1124d2e7718efd4f0c3d452f95e15879aadf0 |     
   s390x     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/ecabeebed7c5873d5a8a41f274c2480e94c551b7 |     
  powerpc    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/81f695091870feeef63e9b3f1a7fcc84c794cfce |     
 aarch64_be  |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/d84733f15bc071406d9fb028b58b16d7dd485c7c |     
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b5d15ee5222a60042daa733cee4dc01cb90a2547 |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/729cb7b3ff8e76508de09ec3a6f9bb237f2609da |     
   nios2     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b45e918482ac42ca1d115101bd9cf2fa331979dd |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/bc192207bcf3cfc91528928f8c2f79a5c08e1aea |     
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e01dc7a89a8cbdecde1de9eadacae0d96f764052 |     
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/dbd892f61caf91d2e81557cc81c2bfdbf8610fb9 |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a459dd5dc0e1625a1da38a25a9d2de0154cffd88 |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/96894210543baec120003805fb361cfcd91acff1 |     
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7a7a592307b0a88db93abe01b2fe4de3a587c37f |     
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f82fcac94e8ba337fd3827379162b25825c658d6 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f904a99e47444510d338fe75bc82f24627c7382a |     
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/be1955c9c7d4dfa4bcf5806090251e86c2f8fa27 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/00283d1c1a64986cbbaa3f67650f1b5c888ab4b9 |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a71455b9c2ab181cefd230dce04993930cac0378 |     
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a492b6a95016e1b989ab77a7db1604f5102ff8d7 |     
    or1k     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/530bf48d1d316f644896bfe47901985920f7d8dc |     
   nios2     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/3cf049839383c4c859af7bc8db5b585306c25230 |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/80d446c272088b33c1b2851889b1a4f3f3c31fdf |     
   mips64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/8e3b19e0715ada748c5d61c097b4ed0abe9262d8 | ORPH
    i686     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/cd739cc4701586f29a9416f48c239db0a4573e22 | ORPH
powerpc64le  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/ae538e127fa9b8d7a81a82d37392e2da31507c49 | ORPH
    arc      |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/487e8fc70ddfb3d6cd7ca79ba916310adf484bf6 | ORPH
   arceb     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/dc4b9eda0bc33e67b0d50f3e35b8ede96382c03a | ORPH
    i686     |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/c24a1d86e3d9a789c339eaab36f6000b853ebba9 |     
    m68k     | esp-hosted-91b093365cc58214... | NOK | https://autobuild.buildroot.org/results/1df736417dd2beda4a12d77b3f84e35801106889 |     
   armeb     |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/f3d55c70a4c043304b7813f20713bd917e4731d8 |     
  aarch64    |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/9e22f9c3e1a1649d76f7e6083cc111b0cf0d6404 |     
   x86_64    |            fd-9.0.0            | NOK | https://autobuild.buildroot.org/results/e9eec819f9ad12ddc11e895b694817cbb05316ee |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/e95f502bb0be1f2c90d79b72c53cff2f2040abd4 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/93d6a9f52bec87fa066a59a7581accea98d5d0f1 |     
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/d1e9a63f426e50e27fcad084f8f077d3fe0ad4ad |     
    i686     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/d78a176f5f7d0a57ccb111229774a95997ed57b7 |     
   mips64    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/e6834e04286a7744563cf4595e769264f3903611 |     
    mips     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/f4290d806e232f6c8988851e0c79153bade6a743 |     
   s390x     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/3a4f5bf9b75f518dc1fc2ff264e122541833da9f |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/564b0fbecf6573b13d065c2397268750725b297a |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/eba1545f880bf59da2d2259642faacb13af58d45 |     
   s390x     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/896f1ce79ce315b099f9c5a514c6bdbfa2610f3b |     
powerpc64le  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/a0050f5fb35860d85b2aa8753e2fafb2d05d3b93 |     
  sparc64    | fs/f2fs/f2fs.mk:64: /home/b... | NOK | https://autobuild.buildroot.org/results/b180cbf602c8e3a49e3c62959c23da5be49313a2 |     
   nios2     |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/11b2dea634cb0a829f4a9fe16b124c0bea26ab00 |     
   mipsel    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/1375b1ef10d8f0997477bb99d219420829dda15e | ORPH
   xtensa    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/7e1a1f7097047895c9363aedce0d09d0608b71ee | ORPH
   arceb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/ece0de88fe0e925df5fa6ce1b8c361c71333e221 | ORPH
   s390x     |       glibmm2_66-2.66.6        | NOK | https://autobuild.buildroot.org/results/d1a221cc002121e674ad56fcda67eb78837143ce |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/51fa4b27112662f5ee9f739b2d5b4721e705e3a0 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/699f15be9efb6d902ccda8c5036def94952d748f |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/cd5f1848dfa36586be26349375c550e26ac3783b |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/5bb58ac35e12e3559c1fc7c6da5c2f3bfe95226c |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/eb75456b56247dd97ecedb5641372d371941311e |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/5a8aaf22d3a96cb7dcd42a659ac78381568080e3 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/d3a0460843e172252e2c253c60c21fc01ac032dc |     
    i686     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/f02ff769cba552fc6f3ee2fb4ead9afb9e0ecb4d | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/a8fce6cf150aaf77b3a1dc8f7beaf5e2e3c9a853 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/d0ff294d715edf66d213b48b3596952439e5177b | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/3ee6ea18d89c4e5ea6e921a2f024294b707eaa5e | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4099646c147c3b4f216c6b5e44fdf755cb81c498 | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/97c88256987c3b92db270544e4ae61bf7bdb79ac | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/b24a5eb8baac860782c36bd90631c9318af67e66 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/f98cb50f3a321d187b06def6a8b78a00b808c9cd | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4279df4954e2e891f1ef9e04057d5ca3a38ac9a6 | ORPH
   sh4eb     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/91c0880d6b10ed1229f3d5d23589357831180049 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/744de7890e824aa5fce50620d2e0b0264204db11 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/554ad9b8ed8d789bde942c86d9e6eabbf407e51a |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/a0e41547ce44e6dcf5dfc154babf6715fe876ff2 |     
  riscv32    |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/7ac41c74b675053834df0932022757d728726514 | ORPH
   sh4aeb    |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/3a4feb078923eb356bae21c4292d00c1421234ba | ORPH
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/8969b55a284049b1b95b87f42a81faca0d18e860 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/3c75ecdfa9680956705d7d7340dd71d091f12847 |     
    or1k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/0d4f8bb7586f601b2118c5c7ef3132bbfcecc226 |     
 microblaze  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/09bf20ea9855bf0fceae764fde836ffb2dc2c24a |     
    i686     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/cd0ed8fb53e4038f4dbf69a86bda35fe8e3485ee |     
    or1k     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/c4b2d38a7e9b3d72644045a933a766425f11a7fa |     
    i686     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/8af3155c9a926039458a18529e1238863278e780 | ORPH
    i686     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/076143e9ac04440d2c4e09986010ce98155d18f6 | ORPH
    arc      |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/6053d24953ef5a2dd0d2710ae2dd6cd174f7fb44 | ORPH
  mips64el   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/48a64603ef2cfdc9319b7e28a2373ce85e1a938d | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/ac1030eec5bb229ee159a8a5b308d5a781874809 | ORPH
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/13e254580966d8ea41c2f2225f5246d700017a40 | ORPH
    arm      |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/809f4efcc9c0a98e4c7efff36918cd074bdc7ca9 |     
 aarch64_be  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/1d15d2c50d6bcf7705c135ef1a78ea207fdf07dc |     
    arm      |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/3e8549641108135c946a2005107a679d98cf49d8 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/546b9483712518cfc9df15797744c009b8211b95 |     
 microblaze  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/bfc6a8f6c61522ab23b6cd05e7b83aa289236c87 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/c7f9be0ac9e591f75e83151afc1d22ec3b964796 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/fe053dafb16db79066e561dc0eaf9dd7f5b56bf7 |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/5389ca1c8dc8ed7b051aeab401c9e915b8af49a5 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/07ab4842d1ff6966e867941a386e420ccac8535b |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/e37fa1cd3958f58c3967397074c9ad618232944f |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/4ed635992f6e3a06a97d258e5d5f11b798826a01 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/b4d1414c5f0d6d37cd0a4a21e22f8e44669d127d |     
  powerpc    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/97b33a09f67d9fc02edff7d21b120e59c5b2c4b5 |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/2c71a1f96f5b658389bc29ffd45f4a8e0381169e |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/ec41f0b31c93874876a91996f815ab0488139232 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/5a946527df515a07cdde850ce0f546c13035f4c2 |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/2238d9356673b7696d69136b03e79e62368b92b1 |     
 powerpc64   | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/991c3869ca1ce8dac46cdb9e5b33c7458915f4c8 |     
    mips     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/a17779bec0645a3465dba724bbb57efb7051c41e |     
   nios2     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/dbdf9d8b860c1defe8abf798e867170a92c9945c |     
 microblaze  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/2fefc09bd7ef7cdf5a77450cea4e8e47aa6b107b |     
   mips64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/7f4dd47ba2e3acb77fd65640da80a37190b700b7 |     
  mips64el   | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/01d1d0fd6b157fc8362abe5edae4cd3008e8d482 |     
    arm      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/1c54975921f5e31384fa8209f39e15f8502ac124 |     
 microblaze  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/a039665edfab4817505886fa96c5e5dadf573ed7 |     
 aarch64_be  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/ef6bdce9e6beb84f161b716c8dd4029a81b5929d |     
   mipsel    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/3267307c862fd4e4b921ebb30a893780febbb073 |     
    m68k     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/6c8c94b85ea6a1e6f47acd8730107abbb339a2a5 |     
 aarch64_be  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/b4716920f28252a6ac9c25070e7ce5154f1ecf0f |     
    m68k     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/c6b5f04c14d9125b2e8b268f476043bddbc65c30 |     
  mips64el   | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/3199e854223cec3866a06f73a5736444b633e40b |     
   sparc     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/02ca7950082f717647603a94033807406593f694 |     
    arc      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/3240a57ad48d1fd94e9ee96b5a4f5333180cd02e |     
    arc      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/27e0dfd9ae0dce86351d402b299e7785ce73172e |     
   mips64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/629b41deeee895c181a3da000d8b65f574ab9585 |     
  aarch64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/38b404b29cc1cfcd8ad9510e75df26835e9359ae |     
   sh4eb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/e27625e10534203f044da4ef81c69d72211c284a |     
powerpc64le  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/66e6d4dc8fda567f859892ad65a5e17844801a0e |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/6ab32b78e78bd310ace5fccbd95359c74ba19003 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/a6b365d9b367bb3f1a36ff44d51ac447b2f49746 |     
    mips     |      janus-gateway-1.1.2       | NOK | https://autobuild.buildroot.org/results/5d1350a1896f57f70f092fb836a5f48e938e54d9 |     
  sparc64    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/c8faafecd1b11a6d52ca5efc977ad3525f4fca1d | ORPH
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/c00ace65b4d39eddfea59e53b08c12b658188f3c |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/30f87930148dc60b076d273924089fa0ba557518 |     
   nios2     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/46947415553701b534c4d4510540f8d2b021ad20 |     
powerpc64le  |          libnl-3.9.0           | NOK | https://autobuild.buildroot.org/results/3ba99ffc2b2d1b194a3d3a4bc53f4e608d20c5ca | ORPH
powerpc64le  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/fd651af70d38a61cb2885971745649ac58b286c7 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/22b41964c61852de76f44a8f494cebbcabd744dc | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/37f707567eb5f17c4b01e00318e3677e3248944e | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/4792bc8049b3cf951a24af8245a7e42951aaa44e | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/d5bb7b80c67b1c8fe4213fe6d7bc54b79c3db1d5 | ORPH
   s390x     |         libpeas-1.32.0         | NOK | https://autobuild.buildroot.org/results/0de5cfb2aeecb93f595c452a1651e4784327b06e | ORPH
    arm      |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/554afd91d975f19fd0d316f00ed1a274c42a4d19 |     
   armeb     |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/77eac46373b15b4bd41636b70cc4adfa5acc6de9 |     
   armeb     |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/5a1503ffdfb69b61db38ab0e2373a7a2f612f028 |     
  riscv64    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/4122d043689b0e6d167e3e49cc1ac3ab95171333 |     
   xtensa    |       libsvg-cairo-0.1.6       | NOK | https://autobuild.buildroot.org/results/3c2fab63f602e5a67ec5e604132c516c6e3831f2 |     
 aarch64_be  |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/0a5d907943d7e34c00b4b64856c31c42cf91d9b1 | ORPH
    arm      |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/bfb5d7cefd58c7bc888dff6284162b996bd91bac | ORPH
  powerpc    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/b8303c44c623f800df05428b36e6209bdbde2b1a | ORPH
    arc      |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/bfd996563a057f5c20df25a0566fa4f2d8667034 |     
    m68k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/8fe2129eef8ab9780c4146361480d7c5745bc3d6 |     
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/ffc811d8a6d7be3124dbd4ae6364fd203b1c884c |     
   sparc     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/fe3012bca5e98a05a0a1e80bb58a622e97a62f38 |     
   sparc     |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/c4326f76cafb2aa297fc5339bcea537190654a82 |     
    i686     |      libzenoh-pico-1.0.1       | NOK | https://autobuild.buildroot.org/results/4e7dfff91863a73c40e7642367c5b7a662c2f779 |     
   mips64    |      libzenoh-pico-1.0.1       | NOK | https://autobuild.buildroot.org/results/f1ee480675dd8d86bfff5baf1d0a965981861cfd |     
   xtensa    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/ad92a320c2e99044d8b5857eb36e09d54fa519e0 | ORPH
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/926aed3b21ed5362d10001cab77e0f9f1c033b2f | ORPH
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6d4e8a37fe8b339ef4acfef4832fbd8bf52e8e2d | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f9c2b15c30bd02537f32e16522535b9130f6a55d | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6005f61c3056fd1ee2a6e5ea40b3e45c3441f307 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/e4d92404735e190a63e3d81ccafbde96eb98dd35 | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/a93ee4bea1545b73ffe72c30be9424ba96ff0e48 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/113be5f5ce2f92db98bdc66ef044395ee2eb1105 | ORPH
  powerpc    |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/7f7fd444c3bf117a0e54e832b73c04a1a162cc87 | ORPH
    arc      |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/cadfbaf7c73443d512becce2698b9335731011ef | ORPH
    mips     |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/4abaaad7cdbc419c723566715cd8c5c11029fa4f | ORPH
    sh4a     |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/7bfe5d6b5fdb961ca24630b3f036dc3194d620de | ORPH
   sh4aeb    |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/8c5bca6dbd8145511e254c76f2c62df165ca1edf | ORPH
  powerpc    |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/03660543cdd877e7d8fd5716c19516b3132f295d | ORPH
   nios2     |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/9fb34601d561da63c3e9430f036fba2350510c62 | ORPH
   nios2     |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/7adb95a1ddbf58f5ac7dade686f87c63cbeee42c | ORPH
  mips64el   |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/a65d73edf07b3c801bf2cea15145f614539283c7 | ORPH
   arceb     |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/725a915736d9a89fd31b8d3a1cd7151def3049c7 | ORPH
    m68k     |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/a3c1bad04c2629719c2d6e7b991507d52c8a584d | ORPH
   nios2     |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/d77e5ed08f7b3ada7b6fa549bba7331a0cfa2b0c | ORPH
    i686     |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/776d617fd50545313a7373f70478170026d3f9bf | ORPH
  powerpc    |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/650033e6bb3192beb6cded4066f0c632e521ce32 | ORPH
    arc      |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/64deb8aed86ba12bdde7db37b5d8fb07ca7b356f | ORPH
   mipsel    |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/823392c57d3c4ae2078d53acd9ba1b7b3eba1206 | ORPH
 microblaze  |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/29f98b10ca89bbdf9f05d03620de62d427135a62 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/fb43b590ee3279fb7285785e19ebc6d843cf2c37 | ORPH
    i686     |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/09fbb917b20e2c400612068e94155c19e3a6e43d | ORPH
    arc      |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/64bc3a0898afcecd8773791cc7fce3870c0f9759 | ORPH
   x86_64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/d12ae7a6358f36a9fa31295a12f2bda7d85d1e5a | ORPH
    mips     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/34cc69b58c819fddcd9682da04117b0c93515dac | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/f857f5c77195bbbdf6b275720803704ebef5ebef | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/9fe973ec371a7e8914a008459baa6ab5dfd6304a | ORPH
microblazeel |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/140fc60d2ab717f9678cb17b8ddff392386c259b | ORPH
   sparc     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/01a737848897e47d30f3df6a6c028815bb8e08ad | ORPH
  mips64el   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/4307103ac44828177bbe39a61e8f226799a3b144 | ORPH
   nios2     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/2d41cd1716d8748725e770dcdb69cb471ccef3d8 | ORPH
 powerpc64   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/7cfca0902eb88021929f40cb8d4a8ab417fce83c | ORPH
   sh4eb     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/9fda74e29de65eb29681903260df18de2907c7d0 | ORPH
  mips64el   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/28118a37de407ccd78e50311fdf85c75f4e0afae | ORPH
   xtensa    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/ec0129cd20b157006952ee3192c39745758ae2cb | ORPH
    i686     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/a93d0226439ac28d7e0fac854e69ce77309caab6 | ORPH
    i586     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/7b6987a4dcf157e6f928d1181893b702bfc48b43 | ORPH
powerpc64le  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/0a59ab69cde28f57a9c80378da8184fbaf8e4059 | ORPH
   s390x     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/c2ceeca97e5e4e70a117dc480b1d84b48d07c218 | ORPH
   x86_64    |     ltp-testsuite-20240524     | NOK | https://autobuild.buildroot.org/results/1551e33b30d48a1428bac97e710ba2fef0056eae |     
   mips64    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/2fde3187a3689896c2f2822d9a31f492033b175e |     
   armeb     |           lxc-5.0.3            | NOK | https://autobuild.buildroot.org/results/cfb1c549a8289036c19082d8aedbe4e8c12651c1 |     
 microblaze  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/b08ba1c15c70339792c1867cd19dcb8678ab22a6 | ORPH
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/ce1e15a3501933a397679d523c0aed6cd94c1555 |     
   mipsel    |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/06146c714c7596ee03999452a5335aef3d725a0b |     
   sh4eb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a0f318162ec670d82d880e6c09e614c278c245a2 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/04ad98a2be9407643c5231aa6429945b98325610 |     
   s390x     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/dbb7ee4264ba2c46e406ae7971fdc31b81367286 |     
   xtensa    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/6b90c75c10b16975484d18dde0569c3b1650a76f | ORPH
   sparc     |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/a0f1849bc8e3744f79e4a1c48ebd7fdc86d26baa | ORPH
   arceb     |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/1d7f2d0bb822dfc6aee6df5ebd789395f6e8c0d0 | ORPH
   mips64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/b09887f582a6897aa2782b8c2684cef26cc5bf3a |     
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/7cfa78d96e61b7ad0252b5142c48a522167ea812 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/925bcebc120eeea25b6f14b3c3ae7eafda4c3ecf |     
 microblaze  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a67a3a342928f77ec567c8062f2591a73aa79177 |     
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/72ebfd552bf6f4ccbc5ce685d71647bf7825ab8d |     
  powerpc    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/304363140e49155eff6c674be2a3da218f7dead1 | ORPH
 powerpc64   |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/d88fb741103928c60bb3293748fd6d28627e61c5 | ORPH
    mips     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/89ad263f4dc915f4c62014f630efcfceb4886a45 | ORPH
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/bc299ba2d70b26f386a18248cebcc679c617caac |     
    mips     |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/4a3a6b55a21f3fe7e1b5f4dc64200b155e053dd7 | ORPH
    mips     |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/e5b99e9218a4334be298b0bc8d42b02e9ec0cbba | ORPH
  mips64el   |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/faf7d2914ca2d4740a311dd17e6cfcf554bf4268 |     
    or1k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/1ebe4688437efd764f854ce5d271bb582a163b50 | ORPH
    arm      |           polkit-125           | NOK | https://autobuild.buildroot.org/results/712ae68439204c8588310d4f58a00a99f71112c2 |     
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a5bdb8b1a61d88a11d16f09be027a71f38d88f1a | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/22e98010802f953e28aeb8c37706af20e1a6d240 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/0044d815893ea8733874aa2d4a5904b1ef71be71 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d75164bcad1e0d7c7d5324b7fdec523d7c88632e | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/0cc7e32d1180d308106e11e52cb539a47d6727f5 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e8b1b4adc32825d7a58900a96dd23ef85fa4fc7e | ORPH
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/4c187ec508abac2c1402ff9b3c242856d48d5e08 | ORPH
   sh4eb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a04c9cef00b331a1d2e98af2f70ee04a08111adb | ORPH
    arc      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/99dd3a9ee8503583655656ed65fab5b6e7331076 | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b0576c3b71cd946e8772d1827dde448ae0e1c444 | ORPH
    m68k     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/57c75dd3d82bfd44961bc7a78afa0c1fc2e6e34e |     
   sh4eb     |          quagga-1.2.4          | NOK | https://autobuild.buildroot.org/results/1d065c219b61175c168e7c6e4b8918bce3a89b5c | ORPH
   mips64    |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/5a980dcc537753e2bd7a9729d681980522f3a946 | ORPH
   sparc     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/6f10f748e5e698b891fde278abe5f070950b82d9 | ORPH
 powerpc64   |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/e593cdd96259fb4d3f45e26562cd0df094248da0 | ORPH
   sparc     |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/4ffabe841f884b3b141fc5170d963191adbff355 | ORPH
    arm      |   s6-portable-utils-2.3.0.3    | NOK | https://autobuild.buildroot.org/results/7e78117cd45febc93bdea1ad0520ff96db452b14 |     
powerpc64le  |          sdl2-2.30.9           | NOK | https://autobuild.buildroot.org/results/15d322ca4d225388e629490582da8c4dbf360da0 |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/2be3d9ffa0935587b6bc06d9296d9c1a232428ef |     
    mips     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/207b53e53ef3ec51ffd14ba9084f699e21a170e1 |     
 powerpc64   |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/b45eebbcc86f33741053bb6f9b89e16c7041c470 |     
    m68k     |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/f3c006a0b24ff3d201cbf6fde404d15e37024695 | ORPH
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/f12f3aa35840c75da3bd9cd16ad689b9f900e4cd |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/8569dc2550cc0e9bd0aeb3824593ea05e2f7517e |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3d483f4d8e8bfade3b557d897ab03de6ad794fb2 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/cb75f7366204c241a0c74b9747d580023560255e |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b77b3764abb576ca7ce2de86d35957144a9acca8 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/0e8cc6be094275c5b41f60229ca7b9ed37d85282 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/9b1d0ddd767dd464937827b05fd53956819ac649 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/65b4dd4b6b813a5f2b5e0d01cfa18aebbdfda312 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/538f6317dd7e53b945b82bb62f0158deab468f85 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/56203fd9d01955828be02199325129836f8bd593 | ORPH
    arc      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/f2416ce36c0daaff4c5ec05632c5d0b29df58eb0 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/1fd82eefaffa780f46031d40c909c03da2ba8939 | ORPH
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/dc27084290517040f0ff8ec84911a89ccf1683a9 | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/70417a5bc710c21b0ca66a0d89ec2bfbb14dcd6d | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5b16edd5638fc43fe9565c5499b25df97ad3d675 | ORPH
  aarch64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/06af9f7d65507eef7ddfe266e999056cdbb41ea5 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/12d79c6bbe78f5b53821553f1ea0f5909e83208b | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/0e9d4642ae815d1ee43b63c1883136b9946029f8 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/97ac9a8797e2222accfa1c60f56e63ca7190c8c3 | ORPH
 aarch64_be  |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/7f965069e6b7733bc329549d34431662a10204a3 | ORPH
 aarch64_be  |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/6121aef9e04d2184aa3c20eb322d9128953449d0 | ORPH
    i686     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/0e685182858a0b1be792b9467f0da5002c7a0727 | ORPH
   s390x     |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/f08335c374613d861bc920fbb5870ed7e74dec2c |     
powerpc64le  |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/298116c621ff7da2b2d0529ee80a44c6ca5a111f |     
   armeb     |            x265-3.5            | NOK | https://autobuild.buildroot.org/results/10aa3f860add239cb8861146b6e70c0723a429d7 |     
   armeb     | xr819-xradio-3a1f77fb2db248... | NOK | https://autobuild.buildroot.org/results/3742a661b3e3ddda78e4937b4e2c4ef9affa1228 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  curlpp-0.8.1 | 1 
  gobject-introspection-1.76.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
host-prelink-cross-a853a5d7... | 1 
        host-python-lxml-5.1.0 | 1 
                  ntp-4.2.8p18 | 1 
               w_scan-20170107 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/ca112622c3939beb513551907edfd6f28f65cfd6 |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/f6ef27193748dcc7ed2cc488b85c4e9f5763951e | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/d6805e01018e7f198c0d7e3596c476caf236900b | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/96419444fb8be5fca348d45c44dc14aef1fe8225 | ORPH
 powerpc64   |     host-python-lxml-5.1.0     | NOK | https://autobuild.buildroot.org/results/ac5d41838ca0887c790fc9590602ffb698bed48f |     
    or1k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3e83b180d87f43fdf209c980eabc24ebf8dd3501 |     
  riscv32    |        w_scan-20170107         | NOK | https://autobuild.buildroot.org/results/c9b94980fd5abd66ebc342ac72e71f93ab2c0e97 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

              fluent-bit-3.1.3 | 1 
  gobject-introspection-1.76.1 | 1 
               ipmitool-1_8_19 | 1 
                libesmtp-1.1.0 | 1 
                 linux-6.10.14 | 1 
               popperjs-1.16.0 | 1 
           python-daemon-3.0.1 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/9c25721a6ebd3fdfd7ee3bcc517d91d2345941fa |     
    m68k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/ed49dd733f643eec8fb2ca193813d743027375ee | ORPH
    arc      |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/2169e26f00ca1b9eb5c17bbf50e69c67664fe24a |     
  riscv32    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/f937b9b2d312d5369d310a2da8450660e894583a | ORPH
    sh4a     |         linux-6.10.14          | NOK | https://autobuild.buildroot.org/results/ed1bc749a57290da434bb0250c53b10857855ff4 | ORPH
   sh4aeb    |        popperjs-1.16.0         | NOK | https://autobuild.buildroot.org/results/d518669a43fc593f466236e2551129a04d835c89 |     
   s390x     |      python-daemon-3.0.1       | NOK | https://autobuild.buildroot.org/results/4f9b5b0a1b3b4de1890f6b45a8fb60c5159dc2ce |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
