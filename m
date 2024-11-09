Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C22CD64086
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 04:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EDAA60619;
	Sat,  9 Nov 2024 04:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WtdpqCfSY3vO; Sat,  9 Nov 2024 04:14:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05A0760623
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05A0760623;
	Sat,  9 Nov 2024 04:14:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 410D6978
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 04:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8108184565
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 04:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EP5ew5Qlqqqm for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 04:14:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 473D082106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 473D082106
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 473D082106
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 04:14:04 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso441006666b.1
 for <buildroot@buildroot.org>; Fri, 08 Nov 2024 20:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731125642; x=1731730442;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uGd/JdIphha0BwIPNT0o6CeWjSUKdpSoUjihOJWXKeY=;
 b=PTW4wi8qOxpT5lPP6tY6YShCz68NWZ/1eLC5TPUlUF55wRsozy6c/pH+Vd0q1g80wL
 USdkp5JnAQ4UNfOG/VYt6NL3uNie4DmdVYRGtVN5vBh2DLxrocMphwyzatFJbM2O96yW
 py2xQeHQvJbxwfLxeEXmwuOwLz3gjkYSlT0t59Ma+t9iW9eB2SLprXFuiZ3SrspGYIYb
 dNPUb1lnSL3qFFYdScBrmZDiYOIT/ulzx0CmnVuBv3ttIfzPO4+OiUQitH48AyN/8imc
 Xs2qpzW0jC1CEU+67EFG9CZ43c60SkCJiONCZK5z0pptOmpFciHE8w6Hsi+lEpi/ZEXP
 8GVQ==
X-Gm-Message-State: AOJu0Yy7CHTywLYZE+C4dIM8chYCWTugCcTgY6gvuiZV1J1GaMXUoN0x
 KDXvkK1iyvDI1JhIWls0qjdZuaYgDl9ik1AELqNcwQ2oyTXAnW7s8j8sIA==
X-Google-Smtp-Source: AGHT+IGXJ1oNvwEjHqHZwPnpZ5qoDEf/snEf466BmtiszAi/afpl8in5ia5Ct1WFq8uRvclr1pAsag==
X-Received: by 2002:a17:907:9603:b0:a99:ed0c:1d6 with SMTP id
 a640c23a62f3a-a9ef000750cmr487834766b.49.1731125641516; 
 Fri, 08 Nov 2024 20:14:01 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc52bbsm311029966b.97.2024.11.08.20.14.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 20:14:01 -0800 (PST)
Message-ID: <672ee189.170a0220.2afe41.a5d1@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 09 Nov 2024 04:14:01 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731125642; x=1731730442; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=uGd/JdIphha0BwIPNT0o6CeWjSUKdpSoUjihOJWXKeY=;
 b=SwZXANDzywpMiMg9fTThp2iIf+7Ek652BAgcX9evf4hEJeN1jmWzlfx/lBDTtkTRbv
 momrHZYBEYl9B7iwHZ9yh71hUUHQWRlfO9eFGXn1goz6EOBz6PFya1AKP9X05OIwKq+A
 9FrM+GVrcjwTJdIownpSOAx2PmAFrgyeSceajdE34A2XLe0B70VwPphSg5t2tlZCts0o
 PSFlx4v2x6RNvNYZ+YZRStqSjk2+Lz7R/ffgLN7O1JxfZeOjJMW+zyj7b1h8XsxMqvEY
 4m6RqVfKuoNPg3/FxZRubM8PNPAob8l+S/ghUh7aLTdbc4m0kw0o9FTRqlinR2XSlfC5
 OsTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SwZXANDz
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-08
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

Autobuild statistics for 2024-11-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  8  |  0  | 12  |
  2024.08.x  |  2  |  3  |  0  |  5  |
    master   | 19  | 273 |  5  | 297 |

Classification of failures by reason for master
-----------------------------------------------

           host-doxygen-1.8.18 | 16
             dahdi-linux-3.3.0 | 11
 ibm-sw-tpm2-rev183-2024-03-27 | 11
                  linux-6.11.6 | 11
                lmbench-3.0-a9 | 10
             util-linux-2.40.2 | 9 
android-tools-4.2.2+git2013... | 8 
              host-rust-1.82.0 | 8 
              libopenssl-3.4.0 | 6 
     linux-5.10.162-cip24-rt10 | 6 
                       unknown | 6 
