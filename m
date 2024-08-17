Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1ACC52D7F
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 05:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE4B280F6B;
	Sat, 17 Aug 2024 05:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Ss2QpeXi_4x; Sat, 17 Aug 2024 05:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1590A80D66
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1590A80D66;
	Sat, 17 Aug 2024 05:15:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA3321BF406
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 05:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1FE780C4E
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 05:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vEuKObswYpz for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 05:14:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::244; helo=mail-lj1-x244.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1DE7480C19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DE7480C19
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DE7480C19
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 05:14:57 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id
 38308e7fff4ca-2f149845d81so26010221fa.0
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 22:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723871695; x=1724476495;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sCVSuS2f7Qrda0NPe9jchE5zVu/834LoAyq/xL1sjKQ=;
 b=bVcA+cedpJv6mskk7rwY1FQ4/t5W3JUSYGjEv60HwU/SBdpPmq9I6oq8YC2Gmc3Bsc
 qyUYw0uGvmJ10pe6hIl0qOJPELOGRMHa/2M/zCaAEGiTI7umX/jPqdSHxRC94dz9xBY3
 1z3bnnCrhnoODlo9KyRcV6iPikRV4VQdKdQlbgF9K1feIgQC33p4BVDqs1cXg7Zo403m
 X5rXQwXi0CNDqihdIa21a+rlJ707rbCwuZg6tdM8U9TdDlhxn37wZ+3FER8VPwZUH4PC
 G3u3K9G0g3U1060f0u+d0iByQ9tyYwfU+x/D6awfPXm86v7FQqu5EEWo4zafxm215yth
 DILA==
X-Gm-Message-State: AOJu0YyTkmHZ00mTPFDTPhEaYVjAkWDnLbDzpH75kMnRF04SmdkK4PDs
 n4n/cXfUSJMNQSVXvNWEahvGVeS8Le83pT5AhXyrkRFiSocW2ihKiqrv7OhAN+U=
X-Google-Smtp-Source: AGHT+IELR0MTmxZcbyYiSg+fGcEBh5cRY9EvHI0emGVDtrc3oefAY1o50mZLHPe79heHgFwul5fjOQ==
X-Received: by 2002:a05:6512:1243:b0:52c:e159:a998 with SMTP id
 2adb3069b0e04-5331c6ad02cmr3302832e87.29.1723871695090; 
 Fri, 16 Aug 2024 22:14:55 -0700 (PDT)
