Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AF7E6ADDE
	for <buildroot@archiver.kernel.org>; Sat, 23 Nov 2024 04:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 950AE42CBA;
	Sat, 23 Nov 2024 04:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8kjRLdhj0eEj; Sat, 23 Nov 2024 04:18:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3375642CBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3375642CBC;
	Sat, 23 Nov 2024 04:18:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3B701D8B
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 04:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 847AE60A5E
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 04:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id idWXPlFqPuPg for <buildroot@buildroot.org>;
 Sat, 23 Nov 2024 04:18:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B52B60807
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B52B60807
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B52B60807
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 04:18:42 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53c779ef19cso3481086e87.3
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 20:18:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732335520; x=1732940320;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=346l7uySqNQF6LJ+H9kDk6R8tyjPBPf0XxMexgM40s4=;
 b=TQYijmUuGkS07am581yqA0QN32LEps7qQ7OHTZkvXGbUL9ClywU84ZjfhSkHDLXaMU
 Q9i+2OJQPNOQ+Z47vibTcWAhPVgSRtdpPd/hHh0Bms9aXcRAyX4C19jRZ/VaHoZd8VuL
 87kjqOcWB+g7XNrpgNRE84X5yGNdON6ibncfWrFxVfv15PcZ80ptQ+vC0JWlA96UOfI4
 ol0rIKzmThadLEj42nA+JrvO4/+VCjTBx6r9lm9QFkKg28XUQM56+x/XW4r/xPcNQMqW
 6avREOdo4EICoiUFuG6FIjZK/u5nP9l6jz+coJv5/lEgPJLzT4AwtfJ6DAkN3tHn3Uqx
 QSUA==
X-Gm-Message-State: AOJu0Yxvxa5TKWHBEM5cceEbjY7dLINUeR3+LENyFETi/Oj7h0UyNfi/
 bJbRamOuUSalooJUN4pKdovim1eYUzngn9kScNZspyaYo+8SCfJhnCABGA==
X-Gm-Gg: ASbGncssg1k3pFtWAIKRMb5R/aRp+aMs5Y1HZSMTAeQxXFfrRSIG68n/GVJZQ3zNavu
 Ay2BLRxBuxMs3m+tqUZG1p0zdRQaEC2hDqapiFeaUHG9ZUtu/H0ae2dH4Ybou3Rt57ZVAM4secR
 aF81XVhny9JURiXtxm3/yYr9PPrY5yG5hnZPsSyUWULBbpj/lEbkKN5N5iywie//+iGQLOBmSah
 7p92oXuDJyBwYTDOvIDkjHQhBTiRUQJOW1H5bz91fR6nz2cHeibGQ==
X-Google-Smtp-Source: AGHT+IHPNa2KXkP0ZnpS/BU9PnO0gB4aJM10NEUY67iJyCs0qKd13Zs1sVbkr5/PrIZ02B6ZjUSzbw==
X-Received: by 2002:a05:6512:b12:b0:53d:a2a6:ef67 with SMTP id
 2adb3069b0e04-53dd39b5620mr2890993e87.49.1732335519134; 
 Fri, 22 Nov 2024 20:18:39 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b52fb87sm174603066b.95.2024.11.22.20.18.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 20:18:38 -0800 (PST)
Message-ID: <6741579e.170a0220.d1240.66d6@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 23 Nov 2024 04:18:38 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732335520; x=1732940320; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=346l7uySqNQF6LJ+H9kDk6R8tyjPBPf0XxMexgM40s4=;
 b=QjB2ztbaKmFVwawcCO9bJUq0Kgte3mZj0Ss0U70Py9KWX+fXN5mgpJ7QfsmMyy3xeG
 ds7Xt9fpyquxnRWYvHreC1vWHraa/Y45Po9SszmoCH4WGNFxcx2h8TVwyGIDkGPouuLN
 lribFZ/Q6+gc9YAw6xe7J4LYvZWGYaklqAxpA0jEVv0IBgKWxf2AKpbIJd72iaksDXNP
 YNaHw3Od4TEYQw94k60bLr4UhuGkVGLbju3k8DOCAXhWil1hFnzjHruRqotlhJEQgSUw
 sUDU+NN1VBLlgc45fqYyAyn6sfvtdrjZzFlBz3T9nTzfhgOWLr+dVGx3QputKtmdD6Y9
 H6ig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QjB2ztba
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-22
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

Autobuild statistics for 2024-11-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  4  |  0  |  5  |
  2024.08.x  |  5  |  2  |  0  |  7  |
    master   | 19  | 325 |  6  | 350 |
     next    |  3  |  4  |  0  |  7  |

Classification of failures by reason for master
-----------------------------------------------

           host-doxygen-1.8.18 | 20
              host-rust-1.82.0 | 14
 ibm-sw-tpm2-rev183-2024-03-27 | 14
                  linux-6.11.7 | 14
                   foot-1.16.2 | 13
             dahdi-linux-3.3.0 | 9 
                       unknown | 9 
             util-linux-2.40.2 | 9 
            host-binutils-2.42 | 8 
                lmbench-3.0-a9 | 8 
  gobject-introspection-1.76.1 | 7 
               procps-ng-4.0.4 | 7 
               pulseaudio-17.0 | 7 
         gobject-introspection | 6 
             gstreamer1-1.22.9 | 6 
              libopenssl-3.4.0 | 6 
