Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44073E77188
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 04:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 902BC8083B;
	Thu, 26 Dec 2024 04:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIZysvGkzsjI; Thu, 26 Dec 2024 04:27:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53EB080581
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53EB080581;
	Thu, 26 Dec 2024 04:27:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37736757
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 04:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A129408DA
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 04:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qu6NIn5CXzu2 for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 04:27:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 73C2F40726
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73C2F40726
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73C2F40726
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 04:27:16 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9f1c590ecdso1132083166b.1
 for <buildroot@buildroot.org>; Wed, 25 Dec 2024 20:27:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735187234; x=1735792034;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DVdI6g3+dir4ao/To5r3PNtLWcH+mGw667bWCISg1dM=;
 b=DYP8mBNqL3Ecd2hpxFVTdhOzneziwhBvETn6rWUfNB0VjAeHEAM9jkUgXROunGcJr8
 wsWZzmtwGTe1IdvBipLBXyJpz66ReXsk7T99oGK5xZizAJ+j/CRFXfbVhhzldBzm+QE9
 IcMNU395z2KB0YdUy0bKP+tDU5HcU/kXthJ5683O8pqJ7gWdrpXV0aPvtCkI3hmfefwh
 HRn0q2T5aM6LZuCwyixbx8pHix8RKqYxy84E08+xn/93B6fN7O8vc1wuS0lrQyCeKHFo
 SzhkR7GF1d9tnm/PQwN0W+1a/PvY6qfP/DO51syWWqg5tcvK2l4/WEqsSMV2Eh4phc38
 IpcA==
X-Gm-Message-State: AOJu0YxSRK02YPFUw2A5CMuqM1EOXJXrQf5BlyEaRYasHdRtXUrbsPat
 xcedCRTuSngU8wvSryRyKLEPWRGf9/sUW42UiPqrCgv/4oqmZrhef3RDjQ==
X-Gm-Gg: ASbGncvnbVBHPtQyJmKewteLa6ur3wtRCxiLzkixSgw11ebwfppy4AAj8HVY7gsGGcv
 aSvC6Rm762UFQ+XJ4N5EDQPpYS1YxJngakV5jLCHDYNXPxnSaLrGUd25ct3m9CQ6utTUFIcocWc
 ceCQcE+oBZ25BUO9NW9R2F586splRew+8ll1GVRnDSbED7LKndEKVQKF/iONHWzOlr+gwnxjFae
 wj5HVhaPeUQhFrH2dZvCTFgtBPB9up9dNY0b9Lon8uI2L0Bn0u7XEIypkR2
X-Google-Smtp-Source: AGHT+IF+yAgynUK7FbgRcjuulzLaTzk87zfJO0BMqyqXoOy9AIcmsYg+91Lsee/ho7ANlAiE2ZEs3g==
X-Received: by 2002:a17:907:d87:b0:aa6:7107:db00 with SMTP id
 a640c23a62f3a-aac33666102mr2174165966b.50.1735187233945; 
 Wed, 25 Dec 2024 20:27:13 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e895194sm889159566b.70.2024.12.25.20.27.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Dec 2024 20:27:13 -0800 (PST)
Message-ID: <676cdb21.170a0220.362d79.bb8d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 26 Dec 2024 04:27:13 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735187234; x=1735792034; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=DVdI6g3+dir4ao/To5r3PNtLWcH+mGw667bWCISg1dM=;
 b=Jyk1i4IMaon9yrAzG8tEYn0PSpc7pk9S3KhmuR6aW1Hiw+I5g+Aok0lfRlJQbrhqcK
 IPjJXM02Fu5iCF8YtGWeJk4XngCSJaFF8T/LImp8mBtWZfqfvvlB49KCd/m3juOlkVB6
 UcPPfmm1Anp4Vp5/b2NW5zp2bxC8CbRtaH666q2UBJJXCgkfGIYYq8+ISCXqGokPS5mr
 t6SNCTZb2e8BiT+8l0YhwcDdkex6ox9BpQvHdRLnW72SiZ9X8HT8JVJ24Y6b4Krp8Zsp
 HwEfS+zMVEqw0rq9Jhui3pl3XVpPIdM3CoZQhnxFPg5Gf9SdJiSenXVdtXMa/JthBTT8
 0hzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Jyk1i4IM
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-25
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

