Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7200C0218F
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 04:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A3B182125;
	Tue,  4 Feb 2025 04:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1RXGfvm1bpft; Tue,  4 Feb 2025 04:14:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3DB78211B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3DB78211B;
	Tue,  4 Feb 2025 04:14:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B500312F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 04:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A35D5413AA
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 04:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ouqicZusXQ8T for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 04:14:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 99D73413A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99D73413A6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99D73413A6
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 04:14:44 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d3e6274015so8802746a12.0
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 20:14:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738642482; x=1739247282;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U+cMWUHGZKPI3NlBn0xdnmMujwolLTikhr53qa7xyyY=;
 b=o/ln6D4yX5BROKzrA/TJJclURbZilWu8RulP43wiDjyMrw/zNRRa5xuSvH1EmgKjuQ
 cNr5eFApD9bxABRuX0ppMyyz1CzulCR5pEeBdQXYjLMFLzxwVbuEU13jTH/v94+MtSt6
 Vvs6Qv31qMz6kgNo+45A+nBMAF/wBZJdPJA5+OJVX7Y17h2bX2K6rEklQ7duZTLBBeX1
 U5uoHbFUqwktg4gFiZ2HEYqzrVlYNlqDe2K93y1+03wY/DTQyW4QeQLvLud3ksBdfdAA
 IZddQ6fcCOQrgMptHetwuAftZMBo/QaD3QsMJr9uPKmytYGO30N2mumf8blIrROfUTD8
 bUFQ==
X-Gm-Message-State: AOJu0YwDp2/NKsi+6Csq2C8aLU8DOatoECr0DOKG5cYKFIAX7nYtOA8y
 7HQ73zd+JqNlWpgdM1UFkQQhHhd95DPM7ZX0V1Q6ZD5hooIsIsWuOF3jlQ==
X-Gm-Gg: ASbGncskiWiOOiUsnhVB9TWRuFEtI0Mj4+12bZhVApWbHX/FI1/dcxN7ixCOFjJYpyy
 h64oO3kDfAE3EcA5UfEdRvvcq6gTIiFyr6eJVCO+j2c0OHRDiKfv6MvJOou5vFF96Jfwm+dpKJD
 mBGbONBuPZChGArbXFLxXLCWPonDduCviqKBfBnsWkpdkKiBzjBbg8HQ1bxMCjFWO87LC6YMYPp
 OckyAEwLI/OjVfcf0fW3KMjUwPtHi/6L+Glbd+M/OZnhhSWKMbLChRtRrW1MqcbjvHfYADgb6gI
 1xbFiUUtgLDvadtt8Js=
X-Google-Smtp-Source: AGHT+IFklO664ymUdBJYTxf6239r7Afq7sTjyhr9MjtOTzbvyZagYF3Mdaw3sUtY7uzlH7kzldX0pQ==
X-Received: by 2002:a05:6402:1ec1:b0:5dc:100c:1567 with SMTP id
 4fb4d7f45d1cf-5dc5efc5e47mr26925582a12.15.1738642482067; 
 Mon, 03 Feb 2025 20:14:42 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc91b65b7csm5375901a12.67.2025.02.03.20.14.41
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 20:14:41 -0800 (PST)
Message-ID: <67a19431.500a0220.270f14.3133@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 04 Feb 2025 04:14:41 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738642482; x=1739247282; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=U+cMWUHGZKPI3NlBn0xdnmMujwolLTikhr53qa7xyyY=;
 b=gVMdWl2O1nqWyHUfjU51j/UXrKVYN/pxfp3nVIacxIpeqaSrxRGWcmW5+EDggSLVTI
 ryIKQNgqozIg3KyZ+nIJN9eOV4HDLkjL7O25xq1EU+DOiAKfK9LXlk4dHzuJX1GALaY+
 QAchFGVKhHcdkvaashNd84nFHYb4mnl4piKX7p4loAwFF3PUz2aZNkvxeWD3pvwXXeEB
 h1d7GmT4KJPQiym0qvYUGEp/D+k01M61e1IEhRyCLEVadZuGwek+m30yW6xXG+VHHcmB
 3FiV+QnynxhPjS16OchcaXwzIB2ZXpQ2EaVrtDIQ43jVyWz5Mgm4M/JjHlHnMk7SLGsx
 y+VQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gVMdWl2O
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-03
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

