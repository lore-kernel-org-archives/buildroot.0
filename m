Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0A3C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 03:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5FCF40126;
	Wed, 21 Aug 2024 03:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7bsdYTur9U_Y; Wed, 21 Aug 2024 03:17:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5DF140154
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5DF140154;
	Wed, 21 Aug 2024 03:17:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB09C1BF401
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 03:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE89A40154
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 03:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HX_tu3Fivo6R for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 03:17:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6AA0440126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AA0440126
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AA0440126
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 03:17:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-36d2a601c31so3550559f8f.0
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 20:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724210245; x=1724815045;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uK+2AWEtIqmSQhFIyvXxAQvY96Oh9VMKWkrwwplkDRU=;
 b=qABBkYcKOItNsFuietUMLpIx4ea1OmdiF1wwApBUSRHjZZd/inWlSu26A5eDhfrsNI
 QS/1+WhYLyKkuLxslLeu/Ds0BYTBX3j7jDwLwykuYj4nBynWQwEdVQ8A14GXkFH7GHg1
 Qw9GbpfGOtif3Z/BosRpgXs225DGVLXikofEKk0UCMBaUv7tSnQ7XSJ1yzNOYO8KZFJb
 M4EF8r8eg68MfKROOQwIAohur3m6bXW82nF1koUk5YMxLRtRMnhLORwzdBaAuXD1Ti10
 LYjryBhUpV62Uo1qo0IgtaNfvBbTUmvYXUKM7sAAohprVl7zO7yUBYCi7J3UYtpTPM+Y
 hKsg==
X-Gm-Message-State: AOJu0YwpwYkRwD/Abp4kLGGcJNPMbumIwIkOL36XQ09PDtdyyh7j0amE
 ZdIatkAhqpE09oG/gB6ehe3tITSy5QduCH4EXjV2qdZ36zun+10f+5u1Eot/
X-Google-Smtp-Source: AGHT+IG45MyJb4K7UDEL/CkoOY7BhfDAkjUrKJ2MEn4/zifFA0BhvcrrZj79f+3BJrQIdtNq/4vj1w==
X-Received: by 2002:a5d:4106:0:b0:369:b7e3:4983 with SMTP id
 ffacd0b85a97d-372fd5bbcb9mr460603f8f.1.1724210244335; 
 Tue, 20 Aug 2024 20:17:24 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838c6998sm848871366b.19.2024.08.20.20.17.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 20:17:23 -0700 (PDT)
Message-ID: <66c55c43.170a0220.97361.c2f4@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 21 Aug 2024 03:17:23 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724210245; x=1724815045; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=uK+2AWEtIqmSQhFIyvXxAQvY96Oh9VMKWkrwwplkDRU=;
 b=RhYXgjLd8C4d/x5fNMrtHHal3gf3AMRRM5SvZ8FnWifovZ6H1xrhFGbYnHLSLR54eQ
 qJ2gPur/xXe8i576/uExzGFHp572cpwVJkiyKS4UYXlxrrrtde0Ra6GguPyfsE9Dw+yM
 BMokyp3og7BOd9vJPq44BIab+bBAbhkiXH14oJcdd8O7nQCiB/a+0ikDsR1Zv+66PLiR
 Cqz/t5M81ktBLzpGZxrKJVi1HaGV54epRNIr4FXiYUqTjWPF31EXJLr/ZdN68FxQ/lYs
 84TMOnCJflw2+fvyBdaVtmtoNX+Yx4gCw4s4qeJqmSKHUVyjkN9/aDaRoI+keClXYbHa
 dkPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RhYXgjLd
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-08-20
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

Autobuild statistics for 2024-08-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 25  | 34  |  2  | 61  |
  2024.05.x  | 18  | 32  |  1  | 51  |
    master   | 135 | 364 |  2  | 501 |
     next    | 16  | 29  |  1  | 46  |

Classification of failures by reason for master
-----------------------------------------------

                    bsdiff-4.3 | 17
                   aumix-2.9.1 | 15
           comix-cursors-0.9.1 | 14
glibc-2.39-74-g198632a05f6c... | 12
                       unknown | 12
  gobject-introspection-1.76.1 | 11
                  fan-ctrl-1.3 | 10
                     libuecc-7 | 10
                  babeld-1.9.2 | 9 
                     fbset-2.1 | 9 
           host-doxygen-1.8.18 | 9 
                  linux-6.10.3 | 9 
                 apache-2.4.62 | 6 
         host-libxcrypt-4.4.36 | 6 
               libglib2-2.76.1 | 6 
               procps-ng-4.0.4 | 6 
                   mimic-1.1.0 | 5 
              cache-calibrator | 4 
host-heimdal-f4faaeaba371ff... | 4 
 host-softether-4.30-9700-beta | 4 
                   libglob-1.0 | 4 
                   lsuio-0.2.0 | 4 
                 openssh-9.8p1 | 4 
      python-autocommand-2.2.2 | 4 
                    brltty-6.6 | 3 
                elfutils-0.189 | 3 
                      fbv-1.0b | 3 
                  ffmpeg-6.1.2 | 3 
            host-binutils-2.42 | 3 
              host-rust-1.79.0 | 3 
                   httping-2.5 | 3 
                  libsepol-3.6 | 3 
          linux-5.10.162-cip24 | 3 
     linux-5.10.162-cip24-rt10 | 3 
            netstat-nat-1.4.10 | 3 
           python-daemon-3.0.1 | 3 
                 rtptools-1.22 | 3 
             armadillo-9.900.2 | 2 
              fluent-bit-3.1.3 | 2 
                    frotz-2.54 | 2 
                gerbera-1.12.1 | 2 
         gobject-introspection | 2 
 host-binutils-bare-metal-2.42 | 2 
            host-skopeo-1.13.3 | 2 
jailhouse-e57d1eff6d55aeed5... | 2 
                latencytop-0.5 | 2 
                libcuefile-475 | 2 
                  libsvg-0.1.4 | 2 
                 libv4l-1.24.1 | 2 
               lighttpd-1.4.76 | 2 
                  lvm2-2.03.23 | 2 
                  mender-3.4.0 | 2 
                    mpir-3.0.0 | 2 
                    mpv-0.35.1 | 2 
                    norm-1.5.8 | 2 
                  ntp-4.2.8p18 | 2 
                   p910nd-0.97 | 2 
                 pixman-0.42.2 | 2 
                    qemu-9.0.2 | 2 
             stress-ng-0.17.07 | 2 
                  tllist-1.1.0 | 2 
ulog-0389d243352255f6182326... | 2 
                 wolfssl-5.7.2 | 2 
                  acpid-2.0.34 | 1 
android-tools-4.2.2+git2013... | 1 
                apr-util-1.6.3 | 1 
             batman-adv-2023.1 | 1 
             berkeleydb-5.3.28 | 1 
                  boost-1.83.0 | 1 
                   bullet-3.25 | 1 
                  cairo-1.18.0 | 1 
                cairomm-1.16.2 | 1 
          cloudflared-2024.6.1 | 1 
                 coreutils-9.3 | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
                   dillo-3.0.5 | 1 
      docker-cli-buildx-0.16.1 | 1 
                      ell-0.65 | 1 
                 erlang-26.0.2 | 1 
                   eza-0.18.22 | 1 
                      fastd-22 | 1 
                      fd-9.0.0 | 1 
                   foot-1.16.2 | 1 
               freeipmi-1.6.14 | 1 
            gdk-pixbuf-2.42.10 | 1 
                  giblib-1.2.4 | 1 
                     gmp-6.3.0 | 1 
        gmrender-resurrect-0.1 | 1 
               graphene-1.10.8 | 1 
      gst1-plugins-base-1.22.9 | 1 
                 hddtemp-0.4.3 | 1 
                 highway-1.2.0 | 1 
            host-ccache-4.10.1 | 1 
         host-gcc-final-13.3.0 | 1 
         host-gcc-final-14.2.0 | 1 
           host-librsvg-2.50.9 | 1 
              host-runc-1.1.12 | 1 
               ipmitool-1_8_19 | 1 
                libesmtp-1.1.0 | 1 
             libgphoto2-2.5.27 | 1 
                 libjcat-0.2.1 | 1 
                libkcapi-1.5.0 | 1 
              libopenssl-3.3.1 | 1 
                 libssh-0.10.6 | 1 
   libtorrent-rasterbar-1.2.19 | 1 
               libunwind-1.8.1 | 1 
                  libva-2.22.0 | 1 
                 libvpl-2.12.0 | 1 
                libxml2-2.13.3 | 1 
                    links-2.29 | 1 
               linux-pam-1.6.1 | 1 
            live555-2021.05.03 | 1 
                 lrzsz-0.12.20 | 1 
              luabitop-1.0.2-1 | 1 
                memtest86-6.20 | 1 
                mongodb-4.2.18 | 1 
                   nanocom-1.0 | 1 
        network-manager-1.46.0 | 1 
          obsidian-cursors-1.0 | 1 
              openconnect-9.12 | 1 
             parsec-tool-0.7.0 | 1 
               pipewire-0.3.81 | 1 
               popperjs-1.16.0 | 1 
         python-remi-2022.7.27 | 1 
                  ramsmp-3.5.0 | 1 
                ramspeed-2.6.0 | 1 
                   rauc-1.11.3 | 1 
                rdma-core-52.0 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                     shim-15.8 | 1 
              skalibs-2.14.2.0 | 1 
