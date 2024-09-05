Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9AFCD4848
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 03:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D81AB405A7;
	Thu,  5 Sep 2024 03:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABv1wF5zqYrZ; Thu,  5 Sep 2024 03:17:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F72940493
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F72940493;
	Thu,  5 Sep 2024 03:17:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BFCC1BF3F6
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 03:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E8D9608E6
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 03:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SkigrBMGkvdv for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 03:17:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 86B58608E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86B58608E4
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86B58608E4
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 03:17:08 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42bbd0a40faso1814405e9.1
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 20:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725506226; x=1726111026;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=072y20lsS5T5TyUtYs9prGzRgrJCE9arNN8ELFCiPEg=;
 b=xPWsmcjR/mPue14QG0zkfU6yRza+w2uWQ6Dc5/pGF3Fys1V7v/L6snspd1BqKEXj5l
 SiH20A7Js2LT+HMi3prCu2QA3qx5Ihdrfc72AnzdO+rQZOEvsoyuRbQyJPWsmRldXMNp
 tmadu8XhQNZvVpSy34t1RubEDuU01WtSItqVjThDUDN4BDDdRwoy8AGvJCsnKlJAyO6a
 l/DkXno+yaGqSPRNo9wJ84ZhRyVeH5aF8Q+6EBJDVWC/sRNoYWzzD0sQ0gLz9u6dxsjU
 jeIKrJDxMKhrR20NgLTN5MRaCc0UY5xH1+vjyaXAeadYpAh0Mxt409zTQSW4BwZO+KMr
 xc7g==
X-Gm-Message-State: AOJu0YxX8qbcQmdHuhpQOHOABk0edBnuVs1msOyizSC6lMsUZSs0MD7Q
 9ONUBWa+sePblH0x6iN2GbsihXZAkFpnihVeoSDZd0Cmt3npnIgIFiUZNA==
X-Google-Smtp-Source: AGHT+IGjoyFyLugjvHLm/rNzd9gWnudg5Nbp2LTx6gJXe8gibzHYVyvmXKJxlVukhvFPhHSHBMxMcQ==
X-Received: by 2002:a05:600c:3b08:b0:42b:a9b4:3f59 with SMTP id
 5b1f17b1804b1-42c880efb93mr63104915e9.14.1725506225818; 
 Wed, 04 Sep 2024 20:17:05 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374cee38722sm8525999f8f.112.2024.09.04.20.17.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 20:17:05 -0700 (PDT)
Message-ID: <66d922b1.050a0220.2f57b.8373@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 05 Sep 2024 03:17:05 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725506226; x=1726111026; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=072y20lsS5T5TyUtYs9prGzRgrJCE9arNN8ELFCiPEg=;
 b=JuS3nV273DNXaR3tnpddzS1GUTO0sUhG33GfmTAygNMOJs99GPFhb+j9jmDY5eXNW2
 BwLg+yE+UIyr377BmcG9ljgYcAAVR4Kuocp1nvfE6rDLSWfO/ZWS/9DSTqoTqSwSJHtR
 943WT7+EN+3CE0+YKGi7+BhFM50AqDHmBxz8MBAbybNgdwo6h9NdDQYaO2uEq6idR3iZ
 Yz/MO5XfIJT5Q8u+tpbucNhbC10REKQJrznuc0glgW8JKfL82gQ6IncqNRn7SOHmU4q6
 PKF78iBbY9mLU+O9mnj/LT8l67Bz6+eFJCAezuzQp5xXvCnf6wXhWhjfvwT1viRTO+PK
 9eNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JuS3nV27
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-04
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Autobuild statistics for 2024-09-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 11  | 10  |  1  | 22  |
  2024.05.x  | 11  | 12  |  1  | 24  |
    master   | 21  | 188 |  7  | 216 |
     next    |  7  | 14  |  0  | 21  |

Classification of failures by reason for master
-----------------------------------------------

               procps-ng-4.0.4 | 25
  gobject-introspection-1.76.1 | 9 
                  linux-6.10.7 | 9 
aubio-152d6819b360c2e7b379e... | 8 
         gobject-introspection | 7 