Autobuild statistics for 2024-12-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  5  |  0  |  6  |
  2024.11.x  |  3  |  3  |  0  |  6  |
    master   | 18  | 228 | 11  | 257 |

Classification of failures by reason for master
-----------------------------------------------

         gobject-introspection | 11
             batman-adv-2024.2 | 10
                  linux-6.12.5 | 10
             util-linux-2.40.2 | 9 
               postgresql-17.2 | 8 
  gobject-introspection-1.76.1 | 7 
            netstat-nat-1.4.10 | 7 
           libzenoh-pico-1.0.4 | 6 
                  ffmpeg-6.1.2 | 5 
                   foot-1.16.2 | 5 
                  libsvg-0.1.4 | 5 
               procps-ng-4.0.4 | 5 
                 c-ares-1.34.2 | 4 
    host-python-greenlet-3.1.1 | 4 
              libopenssl-3.4.0 | 4 
                  ntp-4.2.8p18 | 4 
                   perl-5.40.0 | 4 
                       unknown | 4 
                cryptopp-8.9.0 | 3 
                  curlpp-0.8.1 | 3 
                   cvs-1.12.13 | 3 
             gstreamer1-1.22.9 | 3 
                    mpir-3.0.0 | 3 
                  ramsmp-3.5.0 | 3 
               valgrind-3.23.0 | 3 
                acpitool-0.5.1 | 2 
           at-spi2-core-2.50.0 | 2 
                  bcusdk-0.0.5 | 2 
                   bird-2.15.1 | 2 
                    brltty-6.6 | 2 
cegui-00b4e1fe174da53b7ed72... | 2 
                   duma-2.5.21 | 2 
                elfutils-0.189 | 2 
                    emlog-0.70 | 2 
                 enchant-2.3.3 | 2 
               graphene-1.10.8 | 2 
host-heimdal-f4faaeaba371ff... | 2 
   host-mender-artifact-3.11.2 | 2 
              host-rust-1.82.0 | 2 
                  jack2-1.9.22 | 2 
                libdrm-2.4.124 | 2 
           libfreeimage-3.18.0 | 2 
                  liburing-2.6 | 2 
                 libv4l-1.28.1 | 2 
     linux-5.10.162-cip24-rt10 | 2 
               linux-pam-1.6.1 | 2 
                   linux-tools | 2 
               mariadb-10.11.6 | 2 
          obsidian-cursors-1.0 | 2 
                 pixman-0.42.2 | 2 
               pulseaudio-17.0 | 2 
                apr-util-1.6.3 | 1 
               arp-scan-1.10.0 | 1 
                  assimp-5.3.1 | 1 
                    azmq-1.0.3 | 1 
  binutils-arc-2023.09-release | 1 
                  brotli-1.1.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
         cloudflared-2024.12.2 | 1 
             containerd-1.7.23 | 1 
      docker-cli-buildx-0.16.1 | 1 
                 duktape-2.7.0 | 1 
                 erlang-26.0.2 | 1 
              fmlib-LSDK-21.08 | 1 
                  fwupd-1.9.20 | 1 
                 fwupd-efi-1.6 | 1 
            gettext-gnu-0.22.4 | 1 
        gmrender-resurrect-0.1 | 1 
                   grpc-1.51.1 | 1 
                 hddtemp-0.4.3 | 1 
          host-binutils-2.43.1 | 1 
host-binutils-bare-metal-2.... | 1 
          host-gcc-final-8.4.0 | 1 
         host-libxcrypt-4.4.36 | 1 