cegui-00b4e1fe174da53b7ed72... | 5 
  gobject-introspection-1.76.1 | 5 
    host-python-greenlet-3.1.1 | 5 
              mosquitto-2.0.20 | 5 
            netstat-nat-1.4.10 | 5 
                  ntp-4.2.8p18 | 5 
                   perl-5.40.0 | 5 
               procps-ng-4.0.4 | 5 
                elfutils-0.189 | 4 
                   eza-0.18.22 | 4 
                  ffmpeg-6.1.2 | 4 
                   foot-1.16.2 | 4 
         gobject-introspection | 4 
             gstreamer1-1.22.9 | 4 
                 libpng-1.6.44 | 4 
                 libv4l-1.28.1 | 4 
           libzenoh-pico-1.0.1 | 4 
               mariadb-10.11.6 | 4 
      python-autocommand-2.2.2 | 4 
               linux-pam-1.6.1 | 3 
              luabitop-1.0.2-1 | 3 
                    mpir-3.0.0 | 3 
        util-linux-libs-2.40.2 | 3 
           at-spi2-core-2.50.0 | 2 
             batman-adv-2024.2 | 2 
                 c-ares-1.34.2 | 2 
                   crun-1.18.2 | 2 
                  curlpp-0.8.1 | 2 
                    flac-1.4.3 | 2 
host-binutils-bare-metal-2.... | 2 
host-heimdal-f4faaeaba371ff... | 2 
                  jack2-1.9.22 | 2 
                  libva-2.22.0 | 2 
            linux-fusion-9.0.3 | 2 
                ramspeed-2.6.0 | 2 
                   sdl2-2.30.9 | 2 
                 agentpp-4.6.1 | 1 
                    bat-0.24.0 | 1 
  binutils-arc-2023.09-release | 1 
                    brltty-6.6 | 1 
            cairomm1_14-1.14.4 | 1 
                cryptopp-8.9.0 | 1 
                     daq-2.0.7 | 1 
              execline-2.9.6.0 | 1 
                 expect-5.45.4 | 1 
              fluent-bit-3.1.3 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
                  fwupd-1.9.20 | 1 
              gcc-final-12.4.0 | 1 
                      gdb-13.2 | 1 
            gdk-pixbuf-2.42.12 | 1 
               graphene-1.10.8 | 1 
                heirloom-mailx | 1 
                 hiawatha-11.2 | 1 
            host-binutils-2.42 | 1 
                host-go-1.23.2 | 1 
   host-mender-artifact-3.11.2 | 1 
httping-0e26c53d5fe504eb720... | 1 
          imagemagick-7.1.1-31 | 1 
      libabseil-cpp-20240722.0 | 1 
               libcap-ng-0.8.5 | 1 
           libfreeimage-3.18.0 | 1 
               libglib2-2.76.1 | 1 
               libgtk3-3.24.43 | 1 
                  libnss-3.106 | 1 
                  libnvme-1.11 | 1 
             libopenh264-2.4.1 | 1 
                  libsepol-3.7 | 1 
               libunwind-1.8.1 | 1 
                libvirt-7.10.0 | 1 
                libxml2-2.13.4 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-tools | 1 
                memtest86-6.20 | 1 
                 mesa3d-24.0.9 | 1 
                     mtd-2.2.1 | 1 
          obsidian-cursors-1.0 | 1 
                 openssh-9.9p1 | 1 
             parsec-tool-0.7.0 | 1 
          perl-net-ssleay-1.94 | 1 
                 pixman-0.42.2 | 1 
                  prboom-2.5.0 | 1 
           python-daemon-3.0.1 | 1 
        python-m2crypto-0.43.0 | 1 
              sdl2_mixer-2.6.3 | 1 
                  snmppp-3.5.1 | 1 
                   swipl-9.2.8 | 1 
                tpm2-tss-3.2.2 | 1 
               valgrind-3.23.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/31e878418901960e15597340855c312563ce3097 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/c74700f52191ddc29a41d4211cfb357010177188 |     
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/8ab5908d8a9b7ebc27be26db7012b3ec5fbf49f7 |     
   arceb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/dca24472a4b9f302f491c4c84047ec06ab498864 |     
  mips64el   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/97211b26e60a42949ac88d3332747dd8ad6c57ae |     
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/fe4dbd508e12b293cfea363c9f79be5fa754ca00 |     
    or1k     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/af39215691d5b76dce0003b1269b1dacca07be2e |     
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/44af8f6fcf1f97450f0ef550573632ccef6f8194 |     
 aarch64_be  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/96d25d73968322835994101cbf0644ae14c60584 |     
   sh4eb     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/9d1b7f3426e21f99d208aadecddd1ecf881bf67f |     
    arc      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/e97859bc6785ef397a8b8970262fea8d31388b34 |     
   x86_64    |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/2a2d907fa1ce7923c7e6e1ed38cbb9deb28d9c3e |     
   mips64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/03cab24fe0dca255a6e2a1c542a8824ca09efdcd |     
   mips64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/ffcbacb5f88fdea509e4d22c148a4f098ae19ae0 |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/668cd0062f992e712446b102dbb6b508dbaa8526 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/7ef15b18f4428ec2fd4a6d51f5fc85403702a077 |     
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/97b918df75fec964831f3f9cd59db9d9010bf7f3 | ORPH
   mips64    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/aee1d509ae71fc4111c72293d2c43ba781edbe33 | ORPH
 aarch64_be  |       cairomm1_14-1.14.4       | NOK | https://autobuild.buildroot.org/results/cf7a321726cdd31886aff4cc3161dd96f9195c7c |     
