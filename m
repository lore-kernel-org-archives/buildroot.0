Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EE7E7716A
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 04:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B912760764;
	Sun, 15 Dec 2024 04:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3pK5uYI0mlU8; Sun, 15 Dec 2024 04:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B60D6607B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B60D6607B1;
	Sun, 15 Dec 2024 04:15:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00215CE
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 04:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B449540711
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 04:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3FPKuBhKWLX for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 04:15:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7AC194071B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AC194071B
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AC194071B
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 04:15:11 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d3e9a88793so4951718a12.1
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:15:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734236109; x=1734840909;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NTTb1v3CpLq9Z75mzRJeRJLDu1l6U+kTW6LfjWck/8c=;
 b=PIOXEEz0/sV/tLfuwseCJho06whb7k1x7EabkwQ7D0GxYB0j34+AHRUNDWFFaGMTt7
 zsz2Ds16uOxSRPC0C2KeJD0wgZ1ZUtdkFEENvczBLL0vNvasky+gJIUl4H7rmuYxVEJZ
 BrJDLaI8QA62CFx8h68X7w3j4mI3lFX8PjqDRwnneceMwsZ+glJZynsww4e1sVoGYr2k
 YGtdMepz1W5BBPrBnlXvbeTDKmHGl1pH5XkEHZwa63Bjz9D6NhTkjX10EFUe2mEATHbp
 0ZXrpuvbmFyc8qtZX+p6sB6i5Bg1znW7xtREbw5Qys7seudPb7FddUxlAWdXvL8lgEun
 YzMw==
X-Gm-Message-State: AOJu0YzcYYBf9OvZ5KQgGCY2dLm8tx4r9RH1YU574EUae0N5iqL3P0KA
 Q6OWo2pbXzI5Mi3OUrN549mgPYSC6XgHYeeqjQz2oxyq+J2ckGqodhTt4A==
X-Gm-Gg: ASbGncuKgwcEoknNIOFjrOT5Dh4UXD6PQr9oXgw/Et5ZwMvDKhDh4DSQEuRhhQ6MkcJ
 veu+AMFJvj8MtZEnJHG5toR7GvWRYHjhIaO3IVmgVtlN7CHhFBOc1Ij+QNVO7mcJ5+/vYowwbcc
 nkq6xlMH0ZNHpD12+ecXDhhBOLpcRdmFPOBst4sbzyNGhT6zycxqM8fAbIU8tbknfN0JDB0/ad3
 vOBTOozuvhwTY1DN7J1jEGoQhrAo2PqTAW6PSagRxIB1At4xS/sFtul8IJp
X-Google-Smtp-Source: AGHT+IF/yrBYQl+Rvj+0lzY5W1Mqueey4fIn42KsXG/lW0/DcmWy3yXf9miZBkfFVS1CLAk5f8w7rQ==
X-Received: by 2002:a05:6402:3890:b0:5d2:73b0:81ef with SMTP id
 4fb4d7f45d1cf-5d63c3ae97dmr7657060a12.22.1734236108849; 
 Sat, 14 Dec 2024 20:15:08 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652ae11f8sm1712517a12.41.2024.12.14.20.15.08
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Dec 2024 20:15:08 -0800 (PST)
Message-ID: <675e57cc.500a0220.18cca9.6291@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 15 Dec 2024 04:15:08 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734236109; x=1734840909; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=NTTb1v3CpLq9Z75mzRJeRJLDu1l6U+kTW6LfjWck/8c=;
 b=BvlgHkJGxYtIaKBGxL8uGd8pVbIHIeFnOrMUAJGUiYNi3qGM3hfxMuUpAzS5Or/YNi
 EO5WQ4YvA161+Vu3mTuusJBrCM2d8g6guEIgOymr11gkaeEtJbH4snTyV7HJCn0qJHJZ
 VpMNUDdH8ChTXjuUW96A7pz5gTnMd02TfRdNft2dFDRJvX4GRbkbntwCYut4o3N4xgd5
 wlOjgxossL+waR7ZIMx6mNQel8hV6ohrprIIXy8n8HyTj0/baLQeehaZ9il31ne5C6qA
 2osCJx9ASF59X6x2FJTp+3z3D+tGjYQY0JeUt49895CExltgt5EBO511ZQXqh+PWac/g
 XsSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BvlgHkJG
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-14
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