squeezelite-71c012ad9ba102f... | 1 
             strongswan-5.9.13 | 1 
                   swipl-9.2.6 | 1 
                    szip-2.1.1 | 1 
                tinifier-3.4.0 | 1 
           v4l2loopback-0.12.7 | 1 
                    vlc-3.0.21 | 1 
  wireguard-tools-1.0.20210914 | 1 
                wlroots-0.16.2 | 1 
               w_scan-20170107 | 1 
                xenomai-3.0.10 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.org/results/b2bb2dae0858e7264f1312b15f11c350fd7ff41d | ORPH
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/61a0a71e989f23c691aea0f18b5a147e8e0ab103 |     
   sh4eb     |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/d41d9bd954ced0cbff496c1372d205c3e8e752ce |     
    i686     |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/6e0c35b5a714eefa52bc2d7706ce619c53568527 |     
   nios2     |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/dbe492454de9c0624f0eccdb4c011712244e9574 |     
  sparc64    |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/feb045587cd85cab894f4ce1a4083e2775ec89ae |     
    sh4a     |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/b85066bd12cefc855ed7432ba59483501561f9fa |     
    i686     |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/1463c12fa718bcd3f6425ee47eaebade33af66d7 |     
microblazeel |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.org/results/25edae731c4132d0a7d904a5b8532460afa5b09d |     
   nios2     |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/03319c231650a02e2011efffd3a39fd32bc34671 |     
   nios2     |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/c90396dbe2ed069f84e566105a2ad480d525736a |     
   mipsel    |          aumix-2.9.1           | NOK | http://autobuild.buildroot.org/results/566e5c11e872e3e758ce98dc1309d18a8c1296fe | ORPH
    m68k     |          aumix-2.9.1           | NOK | http://autobuild.buildroot.org/results/f4aa68ddfd22ef02df3c7232158ab3233beabb0f | ORPH
 powerpc64   |          aumix-2.9.1           | NOK | http://autobuild.buildroot.org/results/f34e0e03c082085dee6646fbd8b03ee5a20b5a4e | ORPH
  mips64el   |          aumix-2.9.1           | NOK | http://autobuild.buildroot.org/results/30a99a53887e814eface690915c8525c75301ff5 | ORPH
    arc      |          aumix-2.9.1           | NOK | http://autobuild.buildroot.org/results/3ba43b996d26fbb3eaf8cfae9bfb9a7142f85176 | ORPH
  mips64el   |          aumix-2.9.1           | NOK | http://autobuild.buildroot.org/results/cde03e1c1446fb94751b9c1dfa0741e0ab9abe7c | ORPH
powerpc64le  |          aumix-2.9.1           | NOK | http://autobuild.buildroot.org/results/9a4ab418993fc8f268ee2c1a8be84b5c3550aa73 | ORPH
  sparc64    |          aumix-2.9.1           | NOK | http://autobuild.buildroot.org/results/74d3980bdd8f187d964d1110c6ee0ac05c7bbabf | ORPH
  sparc64    |          aumix-2.9.1           | NOK | http://autobuild.buildroot.org/results/916de29701d82a03e541b728c54331d83eb4ef21 | ORPH
   sparc     |          aumix-2.9.1           | NOK | http://autobuild.buildroot.org/results/c0c3945cade7a6d7a615ac23523c93b02dbb056f | ORPH
  aarch64    |          aumix-2.9.1           | NOK | http://autobuild.buildroot.org/results/3de1827081a00cdea502587f759b02fca16a8ddd | ORPH
 microblaze  |          aumix-2.9.1           | NOK | http://autobuild.buildroot.org/results/4c7a2c42bf99e5cebe32302d456b361e9c1aabc4 | ORPH
    or1k     |          aumix-2.9.1           | NOK | http://autobuild.buildroot.org/results/50efe13060e715c7ac08e09530947a6a44a92f18 | ORPH
   sparc     |          aumix-2.9.1           | NOK | http://autobuild.buildroot.org/results/5f0657f3b907d6313609554d1d315c3b9951a2d2 | ORPH
   nios2     |          aumix-2.9.1           | NOK | http://autobuild.buildroot.org/results/d8f3c6f1f42d7c8da094f6d322b8490af664ee60 | ORPH
    mips     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/7464cd26333028329d7c59b2d17228ff7a272905 | ORPH
   mips64    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/ced18b6593f1c1619fec79523ca79cbcea295ba5 | ORPH
   armeb     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/9583ff1759ad1c2283221add1c8b3e2219dc0a67 | ORPH
   s390x     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/e7afd774060de950afccc5b821e9390eb910594e | ORPH
  aarch64    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/37d03b829e03614e66ed26c65458d7709215cf63 | ORPH
   sparc     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/0914517a7ca9d17ad3dd6a733b53f3bbfe371b8e | ORPH
  powerpc    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/11dd27e579958229fc587d58ed06b0f57fecd035 | ORPH
  powerpc    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/00b0498f401c63bf39dbb67d870d7ecc6d695f6a | ORPH
    mips     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/59c46eabea0b6c558cb8db5be0e1efd0e0faea26 | ORPH
   mipsel    |       batman-adv-2023.1        | NOK | http://autobuild.buildroot.org/results/4c567431620d3f4e924f427643da1f17acc31bf7 |     
  aarch64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.org/results/a131853e0c972306760a5bb390461c4fdbfcbdc5 | ORPH
   x86_64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.org/results/629edcb76c393b7bbee5017ba78212f2b5fcdbfe |     
   mipsel    |           brltty-6.6           | NOK | http://autobuild.buildroot.org/results/5030f644fb61d7b5eb292001bd9b7eb439f182e2 |     
  powerpc    |           brltty-6.6           | NOK | http://autobuild.buildroot.org/results/5d0cf2b98207789d7873be6f23694671ad1e6d9c |     
  powerpc    |           brltty-6.6           | NOK | http://autobuild.buildroot.org/results/92c0d4a23c52f2c7c392674fd216e3cc2552d5e4 |     