powerpc64le  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/277c313ef9214be69aee35d3bbcd9cdc50b14857 |     
    i686     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/45c6acd5debdda8e3f258cc158052f48c43c4a05 |     
 aarch64_be  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/bacb1b13fe962268868eb17dd2a42fe5aa9fa67c |     
   s390x     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/cf4e8f30df1591e8011edefe16926163b1eaafe9 |     
   s390x     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/df2235a855010d084c0d953708b74b588b6cfaea |     
   mips64    |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/911470113c7ee0e631d694757ea415a7281f23a7 |     
    m68k     |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/b40ccdb65fbe4be82b902a3d6912701369333ff1 |     
   armeb     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/1aa4c02cdb0d3a3bb0f8df9ea1b2e08bce54d756 |     
   arceb     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/d70f1e895ac06008d0e3f06a304a76b2655f973b |     
   nios2     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/b32275444dd523108e1cbfb9503f8c0ee91dac4f |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5c7c9b50ece00c9a4a295293d54bf672f0de2c66 |     
    mips     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6efcd8e5567e7b455a94e84ff6c885212262d866 |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e39a42bc858514b8aada7d9014f4c34de020520d |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7c70e4fefb901e13f6a154984f1b4e061b2d2515 |     
    m68k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0207f185bf02e0fe65dc4e76a79f1a45eeb0181b |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2798f2274f8af0adee2a0c322d0e4c4a4dcc6b53 |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/021d7daff77f0ae298026b8c9abb5c8aa94c2016 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/efcacdf28db10f2b6dc604c1de12b6bb72a10d72 |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b499cc0651a15fd421d4d8cfb78bf5f957dd06db |     
   nios2     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/26db41cb816a3aef6ea6de31a0f7e30b15c1cbdc |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/940b6a52e8926f484ebb2b7999ad38748d87ab71 |     
    or1k     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/d815249295661c778ae03be20ac9e00f7eeee092 |     
powerpc64le  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/2dd18465cf53014b1adbe6abb4d2cdbe20a5fb77 | ORPH
    mips     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/a5ea4a2ec04b5711b23fbbad973ad8d7e8675099 | ORPH
    or1k     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/a06f7039fd8b760e1a5bb48ccca6f60d38d273d5 | ORPH
    arc      |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/01ddf829a870ed20d8972a54173fef0311ad546f | ORPH
    or1k     |        execline-2.9.6.0        | NOK | https://autobuild.buildroot.org/results/739a752d64f46ae7603033d3fb858d7966b0f4fe |     
    i686     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/f7a0c9397ac6fb535389339fbac73b3bc7dff4f2 | ORPH
   s390x     |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/b2fed744990cc07d0c7e7924ecd25d0ce16a2154 |     
 powerpc64   |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/38522c600e448d01f2e7842fb420bf3bf1f499e5 |     
powerpc64le  |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/a23728f1ecaf27d4210d8661a9988f4acd8c578c |     
   armeb     |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/c7fb81bf2c7e4c88cfa913ce40c83d34ede02165 |     
   armeb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/9ed831cada43df91c13f6afac7e6a8503b8c6472 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/455388a7fc2cab7bbf5c4df9e42728bb558c01f7 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/95341c5011b2108d748a8a728cf826e52e4cd74a |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/42c7bc80dde5bb772f10497a64510c910fa9903d |     
   sh4aeb    |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/44b6b903d3d6194f3898b3d148d3b4cecce050cd |     
   sh4aeb    |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/aa757cdcceac78978a73b4b4add92a9779ad1883 |     
microblazeel |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/6ca1fa8efbb02df6075ff173e361be9d737c2dcc |     
    i686     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/9581903724c9f248120a66e427612482a8e038f7 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/fa40b3bae34563db8c01a80912ba2cadfaa70617 |     
 powerpc64   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/3e0ec7de1dbd0a7e9327536519b9601736e39055 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/79057c66870207be3ec7071480b53729d16ee727 |     