Autobuild statistics for 2025-02-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  4  |  0  |  6  |
  2024.11.x  |  1  |  3  |  0  |  4  |
    master   | 17  | 135 |  0  | 152 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 6 
                   foot-1.16.2 | 5 
     bandwidthd-2.0.1-auto-r11 | 4 
                    mpir-3.0.0 | 4 
                  ntp-4.2.8p18 | 4 
                   perl-5.40.0 | 4 
               postgresql-17.2 | 4 
           at-spi2-core-2.50.0 | 3 
                    brltty-6.6 | 3 
                  ffmpeg-6.1.2 | 3 
         host-cross-ldd-1.26.0 | 3 
                libdrm-2.4.124 | 3 
                   mimic-1.1.0 | 3 
               valgrind-3.23.0 | 3 
                  assimp-5.3.1 | 2 
                    azmq-1.0.3 | 2 
             bluez5_utils-5.79 | 2 
                 c-ares-1.34.2 | 2 
                elfutils-0.189 | 2 
            gstreamer1-1.22.12 | 2 
   host-mender-artifact-3.11.2 | 2 
    host-python-greenlet-3.1.1 | 2 
              host-rust-1.82.0 | 2 
                 libv4l-1.28.1 | 2 
                  libva-2.22.0 | 2 
           libzenoh-pico-1.1.0 | 2 
                 linux-6.12.11 | 2 
                   linux-tools | 2 
               mariadb-10.11.6 | 2 
                 openssh-9.9p1 | 2 
                   pcre2-10.43 | 2 
               pulseaudio-17.0 | 2 
         python-remi-2022.7.27 | 2 
                       unknown | 2 
                     ace-7.1.1 | 1 
                 agentpp-4.6.1 | 1 
             batman-adv-2024.4 | 1 
                  bcusdk-0.0.5 | 1 
  binutils-arc-2023.09-release | 1 
                  boinc-7.20.2 | 1 
                  boost-1.83.0 | 1 
          cloudflared-2025.1.0 | 1 
             cni-plugins-1.3.0 | 1 
                 coreutils-9.5 | 1 
                   cvs-1.12.13 | 1 
                     daq-2.0.7 | 1 
                 erlang-26.0.2 | 1 
                      fd-9.0.0 | 1 
fs/ext2/ext2.mk:66: /home/a... | 1 
fs/ext2/ext2.mk:66: /home/b... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
                   fwupd-2.0.4 | 1 
            gdk-pixbuf-2.42.12 | 1 
                haproxy-2.6.15 | 1 
host-heimdal-f4faaeaba371ff... | 1 
               host-runc-1.2.4 | 1 
                  jack2-1.9.22 | 1 
           libfreeimage-3.18.0 | 1 
                libglvnd-1.4.0 | 1 
                  libsepol-3.7 | 1 
     linux-5.10.162-cip24-rt10 | 1 
             lirc-tools-0.10.2 | 1 
                  mupdf-1.23.9 | 1 
                   nanocom-1.0 | 1 
            netstat-nat-1.4.10 | 1 
          obsidian-cursors-1.0 | 1 
               openblas-0.3.28 | 1 
               openldap-2.5.18 | 1 
             parsec-tool-0.7.0 | 1 
                 pixman-0.44.2 | 1 
                 pkgconf-2.3.0 | 1 
                    proj-9.5.1 | 1 
            python-evdev-1.8.0 | 1 
                 rtptools-1.22 | 1 
                  snmppp-3.5.1 | 1 
                  usbutils-018 | 1 
             util-linux-2.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/775dc66ebb813891ba24bb3e76668dea1e8d0c69 | ORPH
