Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15CFD60CEF
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 04:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAAAB42FC8;
	Tue, 19 Nov 2024 04:18:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dudy0qisJGlH; Tue, 19 Nov 2024 04:18:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7300942F59
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7300942F59;
	Tue, 19 Nov 2024 04:18:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ADCD27EB
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 04:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70CCD42F59
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 04:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lN_rj43tI0n9 for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 04:18:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1ADB342FC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ADB342FC8
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1ADB342FC8
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 04:18:19 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5cfc19065ffso515440a12.3
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 20:18:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731989898; x=1732594698;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J/8YWxNIabewS1QQiU2eiARuUt7sGinNgZiH7ej+uQQ=;
 b=WUghZPvmtJ+KaVu5odPRtnHW+p6oTDS2s9llTgLB1/ezlOdbXc0mx3aCqd7glzsdyf
 47+p4U31pv7HWMT1YFKM9nfS2b6E381a3PifTRRC78Q66bYwFZ2dnsWVqQf8ZsDjlGLO
 xR3ZKNmCv1H9B31zUN5GYIn6ybXGMSFJUS6L1JAEiKFFOQ+mZ3XaB3rIJ+1zKuuyJ8qJ
 6qnF0gvwpPMJZCfYr65jGmqsSWX0VgfsMr+7ZWYOphy2Iyx8yTKsFkzcwsSNu44AZh6N
 EwQhSpFkw8YC4v+PBGX1sLjFKTa0mxJgpvMGoLHaLqFLE+6kLzNN+L4lINw363eJVB7A
 f27Q==
X-Gm-Message-State: AOJu0YwUXMG4Kl9TK5xnBZKNtOgb7QGGYj/I/2K0JhBnZtkA6yclAMW1
 uAhailhE3IaeVIdsMTvDO0xz2Uh5xDrlN3cRTJ7+o4xALn+j7Y3wbGPSpQ==
X-Google-Smtp-Source: AGHT+IGjIIOzYRfOMlCdTU3pkZQLkTdBbVGBngrl6Eti27Ro3YL1+Gbaowq5IYyB2kpTasJSMVXiog==
X-Received: by 2002:a05:6402:51c9:b0:5cf:c321:d169 with SMTP id
 4fb4d7f45d1cf-5cfc321d25dmr5581442a12.11.1731989897549; 
 Mon, 18 Nov 2024 20:18:17 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf79c1de36sm5106899a12.84.2024.11.18.20.18.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 20:18:17 -0800 (PST)
Message-ID: <673c1189.050a0220.f720b.530a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 19 Nov 2024 04:18:17 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731989898; x=1732594698; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=J/8YWxNIabewS1QQiU2eiARuUt7sGinNgZiH7ej+uQQ=;
 b=e4kcy9Mth+WEAuMwSJ/Rlf+4B4zSKVTBHr3nypH0c65ywQ5R9N5ZAIxi4Ckn0jYuxB
 OP99/AwrR53Dcy4XJFiXhPElR3oGQW0Sw51kjWPd60PppeHnkMQQV+8T/r4akEmYFqto
 9kXAHXFinqRJuEcKrp+T2NF3CgRGPmdel4ilTHnQ9Vwx0OI1sZRzYsbhsCmFYHfa1JGV
 /tmD3J3BdW4bqOoe4bAcPe1SKI82CBnvxbOxKwE9uDw7cLWuVnAWhqwvEWWfrWVg9LCC
 Y5kuWNFg/MOnsTTEFXbK2GsaSDNVX4yI5Ln6RrQH0NMfUkSIKjlp01CJaYZHqc12WO0s
 H0Yw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=e4kcy9Mt
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-18
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

Autobuild statistics for 2024-11-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  0  |  2  |  0  |  2  |
    master   |  8  | 247 |  7  | 262 |
     next    |  0  |  1  |  0  |  1  |