httping-0e26c53d5fe504eb720... | 1 
igt-gpu-tools-0ee4074685c1e... | 1 
          imagemagick-7.1.1-31 | 1 
                       kmod-31 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                latencytop-0.5 | 1 
             libapparmor-3.1.7 | 1 
                libesmtp-1.1.0 | 1 
                 libgee-0.20.6 | 1 
               libglib2-2.76.1 | 1 
                libglvnd-1.4.0 | 1 
                   libnl-3.9.0 | 1 
               libunwind-1.8.1 | 1 
                  libva-2.22.0 | 1 
          linux-5.10.162-cip24 | 1 
            linux-fusion-9.0.3 | 1 
              luabitop-1.0.2-1 | 1 
                 mesa3d-24.0.9 | 1 
           oath-toolkit-2.6.12 | 1 
                 opensc-0.26.0 | 1 
                 openssh-9.9p1 | 1 
                pipewire-1.2.2 | 1 
           python-numpy-1.25.0 | 1 
         python-remi-2022.7.27 | 1 
                 rtptools-1.22 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                  scrypt-1.3.2 | 1 
                   strace-6.12 | 1 
                   trinity-1.9 | 1 
                 weston-14.0.0 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/1f7c4aa9e2df7db3356addf1ccf7f9b7663ae798 | ORPH
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/6e2511473b369e2395e360d7467adb971420ecce | ORPH
 microblaze  |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/ffccb7eb9ce64cdb1d2e4f27d8f559441c845e96 |     
    arc      |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/fa772bced8ad0c0add63435cd1714d47556e23a2 |     
   arceb     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/d1903ee26bb3c0218a3f007097f867ccc456596a | ORPH
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/faa1ce913be2bedc904fdd1822df496632e8b49b |     
   arceb     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/fff66195113dbeda3046a1da7caa23af98cdb1b4 |     
    or1k     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/c153dd68a2c593353d964df4cf598f80a7757b9b |     
   s390x     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/b199600544ef068a2ce2d667d97fceb17c6c7e49 |     
  riscv64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/d591820347db7e9131b33f80977814838dd3d595 |     
 powerpc64   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/6f3768680c48e53c8e643d3edb75c01031ad6e0c |     
    or1k     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/cb57224e9e9132a844373a2b53f55db580c9168a |     
   nios2     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/6a3a6854e28dd5bc59315d12a00e6608829cc004 |     
microblazeel |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/bec2f8dd588008026ddf693df3b0f1c0061629cb |     
  sparc64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/1c0e8879c5932b554d2abfa813366004b3dc8553 |     
   sparc     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/574d325a2b9862c85b5f0484494917f5cc0baea0 |     
 aarch64_be  |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/b72dc16d110d973223676fcd8b567aaf113e49b8 |     
  riscv64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/e1645eedf818a0a2a841e3fb3be3e14c1a889178 |     
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/ad897a1c30d6f216877312e64e3763251b0225b8 |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/32af46b3f21fa3044adcfb2a96799eed456f3c51 |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/f20471f1fd916e615865880eecb612211b29d301 |     
   s390x     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/4c2d7f2551429a63435cddedbaf9b0b053055cb3 |     
 aarch64_be  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/558fcde85c0a7de11a1333570642b87792365919 |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/db18f9c14396a603bcb88b214bffbc3b9966d639 |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/1c838d9368082ca3e9f23454971e7d3eca249abc |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/98ab6453dbf4a681dfad4a067b813e762a0e8fbf |     
  aarch64    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/d798ea72babe57a1c46e6d35d9b87a051f4f677d | ORPH
   mipsel    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/938c6b5b6f617472e4631818bc17bdec71ab9355 | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/7d45d4c1615e7f3af89f085f038da8380d76dbbf | ORPH
   xtensa    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/dcc8dd01f046d0f800cf97af1675dff4621b00b0 | ORPH
 aarch64_be  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/c36df53d44c29a9b18ef695c066a1dd7df555685 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/06ac0e69f18cde9abce465fd494e20bd02c69d53 |     
powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | https://autobuild.buildroot.org/results/40e705437eadd9bd9580df0266b60cccd5d1a5dc | ORPH
  riscv64    |     cloudflared-2024.12.2      | NOK | https://autobuild.buildroot.org/results/c37daf78b80d45714f407428c140a991ac52599d |     
    arm      |       containerd-1.7.23        | NOK | https://autobuild.buildroot.org/results/05cb67dd571a0628b42321867bd3214c68d57db7 |     
   nios2     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/d24e9a5190c9a0f9b5bbadce9c92e20ea30238b7 |     
    or1k     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/bee9219ef9b3e1dbbfe39b3541a5937650362fa8 |     
   s390x     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/96cbc978f4d43602f2c355bdcec7118be4eba6d5 |     
   nios2     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/26133edfa5799b6262141cb627a7ac3c3eafd051 |     
    i686     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/0597fc753826056c9dbd85fa4bb7dc7d3dc3771e |     
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/5ab6921e71ea30f94ead02ab4040039d61eb3fb8 |     
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7b104b48190a437587881f22d9ac0e8a093bb222 | ORPH
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/445d7ddbedb84ad73bae5ebfc8e13ea743d7b7bd | ORPH
   nios2     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a56b086e772787c7db956af8cfd10af620ed7924 | ORPH
   s390x     |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/54d76d4f0d24dfaa7ae50730bb23e83c87de3ed8 | ORPH
powerpc64le  |         duktape-2.7.0          | NOK | https://autobuild.buildroot.org/results/b0b6679a068b14e3d70031cbcff2fcb78ceaecfa |     
powerpc64le  |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/7f9d53400a3b74bf3f779bfd8dab520fee27d3f2 | ORPH
powerpc64le  |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/13b09824b209bb82384b888e0f26c30c5d70330b | ORPH
   x86_64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/61c78e6c0d5572db9f5d4b3ebeda0b3db074b617 | ORPH
   arceb     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/5dc965478134461c88b5e14a066d8f91a7caa290 | ORPH
   x86_64    |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/e4b5ca1644da72692bc2b268b05a5a0a4455fda4 |     
powerpc64le  |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/b1cc3dd057db5a9917decbb370304a8a6b097daf |     
  mips64el   |         enchant-2.3.3          | NOK | https://autobuild.buildroot.org/results/f7f1623602739b117b1b1a2296568fe9f2618458 |     
powerpc64le  |         enchant-2.3.3          | NOK | https://autobuild.buildroot.org/results/7ff61636c0756bf9e5912e41bbf80cc7a9add783 |     
   mipsel    |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/43977be6da02efbbe7c94f39cc7228996252a818 |     
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/6b4db7fe13994c44f9892df7dd975f2cbe1dbf45 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/7b04ee842afcc41038ccf75bfab5c4509aba7f0e |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/580985e61a3cbf8ef0cb344239da971b7df32c63 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/daa5025a1759c4dd3671fc81432c194a6a16a760 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f3bc58568160121cb202701c1f9d3018ffc03629 |     
  aarch64    |        fmlib-LSDK-21.08        | NOK | https://autobuild.buildroot.org/results/87810062e32dad7eadf59e0d14634f4daa83d951 | ORPH
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/b51cd88ada7ecaa95bd5fc60d5382417a388b7c4 |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/2d2b129d60737f2faf1543fa802e398ca641f3c8 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/b957abbfb7dfb5ec3a7cf32d278f0622ae5e1e80 |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/661a1d0b477936a066889c069c5d2c2aff8575d6 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/e78e3b00631ca7a3f5eff66a72cf5984b3e9e55f |     
    mips     |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/85692fafcb8fe54a28f670c47ba4491301f26b25 |     
    i686     |         fwupd-efi-1.6          | NOK | https://autobuild.buildroot.org/results/945752c2a974a3e920f5437ae49ef03f41405ed8 |     
    arc      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/92c45802dff2084bcb77001686da4119718f42fd | ORPH
 powerpc64   |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/8b53b689b65f5b63667977e60e886cf2962e6d56 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/c4dbea3166e6e29f6aba6c2b2465402227ec38d9 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/d3f8c231292b7825a67322f44ed78688f5598694 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/8101d9115fc395095c366acc25b02932a3ced7a3 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/d07b4c853a8bef0d5609c8cad7d8aeb946de740c |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/6f9e3957df1d24a932857b2fe7a3b10a20d4ff18 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/1c83209ae246f89310ba7a6bea82f4464e8d56cb |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/589d6749ce406c2747abc7d8c675a149e7588735 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/514e0f068b6e18b085be855ec54a6b41cf61a0e5 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/9b070eb8c1770a3010c5aaaad1da3de040219ee3 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/e5712456bd71e27ee8e0306cf0e8cc4ec603feaf |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/8dbcb7e952a0863f8fba30d464278f4966130502 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/e3e059f30477ad17a7dd95fb10c4a600c081b73d | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/352c427966701ba7f15263b7829182ea7babe6f4 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/3ac935826c044ab06fb3a0c867b662ba7ac94757 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/bcae794d244a796b89cb652bce98f79a13c6f26c | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/c5f533ba2fc70633ffdef3d75b1cb017163aef77 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/3b8e003f5030dbe800268ace4f59bbf654797ecd | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/a14d3a059e5cce5117634238d1e80c9991a40be2 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/4d4cf099edd05a82e3a535ed37f878905e72c9a9 |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/a68b25e7cff016fb22928bb5c8d3f5a84be4b349 |     
  sparc64    |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/afde7ed5294ce66fb431d5dd3f600e74dafcc685 |     
   s390x     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/8f0c08fc3a885269e2d9723c10294b1dadf5a8c6 | ORPH
   mipsel    |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/8a9b51e29c5aaa662c02391035878074f77fa34f | ORPH