android-tools-4.2.2+git2013... | 6 
          linux-5.10.162-cip24 | 6 
               mariadb-10.11.6 | 6 
                  ntp-4.2.8p18 | 5 
                       unknown | 5 
                  assimp-5.3.1 | 4 
          cryptodev-linux-1.13 | 4 
                   pcre2-10.43 | 4 
                  ffmpeg-6.1.2 | 3 
glibc-2.39-74-g198632a05f6c... | 3 
                  libsepol-3.6 | 3 
                 libv4l-1.24.1 | 3 
     linux-5.10.162-cip24-rt10 | 3 
               pulseaudio-17.0 | 3 
                  acpid-2.0.34 | 2 
                 apache-2.4.62 | 2 
             batman-adv-2023.1 | 2 
                directfb-1.7.7 | 2 
      docker-cli-buildx-0.16.1 | 2 
                     file-5.45 | 2 
                 gnuplot-6.0.1 | 2 
 host-binutils-bare-metal-2.42 | 2 
            host-ccache-4.10.1 | 2 
         host-gcc-final-12.4.0 | 2 
                   httping-2.5 | 2 
               ipmitool-1_8_19 | 2 
              mosquitto-2.0.18 | 2 
                 openssh-9.8p1 | 2 
               popperjs-1.16.0 | 2 
               postgresql-16.4 | 2 
  binutils-arc-2023.09-release | 1 
                bpftool-v7.1.0 | 1 
                    brltty-6.6 | 1 
                    bsdiff-4.3 | 1 
                   bullet-3.25 | 1 
          cloudflared-2024.6.1 | 1 
                   duma-2.5.21 | 1 
                elfutils-0.189 | 1 
                      ell-0.65 | 1 
                espflash-3.1.0 | 1 
                    flac-1.4.3 | 1 
              fluent-bit-3.1.3 | 1 
                   foot-1.16.2 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
                  fwupd-1.9.20 | 1 
            gettext-gnu-0.22.4 | 1 
                   gvfs-1.48.1 | 1 
             host-delve-1.22.1 | 1 
           host-doxygen-1.8.18 | 1 
           host-librsvg-2.50.9 | 1 
         host-libxcrypt-4.4.36 | 1 
              host-rust-1.79.0 | 1 
            host-skopeo-1.13.3 | 1 
                  jack2-1.9.22 | 1 
                latencytop-0.5 | 1 
                libdrm-2.4.122 | 1 
                liblinear-2.45 | 1 
             libtorrent-0.13.8 | 1 
   libtorrent-rasterbar-1.2.19 | 1 
                 libvpl-2.12.0 | 1 
                libxml2-2.13.3 | 1 
               lighttpd-1.4.76 | 1 
            linux-fusion-9.0.3 | 1 
               linux-pam-1.6.1 | 1 
                   lsuio-0.2.0 | 1 
                  lvm2-2.03.23 | 1 
                 mesa3d-24.0.9 | 1 
            netstat-nat-1.4.10 | 1 
                 pixman-0.42.2 | 1 
         python-remi-2022.7.27 | 1 
                 rp-pppoe-3.15 | 1 
              sdl2_mixer-2.6.3 | 1 
          sphinxbase-5prealpha | 1 
                tpm2-tss-3.2.2 | 1 
               valgrind-3.23.0 | 1 
                 wolfssl-5.7.2 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.org/results/c04f1cc71a9b74ef3f6f6acc46b1fde7f8dba428 | ORPH
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.org/results/c766a926168678573c9f5e813eab881615882651 | ORPH
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/e4e1093932a96a9ddc7ada86189227d6fd98db8d |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/29bb410566630ea042692a706e81841eeb44c96d |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/737c705cc9da35a0ddfb906969d844a174572fe1 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/69a7cc82bd1e6e1961a871f589564380acdfd5dc |     
  riscv64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/01e298b5011b561212b8e216f7899472351a5c09 |     
    mips     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/398df5c87c4ea1a3638d6ed5fbf43d2401fc68e0 |     