Classification of failures by reason for master
-----------------------------------------------

                  linux-6.11.7 | 18
             dahdi-linux-3.3.0 | 17
 ibm-sw-tpm2-rev183-2024-03-27 | 12
                lmbench-3.0-a9 | 12
             util-linux-2.40.2 | 11
              host-rust-1.82.0 | 9 
         gobject-introspection | 7 
    host-python-greenlet-3.1.1 | 7 
                  bcusdk-0.0.5 | 6 
                  ffmpeg-6.1.2 | 6 
  gobject-introspection-1.76.1 | 6 
              libopenssl-3.4.0 | 5 
               pulseaudio-17.0 | 5 
          cryptodev-linux-1.13 | 4 
            host-binutils-2.42 | 4 
                 libv4l-1.28.1 | 4 
          linux-5.10.162-cip24 | 4 
               mariadb-10.11.6 | 4 
               procps-ng-4.0.4 | 4 
                   grpc-1.51.1 | 3 
             gstreamer1-1.22.9 | 3 
         host-libxcrypt-4.4.36 | 3 
                  libva-2.22.0 | 3 
               linux-pam-1.6.1 | 3 
                   linux-tools | 3 
                  ntp-4.2.8p18 | 3 
                 openssh-9.9p1 | 3 
                 coreutils-9.5 | 2 
                  curlpp-0.8.1 | 2 
                   cvs-1.12.13 | 2 
                latencytop-0.5 | 2 
                   libnl-3.9.0 | 2 
                libxml2-2.13.4 | 2 
     linux-5.10.162-cip24-rt10 | 2 
              mosquitto-2.0.20 | 2 
                    mpir-3.0.0 | 2 
            netstat-nat-1.4.10 | 2 
          obsidian-cursors-1.0 | 2 
                   perl-5.40.0 | 2 
                ramspeed-2.6.0 | 2 
                       unknown | 2 
                     ace-7.1.1 | 1 
                acpitool-0.5.1 | 1 
                 agentpp-4.6.1 | 1 
                    bat-0.24.0 | 1 
             batman-adv-2024.2 | 1 
             berkeleydb-5.3.28 | 1 
                   bird-2.15.1 | 1 
                  boinc-7.20.2 | 1 
               bpftrace-0.19.1 | 1 
                    brltty-6.6 | 1 
                  brotli-1.1.0 | 1 
                 c-icap-0.5.10 | 1 
                cairomm-1.16.2 | 1 
                   crun-1.18.2 | 1 
                cryptopp-8.9.0 | 1 
                    dpdk-24.07 | 1 
               ebtables-2.0.11 | 1 
                elfutils-0.189 | 1 
                    fcft-3.1.8 | 1 
                      fio-3.34 | 1 
                   foot-1.16.2 | 1 
               freeipmi-1.6.14 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
                      gdb-14.2 | 1 
            gettext-gnu-0.22.4 | 1 
                  giblib-1.2.4 | 1 
        gmrender-resurrect-0.1 | 1 
               graphene-1.10.8 | 1 
                 hddtemp-0.4.3 | 1 
host-binutils-bare-metal-2.... | 1 
           host-doxygen-1.8.18 | 1 
host-heimdal-f4faaeaba371ff... | 1 
 host-softether-4.30-9700-beta | 1 
          imagemagick-7.1.1-31 | 1 
                  jack2-1.9.22 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
               libcap-ng-0.8.5 | 1 
                libdrm-2.4.123 | 1 
                libesmtp-1.1.0 | 1 
               libglib2-2.76.1 | 1 
                  libnss-3.106 | 1 
                  libsepol-3.7 | 1 
               libunwind-1.8.1 | 1 
                memtest86-6.20 | 1 
                  nginx-1.26.2 | 1 
           oath-toolkit-2.6.12 | 1 
                 pixman-0.42.2 | 1 
      python-autocommand-2.2.2 | 1 
           python-numpy-1.25.0 | 1 