powerpc64le  |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/58a2a296a30cec613d6ba0c5076e93741fa87600 | ORPH
   s390x     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/5b72badb5f08ecb8cf75dc62c204b8ccc7f8de96 |     
    sh4a     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5007735e700918c8cb5712f05337e48def53bb59 |     
 microblaze  | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/b290611295f7c33296f59ac9761833ccae6bc9c0 |     
  powerpc    |      host-gcc-final-8.4.0      | NOK | https://autobuild.buildroot.org/results/fe59561892463e73ca7bd4343394cec47fefca5e |     
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/9aa07d741579033f33c098d806767ed0fbd53da3 | ORPH
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/843057fa3d524325c8ac54fb9102bc919ba4eb1c | ORPH
microblazeel |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/fad1861fd5dc15a260a330559589cc055423223b |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/debcf895120bd8ff78691dc9f7a0d94c56edabb7 |     
  riscv64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/8d0c88a5af0c90d2b98c5901e2554548a91a4d8f |     
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/ad0c31789dbc091c6d905196b6f73e501acea112 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/64427e415702c4a98b016fd9454a9989719aa57e |     
   xtensa    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/58eb116b2c0e611e5dee8bf2bcd8c2e7e5a20865 |     
    or1k     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/8b64013b51ffc1b6fb813a2f2c880af62fa20b4a |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/6630666a8edbc714759a60ccacfa07796858b476 |     
    i686     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/1ce8c3a853e90b8cb2ee51c0c944d7da388b932a |     
   armeb     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/d90e51b9617ce0c913ec5d33651c32fea5c7b0c0 |     
powerpc64le  | igt-gpu-tools-0ee4074685c1e... | NOK | https://autobuild.buildroot.org/results/3c2ebe009a7faf33ee2923f9d0ab5c3ff3941d37 |     
    arc      |      imagemagick-7.1.1-31      | NOK | https://autobuild.buildroot.org/results/c536cf218dc3ac7d8b4c341f8313bc5806b94320 | ORPH
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/ddfa0148a9cb4fb99afd723b1832bf07cd79a0c9 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/6d7b9ab3b884e43913e7f5865e95c60fcfc8b683 |     
 microblaze  |            kmod-31             | NOK | https://autobuild.buildroot.org/results/2129da21febe98f2a6f04bdedd71269d6bad6d96 |     
   x86_64    | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/a38325a4f89c666759601ef0e67753f4f794d74d | ORPH
 aarch64_be  |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/d4aa87c5ec67a6a6dc184c14d7fa647e55045614 | ORPH
  aarch64    |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/98d99d1e7ea6f62576bbbb29b5c1d90440ecc823 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/d5632ff2aed5b2c3a38b606df0cca2b148658d7b |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/1de52faa76c60eb36a1a0c1ce905a27ee4ea4d59 |     
  mips64el   |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/3f4d248231c6e90f725b5db89524197b6d7e5dc7 | ORPH
    or1k     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/ca3263b0898e91946e6ee34af474a3c91668d344 |     
   armeb     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/682a07b5646192f3db9d515bf73dc986e616e544 |     
   mips64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/5c7edf74d7261b29f49f6df1d85c1223a442aabe |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/d758468a89d6e6017a3b0d9debb3a2972af54763 |     
    mips     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/cf8474a442ea0fb96c4d01486b2cd10089edeb52 | ORPH