android-tools-4.2.2+git2013... | 5 
                 c-ares-1.34.2 | 5 
   host-mender-artifact-3.11.2 | 5 
      python-autocommand-2.2.2 | 5 
                  bcusdk-0.0.5 | 4 
                   bird-2.15.1 | 4 
host-binutils-bare-metal-2.... | 4 
            linux-fusion-9.0.3 | 4 
               linux-pam-1.6.1 | 4 
                  ntp-4.2.8p18 | 4 
                   perl-5.40.0 | 4 
                 pixman-0.42.2 | 4 
               valgrind-3.23.0 | 4 
          linux-5.10.162-cip24 | 3 
     linux-5.10.162-cip24-rt10 | 3 
                    mpir-3.0.0 | 3 
                    azmq-1.0.3 | 2 
  binutils-arc-2023.09-release | 2 
                   crun-1.18.2 | 2 
          cryptodev-linux-1.13 | 2 
                cryptopp-8.9.0 | 2 
                  curlpp-0.8.1 | 2 
                   duma-2.5.21 | 2 
                elfutils-0.189 | 2 
            freeswitch-1.10.12 | 2 
            gdk-pixbuf-2.42.12 | 2 
                  giblib-1.2.4 | 2 
          host-binutils-2.43.1 | 2 
host-heimdal-f4faaeaba371ff... | 2 
         host-libxcrypt-4.4.36 | 2 
                latencytop-0.5 | 2 
           libfreeimage-3.18.0 | 2 
                  libsepol-3.7 | 2 
                  liburing-2.6 | 2 
                 libv4l-1.28.1 | 2 
                  libva-2.22.0 | 2 
           libzenoh-pico-1.0.2 | 2 
             lirc-tools-0.10.2 | 2 
              mosquitto-2.0.20 | 2 
          obsidian-cursors-1.0 | 2 
                 openssh-9.9p1 | 2 
                python3-3.12.7 | 2 
                     ace-7.1.1 | 1 
                acpitool-0.5.1 | 1 
                apr-util-1.6.3 | 1 
                  assimp-5.3.1 | 1 
           at-spi2-core-2.50.0 | 1 
                    bat-0.24.0 | 1 
             batman-adv-2024.2 | 1 
                   bcc-v0.31.0 | 1 
                  boost-1.83.0 | 1 
                   botan-3.5.0 | 1 
                    brltty-6.6 | 1 
                cairomm-1.16.2 | 1 
          cloudflared-2024.9.1 | 1 
                 coreutils-9.5 | 1 
                   cvs-1.12.13 | 1 
                    dpdk-24.07 | 1 
                   eza-0.18.22 | 1 
                  ffmpeg-6.1.2 | 1 
                    flac-1.4.3 | 1 
                 fwupd-efi-1.6 | 1 
                    gdal-3.8.2 | 1 
            gettext-gnu-0.22.4 | 1 
                gnu-efi-3.0.18 | 1 
                   grpc-1.51.1 | 1 
                 hiawatha-11.2 | 1 
                 highway-1.2.0 | 1 
    host-python-greenlet-3.1.1 | 1 
                       inih-58 | 1 
                  jack2-1.9.22 | 1 
      libabseil-cpp-20240722.0 | 1 
                libesmtp-1.1.0 | 1 
                   libfm-1.3.2 | 1 
               libglib2-2.76.1 | 1 
               libunwind-1.8.1 | 1 
                libvips-8.10.6 | 1 
                libxml2-2.13.4 | 1 
                   linux-tools | 1 
              luabitop-1.0.2-1 | 1 
                  mbpfan-2.4.0 | 1 
                 mesa3d-24.0.9 | 1 
                netdata-1.33.1 | 1 
            netstat-nat-1.4.10 | 1 
           oath-toolkit-2.6.12 | 1 
             open62541-v1.3.12 | 1 
               openblas-0.3.28 | 1 
                      opus-1.4 | 1 
                   pcre2-10.43 | 1 
               pcsc-lite-2.1.0 | 1 
                  ramsmp-3.5.0 | 1 
       riemann-c-client-1.10.5 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                   sdl2-2.30.9 | 1 
                  snmppp-3.5.1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
uemacs-1cdcf9df881440497501... | 1 
                 wolfssl-5.7.2 | 1 
              wpewebkit-2.44.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/95301bf5f73231e8de308c5c693ff52fbf22a063 | ORPH
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/c71944950fc8994de9a3613c9715f8565b984a7d | ORPH
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/865011c4c3cdaa03ffaa140bce13a00927cde4f5 |     
   armeb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/e568cf774bedc3dc3146b04529fbaa6519ff6fe3 |     
   armeb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/04010c391698a5a4e6d923d2c36e273418c9bb46 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/cb76600ce97c652116c8eaf1b7a49548fbba16ec |     
   arceb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/b983b49b3e12844f146dd61b733fa0b91dec932f |     