microblazeel |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/6598c0f421963b8eee1d5123fdfa3a512a1d1838 | ORPH
   armeb     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/ceeec1394090072622d6a569ab9770dd842381cd | ORPH
   mips64    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/802d143a3ead370ab87ef4114186057af883802c | ORPH
 aarch64_be  |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/18c3084d5295c2128af0a6af85b085b4ac64a377 | ORPH
 microblaze  |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/17338865900db12b82bc54f083700856fc98970c | ORPH
   arceb     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/b0c76fb2446078dbfa4d71a400ed12a291721664 | ORPH
  powerpc    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/98c1ccf3e5dbde2ba8cd20359320f6f7eff3e58f | ORPH
    mips     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/f65b17c12642719afa05628656f5d0bc72b8955c | ORPH
    arm      |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/dc4d81f51b0dedda44d6575b32837c59ee2bfb90 | ORPH
   sparc     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/abfb44f9b0c03e661c17f9cd488e436cd9c79c84 | ORPH
   s390x     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/ebc74e01266c1eb84b539d2e0e2a342514c1e51d | ORPH
    i686     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/c6e3d174784f475c704f7919f1aaac54ec914e1a | ORPH
   nios2     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/ef104df42a2cf6d4b5ff72ac48b453923427fbc6 | ORPH
    i586     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/d4863013ba7cfc3157b2811a61901bbd69c9a96c | ORPH
  powerpc    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/16f8796bd585cc269bf31c5449e9a63c7dd0417d | ORPH
  powerpc    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/9a32762a111bf0617d542ca52740538c9b7d4cc4 | ORPH
   mips64    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/93bf37341fe982a79ec58e32c67193a5fb817ca5 | ORPH
   arceb     |          bullet-3.25           | NOK | http://autobuild.buildroot.org/results/d4b828f71c000c9e401d0bb9d772b70e89dbf64c |     
   arceb     |        cache-calibrator        | NOK | http://autobuild.buildroot.org/results/7954523f22a2b5df05cbba92dbb885f055e39ea2 |     
   s390x     |        cache-calibrator        | NOK | http://autobuild.buildroot.org/results/602991f595d5883d937166cbe1361d7d0d2f117c |     
    i686     |        cache-calibrator        | NOK | http://autobuild.buildroot.org/results/ad8a829e303a5b20424bb0a1bdbb36d76c8df753 |     
   mips64    |        cache-calibrator        | NOK | http://autobuild.buildroot.org/results/1cfaa3592173b18c501ae81b2ec9b22bbb811669 |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/535470cfb7f029a292cf3fae164dc8a55440b2f7 |     
  mips64el   |         cairomm-1.16.2         | NOK | http://autobuild.buildroot.org/results/04027e364ae068fcccd706cfa85e95f9ec8255f7 |     
    i686     |      cloudflared-2024.6.1      | NOK | http://autobuild.buildroot.org/results/f55561f9b75ee9f4fb447288d0a1c9bb353059ae |     
  mips64el   |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/fee1fada0eadad823c63e1cb2ac85b97cf0b9e6e | ORPH
 aarch64_be  |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/0b72aeccd2f79808107c777960018ec04ce9d286 | ORPH
    arm      |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/280b461965f8f156053961c74e20a689f1e85449 | ORPH
   s390x     |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/f115706e9bbbe85d7e22f0b413f010af45568c51 | ORPH
  mips64el   |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/bb2a820c31f5b90e05c062fc513f5f21dfca39b4 | ORPH
    or1k     |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/c63a130c37678aa3d12c8cecf7e3fef9d0b777b3 | ORPH
  mips64el   |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/c41fae372673cb1563d7c4daf3260fae598efc3e | ORPH
   armeb     |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/5102b064738c96064fbfbaefee8cc2407ed8fcf3 | ORPH
   xtensa    |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/4e05e009fb2216074ad7361536ca1921135d568a | ORPH
   mips64    |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/7d6002847d6a50e5683257f51b0e8da94f44067a | ORPH
    arc      |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/26f53cbf8c7aa0e3d5c1cfd824af91e403affb0e | ORPH
   mipsel    |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/ede8ad1d720ada9409142c60d24b0600bdeab664 | ORPH
   arceb     |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/9db4cb0d0627ed7f75de66e9305b9d556fdb5196 | ORPH
   arceb     |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/4fd32a1303f0d4e15880fc44f12f6eff8029be79 | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/2f78e2d44e275df0ecd7d773e937eab220591eaa | ORPH
    mips     |          cvs-1.12.13           | NOK | http://autobuild.buildroot.org/results/abc84e92497a4516a0743d8b63c511ff36d51350 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.org/results/750e663d6b0dc1c2d1882d6c9f94e45aa45ff3eb |     
  sparc64    |          dillo-3.0.5           | NOK | http://autobuild.buildroot.org/results/d448f3c679efb47481bd620e50738e1aaab04f3e | ORPH
   x86_64    |    docker-cli-buildx-0.16.1    | NOK | http://autobuild.buildroot.org/results/9b88ed4f4d829cb1d7691a741eb376b0ffac28e9 | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/b1287284ee174d0914153f449d0c00b67ae04ddf | ORPH
  mips64el   |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/da87745e5d08750b73e36366f6fe9b32b5b5b573 | ORPH
  powerpc    |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/e9031d6c40abb764f7d953f039cbcb32b01dbf52 | ORPH
    sh4      |            ell-0.65            | NOK | http://autobuild.buildroot.org/results/d443b99751387fe2fc91c14685f4a9e3acacb817 | ORPH
  powerpc    |         erlang-26.0.2          | NOK | http://autobuild.buildroot.org/results/389dc9b4e6a0d5d9c7e6d3805947892d2d60a544 |     
powerpc64le  |          eza-0.18.22           | NOK | http://autobuild.buildroot.org/results/f65c111a35b1a42ad9cd11db6e581f4e31019f9f |     
powerpc64le  |          fan-ctrl-1.3          | NOK | http://autobuild.buildroot.org/results/74de98fcad861ce25004c00d09da2a65b35e828f | ORPH
    arc      |          fan-ctrl-1.3          | NOK | http://autobuild.buildroot.org/results/dd18d62800f5916ad1a499699a2ba00f72efb2f8 | ORPH
  aarch64    |          fan-ctrl-1.3          | NOK | http://autobuild.buildroot.org/results/d698dd7273b1702ad9a8d43f5b6914067443ce07 | ORPH
   armeb     |          fan-ctrl-1.3          | NOK | http://autobuild.buildroot.org/results/fef6d93ea44b30e2523b09a84e0c41b1308f61a5 | ORPH
 aarch64_be  |          fan-ctrl-1.3          | NOK | http://autobuild.buildroot.org/results/c4e414ba9776bf671872d3335cdd44c3d8031401 | ORPH
   mipsel    |          fan-ctrl-1.3          | NOK | http://autobuild.buildroot.org/results/e1f6330d682940c6df99ed3e39a0135ebd1a92a7 | ORPH
    mips     |          fan-ctrl-1.3          | NOK | http://autobuild.buildroot.org/results/9b49e90f281f6313be7c7b69b49fd001ee198ca1 | ORPH
  sparc64    |          fan-ctrl-1.3          | NOK | http://autobuild.buildroot.org/results/4006f68339f2fde5c42b3f3ed4d0c55882f4fa70 | ORPH
    or1k     |          fan-ctrl-1.3          | NOK | http://autobuild.buildroot.org/results/3794799fa108cf531c7d8c7cbdee1f9cda83b69d | ORPH
    arm      |          fan-ctrl-1.3          | NOK | http://autobuild.buildroot.org/results/2f399cbf46a82409bf81b6a17b5c1bb4031cb3d8 | ORPH
microblazeel |            fastd-22            | NOK | http://autobuild.buildroot.org/results/bdb7ded1e776676fe20bd620d9c3bc805c4c2842 |     
    arm      |           fbset-2.1            | NOK | http://autobuild.buildroot.org/results/4957933f570a4f6d266514896a035cfbf7983082 | ORPH
    arm      |           fbset-2.1            | NOK | http://autobuild.buildroot.org/results/a93b07e84e2ced23c72838081b3a332268c4feec | ORPH
    or1k     |           fbset-2.1            | NOK | http://autobuild.buildroot.org/results/38ed00a0b0bd6e10826d00e60910906a5c7e9f19 | ORPH
   nios2     |           fbset-2.1            | NOK | http://autobuild.buildroot.org/results/8ddfb31c25dc75c9fd315736b74e9989bceeb74f | ORPH
  mips64el   |           fbset-2.1            | NOK | http://autobuild.buildroot.org/results/5247a20cdadfe98557fdec9c45c71536c5548fc2 | ORPH
   mips64    |           fbset-2.1            | NOK | http://autobuild.buildroot.org/results/c6a8356ae569a527afd654daeb0b13d75c1cc537 | ORPH
   s390x     |           fbset-2.1            | NOK | http://autobuild.buildroot.org/results/ecc2d3390078a650a5d41dfc52449f1ba0d2d717 | ORPH
   armeb     |           fbset-2.1            | NOK | http://autobuild.buildroot.org/results/62b6208fa77f612a2a4f76c15aec8faf4bc4c667 | ORPH
  mips64el   |           fbset-2.1            | NOK | http://autobuild.buildroot.org/results/e10d171ae5eb9b471768997406d25cfaff61ab99 | ORPH
powerpc64le  |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/e4741389894827af8db36d9df4d07c1ad993e748 | ORPH
    mips     |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/657124a17d0cae53146bc178458167d3cdbd3a0f | ORPH
microblazeel |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/0f430807720c9c406e8e2256a683fcc59a914c3c | ORPH
    i686     |            fd-9.0.0            | NOK | http://autobuild.buildroot.org/results/8c2f9e47b4a728af73b1b1a349021391dd299414 |     
   sh4aeb    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/7ac923520253b41387488e7a9d8eb91c15022ead |     
    i686     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/ec9c7a491d479b942d38896d5ffb160618971772 |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/f048b84b3da955ef4e4b8b4b93669b3f6a78cfa9 |     