powerpc64le  |          libnl-3.9.0           | NOK | https://autobuild.buildroot.org/results/925079ff5e355c54c975e8239a3b67a074af4a9d | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/a675b4e005cd2df3b4e36335481a724386ce8ac0 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/197c69d24cb9d61c7d6301eb80320edc1ec2d038 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/e241220cd387b172c11a9995d7b939626d363620 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/b004b7555c9ce4ccff1cec4871350b536565fad1 | ORPH
  powerpc    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/e4c2808ba3eb08cf25d2e53c912b40c4e71ba1d5 |     
 powerpc64   |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/49f73dd2e2c1e7a9eee61a02bedc56a534130c52 |     
   armeb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/5e5e2f48538516b7f808bd29e5f4f040a193960b |     
    arc      |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/09dc3a2d16623c1ad0b07c23ea66e7f5960e7407 |     
   nios2     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/7ce2ceb713785dc9e6f52d230d6e3c64becf26e0 |     
  mips64el   |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/2ca708df65f0b3823ef6e0cd1c7803211ce4c776 | ORPH
  mips64el   |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/036de5f1440070b0a7420b8c2f9aa78d175634e7 |     
   arceb     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/dab4e052a2dfc37a88ff350afd5a40d63cc99007 |     
   nios2     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/441e1e2081131aaeacfdd327799c848dcc082203 |     
 microblaze  |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/a70570f6d6435e2815a67d0b3dd3cd414ed04e6c |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/163360130ff2f7b18e4f98a39a22465c57da2a9e |     
   mipsel    |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/8572381ffe0ffe87b29547fee3fce5f9746b0289 |     
   s390x     |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/0d9995cd03bfa8bcbc396ce04a581c778d815702 |     
   mipsel    |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/96adf5654ae5cb9fd0bbd4707f8e4617252a4eee |     
  mips64el   |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/6683c4cdb9f2f709ddb0fe729f058191d8bffb3f |     
   mips64    |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/94909c903ac7c5a0607f838f9dae950a8208f9c0 |     
  powerpc    |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/0bea0634a6e5814c15fc9519086cfaa16cd2b724 |     
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/48b726ae64706008fdd908a52a3b8eb44bd329cf | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/cf88838272bb6c2c389719babab2f4675eabb750 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/a85333883484cbea56b6f90527bbbd9ba8b31fd0 | ORPH
   mips64    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/d8fb9073fcdc84abf62033687b92057d206557e7 | ORPH
  powerpc    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/72bff552570ea9915d80531dc5d80ae5b2f34130 | ORPH
    mips     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/0ec90cb69f2bc9d525276c1287e262713c415995 | ORPH
   nios2     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/578035fe3306002dd43668d86717a3ced7adc133 | ORPH
   nios2     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/3d4763a6db6ddfa117f069ff658311833621f43a | ORPH
   mips64    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/420db6295a4978b0232bee312f27e69e1d52aaf9 | ORPH
    sh4a     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/7812842208dc630076cb8af10d3b1434f8cda93f | ORPH
  mips64el   |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/881ab095e64b4a256d8575eb5739bc8e4e3f1205 | ORPH
  powerpc    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/44172edd160a81cbb4f6966f788c1eb308fb9130 | ORPH
  powerpc    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/1328076c76d12d1185cbe55602f41981fa87cef6 | ORPH
    or1k     |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/e214f35a4f4a0ecb3c1122720a3e3320afb8dd1a | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/8248d300324167edfe051cb6dffe77130ac1af36 | ORPH
  mips64el   |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/1b3fa6300200582c5c21a282206a7727ab074fb1 | ORPH
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/74e4f4ce89871ddca547ea7328dba4fab50f71d3 | ORPH
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/86d538fa1e3f149c03be88e8f69c8b09ed4fc31c | ORPH
  riscv32    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/2c0cf009feac8abb673c103bfeeb221afbb2465a |     
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/6ec95351a78009c7c77d313b40bfe84cd2d7e18f | ORPH
   nios2     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/a935a10ce74fa431a167f28977b287ef70bc2942 | ORPH
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/7680dcf5a8a13c8d01afc60435a5930cf9ae2d79 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/681629bfaedb6dd339b0674a3652b218acd17c5a |     
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b526ca4c5fdd499bb8db7c93f4da3b5432acd4e5 |     
  aarch64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a2ed9298c200d1577a86bcfcd5518e320ff10bb0 |     
    or1k     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/3202926118f9539318345f88d6026b47a3c6c135 | ORPH
    sh4a     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/646e2087efd1e0f454e3274b6022f71ebfe35752 | ORPH
   sparc     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/60c1440a3387c18b6ab265a59d3708cf64c9df59 | ORPH
   mipsel    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/2460838e9e33245b5fccd061e0fc734d7dc55bd2 | ORPH