Autobuild statistics for 2024-12-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  2  |  0  |  7  |
  2024.11.x  |  3  |  8  |  0  | 11  |
    master   | 19  | 246 |  4  | 269 |

Classification of failures by reason for master
-----------------------------------------------

               postgresql-17.2 | 14
             dahdi-linux-3.3.0 | 13
                  linux-6.12.3 | 13
             util-linux-2.40.2 | 11
             batman-adv-2024.2 | 10
                latencytop-0.5 | 8 
                       unknown | 7 
                  ntp-4.2.8p18 | 6 
          cryptodev-linux-1.13 | 5 
                 pixman-0.42.2 | 5 
               procps-ng-4.0.4 | 5 
                  bcusdk-0.0.5 | 4 
                   bird-2.15.1 | 4 
         gobject-introspection | 4 
             gstreamer1-1.22.9 | 4 
         host-libxcrypt-4.4.36 | 4 
              libopenssl-3.4.0 | 4 
     linux-5.10.162-cip24-rt10 | 4 
                   perl-5.40.0 | 4 
                pipewire-1.2.2 | 4 
                elfutils-0.189 | 3 
  gobject-introspection-1.76.1 | 3 
    host-python-greenlet-3.1.1 | 3 
                  liburing-2.6 | 3 
                libxml2-2.13.5 | 3 
          linux-5.10.162-cip24 | 3 
                   mimic-1.1.0 | 3 
            netstat-nat-1.4.10 | 3 
          obsidian-cursors-1.0 | 3 
                 openssh-9.9p1 | 3 
               pulseaudio-17.0 | 3 
               valgrind-3.23.0 | 3 
                  boost-1.83.0 | 2 
                    brltty-6.6 | 2 
                 c-ares-1.34.2 | 2 
                 c-icap-0.5.10 | 2 
                  ffmpeg-6.1.2 | 2 
                  fwupd-1.9.20 | 2 
            gettext-gnu-0.22.4 | 2 
            host-binutils-2.42 | 2 
          host-binutils-2.43.1 | 2 
host-binutils-bare-metal-2.... | 2 
   host-mender-artifact-3.11.2 | 2 
            libsvg-cairo-0.1.6 | 2 
                 libv4l-1.28.1 | 2 
                  libva-2.22.0 | 2 
           libzenoh-pico-1.0.4 | 2 
        python-m2crypto-0.43.0 | 2 
                 rtptools-1.22 | 2 
                     ace-7.1.1 | 1 
                 agentpp-4.6.1 | 1 
           at-spi2-core-2.50.0 | 1 
                  brotli-1.1.0 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
             cni-plugins-1.3.0 | 1 
                  curlpp-0.8.1 | 1 
                   cvs-1.12.13 | 1 
                   dante-1.4.3 | 1 
                    dpdk-24.07 | 1 
               ebtables-2.0.11 | 1 
                    emlog-0.70 | 1 
                    flac-1.4.3 | 1 
                flannel-0.26.0 | 1 
                   foot-1.16.2 | 1 
              gcc-final-13.3.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
               graphene-1.10.8 | 1 
                   grpc-1.51.1 | 1 
    host-gcc-bare-metal-14.2.0 | 1 
host-go-bootstrap-stage2-1.... | 1 
host-heimdal-f4faaeaba371ff... | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
             libargtable2-2.13 | 1 
                   libcap-2.73 | 1 
               libdeflate-1.20 | 1 
                  libdex-0.8.1 | 1 
           libfreeimage-3.18.0 | 1 
                 libjcat-0.2.1 | 1 
                   libnl-3.9.0 | 1 
                  libsepol-3.7 | 1 
                 libvpx-1.15.0 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
               mariadb-10.11.6 | 1 
                    mpir-3.0.0 | 1 
           oath-toolkit-2.6.12 | 1 
                   pcre2-10.43 | 1 
               pcsc-lite-2.1.0 | 1 