microblazeel |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/5b2e4911e87b303b152b09f202cbecaf3a086066 |     
    sh4      |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/d2f7f9712889c71b756d9d1fa7f1e2434ed11604 | ORPH
   arceb     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/1884a0af2dfb2209faaf61be2a652a258d301e99 |     
  riscv32    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/0635f4ae4709c49376e2073b61754acd31f4c50a |     
    m68k     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/5e295b26b428771cba3fbda99b229194365ff795 |     
   armeb     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/c9c1161f2f16a93aa13c52fc33afbfcd331a83e6 |     
  mips64el   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/876a4e35b8f8c12718aa6253c96147d0f1a9d810 |     
   x86_64    |          bcc-v0.31.0           | NOK | https://autobuild.buildroot.org/results/cde23a5c1099a3fd098c3184dfc843f083d2e68f |     
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/a1b733a71e6c1dcdb3cd863c9310118e921c32d9 |     
 powerpc64   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/23a3a544561e83667dc31f68f36faa13f8b884b7 |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/b199d01a8c25bf55b5e2296dd05b91ab0c4c4709 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/61306384c1f1e61115e2c5181ec267a9dfa7a593 |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/3d4563b6b6c07785149b95a1d2aad01ea5fbccae |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/5ad504b7e282fa07eaeba17cb67cfe01cdb3bfbd |     
    m68k     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/5dc16fcc5155d258f1ebb8240391e72696654141 |     
 aarch64_be  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/38ff68648c88a28cb840bedd2bf77c8b4a71ecb1 |     
    m68k     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/736b3f7a0b031c79f6034cf94df01eccda5126dc |     
   sh4aeb    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/b2631283d1eaf884443d9e0e71a831b21f6bd449 |     
 aarch64_be  |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/6a029482f267f68a0df20350fd09d2869b2d07b5 |     
  powerpc    |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/d0dee5c650082b9b2ce2041761df63f4eda79009 | ORPH
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/705a2c9b123c92daaeaa1603f53f3cdc6e3be660 |     
   mips64    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/d138f050d5bf4014b8eddb7fe15df43295073a76 | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/49712b544e9d874147af214da384e3fd0bb9e1d3 | ORPH
    arc      |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/5d2b737e20dd013f7397ea9d6c35394bdf333a3c | ORPH
    m68k     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/ef929a63b885c581a54de6023e5a3fbe9c17e6dc | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/580098786730485688f01db946d10767b8bcbd93 | ORPH
   s390x     |         cairomm-1.16.2         | NOK | https://autobuild.buildroot.org/results/371162bc52f286a34f8174d370aab95de7611bb0 |     
    i686     |      cloudflared-2024.9.1      | NOK | https://autobuild.buildroot.org/results/a24edbe28f6ca225b10a089b88ca2a743e13dacd |     
    sh4a     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/7c9ec4b783d9b9bc147d04fc885b8d95fc68a919 | ORPH
   mips64    |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/1e365077bd26852ac3a2ebd7406ab51ed0f295db |     
    arm      |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/029ba50cc98b49437e44e6544eb64167485b1f72 |     
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/6e20a6e90141d0c14e59bb25588fbd6762340949 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/47c198569b72e72db4faaaecd04214ffd2b1ee3e | ORPH
    or1k     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/fcbc3f7c6d5f0af5aee2d73ae89ae1899bded11e |     
    or1k     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/8b20bdc518f8787da2e9541af83443c68ac044d8 |     
  sparc64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/38618d220d94ee4b2f0e3fc7ea4c2882339dcba4 |     
 aarch64_be  |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/386a3413ea20c2f2d7c4facf67ba30eed9e2c95e |     
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4b47965c5e5913a7e76649bdc102ad88e67b878f | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/07103b9ad8362e3e54a2bf0c6148d6bd01fd39e1 |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6b8461e10d3256c383a60f3e8df5e388ccfc5212 |     
   sh4eb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5ec1809865ed2925f331261d87f6c11d6ce85bc0 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e5de48ce85170cf02f2e83e969c7d1fd5911eae8 |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/da391556e59e6e360ad58c474789fcc7dfa14d34 |     
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e5f4773c10ef5c14bf9db633b34d81c440d3b9be |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/13016fa2b19443bf59b699b28e5c5b818601b6c9 |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0296edae5210b7b12fb057b97791317ea4a665dd |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5258bd97b4419660ddac75fa4af7daf9b58c839a |     
  aarch64    |           dpdk-24.07           | NOK | https://autobuild.buildroot.org/results/1bfd49278bb44e1c75f31d433e61dd36dbd330fd |     
    i686     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/eeaa2346d349ab8d69d0218eac0458334fa4d6be | ORPH
   mipsel    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/7a6e79a81cfd92048841754c841977df5c18696a | ORPH
powerpc64le  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/6d46296f9f28fcacc2d0c70d62da066993f1050c | ORPH
    or1k     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/fc1949b2ee07e67a24af0471cfcfaa6f49ce15b2 | ORPH