microblazeel |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/7afd4b67fab09985b66d29d768e4a079355f2407 | ORPH
    i686     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/4eef8f5b6a05603c93510dab0d0b21f7f3511f8e | ORPH
  sparc64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/423d7d629c64dff892d57c5dd3bc62473ac0ccf9 | ORPH
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/0d845245a7ab84c78cf31c6a890083ecfc8a2aac |     
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e8e99067f5a6d0979610b74ba4a4c81c47c7ae63 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5502bf67edd3edfa54f934dc3c6af3c977d8ee6b |     
   sh4eb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f27a2115dd229ecd520a057f5bba49285e4b72e6 |     
  mips64el   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/9530b8b036ca44b26ec40f18bddd428a5ca95704 |     
 powerpc64   |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/ff69922ec9340b35e9609ac8747f804c2ae1fcde | ORPH
 powerpc64   |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/6b6f60d4ef76d8305c84364c6ff33a0c526a5d4b | ORPH
   s390x     |         opensc-0.26.0          | NOK | https://autobuild.buildroot.org/results/404dd743830872992dacd23495c692ca2a6bb456 | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/1bdafd2700d1b1ebe47d637786bfd4fcf4045a7e | ORPH
   x86_64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/6ec6d51c1cd2b3bc76edc49e306e719ea9ca154f |     
   mipsel    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/eb1eb3ceb4f00f5375fddda33bd915a10dd918ea |     
  aarch64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/f41c5f80a067d3e46c3eeee99f1b26336419539b |     
    mips     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/36e52cc678dd128d813bc083fb3201e360f6eff5 |     
   arceb     |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/055789a09dc5f645c0f38c2c6894efd6fb75f07e |     
   armeb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/c8ddcaa66d7f6a184ae77327116b18b87ce055de | ORPH
   nios2     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/794b003176d475a73bd6eb66e22020478325d5d2 | ORPH
microblazeel |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/ffd6fb58da613cf1395c1103017c285eea11dc99 |     
   nios2     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/2572598107a62469d855332d8226c3c9e173e6fd |     
  aarch64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/feb32ef22e1e709d05878bbdba06ef8dcda88945 |     
    mips     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/6becf13a3f1e9de945463f0b1b81fe0c4637c5f7 |     
   sh4aeb    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/d0e7586727cfd412e213f1f906b256d26b82d644 |     
   nios2     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/7d5e41e4b9f4870a47104a058f35a3dab2dd9ab6 |     
    arc      |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/f4c9e06b57b9f5c50c5050170335c4c34b19db3f |     
   mips64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/ddd6d503f309ed5c7af645721f1cf262f8f9a233 |     