qt5base-2b9835f5c9bcfe3105b... | 1 
                ramspeed-2.6.0 | 1 
                 siproxd-0.8.3 | 1 
                   swipl-9.2.8 | 1 
                   trinity-1.9 | 1 
        util-linux-libs-2.40.2 | 1 
                  xvisor-0.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/9ca98b95da928c312712a02e0f8d13b933165400 | ORPH
    mips     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/d7aad6b40f25990215598512bd0819016fad2fc6 |     
   arceb     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/657c4021add412795e644ced2beab9650b236fb2 |     
   mips64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/dd14bd176920719bd42e94570ed236c500854d88 |     
    mips     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/bf22919601ddfb256820c9d1c34c5d8cb4029e1b |     
 powerpc64   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/ba609f301b61be01d0e4db03d23271dcbad7a4c2 |     
    arm      |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/47624f314fbddeb71d092d7a135cdfb4d90423b9 |     
powerpc64le  |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/6f4d2f1ff1d9af8d9979db0b5aa87d58f2f68779 |     
  sparc64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/dbcef58febd5ca0c127e257d9d973720d63e1f1a |     
   xtensa    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/d19d54bdc854b17fce98d7265560d3f9b6564a54 |     
 microblaze  |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/890b5d3f35dc671aa96987064ce9d1934912449e |     
   armeb     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/3ebafd880d357fe7396c7ade7e2c2d81142641db |     
    mips     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/c76d50c27c2147c66e8c041f4591c73b06ce7327 |     
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/9ca361cab6c5803d7ec9e528026b392d2ec0b116 |     
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/ca6e4a417b80b4b3285a6637644f4f6e6ae3dc75 |     
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/71182cd83d5fd74546597fa0c1370b41947059e3 |     
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/191719b037465363278c8505c0a2911d7a323c66 |     
 powerpc64   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/7365363dd09e07e00a1e7ae81c4dc14ec989bcfc |     
  aarch64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/a2a70ebee7cff893b3ec478c7e9e6229b0370ae5 |     
    i586     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/5332cdd78bd6be56994ddfd96401a596c1e7f338 |     
    m68k     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/f08df7522418bbb2f35e26f0c1df01ddf3e9a379 |     
 aarch64_be  |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/8ca5336557e3f4c0e16d1e30078b0569849b539c |     
  mips64el   |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/4e5ac94c4311cb818039f02cd5a455039ae93d7e |     
    mips     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/9f4200fd8dd9d757b6841028f2373990ce8c24b2 |     
   mipsel    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/1aef96f0f5b8639bae2f3341b19e535c174f2b5c |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/272c26ba0ed48a86791c15baa5ed99a2bed74f5f |     
  aarch64    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/79479b90dc596524f016cd15b7353e8259a32014 | ORPH
   xtensa    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/dde059d1b7a5db42369757cb9a8794877d803249 | ORPH
    or1k     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/1ee6829e004a35292ae8a8cf211f9ca19644cbcf | ORPH
  sparc64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/17d65a22e874e992211dbb63e67a9c54a79a7c8e | ORPH
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/65c0e7f26f286a3d51981aa14582d7d1debb4b86 |     
   x86_64    |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/145be52e26c8cdff63617a91f4c99ec7770cdda7 |     
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/f9ee684073c505cb2772d3f5d3be63815714257a | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/0ac0898c11d417829165b39166834a1cb40377f6 | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/e62b0cb80720938aa0de0f6a7df50ecf4548114a | ORPH
    m68k     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/552f9b70faabc20b280433f0d0339684aee85c98 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/6849dfabddf8bdba484284535b568e5fbe99258f | ORPH
  aarch64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/9ee1fa36e3fc4455016db5f6680a054d5cc46f89 |     
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2855766c8d1e80f09789d9c0235501c577acc60b | ORPH
   nios2     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8959a407932f29f877383e99b864213ea9ffbe4a | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9b1bf63d4bf8c50c5fccd8b503ed47919fbcdcc1 | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0c16f3f1e2652c4cf517eb223625b34fe8a0c019 | ORPH
  riscv64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e61af9c389bef1b76d85b79f3176c0513cb49a02 | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/eb24d765839785fd1afffac1c3381364558f2c19 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7c3f9ebd235dd6623122048553ac5257c1fe8114 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/bcb840b44ddff312a99ed4ca069fda89f6b2e9cb | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2ee2553918cb5ff7ec03b30e7bb3d909146a83e9 | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/015fd6b3f411a2225e86af7bebd7004fda504be4 | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c5221c015ee7735c78e961e88064d51ad7ae01d1 | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6855c5e3d4dc978f58728c50c5b6245d7c1bc6ca | ORPH
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3a728f0c987ec603769c37cd4b4a1fdeec69ffba | ORPH
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/343e6ec7205bd673d4d81ed11ffd50d40a5153d9 | ORPH
   arceb     |          dante-1.4.3           | NOK | https://autobuild.buildroot.org/results/fc5c7955e39699e4042aee1cbdd0987d4dba2aea | ORPH
   x86_64    |           dpdk-24.07           | NOK | https://autobuild.buildroot.org/results/547c24bda86f31483546a71d05331c1301fe1d77 |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/c89c9f273a55c13e72c84da31104d0515ed575f9 |     
 microblaze  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/b552f344d22a9d2e072843979ae48a581994a3e2 | ORPH
   armeb     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/d99699c1aa02549376e19e280b04fbb8270042d6 | ORPH