powerpc64le  |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/bc2d72c0a13a232e14ac6aa2c216a5709b975db0 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/1e479a86253ee39258d0e341a0f62328844fe69b |     
    sh4a     |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/f2cac9a8f9c70c756ad4a49d1afd27afe76ae099 |     
   s390x     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/4ec05ca64469b26b6e70c60f70d1e1a72a4d9f18 |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/8e8ee07a13704ce5bc4d7df0942f670f0d1f8914 |     
  mips64el   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/81fff60da51d9be8335c713d5f126f15c7f2cef7 |     
   mips64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/5a9f12e498168816be39d655e222fb2298c76e19 |     
   mipsel    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/f983455f5756e68773aea5f175a9ccc058b10bf0 |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/b75d231fed89864981478d553f1231732239229c |     
   mips64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/a59fba027f9e4ef00a47dffe1702d2313916d9ac |     
 aarch64_be  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/54c79c078d512764c5d258365d15c22cf9e92fbe |     
    mips     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/b595d14a9cf65a608cce159a9296f2b0cba3b84f |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/c840c3e5666f2350b93e90e35333c63978c270e7 |     
   mips64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/c9cc12d175a0c94de0517aaa5727cb703f69f0fe |     
   armeb     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/ca97212a82e93ea908d742e92bf854cab5872a8f |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/ff37479a4fed239d1962574fd82b5ae8d2442e93 |     
   nios2     |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/646813d753a83a26dbd8bb997b7c07431ef4145d |     
  sparc64    |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/039a3884541df336a8070bda361e2ebc2a7b0a88 |     
    i686     |         fwupd-efi-1.6          | NOK | https://autobuild.buildroot.org/results/3b565492ed5183ee9b02252038cd4b7f5b701a53 |     
   nios2     |           gdal-3.8.2           | NOK | https://autobuild.buildroot.org/results/b7b90e27c6187f873eb0868f627f04d7aee02275 |     
   xtensa    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/13414190367e4a25f85866b2a6a8feb4a21ab12f | ORPH
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/8fa798c1964abbbfaa50f3833b1706d6c3b6d77c | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/6a7e15aabc31eb6b3af0f485effb6db3d80e2cc0 | ORPH
   mips64    |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/767f9f56ab61066032093eabce30ff990c33d19b |     
    mips     |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/b4d74be0b18db5f61562fab254ce3ed2aba291f1 |     
  aarch64    |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/b2b69859b195c678cb7080ca1f988dc649e8a930 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/eee3eac103c8d6862634f7cd74c48c3640be4a80 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/f1fe32acb3231a348d0ccdd0752f87b5df3a1eb5 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/5a4c2cca598939614a542102a9058a8e786c2dac |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/0bf78883ac5d1fa3be0d24f8287240848d1d9b87 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/0a28f47902c02429f6aeab60d36a0cfbddd58c80 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/eca1ac2c6c5d974b597ba22a75e7c92ce6f108ce |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/586ce31dd4d08752a78ac65066a22a7900c52d28 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/caabc06db3f97e8c2fd8aa3e49b90d9568099e58 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/ada4f30fdebdd3013b1dc6b4533277dcaca65af2 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/8ad1a2dc652759a6fc18defbf0275c43c63458ed | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/91c39f23d04d833467412b57185cc15b60008cb4 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/8bd29eafecd37858396e28efb1ca267101e601fd | ORPH
    sh4a     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/454c43937d6c3840be4bba4a80645cd19bf37b6d | ORPH
   armeb     |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/78c7ea4a5e22d9fc4ca6ef3bb0ad82e4529e6bce |     
   armeb     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/dbb57aee4593bf9c48df985ab9286806c00a2c9d | ORPH
powerpc64le  |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/deb714f2c2c1251884795af711c926159912f37f | ORPH
   sh4eb     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/4a14be4e0de8e0fa209a6e5222d2a9b827c64783 | ORPH
    or1k     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/7292e79ba38714c25a3bd091fd6a8d8e9582b178 | ORPH
    m68k     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/13f57a7ed953c56a611aba7497213261bd7dcec7 | ORPH
    or1k     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/2908fdde45e8de208f5f48e706a178fd17a287a4 | ORPH
    arc      |         hiawatha-11.2          | NOK | https://autobuild.buildroot.org/results/312f46c5a191df6c28c09b2ffdc43b204742b57e |     
  riscv64    |         highway-1.2.0          | NOK | https://autobuild.buildroot.org/results/a782d373c6aba175f31bbe2284e25fefc80036df |     
   xtensa    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/1687ac035b13e2b9a26ea82b77df4335c74193aa |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/8c6b7958588c4cfac5306bf8e5ea86f30e506753 |     
   nios2     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/df540c0a6db301d92c890432e22d6c323bd160f0 |     
    or1k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/e03ee8fa7aa9f994e0da26c1afc08037902bdb6b |     
    or1k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/6a9c134053bfa263393dee5cd054f4c13a24f214 |     
  sparc64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c1ba96cdc1555532e256d996e25d0d9f3165b742 |     
   armeb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/7d839f34f8dcd6d6c2251753535da0fb97deb958 |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/65449a321b9ddd413b4b9598b1a08be4535c5cf4 |     
  sparc64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8d94c21cd3b06df5e0c34c03875ad8a0fce4e786 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9c0b9cbb70ebfc3323b765c34dd4bfa86abf0b39 |     
  aarch64    | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/1d62bfbdac8ef210e0ae2c5453a0498098c72f51 |     
 aarch64_be  | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/62e741b6d364ae55a4ec72d4cb3fa9039338d348 |     
   s390x     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/cf7fd000cebae26b4d367f76359a6e6a7575414a |     
  mips64el   | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/1ff9098b52f3a0d9c7b56bb424ebad0c62aebb66 |     
   armeb     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/6ffd9d69252dbd77e6af6229cd14be434e19d7db | ORPH
   sh4eb     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/3621ee1a4da2808f8495ea2625194dc79351076a | ORPH