Received: from ks383786.kimsufi.com ([2001:41d0:2:8198::1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d3ff2e9sm773895e87.132.2024.08.16.22.14.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 22:14:54 -0700 (PDT)
Message-ID: <66c031ce.050a0220.202d17.69ef@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 17 Aug 2024 05:14:54 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723871695; x=1724476495; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=sCVSuS2f7Qrda0NPe9jchE5zVu/834LoAyq/xL1sjKQ=;
 b=U22GKJAqhM9XMmcmf/evH5+klSAaUUabJNf/LeIG9czmd4+35PmxJsCTCiYCUStKZT
 LbelFcFZx5CxvkQY3z5pGkWd7MgxBC7dl4KOoxsxw5kdudJ6fbPZRDVBBHzgtTOqDYl1
 dwIMjZ0MWpKfMTdHYShCBMHK2/XhRnc2KL/LkdWJmL58vTQiEKi9Xec8YwvH1FFHDZJA
 GM+XXZ/K2yeu3AlwQF8e+XvGRqiMxTd1NWsPiVs3TTm16iqzef4kKX44co4um/hjW2on
 s3sofdK8rb6HitnEmne0OoBRYt2ZFPBOUhjo+PQn5g5Jvcs/kxoXYLTdk2imCNLnvQeK
 jLKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U22GKJAq
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-08-16
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

Autobuild statistics for 2024-08-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  8  |  3  |  0  | 11  |
  2024.05.x  |  5  | 11  |  0  | 16  |
    master   | 162 | 201 |  4  | 367 |
     next    |  3  |  9  |  1  | 13  |

Classification of failures by reason for master
-----------------------------------------------

               procps-ng-4.0.4 | 12
                gerbera-1.12.1 | 8 
                     avahi-0.8 | 7 
      python-autocommand-2.2.2 | 7 
                gnu-efi-3.0.18 | 6 
  gobject-introspection-1.76.1 | 6 
host-heimdal-f4faaeaba371ff... | 6 
                    norm-1.5.8 | 6 
                  libffi-3.4.6 | 5 
                  linux-6.10.3 | 5 
                  ffmpeg-6.1.2 | 4 
         gobject-introspection | 4 
host-go-bootstrap-stage1-1.... | 4 
            host-skopeo-1.13.3 | 4 
                    mpv-0.35.1 | 4 
                 systemd-256.4 | 4 
                elfutils-0.189 | 3 
                  fbdump-0.4.2 | 3 
glibc-2.39-74-g198632a05f6c... | 3 
         host-libxcrypt-4.4.36 | 3 
     host-moby-buildkit-0.11.6 | 3 
                  ntp-4.2.8p18 | 3 
                 openssh-9.8p1 | 3 
             strongswan-5.9.13 | 3 
                 dc3dd-7.2.641 | 2 
                   foot-1.16.2 | 2 
                 gnuplot-6.0.1 | 2 
              host-rust-1.79.0 | 2 
               ipmitool-1_8_19 | 2 
                  ledmon-1.0.0 | 2 
               libglib2-2.76.1 | 2 
                    ncmpc-0.49 | 2 
             parsec-tool-0.7.0 | 2 
                    qemu-9.0.2 | 2 
                     shim-15.8 | 2 
                 siproxd-0.8.3 | 2 
                   swipl-9.2.6 | 2 
                 wolfssl-5.7.2 | 2 
android-tools-4.2.2+git2013... | 1 
                 apache-2.4.62 | 1 
                    bcc-0.29.1 | 1 
                  bcusdk-0.0.5 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.0.12 | 1 
                  boost-1.83.0 | 1 
                   botan-3.3.0 | 1 
                bpftool-v7.1.0 | 1 
              cache-calibrator | 1 
                  cairo-1.18.0 | 1 
          cloudflared-2024.6.1 | 1 
             cni-plugins-1.3.0 | 1 
             containerd-1.7.20 | 1 
                 coreutils-9.3 | 1 
            ecryptfs-utils-111 | 1 
        edk2-edk2-stable202308 | 1 
                    fcft-3.1.6 | 1 
                flannel-0.25.5 | 1 
               freeipmi-1.6.14 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
                  fwupd-1.9.20 | 1 
                 fwupd-efi-1.6 | 1 
        gmrender-resurrect-0.1 | 1 
                 highway-1.2.0 | 1 
             host-delve-1.22.1 | 1 
         host-gcc-final-14.2.0 | 1 
              host-runc-1.1.12 | 1 
libdbi-drivers-0bfae6c43134... | 1 
              libgeotiff-1.7.3 | 1 
        liblog4c-localtime-1.0 | 1 
                   libnl-3.9.0 | 1 
                liboauth-1.0.3 | 1 
             libopenh264-2.4.0 | 1 
              libopenssl-3.3.1 | 1 
                 libp11-0.4.12 | 1 
                  libsepol-3.6 | 1 
               libunwind-1.8.1 | 1 
               libvorbis-1.3.7 | 1 
          libzenoh-pico-0.11.0 | 1 
               lighttpd-1.4.76 | 1 
          linux-5.10.162-cip24 | 1 
                     mdadm-4.3 | 1 
                memtest86-6.20 | 1 
                mongodb-4.2.18 | 1 
              mosquitto-2.0.18 | 1 
                netdata-1.33.1 | 1 
                  nginx-1.26.2 | 1 
               openblas-0.3.27 | 1 
          perl-net-ssleay-1.94 | 1 
               pulseaudio-17.0 | 1 
python-unittest-xml-reporti... | 1 
           python-zlmdb-22.6.1 | 1 
                   rauc-1.11.3 | 1 
                    ruby-3.3.4 | 1 
uemacs-1cdcf9df881440497501... | 1 
                       unknown | 1 
                   wget-1.21.4 | 1 
                      x265-3.5 | 1 
               xapp_xdm-1.1.14 | 1 
               zxing-cpp-2.2.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1f49572f7182c58807ef98e829aedc74f4257e89 |     
 powerpc64   |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/02c76e3eb67c9d59f801faec4ce15e895eac28bb |     
 aarch64_be  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c72c8f59c592156480f48026c194a5fdf17362b3 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/1ddd2132a164dcce8ef909459f9bfda097caaad4 | ORPH
   sh4aeb    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/5ba94f74afd579c259b016bf00a292d2fd703b66 | ORPH
   s390x     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/6a091e756bda01a956ee4d69bb4a8053f675a5ec | ORPH
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/b11bf551260a890202ebc01b69f8c755202be207 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/5600ca7fcfa05ea16858a10b64b8f11262e22452 | ORPH
   armeb     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/27adbcf2708b7c7d5f6624bb8ec3b9ad5c39ae24 | ORPH
  aarch64    |           bcc-0.29.1           | NOK | http://autobuild.buildroot.net/results/fa58854dd9b382e9574663cbd6c6aa0ae816e3b7 |     
   sparc     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/872144bcb25265b1f3b5067833b7a183356bdae6 |     
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/cc37b1d21baa408a265618753de004794e03948e |     
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/5c6235c4afa0d5e2c3c99338c2e96dee12b5c276 |     
  mips64el   |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/a3d9f426c410c924b207c07e11e4080a0fec6c76 |     
   sparc     |          botan-3.3.0           | NOK | http://autobuild.buildroot.net/results/ab83b920156f5a1e51ef960e4007769b5c27d0a1 | ORPH
  aarch64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/d8ae1f9421c6480c14eb694ae67b9eefa227d8a9 |     
  riscv64    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/21554ed28ae2b55abb3ed596c5295e1e37dd4f9e |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d6434c233599f1b3acf26e4196d1a3b7a91bfa6f |     
   s390x     |      cloudflared-2024.6.1      | NOK | http://autobuild.buildroot.net/results/0879c91ef33092a0c7259117216fdc88e837b30c |     
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/3c2b17ae814a029958fd44b66ebb8847a7afe022 |     
    arm      |       containerd-1.7.20        | NOK | http://autobuild.buildroot.net/results/d577020b46098b10c9efbcb9212505012fc1c557 |     
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/4c6d855893188e1b3700178366ab653a21eead06 | ORPH
powerpc64le  |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1ed78a8c4592ca510889b577342263563756edc6 | ORPH
   mipsel    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4d4d71a463466ddfa9ad8bb2f53f33adbb01b008 | ORPH
   nios2     |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/8bce7d16f1156bb4f6fe9fd8d23b475d888397a3 |     
    i686     |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/423d44e4615e16128c20ea6372eb7137e282cc55 |     
    or1k     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7859e606eb1a2565e8ee460f1ebe20ca65c910b4 | ORPH
  powerpc    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/cf8793b241ba0cef9ccaad983c01f09ada07fa6a | ORPH
 aarch64_be  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4435b80083cc1f7c5659d9ca8bb6032016466a8f | ORPH
   armeb     |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/3a0abff75023e257f3d6048688485a380b72fbb3 | ORPH
   x86_64    |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/14aafabccfdc7f22e4c05c802871564c22138107 | ORPH
   xtensa    |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/066fd00bca1b8604e27c58021ea984c56e54653d | ORPH
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/fb3d044687344cd87f006f738b189178468c953f |     
    i686     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/ed44e9eb5abb600e626a38c8255d62b635cbce32 |     
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/8d985a41a1253a09f71496b47e5724c3cb936a93 |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/e72b3c50898d36f42b6b53f270529ed8608d7b14 |     
    i686     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/d4b30eae70e2fcb8485658adcde72202f21539ae |     
  riscv64    |         flannel-0.25.5         | NOK | http://autobuild.buildroot.net/results/2ad98ebf4ddc50b0751878ddd90bf87f935dae09 |     
  mips64el   |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/d9da7028b70820930c3c2ff403269dedf2ce051c |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/79aae1c17129abde10d7f5cdf518336b36b678db |     
   sparc     |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/fcc5549db5724123854f583eee05f240b8454c42 |     
   sh4eb     | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/d586ae59cce3aa32208e9e7258f1f4b16916bdd1 |     
  powerpc    |          fwupd-1.9.20          | NOK | http://autobuild.buildroot.net/results/081344ae21bfb408d9ec0fd101a28674200ba50c |     
    i686     |         fwupd-efi-1.6          | NOK | http://autobuild.buildroot.net/results/22560edfda47f8374604c4460c83d4d998e4a62e |     
  aarch64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/01bbe1348c60016ccfd7c26b99536fd4df7c3b21 |     
  mips64el   |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/17727990a82a9ec844eeb581b51a974aeae8037d |     
  sparc64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/b30a8cd24e9d3501de5091d9119c19f373f8711a |     
   s390x     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/86a2d1de6079f2376c94a8c72a2ba213c24bd40b |     
    arc      |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/543ce1392d3081cbf6756d8e6a3620c1468590e5 |     
    m68k     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/de3d6e0856fea858dc95aa0865fb22f4f352f2f1 |     
 aarch64_be  |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/3a6cc4325a4c5c50fc60a681923895c63192f4e0 |     
    mips     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/faf1f415e9e9a3166536e90193c4729dcca10d46 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/dd5ecce873f8c211040eac8c765407219fbd8564 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/e18f042a6445e5d6db49add5a0c7f2f076daaa39 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/52a6a66e886e9f6cfad757cc77d545e7570e0db3 |     
  sparc64    |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.net/results/e509217a60c1625f21fd13af6f224fb05898e2af |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/74ae4183604b2de52d08dc94f22c8aa2e8373bde |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/1445d06923bd420984c3c56cb23484fafe00f652 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/b5167f769a3ef3875c8817488fc4ae1d08152c67 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/c950e8c7ee9ad4d9e650239ec7fa5cd8cd758301 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/47869505e135c180a1c2d746249bbaa0596d6338 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/b6df43408ca4cd469962c96d49d9ac7935b6dbe9 |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/c6ca63cc87c64e1dfe0ad4634f6a48f931a2e07d |     
  mips64el   |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/5487961f3ec729544a8b57a1382c4678aadde2d6 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/320af77df4f5ea96e1d0a6c97368d3694d0905c4 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/222d925fc9a223929173fc50f8c9c5cc9e9c1e3a |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/46a1c76e5622fd376e394dfc33606ed2f9ef9083 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/343f2f8d2b7ce4372c9c33aa69c88c548fa71220 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/bcf1b42cf96c6b602f19af6875ae3f1df71a7b30 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/954008e62ed342589dbf0de9412343aecc815a14 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6844a479e4ae20c7d6fd70633688f387daa8fc16 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f1e01d65285d5f5d27a3aa30d99a1a1df16d9077 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9c43a19575c7a21e91ed45ab16b16b66d596c5c2 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3a1a7490244de244b1221ecfb5b9da4c7655ed79 | ORPH
 powerpc64   |         highway-1.2.0          | NOK | http://autobuild.buildroot.net/results/f4cddec2928540f8b2ae52137f8e0720e66aef57 |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/0b718a670c6eff6aedb44b2b7c13b543161ad7a7 |     
powerpc64le  |     host-gcc-final-14.2.0      | NOK | http://autobuild.buildroot.net/results/f879ac9ee7cea05a50c0f89e920ecef40e46f158 |     
    mips     | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/db7b3e5faa6b1ce994ab04b1266241b0a7672b5d |     
powerpc64le  | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/691f0774d4a1ae2a44a45410407d20376d201979 |     
    arm      | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/700d38614e622954af94571ebba8b92ce7fc0f31 |     
  sparc64    | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/12993ccce828497a9bc37dae02ccab3e81b995be |     
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/91309b7a2aa0be89d646ae2ab6e23e0112b81e40 | ORPH
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/e5cfb35becff51106810b8aec8e49128c2abfa44 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/14be5a84760fe7ed8871632966584a1d65f149c1 | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/4c5a1bd8d4836037dca3dbaea9eb56369be2256d | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/3486cb251ad08f78f63b67c044687e2b1d22867e | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/4ac1d84b80278020a803ae2944181c19ac57de48 | ORPH
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/903215f77e050bb04e60762e3cc3c5e62066a3e5 |     
powerpc64le  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/564428b39988daeaaac88b35b2b131081866d7eb |     
    i686     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/a0c45937b46e88b98a0585cd2bfdf51210b1e044 |     
   mips64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/436c79331feb2c33be81807699b6cceaa49b41d7 |     
  mips64el   |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/8bcc4a6aa73e15ecb4077529527b619bd420325e |     
   mips64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/bcbcd6ee9a14d6c833477bb5db4a5f99807d5552 |     
   mips64    |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/3a8b215d3c5d492f437b727aa853aced62c84dec |     
   armeb     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/8182c3173f983ca21bce551d878a0bdb139eb3a2 |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/b1128b45bbade99961fee7fd43cab3766bc096d3 |     
  riscv64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/5649b9ffac164d42b7eb743bcae8b6f3a5326543 |     
  mips64el   |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/07fc8b5816d659790f5052ebd19a952b1517005d |     
   mips64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/e337f8184e7da21a32ce65cc4d88ed18125e5a0f |     
   mips64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/6b3aa50b28dec7ba9c31e2025cdd068bfa8b2044 |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/84193ddb8f3e29af40be3fe455cd592a6a41757a |     
  aarch64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/9b8029a19fa121d2e61aa0a60eae797336e26fa3 |     
 microblaze  |          ledmon-1.0.0          | NOK | http://autobuild.buildroot.net/results/b780bc003da981d798e95349c9696e3c33ca5b98 |     
 microblaze  |          ledmon-1.0.0          | NOK | http://autobuild.buildroot.net/results/6743797d6e45fac8943cba9c440c373da8331b87 |     
  sparc64    | libdbi-drivers-0bfae6c43134... | NOK | http://autobuild.buildroot.net/results/0789d1f3db46db3547615e5972a6fa560e351f60 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/3accebc6775b9a479876a5898d55bde005d4b12b |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/d277fb2fea0aba0528fbc2994ee11162e02be513 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/0b037c9abf9c01bd55111e0bf30a796e8fdf66f4 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/6605a9b8d8e1c45a4ea0176ea561b17eb95aeb79 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/fb95d9a0f8322a58cd266014f3dea4eaa1b483e5 |     
    arm      |        libgeotiff-1.7.3        | NOK | http://autobuild.buildroot.net/results/a50290b5b085231c1b13833f5acc4fd445f8e211 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/a98dd4b959aa236bcc4d3ecde44397a0b083ee68 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/2364cdc5ebc23c1dca3e7c5e1f3bc6c46b271d19 |     
 aarch64_be  |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/7d629cd5de34e572bea0d98ecb42b16140f6fbb6 |     
powerpc64le  |          libnl-3.9.0           | NOK | http://autobuild.buildroot.net/results/e6fde8ae21b9a660966164ac4c56cd872cd494f1 | ORPH
    arm      |         liboauth-1.0.3         | NOK | http://autobuild.buildroot.net/results/b818a3ae13ad88326f47366d84de239ddc96154f | ORPH
    mips     |       libopenh264-2.4.0        | NOK | http://autobuild.buildroot.net/results/dbcf56c4759375079ea8bd7b95dd081c4a17e0b8 |     
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/4f6e5bd7f68ee30eab7ca8bdb1afebe153ec9b93 | ORPH
   s390x     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/168579874f63bb6fbcda6ef3d735f463ce33dc2f | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/e11a415873d821d08c247edf3c8749cde979e0fe |     
   mipsel    |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/623f99677a682da7140f45d1f5ec792ad1b1a7bd | ORPH
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/9c9521577ba7440cb6439e99bf52791e0ee31c16 |     
    mips     |      libzenoh-pico-0.11.0      | NOK | http://autobuild.buildroot.net/results/c36c77bec65937d05243d2543f65ba9bb31702e4 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/0abf337c3d9a50a0608f52db90d217809965a9cb | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/b3d844eba4e7df6313eaf017ff953175547b5449 | ORPH
    mips     |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/1b48e87f7a0e2f5b5ca513b964ce1f1116e7f7a8 | ORPH
    mips     |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/475c7538667fbf854705e226550a39af05ded4b4 | ORPH
    i686     |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/da895a0e7227ef8c5f7a232bb881530a68a2fd7f | ORPH
    m68k     |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/30972619d9c7df17b431e37706512d8f5f49563b | ORPH
    mips     |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/6d444e7210818e986ec71b2a7c90d81387328421 | ORPH
  mips64el   |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/b9e12cbef41d852e4e1a69cafddbe4850f4a746f | ORPH
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/4aa475f9158ef87955c9d9a71dafd3a121c09adf |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/fbe49539abaed4dc764af983dd82f42705198ce3 |     
   s390x     |        mosquitto-2.0.18        | NOK | http://autobuild.buildroot.net/results/c6fe925a169792c06415ba4948a1e4fbd3cba051 |     
microblazeel |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/bdecf44147e987374536f913d79cd4dda107a923 |     
  powerpc    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/02b52a8597698cc382a86855955753f5451df37b |     
    i686     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/6a5cff615fdb2ca18ac2e77738571ea21b568853 |     
   s390x     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/57fff9bb525aca492febf8e7ced121e5467155db |     
microblazeel |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/40a33583a330456d8e314a3dab8d6f7f1b321c48 |     
    or1k     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/dee79f0163dfdd1bf4574adac377636109a3b637 |     
    or1k     |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/0cd4a5edbdeafd1cb0d34fcd477d7f730ecbd6d9 |     
   sparc     |          nginx-1.26.2          | NOK | http://autobuild.buildroot.net/results/64f91270277e9fe875aab242ef466a7dedc0de28 |     
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/2119303c449b09fecb9413a0e3850028a2dc4d5e | ORPH
  riscv64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/e0386d5024497d39a397cc992c0b0caf63ede11b | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/d41726c641f6b232110c01d0cf811bbcc430545f | ORPH
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/eba48e2bb84e19b95d7a83b9ffb708d6967faa32 | ORPH
    arc      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/22b5c2e29abdf4a8109246efce6e1a350def116e | ORPH
    arc      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/e2c66493bc23ca3ebcdee56c8961544aa29ebbcc | ORPH
microblazeel |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/b3480f13136b50d5aefe4c7639434c18989df5f7 |     
   arceb     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/688785d5208245600069e78f9d231ec24ce87b08 |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/6fc097b4571a2ba7c93db97bf0825f65382aee1b |     
  mips64el   |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/1222d879f6bc96160cd2edfe60d44750a317451b |     
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/ecaa905cb5176d7126fc453532f52a920805316f | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/c85221c9c525d9356daa993dddd917acc6713110 | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/6a18e5a853b5d1e2aa08c987cfa46a641683a332 | ORPH
   s390x     |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/8bf7b34496658298edc3f67958eb25edc1d7ae69 |     
   s390x     |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/ce8ad56f0106362ad72350d1ae5c31c83026855d |     
    arm      |      perl-net-ssleay-1.94      | NOK | http://autobuild.buildroot.net/results/d0be6612b0c5c27c0189acb2900a6129c4c28cd7 |     
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/d805103150786a45cf2c9f743a9a3a5740baff4e | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/ace73bb27e721511b8bbbd36b316f27553cbfb62 | ORPH
  aarch64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/4e38d20e9a952b596d29d4fdf2cf327778f62ad5 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/5484b21475009b31e095fe433e6c708a440aba14 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/9703f445f158d35e2d426b0dab85aaff6ecb8419 | ORPH
    arm      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/9d548a0bda417075c3be9ccb0b929e97e3e8b041 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/696933085b2df2ab3bbbee304b3aeaa0656f9195 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/f40006cb7b2eb994bee0bcc24acaa10fdd17698c | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/856ee19300893f373911c0923e848cf4e8caa795 | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/3d9a4a5957258f0d3f0c12a7f385177ab8e21cde | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/5dd1ba4fa19708b9a5babb207004564c28cbca70 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/c149a238c8afff071165daae8b1768d6fe743e2e | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/0cb560ca2f0883a39e02e7b848f3ab010e402d77 | ORPH
  sparc64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/fd3aae66db584be79dbfea214317842cb7c5094c |     
   mipsel    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/3fda855e1fea5e4a400bb0b8877949992322a656 |     
powerpc64le  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/08ab7491d9fd1b5d9b74935cd0a253a15f680080 |     
    or1k     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/c93e6d2b9495199389864668988d15d9ad641e8e |     
microblazeel |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/3ef6e81f0043ddf30355dc74e3b136dd1caa46a9 |     
  powerpc    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/d587e2e5105e7fdfe4169428435591e318876053 |     
   xtensa    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/416a4532b6f6bf6d75055074e666a666f7d8cfd8 |     
  sparc64    | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/2c91243b440087bbc7d051d65f553f59d05dd207 |     
    arm      |      python-zlmdb-22.6.1       | NOK | http://autobuild.buildroot.net/results/998b73f49892076a97bbc5b1afff533401a5c75e |     
  aarch64    |           qemu-9.0.2           | NOK | http://autobuild.buildroot.net/results/e718a48f929b8ff2f054e74fc8ab95629e4e040b |     
   mipsel    |           qemu-9.0.2           | NOK | http://autobuild.buildroot.net/results/1884a038e5c01fbc8a187a26ab7665cf0510701c |     
powerpc64le  |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/f135f0389f022366a13166ca20d4bcbd74a9149f |     
    or1k     |           ruby-3.3.4           | NOK | http://autobuild.buildroot.net/results/7edf8f8fdaa7988d2763a3169760686218da34f3 |     
   x86_64    |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/85efe72657687fb943816d8314d1e099dd4c82af |     
   x86_64    |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/1cb95076277877c1cade7dc55d02f3d32fc69e95 |     
    arm      |         siproxd-0.8.3          | NOK | http://autobuild.buildroot.net/results/619834a304c6f0a1751796cce5f3a3d455243d05 |     
   mips64    |         siproxd-0.8.3          | NOK | http://autobuild.buildroot.net/results/8c2f777caba585234e08c654d02e71fda67feadf |     
    arc      |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/214b04a2d367465f99dc53d7ad12ff4a2942b572 |     
    arm      |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/0580445568997e1a8659a644a60a06d6ce270fe8 |     
    arc      |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/500acbfc3563b69d0b6ff9d5f60ead226d8c22e9 |     
 aarch64_be  |          swipl-9.2.6           | NOK | http://autobuild.buildroot.net/results/1da9db0942dfbe0f2b7a5eb2bbf5d4f6f3f02faf |     
    mips     |          swipl-9.2.6           | NOK | http://autobuild.buildroot.net/results/95b4bb18e735d91fc2055eb168dd261e9bfccae2 |     
   x86_64    |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/ed0662eb9fc87c3a570a3628705bd8b2b469ca4e |     
  sparc64    |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/810bcbe2a7bf50f84aa590aca18d8fb9762d6040 |     
   x86_64    |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/eef20fe269e36ef0b26bb84a5cd8e1966ce27453 |     
  aarch64    |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/53c1a79c391e3cc7c230017853ba935202c8d20d |     
  riscv64    | uemacs-1cdcf9df881440497501... | NOK | http://autobuild.buildroot.net/results/167358e5dcce23ce5f52e223c4bb0d4f6acab299 | ORPH
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/b56e1420ca71fc8bec5c29466f63cb16d358ff02 |     
 powerpc64   |          wget-1.21.4           | NOK | http://autobuild.buildroot.net/results/6017685f7dc3eb603bc52b988c01993d09a4f980 |     
   mipsel    |         wolfssl-5.7.2          | NOK | http://autobuild.buildroot.net/results/a7fcb15d1e5880866f921d89b56030beeb299b26 |     
  mips64el   |         wolfssl-5.7.2          | NOK | http://autobuild.buildroot.net/results/57ffdaeffcf2e0528585b1de124452744d61ea51 |     
    i686     |            x265-3.5            | NOK | http://autobuild.buildroot.net/results/c1800aac9413a97ca229f40f709732dbec29af76 |     
   nios2     |        xapp_xdm-1.1.14         | NOK | http://autobuild.buildroot.net/results/eaddc0d6db1e591a0021bdc7da9a2fd9771e5ea3 | ORPH
    arm      |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/61052830b3b09155ce7e99e2a0a1ebd90e6bf49d |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 coreutils-9.3 | 1 
google-breakpad-f49c2f1a202... | 1 
          libcamera-apps-1.2.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/e459d5a78b9a60df21910a28c93b94305e731159 | ORPH
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/56fc09f3e2a9308d5dedc6667aef767abab06f09 |     
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/a620204c014c923efb00d0db33e14ab6246eb7ab |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                 coreutils-9.3 | 3 
                  ffmpeg-6.1.1 | 2 
                   bzip2-1.0.8 | 1 
               freeipmi-1.6.14 | 1 
                 libp11-0.4.12 | 1 
                mongodb-4.2.18 | 1 
tftpd-e52af4207a6e09a1ba21f... | 1 
                    volk-3.0.0 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/e53410e8a6af8f44ef16929f2454602ded78f223 | ORPH
 powerpc64   |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/03ec3e43c6ce44a1f003b76f5e5e52fba70670cb | ORPH
  powerpc    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/c26b766c1d678d3737f1f29f6967425a183624a5 | ORPH
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/2bdf8f082ffef8176456683af468b88c8a27798a | ORPH
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/00fed6cdaeb9e4d9de77079c66d924dc2347b0cd |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/8788621324ade682943e117b78704d6c93803ef5 |     
    sh4      |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/729651666288f3fe097b9bfdc21df8b265f9ef7f |     
   x86_64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/1135aefe1fe7c057bc10eef70e5e2172da8ef02d | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/2b6e1bcf1968da417d143706de93e7733181642c |     
    mips     | tftpd-e52af4207a6e09a1ba21f... | NOK | http://autobuild.buildroot.net/results/460836f9ec7adb77eeca947d2ad98b18a4ef68ec | ORPH
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/f93438aa4d6b28fa3711cf34a2f846afe0ac31d4 |     


Classification of failures by reason for next
---------------------------------------------

                     avahi-0.8 | 1 
  binutils-arc-2023.09-release | 1 
                   eza-0.18.22 | 1 
                gerbera-1.12.1 | 1 
            host-binutils-2.42 | 1 
                  libffi-3.4.6 | 1 
              libopenssl-3.3.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               mariadb-10.11.6 | 1 
                    nodejs-src | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/8f63a57ebf75d1e2251c3d6c6411e65040b31cac | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/e07f08cc4d6341444936febc99a07e0c35bd1500 |     
   armeb     |          eza-0.18.22           | NOK | http://autobuild.buildroot.net/results/25f657cc724bb7408eefb7c3519db8035702ad30 |     
  aarch64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/418d25cb1cb9c09510c1d91bf37d52baed8e96dd |     
  aarch64    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/2c58e73639b9997b28e8e04ed2a3a35292f82724 |     
  mips64el   |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/11476398eacce9eac0820815452309c57e4a892e |     
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/b54eccd61970b2c5c2d97ad85e4babcb79947fd8 | ORPH
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/453eca1d6f9447545ec4dc80956364eab2de7aaa | ORPH
    mips     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/51947f83ad607542082ac823b03d4ab65942a0b7 | ORPH
  aarch64    |           nodejs-src           | TIM | http://autobuild.buildroot.net/results/6417f1c10d9cec4e831619abdfeca232b0b1a02d |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