powerpc64le  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/7a57a59692ca05546793bc2f7980972f92f1dfe1 | ORPH
  sparc64    |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/eba229788c17a41ec06bad8b5e91cb11d34a0e2a |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/1831c7535d0181baf308fa436bdbaf089e93f44c |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/0e3d6fa089268b7aa65953c52ed34da908cbcb96 |     
    sh4a     |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/4d94ab9863a85745870863c08189c5af4d801276 |     
   s390x     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/6fa1ab0b31780749d0d27cf2fe9f128d6d6df5ec |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/abcded5644b5c0f6621bdd0245f1da3758e1e448 |     
   mipsel    |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/9aaaf3cf6cac572766a7a614bde53be09afa83e7 |     
 powerpc64   |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/b953e705fcdb48280e5da3d0494f9bd66d245ebb |     
  powerpc    |        gcc-final-13.3.0        | NOK | https://autobuild.buildroot.org/results/8149f1a14d884b210a91404a8969c674471f05ea |     
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/7528f945639d8d947dbc267f6ccc47fe26f015c8 | ORPH
   xtensa    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/5e8e95f42d836a9b1e04fdfdadd462f58cd8fe5f | ORPH
    arc      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/10f4b086c96f4e7d3bbabe8f73bbf68808cf63a5 | ORPH
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/ece2a5bc9c80d19d664b94e94bf01e3aea6acc70 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/4e4d77c775ec2e8156045c4b9981de8095dad97f |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/328ad85bf6b4605ab94d8872c22e19dec49f2dee |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/530e20c12f115e9721c7ccf487154946c46b67fe |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/c1b1941de3d8655f915abfac20ec0262b97ef204 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/51f6f3f60c0d47b2fc3b0147aaa987ab0ffaa1f8 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/6958cc251ae30ea1639c2412fb87aa639c29d822 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/263baabf8efd069f6dbd94c6a3618b9aefaeb0f2 |     
powerpc64le  |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/d75db3cb359c8c46497ac63f6d36f087b286895b |     
   x86_64    |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/fec744a01eb43913dcf668db46b6ed470a9cfe54 | ORPH
   armeb     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/d0c586af9feb4afc723f55fcf6d5c17f053656d5 | ORPH
    i686     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/40344cfdd9adfcd66e2c6112cde8ade57303c0ff | ORPH
powerpc64le  |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/7b225a12919327bbff713b54554419b65badcf38 | ORPH
  powerpc    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/890bc6734be956943fa9298287d8de60e35ef8b8 |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4e5bc0b1670f1e3f2a54456a301312cf52bca86d |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c5daa76de31cd05364059f09f2e7e4cfa7ca5c4f |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8ae3d49d2341c11ac7d82421087774e9cc50b805 |     
   sparc     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/3a6f5cc4944341dfb5f5e0a2065f6fee9bda62a8 |     
 microblaze  | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/0a7cb496df976c2a87ff15c583b009e31cc24331 |     