powerpc64le  |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/15060bad0f1ff1482b534335e43a3ca6bf9301b4 |     
microblazeel |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/ec83b36d7cd07efd2b90a8450697ff48a8958558 |     
   mipsel    |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/6aa9ce1b9f29bea6c0c0e5c08a2aa1901e47cd8d |     
 aarch64_be  |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.org/results/4c71e414a4dcc4671acf4633af6142845d031634 |     
   x86_64    |           frotz-2.54           | NOK | http://autobuild.buildroot.org/results/82f18a1aa647b6e94bd2e2536453ebc1ecba2a22 |     
    arm      |           frotz-2.54           | NOK | http://autobuild.buildroot.org/results/517b99b2fc0ccab2651c70f52c745c742851a17d |     
   armeb     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/e5cc1f7babde75d1938802f8239bf29ac8f69ffa | ORPH
  sparc64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/5c69b310922cfd06aab81b560934c2079ffd5944 |     
microblazeel |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/e2950bd1d0ad70c46e5cd26b94070ba149970794 |     
 powerpc64   |          giblib-1.2.4          | NOK | http://autobuild.buildroot.org/results/f2a4792c619cbf209d8b5fe1396c91fa84b058b3 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/e82183a316a60a6fc295726e64049bcfa18cec61 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/d1608b95c8b23987744dca134656769d72705888 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/071ca183c6f0bc0f511d09d3caae783e79ce9d6d |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/fa9960365bd54872762d5e959b98882b86c5e956 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/7ceab7aeef37dbee4bb960d449a3415db562526d |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/fa795fccf33785b0f30b9131ebff27749dc62bf0 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/c92a419e372e57424d721cd7eda27f509a85b56b |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/819f944c152129adc221add5473187b5fbee2d40 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/6e21d9f854242340c9348916150222426cb68d5a |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/5bbd8ed9bccc5ed11eaa4db1adc8851d84394074 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/8e684c5ee209cfc7794f7aedf2d10f15c042201e |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/dc691ad2bc1f75f2cf526015c44df720771de0e9 |     
  riscv64    |           gmp-6.3.0            | NOK | http://autobuild.buildroot.org/results/63f32c9d5d4097ef2b3cbba1ce665e13e9dbd430 | ORPH
 powerpc64   |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.org/results/bbbe369ef85df16a9d109c44bd8097f1f28ecb22 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/6d711fd018aa9e071e87a99bda75bfcb16f54381 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/14754837154cb642c526bab67c4f35213d455f84 |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/ca6e388dc1019006b16d5a16cab91e2cbe470437 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/8dd8c4f7147ab7bcc8f96f2a302e2dbf39c867c9 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/9025440ddb4eef6ead61944f4f088e836e76db39 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/2670b0c465543b98d79effa843ec4cb7879b4cd6 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/67dfdced32e730d1e8480fcdb6671d5dc0ad80c7 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/01c431f3ebfed112cea6e75ab3d64adb5d65b58d | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/7534c88d52bf26c212458d28fb841a87a339fd01 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/875ce9abaa94a3de1655d25759f9169799c5b2c6 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/40f523531a4496794389bc61ed65e3071a05c497 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/cd57f698d6f46425bf261ba17c9830349f68169c | ORPH
   sh4eb     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/b23823394a9430c2844f6a612705a5a6a909b7b8 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | http://autobuild.buildroot.org/results/66a80eefd57d09a9bde997294f152e0646a1d2c1 |     
    arc      |    gst1-plugins-base-1.22.9    | NOK | http://autobuild.buildroot.org/results/eedbbce87d78d8d9f055971d28dc203e983b13dc | ORPH
   x86_64    |         hddtemp-0.4.3          | NOK | http://autobuild.buildroot.org/results/40c6bf485e69841bc1975471937da19a44910ad9 |     
  riscv64    |         highway-1.2.0          | NOK | http://autobuild.buildroot.org/results/0e712a6896f9ced25e06d7bbf4841c175b531a1a |     
    arc      |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/350defeb696c964f553bfee5cc18326a0403418f |     
  mips64el   |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/e036643796f20901bc1881eb3b7b08bc3b4d3402 |     
 microblaze  |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/7299315224e624ae20ecc3413e5bab6f9fa49099 |     
powerpc64le  | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/df6cb657a46b6474970aa414589466c5e379bf0c |     
    arc      | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/c272fef267eac4a1bb5f26aebaf7dd2fe2bcd0a6 |     
 powerpc64   |       host-ccache-4.10.1       | NOK | http://autobuild.buildroot.org/results/c81eb71dd98f8da566e0aa29ca6edf79ca84e2b6 | ORPH
  powerpc    |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/4654763880061d3b2d74dfbf00c8e99e7e507385 | ORPH
   mips64    |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/7ac7ffe918db22be7e7cf09c85f6461fddbb791d | ORPH
  mips64el   |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/d724956fac1d02042997551122fe3fd0f43b4463 | ORPH
  mips64el   |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/287c1bd46b394d532209a70e137d7d5a0ac5ae90 | ORPH
   armeb     |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/b0b49b773892904e3c8a3fc0afaf89c59d603022 | ORPH
    i686     |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/9d5c7629e09ed90a19513f1987d9b5124ce2bfdf | ORPH
   nios2     |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/1e67162b7d83a7d533f17ec4875a2e08eafafd2c | ORPH
 aarch64_be  |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/f8166320f02a69cfe11d40a0e049378cbc72197e | ORPH
   armeb     |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/9aa2a001670a7a3712e0e1baf9adf631a9ca8f87 | ORPH
   arceb     |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.org/results/985e5b9ff47ce6123ad24dce447a9acb9315b985 |     
powerpc64le  |     host-gcc-final-14.2.0      | NOK | http://autobuild.buildroot.org/results/529bec7ef338842030d3340d9b21d8fd16d8639d |     
   sh4aeb    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/08b00e6184f6cd414fa13d06bc43e4987b95c10f | ORPH
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/be93c70ec5261e95bc6f66d754cb76062077ac9b | ORPH
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/c191587e0f62c1d0eac72a8c868d8a080a5f5004 | ORPH
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/541bac27f0c117b3c95d702cd03d097965decd3b | ORPH
 aarch64_be  |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/d9faa83e55a9d5ec273df9c57394335465afe3e7 |     
    i586     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/37a529c86d462d56ae5521424c6cebc054da575a |     
   s390x     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/e32b3c1cec95a57ac4bc3c081137f8bddf4f65eb |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/878d294c8ef2f3a9fe353e202b2b6bc4adeffbe5 |     
    sh4      |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/03665763ef7c4af58be64bc3b4fc35a194fc8296 |     
   nios2     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/58a2af536df25959bd07856a0371fa432307a04b |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/2cc8bf10f7b89dbe3ef4a4e7d327162dfaee40b2 |     
  mips64el   |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.org/results/ee00fd956dee21fd992888bb7bac8448ede6dad3 |     
    i686     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.org/results/9c412b6ddd074042903563ee10bf03ff4a628c9d |     
   armeb     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.org/results/4358cc0f1ffd6e94a6e26f37b8714681e2b691f1 |     
  aarch64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.org/results/b849b6384324ae21a24de026bb21d2020292fb88 |     
  riscv64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.org/results/fdce9d2b9b92e2e116f0feb936bf5b47e1393100 |     
  riscv64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.org/results/9b3b1a91c7a90d90e29ec2cb2abdd68973c457e4 |     
  sparc64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/b1d39c81bc7061ff9ee074946f31ec388af2e64e | ORPH
   x86_64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/0b714b505d96da0d7c2c40b63aeea5addb3ee1e9 | ORPH
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/13f5427de0a6a4b2b76f9e651bb119ae345e37df | ORPH
  aarch64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/21e0674a81af2f3a337db2dfb176ea0d93ace292 | ORPH
   mipsel    |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/ed018adafb978cc58eebfb0c3d47fd41938a55e2 |     
   s390x     |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/e1bbae3ab3c2eb9716cc12d3a6c1dcef71479c7a |     
    i686     |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/d8e80bd3a3be43b1f59e8f84701b4992f1cc7f3d |     
    mips     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/8beafab7278c8ba6111314c02962af7a09090987 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | http://autobuild.buildroot.org/results/b6271719153be7f7d4a8d87e7225381af141d7bb |     
  aarch64    | jailhouse-e57d1eff6d55aeed5... | NOK | http://autobuild.buildroot.org/results/310818d4d2be165768344696a8c5d246e1338fc3 |     