microblazeel | fs/romfs/romfs.mk:32: /home... | NOK | https://autobuild.buildroot.org/results/dd45804d8141ff0ea39931f01c8731ffad6212a3 |     
powerpc64le  |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/5d055dc3b318a24bf1c69ef60ae06edcba8455d8 |     
  powerpc    |        gcc-final-12.4.0        | NOK | https://autobuild.buildroot.org/results/58102469686d4a0b4136096841c20c90e6e80e64 |     
    m68k     |            gdb-13.2            | NOK | https://autobuild.buildroot.org/results/9df45fb5a6820799e344f335d9ba77b31ad076f5 | ORPH
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/fdafc1e2fb82b8c0caadf872b311a45a9212d7a0 | ORPH
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/b8b0cf69d22b8ca5fc74a5a8ffaddff8e165fdce |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/13f7d46d56fda009fdc300759f5089f67051445b |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/cb6a73cca72169f3959f7a10f4ff28c3ba885ebf |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/fcd6be197fd50c1071ac7e25d34309b50dbd4fdf |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/acf54814e9611769c271cdc28f8425c65110e8ad | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/1ba21aa1076e8a96ec0af4e619110183b533f690 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/ea633d8ae4a103769e57d96353d7d359cab2878f | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/d8af5fa8d37db33fe9b042779ed8b1deea4181b9 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/80a9cac51511696a9e55ae0c11d4a28c952ab187 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/8b8f8b6c5361644e30832d16294894a73767652f |     
   armeb     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/47978d83a130af1cd227c040136bf77aae8b6fdf | ORPH
   armeb     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/52887e3c6cad827375b3ec21c5f61dbbb0e4a3f6 | ORPH
 powerpc64   |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/12901dcfbfa195a94705fb5bf28de182bc1838c8 | ORPH
powerpc64le  |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/e1ccc54c37d3f771da48702e76badf3ec9dadfad | ORPH
   armeb     |         heirloom-mailx         | TIM | https://autobuild.buildroot.org/results/3245ce9fd2a1be99ad28782b76d3c8fdc09bcd0e |     
   mipsel    |         hiawatha-11.2          | NOK | https://autobuild.buildroot.org/results/01041733640060a2e85f0ed216c5e1b65b66967e |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/9ca0edbbd10272ca57f2d40f18433776c5d65687 |     
   xtensa    | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/28e4c32e9acb285bba812e63340f4e0f6016251d |     
 aarch64_be  | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/e797ed5681ce9682105144d542ceebeec940d818 |     
   s390x     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/2e507cf96beb0fc9da78ef911b7dc63eaae10fc3 | ORPH
 powerpc64   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/8df28c97c9434708f8401e12d8cd5849a488c46d | ORPH
   mipsel    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/aa759117963e712486c70aea40b9d533cc9f3220 | ORPH
 powerpc64   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/505fd69ddbe15ba72dc5eb2615351dcb1059e67d | ORPH
  powerpc    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/78b3531d974d656e058d5b4605906dafd7eb571a | ORPH
   nios2     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/fd817250979d0792b8c11f9b6acad287b61b6ab4 | ORPH
   mips64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/e8de971fc80f6d2d45e62ee9ceac52734fbe33d0 | ORPH
 powerpc64   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/4262e21572772643292fdeaa3003be4c12a54c0e | ORPH
    i686     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/de7a2d8b47686b6a64e6fbebcd77952449470851 | ORPH
   mips64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/1cf738087c0d260b04a9023cdc8cad4ee3ea70a5 | ORPH
   mipsel    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/2e122fe814312447f87944d9c5a99a6e1d7d4a4d | ORPH
 powerpc64   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/f5b65698e98d35c865c30a169d67ebc2b4c8c5d4 | ORPH
  powerpc    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/70606e998dbbf846ad43aead14bbd5306f79b133 | ORPH
   armeb     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/c2d65024d09c1877cc2ddd1b34d822935f3ee809 | ORPH
   s390x     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/ca4d3f17f1679885c05f4ca0dc7952efb2ffe45e | ORPH
   s390x     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/1c3b8e6e2cba9976ec748f556a5ec48c5ed1bc32 | ORPH
    mips     |         host-go-1.23.2         | NOK | https://autobuild.buildroot.org/results/fdbb6616611ca5737361709b3020b99cc318e9cb |     
    sh4a     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/32083c4e3f74f27c75d88c117cc83a9e18007100 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/d365d547c8ac2e6219b8b2299c6b4d3123684d6a | ORPH
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/fac47099db9ba655791cf29f3cd9fa6d9397f0a1 |     
  mips64el   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/6fd645c9000b9741ccf2c6d9fea88029a2fce5f2 |     
 microblaze  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/3588480293b4ddac785c64c371c90e4a4fdadf5c |     
   mips64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/fd90d414b7d11f7fd03e83cfe8c26ba9ed67cb61 |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/776d971164e430977282e1d6d28c9ad1eae255cf |     
    arm      |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/b788c1fa8cab5673a9538e815593510929fbc5ee |     
    i686     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/6dca29b63fd757d8d740efadbb3ae595a0d44f2f |     
    i686     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/e904f735a78cff77500c0818966e3e3cb5bab549 |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/cc194b95dbe6bc0c1f98e16045df9db54af6138f |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/83a34aea2cc1b75d2c0d0bfb9399713ce3ea2c15 |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/2fa14535919df405298a43899a5a03fa765cd383 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/1d23592a2712a2a0ce3fb7073a1d7fffd1ac2ca9 |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/4bc8cfbaa6d70f9d2719160f1ee1ee1f102f4382 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/c116aba97a233b17c1c6c7118c6573e5c0e6c765 |     
  mips64el   | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/6da346a20cb2ce944fa07293e88c8f4b8de81695 |     
 aarch64_be  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/47ddebd017dcbc007006dfc23165fad7c134bc85 |     
    or1k     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/81fd7ff4cfbe8da68328acf46d81da836b6c3a85 |     
   nios2     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/41a18e98594b61b8dc9c7fbc1c9cd5c33285ef05 |     
    sh4a     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/d35ac28129cefbc0dbd801175aa9c434bf3a114d |     