powerpc64le  |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/c39e343b8cee75d308b5f97583c9ee8e4a16156b |     
powerpc64le  | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/828ed25fd56532dc083552e27a1e0b74dcae2d43 |     
    sh4      | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/ce5eb2ebe4fce6e50c7ddbfeb8af974562b92b23 | ORPH
  sparc64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/1a8b5d8ab957df34bfd1615ec113dc01a94af088 |     
   s390x     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/6df3b4d6269a7c38a9a2d5a5dc23f1aa2fc6467a |     
   sparc     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/5c8b75a19f04391c9043f4b8e4e0a08a3b609ce1 |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/d4674352ae59998e3d5e0f81fc8f2f36e4571f77 |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/d2959582ccfba10f8428f4396bee588eaf05e7c9 |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/fc5643ce8872c2d7dbbe18a5cbec441c9a4b2867 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/ce0010c18addc1f6c19cfd3d9667454ab30205dd |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/44b56fd3cf9dd07297404457b1aa9036f47e33f2 |     
 microblaze  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/2cd6fe4a584989971509e020fead397cff94d4e2 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/84ae9d0a4854352d54f4725ee90da1980650a10b |     
  powerpc    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/76a1c7b0bc54529d08e2492aec937027095f2159 | ORPH
  powerpc    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/cdfbf97db7aeec67ecfb584d8b34a73566a625ed | ORPH
    sh4a     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/268fc84d68ffc816701e0d19bfcb3a7ecc6a7214 | ORPH
 powerpc64   |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/bac95db53a59304301927be2d9fd0f011dfa1905 | ORPH
 microblaze  |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/ac96a30c5efb0ebac02d5835398b187d89e38c6b | ORPH
powerpc64le  |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/112e7cd81fc92d2aae35dcc1cb697cd718a576ff | ORPH
   mips64    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/325008639893b66375eec22ed1bc49ec1c0d76cd | ORPH
    sh4      |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/c86c128c220e7be21668888797ef856230dd98fc | ORPH
   sh4eb     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/32f65f78c5de31bc5618092b4380d57e2dd5e3d8 | ORPH
  sparc64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/846e9b9cd4227d134e95adbe9805cca0ea6dfd2d | ORPH
    arc      |          libcap-2.73           | NOK | https://autobuild.buildroot.org/results/2f9bc4a66e138ba7f9c714a45425c1bc182f312d |     
  aarch64    |        libdeflate-1.20         | NOK | https://autobuild.buildroot.org/results/00653cf9ced42c31175bbe8366a2b050fa5b9cb2 |     
    mips     |          libdex-0.8.1          | NOK | https://autobuild.buildroot.org/results/96f62bddb7cbc6c4698a95dc45b6d63a53cb9713 |     
   s390x     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/debfe5ddabf130b6fa57b7180442e8dbccf854d5 |     
   sparc     |         libjcat-0.2.1          | NOK | https://autobuild.buildroot.org/results/1d53094ce3245810efa946736a996af01e92e160 |     