rtl8188eu-f42fc9c45d2086c41... | 1 
                   sdl2-2.30.9 | 1 
             strongswan-5.9.14 | 1 
        util-linux-libs-2.40.2 | 1 
               valgrind-3.23.0 | 1 
        wireless_tools-30.pre9 | 1 
               zxing-cpp-2.2.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/dcb4e042b70837d5b958b93418dc5a262d87f86a | ORPH
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/2503d199dddbc5ebeb1ca04b561b4b417dfdef39 | ORPH
   mipsel    |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/c94ca542a99aa1838e7c3ba8266c88100e201d21 |     
  powerpc    |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/8464cb1ba6dffec72dcc56394ee2cde8aca06bfc |     
   mips64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/82804cecf3dc99e10404640a061b3ff0e6d2803e |     
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/5c78c935bef5d2e5d98346f80176591052181df9 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/be6872625acaf7e568789a2d181b366409e79190 |     
    mips     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/78dbaef31932e68b99bb79c297ed31c2b70a002e |     
    m68k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/4c6a376b65ad6050fd8424d6854fbc9de02a9980 |     
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/8acbbc383eed56e4fa46f9dadf3b3114bbd2920b |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/2e8f65c3c4d67fc036ad52edf65adf2b90121a9b |     
    sh4a     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/54e9f989f14c0d266f8adbe363b59e6c3307e46e | ORPH
   mips64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/cb4b1429b98108c5f475d0b98621ae93b9894ea0 |     
    sh4      |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/07faa57c9afcaf89eeb3f3cb10dd7c6eee45df80 |     
  aarch64    |        bpftrace-0.19.1         | NOK | https://autobuild.buildroot.org/results/e4f95a5f30a605eadb81802075ea6bb1e2880684 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/3a061b6339a2017c0cb1eeaae5c6ee03e641c7a7 |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/d86c10448c6377f7a374680856a014c969eed60f |     
   s390x     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/8f4b7f5a2610baefdda325531c5a75df05ad5682 | ORPH
   s390x     |         cairomm-1.16.2         | NOK | https://autobuild.buildroot.org/results/78fbf6488df7c245edde40d51829625ec94a2aa7 |     
  powerpc    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/2db2ebdc16e0edf84d04d0b2faa8d1e77aea9197 | ORPH
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/8e1108786d6d31ccd056a9e44744a31871c6d0d0 | ORPH
 microblaze  |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/8ceac840a1cb0a55b04f1a7c012c14dd803cb378 |     
    m68k     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/4d5171c24efb397f449658bb964cb0448fa0dc5f | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/e67b067fb40152c30618051435f6fc0568fb8704 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/b669012f8c58ba4ccd1cdd9774f0c2ee6c3cf243 | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/0e24f86a5a9fcdb6df5325512be102fb4162d438 | ORPH
    arc      |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/42b643f8de65b14f3e6d3df97f00be823b42777d |     
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/14caf7023ef2bab2ce12bcbefd0c86fa2a03b23c |     
    i686     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/f35b87794ad9360c27005e3ca4a70781fa9d728a |     
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/120739129982d601794724b0f558d17672d93f3a | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2e9f62a212ae5f3fb97efa5c939216e22a38e8fc | ORPH
   sh4eb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1b18ffbf3c2146dd940e50bed83cbc2c098260b6 |     
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9f9a645db577ce5f47e4235ec97921883349802f |     
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/51b34c0d12b9b22ad23bab8db92ec1a6f1009812 |     
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0a3db5d0998d819160cc8d22f9a3468b72eae68f |     
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e35de612a7ae50226d5da53e9bc0c6092b9126bc |     
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e49cff1fa9f2fdcdf5666bef3439009046d83082 |     
    sh4      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7fd7681131aeb0d76951a6c449d70f5cbf6fc231 |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/bbb44a86004102c69f83139c9108c834eaedea16 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a295bb254eabd3b355c23a142aa5c2b4dadf6cd8 |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1ad35fb6eba829af5cfda4e803621fae843e33c4 |     
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/741d98fda658e835659d21344ca8450666258868 |     
  riscv32    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7ce91656fbd90575b9baa89688685be80d92835b |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/828c3d88b1a4c8b5b22b49e55526324c15c9346f |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7d8895d9e0ee08fe9acadd14edac4db189d9d5a1 |     
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/24af88595eb69c4cba3e190726e257d4797f6b05 |     
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3b61f4b38c7ad01305bcfa3dc456c2650a1dd8bb |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/64fba7b3569151b6d20de0c871a48e44db365a06 |     
  aarch64    |           dpdk-24.07           | NOK | https://autobuild.buildroot.org/results/3a22b4b8771d8cb088c503db82c171efb7310669 |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/629f4faa084ad9d3271d1617550777d668157deb |     
   arceb     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/beb70dd3cdb791adbd6a69707a372abf57855409 | ORPH
 aarch64_be  |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/039733976fed6986ccf9d8502578c6ab5998632b |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/a8ddea7d00f8ebb1ec6ba4c7ae8799cac8a84990 |     
   armeb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/a448fce7c70975129f07463ca9bceaf17bde811f |     
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/731f0634c90dede6cb1ad72f09b7213bce91e1ba |     
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/ed804c6008d33ce6b5313919f7bf7cd80eb608e7 |     
   mipsel    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/869984c9ea73780223cf664efc8abab544d3c1f1 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/4f1dbf867ae9f2edf1572e8419b90255d72059ec |     
   mips64    |            fio-3.34            | NOK | https://autobuild.buildroot.org/results/d0eff2c9543df87fb1b1b335ea7068a766574ae1 |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/ad21a59d208f2d21f0ccf576a03245265b78b2c2 |     
   sh4eb     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/5b0a57343462efbf096771e946e00a7698530b21 |     
   nios2     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/5ecabd514331f89dd394f75c44950df491bb248a |     
    i686     |            gdb-14.2            | NOK | https://autobuild.buildroot.org/results/58069dafd346e16fad868154a444a55ddf306f8d | ORPH
    arc      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/2ba85e0f292ffc9d77aae148024dcdf4a154fdb5 | ORPH
   nios2     |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/e8bfbe214070dde347e566fd58b39a1e5243eb9c |     
  riscv32    |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/c41b5f9ab6825cfef07db8a37bbec438dc9b930d |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/5d5c04f5a2a3e8d8c9274bdddb50abb07d5f43fc |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/9ab3d17ae465d6e24c38fe8897ad6416616db0ab |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/e1bb1e48975b2c95148a578c4544005c44fea271 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/d8d9df4a7b1b837527b64a938df160317255a65c |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/c5f11e08a7ac0efed61d8172829a8b9ad6b9b8c6 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/39b033af76112a25bfd89ccefe59e6755f97c6d4 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/4d76b7c65202b68aff9e3a6d052846882d3d475c |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/e2f5792e7915cbcce5371c996d64b66d858d56b1 | ORPH
    sh4      |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/23e36c0ee8878dc2c90da9b12185492eb13c0555 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4f4f887bcef367880cd05451e1ec639665a608cb | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/9656386d102e9f08cd9ddf65406c4d74e3162759 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/f83eb0c9a20fa8eda3de2d7a0e6c403bcac2e215 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/c823ee23e7e8c84f44ebcc03c623a80efbf28fe7 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/402035c994c450fd279640756b373ffca5386a3f |     
 aarch64_be  |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/f26a3172d39efe59b69882ec7bb6fab6c2fbb86c |     
  sparc64    |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/4b5cb8323818c1907cca68ec4bbebd104a8af89d |     