powerpc64le  |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/47bf659c268bd7d0116331c7696c87f57d28dca5 |     
    i686     |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/b49c1ad7e4f5ac5a71ec71255c7a6788e03053af |     
   armeb     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.org/results/ff0ea4510f638160a6d3f109b15a7c59fee3906e | ORPH
   nios2     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.org/results/2546ca7cfd72172ecae722a17404d2e8f13bb3c6 | ORPH
   mipsel    |          assimp-5.3.1          | NOK | http://autobuild.buildroot.org/results/393bb8503b60eaaa4047840ef216df609954b597 | ORPH
   nios2     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.org/results/dfc58a7a64611157bcce0ebe85a5769e0bae22d6 | ORPH
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/604f921c52b53e645a71596e7b92d122fd103706 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/5376c28e1dbad34f7961d822db0a35baa6d6ab0d |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/a22fb370d913a028cb8f6d7924514c5d7d3c7760 |     
    mips     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/9056355e3ef837e123b9482c4e4a16d5eac8d3a3 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/04a1f0eb6285f99e6a0c5b8c87dfbfbc60cc4a62 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/274cb2197fdc6405835bef928d9659508f8ff338 |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/9ec58483bab0a52b48868a5b30694d4c5f6f2c30 |     
 aarch64_be  | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/4d831a6155948bb79d09208071cc5aea37e4b265 |     
  mips64el   |       batman-adv-2023.1        | NOK | http://autobuild.buildroot.org/results/8e6d79603779630eb56ca988e22f76eeeddc47ee |     
  mips64el   |       batman-adv-2023.1        | NOK | http://autobuild.buildroot.org/results/4015ee328450510da4170344fc0f2bf1a95526ea |     
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.org/results/f8fdc51074c708aff6d94a04c5d9340193ebb517 |     
   x86_64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.org/results/efb9a56fd78198002a025b7ba0baffc22cc498f7 |     
microblazeel |           brltty-6.6           | NOK | http://autobuild.buildroot.org/results/cb8f40af5e6ef6f91a1c4096acfcf6a7cf186090 |     
 powerpc64   |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/9d35724872c0dd415267974f46ab3a7b24790d2f | ORPH
    or1k     |          bullet-3.25           | NOK | http://autobuild.buildroot.org/results/6f13f09f8a64ea712971f2206e3f60cb0eef22a7 |     
  riscv64    |      cloudflared-2024.6.1      | NOK | http://autobuild.buildroot.org/results/17f5acc998d2f02a717b520dfe7e56c60d4189de |     
   mipsel    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/3e29c614993bc549ed25779684d4b256fbae6bd7 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/8ccda994dd3e118c15b0d9ea9fab8567a4456a88 | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/7a32cff1d6553991375e070c9143cd8f26e0afcb | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/5c00bd5661b5937da19c0994ace8ff3fb4e5e2cf | ORPH
   sh4eb     |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/dd74f03086fdf71d63e347907766b42c03ca28ad | ORPH
   mipsel    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/66948f415dd343abb8a44e894294d7c366b2f169 | ORPH
   s390x     |    docker-cli-buildx-0.16.1    | NOK | http://autobuild.buildroot.org/results/2d2dd635464ade3aa64c8f29ecc7f5398db141ea | ORPH
  riscv64    |    docker-cli-buildx-0.16.1    | NOK | http://autobuild.buildroot.org/results/dda778fd51061f309e51568548345474eaf53a13 | ORPH
 aarch64_be  |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/df08e58c3525d5a0c2dbd0f029b5e179884089de | ORPH