powerpc64le  |          libnl-3.9.0           | NOK | https://autobuild.buildroot.org/results/e1997c2b574c483090acf057cc5d82a8d4420b26 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/c9c9430f7dc706533920730071a07bd40a22e3b0 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/b4aef0e1ce161a7f2e9f57369ca81d8951997115 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/586bf0c5067805c1ea63d087d44a9cf0f8aad0b8 | ORPH
  riscv64    |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/f294a9c544574fb5ecd250235501b51cb6da5c32 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/ca561bbbc47498a2bdb15255ed6eca8c9d9adb01 |     
 powerpc64   |       libsvg-cairo-0.1.6       | NOK | https://autobuild.buildroot.org/results/d09ca5f99f0e8fcf10c3991ae32ff418eebdd14e |     
   s390x     |       libsvg-cairo-0.1.6       | NOK | https://autobuild.buildroot.org/results/63c1638988b788c51b7202850c230c212d30e301 |     
    arc      |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/ec3c8d94003d1f7c85908bfa6cf3eb428c242f4a |     
   mipsel    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/71de859b5b68390357f6d01edca2e0fdf2e44b6b |     
   x86_64    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/8f68a745116c06a16e1e12b07a6b5a0c72210db4 |     
    m68k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/ca76c0578c8f202be8d4bf127734f5e24353139b |     
    sh4a     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/e610808798102972a60db56cde397680e36e2397 |     
  mips64el   |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/2137009a50186dfb18901d8c9440cee97e3a3fc1 |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/842ad3488de00da60af27724a73c506a02db8f0f |     
    or1k     |         libvpx-1.15.0          | NOK | https://autobuild.buildroot.org/results/078340144f4b18b64a4ef9df1fba21564eba2562 |     
   sparc     |         libxml2-2.13.5         | NOK | https://autobuild.buildroot.org/results/98cd080e366852708a7945d3796db278001a508b |     
   sparc     |         libxml2-2.13.5         | NOK | https://autobuild.buildroot.org/results/4359d903b80e733211997c2b0c55d958a321d785 |     
   sparc     |         libxml2-2.13.5         | NOK | https://autobuild.buildroot.org/results/10f4b9341de75bdbebd059d70d2f5d6612f775ee |     
  sparc64    |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/f159158cbe4981610b937341a8991911bd5be399 |     
 powerpc64   |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/911df415b4fdd8a09291522435e1901f5ed541e6 |     
   xtensa    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/794faa74a3e59d809ac48dcc73ec84d11e5f2134 | ORPH
    sh4a     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/633648004d4a9b4c438bae4bc1960a15f84555a4 | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/9c3b076a0b4b1152778b6ddf7af715b6d4c33c8e | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f4db6096092e7f890119f04d577a80bf14b1d4e4 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1fd04be583d840e270d424bc806b9b3808372b47 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0779c3a10766b74dfbf5133b704d5ff7cd282730 | ORPH
   sh4aeb    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/88ae484c32fb3ec2777385d7449c783318e7a426 | ORPH
    mips     |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/c4be1805f7ebaf16508f60979c273dc1cad67ae1 | ORPH
  mips64el   |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/f80238a49c0f1d0e7431353f69ae1efaeee3dd11 | ORPH
  mips64el   |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/bfe95cad237333e115e5f6ebfb555526623541d3 | ORPH
   mips64    |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/2c3cf5bf8772197b71dda8b7d91632d2abc642ad | ORPH
   mips64    |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/5641634956804b108e5a5d8045cbdcf9bd1469fa | ORPH
   armeb     |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/ddbcfcfa6a6efae8a694367ad8ba8a5ff6b5f9d0 | ORPH
    mips     |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/5b112e068935da49d3743d3150087e61aeef3cf7 | ORPH
  mips64el   |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/af1230ec0c25aec49a08fcb1883bd1991e2f3909 | ORPH
   arceb     |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/2d4dd9c6fd8917e28ee99fb3fa8fb104180b10ec | ORPH
   sh4aeb    |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/29a894c29c7ec3c41d692d2c7013437147e5949f | ORPH
   mipsel    |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/928cf0f85368a416ee565c8856e0dc6070a1f148 | ORPH
   sh4aeb    |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/8277b0dfb41eac8d8d099d2e8d79e8c42ef7bbd9 | ORPH
 powerpc64   |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/038c8b30e21e4b8eb1e039492c0dc3e3b6449ca8 | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/0551780ba71af093bbcec8fc46897d6d1b8c0f38 | ORPH
 microblaze  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/0e5dc40a34c47d50bee9be62fc2da54e19bd5d83 | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/d7f4abe2f5f7e134f967330bf434655327a6506a | ORPH
 microblaze  |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/fbefeb1cba7e75e5e116f45089c9bfddad7d683a |     
 powerpc64   |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/9652ecee7d35ca79b6a0b237fa164fc1d7e2fa4a |     
    mips     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/c6ba309a975e735e0208adbea54b97c63070b936 |     
 microblaze  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/681cf2c32b98e7e8c5864ea438c9504c0b321eed |     
   armeb     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/b845539967c4181fd71f2981c725b7f0b19bbd67 | ORPH
  riscv32    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/4245607f1d039a3b9eafec521a5c94d44f8b4e2d | ORPH
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/74da631bed80aa59b8b8069c231a591707322a40 | ORPH
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/2386d484e67fbcd302d6794fa8c4abccdf016bfc |     
 aarch64_be  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/8acb61995d40d27a01cb41042396dee119581499 |     
    mips     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/7995cc62b3a0f2cedbfc7f393277703fdc70331b |     
  powerpc    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d7072a97c6187578f9536190db658300d86c9512 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d68a1c750e02192eb75619a6e6be2d670ae382e2 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/61d71483b51501f98f89604c0805431c3b0a522f |     
   s390x     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/5e65c03049d4289f71a9c6ada53b3aa9493c970d |     
   armeb     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/aabd6aa0a9de6bb3d05f4b6f1a117a0ceafeb4bc | ORPH
   armeb     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/fc1afe795e679f6aff441ef3c6fc97ee0ac5eb0d | ORPH
   mipsel    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/9d639cc34c0400d66e7d301efca9f68fcedfbd1c | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/c72500f9b148e5f5bdb1bc31168db969b74dbd25 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/6606664f922653bdfef778e400879b91dddaea70 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/dfceb19fcf57bfab1850f837b53542b844b3637e | ORPH
   mipsel    |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/45990f8c46d2789e7cbbd91021dd16a22bd0783e | ORPH
 microblaze  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/850b331a86755b62f8f13d95e8a58373534c3cd6 | ORPH
   xtensa    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/3eb7d400aae12e002390012ea55c0fdfca1c38a3 |     
   s390x     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/9863118815bdb9a8885c3528f5e5f67cf5ef3dbf |     