powerpc64le  |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/964f38eef93fbae070f8777c1d65f953505452f2 |     
   arceb     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/8d28bd0efae7ed8506d6ff0947f9aa5cd93e859f | ORPH
    or1k     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/5e0b66b3937d24db9d649939e8c36b0488a2a587 | ORPH
  riscv32    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/74a97cd38d907a553afe4705f19adfe4ae02050a |     
    mips     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/91a3054af4f7de4fdcee313fdf3205ed52f09079 |     
 microblaze  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/585e38b5fa280bcf04bc7cbcda8cc2af1538afdd |     
  riscv64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/3049b042d8a6b4d7ec6274305157e18f1cfd925f |     
    sh4a     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/1177324bcba0745cf10d8f3bd8cbc9bf7d4d486b |     
  powerpc    |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/c439602e37d234ce01f533e7322b527893ecd3e2 |     
 aarch64_be  |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/988355faf4d78df1940650a4062c7237c08ddf6d |     
   x86_64    |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/1a9eb6a096fa96a5c84dc6bf0a9922405f4761da |     
    i586     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/ad9d802409da41567f07d543ed9a6ccb22c61c70 |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/b659fa43fb2216530b8b9ec09dae06eaeb82d44f |     
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/8593a17de8ed9c634e56f29bd6614ac6f286d7cf |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/ed1ac953a6393cb4ac0ce9c5efebdfd9ede7f3ed |     
   mips64    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/bd2ad24f997a74b871ac960b82115279f20bd3db |     
    mips     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/97c286d2ba281402aef80d7d22521cee5b4dbbf1 |     
  powerpc    |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/045e38dffd11542a0d86dfa256806fa24206957f |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/096f39503d61e90b1e079482574f5f20b6fe647c |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/1e08ded0f6d72201f26389b3650ec72d26703232 |     
  powerpc    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/049bc1342307f2f31bd5007bdd1f54c785ba4932 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/03b0273dc36a01e5459375d9d348751aa5e34ea3 |     
    m68k     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/36e6fd172085bb7765c5245aa6ccd3b3b232a70e | ORPH
   arceb     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/16062d20f61f65202aabd73745ab3762c5e08b27 | ORPH
    arm      |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/6941f9ebbaaf4d294d66d32c06a4cd5237b8a4e8 |     
   s390x     |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/93fce7a86483fbd911ec8596c2ddbd1953609c02 |     
   sh4aeb    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/7e720498817d523e5026a6aab25c6f907e11c438 | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/fbda00b2a10a47994bf517b16524f56bff08a5b1 | ORPH
 aarch64_be  |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/97c506ef5a7b94fd9baa9677441ede7f277963db |     
    or1k     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/5f4bad9906dbc6ca21a899735130991e7291fad5 | ORPH
  mips64el   |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/2a914c3a93cca686434fb18ce13aa5add3ec8464 | ORPH
    i686     |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/09fae4b519d912fa7be190ccd36f37b850264492 |     
 powerpc64   |            fd-9.0.0            | NOK | https://autobuild.buildroot.org/results/312a1bf6504a1f2b22bd8bd8debeccfc21503311 |     
    arm      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/1462a910a4bc048151b2e7758d89f475ac482909 |     
    arm      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/07763db74f81026bfd2b784e36e4ca1caebbe63f |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f287e56f39bbfeaa5a1532716f6475c655a09815 |     
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/ac038c353d68f2168ae1cd03d81acf69bb6fe47c |     
    mips     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/a9d87e4792e1eea07d95f246431ee559f443bb85 |     
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/0e8cd007b82816d566d33f44ce450ce5fa36b6ec |     
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/e0331eb03201b8ddfa320dc81b8d60b6364ff617 |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/55454c6b00497f5c37d8cb8f1413c19b3e6439b0 |     
   mipsel    | fs/ext2/ext2.mk:66: /home/a... | NOK | https://autobuild.buildroot.org/results/cc0c9ed9a5f4a8a7684a5b94d2107e8cf296ffe3 |     
 microblaze  | fs/ext2/ext2.mk:66: /home/b... | NOK | https://autobuild.buildroot.org/results/dc2f8cf266521aff1d018cddc3dc38d8e807ac8b |     
   s390x     | fs/romfs/romfs.mk:32: /home... | NOK | https://autobuild.buildroot.org/results/9b09c8681e1003580b766aa0d244889f3b0be0c8 |     
   mips64    |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/4066894b8c831bc178d40cab75b9dbc608fd124b |     
   sparc     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/2c806ed503e425c6c09e5abad21ad46048796800 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/3e8abef5c7c5c163a3d833db0d5377c30f52e73b | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/d4ea4dc85f9e1e5f15387812b4b048d02bb49499 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/d4ce5e500d7c68497ea881cda820b0859afb015d | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/ac627bbf8cd3899435d60d28fd864fdf98f82e8b | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/1e4c074e0e886e9668f8b881009bb32acb601856 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/a1a53a94a9e84dbac7b775d5f5c5fa1ca59e4fde | ORPH
   x86_64    |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/3fb4313435dc263d94913e9bfab80e0f329278ba | ORPH
   mipsel    |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/16565e32fb943026b1d5edc1faf1935a83835169 | ORPH
   x86_64    |         haproxy-2.6.15         | NOK | https://autobuild.buildroot.org/results/ec8d284d329b169c0502653584c784eb09d53468 |     
    arm      |     host-cross-ldd-1.26.0      | NOK | https://autobuild.buildroot.org/results/ad3d4d1b14f6a9ab84c30e48906dacf8525a1d29 |     
 aarch64_be  |     host-cross-ldd-1.26.0      | NOK | https://autobuild.buildroot.org/results/703cf832a496c4202fb285c64e0122d62fdab591 |     
   sparc     |     host-cross-ldd-1.26.0      | NOK | https://autobuild.buildroot.org/results/bc516b49e37a4e1121fba3e4c02bd6fb36abf197 |     
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/45068404d5d0d6f2c05adff467c9a72eb166e057 | ORPH
  riscv64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/0cf10fcf0b04ad3923468ff09302a025cd287e95 |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/a3a543bc38d9c0ffda156b7dc5fa8733efb11e8a |     
 microblaze  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/22bb4a3c9c75cd7a56d2938ffcf9ee16a1a075f6 |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/998398a43f15cc8dbf99a3083de0cc4cad3ce715 |     
    mips     |        host-runc-1.2.4         | NOK | https://autobuild.buildroot.org/results/3100485c5b0de6137a0f9767d2c2bae5a6fe5bdd |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/28e0b539450d42eecf37875070344ed798d22898 |     
   armeb     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/9ac0342085f876701a334a33c502e67d45d2049b |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/3c1a71aa80c536f45a22f47ca0402875b1335d0c |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/05792fd1b2a56941c08fcdc64a72ebd45cfcdf92 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/1a734b3e363582fe3217eab2ffc80e0f1c10b2da |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/cbdae9da54f82835c9e2b23c7cc0a8ab36af7325 |     
 powerpc64   |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/f9526fb3313c890bf43c8a92a9194f8a9a45e439 |     
   arceb     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/e7dd4ffc7c28874e66637f49e8f1d7cb2ede976b | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/abe86c17d018cf4d85e511e6a6ebb9c976d6c8ec |     
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/bbbb5d29eefafe8e8d7e1610d2ec8ff65d275a1d |     
   sh4eb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/f6caf103557fc66d4d656307503428f11c929685 |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/e66965895cd578e31306f8a02e9e5042e64f77e4 |     
    arc      |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/2f001e2a5ebc8b316dbbdd4d4d41666d1d784855 |     
    arc      |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/81d55c95176394dfa0874672179a800c14037019 |     
 powerpc64   |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/2a8643010f66499ec43553a6cbd1588064b26ae0 |     
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/4f4eb02ec750da24d811d75cdcf136e5ed812d13 | ORPH
   armeb     |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/303f69a9d3109c06e8f1d818d1aa4c3c79e4d1cd | ORPH
   armeb     |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/0ef672cf6cb142f84527b6d04c52517d005e9517 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b7124e0e61f89abdbf98ef59ddc8a0f2b4830018 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/251437bd16ccc8cd30e6d1cbbece1c575ce23fdd | ORPH
   mips64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/9d711e3aa7406fb858e572a9e21ac2413618b21a | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/736316fd1acef56a2af8e6c4469891588094098b | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/111de762eb9e034d869ad8b8cfacceaecb8fc75d | ORPH
   mipsel    |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/3994e07d9faded8abdbfc282008925af4d1fd7d5 |     
  riscv64    |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/ff2952bfd3af84d65f13872c8a56a75fbc726879 |     
    sh4      |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/53e10246d86674ee5b5db7b2d5f255c3598ab0c4 |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/9014cf79cee0217e6f4d0e64b90d20ff9cf28c03 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/fabf776a24dd70863700009991edd5ca85bfbf97 |     
   s390x     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/9950a39f244261d45143b81c6978658571d0aa08 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/8779d9dcf29268856401ffe52e569f6960270db1 |     
 microblaze  |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/1e02539b0ae468ea5b0d980c662ff74e730381e3 |     
  powerpc    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/46f2d6d46cc33be79077d401f67bd55bf9df147b |     
  riscv32    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/5ff0d0d0f4e69550ba81d13b51596761badc16b9 | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/40c21e7562d0e6e74eabd4c3b81337cc56e23884 |     
    or1k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/7f73df3289260e9d5e2c3cb176d06929d80a550f |     
   mipsel    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a9b1fa594e9735b3ef3526da7141b5518c32e4eb |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/fa207e17a3c735d05d375e9aa83093fa48271723 |     
   x86_64    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/87f8685130fbd68769fb6a6ec88622268172971e | ORPH
   mips64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/bdb3509c2720fc89bc0b5ac14d6215042ddf2e47 |     