powerpc64le  |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/738535ec2ac92d1bbcf9047ecf85abe7eb3b8553 |     
    i686     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/7b468c7c44275da0774f83005ea0775c61f3198b | ORPH
    i486     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/53e1d196cbaa86e5648ca7086ef8707c3d0aaf2f | ORPH
 powerpc64   |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/abfb2dc178403ff6c594e3d8a376cfc369e4fa38 | ORPH
   xtensa    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/353cf55bbe8c8ba37dac7c97d9cc79fa93bd431a |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/35012da5b30fb2a36c03b401822b2701c22e984e |     
   sh4eb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/42849ab4a3fad62a12467f05ab3ad12b5d6c5095 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/cdff3967038c5c17e72479446993c2bebe16bf76 |     
    sh4      |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/d20ba479b299dfa4f49f42d7bceea391a7332e13 |     
  riscv64    | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/14ccbaa29ccf264892c9d7d820b4fdc449e6b63e |     
 powerpc64   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/489c15b4b853886b5b656e1d6d7785b7f9157736 | ORPH
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/af035fa02a543ed9f15cb14846418c1c29517a86 | ORPH
   armeb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/296bae4c193ddce4692571070ad069563ee7f281 |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/25ce7e9cbb09282331fe738e866e1d033312c270 |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/20b6997c4db8e960b2e68dd579bbc6d7db546e90 |     
  powerpc    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/c668dd6c706ece78664fb3f36ec059032d892ed8 |     
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/ceaff4bd4b4332fc8b49ea0d523c0cf9d7d5fe3d |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/ad05b756c0b6d01c654933ce279ec8d97570c8ed |     
   nios2     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/60763973eb6a7f205c9544c970346e8e5f6d98bf |     
  riscv32    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/d6d5617b19ce6a36c66212c3562f5c04031dc89d |     
   nios2     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/29fbdd9eafa0b085c150f050afdade8f8f35f1b5 |     
    arm      |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0a1e977724e5aa31f83789bf13b2daf9790b54e9 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/20abb5c91cce0898a81128c29826124274db20eb |     
    i686     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/e9219ba27ece950df6451520a05441f9d99ddbd4 |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/c147cc63420547cfe06b1d7de921fe824bfe6573 |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/258d11f5c8231ad30c572559ecb09fdda0ef97ce |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/f3a1674dd7f3cf6b498ffe85014c6200cef371c7 |     
    i686     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/db91698ac74f8457cde06b3478a31ee7400d048e |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/52b949ed8b75829f8a21b1fb5e79e887abc077ff |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/0abaa5dfbf7fb0ad0a7e7c8328d832bb6eed0ca3 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/84c72d591f0e24483fb12245ffe12556410cc1c1 |     
   x86_64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/7816f1346b11777e40945e5c1315501443a02d4e | ORPH
    arc      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/ab26aff71e836a518b14ccb81fb26da81d6cf959 |     
   nios2     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/f1cc46db4b1a62e13518563b30581c9e6c37c18c |     
 powerpc64   | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/89eab242bb0966c5ad003b49ac0b410f386caea7 |     
   mips64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/1a698d60b0502e861c55b79e48994ba4e76934ae |     
    sh4a     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/736edf6030cb085deeb88d16b0ff288b7b9ca350 |     