microblazeel | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/60f3de111240d9ddd3a77d1fe695798a97024c6e |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/a90b1363b8203616a5664b695c753ae970b4ead7 |     
   mips64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/e1aebed631bdeddc743ba54b12c9b151a8e84ffc |     
   x86_64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/70c1ff1ef7ab85874ef6232a1ebd3b116ba874a9 |     
   arceb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/57affc09dc467314401c9a4b005ac763b59d3415 |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/a002d23fef30fb219904e3dfccc7d4a98d3e230f |     
 powerpc64   | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/9fa705851c8a4a92dcff2cae25e6b9f05d947525 |     
   mipsel    |      imagemagick-7.1.1-31      | NOK | https://autobuild.buildroot.org/results/118884075ead577bfdc8528fe63d6dee1e645e89 | ORPH
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/59a52fc7957193464b11247953479e4a90444a96 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/63864dcb9cc3fcd3412f7c78bb3d71cb87962368 |     
   mips64    |    libabseil-cpp-20240722.0    | NOK | https://autobuild.buildroot.org/results/562ae8dadf6c7357f66d31feee762f2007e8ad34 |     
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/3fc5a6e292d243621bb6d88bad80232363071853 |     
    mips     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/4f97c64a63585ea63237578854d08e2a71507d78 |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/7a8d904344647564a9f261fcb737f4ff7a4a5dcb |     
  powerpc    |        libgtk3-3.24.43         | NOK | https://autobuild.buildroot.org/results/952b511e44068f4fd0d79c4061c9d1abf75d20cf |     
   s390x     |          libnss-3.106          | NOK | https://autobuild.buildroot.org/results/8b1718e785ecf56e3781eab656e1b8884f36d5f4 |     
  powerpc    |          libnvme-1.11          | NOK | https://autobuild.buildroot.org/results/c38c4201b301905af933cadf3324f6865c36ffde |     
    i686     |       libopenh264-2.4.1        | NOK | https://autobuild.buildroot.org/results/2955fdccf411b5f00d7396a72f9b77b0cdf818d0 |     
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/98a8b056e9b47820c7ab324b29a87bd1f04521aa | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/23a75c181c3d2fdee669d22cb58370c681c5c15a | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/287955f4bbbbd964e739418e326dea04c78b5b23 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/046ccea4912f712ef240dca1aca94edd7868a8df | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/4f1e91b075ac558483e29c58550145cb9910a956 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/f3f3912b17c076bb0aef1fa5a791785ff85339c3 | ORPH
    arm      |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/477c722430e2ce5eba1b83a2cb2b6cda85ca5558 |     
   armeb     |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/eed2f321af2f79e7582f8a6a5075e72e99afd79e |     
   armeb     |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/46717e3019839f5b161bc7af5e466ba5d03620b8 |     
   armeb     |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/cf78d5d6f3d7418f34bd1a3536de9d328af027fb |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/0ac04f8205da15eefa6ea2de82aa76a7f151ca06 |     
  mips64el   |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/5336cf4fbde82f1ddfdb26d77ee59ff444cd1c63 | ORPH
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/f1dcba4cc4cb05a882dce8b3f7218b59621dc3d3 |     
    mips     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/5bc5ef49ef0f74698b635379a691de96d6df41a6 |     
   mipsel    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/89a35a07ce9310aa7aa29133d1810ed62433d55a |     
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/3dd7ccf7421e57775a64299ea066959d9232d326 |     
  aarch64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/cae47e7abc1975250b4dda62a3a04de4ad4276eb |     
   mips64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/8b48a534bb9f9428391e3940e243d54fdeb32ef3 |     
    i686     |         libvirt-7.10.0         | NOK | https://autobuild.buildroot.org/results/401c2e88c5e2f3b1738060862d8ad98f5b874721 |     
   sparc     |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/ed06437810df6cc04f94e7882f410b5933fb31de |     
    arm      |      libzenoh-pico-1.0.1       | NOK | https://autobuild.buildroot.org/results/85a764698342a235c92661ecf37e22ac5da4c9a4 |     
   x86_64    |      libzenoh-pico-1.0.1       | NOK | https://autobuild.buildroot.org/results/8a36222d49423a3746876023c3b1b28a6247a5ff |     
   x86_64    |      libzenoh-pico-1.0.1       | NOK | https://autobuild.buildroot.org/results/09a290980cc7812fada32b7b12dc2d4aeaf464a5 |     
    sh4      |      libzenoh-pico-1.0.1       | NOK | https://autobuild.buildroot.org/results/3b41538ea38074153aa66ab2e17404ea622d6c98 |     
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/56ac019b581c1d4fe0fe1c706e97e85ab7df69cd | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/e30d0a405dc1c19585b9f833e86dee6880e17e27 | ORPH
   arceb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0e202e80b17d5d6d9d74355608504b4faace296c | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/e2a75bfd3f9ed6b4841aae3c7346e2a23cef38b5 | ORPH
   sh4aeb    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/53988beffa0b84ecd14a2371e7c4fb5da8b597ac | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/50bf508d5d23a4a0ba0546f300a4ae7c23bfeece | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/2bf1a629a374ac7e64afaaf77a27d1b3e635f7b0 | ORPH
  mips64el   |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/3672e78f952626ea0e2681e78b65155c81597423 | ORPH
    i686     |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/990b24b5481bee39bffd56e5cf535e3517d1c3bb | ORPH
   mips64    |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/8084d2eae0e487004241d858b90fb4567fc82b1d | ORPH
    sh4a     |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/2cad8a3d9b557b3818d0659b47600fe4db012464 | ORPH
   mipsel    |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/67f3233b7b6c0352adaf05c71cfbc3b82beac21f | ORPH
  mips64el   |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/76fb18d99af23b9d0c874ec0e16a782c33b3e85d | ORPH
   mips64    |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/b25993adf2bd97effe8e983e0ad4f202818c30e0 | ORPH
    arc      |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/87ed4718e87bdbfd704cb7b7fe128f26eac07833 | ORPH
   arceb     |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/e5cb705c7725276c8c65b3d5c811f1bfcc20526f | ORPH
  mips64el   |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/c68107e220ac2cd0605992fd43b55abacb663459 | ORPH
  mips64el   |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/0c5e1ccbef488502c9fbb8433b190f0da36e2eac | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/a8f313eb34c275c39fa645f8af461c8a269533cd | ORPH
   s390x     |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/ba609745b585c1a65c5a81e18259e818b518aa21 | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/5e8287fb04f59ae1a582037008ed9c47a9d3d634 | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/79877555ca12860190d6bd5f53bb4558b58db71d | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/d15e7c9428b936e5729f727fd073f63dc9047b66 | ORPH
   nios2     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/60f2bd3e230be92c8b4e9f41ca675e1f30440811 | ORPH
 powerpc64   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/643799f8497986a341b5b133daf0613a2ee1aa3c | ORPH
    m68k     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/634d0d4c48463ec67457eefc0056498eaafe764f | ORPH
 powerpc64   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/f407aefd24feaf93e7ca23f6868937f2089866b5 | ORPH
  sparc64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/7ea5fb688b5f2cc03223b59b4e1fba914c40b613 | ORPH
  sparc64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/35177b3ba58e3bbea556c8f93de1a29ef5e4e617 | ORPH
 aarch64_be  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/696d6ec41b506b7638cfa0ae0983076ca32a2dbc | ORPH
    i686     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/b3c185b39889aef2b457d48d6713ce0c45f3e15f | ORPH
   s390x     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/a45d95b527fa7b641a411516c14a915e91485fc9 | ORPH
   mipsel    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/32202635db22506173e1621c54a43b0fddd7723c | ORPH
   armeb     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/4f637a511ba3aee79a9aa90e9311724853cfe597 | ORPH
   nios2     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/6dbbb9065811c6694d4fc2bbe37dccf653b7a0e7 |     
  mips64el   |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/54db799556889d08fbc7a13b92e54889ee4262e4 |     
   s390x     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/5cf242adb009fd97eee6ea3d45c1cad4ad14a07f |     
 powerpc64   |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/188255368de99e59015df5b67b194e9e5e0066ff | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/3f845e7f72464f30998024a1e7c0fdac45e80190 | ORPH
   sh4aeb    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/79462bf12d182e557b87c85ddf1b69ada57ca6b3 | ORPH