powerpc64le  |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/7de742d30062666d222136fd0800162d8c67aaa7 | ORPH
   x86_64    |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/2c0186584dffceee6b3be27a90ddc490f0730bf5 | ORPH
 microblaze  |         libcuefile-475         | NOK | http://autobuild.buildroot.org/results/17fcca8935731fec570648b7d91e057904aa10d1 | ORPH
  aarch64    |         libcuefile-475         | NOK | http://autobuild.buildroot.org/results/404825c3bc77a56c7dd31bcea193dfa1bc0ce01f | ORPH
    or1k     |         libesmtp-1.1.0         | NOK | http://autobuild.buildroot.org/results/88b190d8f78e3f0d388acf9f60860d8c337eca54 | ORPH
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/13f158065915078b98e989a9f585262fedaef243 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/38ca32f1fb5e2df1cb57e7fd57a686cd24ee86fe |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/f090a7729260c4fe0209fd4351f7ba0a03942ab3 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/8890db86fd1cbf7cc9cb357fa921dbe77e5ab3e9 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/b3d86a0c72be4d6203612715cb41f338cb769ae0 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/6e1610cce80adf9a77164ba35b949042b06ae0c3 |     
 aarch64_be  |          libglob-1.0           | NOK | http://autobuild.buildroot.org/results/6bd52f2e10aca1dc27ecf765eeff8526f5784878 | ORPH
   arceb     |          libglob-1.0           | NOK | http://autobuild.buildroot.org/results/ff2695cc355f66fc179539fc675cd3bd404fd008 | ORPH
  aarch64    |          libglob-1.0           | NOK | http://autobuild.buildroot.org/results/43b9e7bb646943c4f705390cb5097ceda5aaaf88 | ORPH
powerpc64le  |          libglob-1.0           | NOK | http://autobuild.buildroot.org/results/fa266cd113b87ed2a8c9c299f6143977a97cbf1c | ORPH
   nios2     |       libgphoto2-2.5.27        | NOK | http://autobuild.buildroot.org/results/365e9313fd0fcd9ddcd93e1aab62587ab58d16c2 | ORPH
    arm      |         libjcat-0.2.1          | NOK | http://autobuild.buildroot.org/results/588f052af937e703a88574e844553bcc0bbaaf33 |     
  aarch64    |         libkcapi-1.5.0         | NOK | http://autobuild.buildroot.org/results/77243633783ac2d037d15d7e9c01384781fe700e |     
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.org/results/0dfc3167055f0632b32fcc83a0827b2b600bd40a | ORPH
  riscv64    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/21516813303042d1ed8bccdd955fcd5785ce62c3 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/da8c4158379b70b8cdfc7ead7bf495072cafbf65 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/a2d060ad5e5eee159914a9082fde09d16d7db932 |     
   nios2     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.org/results/2f10c057fb846180bda6bf650b7990246ef8a41b | ORPH
 powerpc64   |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.org/results/5337ee3617c0f2a38f421b050fc68ac5a27b89de |     
  aarch64    |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.org/results/4efbfeed3d2a217369077beb1f7fba4a938349af |     
   x86_64    |  libtorrent-rasterbar-1.2.19   | NOK | http://autobuild.buildroot.org/results/d8645a00befc9eb48dd3e8ca296bdec84afefb09 |     
    i686     |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/ad63b7801ae98533021133869f07312722db7031 |     
   sparc     |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/53b5ed51f4d6443934633c6d9a62c2bddf06d4c0 |     
 aarch64_be  |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/de361fc7f63df2669b28c96e9e2811f3daee4ed1 |     
   s390x     |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/e653ebe2a257c62f88058eeecb4ab6e80bfdbbaa |     
   nios2     |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/8e515f01e1df769d50ad39e04ebdc575ed7fa83f |     
   mipsel    |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/96066dc39fc8cd38e45e787fc9a33e2f33e42f23 |     
    i686     |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/682d92fa3a05a8315a7bc5b4c3bee5ab4bf58541 |     
  sparc64    |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/60349037f9c0d0806766e1fcb31e0e55b911f2e2 |     
   mips64    |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/86f53aa9202db812777db66fa31d893eab5f33f2 |     
    sh4      |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/d7132abd5898128f6be152ef2e9a0e6ef5bf1c8a |     
  mips64el   |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.org/results/47f4f47b3ae3a565e25e36294268bc9efafee88c | ORPH
    i686     |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.org/results/00ae42b0804a1fee3b7d6ee8c0a55818c48223b2 |     
   sh4aeb    |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.org/results/c264a4ded740bd8b9bc0d5dde651d701b2bf3f11 |     
   sh4aeb    |          libva-2.22.0          | NOK | http://autobuild.buildroot.org/results/8880a9938c5e66cf3ba674a7a0c6f33ff44716d6 |     
  mips64el   |         libvpl-2.12.0          | NOK | http://autobuild.buildroot.org/results/753726cbdc69ce6be2e920caddb93e0d1bb8e092 |     
  mips64el   |         libxml2-2.13.3         | NOK | http://autobuild.buildroot.org/results/b60ddd630b5478a0efa438139a3b4acb70fd1b54 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.org/results/eb74c8072e5535172b9233c02f4cbc684f964668 | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.org/results/3ff61aeeb1ff6bc94a9aabd001ed2fa8432a83df | ORPH
    arm      |           links-2.29           | NOK | http://autobuild.buildroot.org/results/4e9d6e2f0fd9c5a824115efc6d76f75e3a639816 | ORPH
   arceb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/a5bda96322be0a3914d67adee1e5b6b81ccd467d | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/fd581e9d9de0a97a5757d076e4cd4371523d6066 | ORPH
 powerpc64   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/9e1f4511414eabf0381ce57cb5dff12651ceae8a | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/5595994ca597646ee05f50aed7fbebbce78c1e5f | ORPH
    or1k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/b4330df1bbeb89510c9d9289b7c6c94856401302 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/bc7a96259865c602f14858c1a6206beae366f955 | ORPH
   mips64    |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/d81ad637d92b677ecc5e06047548c543cde3485f | ORPH
    arm      |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/b5c200b79d6bed471a86ecaab3899ea7333887ac | ORPH
   nios2     |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/ba7b92f45188d6761a2eeff0ec04a6887098e884 | ORPH
   nios2     |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/c2634d7109ac8030f8c5d7036a26eb50785f25cb | ORPH
    mips     |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/8eecc0b4357528db58f56f0c98efabb7d415ad2a | ORPH
  riscv32    |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/dc940508461ebc973b432bb565238092086ce51b | ORPH
   nios2     |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/2129742191f49e2ced0680807becad66a887e035 | ORPH
  sparc64    |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/8b65f8bb4f3bdf4af5e5b12deec0be7b910dac22 | ORPH
   mipsel    |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/87d054ea61fc99042c5ecf1cbb7accbaa4caa26d | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/199f511443183df4e05fe4c6fb5f65c8e2a4b800 | ORPH
   x86_64    |       live555-2021.05.03       | NOK | http://autobuild.buildroot.org/results/cc1e864b4e1bea63a547b9572c7188cbb59a5cf8 | ORPH
   mipsel    |         lrzsz-0.12.20          | NOK | http://autobuild.buildroot.org/results/3eb94eac3e0e1a04d41c618ed9ea2e4e398ea48a | ORPH
  sparc64    |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/f9e70350a89ca3071478670a453bc9068c8a2e60 | ORPH
   s390x     |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/afb47b8dfc298fe1898e8602cc0ba7bf3a03ceb9 | ORPH
   mipsel    |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/b696653eb777c948dc1dece5c9d10ad251c31b22 | ORPH
microblazeel |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/f2c681c09037fff99bbc29d7bd0e1b4da6148853 | ORPH
   nios2     |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.org/results/0dabfba1b1445441396382c7df0efacc639e0037 |     
 microblaze  |          lvm2-2.03.23          | NOK | http://autobuild.buildroot.org/results/32869786bddaf877b4952abb0cbb636831b6f16c | ORPH
 microblaze  |          lvm2-2.03.23          | NOK | http://autobuild.buildroot.org/results/6b97736c1528d95c9d3aa4029ab41bd69cb7c6e3 | ORPH
    i586     |         memtest86-6.20         | NOK | http://autobuild.buildroot.org/results/56c975c34b2c47d3b08a580c337642de8e89dc57 |     
    arm      |          mender-3.4.0          | NOK | http://autobuild.buildroot.org/results/8016eaf0dc379206998efdf2ee1cab97bfffeb82 |     
    arm      |          mender-3.4.0          | NOK | http://autobuild.buildroot.org/results/9791e0c0c1d72419d70b5434902f58730680d3c0 |     
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.org/results/97d0327a23fb5116be96d5b5aaea92a38b600702 |     
   s390x     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.org/results/92661460db127da26ce1aa2519670906b12e8314 |     
   x86_64    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.org/results/913b702e8d4e59643c7eb016b3cc635ba6640d77 |     
    i686     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.org/results/21d162bbbe1eddffd4127b67999d6e7c9f606f6f |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.org/results/604546acef2389a6a13535482c9b3d01505a276b |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.org/results/96acbc80615b4b8849364964b40ab01c1580e0c8 |     
  sparc64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.org/results/15d3c7699666bf803162c1f2d8eb8ab5a8b838bd |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.org/results/9e5c42b9ccb45e5f9e88a1f059b403b012892519 |     
    or1k     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.org/results/3b25169fd051841e0183d5f1042cccbd6b3172c0 |     
 microblaze  |           mpv-0.35.1           | NOK | http://autobuild.buildroot.org/results/fd136b6daec6dc3ac326ac95dff5e1fcfe382832 |     
  riscv64    |          nanocom-1.0           | NOK | http://autobuild.buildroot.org/results/85d62582496ca5a66237be42d87cb05ac2f9d365 |     