microblazeel |        openldap-2.5.18         | NOK | https://autobuild.buildroot.org/results/3f45843e5ee6b396e7f6ef10e98d7bf90d21a53b |     
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/7cb67e6942346e87d1ddd17c1b06b81ff9876f70 | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/2b8b2cc973030cc2d1465d66c9f21f9a626e8990 | ORPH
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/d839ddcda0bf7db1fbd5a53e5c0ac5d9d120bc70 |     
    mips     |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/3b212531155ac77cfb10ab8e4e6f317917df3a53 | ORPH
    mips     |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/07d79250fb62b12ab28730efab62a0502158025a | ORPH
    mips     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/db79deeb50cc5cac65240418eabb0deaf003d047 |     
    i686     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/992d02e15cfa6962e5c47a189b538c37ec10b8ed |     
   arceb     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/599b1e1220089b02ec9d89258d69fb2faab8f542 |     
   s390x     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/422569ae0bde00d2299203aa2d65a03552c85775 |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/caebff902edc444b83af63ebb859ce7cecb571df | ORPH
  riscv64    |         pkgconf-2.3.0          | NOK | https://autobuild.buildroot.org/results/3a49c551f4cfe56a3d147686fc5c446908fbad1a | ORPH
    m68k     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/48c08705fb54d3f6f58fd51c136061efa4d9ac43 |     
 microblaze  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/87e46627ca7d3e72b07c54a4b4f631b3eb6c07bb |     
   x86_64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/0888f2ef493342313cd86735396df1451b6b705b |     
   mipsel    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/3a15c90d888273b6066db8aff465fd536c92560f |     
    or1k     |           proj-9.5.1           | NOK | https://autobuild.buildroot.org/results/09eb2e08d08f399286e58ee20bcd56a224985511 |     
    arm      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/6d06b523433e585c0aa8b7d35fbb47424264fcd0 | ORPH
   armeb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/4a97158732142e07fb0beb13595d66db2844a2fa | ORPH
   sh4eb     |       python-evdev-1.8.0       | NOK | https://autobuild.buildroot.org/results/61a3b74e60f2f0f93e312803812ab4d98c492599 |     
   armeb     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/43fdad47b592b6a3f73b868d3d6a57b98a9175ea |     
 powerpc64   |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/86e5b5223483f48bbbb9a2900134c7de78b586e4 |     
   arceb     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/e78e61ed22f7d4bc3a29bf2bd6f953ce59643a32 | ORPH
 microblaze  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/9f3f74eed2606511525648014f97bb3aab09d7e8 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/61c71f55d4de812c99445a16a2373b46b832134d |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/e9fb1aa62323852933d43f67e018ab511109cae1 |     
   arceb     |          usbutils-018          | NOK | https://autobuild.buildroot.org/results/d7dedb754804242d020d1a0d34dd95c7c1074710 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/6080a79ca2bec1791dd5ef272cd02e162210bcfc | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/414b042f2fb65fb51171d1abe51cf47274004107 | ORPH
    mips     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/70ca196bde8c8841f53f1e69683649f45e807b93 | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/b5e81f96a0508774730f496e486e5a644630d03b | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-prelink-cross-a853a5d7... | 1 
        host-python-lxml-5.1.0 | 1 
                   linux-tools | 1 
               pulseaudio-17.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/e62eee6ab2772b8301494cd397211067479c29d9 |     
    i586     |     host-python-lxml-5.1.0     | NOK | https://autobuild.buildroot.org/results/c333f39a8bb30b8b4fe07d4619ef3762c92de991 |     
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/c990ce4cd0da1495e54fb54bf504625c66b9cbbd | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/d321c61c277c4e04df387cb439c66387f125cd06 | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
                  iozone-3.506 | 1 
                       unknown | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/5ab0ef02be49318af5bb0bb646cd6941ce6acf93 |     
   s390x     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/95fb1d3f2e84a94496b07c41c566bb6e0388a80f |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/28a6ae1abccc6e36478802da9431334081517b0a |     


Gitlab CI results for 2025-02-03
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019172277  | ORPH 
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019172620  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019172626  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019172633  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019172636  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019172650  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019172656  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019172675  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019174495  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019174497  | ORPH 
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019172736  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019172955  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019173035  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019172713  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019173212  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019173269  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019173361  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019173456  | ORPH 
       TestPythonPy3Evdev | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019173459  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019173467  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019173658  | ORPH 
...Py3SdbusNetworkmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019173666  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019172425  | ORPH 
             TestTraceCmd | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019173917  | ORPH 
                TestUsbIp | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019173949  | ORPH 
             TestUsbUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019173965  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019173986  | ORPH 
                  TestXen | https://gitlab.com/buildroot.org/buildroot/-/jobs/9019174017  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