microblazeel |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/8ddf6084ac9971f94fd0e688cedc4dcde4957cd2 | ORPH
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/678cbede937cfe11f1a17a3de7de917e2625afe1 |     
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/2d1ee23146b625b2bbe08f6bb850f4ebe96da264 |     
    m68k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/3ee028a64449f9127ffd46959f48ccdf18fed1e0 |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/10e4f3f6008af234c3e06252c98ffb75ebba7c1b |     
   armeb     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/cebde7e0c7311ed8d508594a8f6a5d65d2aeaeab |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/15e9dc2291d29303b24e2174f75775e258388e20 |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/ea06f86162708a2058a41f7d70505dd0a11b089d |     
    or1k     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ef300665892addef69f658c92a5c3781e1aaddfa |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/0238a368e45b41b7f3baf439ac3d92505def193b |     
   s390x     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f497483b863f488233970fc4c7f5d31e0ba746dc |     
    or1k     |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/cb35eaabd38c1f100296845ed7a7e9b7cab9211a |     
 powerpc64   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/db51df0aab23d87def016784719047d7706d4978 | ORPH
    arm      |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/f1195e76fee37afc47df262e41decc0b5a1e72ca | ORPH
 powerpc64   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/1cce8065b2fd32e618f5fb9ab086143898b44a62 | ORPH
    arc      |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/d138907a0dc6aa2f59a2744eef491f0144c6a269 | ORPH
   mipsel    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/da4832814b5e50e5dadd97c6c39c1c0899de4b21 | ORPH
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/b10d49d3d9a3be0b77ed8b5659a428db556f5ef5 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/480ab0e96df1fc598b3d9c023dbd83743014968a |     
powerpc64le  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3e053617b1f1ac1ebbcf676ad662631b13cd401f |     
    or1k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/40b22992efb611145e044edc778ebc72b66b957d |     
  mips64el   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/aa5181c315a7e6aab7ed51d606d95c82883e27b5 |     