powerpc64le  |       netstat-nat-1.4.10       | NOK | http://autobuild.buildroot.org/results/6eda21c838b421f5aa47de85fb633ee7b1716f07 | ORPH
   mipsel    |       netstat-nat-1.4.10       | NOK | http://autobuild.buildroot.org/results/68900d9f6b65c1e6c53008c34a48ec80e28b9ebb | ORPH
   sparc     |       netstat-nat-1.4.10       | NOK | http://autobuild.buildroot.org/results/aa95dcb424a92cb3ba8485024f5f7a8ad899de99 | ORPH
  mips64el   |     network-manager-1.46.0     | NOK | http://autobuild.buildroot.org/results/b707416284657d716e9c65efb7b1a768c03cd9b6 | ORPH
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/6520a711c3a73d28b92f837e24e7f5f6c44ff256 | ORPH
 powerpc64   |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/9dc1d888160d20bf7ec896456f7182f9bdd33c1e | ORPH
  riscv64    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/4ecd87c6da143f5e8a5c9315778a6efc715a5b82 |     
   mipsel    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/98942a702fb40deed97cb2ddef414d6137408b4c |     
   mips64    |      obsidian-cursors-1.0      | NOK | http://autobuild.buildroot.org/results/a9851ca336bc9541c15c49d2e0b197ead5115bd7 | ORPH
    mips     |        openconnect-9.12        | NOK | http://autobuild.buildroot.org/results/22905b5873c508015a6c9ff59187680d251519cf |     
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/8fd0a46cdfd0dc3c8103c94e82bd390d87303efa | ORPH
  powerpc    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/3a0676c71007d20bd9946c1341b339fe820efaab | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/f022d5759602ba7ffa064842f62f8f9986094265 | ORPH
  powerpc    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/67073e4d32a690bd6932fa00af8637e287a97df3 | ORPH
    i686     |          p910nd-0.97           | NOK | http://autobuild.buildroot.org/results/9a232064b897b74cdcaf5cbee82be927e7b00eb4 | ORPH
    i686     |          p910nd-0.97           | NOK | http://autobuild.buildroot.org/results/c4c6b26ffdbdb8a4d5a0ac40953053534a02850c | ORPH
  sparc64    |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.org/results/a181e3160f8e177acd9f5762dbfbec7d071777a3 |     
  powerpc    |        pipewire-0.3.81         | NOK | http://autobuild.buildroot.org/results/60a4d77707f9892e44e819c042e640e301a65f72 |     
  mips64el   |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/d8251012982eb867ccc1cbcb92ef1726ea78bf2c | ORPH
  sparc64    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/a47563953801582aa223979e01ce4b1e0a661ce8 | ORPH
 aarch64_be  |        popperjs-1.16.0         | NOK | http://autobuild.buildroot.org/results/3a79d76772cce1e56bb2f6552af8af3ae0294b16 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/41bc1a161a618ae46a9f7e56e9a96a487e544f86 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/a0b14d5d13bf7c2456016199fa04269d2c2d9f1c | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/8bb29eb45f0a0552aa06b034d74ee9adc836694c | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/f54dcc13527c17d9a9f8f98cca7e6f61d2308303 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/dd119fb9205f53ef1e7ad7ae2e2c84effc89fe98 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/395a44e0c3a6a1f5b1359cdcd1e2501a342a48bc | ORPH
powerpc64le  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/3939e7ce6a51293b773ca12b9a200a7a3816d533 |     
powerpc64le  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/a4713d038cae69c1dc207b248366c7c3db79a101 |     
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/d673451952eedacdd537556f92007977b0ba595f |     
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/1711f436f74a58694a800d7dd9fa700acb7d0325 |     
 aarch64_be  |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/92b3d67bc8e24e91c4fe0e7a68b2c79f24ce51a2 |     
   nios2     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/c0413b49add9149994dbc7452b76a6d8ad5be264 |     
  aarch64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/b322bcdc77a64ec08c6a3d2fd5d5de66648a687a |     
   sh4eb     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.org/results/a246ace4172d4c299309f4207021a443c4abe2a8 |     
   s390x     |           qemu-9.0.2           | NOK | http://autobuild.buildroot.org/results/ec0cc9025df631d4fa18d2ba085bb5ef258fac5c |     
   mipsel    |           qemu-9.0.2           | NOK | http://autobuild.buildroot.org/results/67a39965d9ca732ac4c70c9b2cf2ba98073dba6c |     
    or1k     |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.org/results/e90c97964e085cd67d1e75ad7633ddd0db55f07b |     
  riscv32    |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.org/results/2db676351126173ddc53bf1805eaf25efd56c45f | ORPH
 aarch64_be  |          rauc-1.11.3           | NOK | http://autobuild.buildroot.org/results/ff11c8f254725fbd0d81b5206f8588be77fb9635 |     
   s390x     |         rdma-core-52.0         | NOK | http://autobuild.buildroot.org/results/3b90da2c93a4243ca366019fb97f453462deb43e |     
   sparc     |         rtptools-1.22          | NOK | http://autobuild.buildroot.org/results/418b1529a9ace96e300c8d016a6637c2b63c022b | ORPH
   s390x     |         rtptools-1.22          | NOK | http://autobuild.buildroot.org/results/5d21c6b25c825c88eed7d0e2b98841a900c2d5c6 | ORPH
   s390x     |         rtptools-1.22          | NOK | http://autobuild.buildroot.org/results/49f34756f0e40dc3d3ae269b5722c9d2cde86d25 | ORPH
   s390x     |     s6-linux-utils-2.6.2.0     | NOK | http://autobuild.buildroot.org/results/7c95c87be9b0386a888d3a6ae7f2a6b160041ca5 |     
  aarch64    |           shim-15.8            | NOK | http://autobuild.buildroot.org/results/9cd12ed92ed862ab47b67b27b98fa7e7d8d86f3d |     
    or1k     |        skalibs-2.14.2.0        | NOK | http://autobuild.buildroot.org/results/1d423f38df09af79077eb5c0a204b191b06abe01 |     
    mips     | squeezelite-71c012ad9ba102f... | NOK | http://autobuild.buildroot.org/results/bc1d6be034e9b95db22b005b5488fbd5986a2a68 |     
   sh4eb     |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.org/results/1265ff33b5b92f5c6a8f3381ae1f70823283775e |     
 microblaze  |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.org/results/4547e6cae614d78a244aaad49009ba3487e9de93 |     
    arc      |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.org/results/095f4d62f13f822d1517e2c977cb3835dec8054b |     
  aarch64    |          swipl-9.2.6           | NOK | http://autobuild.buildroot.org/results/e0bfcfaed0fba54ba866384841fdd7f2b4dd91b9 |     
   mips64    |           szip-2.1.1           | NOK | http://autobuild.buildroot.org/results/9533bb5a2a28f2eb085fb5691f625188686ccabb |     
    arm      |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.org/results/e289311afd4494709462f64d0aa9e3579dd37d25 |     
  mips64el   |          tllist-1.1.0          | NOK | http://autobuild.buildroot.org/results/9714e757066db541f9b59832cffdecc2b2179895 |     
  aarch64    |          tllist-1.1.0          | NOK | http://autobuild.buildroot.org/results/22824546f9d0e10021378be8d1d4defc236764a6 |     
   nios2     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.org/results/0e3f8c11e138368b9d83acbfc19f292791e862b1 |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.org/results/64fef77ed6cd2eded1f2e621e712ba9cdf614b53 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.org/results/226e56869cf747c6e1fdd40be5eb6f5408d7566f |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.org/results/d418b14e06b5265b886a2aab11b433f50f3bedb7 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.org/results/c62865017a359815600de4366d13f8e09b70c2d0 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.org/results/cb4168137f86238661609ac7468edf33da155ada |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.org/results/2b8c56762e8ed7a974f8fdfee7c4f8abe72a58b0 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.org/results/9c5b2b2cb5fd040b8bbd4f6649f01795e3abfcb2 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.org/results/64ef74ae4283a45743cc5055ff6d1506b8d7c32f |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.org/results/ca2cbcd23e057f7691598e999bea9b81abde493b |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.org/results/fea9a34e7b3e14c8fece6787bd611f86ad4ed1bf |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.org/results/ae126ca37c2b0990b0556c66e2ac9bc039f688c1 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.org/results/3f7c3572f3d31ae28a3af36c13115998d0c91863 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.org/results/ddc9944b8149503fd6eeb6130b85bda45479008a |     
  sparc64    |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.org/results/52d5f72c6bc7c05715b95659c3ac0626d08b6ab4 |     
  sparc64    |           vlc-3.0.21           | NOK | http://autobuild.buildroot.org/results/2b0717267950199cc57868d5b1a93bde7c8eef8d |     
  mips64el   |  wireguard-tools-1.0.20210914  | NOK | http://autobuild.buildroot.org/results/d63b8f5b14487f6d79c9779bb7fe4829fae0653b |     
    arm      |         wlroots-0.16.2         | NOK | http://autobuild.buildroot.org/results/ca85c68bb77b8d128fc78093a1fce2f227d250bd |     
   mipsel    |         wolfssl-5.7.2          | NOK | http://autobuild.buildroot.org/results/ad29b148a88c3addc05e7d5b6b65305b80305949 |     
   mipsel    |         wolfssl-5.7.2          | NOK | http://autobuild.buildroot.org/results/ba5c78e285cdebaf2dcad72c9d17326bfc55bc7d |     
 powerpc64   |        w_scan-20170107         | NOK | http://autobuild.buildroot.org/results/bdec9424941b9657c019e601b59a7080eeaf6d46 |     