microblazeel | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/c9f3813f9df3226aa9dde43b100244226eba5cb8 |     
 microblaze  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/95f49fc53a03d1a68c57966accad769c55eb8590 |     
  mips64el   | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/2b4adb24978355e9104463ce9362486023415060 |     
  riscv32    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/9b36d6e5cf791c8d5d7ce3066f7dffd0e0efd2a0 |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/b6811ccb50267fec6d86fe7cffe25629d3199932 |     
    or1k     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/c9d9b36ea2878dc45025b6ad3eafe95180d7b79d |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/917758708c8ae90ada99f9df7c317f60afc7fc5f |     
powerpc64le  |      imagemagick-7.1.1-31      | NOK | https://autobuild.buildroot.org/results/0c7bfad1d6084050c9b71f852fda328e8133a3e0 | ORPH
 microblaze  |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/347da3ac6e2a985871661d03ff48b68a081a7f76 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/70346a152b7fbb6b716a2db97a3c030cacb25d4b |     
  riscv64    | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/77b44da11a4b0e1da0ca9552c78ee71362193e47 | ORPH
 powerpc64   |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/5f0e4265c8c978d6f94ccd1343b829e5586f3574 | ORPH
   mips64    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/f6f0354ebe7aa4a32a5fe2ed8ef0ea30ac5e8f71 | ORPH
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/53868498c5d73dd5bbcf9bfc2214789dbec240ff |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/5480bcab3b56dc8a22114cc9043b7031f76d066c |     
   s390x     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/573d8d7d9b023fbb5cb57099a845bc248ef6c7c5 | ORPH
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/23a43e0edc7398856d88e92f80075727d644954a |     
powerpc64le  |          libnl-3.9.0           | NOK | https://autobuild.buildroot.org/results/6b0be009d9ad33f06f030c2ba958af82cfb7b00a | ORPH
powerpc64le  |          libnl-3.9.0           | NOK | https://autobuild.buildroot.org/results/871138045aae12c5d74aae919ef0372214db4931 | ORPH
   s390x     |          libnss-3.106          | NOK | https://autobuild.buildroot.org/results/ec1178f46d5c02850f5587a24244f5e51acffe66 |     
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/83ee33e576c41ae8d32acfeff4dd149b302c5a43 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/de1c7b96fa602e056065b866571bf9d9fa2507d3 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/18b926e0e31b0c60989e5871cf64e0b1514ae8b1 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/703a5ee4a605fa99feb6cc2d3e6b6feaceeaa09f | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/61f35ccc95fb5614aad9e0280e8ee1f7f02496f0 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/771e058c0e7d0a7216f9d4a11b28ce6ae0d4ed57 |     
    m68k     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/b0c603ea0cfac1d79f3e4594502a9a273458646b | ORPH
   nios2     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/f69f21e9516b315d0f6105aa813624b0c97b61db |     
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/d69f4953426e41d6ff08ef3670725ca982908107 |     
   nios2     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/b1ac3595bb80bc227304f13d4174b9b244559dac |     
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/1f895d07231f7ffc7b83b04fa27c634d91acd19e |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/383341c26ce6471879a86487ca5962b4fcba704a |     
    mips     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/63dc4c45ece3a9dbf69ab84ebbb9cd306b4c6cc7 |     
   mips64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/016d645fd38dc685a233ab85d5b07a7de99c5fda |     
    arc      |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/b70f7b23c6418a5b14d94be215a5034dba591d3b |     
  aarch64    |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/ebd889de01001facde89a22f21ef2a8cd86d98c5 |     
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/d121cd2608d8a07a2ad6387227a3b14420e944c6 | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/2f686fbc9a6a53196b461b5cfb8fe0b3dd2c3ec4 | ORPH
    sh4a     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/fffe20cb224e43da2667f06e4a24386577fe08a0 | ORPH
   x86_64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/745211f847a7d5c7c6af0333926be0dcac09a0fd | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/d7d82cedae57905a727cdd1adbb0dc66bac5b0e8 | ORPH
   sh4aeb    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/8153e3d2cb5d4bf25f380fc0a144343e217a7306 | ORPH
    m68k     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/1fd12076136a96f4b33c8a2808369f1653120f8c | ORPH
  mips64el   |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/819a33749c5a48e70b3990ebefe1cbc7e093c137 | ORPH
   mips64    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/6fb1c88493f14da19efb52042d9e1800d41e169c | ORPH
    sh4a     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/1a4defc1d278ce566696cf26a72d547bc645757a | ORPH
   mipsel    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/6373ee7128b48e629798acc60cadf162fcf89272 | ORPH
   x86_64    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/0d0d9647add180d01fe321440a59ebd191e5be3d | ORPH
   sh4aeb    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/8fa64292173e1063e1b96b0fc97677a2b988bb34 | ORPH
   mipsel    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/b84d00a4a1239d38a2f2868787f8e9cc4945ba0e | ORPH
   nios2     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/459087845222d77cb707fa4c0c906294889a449f | ORPH
  mips64el   |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/5556ab664eb9bf379f07f0722c29c12a947fa4bd | ORPH
   mipsel    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/3b6dcbb63c6ff50b64cc35969398999b6400273f | ORPH
  mips64el   |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/b60c8d497a1a34cca15a56b9854a157d46940bff | ORPH
    i686     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/a62ccd7aec62981fb6e1ca23d9fd91d4c961ed58 | ORPH
   nios2     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/ce46f416568ab9aabdb608c4410cae7a3f9e4f79 | ORPH
   mips64    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/6ef3ee785c0b920e2676f5962db064ce8a497a5f | ORPH
   nios2     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/bfa2e2a9e020afd651bc772b963a6f978ad1df8e | ORPH
