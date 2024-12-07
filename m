Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B247E77179
	for <buildroot@archiver.kernel.org>; Sat,  7 Dec 2024 04:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADBCC403EC;
	Sat,  7 Dec 2024 04:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H7jy4bbFJbu4; Sat,  7 Dec 2024 04:17:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8D30403F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8D30403F9;
	Sat,  7 Dec 2024 04:17:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 504D5ED7
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 04:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25E1F605E6
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 04:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWu5Cd39StVA for <buildroot@buildroot.org>;
 Sat,  7 Dec 2024 04:17:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5DBE4605AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DBE4605AA
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DBE4605AA
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 04:17:52 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9f1c590ecdso411873566b.1
 for <buildroot@buildroot.org>; Fri, 06 Dec 2024 20:17:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733545070; x=1734149870;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RxASLvCJR3Ka/pu6CzrioqL52N4qr3x7IOXQf1DZTXc=;
 b=o7WeLeY1nxuKWsSMjVad7o9a0cN7xxv0Tk7fgue9OycvV0lBgHhHejMTxOkwihQY+c
 TN94cIUl1U4qFaHc49PTUQ5gwE3OkU8hOjpuAoDdksCXY5mdAfziXIy5j2Eaqr0jHaQ6
 sG3RC+9FVaO51PvH4yGzqAH7rPvIVOds1AtM2vx8fpmueFqg8st84uTM683auDltGOX8
 njM3xuwWrPjHhcmR2wWUy+HWa7V2K3fhlIiIbrwNol5hioMEPM+H9VSyoAuDGEySvx5Z
 RsCQRbL8a+VaYUN4Fb34lJGk8MznxCa66KasDM5L+VopHuUZFVo1xCvwF5rhvfNJ86HJ
 v0Gg==
X-Gm-Message-State: AOJu0Yzr4U9bczbZrHyZMaVgX4eT0DEyR4NujUcjj7q2SMmoNwVcnLuz
 t2s65ZcVqGBKyERPE3oLsjZNv2LWx6Peh9Sm+KAyMgcGiHsmAlMKCEB15w==
X-Gm-Gg: ASbGncum6XKsw9dNGztyxaevJBtAktu3xMIsFAQDtpxjVaGo5P6IGA8Sp4QTuZkjfVd
 p7XLLG0HgHsPLyxbaQ7r1b75PbOhRm8ADbipYuSfLHEdEanGLbtCaqrijeUMlNREF/lglSvVQvM
 Y2Zzgot5SdI8PeYAm+gcd8p7i2cLHwInvCXAtn1brgsPZSikd7rBR1W2Msp1d1tXWgbt81dhmSd
 R/3r4vMW27cCL1IdDjjx2BYTsyihB183kI/0eIh49OVrOe4P1npHw==
X-Google-Smtp-Source: AGHT+IFV9LA4BjKP/Gntd+6B+2gPPCsjPhHBqm73OEygSeA7olBFI76bBkHugnQN5k9pYnO1vfDHwA==
X-Received: by 2002:a17:907:1dcf:b0:aa5:2706:c3f with SMTP id
 a640c23a62f3a-aa63a21b6d4mr529393866b.47.1733545069974; 
 Fri, 06 Dec 2024 20:17:49 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6260edca4sm323580166b.202.2024.12.06.20.17.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 20:17:49 -0800 (PST)
Message-ID: <6753cc6d.170a0220.128929.d1e8@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 07 Dec 2024 04:17:49 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733545070; x=1734149870; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=RxASLvCJR3Ka/pu6CzrioqL52N4qr3x7IOXQf1DZTXc=;
 b=TQfigkn6lEUvzHzoj5cbZuWSKwv1faQ5V+ee7mRRtI0faJG798HuhYoa7hIMpZvGhO
 0HqdeRtvGwM/hy4MopN8MQyrACTeOZrPgPlzMIn7tWVnzwXzWeClTQ5fCThtvhTzIfyV
 CVjBQnfpQP+tSMBb+5hQQZH4oPJeexcV1lX0WMvFOXQB7RRd+gHZOYc27m7bJaHAkMwK
 Z9hpBq6psblLhL1pXCoKGKUSDG71vFj438t2VsVPMT0ECbQGOGg0ELbaYuluAU7WDGhj
 58Z6rI7sdhWcaZXidbtRcZNXcNrSMEw/XzKeckycCDH/yWUfxpNXWDLZJTrkvgiHNzCC
 +rDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TQfigkn6
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-06
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