microblazeel |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/b5796a4244407f96205c5381b5efa45fa814a05d |     
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.org/results/def18b3c48d9352782ec3505e4901beda89b74d1 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                       unknown | 3 
                   bird-2.0.12 | 2 
         gobject-introspection | 2 
          bash-completion-2.11 | 1 
                    bat-0.24.0 | 1 
             cni-plugins-1.3.0 | 1 
               collectd-5.12.0 | 1 
             containerd-1.7.18 | 1 
            cppcms-2.0.0-beta2 | 1 
                 dhcp-4.4.3-P1 | 1 
                    dust-0.9.0 | 1 
                elfutils-0.189 | 1 
                      ell-0.63 | 1 
                  fbterm-1.7.0 | 1 
                   foot-1.16.2 | 1 
                gnu-efi-3.0.17 | 1 
  gobject-introspection-1.76.1 | 1 
                   guile-3.0.9 | 1 
         host-gcc-final-11.4.0 | 1 
               host-go-1.21.13 | 1 
host-heimdal-f4faaeaba371ff... | 1 
          libcamera-apps-1.2.1 | 1 
                  linux-6.6.37 | 1 
                   linux-tools | 1 
              netopeer2-2.1.49 | 1 
                 openssh-9.7p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
                   perl-5.38.2 | 1 
               valgrind-3.22.0 | 1 
                 x11vnc-0.9.16 | 1 
                xenomai-3.0.10 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |      bash-completion-2.11      | NOK | http://autobuild.buildroot.org/results/d73f22e032dc47d36d5a006b12afc62895d8615f | ORPH
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.org/results/0060a05797534e4211e67753baa1d58919971f2a |     
    mips     |          bird-2.0.12           | NOK | http://autobuild.buildroot.org/results/6a771d6dc858461ff8f5f97f675d334b8911c75c |     
 microblaze  |          bird-2.0.12           | NOK | http://autobuild.buildroot.org/results/84e2e072bbec04696d7a6cf2a356fb104eb0f82b |     
    i686     |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.org/results/3435dbb8a995fb85642256ac0f21b0a5ef217fdc |     
   armeb     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/a70cf6920d88af90802adf5aff4e9a4db5c24a5c |     
    i686     |       containerd-1.7.18        | NOK | http://autobuild.buildroot.org/results/3d50bd23c1dfa0f841f155d565fc7af60bd6d94c |     
    or1k     |       cppcms-2.0.0-beta2       | NOK | http://autobuild.buildroot.org/results/74827ff22cf623c7459e1a5e96a96a9f115f31cc | ORPH
   xtensa    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.org/results/70f8c2fe273669c10e466a80bfa32845d753dbbf | ORPH
  powerpc    |           dust-0.9.0           | NOK | http://autobuild.buildroot.org/results/d96bbf8874e07738cfaf1c0681a5eea18216ed0f | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/d4d492ca4b3ed725b566f5cc78362e5c3a867eec | ORPH
   sh4aeb    |            ell-0.63            | NOK | http://autobuild.buildroot.org/results/2bf539371c8c1171f2c3bc541b32c9caadc79d9c | ORPH
   x86_64    |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.org/results/d5883f9519b6052ee7ddbf4f9c0f4e5c2f61afe4 | ORPH
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/32c2a4d8d79c19961c5afe728dc01fda55ff4f45 |     
   armeb     |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.org/results/47783c8c0b008a07aa53e242bcb2f613de52f836 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/6236f77ff5f37d411c1805b34f5a9a86fe8242f1 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/9af141155c8ebbb29615202d731a441fb38d355b |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/179a817db9b2759c1f29487f2a150b15cdd5fda6 | ORPH
  aarch64    |          guile-3.0.9           | NOK | http://autobuild.buildroot.org/results/b1dd913bd25bfa7d72603d2a5df1c6e2066a96dd |     
    mips     |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.org/results/641428197d37bc07649feb50eb7e2c65b3a0da0f |     
  mips64el   |        host-go-1.21.13         | NOK | http://autobuild.buildroot.org/results/976358c786d279d53cace1792c0b504eee2bd57b |     
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/61e2c134e5361b7d36ae30dd986d3bec7d965833 | ORPH
  riscv64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.org/results/4ee779b0f85145945bd0c9e59979d73dc8b2afed |     
  powerpc    |          linux-6.6.37          | NOK | http://autobuild.buildroot.org/results/a9157877d511fed796ccb2e9d0403db05ef15262 | ORPH
   armeb     |          linux-tools           | NOK | http://autobuild.buildroot.org/results/2419e8dba902fe561b875ab57b8a0ca6a8f4e58e | ORPH
microblazeel |        netopeer2-2.1.49        | NOK | http://autobuild.buildroot.org/results/c03c1649973f3e4c42f55d2b2cddfeffaa665d91 |     
powerpc64le  |         openssh-9.7p1          | NOK | http://autobuild.buildroot.org/results/e9c682ce1075965bdd8adb75aad9dd22dc626ce8 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.org/results/0669d9d361898fab9b0c6a416ee47d61e3ded5bd |     
   s390x     |          perl-5.38.2           | NOK | http://autobuild.buildroot.org/results/954ba0e208fe2696f43c4c44742f3c1303906cf9 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.org/results/97a5a02e2c834cf8285bb44c442d0f5576283951 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.org/results/6f19a35140e19ff5424d66b28d519547ec23b151 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.org/results/cbd23d4a78b5ae98144ce878b041b056822a42a7 |     
    i686     |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.org/results/51ddb2caacaa87886314ba64268641383df32116 | ORPH
  aarch64    |         x11vnc-0.9.16          | NOK | http://autobuild.buildroot.org/results/b8f70aef75b4215f7a6288a731920e6dd44a8a3b |     
    m68k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/d28ecd2a02240897c15d1dad288ff99a3dd0e68f |     
   s390x     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.org/results/672a62c2945deb61a8bb98f4d32a78362424399c |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

host-heimdal-f4faaeaba371ff... | 2 
ibm-sw-tpm2-5452af422edeff7... | 2 
                  acpid-2.0.34 | 1 
                 agentpp-4.6.1 | 1 
                 c-icap-0.5.10 | 1 
               collectd-5.12.0 | 1 
                 coreutils-9.3 | 1 
                elfutils-0.189 | 1 
                  ffmpeg-6.1.1 | 1 
                    gdal-3.8.2 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
         host-libxcrypt-4.4.36 | 1 
              host-runc-1.1.12 | 1 
          libcamera-apps-1.2.1 | 1 
                libressl-3.8.4 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.8.12 | 1 
            linux-fusion-9.0.3 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
           mediastreamer-4.4.8 | 1 
                    ncmpc-0.49 | 1 
                  ntp-4.2.8p18 | 1 
         python-pymupdf-1.22.0 | 1 
                 shadow-4.14.5 | 1 
           tesseract-ocr-5.3.4 | 1 