powerpc64le  |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/38d9598cbf593e1bf6465e697d772083a58c6ea7 | ORPH
    sh4      |            ell-0.65            | NOK | http://autobuild.buildroot.org/results/8f6fe6591e0af9ff87f7dad6fa445dbd73bd6105 | ORPH
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.org/results/f005b93f26d99822d9b20ec8424862455f93283b |     
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/5c1f9c69a2cc0515bf4abf72c6d6c9e95fc6a804 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/a6a963140db1b75bb356b46e8b1ca280cbd592e0 |     
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/ca434877253800df989fc794bacdbbe7279b8eff |     
    mips     |           file-5.45            | NOK | http://autobuild.buildroot.org/results/b60aa1606440a32c0beecd6310dcff33e2f0f26b | ORPH
    arm      |           file-5.45            | NOK | http://autobuild.buildroot.org/results/e8522b69a679b6e1f96c2de3a3a5cd5490243fcb | ORPH
   sh4aeb    |           flac-1.4.3           | NOK | http://autobuild.buildroot.org/results/ca826af1c5c749c5873c4d9cdbb8ded92fe01553 |     
 microblaze  |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/c86e1067882c2720ce1fbf058ed770782de0aae1 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/13d3a918b1ad6a9245a7c50c5bcfa3bff5324fe1 |     
 microblaze  | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.org/results/7086f4f6bd8122ef77ac0cd818b5fd4c41c42abe |     
   sh4aeb    |          fwupd-1.9.20          | NOK | http://autobuild.buildroot.org/results/90c17446c3f8e45ec78ea2b4907d25b9a7f47b27 |     
   x86_64    |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/96185ca670615b092114d5f7e7d533676a4b513e | ORPH
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/e0040b70e66a06a39d865fc5cb5d5beccc391c5f |     
  riscv64    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/513f78c5c2d5e4b1b2a2957f9157f360538947b7 |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/157219f6c7497203c04bb7caa443543cf3e8248c |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/d2f4f9e49df6f58e6c55a0e2ac8a062d97bd13ef |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/94c89f6a0050a64737061bedbb1f5fdbc2ad7abd |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/439f8e7978462a57d0b28a40f7cf87920adf553c |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/7906222af23ad8b52f0087efde2b0e14bc015126 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/8bcceb930e8845dd425663191f3aafbb983eca1a |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/76184ad611c1e6638691e7c3f6cbd3e9d1bb2720 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/701eca9cb4ebd20c5421f325afbb374f9be10d3d |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/edaf8e6187faccf8ebb31966b0c4cbd697d8fa8c |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/9f6d8049df5f675b9c8650fd90a2d65fe1d2c76d |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/52dbc597c7bf65188783c1579a72adb373455e92 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/dca0474f46cd61b2fe8b177710330ccc74ee9c26 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/0bb2ab14aaa88ff27fe9c1bb3eea862b657a8fb9 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/81269f66ba35285473355edd3a3aa542a346f914 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/a91eb06c19c94259ccd0f90986267c01d52450cf | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/d92812b6db8bbeccf83b7f09cd0afd193197b1b2 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/058287c516e3889bdb82a2756805713157d7554e | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/c6ea689e6f9a8dab946541e3fab0325a03ddca22 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/2911b5fa0b0957a7c969cfae04cbd827d2038940 | ORPH