Autobuild statistics for 2024-12-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  1  |  0  |  2  |
  2024.08.x  |  3  |  0  |  0  |  3  |
    master   |  7  | 65  |  0  | 72  |
     next    |  1  |  2  |  0  |  3  |

Classification of failures by reason for master
-----------------------------------------------

                  gnutls-3.8.7 | 9 
             util-linux-2.40.2 | 5 
          linux-5.10.162-cip24 | 4 
           at-spi2-core-2.50.0 | 3 
    host-python-greenlet-3.1.1 | 3 
             dahdi-linux-3.3.0 | 2 
            gdk-pixbuf-2.42.12 | 2 
 ibm-sw-tpm2-rev183-2024-03-27 | 2 
               linux-pam-1.6.1 | 2 
          obsidian-cursors-1.0 | 2 
                  boinc-7.20.2 | 1 
                 c-ares-1.34.2 | 1 
                    cage-0.1.5 | 1 
                 coreutils-9.5 | 1 
                  curlpp-0.8.1 | 1 
                   cvs-1.12.13 | 1 
             docker-cli-27.3.1 | 1 
                   eza-0.18.22 | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
                   foot-1.16.2 | 1 
                  fwupd-1.9.20 | 1 
                 hddtemp-0.4.3 | 1 
            host-binutils-2.42 | 1 
         host-libxcrypt-4.4.36 | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
httping-0e26c53d5fe504eb720... | 1 
           libfreeimage-3.18.0 | 1 
           libzenoh-pico-1.0.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 linux-6.11.10 | 1 
                  ntp-4.2.8p18 | 1 
           oath-toolkit-2.6.12 | 1 
                 openssh-9.9p1 | 1 
                   pcre2-10.43 | 1 
                     pound-4.8 | 1 
               procps-ng-4.0.4 | 1 
                       unknown | 1 
               valgrind-3.23.0 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/8caeef73ea8f604eb871d48ccd13e5be089603e1 |     
 aarch64_be  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/da82303a5d56511fedd22bc4e92070eac8029d59 |     
    arm      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/e892dfe109e978efa589288d62abeaaddebfe8b1 |     
   arceb     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/308b76c488627bf53c65585380a358c41832e8e4 |     
   xtensa    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/0d73f9392942f861cdd8f09a34b3cef480d36437 | ORPH
   s390x     |           cage-0.1.5           | NOK | https://autobuild.buildroot.org/results/047c9886cbcd75da032d2cb8bc5b92f330f45961 |     
   sh4aeb    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/566a492392e625ab6d31ec3a9dfc6ea03d4aaaaf | ORPH
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/470166a6b9d7ba2ba4cf2cb30a3c27cb4f063fb1 |     
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f5b6f742fabdc3e230e59c191654b0af6784343f | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2b8695701437028a219b974c7b16aa2dc2b28be6 | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/30f0f4271f4cdb640ba856b6fecac25d29e63370 | ORPH
   s390x     |       docker-cli-27.3.1        | NOK | https://autobuild.buildroot.org/results/72a4f8defdb4a09586979ceb1c930c76721ef451 |     
   s390x     |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/f41a92c22eee077183e7b7b84f8ec15f1900643b |     
   armeb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/1f69ad788051de87e940c870329fee6d12bc89ef |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/14485b02d0dddef3c92bf92fff70e7429b760c21 | ORPH
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/1959614f6ad63878c390a23770a6778830d6c698 |     
   armeb     |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/dfca8ddc447a3f192c5c52ca9b2ded82f42586b2 |     
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/026a298845a7285f3724444cb156b96d2d0098b0 | ORPH
   sparc     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/7ea0512ec473e49f7221ae1330ae65b7e76746e7 | ORPH
 microblaze  |          gnutls-3.8.7          | NOK | https://autobuild.buildroot.org/results/df48485de0049a00bf1796614109b3c6f9d28050 | ORPH
 microblaze  |          gnutls-3.8.7          | NOK | https://autobuild.buildroot.org/results/028a6cab7581c8157a0d2cdb0b58cd923759fc8f | ORPH
    or1k     |          gnutls-3.8.7          | NOK | https://autobuild.buildroot.org/results/949a5e6077b30194c99ddf7bc3f71a6fab818027 | ORPH
    or1k     |          gnutls-3.8.7          | NOK | https://autobuild.buildroot.org/results/b6b3af3824d408a5e8c7e6fc2191d1f86211f06f | ORPH
   s390x     |          gnutls-3.8.7          | NOK | https://autobuild.buildroot.org/results/2b38ee7979af1cb34fee1011b43f5b2e690707e9 | ORPH
   s390x     |          gnutls-3.8.7          | NOK | https://autobuild.buildroot.org/results/6f6fb573050bed72d87952bccb2082a9b3bcc02b | ORPH
    m68k     |          gnutls-3.8.7          | NOK | https://autobuild.buildroot.org/results/91dc0085ee95b3a19a82c641b2a7171c57cd8f0e | ORPH
 microblaze  |          gnutls-3.8.7          | NOK | https://autobuild.buildroot.org/results/c18140d41755724449d1a129a28b9ac8a305e052 | ORPH
 powerpc64   |          gnutls-3.8.7          | NOK | https://autobuild.buildroot.org/results/93c2af22d8229ed0b67affcbe8b8ca56bcedea47 | ORPH
 powerpc64   |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/4b5d9b5955970c72cfcc90c4c416032dd33b0ea5 |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2c705b6d5fb1f781867d315b4c9e366c7c0bdbe7 |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/14e60bf2da99bcc3a9a6e278248fb85ca92948dd |     
    arm      |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/99e000701e2fba2b6f59a28e3ce780c91909b21e |     
    m68k     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/824475a4601c99c86853f890e14858e6d5a6a6b1 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/1fe4082fedaa31371fd74b84a9337f0ef5bf5a61 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/a81d5bb5fa3ec9f986fcf1e0e1fcf131b7175bf9 |     