powerpc64le  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/9e6c00c0a70c9e0708cedaddc01480e19988f72f | ORPH
powerpc64le  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/84f1b433b13295ea5f7328d51ebdf3d620c18b17 | ORPH
 powerpc64   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/c94adf0b90a06983d01002832e30ad3d237a2e08 | ORPH
   sparc     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/6daa73f50bee88c4b3a3518bbd42469d73a5faec | ORPH
    sh4a     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/bff2eab73dc2cd90ff2870e6023fa5a0c7d26ac6 | ORPH
  mips64el   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/06a31c431ca2210930d11d7d81d93c5cd7cc27f9 | ORPH
   mips64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/19b6f4e5f426ecf0061cf2842888f3a5e66e3b30 | ORPH
   s390x     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/253450bf374ce858fe12712059c435fc773d52f8 | ORPH
   mipsel    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/9b8a2d45050f051b2ea39c35c35a29467f852e96 | ORPH
   mips64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/956501059aa99a39320873262d9ee4d405846cdd | ORPH
   mips64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/14f7b51bff02aab3477a5622d7707bd586a9d234 | ORPH
    arc      |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/8558636ced9c50722a3a0ae50ca816556a0aceb0 | ORPH
   s390x     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/2296ca31008b7b85bf007eb841b1b04e73c26a07 | ORPH
    mips     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/be13ad153166985df7044a143d2070e43cb43799 | ORPH
powerpc64le  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/2b48de9cf55b4493437cea127c2d366da7c15f1a | ORPH
    or1k     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/810aed3e1d7c584837f167af390b2fa487419f9c | ORPH
    or1k     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/783af04cf9f0389b9b70568041c7c1ef95c7ad71 | ORPH
powerpc64le  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/57d1256607fc21ba9d340588ef5129d066930997 | ORPH
   sh4eb     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/a2ac3b000d04fc16301c58dcc102258c96c04267 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/c80df42c44933578aae0355debfa3b2535cf2cd8 | ORPH
  mips64el   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/23c2b596747f9f132071cea11a81c23d5e10cfff |     
   s390x     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/5c46c9f8248ae8935dddac69f2a569aef85e59f5 |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/222b1093fbaea10a82926cc50c81778b7c70904f |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/b26bd5d1f84ff363c116885e75d44baca163dbe7 |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/76d74229c61653526dc2df9c57976ce4a961db50 |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/acea35051514b0d76ba360ea8869017cab0da776 |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/285edf2a722ae3ef61d7f5d0139c6d34cfe5b941 |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/7c4b8986236c692861594236fef1a0a97dc845c2 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/510672974cbb0f5b26d7b08f4f58fa167d818f4c |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/53f78f36a462bcca0366e15adce085d41031ae94 |     
    arm      |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/2f1f814f373e35236ac4a00899fd83e40a5bd2c0 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/ea11a8420a12b0e6a34bbda676de0485ee852223 |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/0a793312f9b99ca9173dd6a2286b74f540317ab1 |     
    arm      |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/516f358d77746b42399ad43254552d856e52d6e1 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/84253678b58eaf7906276e9204435965ed8342a3 |     
   armeb     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/da9b81606eb50360d9a64a2036908452e88ffbe3 |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/c201282993b7d6bb29fce8a2b92cdf27e7a16e82 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/238144f6c968239cf436ba8caf1756d3942bd47c |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/b385761d39d7fe126246ce4e982e5c20c597c01b |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/4d4496dd31e2ac2a3eba1aba3ac8bb8a1e631342 |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/efe7c3895ae72189317e8b4b227e35c4981eeb5c |     
    i686     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/fbc2c21d2a857ca6d61f6393da0c5f80ee28a300 |     
   mipsel    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/46607ce58b1c67974659417ae89f4f74d4fc7d57 |     
   sparc     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/3ba924b4e7fde6775a81662279af83d7d40f6c44 |     
  powerpc    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/d01ae0bdf97e2f22ef439bf2910789b322d0d955 |     
   mips64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/021610dce52c825bcc57b309aee15e286e7308b3 |     
  aarch64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/5a3cd8d24ccde4d4f96f066a99d97bbbda6908d8 |     
    m68k     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/528b5b6b7e2d82208862873aaac91f75bd14e85d |     
  riscv64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/992e53062c07876bef47b707d6f2f9f4b316ea5d |     
 aarch64_be  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/1a7a0eac3b11127c12bbcc76fabdf1f373f7a4c7 |     
    m68k     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/7b26ebac9c1099ee0fec4a3b515992d2fca657da |     
    or1k     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/49b8ae2156d157f4dcc130848ed52e4c30f088bd |     
    mips     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/cf23c21d3994cbe555527be5f92850cb26f5fe1f |     
    arc      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/b28880a2610a58a20798924e02850eb7788f21eb |     
 aarch64_be  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/651d88d76b1e1f61a0cff64a71e712edcda5be99 |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/fdadaacd17eee7dd361df08b7a783d1a1959462c |     
   s390x     |            inih-58             | NOK | https://autobuild.buildroot.org/results/b89d04911c6b7948e3df79a7793386f6fdc49f07 | ORPH
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/a793a1ec24b06d8f93a72eb1b943135d8a8dc588 |     
microblazeel |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/a1d3530b4d3ec7216f71a31a0b49cf22a78e6d27 | ORPH
   sh4aeb    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/a2ffadb4b92cc37ff1417e5d2d2d5026ebbe2045 | ORPH
   x86_64    |    libabseil-cpp-20240722.0    | NOK | https://autobuild.buildroot.org/results/b98eb4a552b2d2c7632775a09022f5fa1723ddfc |     
  mips64el   |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/d75f5fe6b28f162aa2eb73023851e1196e8748a6 | ORPH
 microblaze  |          libfm-1.3.2           | NOK | https://autobuild.buildroot.org/results/a17711cec33ce146346cb00b0197ab6f0ec10156 | ORPH