powerpc64le  |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.org/results/e1502d368f5b1eed12e479a58c90f662c10e73c1 | ORPH
  riscv64    | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/297d8cc3af62077d89a12df3f72e63546b3e05b6 |     
   sh4aeb    | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/0942dc9b78114a89019d1f79b953df9d1da7d891 |     
    mips     |       host-ccache-4.10.1       | NOK | http://autobuild.buildroot.org/results/fef2ff6f1f2e1302ecd82f4700c77060eace6b0a | ORPH
   sparc     |       host-ccache-4.10.1       | NOK | http://autobuild.buildroot.org/results/a2532f493350891fffb6ef2ce533a8431b72a33b | ORPH
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/a84bc4e5369338249286bcc0492c4fb7a6470807 |     
   sh4eb     |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/1bcf3b1d142094fd3a6df4807805fc060d9b28d2 | ORPH
   mips64    |     host-gcc-final-12.4.0      | NOK | http://autobuild.buildroot.org/results/132941e9adadc3f7dffdb99883cd5e5f23c28433 |     
   arceb     |     host-gcc-final-12.4.0      | NOK | http://autobuild.buildroot.org/results/b3b24494158187ddc371bf5fde22b5deaedec50f |     
   sparc     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/a116d5e0efbfa5942e78d7f742907075e751d508 |     
  mips64el   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/00bd66f8e359c6f70430db51a7ae520bfbe31079 |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.org/results/bfc7458b961a822d041497147614465c43e59e63 |     
  riscv64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.org/results/8509dd2a152716b7884b4537ee68b423397ee448 |     
 aarch64_be  |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/667e1271ce3987c4958cbb6df225eae6ef11b95c |     
 powerpc64   |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/20118fe0d2a0fc613f276833bf5b7f8c79915173 |     
  sparc64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/7689a79ee6269e990e55d0197c6e72f60088ae6b |     
 aarch64_be  |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/9f418eeb115a666229c83fdffb361e945d331404 |     
    or1k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.org/results/a9d264ae5047958a6caa020b9859d92cad9a478b |     
   s390x     |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/17bfa0bab41b3db121226e704024fc02a6c64128 | ORPH
   sparc     |         libdrm-2.4.122         | NOK | http://autobuild.buildroot.org/results/db2785d3ad47e76e434fead9a8441dc0dcc8390f |     
 microblaze  |         liblinear-2.45         | NOK | http://autobuild.buildroot.org/results/84c336379da38d662bdf0bef5fe67147034491ba |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/4b59cba595cdd0bc9aa4cda1e187a6cca5cab7cc |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/e4ed101c1372ef891b5b963fe4cd159759146824 |     
  riscv64    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/52363d1dd69ced743ea5ca4e2864f2f255b54367 |     
   mipsel    |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.org/results/d5c7d25fb2bd87ae0493fcdf03834436ecaaec60 | ORPH
   x86_64    |  libtorrent-rasterbar-1.2.19   | NOK | http://autobuild.buildroot.org/results/d8f86a23eaac6cbb6847f210b2e1793c593a24f4 |     
   armeb     |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.org/results/2eff421bfedc0f8af6a55030e19e4762c76579a7 |     
    arc      |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.org/results/259d331b36a992f17bc35d863e274c363834e0c2 |     
    mips     |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.org/results/8d537215c685bfe0a0574b020f6b63437144cc10 |     
   mips64    |         libvpl-2.12.0          | NOK | http://autobuild.buildroot.org/results/d7a65288d22d27272f0a7daadac6364ebd370b0a |     
   armeb     |         libxml2-2.13.3         | NOK | http://autobuild.buildroot.org/results/586c452acd38c5427585b1bafd8a8c3cb21fba3e |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.org/results/6c78c5c6b1faa7c77a8cb0808dc5b21ebba5477c | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/4ea742734d65d9e2f0f75ac0917352748ba91727 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/e5d811ea3380fe14842463996dc440d68bf37c05 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/b85524f52eb99eacaab8209c57c48f9b1867cdc9 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/d5f7d8cab92df1e8244abcc8010d75b4c43848ec | ORPH
    arc      |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/d3463e8f5c79435346e87e4533f9269e82131201 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/b183290965b2705ec3b4336390d2bb6455df8737 | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/cef679675655706a75752cd383919d71ffd50026 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/5959e6012c6f6c437397e103f9ee5bc5f7005b05 | ORPH
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/622d42327d1b607188eb62634b705e4b1ee6a6dd | ORPH
 powerpc64   |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/e5d14049b9eccfbb2cac520a04e8559eadd352af | ORPH
  powerpc    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/dc58935a7363abe63f513cd97e628e5c261fc682 | ORPH
powerpc64le  |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/31a5210572a8e104c79e22e5a0d4961de418f2df | ORPH
    sh4a     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/f1047bcf8c8bf0f2566a3b0269a05ca707184bca | ORPH
   armeb     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/3f15bceee39688f0f643cfac74f5d1fd6af839fa | ORPH
    i686     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/34e484d86a23114616e796a71101774b0759f28f | ORPH
  sparc64    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/9a24c73ef05019c37df22a469dee291467b84ede | ORPH
    sh4a     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/fc71d73826e42a165f7966bd04082edb534f92e8 | ORPH
  powerpc    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/02ea94f63bda2cd0e2b66cb64b698ede1a0900f1 | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/ba0748d9f6162a4bf35a193e6830877b92ee4f8d | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/259d51da312d0f5854e8c703db8386cd12fdcb98 | ORPH
  powerpc    |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/8b64d0c3d75c2af221a92d55e931a36fdbb92e28 | ORPH