powerpc64le  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/73958672327ee5cc94202cf80473777822e5ac69 |     
   x86_64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/80f825a034168c6e1d0afd4cd6979eb2d879a2b5 |     
   sparc     |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/ec81fb10077747b9243896b2eaa516b5bc12564d |     
   sparc     |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/f9df16f2850a62b13fc82356a143cdb2059ec4ce |     
   sparc     |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/b6d24acdd163b4b31408cb109253b869ca379d0a |     
    arc      |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/e092c05e7a2bbafe2e9266df981f42094a9261aa |     
   nios2     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/c0de5952fa1dcca345b02a9fa4cb5c74302e316e | ORPH
   nios2     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/f998b71adf6025b2e7e677f36aab81a766c9cfb9 | ORPH
    or1k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/e0da6760b44e82d5ca98a2dd95df3d83106394ba | ORPH
   x86_64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/d8368434f379f2669831b2a85062d43e5d87534d | ORPH
  sparc64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/28ae6f5e227eaeb70e8b748daa323caf62640a90 | ORPH
 powerpc64   |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/bfbebbea3260087030ad739aa89dfd1f9f95051d |     
 aarch64_be  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/45ced1175f06520dafb2fca478c3babd2a9035be |     
   s390x     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/6757730304f24844c6668374f24ed12b8c21cd24 |     
   s390x     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/35b0276c36ccebc09a774ee6b7efa5ca72ed30b6 |     
  aarch64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/10f592b889f57e98d95cb4f8dbbb8e662da21eca |     
    arm      |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/44a8a5799ccc70614d1ba6140ae96a9f8edf4b1b |     
  sparc64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/6273a440277891847162a11840442859628a8578 |     