microblazeel | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/9d00d2ae53b8218fc2bbaa809f63fbda25fc40f6 | ORPH
   x86_64    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/14f117d0534ced98aae4c80bee63242af4d7354d |     
   sparc     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/09dcf2efdf759405c2f038634628e8b0937ae580 |     
   arceb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/be6c679b821183b4385c74471e26d9ad7d3d8967 |     
 powerpc64   |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/b246c9b312a21b1ada8079a530d0bea40747e747 |     
   x86_64    |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/e8076d9612577815b3ad07f95cc4279c946687d8 |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/0e333daac27370e7f8a410f13dfe7f81f6c41c9a | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/803dca1f81ded909a3f7f4da80c3481c43e3b233 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/b9071a8e52f6d8f3b356718467b63570d6fcc89d | ORPH
    arc      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/539b131990f4eb87a0f85235ee0c80916e7615a5 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/51a5e7cb674a40ec774b51376f0d61ff79693309 | ORPH
  mips64el   |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/9290cb0592e676bbbddf4a0a1b46c1ba91c16936 | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/e2e5d1a658f55476192abda2e332f7b5ead1d967 | ORPH
    arm      |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/0715627c77ea5bce83c7ae78d2bbb5f77368dd0e | ORPH
    mips     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/99979613aba8f06e7f724e938f704d721fd1239e |     
   armeb     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/45786da92de9985cd4a95d54cabd4aa114081fef |     
    mips     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/1d0610b37b35272bde7f528846627ef48792c765 | ORPH
  mips64el   |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/747d2b655334ae712e84032620076a382f582245 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/918e61b750a6c95b3930b6751077bdf11f46d70e | ORPH
   mipsel    |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/7120fdd33be4d60314fe785b71262830c4a9bb20 | ORPH
    arc      |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/83edb6b45e1af6d534ae35baace590187a8368af | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/012e97954ebb5dda08fa0a46f83268b5543603e1 | ORPH
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/67fcc25590093e102adfe744f72d80ab6e62646b |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/14f66407cb4c7986e8d46b6f39ae02d56567542b | ORPH
  riscv32    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/75c30c3c110933c2eae982c34ac10a7950cfc825 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ba4af7e9f78118c96adc1348eb9e56b1bb3759dd | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2c1f193884d9e5da1b614635c9060aa504a69256 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/1bd81cc91d1a74409911f8abb389d78777ef61a8 | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/ac7b1394940187b064ffab605807ea27af93a7b8 | ORPH
    i686     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/74475f410ded7f7fddb702a0b3226e49774c32df | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    bat-0.24.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/ad840d70764f0dfb5c3b07fdc7e11682ebed50e3 |     


Classification of failures by reason for next
---------------------------------------------

                       unknown | 1 
             util-linux-2.40.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/193357360cfe80ec00c00c0e0c46861b98469024 |     
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/42223362bb59a46b6c74c54073f0d88bd57e45f9 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