microblazeel |          lvm2-2.03.23          | NOK | http://autobuild.buildroot.org/results/f6f8a5844f0c101ace4b2dda8b1411e49784fd3a | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/af3dbdf3dcdccb57b4a35541c3a7ce54b32b96ec | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/8128264b2df7713dbfb1307c98576fa9ad0fbe2e | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/96ac22f516df516e58e7e6caf174737841cbfcc9 | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/035fe3661482427ea5adf9e3d69b0d944ba832a0 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/e0598d1ca7702b751ff31673b41c15727fcd023e | ORPH
microblazeel |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/2688446d28462993b5dd3c72967596b272ab97c7 | ORPH
 aarch64_be  |         mesa3d-24.0.9          | NOK | http://autobuild.buildroot.org/results/dfce6bf8b576e3b554b24dd02b853d8d2edee597 |     
    or1k     |        mosquitto-2.0.18        | NOK | http://autobuild.buildroot.org/results/672eb73ec5c40663c466a7f9942355e72890a6aa |     
    or1k     |        mosquitto-2.0.18        | NOK | http://autobuild.buildroot.org/results/813e95217bf4799875a74f6bd4fca35f25bd5da1 |     
   sparc     |       netstat-nat-1.4.10       | NOK | http://autobuild.buildroot.org/results/a5d5789c46edcee3048385f76cd0549033b8b80c | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/ce7a0a84721af98441250195f1df72392527172b |     
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/1fd5195c3b45c4c5399badafd414f5e738233c90 |     
microblazeel |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/e6a90ee73bc3abb4fddcf5d10a53141ed2d143c4 |     
    arc      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/eded1698279379ecc632023a3d4ae5e0d4ad718a |     
   mips64    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/3a316def494593c8713c0eec4beef2e3f40a00f5 |     
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/f767a962ba3145d69e08afc6319d2ce82b67bacc | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/7124ff35cc58ecd572dcfe9b1818428ed7294596 | ORPH
   mipsel    |          pcre2-10.43           | NOK | http://autobuild.buildroot.org/results/d6ebc5bdaeddd98d81c3893d636c2493d6f1a6af | ORPH
   mips64    |          pcre2-10.43           | NOK | http://autobuild.buildroot.org/results/e03004043cd4687059e8928b3e2893f628325ec6 | ORPH
   mipsel    |          pcre2-10.43           | NOK | http://autobuild.buildroot.org/results/2f24afbe862d139c3ca2ba7275f275a5871973c5 | ORPH
   mips64    |          pcre2-10.43           | NOK | http://autobuild.buildroot.org/results/2bd0f62c5d647ba14d172b82ac6d1e920988bf5f | ORPH
powerpc64le  |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/d7fe0c4cac240693cad3339a8db2ee70dc6d81c5 | ORPH
    mips     |        popperjs-1.16.0         | NOK | http://autobuild.buildroot.org/results/9629da94be61a906fd113e77f0120cade521a715 | ORPH
   s390x     |        popperjs-1.16.0         | NOK | http://autobuild.buildroot.org/results/a456269902895e2fcba9bdee5404ea522d329952 | ORPH
   xtensa    |        postgresql-16.4         | NOK | http://autobuild.buildroot.org/results/02f145bd12614e6dffaa01a0aab919a121d1ce88 |     
   arceb     |        postgresql-16.4         | NOK | http://autobuild.buildroot.org/results/948fadc3de7e5092169a9ccc83585d1c5c13d182 |     
    arm      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/dab1e2233d14f88e6018e18fd155618ef08f62a2 | ORPH
    sh4      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/cfdc2218ac5851b5ab14d6666bcb746ee704c319 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/4c14aeea6346d8f24e60f124977e04e5db373260 | ORPH
    i686     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/78de8d00ada46900685cb1cf6e61c6db186839d6 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/42cc529a9d337bf3b6d1978e6a8077d2b9aac5e6 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/4da0a1d95a632e06264dc83df77acb3a7806318a | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/fe937977c8886a0b5e069b8328edc05cda16e254 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/01f8f0e2ecf91f6490a44e9a36fb012b19c3410b | ORPH