tftpd-e52af4207a6e09a1ba21f... | 1 
                tinifier-3.4.0 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.org/results/51be3c29085762510d88bfe9a59cb0fbe779e0c3 | ORPH
 aarch64_be  |         agentpp-4.6.1          | NOK | http://autobuild.buildroot.org/results/b17b74afdc577181d7f1272be88d50bc27c0121e |     
    i686     |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.org/results/c8cb549fcaee943450de6da3f742bc7b3bd805f6 | ORPH
    arc      |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/f5c9b41f86ed82f6dfa61d79896458c007691cc0 |     
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/c6206bbdf3cfcc766b30c9978031b1c9f905858d | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/f8e8915a12a53074ffd488785288adbfea492b10 | ORPH
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.org/results/05db120e77e02841f94c4b7fe9a3b87a5d50b225 |     
    sh4      |           gdal-3.8.2           | NOK | http://autobuild.buildroot.org/results/93137e3613fa71d4e390562df835c4793cf511a8 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/9f01a1ec0e9db5449729cf263237341650af2fa0 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/70b2258bff13bd8be9598ce654c595d6db2a1ad5 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/65be67c1c8e1a0b7d56c773c67c9f34d8d2c7107 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/698725a6cefed3f2181829cf097a6d0a8bc74549 | ORPH
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/760f6fd88bb6b7788f4fe9349648a871904ff78f | ORPH
  mips64el   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/e7f5e6da13af9174cef6fdcd188f955ab95c8e8b |     
microblazeel |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.org/results/47c4a88075d2ef1f119b120674d57b4fb29a13e5 |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.org/results/67a7c0bb5ba75e6baad300d9ed3fe355d5de70a0 |     
   xtensa    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.org/results/ee3bea42779780c250101197d1eda462cd7bbf95 |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.org/results/2bd32909ac621b028fa62825365feb0b11c1a616 |     
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.org/results/fd07ab64cde2335eedff33c37bb44fdb0320b634 | ORPH
powerpc64le  |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/4b3b98ab3ae5fe4de24b849ccf22a22d5795a1bd | ORPH
    mips     |          linux-6.8.12          | NOK | http://autobuild.buildroot.org/results/b85675e041e3e523e682b59362a8138b1f4a0d12 | ORPH
powerpc64le  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/84a3fa6a8617bc46bf346e13d4121b4886dc53d6 | ORPH
    arm      | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.org/results/d4d609e71ecfa38e4329da08ec0f8ef66f6e2dc6 | ORPH
    arm      |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.org/results/8b25919fb1a723ba23cfed5bed4cb2083ed0b478 | ORPH
  aarch64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.org/results/88310daa4770c8ef129da174e891286f77711385 |     
   mips64    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/8688c61f9c60ec51994750d74321fbc76ce05dae |     
  mips64el   |     python-pymupdf-1.22.0      | NOK | http://autobuild.buildroot.org/results/9fd0f21943914c6f2b3093240f38a4f4700cf8d8 |     
    or1k     |         shadow-4.14.5          | NOK | http://autobuild.buildroot.org/results/141c2b38f5e42d911b840ade2a7a5d1679ae6ee8 |     
   sparc     |      tesseract-ocr-5.3.4       | NOK | http://autobuild.buildroot.org/results/ff5734121df49f196b030619c3b99a34cb6395f9 |     
    i686     | tftpd-e52af4207a6e09a1ba21f... | NOK | http://autobuild.buildroot.org/results/4e122f1c6a0d15cc9eeb7656abd51f60d650e148 | ORPH
   s390x     |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.org/results/c82f52996e691aa08eb09df95929bc2cc13bcd51 |     
   nios2     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.org/results/4ea81156df15e39d8a2b330f250d48fcc38f3ca1 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.org/results/8277a6f9d925c7e9eec9d5ae035208d83786a2db |     


Classification of failures by reason for next
---------------------------------------------

                   atop-2.10.0 | 2 
               collectd-5.12.0 | 2 
                  ffmpeg-6.1.2 | 2 
            flashrom-1.4.0-rc2 | 2 
               procps-ng-4.0.4 | 2 
                       unknown | 2 
                     avahi-0.8 | 1 
                  boost-1.83.0 | 1 
                 coreutils-9.3 | 1 
                   eza-0.18.22 | 1 
                gerbera-1.12.1 | 1 
         gobject-introspection | 1 
host-go-bootstrap-stage2-1.... | 1 
host-heimdal-f4faaeaba371ff... | 1 
              host-rust-1.80.1 | 1 
                  libffi-3.4.6 | 1 
               libglib2-2.76.1 | 1 
                 libjcat-0.2.1 | 1 
                   linux-tools | 1 
                  musepack-475 | 1 
                    norm-1.5.8 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                   trinity-1.9 | 1 
             util-linux-2.39.3 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/e5e7a441dd1b959d41ea8936350fe9ab208e2857 |     
    mips     |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/96f52ebbdf304e98536ba9b6fdc014a056e155a6 |     
   s390x     |           avahi-0.8            | NOK | http://autobuild.buildroot.org/results/12e7fb49f8ca37d56b968c0c91006c327eed285a | ORPH
   x86_64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.org/results/4db13ab1abffb8872ca22363ffca341642bf7409 |     
   mips64    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/438ff904b47903cd7a72436b102f0a74a67840ab |     
    sh4a     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/381576f6569b9db9708cdab4af758b69324eac69 |     
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/e6dfa9cedb1b9aa35a3490bbc0d792fdf6e50cc2 | ORPH
    arm      |          eza-0.18.22           | NOK | http://autobuild.buildroot.org/results/c660b7ac92e81d3ba203e345d37210dbdddd3994 |     
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/c63a150459253dc851ff0d55731bdcb2b18189ca |     
   mips64    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/9beee24165f11b6b09da4c4a4d9064cf09333216 |     
  riscv64    |       flashrom-1.4.0-rc2       | NOK | http://autobuild.buildroot.org/results/c1a0089e6a5b14be36e8639f587ea751198a4b0d |     
    sh4a     |       flashrom-1.4.0-rc2       | NOK | http://autobuild.buildroot.org/results/97f7275bf54df04cf604f6855a49977e18fc1e9d |     
 powerpc64   |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/d81d1b9f9d9e8503c222375ab700de052bd5132b |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/393398ded4df2b7d9707c95c367ef64cd06b34c5 |     
    or1k     | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.org/results/2d61bc271a0bcfd62bb896be5022deefe935124c |     
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/6ff268d110bdbd4314577a0fac553a7e490f9edf | ORPH
 powerpc64   |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/37b1926b4cb6a59764c4ac633dd4f5bdc2960037 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.org/results/69f7f3e50d9e286f75c9a586cfca2852b05a7e5d |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/6bfbf469dc9415346b14a781e4a9be2989c8b6da |     
   mipsel    |         libjcat-0.2.1          | NOK | http://autobuild.buildroot.org/results/393af8c6847f6f2b7c76dee7e1aed58c095ae71e |     
   s390x     |          linux-tools           | NOK | http://autobuild.buildroot.org/results/594e10a7971323276b4e436d318e83dd6a50452a | ORPH
  powerpc    |          musepack-475          | NOK | http://autobuild.buildroot.org/results/391a7caa81fe95188357db2886214fe9eeddbbbd | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/1e882b478ebf3a7ab4d609743ee9cfea02b08459 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/a1cd3756a63e7e357c1c242572e33543fff0b107 | ORPH
    i686     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/3c89b73ebeff72408a8ad0f5e3146bcdd60d328a | ORPH
    arm      |     s6-linux-utils-2.6.2.0     | NOK | http://autobuild.buildroot.org/results/2454051abcf3006d55af551da7f585f4ec9ab643 |     
    mips     |          trinity-1.9           | NOK | http://autobuild.buildroot.org/results/142e729890ee20cf4e8eea810afa15ff589261d2 | ORPH
   arceb     |            unknown             | NOK | http://autobuild.buildroot.org/results/1b4bcad1a12f6690ae61ea219b88102c6f6c8706 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.org/results/c7c6800e072e9abb45f1f23c859dc945a43617cd |     
  riscv64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.org/results/9806cef0fc889a35d235ac7ad01a6e8748b23975 | ORPH



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