powerpc64le  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/75e1e9d5e0d4f5af677169777be993fae373bc28 |     
 powerpc64   |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/d9a68268b6276853d9dd3a650fb5d7fe2fe1cdf1 |     
    or1k     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/561bd96ab0b2b28801da5a667d2c84978bfa6a9c |     
  aarch64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/f24f21b43a70612d36a4bdeb452acbaa4c78c574 |     
 aarch64_be  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/826ac69411883612bde15328c4fe871c42135a27 |     
   armeb     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/10c361a3f0921c2c9bad1741e04238607f2e74c1 |     
    arc      |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/b5d2d8491116d7b0b14cf2195158cf799ced78d1 |     
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f34c5d289b03b7d20482f6bd45eb70c910d36b41 | ORPH
  riscv32    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/9bec8d40bbdb502daf9717fca6f3d8da020165cf | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7c4d33830c4c91de3fd24a5e7d58b817950a4acc | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/75cc871bfed08404d87d4fe7444a76bf57e2481b | ORPH
    i686     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a475872a03aecd56120471c3c4264146140f5e41 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/ea5c029dff338d9b32a0763552d4f8a28c218cbb | ORPH
    sh4      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/f512b537b678ad7ea04fda179806fea2449ba9a2 | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/f83845ad2e60022bff02e9cb5ea6a6e92d559f05 | ORPH
  sparc64    |     python-m2crypto-0.43.0     | NOK | https://autobuild.buildroot.org/results/c7aae6fadee7cb2a90807c35b605746432e85a8a |     
    or1k     |     python-m2crypto-0.43.0     | NOK | https://autobuild.buildroot.org/results/07f4658a1752cad8e0e16c0801e5c4be9af0e1ef |     
  aarch64    | qt5base-2b9835f5c9bcfe3105b... | NOK | https://autobuild.buildroot.org/results/16a674f6e05a3577226395d16345f91183520f6f |     
   s390x     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/a7d28a8b2bacb69dec0a2a5fd8d2412924d3bfc5 | ORPH
  sparc64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/b19173b6f1084dcbcb05b5404f920f8bd0e674ff | ORPH
   s390x     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/2d283399fbf8b0aaa41d10a43e670096ff56df45 | ORPH
   sparc     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/a851957a0b9e3b6f30d15a4f9ea166df5e46772b |     
    arc      |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/abcfca3014507eff9d0462533515b321210bece9 |     
    mips     |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/a9ae76e1139b3a1ead6d8671f0e1f5851db85910 | ORPH
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/69b1cf05a78b2d2bc583eb6fc117b45b79259756 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/0672ffde2d7cfd50be22ca064fd3e12459e65809 |     
   nios2     |            unknown             | NOK | https://autobuild.buildroot.org/results/5598084dee206a276dd8e0883c815a794896b2d2 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/778a62847015fb6bc3e2ab0998ce622b0ff4ed49 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/1bde9ad7b0359947cffa79999a8e3c835a7f061d |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/99c87d00ad9f8e5f740da444617ee7a0c18230aa |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/3173dce6a4c66dbbb73f784d2324fa55c1e6757c |     
 aarch64_be  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/6fabe287f4afa8c7d113778f0f21887653f5cef8 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a688ca5aaadedc712174b38eaf3776fcfa83a794 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/85995f436a1aaa938dfaae358dec1d7c2a100ce1 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/6f6fc5fd5cd42bcf9faed0755b6d72557c2db3a3 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/3faec237a81de8cc60af3a8042600ab68f827287 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/4717efb4584106f11f2796e3f7204035f0ce09a6 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a60119b7e9e1f9c6d6c0e8b53e1472edf609f994 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/98e5a82c661c564b834916432f20dde7be6a9eec | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/11b01447a484c86db5e3efe75f6944f9079991e1 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/9212e0e602b7860a67c93638e71bc4d1bd77a9e3 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/415daddfc62cd9347c7f89db4df8117f8dbcca9f | ORPH
 aarch64_be  |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/5bd5576bb747c7973cd8e52b9f24a9e780ae625f | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/6aa4e635f1c612f2658e39bf9e7f0b7918d31239 | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/59f5d036b0943082c8a9d3d8f8e73e87b9e4eb2c | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/c27c1cac4dd26de1e9d75ff66ffc0a669f6b712b | ORPH
  riscv32    |          xvisor-0.3.2          | NOK | https://autobuild.buildroot.org/results/b4e7cc57c2ad8c4128091b2b822805eb9deb17ab |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

 host-softether-4.30-9700-beta | 1 
                    ncmpc-0.49 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/ebb17dd668f56c2252e7402cf203ba9b3dd6a4d1 | ORPH
  aarch64    |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/3f37bd7d2f9f399e97140fa05e683b2418316c8d |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

              host-rust-1.82.0 | 2 
                  curlpp-0.8.1 | 1 
                  libnss-3.106 | 1 
          linux-5.10.162-cip24 | 1 
                 linux-6.11.11 | 1 
                 pixman-0.42.2 | 1 
        python-m2crypto-0.43.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/c6650b51de8ec39b669a5f0cd214343e83f19834 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/7b2158ff5b30192f3c21e26af41928db3a871f84 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/cb7eddc5d61853ae8c082556f06b942ca880b239 |     
  mips64el   |          libnss-3.106          | NOK | https://autobuild.buildroot.org/results/d6a58b8551eef25594327dc6c401ad29dae3659b |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/987730e38e0d426a87c8e068898ca5fee62ba6f8 | ORPH
 aarch64_be  |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/d0878764b0efdb9f23329b77a2b5b8285778f107 | ORPH
    or1k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/acbe6361208051640b94b3915e17c29f365ac597 | ORPH
   nios2     |     python-m2crypto-0.43.0     | NOK | https://autobuild.buildroot.org/results/537cfefffea7caa766a31c3f19c94fa065442f31 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