powerpc64le  |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/a8b7d22e3cdb5fe7ce541ffd20ccb624e1aa2aed | ORPH
  powerpc    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/07845a16ed383afc12041303f5341f261e3ab852 | ORPH
    arm      |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/22042b138b958a698a0dfda57b893ca473ec504c | ORPH
    mips     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/23193777874953cb9bc430a6c35fd22920ce2426 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/bd2049b0139676958db93a5e14ab5cbf3457dd8d | ORPH
   mipsel    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/da6143df2a96e570c77ce0a6c0d96563a7c750e8 | ORPH
  sparc64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/55fe393c1fbfdd7499baf42507ed66355d28fc74 | ORPH
    arm      |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b1003aa1a689c3e2b78d9a0422acf59f13f62ad5 | ORPH
   nios2     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/18277740d3045a82cb9aff8593c8694c2d2d26f4 | ORPH
    m68k     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/6546d52a1e5d8f9ce4dd26288905d1bc4a412ff2 | ORPH
   s390x     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/56710d140a87b9f39980673d17f824d2bb7c1f23 | ORPH
    arm      |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/6efd99454e9be2017c181be509f38bc5f681f72f | ORPH
   mips64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/3e083d14da7ac0e6067e42c9288021f536b1053a | ORPH
   mips64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/332208f27fb48f0f8ae31e881c7d36262a7bdb46 | ORPH
 powerpc64   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/1f331c1f2bb5e0d5c0ad2584613f0d87d410179e | ORPH
    i686     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/cf362db207e7d06200f293adaf1f212360c74175 | ORPH
 microblaze  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/bffa3542aefae7299493c91b93687686dbad957a | ORPH
  mips64el   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/00f451b3e09c86f54ad541bf34c403fa557a6879 | ORPH
    arc      |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/cf40a780392a89358164ed4fac3542b973916968 | ORPH
  powerpc    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/56b13cd8ce1f31dcc28f62405ae813a482583e7f | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/192702e352e7f85bdea2fa35c9a2bba516c82368 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/c981728a1d80a06a0629fa681c91ed0366ef6ad2 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/d65bf17815db6069ee482713c6fdb6adeca33dc4 | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/6a15cd640831b824fdfc5bbc5aaca5d1d668f705 | ORPH
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/7fde95f4939ec9192cc33483bd88f22c9a4e2156 |     
   mipsel    |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/76cbd265d8b5d90e608b58187d5b8bd61f7b6759 |     
  mips64el   |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/b121824fa5a869e0d8067ae22e6dce40e6bce180 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/cb618a7ae498b08c3b97ce77fc9ed240873d8e03 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/6c695cd318b84344313bc609d989e260b5743408 |     
  riscv64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/a03b0a9b5db8bb28de9d323838cdacea1e28c6ca | ORPH
  sparc64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/bcfc7fead2313c20e45bf2afc6e22a517fec7298 | ORPH
  riscv32    |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/4860c802bb3ecd8196ba819accaf83c7d921d424 | ORPH
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e444f608ea715e49a1705d01a77d7ebe8bb478fa |     
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/b3783d1097622fc16df5b6c2af71c8d37d78e1f9 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/edd2df22ee5735bf5fe4f4b761286dcbce46ffe4 |     
    m68k     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/268587fde0eb63cad553023e904dda5cabff3db5 |     
    arc      |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/af096cf81865c7f5524670eba0d2a8c78ac6c721 | ORPH
  sparc64    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/5bb55637b97d6999866bef7eea3b04ea8afeecbc | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/4483b5d35a0679b3603509b162aec0db60d8fbd9 | ORPH
    mips     |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/b871d9a35d2df5a9b36579efd48096ca55567b2e | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/fc3ffc1a0eb581f935da56856d4ae73348b16fb2 | ORPH
   mips64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/712c0bce4e8729a249a8492427bd65bdd92dc995 |     
   mips64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/993c6b5a6ea2b08061feac501a0a15bb83a2c7cf |     
   armeb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/c1eec54d9bcfedcc81ff859bcef33529731aee83 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/fbd9c0bb93d7cc9e87c0f7ebd02c61c56ead5fad | ORPH
    m68k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d49ded562338f0b62007bc6215239e29fd6f6b4b | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/638e71da02ebff4f134598e0bc63f34203ddfd1d | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a7cf6e9646514f0eb95f5cb3ca16682fe4efabb8 | ORPH
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/f600e8c3c45ae1c16f324ca12d9f28fbb03ca8d1 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e1dff7f0ba521c5ab81ae7aaedfc20613fff8fe8 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/2f32e7db9748797f5f9ffd5be578fe4dfd12f686 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/bb0554c3abc736501a6f1098297fa4fd5f6527cd | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/bf8b21362e09c537f27b253abdd7c3fd74e6683d | ORPH
 aarch64_be  |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/236590352b2b1172ee50db32e3fdd02ce2486b42 |     
    mips     |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/429e41a0a87896cebfb8e092c1168d2502709213 |     
   armeb     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/ac889eeafa613b08c82d7f102c2e5f2cb0021f72 | ORPH
   s390x     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/7bbe96b13f7bc5f529be801e6d0fcd06b16fc20a | ORPH
   xtensa    | rtl8188eu-f42fc9c45d2086c41... | NOK | https://autobuild.buildroot.org/results/e445159bfb47d98a7e1aca6e95b4abc8a07f5a00 |     
   nios2     |          sdl2-2.30.9           | NOK | https://autobuild.buildroot.org/results/b7a1300ac7842c075b240ab7e5471b0e13d25209 |     
   sh4aeb    |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/79f75cedb855a623a4bcf6e4d8a5d41a32f09cde |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/9be090289cdcb512f2c6a96fe29bbfc6fb38a0cf |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/e8011b9388b6dfd198f64aa7c9e0003deb5bf1c4 |     
 aarch64_be  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d600d02b136825a074e048d9e46d9a5fcdfad213 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/c8b80ba60c8823e83e74b43b70475a88e08f434f | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b42bb7063f052c225d3de3463610b411bc84bbef | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d4fe7543679bd7557a13ecdd0fd4986786fec519 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/6005c1351fa3e87fc78258f4ca9bb25999e28df1 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/15bc00a57bd93f9033300c39a7706ee393b237de | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/7de4e58cecfb617a4573a9792d821cf2241c56a5 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/f1389666ad48dbbba7ebc41f2d4765bac9d06836 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/fa00753139af55ff836d9485677d512333585a61 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8a1c8782217c23d40df617b8e0ba8af8de6aba95 | ORPH
   arceb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/930f0af6a0d15db41cf90f3583ef64ee54822946 | ORPH
   arceb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/04fbc5b1ff931e1d8527b3dd8472d82cc1c4ce85 | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/3e39af7b26844d2da17984358424f2aad97e41cf | ORPH
powerpc64le  |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/8626be3f6f951e7ec6c36b2e676f43966610cadf |     
 aarch64_be  |        zxing-cpp-2.2.1         | NOK | https://autobuild.buildroot.org/results/ba4573a1bcc0110d4d0b45642e07009ec949d66a |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                libressl-3.8.4 | 1 
                  quagga-1.2.4 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |         libressl-3.8.4         | NOK | https://autobuild.buildroot.org/results/c1dd46c2066931d7c965109957a0aa90cb5b567d | ORPH
  sparc64    |          quagga-1.2.4          | NOK | https://autobuild.buildroot.org/results/54a165827f536be47cd45c98da3937a1e94a7c65 | ORPH


Classification of failures by reason for next
---------------------------------------------

          perl-net-ssleay-1.94 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/8c928469bebcd4423b779abb4ec9f5d27e459117 |     


Gitlab CI results for 2024-11-18
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8395055476  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8395057070  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8395057072  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/8395056426  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8395056433  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8395056569  | ORPH 
          TestPythonPyQt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8395056548  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8395055562  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/8395056613  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