powerpc64le  |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/b0c80a1a962225247a381c6313454236fb16cf51 |     
   s390x     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/7809491564babe8a5f844d3d60bd508916e615fa |     
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/d633613d970f0f10f59e6d5b23b256eb9174eaf5 |     
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/7e2928d33ccd956f1cef3ca65e2cceebb17f0bdf | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/4deb3ef93e48735d00086208dd58a6b53eec125d | ORPH
  riscv32    |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/2184714a369175b8af4c60f468ddf710a372fd50 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/3aa4bd2246a5374d11111a4d3be6f35a444a1c0e | ORPH
  riscv32    |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/a08d751eb4e40bc2f7540988194140d780977fba | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/c8b1ce3bc48ce6defa8bc88097307adfffb14293 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/85aa4f720e655f07c94b9447ae6c7d0a432f39a8 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/e767a87b801fdfde6a4984167a8ece25c98efb0f |     
    mips     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/335cdd4106e2e03137339a094193611323436b37 | ORPH
    sh4a     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/45413db95323da20a6fb30bddc797b53be3531e0 |     
    arc      |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/6f0306be95a912f2377071eba8d3d0f68ffca9a9 |     
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/04113204d88130b2d659f421baf9445e51e2bd06 |     
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/7dea5aac91ec3ca308903cac7563969666edc662 |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/72e015c6debde5585878771d60720ed5e8421f85 |     
  riscv32    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/58f0381593a64ff1a4f8ca715ec2995a8f08a26e |     
  powerpc    |         libvips-8.10.6         | NOK | https://autobuild.buildroot.org/results/0d7553db155da361a8c0d2a8f962efb55af43533 |     
   sparc     |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/e9c657fb55158a14cdbc305046f9810a2bd1f186 |     
   x86_64    |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/1e4f0fd8bd19400860a9abd08f78859ae193c98c |     
  riscv64    |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/48b46a0992e1d4169e3d561f69f6c48ed977a674 |     
   nios2     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/b29617f70d1cd0b19c7f5f796c01474c1dada840 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/58470fb80df416be33e50fe6e988dbc6fec569df | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/0c4ce8ede86062827d7072cde79e13acdd352c98 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1706a40e73dffee8c7726e0a73a797b4d73dc4b5 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/bfa55c4903a3822e30160854d98b36fcfae74533 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/abd46b33f820c374f910156ec3efe452b68ddb57 | ORPH
   nios2     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/2f5b82cb72d2639c6fa972801f71f1d89ebfcb5c | ORPH
   mipsel    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/3de855d5336cbc9e01e5f116980391da82fbecb9 | ORPH
    mips     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/27473e6e4b8eeeef020c983041f8fcfcf2d8c773 | ORPH
   mipsel    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/488e2bebde844f11e3ac5ffb64ac38e850a10418 | ORPH
  powerpc    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/4307cfc9aaa13f5e47e29239f5b7b73b343c3d7f | ORPH
  powerpc    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/8abbf56f556bb2eceae8afeb17b46a9e6510f638 | ORPH
   arceb     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/d105d3d59e4f0f8d321fe33d47872e16c3d96a32 | ORPH
   nios2     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/df15d7872310c943d846ab7fd2854a3351a17af4 | ORPH
  powerpc    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/cf38434dd27e0a0aa49e4efecdf49f3d5e6b18cf | ORPH
  powerpc    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/c6fa1da2d0dcc94c87772daaaebc6576945f7000 | ORPH
    m68k     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/3d59ff5f7cde611f19419b537607e0fbdd97a16c | ORPH
   mips64    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/8d63a7f28474a0bef8ac856591f8cf874afc95fe | ORPH
   nios2     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/f8ab800850ee88abbddfac391cb75a09b87133a4 | ORPH
  powerpc    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/a14ce0d97344668e9d106e89f9f8a224972dda56 | ORPH
   armeb     |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/a427e55fb938bda97612e98a4064be4bc8174cd2 | ORPH
 microblaze  |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/9f051223311aa7d13d51f8104464c9933daac82d | ORPH
   armeb     |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/c98520658433003cc6f0efc27de2bf8af5b7dfed | ORPH
   x86_64    |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/28c578b5e0ec5f2971f033a7cf433135f282e76c | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/37e3d6da83a2c3c458c59098ea73e77a241fd951 | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/23ce0450c801140faf2a29f612160a01a0a033ad | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/e6ab6b9ac24255c0b613161b92bfa201bf385622 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/14bec62e330ae2eb2c510b92753fc3a1eae76b82 | ORPH
    arm      |          linux-tools           | NOK | https://autobuild.buildroot.org/results/aa67629e0c2bbcd1b0fe4081447b7032c4599569 | ORPH
    or1k     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/c3e908f6f351112061397d46496eea00a9270d72 | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/382e3f283037468abbf3382891a57b4a3452ef88 | ORPH
   s390x     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/31b08bd6cc8a7c9bcc094e63c7f6a42bbe85d4ce | ORPH
    arm      |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/b7e7a65a76c1da976b26c1edd6539e392fb3cf0b | ORPH
   x86_64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/e50a1cfc2e1b1a595069ccea154eb7aa83c29246 | ORPH
   s390x     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/dd47581e754fe45544909af6468bbc436aaf972f | ORPH