microblazeel |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/04409445ade447e64590e38e31c3246d63394c52 | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c3307ff5c4ce1152a1bca4b6d97e9cdc3862a39e | ORPH
   sh4eb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b063446b0e886eb149f3cdf0bed15a2e7ea98a3d | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/190ea6fd13bddcc7ebd972b5a5a582abe2495963 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b19745dcdc96deb9b891301cea28c86c81dc5949 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a84596efcfa879889748239c9b4f523e849628da | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/2ace1663a79ac1b41403c2eb0e18b07fd34c7392 | ORPH
 powerpc64   |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/7743f1c83aa0f7e81d5cdaf551ad2e3071bbc83d |     
    mips     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/7f0e4bcaad1ef8d4f17be79ef668a8cde0464aed |     
   sparc     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/c343c250d6edbbe04fe282e9801ba0444e951610 |     
    mips     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/d8af657c9085385178b6a40564ea4da66bf6fa1e |     
   sparc     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/0f4c7c21eabc6f7aac0aa16fa6a74e1027be48ec |     
powerpc64le  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/62ddf12bea4876216a7bf171660a54aaf77f4a02 | ORPH
   sparc     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/d4afc6ef8322c7f3c9e26cad7c4c7d2159c52e1f |     
 aarch64_be  |          scrypt-1.3.2          | NOK | https://autobuild.buildroot.org/results/2fd9cd0f491088d83fba65f6eea712f3b28eaa98 |     
    m68k     |          strace-6.12           | NOK | https://autobuild.buildroot.org/results/33fb6515d53981a059e90837292a6f2c55c995e2 |     
 powerpc64   |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/28f2ac773cef02e83cd86593ab8fca5bd7b93591 | ORPH
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/928119395d0b51ffa2924a0b46f06c2a78f59a16 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/eeacbf9399509bcfb6d6528937aa7064234f4de9 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c3751f967cd2ecc2f72bbef8229fb2cef964d5cb |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/793468209f5c4f88f7ddcb8f73572f26025373bf |     
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/279062bf3a012631de7be14b29fc535a687be89d | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b0277d6674a8c173b40add182c761a6dbfb7839c | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/9c57a2a476defb6d3b35f7e7f1219cdc53789e66 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/74736b4507e2ee1f6324a3afdf9c7171640f2c7b | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/3c2bf73f99bbd4e13aae191a1b6e5cc90e789352 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/edb4adf2622658900fad08040a37f05d8bf01fcf | ORPH
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/bc0a50795834424674e4ce882038bf9f499244ec | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/da7b9a9f15d3b116e5793009716f3edd516920bd | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/3b3180def6247706a3a41f4e6355d4df305d76a6 | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/80d38dbb11ea69c8b86554b110b3ecde163e7ed0 | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/1961cc76839d4d5750cabec6eafbe6e50578acef | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/c615b5e640b65dcc841ac1f44a225d61ffdee701 | ORPH
    m68k     |         weston-14.0.0          | NOK | https://autobuild.buildroot.org/results/622924dd3e9d00c98d75190e234cdf6983835bb1 |     
   mips64    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/50bf73361953193c608db2beca1d24e8383ffb0c |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   dillo-3.0.5 | 1 
            gdk-pixbuf-2.42.10 | 1 
                libressl-3.8.4 | 1 
                  procs-0.14.3 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          dillo-3.0.5           | NOK | https://autobuild.buildroot.org/results/846c7a089500ed3f239991bc3ee58a304f013e73 | ORPH
    mips     |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/f544a9e3e343fcb475bfaff5d3ea6d02738af3fd | ORPH
  mips64el   |         libressl-3.8.4         | NOK | https://autobuild.buildroot.org/results/54aca42a1fa83ba6350347011251c358630a8226 | ORPH
  aarch64    |          procs-0.14.3          | NOK | https://autobuild.buildroot.org/results/fa52088280a01ee5e851db56cc137cfedb75465b |     
    arm      |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/caef4437e76b25e857147e06b657a33c09be50ba |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  curlpp-0.8.1 | 1 
         python-remi-2022.7.27 | 1 
             util-linux-2.40.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/7d4570ab6ca522b72ca9133e468fe4c628f29465 |     
   nios2     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/e6e67a4cf7b1fd57361c8f55023023850b0dcc9b |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8e236c06ac7f96c2c25f9f8c93bb2c970d32f458 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