microblazeel |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/3ac7b144dd395c901f86e30f0884e9168d0ec524 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/f825c7ccf9caefc082f49694c17fa0db0b5048f9 | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/555173695c3c8e46c9d82a7c158ddb69e4ac2d98 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/806afb83502561d72c7b492740c05067504ca74a | ORPH
    mips     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/2c163be2ae2cf7ab07c38007a1e69bf530a5e170 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/d56267591c0369d879a5f1ef11368eb7b56eec7f | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/d7ffce418168b288a54325e5ac93e2987eec54d6 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/8343dbf1874037240a9b87ea69428c31e73dda66 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/02055ecf06f5af78ff8dd248e5d4e6c1d6266c2d | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/515b2b25211d612b46d9cf56b508eb1166ae348c | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/dbe2769bb3d8c83dd2bfe303b01f2d71c80c194c | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/66a7caee490b761b455d3d995121c0a4d0e7edeb | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/046bc1b5287e33d69f2317381d55a2de3e761ea1 | ORPH
   sh4aeb    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/5ddeaf4aeb30c52b6afd4e494f4560ef98bbb11c | ORPH
  riscv32    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/58620091886ca38d55c8a5eee60baa28ee6e6772 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/41e5b5095234439edd0f032e7ec3819928f5438f | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/c8f5d67d2544a6812b546a59083347b66b3e3103 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/30dd74b6a8a484009c55d6e134f89c41023779e4 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/7a889e8044a3c57e2c29b478bea363f0b3b4ebc9 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/a826c13902b37f6fffdb5ad79c85467fcb3eecab | ORPH
 microblaze  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.org/results/3e4fe1fae3966142f005c881697da049a562198e |     
 microblaze  |         rp-pppoe-3.15          | NOK | http://autobuild.buildroot.org/results/8676456feec9dd401152887101ad1a9ce96cb769 | ORPH
    arm      |        sdl2_mixer-2.6.3        | NOK | http://autobuild.buildroot.org/results/9f14aced6de418a7e666e9f51ea2fa98babca937 | ORPH
   nios2     |      sphinxbase-5prealpha      | NOK | http://autobuild.buildroot.org/results/28217a0c3792fb9aa75257de8e73f969658e4119 |     
  sparc64    |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.org/results/11f67b4c973688ce203c96f715adb552f0c9d570 | ORPH
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.org/results/dba6d59893eb2eb620c5d43fda2020bf3a4cf779 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.org/results/c2b41c344856411886b8860720a63884f113c6d8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.org/results/b2fd993790ab2cf6914f4bc0cf0ad5aeaeea4ead |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.org/results/7eba31faea65afdb3d0f8c35dc098fdfcbb749bc |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.org/results/84538db1db90f11a951673926f60caaffdd76a45 |     
  powerpc    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/4c378a4581706dc0e0547a77da926462bb188b18 | ORPH
    mips     |         wolfssl-5.7.2          | NOK | http://autobuild.buildroot.org/results/d4e79b3a113950cffe24891008d58dc304676b6e |     
    m68k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/222c17b97ea15cea51e8eb9e81fd599df355e44d |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   foot-1.16.2 | 1 
           ghostscript-10.03.1 | 1 
         gobject-introspection | 1 
      host-riscv-isa-sim-1.1.0 | 1 
               libglib2-2.76.1 | 1 
                libmad-0.15.1b | 1 
                  linux-6.6.44 | 1 
        python-contourpy-1.1.0 | 1 
          python-grpcio-1.60.0 | 1 
                       unknown | 1 
             util-linux-2.39.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/d975645476af57b66fb81492277fc38aef3de0c8 |     
    arm      |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.org/results/19e5290173e4ee672d894c704761fe01293b629f |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/7fb47ec905b58b247606611ae4c791b5c13310df |     
   s390x     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.org/results/3f2946389a0cb8415ed6a4adfce123ae848a1992 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/94c6defcca62d9e2de239f90fecbddd0f78fb6df |     
    arm      |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.org/results/e0fdea24e29e4b85bdad7ab3c9f041bace3f0151 | ORPH
   arceb     |          linux-6.6.44          | NOK | http://autobuild.buildroot.org/results/6f218c49175ad884fa9011fafbe352ab6ce5cf34 | ORPH
   s390x     |     python-contourpy-1.1.0     | NOK | http://autobuild.buildroot.org/results/62431204abfa358198cd0d21414b904a30f56a58 |     
  mips64el   |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.org/results/a4ac8970e02201fe534d48a376461392d4b70e2f |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.org/results/e50b53e6b0034c89744612396e1edcc17fcbe789 |     
   arceb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.org/results/e159b2c881ef8d7ff629decc52c4ab938fea8220 | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                beecrypt-4.2.1 | 1 
                    fcft-3.1.6 | 1 
                  ffmpeg-6.1.2 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
                host-go-1.22.5 | 1 