microblazeel |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/61f0565d95d190c4cd140aa66e50fbf86ec418f8 | ORPH
 powerpc64   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/b0a5273b7c22ff54a180d960ebec7ce58bcff5b2 | ORPH
    i686     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/51558c3a7deba2bc75954cf23f6ddaaa8d002fd3 | ORPH
    mips     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/621db41469fc0be8d513a6ac73c54b9b2a17249e | ORPH
 powerpc64   |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/484c22239a63dc03fa91aefe34aaf73459836b84 |     
   mips64    |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/0bcdbc7a38e482a4e1c1e4f1a0b5c5f1d5f3d262 |     
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/335ba0c09cb6eef364eee2960f530480b2dbc635 |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/c53d3d7fc45f7c922ebc7b88295242e38a1f9723 |     
   mips64    |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/0cb8e2dcee51007ee09506fa143e52cefbde5335 |     
   nios2     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f29532bcff2f789f3100f42e6afbc87e779fdd72 |     
    sh4a     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/5a91e862f8787c7bb12e73038caa8db3eaef38a0 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/657854d2533d59a0295d8daa3cb402f16b1006df |     
    or1k     |         netdata-1.33.1         | NOK | https://autobuild.buildroot.org/results/f8ac39c3a2a941a51f84cb7b624527d05efae89c |     
   xtensa    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/d485d38648d2977f55d5bde8a30f28cee1d54c8d | ORPH
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/4fd6167cc2fe9e8ae2f09235c1a89952263fbf11 |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/cf9791331018b47aedc15dc3cebe29f8c7606b8c |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5cf988ecef572a35e5b0d50fc0ee309d0e54e4cf |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d52cf323da39c7bcf84c81c74b599c561b46ad7a |     
   nios2     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/458610e77c3de8b71ff3a580aff421d30d41efb6 |     
   mipsel    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/b8041e852529a14576287738f4c425c60e143d29 | ORPH
   armeb     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/d7e4140d541d831a54db468faf4c05232915c386 | ORPH
   nios2     |       open62541-v1.3.12        | NOK | https://autobuild.buildroot.org/results/2e0aa11fd8df0197eb27c17a53b454bc856fd204 | ORPH
  riscv64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/aae343a8708e1e3457211b672d616f68be9b6b3c |     
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/340d17588fe0edf8e0a3f1fd4107e1aa098da4ec | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/30bb7ea097325ee2e72ebc546384d26a97c53bb7 | ORPH
   arceb     |            opus-1.4            | NOK | https://autobuild.buildroot.org/results/d213ffe643f4de1957b98243f73a062a9f90a35d |     
  mips64el   |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/d4f84f97003c6bdab77136441c389d4e34254c07 | ORPH
 microblaze  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/c73edc12561d8831f7a4a87ff8042d337be8089d | ORPH
   s390x     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/a155f1882511e16034cb8bc61a622826e534032b |     
   xtensa    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/d3feba0d3aeb9175dae709b98e1496ce42bdc534 |     
   arceb     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/595f41a1390789126264f30f90b8e08c309d7062 |     
    or1k     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/114840f8a6ca2b5286085dd3f469dcf1708873d8 |     
   mipsel    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/c8f03989f095c27180e4acda2ee28b936d00258e | ORPH
    arc      |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/53f621432a8c4bd19a86a85696faadf1016cdfc3 | ORPH
  riscv64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/95c9ac09adc9b9b788d355556f5f6074f2f92f7d | ORPH
    arm      |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/74b3f2faef2059222c9b2a5caaab69966f05b813 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/622a902bf6603835f759dbab0bbf6c91dceb7a68 | ORPH
    i686     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/9584db335ae4dd444fabb625e7b3fd9fab4c9617 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/82d5c1dd662197fcc4155f60dc73b877f6e3bc1e | ORPH
    sh4      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/6afc630d3f7a997e9ef3ccac8a3ba9171f02c635 | ORPH
    arm      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/65fff4a57702c024c85455daed13719e860f2b36 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/2f9787a92a615d07e6ef4d158c1aed3422207e53 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/85d588d5062e1e8974f8bfb2a0054cddd2820978 | ORPH
    arc      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/ba1f8f8e91ea5b16ea850f2d64c9e90a5721c860 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/25f1ca104be1203eac4737b6b8261f619c216eca | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/80b5817107e2a423c45f604db3d9153d209ee628 | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/7a936d762e2662354275f4ac6d33ee4e2dfb2519 | ORPH
  mips64el   |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/7c7632d4e485f724164a39f922df5da2ac9d5d28 | ORPH
    sh4      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/3df6943ba6b16fb250c256643bbff1675a6bd1cf | ORPH
   sh4aeb    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/5a5be9099be659b47a625946fe791842c54695c8 | ORPH
   nios2     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/a4883cc29838453c52048cd6cff9137cfa78b4b6 |     
    arc      |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/ea5fa80e0ecee18abd58a6aa0a70a9299b7991b1 |     
 aarch64_be  |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/1218217717b84b282d7f6f8c367d65d7958db753 |     
  mips64el   |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/35bff7ec01264f47779063c292c998cdd26499d2 |     
  sparc64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/28eb2403603a5899304fb5cd7fb291a885b6185a |     
   arceb     |         python3-3.12.7         | NOK | https://autobuild.buildroot.org/results/e5a5548b3dc96d2ca0afb1d8af2eeb0d210a6f5f |     
   arceb     |         python3-3.12.7         | NOK | https://autobuild.buildroot.org/results/e1debdbccdeacc0b11b11e585ba90dd60d0c84e5 |     
 powerpc64   |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/a4ec2c2d64096828f55b0c85eb4ea319a86ab1a1 |     
 powerpc64   |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/88508e196dbbf4df51cef1c365d1e40a821ef173 | ORPH
   xtensa    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/e03fa6a40778bb364c92f783b3105e3dbd09d60a |     
    arm      |          sdl2-2.30.9           | NOK | https://autobuild.buildroot.org/results/1e827bebc17a9ec196dfb50a0429e8c6f3562478 |     
 microblaze  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/45279ec8c3724271a5a6f654cbd2fffa15901953 |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/0d27fef711d4e581d14a4fad5cfe0cd77336d11e |     
   nios2     | uemacs-1cdcf9df881440497501... | NOK | https://autobuild.buildroot.org/results/2d8cec9f64e60ab4916af71de3f169a688240f3d | ORPH
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/1f4f2e38a830aa2b8ef081d73b3f4c4ff730b8e8 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c1e61cc6616175efd3a84a18101d8e02d7e89c9e |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/a2db539be691171c754f45c0d3bbfdb92a4f671d |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/e7b52d9a8ad0198913311eeba13f06a0d7dd0442 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/9ef8e5c71e27b9b51ca83c3d147b22274da69b68 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/cf4f15330a7ba4540433a795fa5f3eba90c8251b |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7b3f8bc7ab0c49debddfadb25ccc2d6b75414b63 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/930ab7d7a232da773cd49a237e6e1452f97409a2 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/f90ec22329496b2ce3026eee75a56748a6caeaac |     
  aarch64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/467ca5fbc470ca32b59fca33be13025565b5487e | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/16e7a62486dc13a9b3fdefe05b7bb80975b91f86 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/59c5bebd18fd3fd433a1024f4fa18244d059c4e9 | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5cc8defcf4b9b598c5be45408aa82e91ce6aeca5 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/344a8a2902632d23a8bb90c9e0723454e2c80ff5 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/48ba8bce3391035946571303475fb6beda8dc8b1 | ORPH
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/cd3d153e211c54b7639d967ab97394e7de293604 | ORPH
  aarch64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/79f07d65f0e8d7f17c211fbd5f44a968bceb8633 | ORPH
   sparc     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/1f89acf67c907725ef8470551a26a70a333b6de9 | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/eefc9c4efbe427308dcaad375f2e258c935cbdd2 | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/3f26e256252b2dca474a383a4e59271a22ce12ce | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/d82fc3b3a91c8db5817d8cf945ff7be8487af79c | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/224b9ade86a81793e01ac4f1b2f4bf66072bd63b | ORPH
   mipsel    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/28935225f20cf80389a418083d4828480bfd6c94 |     
   x86_64    |        wpewebkit-2.44.4        | NOK | https://autobuild.buildroot.org/results/9539b4a8965a2928de91f36cedab2355dbd78524 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 3 
                 x11vnc-0.9.16 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/7a1d058ebefd110b2994c340afbb5aa78ffc1821 |     
   armeb     |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/7f42ece3bc26a517adf043374b3b130497a15f13 |     
 aarch64_be  |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/715e4054135c3c07735ab7538b9b37debbf6ac0a |     
   mipsel    |         x11vnc-0.9.16          | NOK | https://autobuild.buildroot.org/results/37c41a0df7566ef5110b80c926846b176b70857b |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                 hddtemp-0.4.3 | 1 
                   linux-tools | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/593bb5fcf2cd4d7d5a013f368427242c49a4fc98 |     
  aarch64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/dfe4ef432f8f764c482805db62ea718bea72a4ef | ORPH


Classification of failures by reason for next
---------------------------------------------

                   bird-2.15.1 | 1 
                lmbench-3.0-a9 | 1 
                   perl-5.40.0 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/099d57dfb4feef1930beada62ecc20d11e6a2472 |     
   arceb     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/4f661fb65ee15e315cd8d80aa681725a1d87db16 | ORPH
    arc      |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/3c552ec9a9cf45241216b9b258f434e8d664f2d4 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/f721500d89b98228af522f0a59e3cd7d2863237d |     


Gitlab CI results for 2024-11-22
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435253857  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435255320  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435255322  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435255323  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435255392  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435255394  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435254786  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435254798  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435254970  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435253951  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435255021  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435255031  | ORPH 
               TestSQLite | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435255047  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/8443352855  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