powerpc64le  |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/ebbf28a2e45a4dc643e38dd165988b6316d74a8e | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/095b277712e771859b649fded7737547bc507112 | ORPH
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/edcc4970ccaaad5ef32f681f2292e54eab9ba942 |     
   armeb     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/80991f8b5c46bda013031e01bbafe8dfe9ebd2a5 |     
 microblaze  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/45000d66dbfab7d7123d20bba93e7f5027492b62 |     
   xtensa    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/b0dcd7dcb9c7d0ae299263eedfab819110db7238 |     
   mipsel    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/9558a68981aa810e078909d5b03c274bc99f3b7d |     
   s390x     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/7ba35b4bf0d29b457bc62e71bbf9c7a51b369458 |     
  powerpc    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/cce79bc9d37b93c5bc98d4ecaf5161ae49aef570 |     
    or1k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/826c6123df9815f4fc412550259d1b479585fe19 | ORPH
    m68k     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/a62580a03e97efb401266fb07e9481b6ad900a71 | ORPH
    sh4      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/43dbdff88baa9c282f10d7b5000cd39fe76a6349 | ORPH
    arm      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/bc77cc05a54cc891ca2d8fcb3ccfb3e8a13980de | ORPH
microblazeel |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/386ca83a9522c9ca87d4b324c2fc75200b3c6e72 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/fd0c49c645bb44c86acd2b1fa1f8ca7ba3f3c249 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1cd8da5d471ab125dc7d75b97c772e955c5a06ed | ORPH
   nios2     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/eaf5d6751a288670a774db3faf62ad7f9835065b |     
    mips     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/9916efbddfea4ae5989cc674da830deea6fd1b8b |     
    or1k     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/0888114978d038aaed8033e4e6958c5fcf6a5da2 |     
    mips     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/d433716335ee48b705dcb88c5088c0d890a24117 |     
   mipsel    |      python-daemon-3.0.1       | NOK | https://autobuild.buildroot.org/results/1b5cfe2f5b2478be0cdce8c48334a8bc84544833 |     
    or1k     |     python-m2crypto-0.43.0     | NOK | https://autobuild.buildroot.org/results/9aba29fe44429245dc6547da8ce0a5bdbf521e81 |     
  sparc64    |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/229efb3552220fd7ec30b5261f150de83dca6e65 | ORPH
   nios2     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/542583ae9bb954afb5dcc7db5aefb3c532efa613 | ORPH
  mips64el   |          sdl2-2.30.9           | NOK | https://autobuild.buildroot.org/results/4bb07b81626e9bdb448948cb19d5f5353c9e9897 |     
   nios2     |          sdl2-2.30.9           | NOK | https://autobuild.buildroot.org/results/07cdf382cde3a647d44261de1872cc1b21d7839c |     
   armeb     |        sdl2_mixer-2.6.3        | NOK | https://autobuild.buildroot.org/results/dce939df441cee50c3af80b6b42152edf302176c | ORPH
 microblaze  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/4e98dd04ad40544bfe32a49f7432c8523a4e5d0a |     
  sparc64    |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/6170b3ea6c21696d387ef59b3be0af37d1212713 |     
   nios2     |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/4f9afdf1d4a25aae5911fd0847a8d6c7ead66090 | ORPH
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/d0d43245e152f4c3015aaa72e14a6bfe6e4e3bce |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/eb167eb2fb8dc1891a01d839df9f8ec228f5528d |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/934efb95f422efdde05608978022bb5019201202 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/a185adf68ae6ba2662db0b2f64081b235a4f5d61 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/3aa1026bb839023f1a4049406eb7ae5d5b01ac8b |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/0e515f14c29b7902cb01998da78d1fed6fcc841e |     
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8bc7dbf4c007e5754cc2f7d81ac5615c125b7c2b | ORPH
 aarch64_be  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/6f4e430b1d68ae19b4b9675053a74fb63020cade | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5b43dc39226c6f9ff1c5cbd5a31b60147c78a206 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/11cd6a32e3c7bab6042b489816137df6fa76e983 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/41c52b1ca6394076e6fa9e99094207cba7a4ee96 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/7fb2cb990d96c2c785de1c702444f38c64ff9894 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8ea32abe6d921a87bafdc8719b3e03907a63ad57 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/bd123959ea4b1ad9bc28f7741213dc4f68bf6435 | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/4d3f7183bbdb6354db8339ec263bd49cf106ab55 | ORPH
   x86_64    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/7447cea681a5c2dbbb3114544a538d6c04576f83 | ORPH
    arc      |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/c591c795eead4dd959df477c90ff75b1bd46eb0d | ORPH
   arceb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/cf93cfa21477504e7276e38df57c3967fa0e3b76 | ORPH
    mips     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/0a3baa5ab3ac24540f9f3832b674be21d2d36d48 | ORPH
  mips64el   |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/e3e2b8332b912dba6f1d729c5c202e4d7fdca11b |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 1 
                  bind-9.18.28 | 1 