host-heimdal-f4faaeaba371ff... | 1 
         host-libxcrypt-4.4.36 | 1 
                      poke-3.0 | 1 
               procps-ng-4.0.4 | 1 
         python-remi-2022.7.27 | 1 
      qt5webkit-5.212.0-alpha4 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.org/results/f8f5cc63fb6bf45dbb99125420157e828b422fbe |     
    arm      |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/c3c1171e4415941452a85054b94f5b89074961c9 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/9cf114c2216a25eac6b9aec9972ff6a797f7983b |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/ec9c0dd6799431f0219940c2140f8bc69751dee0 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/b3e25b0285a4372ff4c15a11927e3e910db2f743 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/3933b12f2c0085537e37db881d2a964974ea0099 | ORPH
   mips64    |         host-go-1.22.5         | NOK | http://autobuild.buildroot.org/results/8e02c36b57e2c84a4b049cf1cce7ef70b9f0f839 |     
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/88e054302e27405bdb2992bc23e25c2eb76b0e72 | ORPH
  sparc64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/cef31a0c89832c6c3b8f3b8ea5747eed0ac706e9 |     
  sparc64    |            poke-3.0            | NOK | http://autobuild.buildroot.org/results/97c5622cc6b9596611fbef4f84f270ba4a458857 | ORPH
    arm      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/07db42e42aed4057c0d23b1784afd2672fedf8ff | ORPH
  powerpc    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.org/results/aca0dd531af10cb65049c9238ad509a20ef68db3 |     
   mipsel    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.org/results/a45bd503dae128ca210675b83a9c5519f5dfc9fb |     


Classification of failures by reason for next
---------------------------------------------

                       unknown | 3 
                   atop-2.10.0 | 2 
             bluez5_utils-5.77 | 1 
                   eza-0.18.22 | 1 
                gerbera-1.12.1 | 1 
              host-runc-1.1.12 | 1 
              host-rust-1.80.1 | 1 
                    mpv-0.35.1 | 1 
                 nethogs-0.8.7 | 1 
                    norm-1.5.8 | 1 
                  ntp-4.2.8p18 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/222d25667c2e99aaadfdc372deb14172eeda0670 |     
    i686     |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/31466b904ceb28400bbb2b58117229a7d325e593 |     
  powerpc    |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/154c2a279c5337caf963d9afd24fdd6db8926a21 |     
powerpc64le  |          eza-0.18.22           | NOK | http://autobuild.buildroot.org/results/e425b29220647704fae541404120c06cb85bcea3 |     
   s390x     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/55027f3e476d57d43512bc0cf0208a3b0cb7a084 |     
   armeb     |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.org/results/b8a55de0add6d54a9094f5ca24ea00548bf481a4 |     
  sparc64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/ab29c1d2fa972380e3d95271d0dd89c0b38d8026 |     
  riscv64    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.org/results/c15db5867469511351f12f11d5cb9a5d488f84b0 |     
    arm      |         nethogs-0.8.7          | NOK | http://autobuild.buildroot.org/results/aa8b02793f22c5c23f75d5c142993fdd666e07c7 |     
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/c993c65db1499d1c8542ec2e9415b3176eaa3638 | ORPH
microblazeel |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/aeba22425f3c2849e7e917ab8a82d5365939fe76 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.org/results/05ee11b950fe4728649b637270e43ba625fafc1b |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.org/results/53f41a152d6a1f7e5e5393027405408ef42e73b0 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.org/results/b6767e6e998f5ec456bb935c90fa6fd2e5672221 |     



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