host-heimdal-f4faaeaba371ff... | 1 
host-prelink-cross-a853a5d7... | 1 
               libglib2-2.76.1 | 1 
                  liburing-2.5 | 1 
               procps-ng-4.0.4 | 1 
               w_scan-20170107 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/96c8ac792d5b03e8e6b82cf6b0be814d194f16e0 |     
   nios2     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/04383013b8d1e9e532becb856fb089004c8cdc8a | ORPH
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/66f558fcc59ab442c9ec1583f63e43dc2803e070 | ORPH
    sh4a     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/c05c8baaccffe1d46defe734aa61659acb6823c1 | ORPH
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/7da18e417626723d2e0bf4a9d20c174c2028f923 |     
   s390x     |          liburing-2.5          | NOK | https://autobuild.buildroot.org/results/9bcd301dfc46d4c1e0b88c4ba1820dba63abbd8e |     
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/88b3f8ea6976fe30a0a1edd314c5001db94fdd72 | ORPH
   mips64    |        w_scan-20170107         | NOK | https://autobuild.buildroot.org/results/63e4673952671a3b510aa38b5ec6644ecba06f0c |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                    bsdiff-4.3 | 1 
           musl-compat-headers | 1 
               pipewire-0.3.81 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/4d894f047fe1296971615d319d8af21b49c6275a |     
    i686     |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/599a3a51f76abfe94a6a0f8950f118fbe03ebe56 |     
    arc      |        pipewire-0.3.81         | NOK | https://autobuild.buildroot.org/results/effca1a075287a9e4256fc4a96049177c6158624 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
